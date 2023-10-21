<?php

namespace App\Services\Interfaces;

interface ServiceProviderServiceInterface
{
    public function all();
    public function paginate();
    public function select();
    public function allWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function activeSchedules(int $id, $paginate = 0);
    public function completedSchedules(int $id, $paginate = 0);
    public function update(array $data, int $id);
    public function active($is_active, int $id);
    public function available($is_available, int $id);
    public function filter($filter, $sort, $paginate);
    public function searchSchedules(int $service_provider_id, $from, $to, $status, $compound_id = null,  $paginate = 1);
    public function getRequestAvailableServiceProviders(int $user_purchase_request_id);
    public function getAssignRequestAvailableServiceProviders(int $user_purchase_request_id);
    public function getReassignRequestAvailableServiceProviders(int $user_purchase_request_id);
    public function getScheduleAvailableServiceProviders(int $user_purchase_schedule_id);
    public function getAssignScheduleAvailableServiceProviders(int $user_purchase_schedule_id);
    public function getReassignScheduleAvailableServiceProviders(int $user_purchase_schedule_id);
    public function assignRequest(int $user_purchase_request_id, int $service_provider_id);
    public function assignSchedule(int $user_purchase_schedule_id, int $service_provider_id);
    public function reassignSchedules(array $ids, int $service_provider_id);
    public function assignRescheduledSchedule(int $user_purchase_schedule_id, int $service_provider_id);
    public function assignInprogressSchedule(int $user_purchase_schedule_id, int $service_provider_id);
    public function export(array $ids = null, array $filter_array = null);
}
