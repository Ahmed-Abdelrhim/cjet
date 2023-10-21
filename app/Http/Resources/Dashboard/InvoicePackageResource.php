<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InvoicePackageResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        // title: Basic Package: 
        // price 175.00 EGP / Month
        // Service Type: Package
        // Booking ID: #CWP-9436244
        // Recurrence: Sun, Tues, Thurs.
        // Duration: 1 Month Only

        return [
            'id' => $this->id,
            'title' => $this->getPurchaseTitle($this->user_purchase_request->purchaseable) ?? null,
            'price' => $this->user_purchase_request->price . ' EGP / Month',
            'price_number' => $this->user_purchase_request->price,
            'service_type' => 'Package',
            'booking_id' => $this->user_purchase_request->user_purchase_reference,
            'recurrence' => $this->user_purchase_request->selected_days ?? ' ',
            'duration' => '1 Month Only',
            'start_date' => $this->user_purchase_request->start_date,
            'end_date' => $this->user_purchase_request->end_date,

        ];
    }
    
    private function getPurchaseTitle($purchaseable)
    {
        return $purchaseable->title_en ?? ' ';
    }
}
