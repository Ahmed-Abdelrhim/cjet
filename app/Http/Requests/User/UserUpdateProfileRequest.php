<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Symfony\Component\HttpFoundation\Response;

class UserUpdateProfileRequest extends FormRequest
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
            'name' => 'required|string|min:2|max:100|regex:/^[^0-9]*$/',
            'phone' => ['required', 'size:11', 'regex:/^01[0-2|5]{1}[0-9]{8}$/','unique:users,phone,' . auth()->user()->id,],
            'email' => 'nullable|email|max:255',
            'image' => 'nullable|image|max:12288',
            // 'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:12288',
        ];
    }

    protected function prepareForValidation(): void
    {
        (!$this->hasFile($this->image) || is_null($this->image))  ?  $this->request->remove('image') : $this->merge(['image' => $this->image]);
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
