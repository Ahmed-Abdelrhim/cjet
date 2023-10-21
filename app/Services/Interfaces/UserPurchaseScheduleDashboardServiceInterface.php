<?php

namespace App\Services\Interfaces;

interface UserPurchaseScheduleDashboardServiceInterface
{
    public function getWithDetails(int $id);
    public function searchFilter($from,  $to, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'],  $filter = null,  $sort = null,  $paginate = 1);
    public function searchBookingID(string $booking_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1);
    public function searchUserBookingID(string $booking_id, int $user_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1);
    public function searchServiceProviderBookingID(string $booking_id, int $service_provider_id, array $status = ['inprogress', 'completed'], $paginate = 1);
    public function export(array $ids = null, array $filter_array = null);
    public function getCompoundIDs(array $ids);
    public function updateStatus(string $status, int $id);


}
