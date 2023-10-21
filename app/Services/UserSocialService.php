<?php

namespace App\Services;

use App\Models\User;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Repositories\Interfaces\UserSocialRepositoryInterface;
use App\Services\Interfaces\OtpServiceInterface;
use App\Services\Interfaces\UserSocialServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\SMSTrait;
use App\Traits\UserTokenResponseTrait;

class UserSocialService implements UserSocialServiceInterface
{
    use SMSTrait, ResponseTrait, UserTokenResponseTrait;

    private $userRepository;
    private $otpService;
    private $userSocialRepository;

    public function __construct(
        UserRepositoryInterface $userRepository,
        OtpServiceInterface $otpService,
        UserSocialRepositoryInterface $userSocialRepository
    ) {
        $this->userRepository = $userRepository;
        $this->otpService = $otpService;
        $this->userSocialRepository = $userSocialRepository;
    }


    private function handleCreateAndSendOtp(User $user, string $phone, string $ability = 'otp')
    {
        $response_otp = $this->otpService->createAndSend($user, $phone);
        if ($response_otp['response'] == 'error') {
            return $this->error422($response_otp['message'], $response_otp['message']);
        } else {
            return $this->handleOtpSentResponse($user, $response_otp['otp'], $ability);
        }
    }

    private function handleUserResponse(User $user)
    {
        if ($user->phone_verified_at) {
            // IF PHONE IS VERIFIED LOGIN USER
            return $this->handleLoginResponse($user);
        } else {
            if (!$user->phone) {
                return $this->handlePhoneRequiredResponse($user,'otp-update-social-phone');
            }
            // CREATE AND SEND OTP
            return $this->handleCreateAndSendOtp($user, $user->phone, 'otp-update-social-phone');
        }
    }

    /**
     * Register / Login function
     */
    public function registerLogin(array $data)
    {
        // 1. CHECK IF SOCIAL ID EXIST WITH TYPE
        $key = $data['account_type'] . '_social_id';
        if ($user_social = $this->userSocialRepository->getWhereFirst([$key => $data['social_id']])) {
            return $this->handleUserResponse($user_social);
        } else { // 2. ELSE USER DOES NOT EXIST
            // CHECK EMAIL OR PHONE EXISTS
            if ($userWhereOrWhere = $this->userSocialRepository->getWhereOrWhere($data['phone'], $data['email'])) {
                // UPDATE USER WITH SOCIAL ID
                $this->userSocialRepository->update([$key => $data['social_id'], 'last_activity_at' => now()], $userWhereOrWhere->id);
                return $this->handleUserResponse($userWhereOrWhere);
            } else {
                // NO USER FOUND SO CREATE USER
                $user_new = $this->handleCreateUserSocialMedia($data);
                return $this->handlePhoneRequiredResponse($user_new,'otp-update-social-phone');
            }
        }
    }


    public function updatePhone(string $temp_phone)
    {
        // CHECK IF PHONE EXISTS MERGE ACCOUNT.
        // dd(auth('sanctum')->user(),$phone);
        $user = auth('sanctum')->user();
        $this->userSocialRepository->update(['temp_phone' => $temp_phone], $user->id);
        return $this->handleCreateAndSendOtp($user, $temp_phone, 'otp-update-social-phone');
    }



    private function handleCreateUserSocialMedia(array $data)
    {
        $key = $data['account_type'] . '_social_id';

        return $this->userSocialRepository->create([
            'name' => $data['name'],
            'email' => $data['email'],
            $key => $data['social_id'],
            'last_activity_at' => now(),
        ]);
    }
}
