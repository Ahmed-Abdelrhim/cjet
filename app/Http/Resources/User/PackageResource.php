<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PackageResource extends JsonResource
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
            'description' => $this->description ?? ' ',
            'price' => $this->price ?? 0,
            'price_string' => $this->price_string ?? ' ',
        ];

    }
}
