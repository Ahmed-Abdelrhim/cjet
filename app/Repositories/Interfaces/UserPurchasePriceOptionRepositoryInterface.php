<?php
namespace App\Repositories\Interfaces;


interface UserPurchasePriceOptionRepositoryInterface
{
    public function create(array $data);
    public function insert(array $data);
    public function update(array $data,int $id);
    public function updateWhere(array $search_data,array $updated_data);
    public function show(int $id);
    public function getWhereAll(array $data);

}