<?php

namespace App\Http\Resources\Dashboard;

use App\Http\Resources\User\UserAddressesSingleResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserSingleResource extends JsonResource
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
            'email' => $this->email,
            'phone' => $this->phone,
            'is_phone_verified' => is_null($this->phone_verified_at) ? 0 : 1 ,
            'image' => $this->image,
            'is_sms_offers' => $this->is_sms_offers,
            'last_activity_at' => is_null($this->last_activity_at) ? null : date('d/m/Y', strtotime($this->last_activity_at)),
            'registration_types' => $this->handleRegistrationTypes(),
            'created_at' => date('d/m/Y', strtotime($this->created_at)) ,
            'addresses' =>  UserAddressesSingleResource::collection($this->addresses) ?? [],
            'cars' => $this->cars ?? [],
        ];

    }

    private function handleRegistrationTypes()
    {
        $registration_types_array = [];
        is_null($this->password) ? null : array_push($registration_types_array,'normal');
        is_null($this->apple_social_id) ? null : array_push($registration_types_array,'apple');
        is_null($this->google_social_id) ? null : array_push($registration_types_array,'google');
        is_null($this->facebook_social_id) ? null : array_push($registration_types_array,'facebook');
        return $registration_types_array;
    }
}
