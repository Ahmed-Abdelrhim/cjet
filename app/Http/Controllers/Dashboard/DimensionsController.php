<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Services\Interfaces\DimensionsServiceInterface;
use Illuminate\Http\Request;

class DimensionsController extends Controller
{

    private $dimensionsService;

    public function __construct(DimensionsServiceInterface $dimensionsService)
    {
        $this->dimensionsService = $dimensionsService;    
    }  
    
    public function __invoke()
    {
        return $this->dimensionsService->dimensions();
    }
}
