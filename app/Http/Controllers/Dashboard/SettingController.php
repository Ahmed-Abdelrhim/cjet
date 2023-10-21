<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\SettingUpdateRequest;
use App\Services\Interfaces\SettingServiceInterface;

class SettingController extends Controller
{
    private $settingService;

    public function __construct(SettingServiceInterface $settingService)
    {
        $this->settingService =  $settingService;

    }

    public function index()
    {
        return $this->settingService->all();
    }

    public function associative()
    {
        return $this->settingService->associative();

    }

    public function group()
    {
        return $this->settingService->group();


    }

    public function update(SettingUpdateRequest $request)
    {
        return $this->settingService->update($request->validated());

    }


}
