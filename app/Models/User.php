<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Storage;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;


    protected $table = 'users';

    const  IMAGE_PATH = "users";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'email_verified_at',
        'password',
        'phone',
        'temp_phone',
        'phone_verified_at',
        'image',
        'lang',
        'is_sms_offers',
        'last_activity_at',
        'apple_social_id',
        'google_social_id',
        'facebook_social_id',
        'promotional_notification',
        'promotional_sms',

    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'created_at',
        'updated_at'
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function social_accounts()
    {
        return $this->hasMany(SocialAccount::class);
    }

    public function addresses()
    {
        return $this->hasMany(UserAddress::class);
    }

    public function cars()
    {
        return $this->hasMany(UserCar::class);
    }

    public function payment_methods()
    {
        return $this->hasMany(UserPaymentMethod::class);
    }

    public function user_purchase_requests()
    {
        return $this->hasMany(UserPurchaseRequest::class);
    }

    public function user_active_purchase_requests()
    {
        return $this->user_purchase_requests()->where('status' ,'inprogress');
    }

    public function user_requests_schedules()
    {
        return $this->hasMany(UserPurchaseSchedule::class);
    }

    public function user_active_requests_schedules()
    {
        return $this->user_requests_schedules()->where('status' ,'inprogress');
    }


    public function user_car_active_subscription()
    {
        return $this->user_purchase_requests()->where('status' ,'inprogress');
    }

}
