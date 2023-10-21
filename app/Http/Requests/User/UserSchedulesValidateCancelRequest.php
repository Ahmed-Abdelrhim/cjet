<?php

namespace App\Http\Requests\User;

use App\Models\UserPurchaseSchedule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserSchedulesValidateCancelRequest extends FormRequest
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
            'id' => ['required','integer','exists:user_purchase_schedules,id,user_id,' . auth('sanctum')->id()],
            'status' => [Rule::in(['pending', 'inprogress'])]
    
        ];

        
    }

    protected function prepareForValidation(): void
    {
        $id = $this->route('id') ?? $id = $this->route('reschedule'); //or whatever it is named in the route
        $this->merge(['id' => $id]);

        $userPurchaseSchedule = UserPurchaseSchedule::find($id);
        $this->merge(['status' => $userPurchaseSchedule->status ?? 'cancelled' ]);

    }
}
