<?php

namespace App\Http\Resources\User;

use App\Http\Resources\User\FeatureResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserPackageSubscriptionListResource extends JsonResource
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
            'title' => $this->title  ?? ' ',
            'price' => $this->price ?? 0,
            'price_string' => $this->handlePriceString($this->price) ?? 0,
            'price_currency' => $this->handlePriceString('') ?? 0,
            'is_renewable' => $this->is_renewable ? true : false,
            'recurrence' => explode(',', $this->selected_days) ?? [],
            'renewable_date' => $this->renewable_date,
            'end_date' => $this->end_date,
            // 'no_of_days' => $this->purchaseable->no_of_days ?? 0,
            'no_of_days_string' => $this->handleNoOfDaysString($this->purchaseable->no_of_days) ?? ' ',
        ];
    }

    private function handleNoOfDaysString($no_of_days)
    {
        if (app()->getLocale() == 'ar') {
            return  $no_of_days . ' ايام في الاسبوع';
        }
        return  $no_of_days . ' DAYS PER WEEK';
    }

    private function handlePriceString($price)
    {

        if (app()->getLocale() == 'ar') {
            return $price . ' جنيه / الشهر';
        }
        return  $price . ' EGP / Month';
    }
}
