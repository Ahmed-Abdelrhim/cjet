<?php

namespace App\Http\Resources\User;

use App\Http\Resources\User\PriceOptionResource;
use App\Http\Resources\User\FeatureResource;
use App\Models\PriceOption;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ServiceSingleResource extends JsonResource
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
            'title' => $this->title  ?? null,
            'description' => $this->description  ?? null,
            'image' =>$this->image,
            'price' => $this->price ?? 0,
            'is_price_options' => $this->is_price_options ? true : false,
            'features' => FeatureResource::collection($this->features) ?? [],
            'price_options' => PriceOptionResource::collection($this->price_options) ?? [],   
        ];

        
    }
}
