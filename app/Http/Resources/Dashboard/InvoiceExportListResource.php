<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InvoiceExportListResource extends JsonResource
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
            'invoice_id' => $this->invoice_reference_number,
            'type' => $this->purchaseable_type == Service::class ? 'Service' : 'Package',
            'user_name' => $this->user->name,
            'user_phone' => $this->user->phone,
            'amount' => $this->amount . ' EGP',
            'request_on' => date('d/m/Y', strtotime($this->created_at)),
            'payment_status' => $this->invoice_type,
        ];
    }


}
