<?php

namespace App\Repositories\Interfaces;


interface PriceOptionRepositoryInterface
{
    public function all();
    public function allWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function showWithDetails(int $id);
    public function update(array $data, int $id);
    public function destroy(int $id);
    public function select();
    public function createArray(array $data,int $service_id);
    public function updateArray(array $data);
    public function destroyArray(array $ids);
    public function destroyAllWhere(array $data);




}
