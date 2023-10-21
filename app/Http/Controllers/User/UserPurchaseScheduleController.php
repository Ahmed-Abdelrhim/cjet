<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;

use App\Http\Requests\User\UserPurchaseScheduleValidateIDRequest;
use App\Http\Requests\User\UserRateServiceValidateRequest;
use App\Http\Requests\User\UserSchedulesValidateCancelRequest;
use App\Http\Requests\User\UserSchedulesValidateGetScheduledDaysRequest;
use App\Http\Requests\User\UserSchedulesValidateRescheduleRequest;
use App\Services\Interfaces\UserPurchaseRenewRequestServiceInterface;
use App\Services\Interfaces\UserPurchaseRescheduleServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleServiceInterface;
use App\Traits\ResponseTrait;

class UserPurchaseScheduleController extends Controller
{
  use ResponseTrait;

  private $userPurchaseScheduleService;
  private $userPurchaseRescheduleService;
  private $userPurchaseRenewRequestService;

  public function __construct(
    UserPurchaseScheduleServiceInterface $userPurchaseScheduleService,
    UserPurchaseRescheduleServiceInterface $userPurchaseRescheduleService,
    UserPurchaseRenewRequestServiceInterface $userPurchaseRenewRequestService
  ) {
    $this->userPurchaseScheduleService = $userPurchaseScheduleService;
    $this->userPurchaseRescheduleService = $userPurchaseRescheduleService;
    $this->userPurchaseRenewRequestService = $userPurchaseRenewRequestService;
  }


  public function schedules()
  {
    return $this->userPurchaseScheduleService->schedules();
  }

  public function show(UserPurchaseScheduleValidateIDRequest $request, $id)
  {
    return $this->userPurchaseScheduleService->show($id);
  }

  public function rate(UserRateServiceValidateRequest $request, $id)
  {
    return $this->userPurchaseScheduleService->updateRating($request->rating, $id);
  }

  public function cancel(UserSchedulesValidateCancelRequest $request, $id)
  {
    return $this->userPurchaseScheduleService->cancel($id);
  }

  public function reschedule(UserSchedulesValidateRescheduleRequest $request, $id)
  {
    return $this->userPurchaseRescheduleService->reschedule($request->reschedule_to, $id);
  }

  public function scheduledDays(UserSchedulesValidateGetScheduledDaysRequest $request, $id)
  {
    return $this->userPurchaseRescheduleService->scheduledDays( $id);
  }

  public function renew()
  {
    return $this->userPurchaseRenewRequestService->renew();
  }

  
}
