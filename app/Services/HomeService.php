<?php

namespace App\Services;

use App\Http\Resources\User\AdvertisementResource;
use App\Http\Resources\User\DaysOfWeekResource;
use App\Http\Resources\User\PackageListResource;
use App\Http\Resources\User\PackageResource;
use App\Http\Resources\User\PackageSingleResource;
use App\Http\Resources\User\ServiceSingleResource;
use App\Http\Resources\User\ServiceTypeMinimumResource;
use App\Http\Resources\User\ServiceTypesListResource;
use App\Repositories\Eloquent\AdvertisementRepository;
use App\Repositories\Interfaces\AdvertisementRepositoryInterface;
use App\Repositories\Interfaces\PackageRepositoryInterface;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Repositories\Interfaces\ServiceTypeRepositoryInterface;
use App\Repositories\Interfaces\SettingRepositoryInterface;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Services\Interfaces\HomeServiceInterface;
use App\Traits\ResponseTrait;
use stdClass;

class HomeService implements HomeServiceInterface
{
    use ResponseTrait;

    private $settingRepository;
    private $advertisementRepository;
    private $packageRepository;
    private $serviceRepository;
    private $serviceTypeRepository;
    private $userRepository;
    private $working_hours;

    public function __construct(
        SettingRepositoryInterface $settingRepository,
        AdvertisementRepositoryInterface $advertisementRepository,
        PackageRepositoryInterface $packageRepository,
        ServiceRepositoryInterface $serviceRepository,
        UserRepositoryInterface $userRepository,
        ServiceTypeRepositoryInterface $serviceTypeRepository
    ) {
        $this->settingRepository = $settingRepository;
        $this->advertisementRepository = $advertisementRepository;
        $this->packageRepository = $packageRepository;
        $this->serviceRepository = $serviceRepository;
        $this->serviceTypeRepository = $serviceTypeRepository;
        $this->userRepository = $userRepository;
        // $this->working_hours = $this->settingRepository->getWhereKey('working_hours_' .  app()->getLocale())->value ?? ' ';
    }


    public function home()
    {
        is_null(auth('sanctum')->user()) ? null : $this->userRepository->update(['last_activity_at' => now()], auth('sanctum')->id());

        $advertisements_array =  $this->advertisementRepository->allActiveWithDetails();
        $packages_array = $this->packageRepository->allActiveWithDetails();
        $service_types_array = $this->serviceTypeRepository->activeOnly();
        $data = [
            'working_hours' => $this->settingRepository->getWhereKey('working_hours_' .  app()->getLocale())->value ?? ' ',
            'advertisements' => AdvertisementResource::collection($advertisements_array) ?? null,
            'packages' => PackageResource::collection($packages_array) ?? null,
            'service_types' => ServiceTypeMinimumResource::collection($service_types_array) ?? null,
        ];

        return $this->success200($data);
    }


    public function serviceTypes()
    {
        $service_types_array = $this->serviceTypeRepository->allActiveWithDetails();
        $packages_array = $this->packageRepository->allActiveWithDetails();

        // PackageResource
        $package_resource = PackageListResource::collection($packages_array) ?? null;

        $package_object = new stdClass;
        $package_object->id = 0;
        $package_object->title = app()->getLocale() == 'ar' ? 'المجموعات' : 'Packages';
        $package_object->services = $package_resource;
        $service_types_array =  ServiceTypesListResource::collection($service_types_array) ?? [];

        $service_types_array->prepend(collect($package_object));
        $data = [
            'service_types' => $service_types_array,
        ];

        return $this->success200($data);
    }

    public function package(int $id)
    {
        $package = $this->packageRepository->show($id);
        if (!$package->is_active) {
            return $this->error422(trans('custom.not_active'), trans('custom.not_active'));
        }
        $data = [
            'working_hours' => $this->settingRepository->getWhereKey('working_hours_' .  app()->getLocale())->value ?? ' ',
            'package' => new PackageSingleResource($package)
        ];

        return $this->success200($data);
    }


    public function service(int $id)
    {
        $service = $this->serviceRepository->show($id);

        if (!$service->is_active) {
            return $this->error422(trans('custom.not_active'), trans('custom.not_active'));

        }
        $data = [
            'working_hours' => $this->settingRepository->getWhereKey('working_hours_' .  app()->getLocale())->value ?? ' ',
            'service' => $service,
            'service' => new ServiceSingleResource($service),

        ];

        return $this->success200($data);
    }

    public function daysOfWeek()
    {
        return $this->success200(DaysOfWeekResource::collection(config('days_of_week')));
        return $this->success200(config('days_of_week'));
    }
}
