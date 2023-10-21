<?php

namespace App\Repositories\Interfaces;


interface UserPurchaseScheduleRepositoryInterface
{
    public function create(array $data);
    public function insert(array $data);
    public function update(array $data, int $id);
    public function updateWhereAll(array $condition, array $data);
    public function updateWhereInAll(array $ids, array $data);
    public function show(int $id);
    public function getWithDetails(int $id);
    public function getUpcomingUserSchedules(int $user_id);
    public function getPastUserSchedules(int $user_id);
    public function getRescheduleUserSchedules(int $user_id);
    public function getWhereFirst(array $data, array $status = ['pending', 'inprogress']);
    public function getWhereAll(array $data, array $status = ['pending', 'inprogress']);
    public function getWhereInIDs(array $ids);
    public function getCompoundIDs(array $ids);
    public function getServiceProviderSchedules(int $service_provider_id, array $status = ['inprogress', 'completed']);
    public function getServiceProviderActiveSchedules(int $service_provider_id, $paginate = 0);
    public function getServiceProviderActiveSchedulesCount(int $service_provider_id);
    public function getServiceProviderCompletedSchedules(int $service_provider_id, $paginate = 0);
    public function getServiceProviderCompletedSchedulesCount(int $service_provider_id);
    public function calculateServiceProviderAverageRating(int $service_provider_id);
    public function searchServiceProviderSchedules(int $service_provider_id, $from, $to, $status = 'inprogress', $compound_id = null, $paginate = 1);
    public function searchUserSchedules(int $user_id, $from, $to, $filter, $paginate = 1);
    public function searchFilter($from,  $to, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'],  $filter = null,  $sort = null,  $paginate = 1);
    public function searchBookingID(string $booking_id,array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'] ,$paginate = 1);
    public function searchUserBookingID(string $booking_id, int $user_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1);
    public function searchServiceProviderBookingID(string $booking_id, int $service_provider_id, array $status = [ 'inprogress', 'completed'], $paginate = 1);

}
