<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator; 
use Symfony\Component\HttpFoundation\Response;

class UserForgetPasswordRequest extends FormRequest
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
            'phone' => ['required','exists:users,phone','size:11' ,'regex:/^01[0-2|5]{1}[0-9]{8}$/'],
        ];
    }

    public function messages()
    {
        return [
            'phone.regex' => trans('custom.phone_regex_validation'),
            'phone.exists' => trans('custom.phone_exists_validation'),
        ];
    }
}
