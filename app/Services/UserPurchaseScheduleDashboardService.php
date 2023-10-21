<?php

namespace App\Services;

use App\Exports\UserPurchaseRequestsExport;
use App\Exports\UserPurchaseSchedulesCancelledExport;
use App\Exports\UserPurchaseSchedulesCompletedExport;
use App\Exports\UserPurchaseSchedulesExport;
use App\Http\Resources\Dashboard\RequestScheduleCancelledExportListResource;
use App\Http\Resources\Dashboard\RequestScheduleCompletedExportListResource;
use App\Http\Resources\Dashboard\RequestScheduleExportListResource;
use App\Http\Resources\Dashboard\RequestScheduleListResource;
use App\Http\Resources\Dashboard\RequestSchedulePendingExportListResource;
use App\Http\Resources\Dashboard\RequestScheduleRescheduledExportListResource;
use App\Http\Resources\Dashboard\RequestScheduleRescheduledListResource;
use App\Http\Resources\Dashboard\ServiceProviderScheduleListResource;
use App\Http\Resources\Dashboard\UserPurchaseScheduleSingleDetailsResource;
use App\Http\Resources\Dashboard\UserScheduleListResource;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Services\Interfaces\UserPurchaseScheduleDashboardServiceInterface;
use App\Traits\ResponseTrait;
use Maatwebsite\Excel\Excel;


class UserPurchaseScheduleDashboardService implements UserPurchaseScheduleDashboardServiceInterface
{
    use ResponseTrait;


    private $userPurchaseScheduleRepository;



    public function __construct(UserPurchaseScheduleRepositoryInterface $userPurchaseScheduleRepository)
    {

        $this->userPurchaseScheduleRepository = $userPurchaseScheduleRepository;
    }

    public function getWithDetails(int $id)
    {
        return $this->success200(new UserPurchaseScheduleSingleDetailsResource($this->userPurchaseScheduleRepository->getWithDetails($id)));
    }

    public function getCompoundIDs(array $ids)
    {
        return $this->userPurchaseScheduleRepository->getCompoundIDs($ids);
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateStatus(string $status, int $id)
    {
        $schedule = $this->userPurchaseScheduleRepository->show($id);
        if ($schedule->status == 'inprogress' || $schedule->status == 'completed') {
            $this->userPurchaseScheduleRepository->update(['status' => $status], $id);
            return $this->success202();
        }
        $error_message = 'Status invalid only inprogress or completed can be updated';
        return $this->error422(['id' => [$error_message]], $error_message);
    }

    /**
     * Search Booking ID
     */
    public function searchBookingID(string $booking_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1)
    {
        $booking_id = str_replace(' ', '', $booking_id);
        return $this->success200(RequestScheduleListResource::collection($this->userPurchaseScheduleRepository
            ->searchBookingID($booking_id, $status, $paginate))
            ->response()
            ->getData(true));
    }


    public function searchServiceProviderBookingID(string $booking_id, int $service_provider_id, array $status = ['inprogress', 'completed'], $paginate = 1)
    {
        $booking_id = str_replace(' ', '', $booking_id);
        return $this->success200(ServiceProviderScheduleListResource::collection($this->userPurchaseScheduleRepository
            ->searchServiceProviderBookingID($booking_id,  $service_provider_id, $status, $paginate))
            ->response()
            ->getData(true));
    }


    public function searchUserBookingID(string $booking_id, int $user_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1)
    {
        $booking_id = str_replace(' ', '', $booking_id);
        return $this->success200(UserScheduleListResource::collection($this->userPurchaseScheduleRepository
            ->searchUserBookingID($booking_id, $user_id, $status, $paginate))
            ->response()
            ->getData(true));
    }




    public function searchFilter($from,  $to, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'],  $filter = null,  $sort = null,  $paginate = 1)
    {
        return $this->success200(RequestScheduleListResource::collection($this->userPurchaseScheduleRepository
            ->searchFilter($from, $to, $status, $filter, $sort, $paginate))
            ->response()
            ->getData(true));
    }

    public function export(array $ids = null, array $filter_array = null)
    {
        $file_data = $this->getExcelData($ids, $filter_array);
        ob_end_clean(); //for generating excel XLSX
        ob_start(); //for generating excel XLSX
        return $this->handleStatusExport($filter_array['status'], $file_data);
    }

    private function handleStatusExport($status, $file_data)
    {
        if ($status == 'inprogress') {
            return (new UserPurchaseSchedulesExport(RequestScheduleExportListResource::collection($file_data)))->download('request_schedule_inprogress.xlsx', Excel::XLSX);
        } elseif ($status == 'completed') {
            return (new UserPurchaseSchedulesCompletedExport(RequestScheduleCompletedExportListResource::collection($file_data)))->download('request_schedule_completed.xlsx', Excel::XLSX);
        } elseif ($status == 'cancelled') {
            return (new UserPurchaseSchedulesCancelledExport(RequestScheduleCancelledExportListResource::collection($file_data)))->download('request_schedule_cancelled.xlsx', Excel::XLSX);
        } elseif ($status == 'rescheduled') {
            return (new RequestScheduleRescheduledExportListResource(RequestScheduleRescheduledListResource::collection($file_data)))->download('request_schedule_rescheduled.xlsx', Excel::XLSX);
        } else { // status = pending or payment 
            return (new UserPurchaseSchedulesExport(RequestScheduleExportListResource::collection($file_data)))->download('request_schedule_pending.xlsx', Excel::XLSX);
        }
    }

    private function getExcelData(array $ids = null, array $filter_array = null)
    {
        if ($ids) {
            return $this->userPurchaseScheduleRepository->getWhereInIDs($ids);
        } else {
            return $this->userPurchaseScheduleRepository->searchFilter($filter_array['from'], $filter_array['to'],  [$filter_array['status']], $filter_array['filter'], $filter_array['sort'], 0);
        }
    }
}
