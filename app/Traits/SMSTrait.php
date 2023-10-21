<?php

namespace App\Traits;

use Exception;
use Multicaret\Unifonic\UnifonicFacade;

trait SMSTrait
{

    private function sendSMS(string $phone, string $message)
    {
        try {
            
            UnifonicFacade::send($phone, $message, env('UNIFONIC_SENDER_ID'));
            return true;
        } catch (Exception $e) {
            return false;
        }
    }

    public function sendSMSOtp(string $country_code = '2', string $phone, string $message)
    {
        return $this->sendSMS($country_code. $phone, $message);
    }
}
