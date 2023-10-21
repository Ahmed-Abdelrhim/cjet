<?php

namespace App\Http\Resources\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PromotionaNotificationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'title' => $this->title  ?? ' ',      
            'content' => $this->title  ?? ' ',   
            'is_sms' => $this->is_sms?true:false, 
            'is_email' => $this->is_email?true:false, 
        ];
    }
}
