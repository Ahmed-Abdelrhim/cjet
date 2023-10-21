<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class RequestScheduleSearchBookingIDRequest extends FormRequest
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
            'booking_id' => 'required|string|max:255',
            'status' => 'required|string|in:pending,rescheduled,inprogress,completed,cancelled',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->merge(['paginate' => 1]);
    }


}
