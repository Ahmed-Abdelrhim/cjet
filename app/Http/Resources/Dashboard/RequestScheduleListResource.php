<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RequestScheduleListResource extends JsonResource
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
            'scheduled_at' => date('d/m/Y', strtotime($this->scheduled_at)),
            'rescheduled_at' => (is_null($this->rescheduled_at)) ? null : date('d/m/Y', strtotime($this->rescheduled_at)),
            'type' => $this->user_purchase_request->purchaseable_type == Service::class ? 'Service' : 'Package',
            'user' => $this->user,
            'user_id' => $this->user->id,
            'user_name' => $this->user->name,
            'user_phone' => $this->user->phone,
            'user_address_title' => $this->user_purchase_request->address->compound->title_en ?? ' ',
            'user_address' => $this->user_purchase_request->address->compound ?? ' ',
            'service_rate' => $this->service_rate,
            'requested_on' => date('d/m/Y', strtotime($this->created_at)),
            'status' =>  $this->status,

            'service_provider_id' => $this->service_provider?->id,
            'service_provider_name' => $this->service_provider?->name,

            'cancelled_at' => (is_null($this->cancelled_at)) ? null : date('d/m/Y', strtotime($this->cancelled_at)),
            'refund_status' => $this->refund_status,
        ];
    }

}
