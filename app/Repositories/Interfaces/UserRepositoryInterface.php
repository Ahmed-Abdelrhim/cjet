<?php

namespace App\Repositories\Interfaces;


interface UserRepositoryInterface
{
    public function all();
    public function paginate();
    public function create(array $data);
    public function get(int $id);
    public function getWithDetails(int $id);
    public function getProfileDetails(int $id);
    public function getUserByPhone(string $phone);
    public function getUserByEmail(string $email);
    public function update(array $data,int $id);
    public function updatePhoneVerifiedAt(int $id);
    public function updateAttempts(int $id);
    public function updatePassword(int $id, string $hash);
    public function search($from, $to, $sort = null, $filter = null, $paginate);
    public function destroy(int $id);
    public function getWhereInIDs(array $ids);
}
