<?php

namespace App\Http\Resources\User;

use App\Http\Resources\User\FeatureResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PackageSingleResource extends JsonResource
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
            'no_of_days' => $this->no_of_days ?? 0,
            'features' => FeatureResource::collection($this->features) ?? [],
            'no_of_days_string' => $this->handleNoOfDaysString() ?? ' ',
        ];
    }

    private function handleNoOfDaysString()
    {
        if (app()->getLocale() == 'ar') {
            return  $this->no_of_days . ' ايام في الاسبوع';
        }
        return  $this->no_of_days . ' DAYS PER WEEK';
    }
}
