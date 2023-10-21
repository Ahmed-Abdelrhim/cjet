<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceProviderExcelExportRequest extends FormRequest
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
            'ids' => 'nullable|array',
            'ids.*' => 'numeric|exists:service_providers,id',
            'filter' => 'nullable|string|in:available_providers,unavailable_providers,active_providers,inactive_providers',
            'sort' => 'nullable|string|in:newest,oldest,high_rating,low_rating',
        ];
    }

}
