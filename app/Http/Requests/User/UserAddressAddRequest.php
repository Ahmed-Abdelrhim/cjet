<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class UserAddressAddRequest extends FormRequest
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
            'city_id' => 'required|exists:cities,id|integer',
            'compound_id' => 'required|integer|exists:compounds,id,city_id,' . $this->city_id,
            'street' => 'nullable|string|max:60',
            'unit' => 'required|string|max:60',
            'is_default' => 'required|in:0,1',
        ];
    }
}
