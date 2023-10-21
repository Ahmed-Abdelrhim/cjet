<?php

namespace App\Http\Resources\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserExportListResource extends JsonResource
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
            'is_phone_verified' => is_null($this->phone_verified_at) ? 'No' : 'Yes' ,
            'is_sms_offers' => $this->is_sms_offers ? 'Yes' : 'No',
            'last_activity_at' => is_null($this->last_activity_at) ? null : date('d/m/Y', strtotime($this->last_activity_at)),
            'registration_types' =>  implode(', ', $this->handleRegistrationTypes()),
            'created_at' => date('d/m/Y', strtotime($this->created_at)) ,

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
