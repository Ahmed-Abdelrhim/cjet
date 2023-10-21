<?php
namespace App\Repositories\Interfaces;


interface UserSocialRepositoryInterface
{
    public function create(array $data);
    public function show(int $id);
    public function getWhereFirst(array $data);
    public function getWhereAll(array $data);
    public function getWhereOrWhere( $phone, $email);
    public function update(array $data, int $id);


}