<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InvoiceServiceListResource extends JsonResource
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
            'title' => $this->getPurchaseTitle($this->user_purchase_request->purchaseable) ?? null,
            'price' => $this->user_purchase_request->price . ' EGP',
            'price_number' => $this->user_purchase_request->price ,
            'start_date' => $this->user_purchase_request->start_date,
            'end_date' => $this->user_purchase_request->end_date,
            'booking_id' => $this->user_purchase_request->user_purchase_reference,
            'service_type' => $this->getServiceType(),

        ];
    }

    private function getPurchaseTitle($purchaseable)
    {
        $purchaseable_title = ' ';
        $purchaseable->is_price_options ?
            $purchaseable_title = $purchaseable->title_en . ' - ' . $this->handleServicePriceOptions($purchaseable->price_options) ?? ' '
            :
            $purchaseable_title = $purchaseable->title_en ?? ' ';


        return $purchaseable_title;
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

    private function getServiceType()
    {
        $service = Service::where('id', $this->user_purchase_request->purchaseable_id)->with('service_type')->first() ?? ' ';
        return   $service->service_type->title_en ?? ' ';
    }
}
