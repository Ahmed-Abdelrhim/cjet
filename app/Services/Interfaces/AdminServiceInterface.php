<?php

namespace App\Services\Interfaces;

interface AdminServiceInterface
{
    public function login(string $email,string $password);
    public function register(array $data);
    public function update(array $data,int $id);
    public function updatePassword(string $password,string $new_password);

}
