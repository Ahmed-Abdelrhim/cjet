<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ReassignUserPurchaseScheduleValidateRequest extends FormRequest
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
            'ids' => 'required|array',
            'ids.*' => 'required|integer|exists:user_purchase_schedules,id,status,inprogress',
            'service_provider_id' => 'required|exists:service_providers,id,is_active,1,is_available,1|integer',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->merge(['id' =>$this->route('id')]);
    }
}
