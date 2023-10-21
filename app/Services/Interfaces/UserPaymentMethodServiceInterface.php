<?php
namespace App\Services\Interfaces;

interface UserPaymentMethodServiceInterface
{
   public function list(int $user_id);
   public function show(int $id);
   public function create(array $data);

   public function update(int $id,array $data); 
   public function setDefault(int $id);

   public function destroy(int $id);
   public function listActive(int $user_id);


}