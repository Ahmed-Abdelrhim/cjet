<?php

namespace App\Services;

use App\Http\Resources\User\NotificationResource;
use App\Http\Resources\User\UserProfileResource;
use App\Http\Resources\User\UserProfileWithDetailsResource;
use App\Models\User;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Services\Interfaces\OtpServiceInterface;
use App\Services\Interfaces\UserAuthServiceInterface;
use App\Traits\ResponseTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Traits\SMSTrait;
use App\Traits\UserTokenResponseTrait;

class UserAuthService implements UserAuthServiceInterface
{
    use SMSTrait, ResponseTrait, UserTokenResponseTrait;

    private $userRepository;
    private $otpService;

    public function __construct(
        UserRepositoryInterface $userRepository,
        OtpServiceInterface $otpService
    ) {
        $this->userRepository = $userRepository;
        $this->otpService = $otpService;
    }



    public function deleteIbrahim()
    {
        if ($user = $this->userRepository->getUserByPhone('01022568932')) {
            $this->userRepository->destroy($user->id);
            return $this->success200('User Deleted Successfully', 'User Deleted Successfully');
        }

        return $this->error400('User Does not Exist', 'User Does not Exist');
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


    public function register(array $data)
    {
        try {
            // Store user data.
            $data['password'] = Hash::make($data['password']);
            $data['last_activity_at'] = now();
            $user = $this->userRepository->create($data);

            // Create and send OTP.
            return $this->handleCreateAndSendOtp($user, $user->phone, 'otp');
        } catch (\Throwable $th) {
            return $this->error500($th->getMessage());
        }
    }


    public function forgotPassword(string $phone)
    {
        $user = $this->userRepository->getUserByPhone($phone);
        // Create and send OTP.
        return $this->handleCreateAndSendOtp($user, $phone, 'otp-reset-password');
    }



    public function resetPassword(string $new_password)
    {
        $user = auth('sanctum')->user();
        $this->userRepository->update([
            'password' => bcrypt($new_password),
            'last_activity_at' => now(),
        ],  $user->id);
        return $this->success200(null, trans('custom.password_changed'));
    }



    public function login(array $data)
    {
        try {
            if (!Auth::guard('api')->attempt($data)) {
                return $this->error422(trans('custom.phone_password_error'), trans('custom.phone_password_error'));
            }
            $user = $this->userRepository->getUserByPhone($data['phone']);

            if ($user->phone_verified_at) {
                return $this->handleLoginResponse($user);
            } else {
                return $this->handleCreateAndSendOtp($user, $user->phone, 'otp');
            }
        } catch (\Throwable $th) {
            return $this->error500($th->getMessage());
        }
    }

    public function profile(int $id)
    {
        return $this->success200(['user' => new UserProfileResource($this->userRepository->get($id))]);
    }

    public function getProfileDetails(int $id)
    {
        return $this->success200(['user' => new UserProfileWithDetailsResource($this->userRepository->getProfileDetails($id))]);
    }

    public function updateProfile(array $data, int $id)
    {
        if (isset($data['image'])) {
            $data['image'] = $this->uploadWithResize($data['image'], User::IMAGE_PATH, 240, 240);
        }

        // Updating default data
        $user_updated_phone = $data['phone'];
        unset($data['phone']);
        $this->userRepository->update($data, $id);

        // IF USER UPDATED HIS PHONE THEN SEND OTP.
        if ($user_updated_phone != auth('sanctum')->user()->phone) {
            // SAVE THE PHONE IN TEMP PHONE COLUMN.
            $user = $this->userRepository->get($id);
            $this->userRepository->update(['temp_phone' => $user_updated_phone], $id);
            return $this->handleCreateAndSendOtp($user, $user_updated_phone, 'user');
        }

        $user_details  = $this->userRepository->getProfileDetails($id);
        return $this->success200(['user' => new UserProfileWithDetailsResource($user_details)]);
    }


    public function updatePassword(string $password, string $new_password)
    {
        $user = auth('sanctum')->user();
        if (!Auth::guard('api')->attempt(['phone' => $user->phone, 'password' => $password])) {
            return $this->error422(trans('custom.invalid_old_password'), trans('custom.invalid_old_password'));
        }

        $this->userRepository->update(['password' => bcrypt($new_password)],  $user->id);
        return $this->success200(null, trans('custom.password_changed'));
    }



    public function logout($request)
    {
        $request->user()->currentAccessToken()->delete();
        return $this->success200('User Logged Out Successfully', 'User Logged Out Successfully');
    }

    public function setUserNotificationSettings(array $data, int $id)
    {
        $this->userRepository->update([ 'promotional_notification'=>$data['promotional_notification'],
        'promotional_sms'=>$data['promotional_sms']],  $id);
        return $this->success200(null, trans('custom.notification_settings_updated_successfully'));
    }

    public function getUserNotificationSettings(int $id)
    {

        return    $this->success200(['user' =>User::select('promotional_notification','promotional_sms')->find($id)]);
    }
     public function getUserNotifications(int $id)
    {

        return    $this->success200( NotificationResource::collection(User::find(auth('sanctum')->id())->Notifications) )  ;
    }

    public function markAsRead(string $id)
    {
      User::find(auth('sanctum')->id())->Notifications->where('id',$id)->markAsRead();
        return    $this->success200('Notification marked as read')  ;
    }
}
