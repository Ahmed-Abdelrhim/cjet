<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ServiceProviderCompound;
use Illuminate\Database\Eloquent\SoftDeletes;

class ServiceProvider extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'service_providers';

    const  IMAGE_PATH = "service_providers";


    protected $fillable =
    [
        'id',
        'name',
        'phone',
        'address',
        'image',
        'national_id',
        'national_id_image',
        'is_active',
        'is_available',
        'rating',
        'rating_count',
    ];

    protected $hidden = ['created_at', 'updated_at', 'deleted_at', 'pivot'];


    public function compounds()
    {
        return $this->belongsToMany(Compound::class, ServiceProviderCompound::class, 'service_provider_id', 'compound_id');
    }

    public function schedules()
    {
        return $this->hasMany(UserPurchaseSchedule::class, 'service_provider_id', 'id');
    }
}
