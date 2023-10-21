<?php

namespace App\Services\Interfaces;

use Illuminate\Support\Facades\Date;

interface UserPurchaseScheduleServiceInterface
{
    public function schedules();
    public function show(int $id);
    public function cancel(int $id);
    public function updateRating(int $rate, int $id);
    public function handlePackageSchedules($user_purchase_request);
    public function handleServiceSchedules($user_purchase_request);
    public function getWithDetails(int $id);

}
