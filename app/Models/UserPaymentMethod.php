<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPaymentMethod extends Model
{
    use HasFactory;

    protected $table = 'user_payment_methods';


    protected $fillable =
    [
        'user_id',
        'card_number',
        'expiry_month',
        'expiry_year',
        'cvv',
        'card_holder_name',
        'card_type',
        'is_default'
    ];

    protected $hidden = ['created_at', 'updated_at'];



    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
