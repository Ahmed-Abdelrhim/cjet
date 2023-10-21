<?php

namespace App\Http\Requests\User;

use App\Models\PriceOption;
use App\Models\Service;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserPurchaseServiceValidateRequestBackup extends FormRequest
{

    private $services_array;
    private $service_subtotal_price;
    private $services_total_price;
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
            'services' => 'required|array',
            'services.*.service_id' => 'required|integer|exists:services,id,is_active,1',
            'services.*.price_options_id' => [$this->handlePriceOptionsValidation(), 'array'],
            'services.*.price_options_id.*' =>  'integer|exists:price_options,id',
            // 'services.*.price_options_id.*' =>  'integer|exists:price_options,id,service_id,' . $this->service_id,
            'services.*.selected_date' => ['required', 'date', 'after:today', 'before:4 weeks'],
            'services.*.subtotal_price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/', 'gt:0'],
            // 'services.*.subtotal_price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/', 'gt:0', Rule::in([$this->service_subtotal_price])],


            'user_car_id' => 'required|integer|exists:user_cars,id,user_id,' . auth('sanctum')->id(),
            'user_address_id' => 'required|integer|exists:user_addresses,id,user_id,' . auth('sanctum')->id(),
            'user_payment_method_id' => 'required|integer|exists:user_payment_methods,id,user_id,' . auth('sanctum')->id(),
            'total_price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/', Rule::in([$this->services_total_price])],

        ];
    }

    protected function prepareForValidation(): void
    {
        $this->services_array = [];
        foreach ($this->services as $service) {
            $service_data =  Service::find($service['service_id']);
            $data = [];
            // $data['service'] =  $service_data;
            $data['service_price'] =   $service_data->price ?? 0;
            $data['service_is_price_options'] =  $service_data->is_price_options ?? null;
            $data['price_options_id'] = $service['price_options_id'] ?? 0;

            $data['service_subtotal_price'] = $this->calculateServiceSubtotalPrice(
                $data['service_is_price_options'],
                $data['price_options_id'],
                $data['service_price']
            );
            array_push( $this->services_array ,$data);
        }
        $this->services_total_price = $this->calculateServicesTotalPrice();
    }

    private function handlePriceOptionsValidation()
    {
        if ($this->service_is_price_options)
            return 'required';
        return 'nullable';
    }

    private function calculateSelectedServicePriceOptions($price_options_array_ids)
    {
        $price_sum = 0;
        if ($price_options_array_ids && is_array($price_options_array_ids)) {
            foreach ($price_options_array_ids as $id) {
                $price_option = PriceOption::find($id);
                $price = $price_option->price ?? 0;
                $price_sum += $price;
            }
        }
        return $price_sum;
    }

    private function calculateServiceSubtotalPrice($is_price_options, $price_options_array_ids, $service_price)
    {
        if ($is_price_options) {
            return $this->calculateSelectedServicePriceOptions($price_options_array_ids);
        }
        return $service_price;
    }

    private function calculateServicesTotalPrice()
    {
        $total_sum = 0;
        foreach ($this->services_array as $service) {
            $total_sum += $service['service_subtotal_price'];
        }

        return $total_sum;
    }

    public function messages()
    {
        return [
            'selected_date.after' => trans('custom.date_after_validation'),
            'selected_date.before' => trans('custom.date_before_validation'),
            'subtotal_price.in' => trans('custom.price_incorrect_validation') . $this->service_subtotal_price,
            'total_price.in' => trans('custom.price_incorrect_validation') . $this->services_total_price,

        ];
    }
}
