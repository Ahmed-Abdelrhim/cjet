<?php

namespace App\Services;

use App\Exports\UserPurchaseRequestsExport;
use App\Http\Resources\Dashboard\RequestSchedulePendingListResource;
use App\Http\Resources\Dashboard\RequestScheduleListResource;
use App\Http\Resources\Dashboard\RequestSchedulePendingExportListResource;
use App\Http\Resources\Dashboard\UserPurchaseRequestSingleDetailsResource;
use App\Models\UserPurchaseRequest;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Services\Interfaces\UserPurchaseRequestDashboardServiceInterface;
use App\Traits\ResponseTrait;
use Maatwebsite\Excel\Excel;

class UserPurchaseRequestDashboardService implements UserPurchaseRequestDashboardServiceInterface
{
    use ResponseTrait;


    private $userPurchaseRequestRepository;



    public function __construct(UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository)
    {

        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
    }





    public function getWithDetails(int $id)
    {
        return $this->success200(new UserPurchaseRequestSingleDetailsResource($this->userPurchaseRequestRepository->getWithDetails($id)));
    }



    public function searchBookingID(string $booking_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1)
    {
        $booking_id = str_replace(' ', '', $booking_id);
        return $this->success200(RequestSchedulePendingListResource::collection($this->userPurchaseRequestRepository
            ->searchBookingID($booking_id, $status, $paginate))
            ->response()
            ->getData(true));
    }



    public function searchFilter($from,  $to, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'],  $filter = null,  $sort = null,  $paginate = 1)
    {
        return $this->success200(RequestSchedulePendingListResource::collection($this->userPurchaseRequestRepository
            ->searchFilter($from, $to, $status, $filter, $sort, $paginate))
            ->response()
            ->getData(true));
    }

    public function export(array $ids = null, array $filter_array = null)
    {
        $file_data = $this->getExcelData($ids, $filter_array);
        ob_end_clean(); //for generating excel XLSX
        ob_start(); //for generating excel XLSX
        return (new UserPurchaseRequestsExport(RequestSchedulePendingExportListResource::collection($file_data)))->download('request_schedule_pending.xlsx', Excel::XLSX);
    }


    private function getExcelData(array $ids = null, array $filter_array = null)
    {
        if ($ids) {
            return $this->userPurchaseRequestRepository->getWhereInIDs($ids);
        } else {
            return $this->userPurchaseRequestRepository->searchFilter($filter_array['from'], $filter_array['to'],  [$filter_array['status']], $filter_array['filter'], $filter_array['sort'], 0);
        }
    }
}
