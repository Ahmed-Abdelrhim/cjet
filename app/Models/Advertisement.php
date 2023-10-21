<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Advertisement extends Model
{
    use HasFactory;

    protected $table = 'advertisements';

    const  IMAGE_PATH = "advertisements";

    protected $fillable = [
        'title_en',
        'title_ar',
        'image_en',
        'image_ar',
        'type',
        'is_active',
        'advertiseable_id',
        'advertiseable_type',

    ];

    protected $hidden = ['created_at', 'updated_at', 'pivot'];

    public function getTitleAttribute()
    {
        return $this->{'title_' . app()->getLocale()};
    }

    public function getImageAttribute()
    {
        return url('public' . Storage::url($this->{'image_' . app()->getLocale()})) ?? ' ';
    }

    /**
     * Get the parent advertiseable model (service or package).
     */
    public function advertiseable()
    {
        return $this->morphTo();
    }

    /**
     * Get the parent post model for the comment.
     */
    public function service()
    {
        return $this->belongsTo(Service::class, 'advertiseable_id')->where('advertiseable_type', Service::class);
    }

    /**
     * Get the parent video model for the comment.
     */
    public function package()
    {
        return $this->belongsTo(Package::class, 'advertiseable_id')->where('advertiseable_type', Package::class);
    }
}
