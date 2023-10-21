<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class AdminUpdateProfileRequest extends FormRequest
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
            'name' => 'required|string|max:255',
            'image' => 'image|max:3072',
        ];
    }

    protected function prepareForValidation(): void
    {
        (!$this->hasFile($this->image) || is_null($this->image))  ?  $this->request->remove('image') : $this->merge(['image' => $this->image]);
    }
}
