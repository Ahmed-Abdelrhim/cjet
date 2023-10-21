<?php
namespace App\Services\Interfaces;

interface UserSocialServiceInterface
{
   public function registerLogin(array $data);
   public function updatePhone(string $phone);
}