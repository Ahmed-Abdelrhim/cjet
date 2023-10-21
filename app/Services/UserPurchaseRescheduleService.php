<?php

namespace App\Services;

use App\Models\Package;
use App\Models\User;
use App\Repositories\Interfaces\UserPurchasePriceOptionRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Services\Interfaces\UserPurchaseRescheduleServiceInterface;
use App\Traits\ResponseTrait;
use Carbon\Carbon;
use Illuminate\Support\Facades\Date;

class UserPurchaseRescheduleService implements UserPurchaseRescheduleServiceInterface
{
    use ResponseTrait;

    private $userPurchaseScheduleRepository;
    private $userPurchaseRequestRepository;
    private $userPurchasePriceOptionRepository;


    public function __construct(
        UserPurchaseScheduleRepositoryInterface $userPurchaseScheduleRepository,
        UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository,
        UserPurchasePriceOptionRepositoryInterface $userPurchasePriceOptionRepository
    ) {
        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
        $this->userPurchaseScheduleRepository = $userPurchaseScheduleRepository;
        $this->userPurchasePriceOptionRepository = $userPurchasePriceOptionRepository;
    }




    private function getUpdatedUserScheduleData($reschedule_to)
    {
        return [
            'actionable_id' => auth('sanctum')->id(),
            'actionable_type' => User::class,
            'status' => 'rescheduled',
            'rescheduled_at' => $reschedule_to,
        ];
    }

    // private function getNewUserScheduleData($user_purchase_schedule, $reschedule_to)
    // {
    //     return [
    //         'user_id' =>  $user_purchase_schedule->user_id,
    //         'user_purchase_request_id' =>  $user_purchase_schedule->user_purchase_request_id,
    //         'user_purchase_reference' =>  $user_purchase_schedule->user_purchase_reference,
    //         'scheduled_at' =>  $reschedule_to,
    //         'reschedule_maximum_date' =>  $user_purchase_schedule->reschedule_maximum_date,
    //         'status' => 'pending',
    //     ];
    // }





    public function reschedule($reschedule_to, int $id)
    {
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->show($id);
        $user_purchase_request = $user_purchase_schedule->user_purchase_request;

        if ($reschedule_to > $user_purchase_schedule->reschedule_maximum_date) {
            return $this->error422(
                trans('custom.reschedule_to_error_exceed') . $user_purchase_schedule->reschedule_maximum_date,
                trans('custom.reschedule_to_error_exceed') . $user_purchase_schedule->reschedule_maximum_date
            );
        } else if ($reschedule_to < date('Y-m-d')) {
            return $this->error422(
                trans('custom.reschedule_to_error_less') . date('d-m-Y'),
                trans('custom.reschedule_to_error_less') . date('d-m-Y')
            );
        }
        
        if ($user_purchase_request->purchaseable_type == Package::class) {
            $userPurchaseSchedulesArray = $this->userPurchaseScheduleRepository
                ->getWhereAll([
                    'user_purchase_request_id' => $user_purchase_schedule->user_purchase_request_id,
                ])->pluck('scheduled_at')->toArray();
            if (in_array($reschedule_to, $userPurchaseSchedulesArray)) {
                return $this->error422(
                    trans('custom.reschedule_to_error_has_schedule'),
                    trans('custom.reschedule_to_error_has_schedule')
                );
            }
        }

        $update_schedule_data = $this->getUpdatedUserScheduleData($reschedule_to);
        $this->userPurchaseScheduleRepository->update($update_schedule_data, $user_purchase_schedule->id);
        // $add_schedule_new_data = $this->getNewUserScheduleData($user_purchase_schedule, $reschedule_to);
        // $this->userPurchaseScheduleRepository->create($add_schedule_new_data);

        return $this->success200();
    }


    public function scheduledDays(int $id)
    {
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->show($id);

        $userPurchaseSchedulesArray = $this->userPurchaseScheduleRepository
            ->getWhereAll(['user_purchase_request_id' => $user_purchase_schedule->user_purchase_request_id])
            ->pluck('scheduled_at')->toArray();
        return $this->success200($userPurchaseSchedulesArray);
    }
}
