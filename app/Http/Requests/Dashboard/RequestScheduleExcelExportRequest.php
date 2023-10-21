<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class RequestScheduleExcelExportRequest extends FormRequest
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
            'ids.*' => $this->handleIDArrayValidation(),

            'from' => 'nullable|date_format:Y-m-d',
            'to' => 'nullable|date_format:Y-m-d',
            'filter' => 'nullable|string|in:service,package',
            'sort' =>  'nullable|string|in:old_request,new_request,old_schedule,new_schedule',
            'status' => 'required|string|in:pending,rescheduled,inprogress,completed,cancelled',
        ];
    }

    private function handleIDArrayValidation()
    {
        if ($this->status == 'pending') {
            return 'numeric|exists:user_purchase_requests,id,status,pending';
        } else {
            return 'numeric|exists:user_purchase_schedules,id,status,' . $this->status;
        }
    }
}
