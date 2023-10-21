<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class NotificationSettingsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
 {
        return [
            "promotional_notification"=>['required','boolean'],
            "promotional_sms"=>['required','boolean'],
        
        ];
    }
}