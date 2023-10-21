<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceTypeActiveRequest extends FormRequest
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
            'id' => 'required|exists:service_types,id|integer',
            'is_active' => 'required|in:0,1',
        ];
    }

    protected function prepareForValidation(): void
    {
        $id = $this->route('id') ?? $id = $this->route('service_type'); //or whatever it is named in the route
        $this->merge(['id' => $id]);
    }
}
