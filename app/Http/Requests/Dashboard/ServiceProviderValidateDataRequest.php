<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceProviderValidateDataRequest extends FormRequest
{
    private $validation;

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
        return $this->validation;
    }

    protected function prepareForValidation(): void
    {
        $id = null;
        $extra_validation = [];

        $id = $this->route('id') ?? $id = $this->route('service_provider'); //or whatever it is named in the route
        $this->merge(['id' => $id]);

        (!$this->hasFile($this->national_id_image) || is_null($this->national_id_image))  ?  $this->request->remove('national_id_image') : $this->merge(['national_id_image' => $this->national_id_image]);

        $common_validation = $this->getCommonValidation();
        $extra_validation = $this->handleRemainingValidation($id);
        $this->validation = array_merge($common_validation, $extra_validation);
    }


    private function getCommonValidation()
    {

        return [
            'name' => 'required|regex:/^[a-zA-Z\s]*$/|max:60|min:3',
            'address' => 'required|string|max:150',
            'phone' => ['required','size:11','regex:/^01[0-2|5]{1}[0-9]{8}$/'],
            'image' => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
            // 'national_id' => 'required|alpha_num|max:255',
            'national_id' => 'required|regex:/^[0-9a-zA-Z\s]*$/|max:60',

            // // LIST OF COMPOUNDS ID VALIDATION VALIDATION
            'compounds' => 'required|array',
            'compounds.*' => 'required|integer|exists:compounds,id,is_active,1',
        ];
    }




    private function handleRemainingValidation($id)
    {
        $remaining_validation = [];
        $features_validation = [];

        if ($id) { // Update Request Extra Validation
            $remaining_validation = [
                'id' => 'required|exists:service_providers,id|integer',
                'national_id_image' => 'file|mimes:jpeg,png,jpg,pdf|max:12288',

            ];
        } else {
            $remaining_validation = [
                'national_id_image' => 'required|file|mimes:jpeg,png,jpg,pdf|max:12288',

            ];
        }
        return array_merge($remaining_validation, $features_validation);
    }


    public function messages()
    {
        return [
            'name.regex' => 'Name should be in english letters only.',
            'national_id.regex' => 'National ID / Passport should be numbers and english letters only.',
            'phone.regex' => 'Phone should be an Egypt mobile number',

        ];
    }
}
