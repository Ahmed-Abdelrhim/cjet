<?php
namespace App\Repositories\Interfaces;


interface AdminRepositoryInterface
{
    public function create(array $data);
    public function show(int $id);
    public function update(array $data,int $id);
    public function getWhereFirst(array $data);
}