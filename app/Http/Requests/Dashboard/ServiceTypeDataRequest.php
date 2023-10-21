<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class ServiceTypeDataRequest extends FormRequest
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
        $id = $this->route('id') ?? $id = $this->route('service_type'); //or whatever it is named in the route
        $this->merge(['id' => $id]);

        (!$this->hasFile($this->image_en) || is_null($this->image_en))  ?  $this->request->remove('image_en') : $this->merge(['image_en' => $this->image_en]);
        (!$this->hasFile($this->image_ar) || is_null($this->image_ar))  ?  $this->request->remove('image_ar') : $this->merge(['image_ar' => $this->image_ar]);

        $common_validation = $this->getCommonValidation();
        $extra_validation = $this->handleRemainingValidation($id);
        $this->validation = array_merge($common_validation, $extra_validation);
    }


    private function getCommonValidation()
    {
        return [
            'title_en' => 'required|string|max:255',
            'title_ar' => 'required|string|max:255',
            'is_active' => 'required|in:0,1',
        ];
    }

    private function handleRemainingValidation($id)
    {
        if ($id) { // Update Request Extra Validation
            return  [
                'id' => 'required|exists:service_types,id|integer',
                'image_en' => 'image|max:512',
                'image_ar' => 'image|max:512',
            ];
        } else {
            return [
                'image_en' => 'required|image|max:512',
                'image_ar' => 'required|image|max:512',
            ];
        }
    }
}
