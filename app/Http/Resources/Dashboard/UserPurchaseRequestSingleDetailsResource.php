<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Package;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserPurchaseRequestSingleDetailsResource extends JsonResource
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
            'status' =>  $this->status == 'pending' ? 'new request' : $this->status,

            'booking_id' => $this->user_purchase_reference,
            'scheduled_at' => date('d/m/Y', strtotime($this->scheduled_at)),
            'service_provider' => $this->service_provider ?? null,
            'assigned_at' => date('d/m/Y', strtotime($this->assigned_at)),
            'type' => $this->purchaseable_type == Service::class ? 'Service' : 'Package',

            // Service Requested
            'purchaseable_title' => $this->getPurchaseTitle($this->purchaseable, $this->purchaseable_type) ?? null,
            'price' => $this->purchaseable_type == Service::class ?  $this->price . ' EGP' : $this->price . ' EGP / Month',
            'service_type' => $this->getServiceType($this->purchaseable_type),
            'requested_on' => date('d/m/Y', strtotime($this->created_at)),
            'payment_status' => 'Paid',


            // Customer Information
            'user' => $this->user ?? null,
            'user_address' => $this->handleUserAddress($this->address) ?? null,
            'car' => $this->car ?? null,

            // Booking List
            'booking_list' => ($this->purchaseable_type == Package::class)  ? UserPurchaseRequestScheduleListMinimumResource::collection($this->user_purchase_schedules) : null,


        ];
    }

    private function getServiceType($purchaseable_type)
    {
        if (($purchaseable_type == Service::class)) {
            $service = Service::where('id', $this->purchaseable_id)->with('service_type')->first() ?? ' ';
            return   $service->service_type->title_en ?? ' ';
        } else {
            return  $this->selected_days;
        }
    }

    private function handleServicePriceOptions($price_options)
    {

        $title = '';

        foreach ($price_options as $price_option) {
            $title .= $price_option->title_en . ' - ';
        }
        // remove last - from string
        return  substr($title, 0, -2) ?? ' ';
    }

    private function getPurchaseTitle($purchaseable, $purchaseable_type)
    {
        $purchaseable_title = ' ';
        if (($purchaseable_type == Service::class)) {
            $purchaseable->is_price_options ?
                $purchaseable_title = $purchaseable->title_en . ' - ' . $this->handleServicePriceOptions($purchaseable->price_options) ?? ' '
                :
                $purchaseable_title = $purchaseable->title_en ?? ' ';
        } else {
            return   $purchaseable_title = $purchaseable->title_en ?? ' ';
        }

        return $purchaseable_title;
    }

    private function handleUserAddress($address)
    {
        return $address?->unit . ' - ' . $address?->street . ' - ' . $address?->compound->title_en . ' - ' . $address?->compound->city->title_en ?? ' ';
        return ' ';
    }
}
