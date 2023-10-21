<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InvoiceUserPurchaseRequest extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'invoice_user_purchase_requests';


    protected $fillable = [
        'id',
        'invoice_id',
        'user_purchase_request_id',
    ];

    protected $hidden = ['updated_at', 'deleted_at'];


    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'invoice_id');
    }

    public function user_purchase_request()
    {
        return $this->belongsTo(UserPurchaseRequest::class, 'user_purchase_request_id');
    }
}
