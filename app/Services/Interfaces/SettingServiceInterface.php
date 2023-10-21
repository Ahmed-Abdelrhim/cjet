<?php

namespace App\Services\Interfaces;

interface SettingServiceInterface
{
    public function all();
    public function associative();
    public function group();
    public function update(array $data);

}
