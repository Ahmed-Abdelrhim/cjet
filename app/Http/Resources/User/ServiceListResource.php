<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ServiceListResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id ?? 0,
            'title' => $this->title  ?? ' ',
            'short_description' => $this->short_description  ?? ' ',
            'price_string' => $this->price_string ?? ' ',
            'type' => 'services',

        ];
    }

   
}
