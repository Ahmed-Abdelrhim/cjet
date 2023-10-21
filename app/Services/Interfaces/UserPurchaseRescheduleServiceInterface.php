<?php

namespace App\Services\Interfaces;

use Illuminate\Support\Facades\Date;

interface UserPurchaseRescheduleServiceInterface
{
    public function reschedule($reschedule_to, int $id);
    public function scheduledDays(int $id);
    
}
