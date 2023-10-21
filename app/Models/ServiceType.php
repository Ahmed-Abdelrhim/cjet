<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class ServiceType extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'service_types';

    const  IMAGE_PATH = "service_types";

    protected $fillable =
    [
        'title_en',
        'title_ar',
        'is_active',
        'image_en',
        'image_ar'
    ];

    protected $hidden = ['created_at', 'updated_at'];

    public function getTitleAttribute()
    {
        return $this->{'title_'.app()->getLocale()};
    }

    public function getImageAttribute()
    {
        return url('public' . Storage::url($this->{'image_' . app()->getLocale()})) ?? ' ';
    }

    public function services()
    {
        return $this->hasMany(Service::class);
    }
}
