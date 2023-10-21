<?php

namespace App\Repositories\Interfaces;


interface FeatureRepositoryInterface
{
    public function all();
    public function allWithDetails();
    public function create(array $data);
    public function createArrayPackage(array $data,int $package_id);
    public function createArrayService(array $data,int $service_id);
    public function show(int $id);
    public function showWithDetails(int $id);
    public function update(array $data, int $id);
    public function updateArray(array $data);
    public function destroy(int $id);
    public function destroyArray(array $ids);
    public function destroyAllWhere(array $data);
    public function select();
}
