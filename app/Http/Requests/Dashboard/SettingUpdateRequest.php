<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class SettingUpdateRequest extends FormRequest
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

        $data = $this->all();

        $rule = [];
        foreach ($data as $key => $value) {
            if (!$this->hasFile($key)) {
                $rule[$key] = 'nullable|string|max:500';
            } else {
                $rule[$key] = 'file|max:3072';
            }
        }
        return $rule;
    }
}
