<?php

namespace App\Http\Requests\User;

use App\Models\PriceOption;
use App\Models\Service;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserPurchaseServiceValidateDatePriceRequest extends FormRequest
{

    private $service_subtotal_price;
    private $service;
    private $service_price;
    private $service_is_price_options;

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'service_id' => 'required|integer|exists:services,id,is_active,1',

            'price_options_id' => [$this->handlePriceOptionsValidation(), 'array'],
            'price_options_id.*' =>  'integer|exists:price_options,id,service_id,' . $this->service_id,

            'selected_date' => ['required', 'date', 'after:today', 'before:4 weeks'],

            'subtotal_price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/', 'gt:0', Rule::in([$this->service_subtotal_price])],

        ];
    }

    protected function prepareForValidation(): void
    {
        $this->service = Service::find($this->service_id);
        $this->service_price = $this->service->price ?? 0;
        $this->service_is_price_options = $this->service->is_price_options ?? 0;
        $this->service_subtotal_price = $this->calculateServiceSubtotalPrice();
    }

    private function handlePriceOptionsValidation()
    {
        if ($this->service_is_price_options)
            return 'required';
        return 'nullable';
    }

    private function calculateSelectedServicePriceOptions()
    {
        $price_sum = 0;
        if ($this->price_options_id && is_array($this->price_options_id)) {
            foreach ($this->price_options_id as $id) {
                $price_option = PriceOption::find($id);
                $price = $price_option->price ?? 0;
                $price_sum += $price;
            }
        }
        return $price_sum;
    }

    private function calculateServiceSubtotalPrice()
    {
        if ($this->service_is_price_options) {
            return $this->calculateSelectedServicePriceOptions();
        }
        return $this->service_price;
    }

    public function messages()
    {
        return [
            'selected_date.after' => trans('custom.date_after_validation'),
            'selected_date.before' => trans('custom.date_before_validation'),
            'subtotal_price.in' => trans('custom.price_incorrect_validation') . $this->service_subtotal_price,

        ];
    }
}
