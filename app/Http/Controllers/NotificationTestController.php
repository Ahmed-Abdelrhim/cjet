<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Notifications\BookingAppointment;
use App\Notifications\BookingRefunded;
use App\Notifications\BookingRescheduled;
use App\Notifications\PackageSubscriptionActivated;
use App\Notifications\PackageSubscriptionCancelled;
use App\Notifications\PackageSubscriptionEnded;
use App\Notifications\PackageSubscriptionRenewed;
use App\Notifications\RequestConfirmed;
use Illuminate\Http\Request;

class NotificationTestController extends Controller
{
    
    
    public function index(){
        $user=User::find(23);
 
        $user->notify(new RequestConfirmed($user->user_purchase_requests->first())); 
        $user->notify(new BookingAppointment($user->user_purchase_requests->first())); 
        $user->notify(new BookingRescheduled($user->user_purchase_requests->first())); 

        $user->notify(new BookingRefunded($user->user_purchase_requests->first())); 

        $user->notify(new PackageSubscriptionActivated($user->user_purchase_requests->first())); 

        $user->notify(new PackageSubscriptionCancelled($user->user_purchase_requests->first())); 

        $user->notify(new PackageSubscriptionEnded($user->user_purchase_requests->first())); 

        $user->notify(new PackageSubscriptionRenewed($user->user_purchase_requests->first())); 

 
    }
}
