<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ServiceType;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Service extends Model
{
    use HasFactory,SoftDeletes;

    const  IMAGE_PATH = "services";

    protected $table = 'services';

    protected $appends = ['price_string'];


    protected $fillable =
    [
        'service_type_id',
        'title_en',
        'title_ar',
        'image_en',
        'image_ar',
        'short_description_en',
        'short_description_ar',
        'description_en',
        'description_ar',
        'price',
        'is_active',
        'is_price_options'
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

    public function getShortDescriptionAttribute()
    {
        return $this->{'short_description_' . app()->getLocale()};
    }

    public function getImageAttribute()
    {
        return url('public' . Storage::url($this->{'image_' . app()->getLocale()})) ?? ' ';
    }

    public function getPriceStringAttribute()
    {
        if ($this->is_price_options) {
            return  $this->price_options()->min('price') . ' - ' . $this->price_options()->max('price') . ' EGP';
        }
        return $this->price . ' EGP';
    }

    public function service_type()
    {
        return $this->belongsTo(ServiceType::class, 'service_type_id');
    }


    public function features()
    {
        return $this->hasMany(Feature::class, 'service_id');
    }

    public function features_sync()
    {
        return $this->belongsToMany(Service::class, Feature::class, 'service_id');
    }

    // public function features2()
    // {
    //     return $this->morphMany(Feature::class, 'featureable');
    // }


    public function price_options_sync()
    {
        return $this->belongsToMany(Service::class,PriceOption::class, 'service_id');
    }


    public function price_options()
    {
        return $this->hasMany(PriceOption::class, 'service_id');
    }
}
