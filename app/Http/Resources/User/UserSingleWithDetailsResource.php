<?php

namespace App\Http\Resources\User;

use App\Http\Resources\User\UserAddressesSingleResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class UserSingleWithDetailsResource extends JsonResource
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
            'name' => $this->name,
            'phone' => $this->phone,
            'image' => is_null($this->image) ? null : url('public' . Storage::url($this->image)),
            'addresses' =>  UserAddressesSingleResource::collection($this->addresses) ?? [],
            'cars' => $this->cars ?? [],
            'payment_methods' => $this->payment_methods ?? [],

        ];
    }
}
