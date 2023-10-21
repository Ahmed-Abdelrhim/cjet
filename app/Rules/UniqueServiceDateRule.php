<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class UniqueServiceDateRule implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        $cart_array = [];

        foreach ($value as $service) {
            $service_id = $service['service_id'];
            $selected_date = $service['selected_date'];

            $key = $service_id . '-' . $selected_date;

            if (in_array($key, $cart_array)) {
                $fail(trans('custom.service_date_duplicate_cart_validation'));
            }

            $cart_array[] = $key;
        }
    }
}
