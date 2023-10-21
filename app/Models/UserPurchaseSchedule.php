<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPurchaseSchedule extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'user_purchase_schedules';


    protected $fillable = [
        'id',
        'user_id',
        'user_purchase_request_id',
        'service_provider_id',
        'assigned_at',
        'user_purchase_reference',
        'status',
        'scheduled_at',
        'rescheduled_at',
        'is_reschedule_handled',
        'service_rate',
        'reschedule_maximum_date',
        'actionable_id',
        'actionable_type',
        'refund_status',
        'cancelled_at',
    ];

    protected $hidden = ['updated_at', 'deleted_at'];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function user_purchase_request()
    {
        return $this->belongsTo(UserPurchaseRequest::class, 'user_purchase_request_id');
    }

    public function service_provider()
    {
        return $this->belongsTo(ServiceProvider::class, 'service_provider_id');
    }


}
