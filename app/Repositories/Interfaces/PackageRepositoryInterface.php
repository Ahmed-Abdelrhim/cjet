<?php

namespace App\Repositories\Interfaces;


interface PackageRepositoryInterface
{
    public function all();
    public function allActive();
    public function allActiveWithDetails();
    public function allWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function getWhereAll(array $data);
    public function getWhereAllWithDetails(array $data);
    public function update(array $data, int $id);
    public function updateWithDetails(array $data, array $features,  int $id);
    public function destroy(int $id);
}
