<?php

namespace App\Services;

use App\Http\Resources\Dashboard\UserPurchaseScheduleSingleDetailsResource;
use App\Http\Resources\User\BookingScheduleSingleResource;
use App\Http\Resources\User\BookingSchedulesListResource;
use App\Models\Package;
use App\Models\User;
use App\Models\UserPurchaseRequest;
use App\Models\UserPurchaseSchedule;
use App\Notifications\BookingRefunded;
use App\Repositories\Interfaces\InvoiceRepositoryInterface;
use App\Repositories\Interfaces\InvoiceUserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\ServiceProviderRepositoryInterface;
use App\Repositories\Interfaces\SettingRepositoryInterface;
use App\Repositories\Interfaces\UserPurchasePriceOptionRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Services\Interfaces\UserPurchaseScheduleServiceInterface;
use App\Traits\ResponseTrait;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\Date;

class UserPurchaseScheduleService implements UserPurchaseScheduleServiceInterface
{
    use ResponseTrait;

    private $working_hours;
    private $settingRepository;
    private $userPurchaseScheduleRepository;
    private $userPurchaseRequestRepository;
    private $userPurchasePriceOptionRepository;
    private $serviceProviderRepository;
    private $invoiceRepository;
    private $invoiceUserPurchaseRequestRepository;



    public function __construct(
        SettingRepositoryInterface $settingRepository,
        UserPurchaseScheduleRepositoryInterface $userPurchaseScheduleRepository,
        UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository,
        UserPurchasePriceOptionRepositoryInterface $userPurchasePriceOptionRepository,
        ServiceProviderRepositoryInterface $serviceProviderRepository,
        InvoiceRepositoryInterface $invoiceRepository,
        InvoiceUserPurchaseRequestRepositoryInterface $invoiceUserPurchaseRequestRepository
    ) {
        $this->settingRepository = $settingRepository;
        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
        $this->userPurchaseScheduleRepository = $userPurchaseScheduleRepository;
        $this->serviceProviderRepository = $serviceProviderRepository;
        $this->userPurchasePriceOptionRepository = $userPurchasePriceOptionRepository;
        $this->invoiceRepository = $invoiceRepository;
        $this->invoiceUserPurchaseRequestRepository = $invoiceUserPurchaseRequestRepository;
        // $this->working_hours = $this->settingRepository->getWhereKey('working_hours_' .  app()->getLocale())->value ?? '';
    }


    public function schedules()
    {
        $user_id = auth('sanctum')->id();
        $data = [
            'upcoming' => BookingSchedulesListResource::collection($this->userPurchaseScheduleRepository->getUpcomingUserSchedules($user_id)),
            'rescheduled' => BookingSchedulesListResource::collection($this->userPurchaseScheduleRepository->getRescheduleUserSchedules($user_id)),
            'past' => BookingSchedulesListResource::collection($this->userPurchaseScheduleRepository->getPastUserSchedules($user_id)),
        ];
        return $this->success200($data);
    }


    public function show(int $id)
    {
        $data = [
            'working_hours' => $this->settingRepository->getWhereKey('working_hours_' .  app()->getLocale())->value ?? ' ',
            'booking_schedule_data' => new BookingScheduleSingleResource($this->userPurchaseScheduleRepository->show($id)),
        ];
        return $this->success200($data);
    }


    private function getServicePrice($user_purchase_price_options)
    {
        return array_sum(array_column($user_purchase_price_options->toArray(), 'price'));
    }


    public function cancel(int $id)
    {
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->show($id);
        $user_purchase_request = $user_purchase_schedule->user_purchase_request;

        $updated_data = [
            'actionable_id' => auth('sanctum')->id(),
            'actionable_type' => User::class,
            'status' => 'cancelled',
            'cancelled_at' => now(),
        ];
        if ($user_purchase_request->purchaseable_type == Package::class) {
            $updated_data['refund_status'] = 'non_refundable';
            $this->userPurchaseScheduleRepository->update($updated_data, $id);
     } else {
            $updated_data['refund_status'] = 'pending';
            $this->userPurchaseScheduleRepository->update($updated_data, $id);
            $this->userPurchaseRequestRepository->update($updated_data, $user_purchase_request->id);
            $invoice = $this->invoiceRepository->create([
                'user_id' => $user_purchase_request->user_id,
                'purchaseable_type' => $user_purchase_request->purchaseable_type,
                'invoice_reference_number' => $user_purchase_request->invoice_reference_number,
                'amount' => empty($user_purchase_request->user_purchase_price_options->toArray()) ? $user_purchase_request->price : $this->getServicePrice($user_purchase_request->user_purchase_price_options),
                'invoice_type' => 'refund',
            ]);
            $this->invoiceUserPurchaseRequestRepository->create([
                'invoice_id' => $invoice->id,
                'user_purchase_request_id' => $user_purchase_request->id,
            ]);
            // TO DO: HANDLE REFUND LOGIC ***
            $UserPurchaseSchedule=UserPurchaseRequest::find( $id);
            $UserPurchaseSchedule->user->notify(new BookingRefunded($UserPurchaseSchedule)); 
        }

        return $this->success200();
    }


    private function getUpdatedCommonUserScheduleData()
    {
        return [
            'actionable_id' => auth('sanctum')->id(),
            'actionable_type' => User::class,
            'status' => 'rescheduled',
        ];
    }

    private function getNewCommonScheduleData($user_purchase_request, $reschedule_to)
    {
        return [
            'user_id' =>  $user_purchase_request->user_id,
            'user_purchase_request_id' =>  $user_purchase_request->id,
            'user_purchase_reference' =>  $user_purchase_request->user_purchase_reference,
            'scheduled_at' =>  $reschedule_to,
            'reschedule_maximum_date' =>  $user_purchase_request->reschedule_maximum_date,
            'status' => 'pending',
        ];
    }
    private function handleReschedulePackage($user_purchase_schedule)
    {
        $update_schedule_old_data = $this->getUpdatedCommonUserScheduleData();
        $this->userPurchaseScheduleRepository->update($update_schedule_old_data, $user_purchase_schedule->id);
    }

    private function handleAddNewRescheduledPackage($user_purchase_request, $reschedule_to)
    {
        $add_schedule_new_data = $this->getNewCommonScheduleData($user_purchase_request, $reschedule_to);
        $this->userPurchaseScheduleRepository->create($add_schedule_new_data);
    }


    private function handleRescheduleService($user_purchase_schedule)
    {
        $update_request_old_data = [
            'actionable_id' => auth('sanctum')->id(),
            'actionable_type' => User::class,
            'status' => 'rescheduled',
        ];

        $update_schedule_old_data = $this->getUpdatedCommonUserScheduleData();
        $this->userPurchaseRequestRepository->update($update_request_old_data, $user_purchase_schedule->user_purchase_request->id);
        $this->userPurchaseScheduleRepository->update($update_schedule_old_data, $user_purchase_schedule->id);
    }

    private function handleAddNewRescheduledService($user_purchase_schedule, $reschedule_to)
    {
        $add_request_new_data = [
            'user_id' =>  $user_purchase_schedule->user_id,
            'user_purchase_request_id' =>  $user_purchase_schedule->user_purchase_request_id,
            'user_purchase_reference' =>  $user_purchase_schedule->user_purchase_reference,
            'scheduled_at' =>  $reschedule_to,
            'reschedule_maximum_date' =>  $user_purchase_schedule->reschedule_maximum_date,
            'status' => 'pending',
        ];

        $user_purchase_request = $this->userPurchaseRequestRepository->create($add_request_new_data);
        $add_schedule_new_data = $this->getNewCommonScheduleData($user_purchase_request, $reschedule_to);
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->create($add_schedule_new_data);
    }



    public function reschedule(Date $reschedule_to, int $id)
    {
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->show($id);

        if ($user_purchase_schedule->user_purchase_request->purchaseable_type == Package::class) {
            $this->handleReschedulePackage($user_purchase_schedule);
            $this->handleAddNewRescheduledPackage($user_purchase_schedule, $reschedule_to);
        } else {
            $this->handleRescheduleService($user_purchase_schedule);
            $this->handleAddNewRescheduledService($user_purchase_schedule, $reschedule_to);
        }

        return $this->success200();
    }


    public function updateRating(int $rate, int $id)
    {
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->show($id);
        if ($user_purchase_schedule->service_rate) {
            return $this->error422(trans('custom.service_rate_validation'), trans('custom.service_rate_validation'));
        }
        if (is_null($user_purchase_schedule->service_provider_id)) {
            return $this->error422(trans('custom.general_error'), trans('custom.general_error'));
        }
        $this->userPurchaseScheduleRepository->update(['service_rate' => $rate], $id);
        $rating = $this->userPurchaseScheduleRepository->calculateServiceProviderAverageRating($user_purchase_schedule->service_provider_id);
        $this->serviceProviderRepository->update(['rating' => $rating], $user_purchase_schedule->service_provider_id);
        $this->serviceProviderRepository->incrementRatingCount($user_purchase_schedule->service_provider_id);
        return $this->success200();
    }



    private function getPackageDays($start_date, $end_date, array $selected_days)
    {
        $start_date = Carbon::parse($start_date);
        $end_date = Carbon::parse($end_date);
        $date_range = CarbonPeriod::create($start_date, $end_date);

        $schedule_array = [];
        foreach ($date_range as $date) {
            $date->setLocale('en');
            if (in_array($date->dayName, $selected_days)) {
                $schedule_array[] = $date;
            }
        }
        return $schedule_array;
    }

    public function handlePackageSchedules($user_purchase_request)
    {
        $array_days = $this->getPackageDays(
            $user_purchase_request->start_date,
            $user_purchase_request->end_date,
            Str::of($user_purchase_request->selected_days)->explode(',')->toArray()
        );

        $user_purchase_schedules_array = [];
        foreach ($array_days as $day) {
            $data = [];
            $data['user_purchase_request_id'] =   $user_purchase_request->id;
            $data['user_id'] = $user_purchase_request->user_id;
            $data['user_purchase_reference'] = $user_purchase_request->user_purchase_reference;
            $data['status'] = 'pending';
            $data['scheduled_at'] =  $day;
            $data['reschedule_maximum_date'] =   $user_purchase_request->end_date;
            $data['created_at'] =  $data['updated_at'] =  now();
            array_push($user_purchase_schedules_array, $data);
        }

        $this->userPurchaseScheduleRepository->insert($user_purchase_schedules_array);
    }




    public function handleServiceSchedules($user_purchase_request)
    {
        $data['user_purchase_request_id'] =   $user_purchase_request->id;
        $data['user_id'] = $user_purchase_request->user_id;
        $data['user_purchase_reference'] = $user_purchase_request->user_purchase_reference;
        $data['status'] = 'pending';
        $data['scheduled_at'] = $user_purchase_request->start_date;
        $data['reschedule_maximum_date'] =  date(Carbon::parse($user_purchase_request->start_date)->addWeek(4));
        $user_purchase_schedule = $this->userPurchaseScheduleRepository->create($data);
        $this->userPurchasePriceOptionRepository->updateWhere(
            ['user_purchase_request_id' => $user_purchase_request->id],
            ['user_purchase_schedule_id' => $user_purchase_schedule->id]
        );
    }

  


    // TO BE UPDATED ACCORDING TO USER APPLICATION UI.
    public function getWithDetails(int $id)
    {
        return $this->success200(new UserPurchaseScheduleSingleDetailsResource($this->userPurchaseScheduleRepository->getWithDetails($id)));
    }
}
