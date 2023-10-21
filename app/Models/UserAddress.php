<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserAddress extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'user_addresses';


    protected $fillable =
    [
        'id',
        'user_id',
        'city_id',
        'compound_id',
        'street',
        'unit',
        'is_default',

    ];

    protected $hidden = ['created_at', 'updated_at','deleted_at'];



    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function city()
    {
        return $this->belongsTo(City::class, 'city_id');
    }

    public function compound()
    {
        return $this->belongsTo(Compound::class, 'compound_id');
    }

}
