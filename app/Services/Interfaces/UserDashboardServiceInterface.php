<?php

namespace App\Services\Interfaces;

interface UserDashboardServiceInterface
{
    public function index();
    public function paginate();
    public function show(int $id);
    public function search($from, $to, $sort, $filter, $paginate);
    public function searchSchedules(int $user_id, $from, $to, $filter, $paginate = 1);
    public function export(array $ids = null, array $filter_array = null);
}
