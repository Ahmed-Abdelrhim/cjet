<?php
namespace App\Repositories\Interfaces;


interface UserCarRepositoryInterface
{
    public function list(int $user_id);
    public function create(array $data);
    public function show(int $id);
    public function destroy(int $id);
    public function listActive(int $user_id);

    public function updateWhere(array $condition, array $data);
}