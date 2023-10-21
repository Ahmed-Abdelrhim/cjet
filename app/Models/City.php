<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;

    protected $table = 'cities';


    protected $fillable =
    [
        'title_en',
        'title_ar',
        'is_active',

    ];

    protected $hidden = ['created_at', 'updated_at'];

    public function getTitleAttribute()
    {
        return $this->{'title_'.app()->getLocale()};
    }


    public function compounds()
    {
        return $this->hasMany(Compound::class);
    }
}
