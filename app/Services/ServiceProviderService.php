<?php

namespace App\Services;

use App\Exports\ServiceProvidersExport;
use App\Http\Resources\Dashboard\ServiceProviderAssignListResource;
use App\Http\Resources\Dashboard\ServiceProviderExportListResource;
use App\Models\ServiceProvider;
use App\Notifications\NewAssignedTask;
use App\Repositories\Interfaces\ServiceProviderRepositoryInterface;
use App\Services\Interfaces\ServiceProviderServiceInterface;
use App\Http\Resources\Dashboard\ServiceProviderListResource;
use App\Http\Resources\Dashboard\ServiceProviderMinimumListResource;
use App\Http\Resources\Dashboard\ServiceProviderScheduleListResource;
use App\Http\Resources\Dashboard\UserExportListResource;
use App\Models\UserPurchaseRequest;
use App\Models\UserPurchaseSchedule;
use App\Notifications\BookingRescheduled;
use App\Notifications\RequestConfirmed;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Maatwebsite\Excel\Excel;

class ServiceProviderService implements ServiceProviderServiceInterface
{
    use ResponseTrait, UploadTrait;

    private $serviceProviderRepository;
    private $userPurchaseSchedulesRepository;
    private $userPurchaseRequestRepository;

    public function __construct(
        ServiceProviderRepositoryInterface $serviceProviderRepository,
        UserPurchaseScheduleRepositoryInterface $userPurchaseSchedulesRepository,
        UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository
    ) {
        $this->serviceProviderRepository = $serviceProviderRepository;
        $this->userPurchaseSchedulesRepository = $userPurchaseSchedulesRepository;
        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
    }

    private function handleUploadImages(array &$data)
    {
        (isset($data['image'])) ? $data['image'] = $this->uploadWithResize($data['image'], ServiceProvider::IMAGE_PATH, 512, 512) : null;
        (isset($data['national_id_image'])) ? $data['national_id_image'] = $this->upload($data['national_id_image'], ServiceProvider::IMAGE_PATH, 1500, 1500) : null;
    }




    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200(ServiceProviderListResource::collection($this->serviceProviderRepository->all())
            ->response()
            ->getData(true));
    }


    /**
     * Display a paginated listing of the resource.
     */
    public function paginate()
    {
        return $this->success200(ServiceProviderListResource::collection($this->serviceProviderRepository->paginate())
            ->response()
            ->getData(true));
    }



    /**
     * Display a listing of the resource.
     */
    public function select()
    {
        return $this->success200(ServiceProviderMinimumListResource::collection($this->serviceProviderRepository->all()));
    }


    public function filter($filter, $sort, $paginate = 1)
    {
        return $this->success200(ServiceProviderListResource::collection($this->serviceProviderRepository
            ->filter($filter, $sort, $paginate))
            ->response()
            ->getData(true));
    }

    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->success200(ServiceProviderListResource::collection($this->serviceProviderRepository->allWithDetails()));
    }



    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $compounds = $data['compounds'];
        unset($data['compounds']);

        $this->handleUploadImages($data);
        $service_provider = $this->serviceProviderRepository->create($data);
        $service_provider->compounds()->sync($compounds);
        $service_provider_with_details = $this->serviceProviderRepository->show($service_provider->id);
        return $this->success201($service_provider_with_details);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->serviceProviderRepository->show($id));
    }


    /**
     * Display the specified resource.
     */
    public function activeSchedules(int $id, $paginate = 0)
    {
        return $this->success200(ServiceProviderScheduleListResource::collection($this->userPurchaseSchedulesRepository->getServiceProviderActiveSchedules($id, $paginate))
            ->response()
            ->getData(true));

        // return $this->success200($this->userPurchaseSchedulesRepository->getServiceProviderActiveSchedules($id, $paginate));
    }


    /**
     * Display the specified resource.
     */
    public function completedSchedules(int $id, $paginate = 0)
    {

        return $this->success200(ServiceProviderScheduleListResource::collection($this->userPurchaseSchedulesRepository->getServiceProviderCompletedSchedules($id, $paginate))
            ->response()
            ->getData(true));
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $compounds = $data['compounds'];
        unset($data['compounds']);

        $this->handleUploadImages($data);
        $this->serviceProviderRepository->updateWithDetails($data, $compounds, $id);
        $service_provider_updated = $this->serviceProviderRepository->show($id);
        return $this->success201($service_provider_updated);
    }





    public function active($is_active, int $id)
    {
        if ($is_active == 0) {
            $service_provider = $this->serviceProviderRepository->show($id);
            if ($service_provider->schedules->count() > 0) {
                $error_message = 'Service provider has active schedules please re-assign his tasks.';
                return $this->error422(['is_active' => [$error_message]], $error_message);
            }
        }

        $this->serviceProviderRepository->update(['is_active' => $is_active], $id);
        return $this->success202();
    }

    public function export(array $ids = null, array $filter_array = null)
    {
        $file_data = $this->getExcelData($ids, $filter_array);
        ob_end_clean(); //for generating excel XLSX
        ob_start(); //for generating excel XLSX
        return (new ServiceProvidersExport(ServiceProviderExportListResource::collection($file_data)))->download('service_providers.xlsx', Excel::XLSX);
    }

    private function getExcelData(array $ids = null, array $filter_array = null)
    {
        if ($ids) {
            return $this->serviceProviderRepository->getWhereInIDs($ids);
        } else if ($filter_array) {
            return $this->serviceProviderRepository->filter($filter_array['filter'],  $filter_array['sort'], 0);
        } else {
            return $this->serviceProviderRepository->all();
        }
    }




    public function available($is_available, int $id)
    {
        $this->serviceProviderRepository->update(['is_available' => $is_available], $id);
        return $this->success202();
    }

    public function searchSchedules(int $service_provider_id, $from, $to, $status, $compound_id = null, $paginate = 1)
    {
        return $this->success200(ServiceProviderScheduleListResource::collection(
            $this->userPurchaseSchedulesRepository->searchServiceProviderSchedules($service_provider_id, $from, $to, $status, $compound_id, $paginate))
            ->response()
            ->getData(true));
    }


    public function getRequestAvailableServiceProviders(int $user_purchase_request_id)
    {
        $user_purchase_request = $this->userPurchaseRequestRepository->getWithDetails($user_purchase_request_id);
        return $this->success200(ServiceProviderAssignListResource::collection($this->serviceProviderRepository->getAllWhereCompound(
            $user_purchase_request->address->compound_id,
            $user_purchase_request->service_provider_id
        )));
    }

    public function getAssignRequestAvailableServiceProviders(int $user_purchase_request_id)
    {
        $user_purchase_request = $this->userPurchaseRequestRepository->getWithDetails($user_purchase_request_id);
        return $this->success200(ServiceProviderAssignListResource::collection($this->serviceProviderRepository->getAssignAllWhereCompound(
            $user_purchase_request->address->compound_id,
        )));
    }


    public function getReassignRequestAvailableServiceProviders(int $user_purchase_request_id)
    {
        $user_purchase_request = $this->userPurchaseRequestRepository->getWithDetails($user_purchase_request_id);
        return $this->success200(ServiceProviderAssignListResource::collection($this->serviceProviderRepository->getReassignAllWhereCompound(
            $user_purchase_request->address->compound_id,
            $user_purchase_request->service_provider_id
        )));
    }


    public function getScheduleAvailableServiceProviders(int $user_purchase_schedule_id)
    {
        $user_purchase_schedule = $this->userPurchaseSchedulesRepository->getWithDetails($user_purchase_schedule_id);
        return $this->success200(ServiceProviderAssignListResource::collection($this->serviceProviderRepository->getAllWhereCompound(
            $user_purchase_schedule->user_purchase_request->address->compound_id,
            $user_purchase_schedule->service_provider_id
        )));
    }


    public function getAssignScheduleAvailableServiceProviders(int $user_purchase_schedule_id)
    {
        $user_purchase_schedule = $this->userPurchaseSchedulesRepository->getWithDetails($user_purchase_schedule_id);
        return $this->success200(ServiceProviderAssignListResource::collection($this->serviceProviderRepository->getAssignAllWhereCompound(
            $user_purchase_schedule->user_purchase_request->address->compound_id
        )));
    }


    public function getReassignScheduleAvailableServiceProviders(int $user_purchase_schedule_id)
    {
        $user_purchase_schedule = $this->userPurchaseSchedulesRepository->getWithDetails($user_purchase_schedule_id);
        return $this->success200(ServiceProviderAssignListResource::collection($this->serviceProviderRepository->getReassignAllWhereCompound(
            $user_purchase_schedule->user_purchase_request->address->compound_id,
            $user_purchase_schedule->service_provider_id
        )));
    }



    public function assignRequest(int $user_purchase_request_id, int $service_provider_id)
    {
        $data = [
            'service_provider_id' => $service_provider_id,
            'status' => 'inprogress',
            'assigned_at' => now(),
        ];
        $this->userPurchaseRequestRepository->update($data, $user_purchase_request_id);
        $this->userPurchaseSchedulesRepository->updateWhereAll(['user_purchase_request_id' => $user_purchase_request_id], $data);
        $UserPurchaseRequest = UserPurchaseRequest::find( $user_purchase_request_id);
        //CHECK FOR USER MAIL IF EXISTS AND IF IT HAS A VALUE
        if (isset($UserPurchaseRequest->user->email) and !empty($UserPurchaseRequest->user->email)) {
            $UserPurchaseRequest->user->notify(new RequestConfirmed($UserPurchaseRequest));
        }
        return $this->success202();
    }


    public function assignSchedule(int $user_purchase_schedule_id, int $service_provider_id)
    {
        $data = [
            'service_provider_id' => $service_provider_id,
            'status' => 'inprogress',
            'assigned_at' => now(),
        ];
        $this->userPurchaseSchedulesRepository->update($data, $user_purchase_schedule_id);
        return $this->success202();
    }


    private function handleRescheduledNewUserScheduleData($user_purchase_schedule, $service_provider_id)
    {
        return [
            'user_id' =>  $user_purchase_schedule->user_id,
            'user_purchase_request_id' =>  $user_purchase_schedule->user_purchase_request_id,
            'user_purchase_reference' =>  $user_purchase_schedule->user_purchase_reference,
            'scheduled_at' =>  $user_purchase_schedule->rescheduled_at,
            'reschedule_maximum_date' =>  $user_purchase_schedule->reschedule_maximum_date,
            'service_provider_id' => $service_provider_id,
            'assigned_at' => now(),
            'status' => 'inprogress',
        ];
    }
    public function assignRescheduledSchedule(int $user_purchase_schedule_id, int $service_provider_id)
    {
        $user_purchase_schedule = $this->userPurchaseSchedulesRepository->show($user_purchase_schedule_id);
        $add_schedule_new_data = $this->handleRescheduledNewUserScheduleData($user_purchase_schedule, $service_provider_id);
        $this->userPurchaseSchedulesRepository->create($add_schedule_new_data);
        $this->userPurchaseSchedulesRepository->update(['is_reschedule_handled' => 1], $user_purchase_schedule_id);
        $UserPurchaseRequest = UserPurchaseSchedule::find( $user_purchase_schedule_id);

        // NOTIFY USER WHEN Booking Rescheduled
        if (isset($UserPurchaseRequest->user->email) and !empty($UserPurchaseRequest->user->email)){
            $UserPurchaseRequest->user->notify(new BookingRescheduled($UserPurchaseRequest));
        }

        return $this->success202();
    }

    public function assignInprogressSchedule(int $user_purchase_schedule_id, int $service_provider_id)
    {
        $data = [
            'service_provider_id' => $service_provider_id,
            'status' => 'inprogress',
            'assigned_at' => now(),
        ];
        $purchaseRequest =  $this->userPurchaseSchedulesRepository->update($data, $user_purchase_schedule_id);
        // NOTIFY USER
        if(isset($purchaseRequest->user->email) and !empty($purchaseRequest->user->email)){
            $purchaseRequest->user->notify(new NewAssignedTask($purchaseRequest));
        }

        return $this->success202();
    }


    public function reassignSchedules(array $ids, int $service_provider_id)
    {
        $data = [
            'service_provider_id' => $service_provider_id,
            'status' => 'inprogress',
            'assigned_at' => now(),
        ];

        $this->userPurchaseSchedulesRepository->updateWhereInAll($ids, $data);
        return $this->success202();
    }
}
