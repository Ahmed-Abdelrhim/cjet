<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class CompoundValidateDataRequest extends FormRequest
{
    private $validation = [];

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
     * @return array
     */
    public function rules()
    {
        return $this->validation;
    }


    protected function prepareForValidation(): void
    {
        $id = null;
        $extra_validation = [];
        $common_validation = [
            'title_en' => 'required|string|max:60',
            'title_ar' => 'required|string|max:60',

        ];


        $id = $this->route('id') ?? $id = $this->route('compound'); //or whatever it is named in the route
        $this->merge(['id' => $id]);

        if ($id) { //update
            $extra_validation = [
                'id' => 'required|exists:compounds,id|numeric',
            ];
        } else { // add
            $extra_validation = [
                'city_id' => 'required|exists:cities,id|numeric',
            ];
        }

        $this->validation = array_merge($common_validation, $extra_validation);
    }
}
