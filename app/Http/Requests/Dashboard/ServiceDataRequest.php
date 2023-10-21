<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceDataRequest extends FormRequest
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

        $id = $this->route('id') ?? $id = $this->route('service'); //or whatever it is named in the route
        $this->merge(['id' => $id]);

        (!$this->hasFile($this->image_en) || is_null($this->image_en))  ?  $this->request->remove('image_en') : $this->merge(['image_en' => $this->image_en]);
        (!$this->hasFile($this->image_ar) || is_null($this->image_ar))  ?  $this->request->remove('image_ar') : $this->merge(['image_ar' => $this->image_ar]);

        $common_validation = $this->getCommonValidation();
        $extra_validation = $this->handleRemainingValidation($id);
        $this->validation = array_merge($common_validation, $extra_validation);
    }


    public function messages()
    {
        return [
            'price.regex' => 'The price must be a positive number with up to two decimal places.',
        ];
    }

    private function getCommonValidation()
    {
        return [
            'service_type_id' => 'required|exists:service_types,id|integer',
            'title_en' => 'required|string|max:60',
            'title_ar' => 'required|string|max:60',
            'short_description_en' => 'required|string|max:255',
            'short_description_ar' => 'required|string|max:255',
            'description_en' => 'nullable|string|max:255',
            'description_ar' => 'nullable|string|max:255',
            'is_active' => 'required|in:0,1',
            'is_price_options' => 'required|in:0,1',

            // FEATURES VALIDATION
            'features' => 'required|array|min:2',
            'features.*.title_en' => 'required|string|max:255',
            'features.*.title_ar' => 'required|string|max:255',
        ];
    }

    private function handleRemainingValidation($id)
    {
        $remaining_validation = [];
        $features_validation = [];
        $price_validation = [];

        if ($id) { // Update Request Extra Validation
            $remaining_validation = [
                'id' => 'required|exists:services,id|integer',
                'image_en' => 'image|max:3072',
                'image_ar' => 'image|max:3072',
                'features.*.id' => 'nullable|integer|exists:features,id,service_id,' . $id,

            ];
            $price_validation = $this->handlePriceOptionsValidation($id, $this->is_price_options);
        } else { // Add Request Extra Validation
            $remaining_validation = [
                'image_en' => 'required|image|max:3072',
                'image_ar' => 'required|image|max:3072',
            ];
            $price_validation = $this->handlePriceOptionsValidation($id, $this->is_price_options);
        }

        return array_merge($remaining_validation, $features_validation, $price_validation);
    }


    private function handlePriceOptionsValidation($id, $is_price_options)
    {

        if ($is_price_options) {
            if ($id) { // Update Request Extra Validation
                return  [
                    // PRICE OPTIONS VALIDATION VALIDATION
                    'price_options' => 'required|array|min:2',
                    'price_options.*.id' => 'nullable|integer|exists:price_options,id',
                    'price_options.*.price'  => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/'],
                    'price_options.*.title_en' => 'required|string|max:255',
                    'price_options.*.title_ar' => 'required|string|max:255',
                ];
            } else { // Add Request Extra Validation
                return [
                    // FEATURES VALIDATION
                    'price_options' => 'required|array|min:2',
                    'price_options.*.price'  => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/'],
                    'price_options.*.title_en' => 'required|string|max:255',
                    'price_options.*.title_ar' => 'required|string|max:255',
                ];
            }
        } else { // single price
            return [
                'price' => ['required', 'numeric', 'regex:/^\d+(\.\d{1,2})?$/'],
            ];
        }
    }
}
