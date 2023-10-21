<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\AssignUserPurchaseRequestValidateRequest;
use App\Http\Requests\Dashboard\AssignUserPurchaseScheduleValidateInprogressRequest;
use App\Http\Requests\Dashboard\AssignUserPurchaseScheduleValidateRescheduleRequest;
use App\Http\Requests\Dashboard\RequestScheduleExcelExportRequest;
use App\Http\Requests\Dashboard\RequestScheduleSearchBookingIDRequest;
use App\Http\Requests\Dashboard\RequestScheduleSearchRequest;
use App\Http\Requests\Dashboard\UserPurchaseRequestPendingValidateIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseRequestValidateIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleUpdateStatusRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleValidateIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleValidateInprogressIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleValidateRescheduleIDRequest;
use App\Services\Interfaces\ServiceProviderServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestDashboardServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleDashboardServiceInterface;
use App\Traits\ResponseTrait;

class RequestScheduleController extends Controller
{
    use ResponseTrait;

    private $userPurchaseRequestDashboardService;
    private $userPurchaseScheduleDashboardService;
    private $serviceProviderService;

    public function __construct(
        UserPurchaseScheduleDashboardServiceInterface $userPurchaseScheduleDashboardService,
        UserPurchaseRequestDashboardServiceInterface $userPurchaseRequestDashboardService,
        ServiceProviderServiceInterface $serviceProviderService
    ) {
        $this->userPurchaseScheduleDashboardService = $userPurchaseScheduleDashboardService;
        $this->userPurchaseRequestDashboardService = $userPurchaseRequestDashboardService;
        $this->serviceProviderService = $serviceProviderService;
    }



    /**
     * SEARCH FILTER & SEARCH BOOKING ID
     */


    public function searchRequestsSchedules(RequestScheduleSearchRequest $request)
    {
        if ($request->status == 'pending') {
            return $this->userPurchaseRequestDashboardService->searchFilter($request->from . ' 00:00:00', $request->to . ' 23:59:59', ['pending'], $request->filter, $request->sort, $request->paginate);
        }
        return $this->userPurchaseScheduleDashboardService->searchFilter($request->from . ' 00:00:00', $request->to . ' 23:59:59', [$request->status], $request->filter, $request->sort, $request->paginate);
    }



    public function searchRequestsSchedulesBookingID(RequestScheduleSearchBookingIDRequest $request)
    {
        if ($request->status == 'pending') {
            return $this->userPurchaseRequestDashboardService->searchBookingID($request->booking_id, ['pending'],  $request->paginate);
        }
        return $this->userPurchaseScheduleDashboardService->searchBookingID($request->booking_id,  [$request->status],  $request->paginate);
    }


    /**
     * GET AVAILABLE SERVICE PROVIDERS PENDING, RESCHEDULED, INPROGRESS REQUESTS
     */

    public function getPendingRequestAvailableServiceProviders(UserPurchaseRequestPendingValidateIDRequest $request, int $id)
    {
        return $this->serviceProviderService->getAssignRequestAvailableServiceProviders($id);
    }

    
    public function getRescheduledScheduleAvailableServiceProviders(UserPurchaseScheduleValidateRescheduleIDRequest $request, int $id)
    {
        return $this->serviceProviderService->getAssignScheduleAvailableServiceProviders($id);
    }

    public function getInprogressScheduleAvailableServiceProviders(UserPurchaseScheduleValidateInprogressIDRequest $request, int $id)
    {
        return $this->serviceProviderService->getReassignScheduleAvailableServiceProviders($id);
    }


    /**
     * ASSIGN SERVICE PROVIDERS PENDING, RESCHEDULED, INPROGRESS REQUESTS
     */


    public function assignRequest(AssignUserPurchaseRequestValidateRequest $request, int $id)
    {
        return $this->serviceProviderService->assignRequest($id, $request->service_provider_id);
    }


    public function assignRescheduledSchedule(AssignUserPurchaseScheduleValidateRescheduleRequest $request, int $id)
    {
        return $this->serviceProviderService->assignRescheduledSchedule($id, $request->service_provider_id);
    }

    public function assignInprogressSchedule(AssignUserPurchaseScheduleValidateInprogressRequest $request, int $id)
    {
        return $this->serviceProviderService->assignInprogressSchedule($id, $request->service_provider_id);
    }


    public function updateStatus(UserPurchaseScheduleUpdateStatusRequest $request, int $id)
    {
        return $this->userPurchaseScheduleDashboardService->updateStatus($request->status, $id);
    }



    public function export(RequestScheduleExcelExportRequest $request)
    {
        $filter_array = $this->handleExcelFilterData($request);

        if ($request->status == 'pending') {
            return $this->userPurchaseRequestDashboardService->export($request->ids, $filter_array);
        }
        return $this->userPurchaseScheduleDashboardService->export($request->ids, $filter_array);
    }

    private function handleExcelFilterData($request)
    {
        if (is_null($request->from) && is_null($request->to) && is_null($request->status) && is_null($request->filter)) {
            return null;
        } else {
            return [
                'from' => (is_null($request->from)) ? '2023-01-01' . ' 00:00:00' : $request->from. ' 00:00:00' ,
                'to' => (is_null($request->to)) ? date('Y-m-d', strtotime('+3 months')) . ' 23:59:59' : $request->to . ' 23:59:59',
                'sort' => $request->sort,
                'filter' => $request->filter,
                'status' => $request->status,
            ];
        }
    }


}
