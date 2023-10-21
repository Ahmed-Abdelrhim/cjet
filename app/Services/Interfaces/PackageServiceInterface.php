<?php

namespace App\Services\Interfaces;

interface PackageServiceInterface
{
    public function all();
    public function create(array $data);
    public function show(int $id);
    public function update(array $data,int $id);
    public function destroy(int $id);
    public function dropdowns();
    public function active($is_active, int $id);

}
