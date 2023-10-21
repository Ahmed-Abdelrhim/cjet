<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserAddressesSingleResource extends JsonResource
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
            'street' => $this->street  ?? null,
            'unit' => $this->unit  ?? ' ',
            'is_default' => $this->is_default  ?? ' ',
            'city_title' => $this->city->title ?? ' ',
            'compound_title' => $this->compound->title ?? ' ',
            // 'city' => new CitySingleResource($this->city) ?? '',
            // 'compound' => new CompoundSingleResource($this->compound) ?? '',
        ];
    }
}
