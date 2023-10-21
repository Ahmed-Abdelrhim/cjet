<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceProviderScheduleSearchBookingIDRequest extends FormRequest
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
            'service_provider_id' => 'required|integer|exists:service_providers,id',
            'status' => 'required|string|in:inprogress,completed',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->merge(['paginate' => 1]);
    }


}
