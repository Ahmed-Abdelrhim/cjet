<?php
namespace App\Services\Interfaces;

interface UserAuthServiceInterface
{
   public function register(array $data);
   public function login(array $data);
   public function forgotPassword(string $phone);
   public function resetPassword(string $new_password);
   public function profile(int $id);
   public function getProfileDetails(int $id);
   public function updateProfile(array $data, int $id);
   public function updatePassword(string $password,string $new_password);
   public function logout($request);
   public function deleteIbrahim();

   public function getUserNotificationSettings(int $id);
   public function setUserNotificationSettings(array $data, int $id);

   public function getUserNotifications(int $id);


   public  function markAsRead(string $id);

}