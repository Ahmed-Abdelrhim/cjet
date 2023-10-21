<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class UserSocialRegisterLoginRequest extends FormRequest
{
    private $validation;

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
        return $this->validation;
    }

    protected function prepareForValidation(): void
    {
        $extra_validation = [];

        $common_validation = [
            'name' => 'required|string|max:255',
            'account_type' => 'required|in:facebook,google,apple',
            'social_id' => 'required|string|max:255',
            'security_code' => 'required|string|in:QDLzvcoZ8ZIBJbU7JUySgHoCnj6MOX7h',
        ];
        $this->merge(['email' => $this->email, 'phone' => $this->phone]);

        if (is_null($this->email) && is_null($this->phone)) {
            $extra_validation = [
                'email' => 'nullable|email|max:255',
                'phone' => 'required|string|max:20',
                // 'phone' => ['required','size:11','regex:/^01[0-2|5]{1}[0-9]{8}$/'],

            ];
        } else {
            $extra_validation = [
                'email' => 'nullable|email|max:255',
                'phone' => 'nullable|string|max:20',
                // 'phone' => ['nullable','size:11','regex:/^01[0-2|5]{1}[0-9]{8}$/'],

            ];
        }
        $this->validation = array_merge($common_validation, $extra_validation);
    }


    // public function messages()
    // {
    //     return [
    //         'phone.regex' => trans('custom.phone_regex_validation'),
    //     ];
    // }
}
