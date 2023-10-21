<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RequestScheduleRescheduledListResource extends JsonResource
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
            'booking_id' => $this->user_purchase_reference,
            'scheduled_at' => date('d/m/Y', strtotime($this->start_date	)),
            'rescheduled_at' => date('d/m/Y', strtotime($this->rescheduled_at)),
            'type' => $this->purchaseable_type == Service::class ? 'Service' : 'Package',
            'user' => $this->user,
            'user_id' => $this->user->id,
            'user_name' => $this->user->name,
            'user_phone' => $this->user->phone,
            'user_address_title' => $this->address->compound->title_en ?? ' ',
            'user_address' => $this->address->compound ?? ' ',
            'requested_on' => date('d/m/Y', strtotime($this->created_at)),
            'service_provider_name' => $this->service_provider->name,

        ];
    }

}
