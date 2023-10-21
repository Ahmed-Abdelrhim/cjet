<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceProviderScheduleSearchRequest extends FormRequest
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
            'service_provider_id' => 'required|exists:service_providers,id|integer',
            'from' => 'date_format:Y-m-d',
            'to' => 'date_format:Y-m-d',
            'status' => 'required|string|in:inprogress,completed',
            'compound_id' => 'nullable|exists:compounds,id|integer',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->from ?? $this->merge(['from' => '2023-01-01']);
        $this->to ?? $this->merge(['to' => date('Y-m-d', strtotime('+3 months'))]);
        $this->merge(['paginate' => 1]);
    }
}
