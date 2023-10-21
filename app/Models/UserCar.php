<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserCar extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'user_cars';


    protected $fillable =
    [
        'id',
        'user_id',
        'model',
        'color',
        'plate',
    ];

    protected $hidden = ['created_at', 'updated_at','deleted_at'];



    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
