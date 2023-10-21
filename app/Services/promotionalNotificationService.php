<?php

namespace App\Services;

use App\Http\Resources\Dashboard\PromotionaNotificationResource;
use App\Models\PromotionalNotification;
use App\Models\ServiceType;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Repositories\Interfaces\ServiceTypeRepositoryInterface;
use App\Services\Interfaces\AdminServiceInterface;
use App\Services\Interfaces\ServiceTypeServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Auth;



class promotionalNotificationService  
{
     

  
    /**
     * Display a listing of the resource.
     */
    public function all()
    {
         
        return response()->json([
            'data' => PromotionaNotificationResource::collection(PromotionalNotification::all()),
            'status' => 200,
            'message' => 'notificaton created',
        ], 200);
    }


 
    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    { 
        return response()->json([
            'data' => PromotionalNotification::create($data),
            'status' => 200,
            'message' => 'notificaton created',
        ], 200);
    }
        
 
 
}
