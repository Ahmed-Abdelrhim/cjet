<?php

namespace App\Http\Resources\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ServiceProviderExportListResource extends JsonResource
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
            'name' => $this->name  ?? '-',
            'phone' => $this->phone  ?? '-',
            'rating' => $this->rating  ?? '-',
            'is_active' => $this->is_active  ? 'Yes' : 'No',
            'is_available' => $this->is_available  ? 'Yes' : 'No',
            'compounds' => implode(', ',CompoundListResource::collection($this->compounds)->pluck('title_en')->toArray()) ?? '-',
        ];
    }
}
