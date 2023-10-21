<?php

namespace App\Services\Interfaces;

interface HomeServiceInterface
{
    public function home();
    public function serviceTypes();
    public function service(int $id);
    public function package(int $id);
    public function daysOfWeek();

}
