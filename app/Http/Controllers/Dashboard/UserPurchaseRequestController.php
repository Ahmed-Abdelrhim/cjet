<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\AssignUserPurchaseRequestValidateRequest;
use App\Http\Requests\Dashboard\UserPurchaseRequestValidateIDRequest;
use App\Services\Interfaces\ServiceProviderServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestServiceInterface;
use App\Traits\ResponseTrait;

class UserPurchaseRequestController extends Controller
{
    use ResponseTrait;

    private $userPurchaseRequestService;
    private $serviceProviderService;

    public function __construct(UserPurchaseRequestServiceInterface $userPurchaseRequestService, ServiceProviderServiceInterface $serviceProviderService)
    {
        $this->userPurchaseRequestService = $userPurchaseRequestService;
        $this->serviceProviderService = $serviceProviderService;
    }


    public function getWithDetails(UserPurchaseRequestValidateIDRequest $request, int $id)
    {
        return $this->userPurchaseRequestService->getWithDetails($id);
    }

    public function getRequestAvailableServiceProviders(UserPurchaseRequestValidateIDRequest $request, int $id)
    {
        return $this->serviceProviderService->getRequestAvailableServiceProviders($id);
    }

    public function assign(AssignUserPurchaseRequestValidateRequest $request, int $id)
    {
        return $this->serviceProviderService->assignRequest($id, $request->service_provider_id);
    }


}
