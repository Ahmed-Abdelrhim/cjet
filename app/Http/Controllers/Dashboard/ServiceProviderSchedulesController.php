<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\ServiceProviderScheduleSearchRequest;
use App\Http\Requests\Dashboard\UserPurchaseScheduleUpdateStatusRequest;
use App\Http\Requests\Dashboard\ServiceProviderValidateIDRequest;
use App\Services\Interfaces\ServiceProviderServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleDashboardServiceInterface;

class ServiceProviderSchedulesController extends Controller
{

    private $serviceProviderService;
    private $userPurchaseScheduleDashboardService;

    public function __construct(
        ServiceProviderServiceInterface $serviceProviderService,
        UserPurchaseScheduleDashboardServiceInterface $userPurchaseScheduleDashboardService
    ) {
        $this->serviceProviderService = $serviceProviderService;
        $this->userPurchaseScheduleDashboardService = $userPurchaseScheduleDashboardService;
    }


    /**
     * Display the specified resource.
     */
    public function search(ServiceProviderScheduleSearchRequest $request)
    {
        return $this->serviceProviderService
            ->searchSchedules(
                $request->service_provider_id,
                $request->from . ' 00:00:00',
                $request->to . ' 23:59:59',
                $request->status,
                $request->compound_id, $request->paginate);
    }

    /**
     * Display the specified resource.
     */
    public function activeSchedules(ServiceProviderValidateIDRequest $request, int $id)
    {
        $paginate = 1;
        return $this->serviceProviderService->activeSchedules($id, $paginate);
    }


    /**
     * Display the specified resource.
     */
    public function completedSchedules(ServiceProviderValidateIDRequest $request, int $id)
    {
        $paginate = 1;
        return $this->serviceProviderService->completedSchedules($id, $paginate);
    }

    public function updateStatus(UserPurchaseScheduleUpdateStatusRequest $request, int $id)
    {
        return $this->userPurchaseScheduleDashboardService->updateStatus($request->status, $id);
    }
}
