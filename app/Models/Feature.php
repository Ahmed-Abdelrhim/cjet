<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feature extends Model
{
    use HasFactory;

    protected $table = 'features';

    protected $fillable =
    [
        'id',
        // 'featureable_id',
        // 'featureable_type',
        'package_id',
        'service_id',
        'title_en',
        'title_ar',
    ];

    protected $hidden = ['created_at', 'updated_at','pivot'];

    public function getTitleAttribute()
    {
        return $this->{'title_'.app()->getLocale()};
    }

     /**
     * Get the parent featureable model (post or video).
     */
    // public function featureable()
    // {
    //     return $this->morphTo();
    // }

    /**
     * Get the parent post model for the comment.
     */
    // public function service()
    // {
    //     return $this->belongsTo(Service::class, 'featureable_id')->where('featureable_type', Service::class);
    // }

    /**
     * Get the parent video model for the comment.
     */
    // public function package()
    // {
    //     return $this->belongsTo(Package::class, 'featureable_id')->where('featureable_type', Package::class);
    // }

}
