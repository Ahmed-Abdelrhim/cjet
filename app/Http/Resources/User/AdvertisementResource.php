<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class AdvertisementResource extends JsonResource
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
            'image' => $this->image,
            'type' => $this->type ?? '',
            'advertiseable_id' => $this->advertiseable_id ?? 0,
        ];    
    }
}
