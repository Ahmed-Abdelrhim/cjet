<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Package;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InvoiceSingleWithSummaryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user_purchase_request =  $this->invoice_user_purchase_request[0]->user_purchase_request;
        return [
            'id' => $this->id,

            'type' =>  $user_purchase_request->purchaseable_type == Service::class ? 'Service' : 'Package',

            'invoice_id' => $this->invoice_reference_number,
            'request_on' => date('d/m/Y', strtotime($this->created_at)),
            'invoice_type' => $this->invoice_type,

            // // Customer Information
            'user' => $this->user ?? null,
            'user_address' => $this->handleUserAddress($user_purchase_request->address) ?? null,

            'car' => $user_purchase_request->car ?? null,


            'invoice_summary' =>  $user_purchase_request->purchaseable_type == Service::class ?
                InvoiceServiceListResource::collection($this->invoice_user_purchase_request) : [new InvoicePackageResource($this->invoice_user_purchase_request[0])],
            'invoice_total' => $this->amount . ' EGP',






        ];
    }


    private function handleUserAddress($address)
    {
        return $address?->unit . ' - ' . $address?->street . ' - ' . $address?->compound->title_en   ?? ' ';
        // return $address?->unit . ' - ' . $address?->street . ' - ' . $address?->compound->title_en . ' - ' . $address?->compound->city->title_en ?? ' ';
        return ' ';
    }
}
