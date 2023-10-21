<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\PackageValidateIDRequest;
use App\Http\Requests\Dashboard\ServiceValidateIDRequest;
use App\Services\HomeService;
use App\Services\Interfaces\HomeServiceInterface;

class HomeController extends Controller
{


    private $homeService;

    public function __construct(HomeServiceInterface $homeService)
    {
        $this->homeService = $homeService;
    }

    public function index()
    {

        return $this->homeService->home();
    }

    public function serviceTypes()
    {

        return $this->homeService->serviceTypes();
    }


    public function package(PackageValidateIDRequest $request, $id)
    {
        return $this->homeService->package($id);
    }


    public function service(ServiceValidateIDRequest $request, $id)
    {
        return $this->homeService->service($id);
    }

    public function daysOfWeek()
    {
        return $this->homeService->daysOfWeek();
    }
}
