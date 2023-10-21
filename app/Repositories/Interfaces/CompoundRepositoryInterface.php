<?php

namespace App\Repositories\Interfaces;


interface CompoundRepositoryInterface
{
    public function all();
    public function allActiveWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function update(array $data, int $id);
    public function updateWhere(array $condition, array $data);
    public function destroy(int $id);
    public function select();
}
