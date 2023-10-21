<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Invoice extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'invoices';


    protected $fillable = [
        'id',
        'user_id',
        'purchaseable_type',
        'invoice_reference_number',
        'amount',
        'invoice_type'
    ];

    protected $hidden = ['updated_at', 'deleted_at'];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    
    public function invoice_user_purchase_request()
    {
        return $this->hasMany(InvoiceUserPurchaseRequest::class, 'invoice_id');
    }
}
