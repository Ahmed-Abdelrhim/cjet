<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Feature;
use Illuminate\Database\Eloquent\SoftDeletes;

class Package extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'packages';

    protected $appends = ['price_string'];

    protected $fillable =
    [
        'title_en',
        'title_ar',
        'description_en',
        'description_ar',
        'price',
        'no_of_days',
        'is_active'
    ];

    protected $hidden = ['created_at', 'updated_at', 'pivot'];



    public function getTitleAttribute()
    {
        return $this->{'title_' . app()->getLocale()};
    }


    public function getDescriptionAttribute()
    {
        return $this->{'description_' . app()->getLocale()};
    }

    public function getPriceStringAttribute()
    {
        if (app()->getLocale() == 'ar') {
            return $this->price . ' جنيه / الشهر';
        }
        return  $this->price . ' EGP / Month';
    }



    public function features()
    {
        return $this->hasMany(Feature::class, 'package_id');
    }

    public function features_sync()
    {
        return $this->belongsToMany(Package::class, Feature::class, 'package_id');
    }

    // public function features2()
    // {
    //     return $this->morphMany(Feature::class, 'featureable');
    // }
}
