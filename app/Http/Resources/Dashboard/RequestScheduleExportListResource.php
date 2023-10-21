<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RequestScheduleExportListResource extends JsonResource
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
            'type' => $this->user_purchase_request->purchaseable_type == Service::class ? 'Service' : 'Package',
            'user_name' => $this->user->name,
            'user_phone' => $this->user->phone,
            'user_address_title' => $this->user_purchase_request->address->compound->title_en ?? ' ',
            'requested_on' => date('d/m/Y', strtotime($this->created_at)),
            // 'status' =>  $this->status,


        ];
    }

}
