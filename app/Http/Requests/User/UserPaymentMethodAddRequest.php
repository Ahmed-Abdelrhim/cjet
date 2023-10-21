<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class UserPaymentMethodAddRequest extends FormRequest
{
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
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'card_number' => 'required|min:16|max:20|regex:/^[0-9\s]+$/|starts_with:2,4,5',
            'card_holder_name' => 'required|regex:/^[a-zA-Z\s]*$/|max:255|min:3',
            'cvv' => 'required|integer|digits:3',
            'is_default' => 'required|in:0,1',
            'expiry_month' => 'required|date_format:m|between:01,12',
            'expiry_year' => 'required|date_format:y|after_or_equal:' . date('y'),
        ];
    }


    public function messages()
    {
        return [
            // 'card_holder_name.regex' => trans('custom.card_holder_name_regex_validation'),
        ];
    }
}
