<?php

namespace App\Http\Controllers\User;

use App\Http\Requests\User\NotificationSettingsRequest;
use App\Http\Requests\User\UserForgetPasswordRequest;
use App\Http\Requests\User\UserLoginRequest;
use App\Http\Requests\User\UserRegisterRequest;
use App\Http\Requests\User\UserResetPasswordRequest;
use App\Http\Requests\User\UserSubscriptionCancelRequest;
use App\Http\Requests\User\UserUpdatePasswordRequest;
use App\Http\Requests\User\UserUpdateProfileRequest;
use App\Services\Interfaces\UserAuthServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\SMSTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UserController
{
    use SMSTrait, ResponseTrait;

    private $userAuthService;
    private $userPurchaseRequestService;

    public function __construct(
        UserAuthServiceInterface $userAuthService,
        UserPurchaseRequestServiceInterface $userPurchaseRequestService
    ) {
        $this->userAuthService = $userAuthService;
        $this->userPurchaseRequestService = $userPurchaseRequestService;
    }



    public function register(UserRegisterRequest $request)
    {
        if (Str::length($request->name) > 50) {
            return $this->error422(['name' => [trans('custom.name_length_validation')]],  trans('custom.name_length_validation'));
        }
        return $this->userAuthService->register($request->validated());
    }


    public function login(UserLoginRequest $request)
    {
        return $this->userAuthService->login($request->validated());
    }



    public function forgotPassword(UserForgetPasswordRequest $request)
    {
        return $this->userAuthService->forgotPassword($request->phone);
    }


    public function resetPassword(UserResetPasswordRequest $request)
    {
        return $this->userAuthService->resetPassword($request->new_password);
    }



    public function profile()
    {
        return $this->userAuthService->profile(auth('sanctum')->id());
    }

    public function getProfileDetails()
    {
        return $this->userAuthService->getProfileDetails(auth('sanctum')->id());
    }


    public function updateProfile(UserUpdateProfileRequest $request)
    {
        if (Str::length($request->name) > 50) {
            return $this->error422(['name' => [trans('custom.name_length_validation')]],  trans('custom.name_length_validation'));
        }
        return $this->userAuthService->updateProfile($request->validated(), auth('sanctum')->id());
    }


    public function updatePassword(UserUpdatePasswordRequest $request)
    {
        return $this->userAuthService->updatePassword($request->password, $request->new_password);
    }

    public function cancelSubscription(UserSubscriptionCancelRequest $request, $id)
    {
        return $this->userPurchaseRequestService->cancelPackageSubscription($id);
    }


    public function logout(Request $request)
    {
        return $this->userAuthService->logout($request);
    }


    public function deleteIbrahim()
    {
        return $this->userAuthService->deleteIbrahim();
    }

    public function getUserNotificationSettings(){
        return $this->userAuthService->getUserNotificationSettings(auth('sanctum')->id());
 

    }

    public function setUserNotificationSettings(NotificationSettingsRequest $request){
        return $this->userAuthService->setUserNotificationSettings($request->all(), auth('sanctum')->id());
    }


    public function getUserNotifications()
    { 
        
          return $this->userAuthService->getUserNotifications(auth('sanctum')->id());
    }

    public function markAsRead( $id)
    {
        return   $this->userAuthService->markAsRead($id ) ;
    }
}
