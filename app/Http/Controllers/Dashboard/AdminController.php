<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\AdminLoginRequest;
use App\Http\Requests\Dashboard\AdminRegisterRequest;
use App\Http\Requests\Dashboard\AdminUpdatePasswordRequest;
use App\Http\Requests\Dashboard\AdminUpdateProfileRequest;
use App\Services\Interfaces\AdminServiceInterface;

class AdminController extends Controller
{
    
    
    private $adminService;

    public function __construct(AdminServiceInterface $adminService)
    {
        $this->adminService = $adminService;
    }



    public function login(AdminLoginRequest $request)
    {
        return $this->adminService->login($request->email,$request->password);
    }


    public function update(AdminUpdateProfileRequest $request)
    {
        return $this->adminService->update($request->validated(),auth('sanctum')->id());
    }


    public function updatePassword(AdminUpdatePasswordRequest $request)
    {
        return $this->adminService->updatePassword($request->password,$request->new_password);
    }
    

    public function register(AdminRegisterRequest $request)
    {
        return $this->adminService->register($request->validated());
    }
}
