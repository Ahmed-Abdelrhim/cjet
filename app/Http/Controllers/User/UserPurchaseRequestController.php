<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserPurchasePackageValidateRequest;
use App\Http\Requests\User\UserPurchaseServiceValidateRequest;
use App\Http\Requests\User\UserPurchasePackageValidateSelectedDaysAndStartFromRequest;
use App\Http\Requests\User\UserPurchaseServiceValidateDatePriceRequest;
use App\Services\Interfaces\UserPurchaseRequestServiceInterface;
use App\Traits\ResponseTrait;
use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Http\Request;

class UserPurchaseRequestController extends Controller
{
    use ResponseTrait;

    private $userPurchaseRequestService;

    public function __construct(UserPurchaseRequestServiceInterface $userPurchaseRequestService)
    {
        $this->userPurchaseRequestService = $userPurchaseRequestService;
    }


    public function packageDaysValidation(UserPurchasePackageValidateSelectedDaysAndStartFromRequest $request)
    {
        return $this->success200();
    }

    public function serviceDaysValidation(UserPurchaseServiceValidateDatePriceRequest $request)
    {
        return $this->success200();
    }


    public function package(UserPurchasePackageValidateRequest $request)
    {
        $user_active_packages = $this->userPurchaseRequestService->getUserActivePackageSubscriptionWhere(auth('sanctum')->id(), $request->user_car_id);
        // check if collection is not empty return error


        if (!($user_active_packages->isEmpty())) {
            return $this->error422(['user_car_id' => [trans('custom.user_car_active_package_validation')]],  trans('custom.user_car_active_package_validation'));
        }
        return $this->userPurchaseRequestService->package($request->validated());
    }


    public function service(UserPurchaseServiceValidateRequest $request)
    {
        // if user selected same service with same car with same date return error
        foreach ($request->services as $service) {
            $user_active_service = $this->userPurchaseRequestService
                ->getUserActiveServiceSubscriptionWhere(
                    auth('sanctum')->id(),
                    $request->user_car_id,
                    $service['service_id'],
                    $service['selected_date']
                );

            if (!($user_active_service->isEmpty())) {
                return $this->error422(['user_car_id' => [trans('custom.user_car_active_service_validation')]],  trans('custom.user_car_active_service_validation'));
            }
        }

        return $this->userPurchaseRequestService->service($request->validated());
    }


    private function handlePackagePurchase(UserPurchasePackageValidateRequest $request)
    {
        return $this->userPurchaseRequestService->package($request->validated());
    }

    private function handleServicePurchase(UserPurchaseServiceValidateRequest $request)
    {
        return $this->userPurchaseRequestService->service($request->validated());
    }
}
