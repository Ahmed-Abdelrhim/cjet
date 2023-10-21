<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class UserRegisterRequest extends FormRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
       return [
            'name' => 'required|string|min:2|max:100|regex:/^[^0-9]*$/',
            'phone' => ['required','unique:users,phone','size:11' ,'regex:/^01[0-2|5]{1}[0-9]{8}$/'],
            'password' => [
                'required',
                'string',
                'max:60',
                Password::min(8)
                    ->mixedCase()
                    ->numbers()
                    ->symbols(),
                //->uncompromised(),
            ],
        ];
    }

    public function messages()
    {
        return [
            'name.regex' => trans('custom.name_regex_validation'),
            'phone.regex' => trans('custom.phone_regex_validation'),
            'phone.unique' => trans('custom.phone_unique_validation'),
        ];
    }


}
