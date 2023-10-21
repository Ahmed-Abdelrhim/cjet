<?php

namespace App\Traits;

use App\Models\User;

trait UserTokenResponseTrait
{
    use UploadTrait;


    private function handleSuccessResponse(User $user, string $ability = 'user', string $message)
    {
        return $this->success200([
            'user' => $user,
            'is_phone_filled' => true,
            'is_phone_verified' => true,
            'token' => $user->createToken("API TOKEN", [$ability])->plainTextToken,
        ], $message);
    }

    public function handleLoginResponse(User $user)
    {
        return $this->handleSuccessResponse($user, 'user', 'User Logged In Successfully');
    }

    public function handleOtpSuccessResponse(User $user, string $ability = 'password-reset')
    {
        return $this->handleSuccessResponse($user, $ability, 'Otp Verified Successfully');
    }



    public function handlePhoneRequiredResponse(User $user, string $ability = 'phone')
    {
        return $this->success200([
            'user' => $user,
            'is_phone_filled' => false,
            'is_phone_verified' => false,
            'token' => $user->createToken("API TOKEN", [$ability])->plainTextToken,
            'message' => 'Phone Required',
        ]);
    }

    public function handleOtpSentResponse(User $user, string $otp, string $ability = 'otp')
    {
        if ($ability == 'otp') {
            return $this->success200([
                'user' => $user,
                'is_phone_filled' => true,
                'is_phone_verified' => false,
                'token' => $user->createToken("API TOKEN", [$ability])->plainTextToken,
                'message' =>  trans('custom.otp_sent'),

            ]);
        } else {
            return $this->success200([
                'user' => null,
                'is_phone_filled' => true,
                'is_phone_verified' => false,
                'token' => $user->createToken("API TOKEN", [$ability])->plainTextToken,
                'message' =>  trans('custom.otp_sent'),

            ]);
        }
    }
}
