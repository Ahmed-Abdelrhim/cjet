<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PromotionalNotification extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'promotional_notification';

    protected $fillable =
    [
        'id',
        'content',
        'title',
        'is_sms',
        'is_email',
    ];

 
}
