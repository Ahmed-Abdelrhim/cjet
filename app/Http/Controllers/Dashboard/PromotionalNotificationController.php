<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\PromotionalNotificationRequest;

 
use App\Services\promotionalNotificationService;

class PromotionalNotificationController extends Controller
{

    private $promotionalNotificationService;
    
    public function __construct(promotionalNotificationService $promotionalNotificationService)
    {
        $this->promotionalNotificationService = $promotionalNotificationService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->promotionalNotificationService->all();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(PromotionalNotificationRequest $request)
    {
        return $this->promotionalNotificationService->create($request->validated());
    }

  
}
