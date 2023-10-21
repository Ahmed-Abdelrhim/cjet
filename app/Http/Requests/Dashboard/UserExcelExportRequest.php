<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class UserExcelExportRequest extends FormRequest
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
            'ids.*' => 'numeric|exists:users,id',

            'from' => 'nullable|date_format:Y-m-d',
            'to' => 'nullable|date_format:Y-m-d',
            'sort' => 'nullable|string|in:alphabetical,newest,oldest',
            'filter' => 'nullable|string|in:facebook,google,apple,normal',
        ];
    }
}
