<?php

namespace App\Repositories\Interfaces;


interface UserPurchaseRequestRepositoryInterface
{

    public function all();
    public function create(array $data);
    public function update(array $data, int $id);
    public function updateWhereAll(array $condition, array $data);
    public function show(int $id);
    public function getWithDetails(int $id);
    public function getWhereInIDs(array $ids);
    public function getUserActivePackageSubscriptionWhere(int $user_id, int $user_car_id);
    public function getUserActiveServiceSubscriptionWhere(int $user_id, int $user_car_id, int $service_id,  $start_date);
    public function isExist(array $data);
    public function getWhereFirst(array $data, array $status = ['pending', 'inprogress']);
    public function getWhereAll(array $data, array $status = ['pending', 'inprogress']);
    public function searchFilter($from,  $to,  array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $filter = null,  $sort = null, int $paginate = 1);
    public function searchBookingID(string $booking_id, array $status = ['pending', 'inprogress', 'completed'], $paginate = 1);

}
