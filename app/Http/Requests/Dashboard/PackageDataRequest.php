<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class PackageDataRequest extends FormRequest
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

        $id = $this->route('id') ?? $id = $this->route('package'); //or whatever it is named in the route
        $this->merge(['id' => $id]);

        $common_validation = $this->getCommonValidation();
        $extra_validation = $this->handleRemainingValidation($id);
        $this->validation = array_merge($common_validation, $extra_validation);
    }


    private function getCommonValidation()
    {
        return [
            'title_en' => 'required|string|max:60',
            'title_ar' => 'required|string|max:60',
            'description_en' => 'required|string|max:255',
            'description_ar' => 'required|string|max:255',
            'price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/'],
            'no_of_days' => 'required|integer|min:1|max:7',
            'is_active' => 'required|in:0,1',


            // LIST OF FEATURES VALIDATION
            'features' => 'required|array|min:2',
            'features.*.title_en' => 'required|string|max:255',
            'features.*.title_ar' => 'required|string|max:255',


        ];
    }




    private function handleRemainingValidation($id)
    {
        $remaining_validation = [];
        $features_validation = [];

        if ($id) { // Update Request Extra Validation
            $remaining_validation = [
                'id' => 'required|exists:packages,id|integer',
                'features.*.id' => 'nullable|integer|exists:features,id,package_id,' . $id,
            ];
        }
        return array_merge($remaining_validation, $features_validation);
    }


    public function messages()
    {
        return [
            'price.regex' => 'The price must be a positive number with up to two decimal places.',
        ];
    }
}
