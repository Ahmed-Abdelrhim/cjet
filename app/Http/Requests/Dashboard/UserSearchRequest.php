<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class UserSearchRequest extends FormRequest
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
            'from' => 'date_format:Y-m-d',
            'to' => 'date_format:Y-m-d',
            'sort' => 'nullable|string|in:alphabetical,newest,oldest',
            'filter' => 'nullable|string|in:facebook,google,apple,normal',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->from ?? $this->merge(['from' => '2023-01-01']);
        $this->to ?? $this->merge(['to' => date('Y-m-d', strtotime('+3 months'))]);
        $this->merge(['paginate' => 1]);

    }
}
