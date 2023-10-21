<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPurchasePriceOption extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'user_purchase_price_options';


    protected $fillable = [
        'id',
        'user_purchase_request_id', 
        'user_purchase_schedule_id', 
        'price_option_id', 
        'title_en', 
        'title_ar', 
        'price'
    ];

    protected $hidden = ['created_at', 'updated_at','deleted_at'];

    public function getTitleAttribute()
    {
        return $this->{'title_' . app()->getLocale()};
    }

    public function purchase_requests()
    {
        return $this->belongsTo(UserPurchaseRequest::class);
    }

    public function purchase_schedule()
    {
        return $this->belongsTo(UserPurchaseSchedule::class);
    }

}
