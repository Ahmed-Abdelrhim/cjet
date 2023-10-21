<?php

namespace App\Http\Resources\User;

use App\Http\Resources\User\UserSubscriptionsListResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class UserProfileWithDetailsResource extends JsonResource
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
            'name' => $this->name,
            'phone' => $this->phone,
            'image' => is_null($this->image) ? null : url('public' . Storage::url($this->image)),
            'email' => is_null($this->email) ? null : $this->handleEmail($this->email),
            'user_subscriptions' =>  UserPackageSubscriptionListResource::collection($this->user_purchase_requests) ?? [],
            // 'user_subscriptions' =>  ($this->user_purchase_requests) ?? [],

        ];
    }

    private function handleEmail($email)
    {
        if (Str::contains($email, '@privaterelay.appleid.com')) {
            return null;
        }
        return $email;
    }
}
