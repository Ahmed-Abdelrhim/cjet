<?php

namespace App\Repositories\Interfaces;


interface CityRepositoryInterface
{
    public function all();
    public function allWithDetails();
    public function allActiveWithDetails();
    public function allActiveWhereHasActiveCompoundsWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function update(array $data, int $id);
    public function destroy(int $id);
    public function select();


}
