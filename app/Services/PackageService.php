<?php

namespace App\Services;

use App\Http\Resources\Dashboard\CompoundListResource;
use App\Http\Resources\Dashboard\PackageListResource;
use App\Http\Resources\Dashboard\PackageResource;
use App\Http\Resources\Dashboard\ServiceListResource;
use App\Http\Resources\Dashboard\ServiceProviderMinimumListResource;
use App\Repositories\Interfaces\CompoundRepositoryInterface;
use App\Repositories\Interfaces\FeatureRepositoryInterface;
use App\Repositories\Interfaces\PackageRepositoryInterface;
use App\Repositories\Interfaces\ServiceProviderRepositoryInterface;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Services\Interfaces\PackageServiceInterface;
use App\Traits\ResponseTrait;



class PackageService implements PackageServiceInterface
{
    use ResponseTrait;

    private $packageRepository;
    private $serviceRepository;
    private $featureRepository;
    private $compoundRepository;
    private $serviceProviderRepository;

    public function __construct(
        PackageRepositoryInterface $packageRepository,
        ServiceRepositoryInterface $serviceRepository,
        FeatureRepositoryInterface $featureRepository,
        CompoundRepositoryInterface $compoundRepository,
        ServiceProviderRepositoryInterface $serviceProviderRepository
    ) {
        $this->packageRepository = $packageRepository;
        $this->serviceRepository = $serviceRepository;
        $this->featureRepository = $featureRepository;
        $this->compoundRepository = $compoundRepository;
        $this->serviceProviderRepository = $serviceProviderRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200($this->packageRepository->all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $features = $data['features'];
        unset($data['features']);

        $package = $this->packageRepository->create($data);
        // $package->features2()->save($features);
        $this->featureRepository->createArrayPackage($features, $package->id);

        return $this->success201($package);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->packageRepository->show($id));
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $features = $data['features'];
        unset($data['features']);

        $this->packageRepository->updateWithDetails($data, $features, $id);
        return $this->success202();
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $this->packageRepository->updateWithDetails([], [], $id);
        $this->packageRepository->destroy($id);
        return $this->success202();
    }

    public function dropdowns()
    {
        $data = [
            'packages' => PackageListResource::collection($this->packageRepository->allActive()) ?? [],
            'services_single_option' => ServiceListResource::collection($this->serviceRepository->allActiveWithoutAverageOptions()) ?? [],
            'services_multiple_option' => ServiceListResource::collection($this->serviceRepository->allActiveAverageOptions()) ?? [],
            'services_all' => ServiceListResource::collection($this->serviceRepository->allActive()) ?? [],
            'compounds_active' => CompoundListResource::collection($this->compoundRepository->allActiveWithDetails()) ?? [],
            'service_providers' => ServiceProviderMinimumListResource::collection($this->serviceProviderRepository->all()) ?? [],
        ];
        return $this->success200($data);
    }


    public function active($is_active, int $id)
    {
        $this->packageRepository->update(['is_active' => $is_active], $id);
        return $this->success202();
    }
}
