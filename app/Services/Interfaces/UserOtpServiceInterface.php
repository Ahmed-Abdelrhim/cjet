<?php

namespace App\Services\Interfaces;

interface UserOtpServiceInterface
{
    public function resend($user,string $phone);
    public function verify($user, int $otp);
    public function verifyResetPassword($user, int $otp);
    public function verifyUpdateSocialPhone($user, int $otp);
    public function verifyUpdateTempPhone($user, int $otp);


}
