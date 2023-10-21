<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\VerifyOtpRequest;
use App\Services\Interfaces\OtpServiceInterface;
use App\Services\Interfaces\UserOtpServiceInterface;
use App\Traits\SMSTrait;
use Illuminate\Support\Facades\Auth;

class UserOtpController extends Controller
{
    use SMSTrait;

    private $userOtpService;

    public function __construct(UserOtpServiceInterface $userOtpService)
    {
        $this->userOtpService = $userOtpService;
    }




    public function resend()
    {
        $user = auth('sanctum')->user();
        if (request()->user()->tokenCan('otp-update-social-phone')) {
            return $this->userOtpService->resend($user, $user->temp_phone);
        } else {
            return $this->userOtpService->resend($user, $user->phone);
        }
    }


    public function resendTempPhone()
    {
        $user = auth('sanctum')->user();
        return $this->userOtpService->resend($user, $user->temp_phone);
    }


    public function verify(VerifyOtpRequest $request)
    {
        // Route::group(['middleware' => ['auth:sanctum', 'ability:otp,otp-update-social-phone,otp-reset-password']], function () {
        $user = auth('sanctum')->user();
        if (request()->user()->tokenCan('otp-update-social-phone')) {
            return $this->userOtpService->verifyUpdateSocialPhone($user, $request->otp);
        } elseif (request()->user()->tokenCan('otp-reset-password')) {
            return $this->userOtpService->verifyResetPassword($user, $request->otp);
        } else {
            return $this->userOtpService->verify($user, $request->otp);
        }
    }



    public function verifyResetPassword(VerifyOtpRequest $request)
    {
        return $this->userOtpService->verifyResetPassword(auth('sanctum')->user(), $request->otp);
    }

    public function verifyTempPhone(VerifyOtpRequest $request)
    {
        return $this->userOtpService->verifyUpdateTempPhone(auth('sanctum')->user(), $request->otp);
    }
}
