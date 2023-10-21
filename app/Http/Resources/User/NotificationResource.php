<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class NotificationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {   
         $data= $this->data ;
        $array['is_read']=$this->read_at? true:false;
        $array['title']=trans($this->data['title']);
        $array['message']=trans($this->data['notification'],$this->data['notification_paramaters']);
        $array['entity_id']=$this->data['id'];
        $array['notification_id']=$this->id;
        $array['type']=$this->data['type'];
        return $array;
    }
}
