<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Compound extends Model
{
    use HasFactory;

    protected $table = 'compounds';


    protected $fillable =
    [
        'city_id',
        'title_en',
        'title_ar',
        'is_active',

    ];

    protected $hidden = ['created_at', 'updated_at','pivot'];

    public function getTitleAttribute()
    {
        return $this->{'title_'.app()->getLocale()};
    }


    public function city()
    {
        return $this->belongsTo(City::class, 'city_id');
    }
}
