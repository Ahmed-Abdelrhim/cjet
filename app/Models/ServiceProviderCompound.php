<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ServiceProviderCompound extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'service_provider_compounds';


    protected $fillable =
    [
        'id',
        'service_provider_id',
        'compound_id',
    ];

    protected $hidden = ['created_at', 'updated_at', 'deleted_at'];


}
