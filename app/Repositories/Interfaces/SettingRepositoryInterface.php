<?php

namespace App\Repositories\Interfaces;


interface SettingRepositoryInterface
{
    public function all();
    public function associative();
    public function group();
    public function update(array $data);
    public function getWhereKey(string $key);
    public function getWhereAll(array $data);


}
