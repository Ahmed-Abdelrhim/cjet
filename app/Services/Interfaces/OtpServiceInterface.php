<?php

namespace App\Services\Interfaces;

interface OtpServiceInterface
{
    public function getOtpCode($user);
    public function createAndSend($user,string $phone);
    public function resend($user, string $phone);
    public function verify($user, int $otp);

}
