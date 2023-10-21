<?php

namespace App\Services\Interfaces;

interface UserPurchaseRequestDashboardServiceInterface
{
    public function getWithDetails(int $id);
    public function searchFilter($from,  $to,  array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $filter = null,  $sort = null, int $paginate = 1);
    public function searchBookingID(string $booking_id, array $status = ['pending', 'inprogress', 'completed'], $paginate = 1);
    public function export(array $ids = null, array $filter_array = null);

}
