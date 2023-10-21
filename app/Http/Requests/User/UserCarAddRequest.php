<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Str;

class UserCarAddRequest extends FormRequest
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
            'model' => 'required|string|max:60',
            'color' => 'required|string|max:30',
            'plate' => 'required|string|min:2|max:7',

            // 'plate' => 'required|string|min:6|max:7|without_spaces',
            // 'plate' => 'required|size:7|without_spaces'

        ];
    }

    protected function prepareForValidation(): void
    {
        $this->merge(['plate' => Str::replace(' ', '', $this->plate)]);
    }
}
