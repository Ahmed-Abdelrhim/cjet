<?php

namespace App\Http\Resources\Dashboard;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserPurchaseRequestScheduleListMinimumResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        return [
            'scheduled_at' => date('d/m/Y', strtotime($this->scheduled_at)),
            'day_of_week' => date('l', strtotime($this->scheduled_at)),
        ];
    }
}
