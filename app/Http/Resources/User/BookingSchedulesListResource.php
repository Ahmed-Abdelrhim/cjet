<?php

namespace App\Http\Resources\User;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BookingSchedulesListResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id ?? 0,
            'scheduled_at' => $this->scheduled_at  ?? ' ',
            'status' => $this->status ?? ' ',
            'title' => $this->user_purchase_request->title ?? ' ',
            'description' => $this->user_purchase_request->description ?? ' ',
            'status' => $this->handleStatus($this->status),
            'service_type' => $this->getServiceType(),
        ];
    }

    private function handleStatus($status)
    {
        if ($status == 'completed') {
            return app()->getLocale() == 'ar' ? 'مكتمل' : $status;
        } else if ($status == 'cancelled') {
            return app()->getLocale() == 'ar' ? 'مُلغى' : $status;
        } else if ($status == 'rescheduled') {
            return app()->getLocale() == 'ar' ? 'قيد الانتظار ' :'pending';
        } else {
            return app()->getLocale() == 'ar' ? 'مقبل' : 'upcoming';
        }
    }

    private function getServiceType()
    {
        $purchaseable_type = $this->user_purchase_request->purchaseable_type;

        if (($purchaseable_type == Service::class)) {
            $service = Service::where('id',$this->user_purchase_request->purchaseable_id)->with('service_type')->first() ?? ' ';
            return   $service->service_type->title ?? ' ';
        } else {
            return app()->getLocale() == 'ar' ? 'مجموعه' : 'package';
        }
    }
}
