<?php

namespace App\Http\Requests\User;

use App\Models\Package;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserPurchasePackageValidateRequestBackup extends FormRequest
{

    private $package_price;
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
        $user_id = auth('sanctum')->id();
        $days_of_week_constant_array = collect(config('days_of_week'))->pluck('constant')->toArray();

        $package = Package::find($this->package_id);
        $package_no_of_days =  $package->no_of_days ?? 0;
        $this->package_price =  $package->price ?? 0;

        return [
            'package_id' => 'required|integer|exists:packages,id,is_active,1',

            'selected_days' => 'required|array|size:' . $package_no_of_days,
            'selected_days.*' =>  ['string', Rule::in($days_of_week_constant_array)],

            'is_renewable' => 'required|in:0,1',

            'user_car_id' => 'required|integer|exists:user_cars,id,user_id,' . $user_id,
            'user_address_id' => 'required|integer|exists:user_addresses,id,user_id,' . $user_id,
            'user_payment_method_id' => 'required|integer|exists:user_payment_methods,id,user_id,' . $user_id,

            'price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/', 'gt:0', Rule::in([$this->package_price])],

            'start_date' => ['required', 'date', 'after:today', 'before:4 weeks'],
        ];
    }

    public function messages()
    {
        return [
            'price.regex' => 'The price must be a positive number with up to two decimal places.',
            'price.in' => trans('custom.price_incorrect_validation') . $this->package_price,
            'start_date.after' => trans('custom.date_after_validation'),
            'start_date.before' => trans('custom.date_before_validation'),
        ];
    }
}
