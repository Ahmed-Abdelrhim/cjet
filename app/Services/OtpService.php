<?php

namespace App\Services;

use App\Models\Otp;
use App\Models\User;
use App\Repositories\Interfaces\OtpRepositoryInterface;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Services\Interfaces\OtpServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\SMSTrait;
use Carbon\Carbon;
use Exception;

class OtpService implements OtpServiceInterface
{
    use ResponseTrait, SMSTrait;

    private $otpRepository;
    private $userRepository;
    private $otpWaitMinutes = 1;
    private $otpNumberOfAttempts = 5;
    private $otpNumberOfSend = 3;
    private $otpExpireMinutes =  5;
    private $otpSessionBlockMinutes = 30;
    private $otpWaitSeconds;
    private $otpSessionBlockSeconds;

    public function __construct(
        OtpRepositoryInterface $otpRepository,
        UserRepositoryInterface $userRepository
    ) {
        $this->otpRepository = $otpRepository;
        $this->userRepository = $userRepository;
        $this->otpWaitSeconds = $this->otpWaitMinutes * 60;
        $this->otpSessionBlockSeconds = $this->otpSessionBlockMinutes * 60;
    }




    /**
     * Create Otp
     *
     * @param integer $user_id
     * @return string
     */
    public function getOtpCode($user)
    {
        $user_id = $user->id;
        $otp  =  $this->otpRepository->getWhereLast(['user_id' => $user_id]);

        if ($otp) {
            $checkResponse = $this->checkRequestOtpCases($otp);
            if ($checkResponse['response'] == 'error') {
                return $checkResponse;
            }
        }

        $otp = $this->getOtpAndHandleData($otp, $user);


        return [
            'response' => 'success',
            'message' => 'success',
            'otp' => $otp->otp
        ];
    }


    private function getOtpAndHandleData(Otp $otp = null, User $user)
    {
        $user_id = $user->id;

        if ($otp) {
            // NEED TO HANDLE SEND COUNT with if conditions $otp->send_count < $this->otpNumberOfSend &&
            if (!($this->isExpired($otp)) && !($otp->is_success) && !($this->isMaximumSend($otp))) {
                $this->otpRepository->update($this->handleUpdateData($otp), $otp->id);
                return $otp;
            }
        }
        $otp_new = $this->generateOtp();
        $data = $this->handleAddData($otp_new, $user_id);
        $this->otpRepository->deleteAllWhere(['user_id' => $user_id]);
        return $this->otpRepository->create($data);
    }


    private function checkRequestOtpCases(Otp $otp)
    {
        if ($this->isBlockSession($otp)) {
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_block_session');
            return $response;
        }

        if ($this->isJustCreated($otp)) {
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_just_created');
            return $response;
        }

        if ($this->isMaximumSend($otp)) {
            $this->handleMaximumSendUpdate($otp);
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_maximum_send');
            return $response;
        }
        return [
            'response' => 'success',
            'message' => 'success',
        ];
    }


    public function createAndSend($user, string $phone)
    {
        $responseOtp = $this->getOtpCode($user);
        if ($responseOtp['response'] == 'error')
            return $responseOtp;

        $responseSms = $this->handleSendSmsOtp($user, $phone, $responseOtp['otp']);
        if ($responseSms['response'] == 'error')
            return $responseSms;


        return [
            'response' => 'success',
            'message' => 'success',
            'otp' => $responseOtp['otp']
        ];
    }



    public function resend($user, string $phone)
    {
        return $this->createAndSend($user, $phone);
    }


    private function handleSendSmsOtp($user, $phone, int $otp)
    {
        try {
            // COMMENTED FOR TESTING
            $this->sendSMSOtp('2', $phone, $this->geSmsOtpMessage($otp));
            $this->otpRepository->updateIsSendCount($user->id);
            return [
                'response' => 'success',
                'message' => 'success',
            ];
        } catch (\Throwable $th) {
            return [
                'response' => 'error',
                'message' => 'Error in send sms',
            ];
        }
    }


    private function handleValidateOtp(Otp $user_otp, int $otp)
    {
        if (!$user_otp) {
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_doesnot_exist');
            return $response;
        }

        if ($this->isBlockSession($user_otp)) {
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_block_session');
            return $response;
        }

        if ($this->isOtpIncorrect($user_otp, $otp)) {
            $this->handleAttemptsUpdate($user_otp);
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_incorrect');
            return $response;
        }

        if ($this->isExpired($user_otp)) {
            $response['response'] = 'error';
            $response['message'] = trans('custom.otp_expired');
            return $response;
        }

        $this->otpRepository->updateIsSuccess($user_otp->user_id);
        $this->userRepository->updatePhoneVerifiedAt($user_otp->user_id);

        return [
            'response' => 'success',
            'message' => 'success',
        ];
    }


    public function verify($user, int $otp)
    {
        $user_otp = $this->otpRepository->getWhereLast(['user_id' => $user->id]);

        return $this->handleValidateOtp($user_otp, $otp);
    }


    /**
     * Check if Otp is just created
     *
     * @param integer $Otp
     * @return boolean
     */
    private function isJustCreated(Otp $otp)
    {
        return (abs(strtotime(date('Y-m-d H:i:s')) - strtotime($otp->updated_at))) < $this->otpWaitSeconds;
    }

    /**
     * Check if Otp maximum requests send
     *
     * @param integer $Otp
     * @return boolean
     */
    private function isMaximumSend(Otp $otp)
    {
        return $otp->send_count >= $this->otpNumberOfSend;
    }




    /**
     * Check if Otp is expired
     *
     * @param integer $Otp
     * @return boolean
     */
    private function isExpired(Otp $otp)
    {
        return strtotime(now()) > strtotime($otp->expire_at);
    }


    /**
     * Check if Otp is in block session
     *
     * @param integer $Otp
     * @return boolean
     */
    private function isBlockSession(Otp $otp)
    {
        if ($otp->unblocked_at) {
            return strtotime(now()) < strtotime($otp->unblocked_at);
        }
        return false;
    }


    /**
     * Check if Otp is incorrect
     *
     * @param integer $Otp
     * @return boolean
     */
    private function isOtpIncorrect(Otp $user_otp, int $otp)
    {
        return (($otp == 000000) || ($user_otp->otp != $otp));
    }


    /**
     * Check if Otp is in session resend
     *
     * @param integer $Otp
     * @return boolean
     */
    private function isNotSessionResend(Otp $otp)
    {
        return strtotime(now()) > strtotime($otp->expire_at);
    }


    private function handleAttemptsUpdate(Otp $user_otp)
    {
        if ($user_otp->attempts_count == $this->otpNumberOfAttempts) {
            $this->otpRepository->update([
                'unblocked_at' => Carbon::now()->addMinutes($this->otpSessionBlockMinutes),
                'attempts_count' => $user_otp->attempts_count + 1,
            ], $user_otp->id);
        } else {
            $this->otpRepository->update([
                'attempts_count' => $user_otp->attempts_count + 1,
            ], $user_otp->id);
        }
    }

    private function handleMaximumSendUpdate(Otp $user_otp)
    {
        $this->otpRepository->update([
            'unblocked_at' => Carbon::now()->addMinutes($this->otpSessionBlockMinutes),
            'send_count' => $user_otp->send_count + 1,
        ], $user_otp->id);
    }

    private function handleAddData(int $otp, int $user_id)
    {
        $currentTime = now();
        return [
            'user_id' => $user_id,
            'otp' => $otp,
            'created_at' => $currentTime,
            'updated_at' => $currentTime,
            'expire_at' => Carbon::now()->addMinutes($this->otpExpireMinutes),
            'send_count' => 1,
        ];
    }
    private function handleUpdateData($otp)
    {
        $currentTime = Carbon::now();
        return [
            'send_count' => ++$otp->send_count,
            'updated_at' => $currentTime,
            'expire_at' => $currentTime->addMinutes($this->otpExpireMinutes),
        ];
    }



    private function randomOtpGenerator()
    {
        return rand(100000, 999999);
    }

    private function generateOtp()
    {
        $otp = $this->randomOtpGenerator();
        while ($this->otpRepository->isExist(['otp' => $otp])) {
            $otp = $this->randomOtpGenerator();
        }
        return $otp;
    }

    private function geSmsOtpMessage(int $otp)
    {
        return trans('custom.otp_sms_content_one') . $otp .  trans('custom.otp_sms_content_two');
    }
}
