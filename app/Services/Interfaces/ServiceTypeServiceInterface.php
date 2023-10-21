<?php

namespace App\Services\Interfaces;

interface ServiceTypeServiceInterface
{
    public function all();
    public function allWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function update(array $data,int $id);
    public function destroy(int $id);
    public function active($is_active,int $id);
 

}
