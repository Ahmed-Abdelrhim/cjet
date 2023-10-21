<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Str;

class UserPaymentMethodSingleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        return [
            'id' => $this->id,
            // 'card_number' => $this->card_number, // MASK FIRST DIGITS
            // 'card_number' => Str::mask($this->card_number,'*',0,-4), // MASK FIRST DIGITS
            'card_number' => '**** **** **** ' . Str::substr($this->card_number, 15, 20), // MASK FIRST DIGITS
            'expiry_month' => $this->expiry_month,
            'expiry_year' => $this->expiry_year,
            'card_type' => $this->card_type,
            'is_default' => $this->is_default,
        ];
    }
}
