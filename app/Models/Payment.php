<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment extends Model
{
    use HasFactory;

    protected $table = 'payments';

    protected $fillable = [
        'order_id',
        'user_id',
        'user_purchase_request_id',
        'payment_status', //nullable
        'payment_pending', //nullable
        'amount', //nullable
        'currency', //nullable
        'paymob_transaction_id', //nullable
        'paid_at', //nullable
        'created_at', //nullable
        'updated_at', //nullable
    ];

    protected $casts = [
        'paid_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function purchase_request(): BelongsTo
    {
        return $this->belongsTo(UserPurchaseRequest::class,'user_purchase_request_id','id');
    }
}
