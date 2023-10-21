<?php

namespace App\Services;

use App\Http\Resources\User\UserProfileResource;
use App\Models\Otp;
use App\Models\User;
use App\Repositories\Interfaces\OtpRepositoryInterface;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Services\Interfaces\OtpServiceInterface;
use App\Services\Interfaces\UserAuthServiceInterface;
use App\Services\Interfaces\UserOtpServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\SMSTrait;
use App\Traits\UserTokenResponseTrait;
use Carbon\Carbon;
use Exception;

class UserOtpService implements UserOtpServiceInterface
{
    use ResponseTrait, UserTokenResponseTrait;


    private $otpService;
    private $userRepository;

    public function __construct(
        OtpServiceInterface $otpService,
        UserRepositoryInterface $userRepository
    ) {
        $this->otpService = $otpService;
        $this->userRepository = $userRepository;
    }


    public function resend($user, string $phone)
    {
        $response = $this->otpService->resend($user, $phone);
        if ($response['response'] == 'error') {
            return $this->error422($response['message'], $response['message']);
        } else {
            return $this->success200([
                // 'otp' => $response['otp'],
                'message' =>  trans('custom.otp_sent'),
            ]);
        }
    }




    public function verify($user, int $otp)
    {
        $response = $this->otpService->verify($user, $otp);
        if ($response['response'] == 'error') {
            return $this->error422($response['message'], $response['message']);
        } else {
            return $this->handleLoginResponse($user);
        }
    }


    public function verifyResetPassword($user, int $otp)
    {
        $response = $this->otpService->verify($user, $otp);
        if ($response['response'] == 'error') {
            return $this->error422($response['message'], $response['message']);
        } else {
            return $this->success200([
                // 'user' => null,
                'token' => $user->createToken("API TOKEN", ['reset-password'])->plainTextToken,
            ], 'Otp Verified Successfully');
        }
    }


    private function handleExistUserSocialPhoneNewData($new_user)
    {
        $updatedDataArray = [];
        !(is_null($new_user->email)) ? $updatedDataArray['email'] = $new_user->email : null;
        !(is_null($new_user->apple_social_id)) ? $updatedDataArray['apple_social_id'] = $new_user->apple_social_id : null;
        !(is_null($new_user->google_social_id)) ? $updatedDataArray['google_social_id'] = $new_user->google_social_id : null;
        !(is_null($new_user->facebook_social_id)) ? $updatedDataArray['facebook_social_id'] = $new_user->facebook_social_id : null;
        $updatedDataArray['last_activity_at'] = now();
        return $updatedDataArray;
    }

    private function handleExistUserSocialPhone($user_existing, $user_new)
    {
        $new_data = $this->handleExistUserSocialPhoneNewData($user_new);
        $this->userRepository->destroy($user_new->id);
        return $this->userRepository->update($new_data, $user_existing->id);
    }

    public function verifyUpdateSocialPhone($user, int $otp)
    {
        $response = $this->otpService->verify($user, $otp);
        if ($response['response'] == 'error') {
            return $this->error422($response['message'], $response['message']);
        } else {
            //CHECK IF PHONE EXISTS 
            if ($user_existing = $this->userRepository->getUserByPhone($user->temp_phone)) {
                $updated_user = $this->handleExistUserSocialPhone($user_existing, $user);
                return $this->handleLoginResponse($updated_user);
            }
            $user = $this->userRepository->update([
                'phone' => $user->temp_phone,
                'phone_verified_at' => now(),
                'last_activity_at' => now()
            ], $user->id);

            return $this->handleLoginResponse($user);
        }
    }

    public function verifyUpdateTempPhone($user, int $otp)
    {
        $response = $this->otpService->verify($user, $otp);
        if ($response['response'] == 'error') {
            return $this->error422($response['message'], $response['message']);
        } else {
            $user = $this->userRepository->update([
                'phone' => $user->temp_phone,
                'temp_phone' => null,
                'phone_verified_at' => now(),
                'last_activity_at' => now()
            ], $user->id);

            $user = $this->userRepository->get($user->id);

            return $this->success200([
                'user' => new UserProfileResource($user)
            ], 'Otp Verified Successfully');

            // return $this->success200(['user' => new UserProfileResource($user)]);

        }
    }
}
