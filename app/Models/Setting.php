<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    protected $table = 'settings';

    const  IMAGE_PATH = "settings";


    protected $fillable = [
        'id', 
        'key', 
        'value',
        'type',
        'image_dimensions'
    ];

    protected $hidden = ['created_at','updated_at'];

 
}
