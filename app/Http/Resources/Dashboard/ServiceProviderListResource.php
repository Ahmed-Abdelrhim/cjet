<?php

namespace App\Http\Resources\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ServiceProviderListResource extends JsonResource
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
            'name' => $this->name  ?? ' ',
            'phone' => $this->phone  ?? ' ',
            'rating' => $this->rating  ?? 0,
            'is_active' => $this->is_active  ?? 0,
            'is_available' => $this->is_available  ?? 0,
            'compounds' => CompoundListResource::collection($this->compounds) ?? [],
        ];
    }
}
