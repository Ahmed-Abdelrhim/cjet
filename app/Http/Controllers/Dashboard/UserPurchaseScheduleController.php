<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\AssignUserPurchaseScheduleValidateRequest;
use App\Http\Requests\Dashboard\ReassignUserPurchaseScheduleValidateRequest;
use App\Http\Requests\Dashboard\ServiceProviderScheduleSearchBookingIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleValidateIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleValidateInprogressIDRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleValidateInprogressIDsArrayRequest;
use App\Http\Requests\Dashboard\UserScheduleSearchBookingIDRequest;
use App\Services\Interfaces\ServiceProviderServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleDashboardServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleServiceInterface;
use App\Traits\ResponseTrait;

class UserPurchaseScheduleController extends Controller
{
    use ResponseTrait;

    private $userPurchaseScheduleDashboardService;
    private $serviceProviderService;

    public function __construct(
        UserPurchaseScheduleDashboardServiceInterface $userPurchaseDashboardScheduleService,
        ServiceProviderServiceInterface $serviceProviderService
    ) {
        $this->userPurchaseScheduleDashboardService = $userPurchaseDashboardScheduleService;
        $this->serviceProviderService = $serviceProviderService;
    }



    public function getWithDetails(UserPurchaseScheduleValidateIDRequest $request, int $id)
    {
        return $this->userPurchaseScheduleDashboardService->getWithDetails($id);
    }

    public function searchServiceProviderBookingID(ServiceProviderScheduleSearchBookingIDRequest $request)
    {
        return $this->userPurchaseScheduleDashboardService->searchServiceProviderBookingID($request->booking_id, $request->service_provider_id, [$request->status], $request->paginate);
    }

    public function searchUserBookingID(UserScheduleSearchBookingIDRequest $request)
    {
        $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'];
        return $this->userPurchaseScheduleDashboardService->searchUserBookingID($request->booking_id, $request->user_id, $status, $request->paginate);
    }

    public function getScheduleAvailableServiceProviders(UserPurchaseScheduleValidateInprogressIDRequest $request, int $id)
    {
        return $this->serviceProviderService->getScheduleAvailableServiceProviders($id);
    }

    public function getSchedulesAvailableServiceProviders(UserPurchaseScheduleValidateInprogressIDsArrayRequest $request)
    {
        $compound_ids = $this->userPurchaseScheduleDashboardService->getCompoundIDs($request->ids)->toArray();
        if (count(array_unique($compound_ids)) != 1) {
            $error_message = 'Selected values must be same compound';
            return $this->error422(['ids' => [$error_message]], $error_message);
        }

        return $this->serviceProviderService->getScheduleAvailableServiceProviders($request->ids[0]);
    }

    public function assign(AssignUserPurchaseScheduleValidateRequest $request, int $id)
    {
        return $this->serviceProviderService->assignSchedule($id, $request->service_provider_id);
    }


    public function reassignMulti(ReassignUserPurchaseScheduleValidateRequest $request)
    {
        $compound_ids = $this->userPurchaseScheduleDashboardService->getCompoundIDs($request->ids)->toArray();
        if (count(array_unique($compound_ids)) != 1) {
            $error_message = 'Selected values must be same compound';
            return $this->error422(['ids' => [$error_message]], $error_message);
        }
        return $this->serviceProviderService->reassignSchedules($request->ids, $request->service_provider_id);
    }
}
