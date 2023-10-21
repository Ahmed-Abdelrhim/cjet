<?php

namespace App\Http\Resources\User;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BookingScheduleSingleResource extends JsonResource
{
    private $booking_schedule_type;
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $this->booking_schedule_type = ($this->user_purchase_request->purchaseable_type == Service::class) ? 'service' : 'package';
        return [
            'id' => $this->id ?? 0,
            'booking_schedule_type' =>  $this->booking_schedule_type,
            'status' => $this->status  ?? ' ',
            'request_title' => $this->handleRequestTitle($this->status),
            'title' => $this->user_purchase_request->title ?? ' ',
            'price' => $this->handlePrice($this->user_purchase_request->price, $this->booking_schedule_type) ?? ' ',
            'scheduled_at' => $this->scheduled_at  ?? ' ',
            'rescheduled_at' => $this->rescheduled_at,
            'booking_id' => $this->user_purchase_reference,
            'payment_status' => $this->booking_schedule_type == 'service' ? $this->handleServicePaymentStatus($this->status) : $this->handlePackagePaymentStatus($this->status),
            'service_rate' => $this->service_rate,
            'address' => new UserAddressesSingleResource($this->user_purchase_request->address),
            'car' => $this->user_purchase_request->car,
            'rescheduled_at' => $this->rescheduled_at,
            'reschedule_maximum_date' => $this->reschedule_maximum_date,

        ];
    }



    private function handlePackagePaymentStatus()
    {
        if (app()->getLocale() == 'ar') {
            return 'تدفع شهريا';
        }
        return 'Monthly Paid';
    }

    private function handleServicePaymentStatus($status)
    {
        if ($status == 'cancelled') {
            if (app()->getLocale() == 'ar') {
                return 'معاد';
            }
            return 'Refunded';
        } else {
            if (app()->getLocale() == 'ar') {
                return 'مدفوع';
            }
            return 'Paid';
        }
    }



    private function handlePrice($price, $booking_schedule_type)
    {
        if ($booking_schedule_type == 'service') {
            if (app()->getLocale() == 'ar') {
                return $price . 'جنيه ';
            }
            return  $price . ' EGP';
        } else {
            if (app()->getLocale() == 'ar') {
                return $price . ' جنيه / الشهر';
            }
            return  $price . ' EGP / Month';
        }
    }


    private function handleRequestTitle($status)
    {
        if ($status == 'completed') {
            if (app()->getLocale() == 'ar') {
                return 'الطلب مكتمل';
            }
            return 'Request Completed';
        } else if ($status == 'cancelled') {
            if (app()->getLocale() == 'ar') {
                return 'الطلب ملغي';
            }
            return 'Request Cancelled';
        } 
        else if ($status == 'rescheduled') {
            if (app()->getLocale() == 'ar') {
                return 'طلب إعادة جدولة ';
            }
            return 'Request Reschedule';
        } else {
            if (app()->getLocale() == 'ar') {
                return 'الطلب مجدول';
            }
            return 'Request Scheduled';
        }
    }
}
