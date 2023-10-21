<?php

namespace App\Http\Requests\User;

use App\Models\Package;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserPurchasePackageValidateSelectedDaysAndStartFromRequest extends FormRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        $days_of_week_constant_array = collect(config('days_of_week'))->pluck('constant')->toArray();

        $package = Package::find($this->package_id);
        $package_no_of_days =  $package->no_of_days ?? 0;

        return [
            'package_id' => 'required|integer|exists:packages,id,is_active,1',

            // handle array values are unique

            'selected_days' => 'required|array|size:' . $package_no_of_days,
            'selected_days.*' =>  ['string', 'distinct', Rule::in($days_of_week_constant_array)],

            'start_date' => ['required', 'date', 'after:today', 'before:4 weeks'],
        ];
    }

    public function messages()
    {
        return [
            'start_date.after' => trans('custom.date_after_validation'),
            'start_date.before' => trans('custom.date_before_validation'),
        ];
    }
}
