<?php

namespace App\Http\Controllers\User;

use App\Http\Requests\User\UserSocialRegisterLoginRequest;
use App\Http\Requests\User\UserSocialUpdatePhone;
use App\Services\Interfaces\UserSocialServiceInterface;
use App\Traits\SMSTrait;

class UserSocialController 
{
    use SMSTrait;

    private $userSocialService;

    public function __construct(UserSocialServiceInterface $userSocialService)
    {
        $this->userSocialService = $userSocialService;
    }


    public function register(UserSocialRegisterLoginRequest $request)
    {
        return $this->userSocialService->registerLogin($request->validated());
    }


    public function login( UserSocialRegisterLoginRequest $request)
    {
        return $this->userSocialService->registerLogin($request->validated());
    }


    public function updatePhone(UserSocialUpdatePhone $request)
    {
        return $this->userSocialService->updatePhone($request->phone);
    }
}
