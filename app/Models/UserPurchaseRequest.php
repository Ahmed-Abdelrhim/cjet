<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPurchaseRequest extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'user_purchase_requests';


    protected $fillable = [
        'id',
        'user_id',
        'user_purchase_reference',
        'purchaseable_id',
        'purchaseable_type',
        'invoice_reference_number',
        'user_address_id',
        'user_car_id',
        'user_payment_method_id',
        'service_provider_id',
        'assigned_at',
        'is_renewable',
        'start_date',
        'end_date',
        'renewable_date',
        'selected_days',
        'status',
        'price',
        'title_en',
        'title_ar',
        'description_en',
        'description_ar',
        'payment_status',
        'payment_reference',
        'root_purchase_request_id',
        'actionable_id',
        'actionable_type',
        'refund_status',
        'cancelled_at',
    ];

    protected $hidden = ['created_at', 'updated_at', 'deleted_at'];

    public function getTitleAttribute()
    {
        return $this->{'title_' . app()->getLocale()};
    }

    public function getDescriptionAttribute()
    {
        return $this->{'description_' . app()->getLocale()};
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function address()
    {
        return $this->belongsTo(UserAddress::class, 'user_address_id');
    }

    public function car()
    {
        return $this->belongsTo(UserCar::class, 'user_car_id');
    }

    public function service_provider()
    {
        return $this->belongsTo(ServiceProvider::class, 'service_provider_id');
    }


    public function user_purchase_schedules()
    {
        return $this->hasMany(UserPurchaseSchedule::class);
    }

    public function user_purchase_price_options()
    {
        return $this->hasMany(UserPurchasePriceOption::class);
    }

    public function purchaseable()
    {
        return $this->morphTo();
    }
}
