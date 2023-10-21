<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PriceOption extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'price_options';

    protected $fillable =
    [
        'id',
        'service_id',
        'price',
        'title_en',
        'title_ar',
    ];

    protected $hidden = ['created_at', 'updated_at', 'pivot'];

    public function getTitleAttribute()
    {
        return $this->{'title_' . app()->getLocale()};
    }

    public function service()
    {
        return $this->belongsTo(Service::class);
    }
}
