<?php

namespace App\Repositories\Interfaces;


interface ServiceRepositoryInterface
{
    public function all();
    public function allActive();
    public function allWithDetails();
    public function allActiveAverageOptions();
    public function allActiveWithoutAverageOptions();
    
    public function create(array $data);
    public function show(int $id);
    public function getWhereAll(array $data);
    public function update(array $data, int $id);
    public function updateWithDetails(array $data, array $features,array $price_options,int $id);
    public function destroy(int $id);
}
