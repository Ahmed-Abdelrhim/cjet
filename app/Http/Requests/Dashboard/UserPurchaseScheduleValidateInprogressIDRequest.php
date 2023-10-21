<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class UserPurchaseScheduleValidateInprogressIDRequest extends FormRequest
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
            'id' => 'required|integer|exists:user_purchase_schedules,id,status,inprogress',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->merge(['id' =>$this->route('id')]);
    }
}
