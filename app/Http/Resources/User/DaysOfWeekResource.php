<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DaysOfWeekResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'constant' => $this['constant'], 
            'title' => (app()->getLocale() == 'ar') ? $this['title_ar'] : $this['title_en'],
        ];
    }
}
