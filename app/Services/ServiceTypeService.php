<?php

namespace App\Services;

use App\Models\ServiceType;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Repositories\Interfaces\ServiceTypeRepositoryInterface;
use App\Services\Interfaces\AdminServiceInterface;
use App\Services\Interfaces\ServiceTypeServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Auth;



class ServiceTypeService implements ServiceTypeServiceInterface
{
    use ResponseTrait, UploadTrait;

    private $serviceTypeRepository;
    private $serviceRepository;

    public function __construct(
        ServiceTypeRepositoryInterface $serviceTypeRepository,
        ServiceRepositoryInterface $serviceRepository
    ) {
        $this->serviceTypeRepository = $serviceTypeRepository;
        $this->serviceRepository = $serviceRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200($this->serviceTypeRepository->all());
    }


    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->success200($this->serviceTypeRepository->allWithDetails());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $data['image_en'] = $this->upload($data['image_en'], ServiceType::IMAGE_PATH);
        $data['image_ar'] = $this->upload($data['image_ar'], ServiceType::IMAGE_PATH);

        // $data['image_en'] = $this->uploadWithResize($data['image_en'], ServiceType::IMAGE_PATH, 36, 36);
        // $data['image_ar'] = $this->uploadWithResize($data['image_ar'], ServiceType::IMAGE_PATH, 36, 36);

        return $this->success201($this->serviceTypeRepository->create($data));
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->serviceTypeRepository->show($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $row = $this->serviceTypeRepository->showWithDetails($id);

        if (isset($data['image_en']) && is_file($data['image_en'])) {
            $data['image_en'] = $this->updateFile($data['image_en'], ServiceType::IMAGE_PATH, $row->image_en);
            // $data['image_en'] = $this->updateWithResize($data['image_en'], ServiceType::IMAGE_PATH, $row->image_en, 36, 36);
        }

        if (isset($data['image_ar']) && is_file($data['image_ar'])) {
            $data['image_ar'] = $this->updateFile($data['image_ar'], ServiceType::IMAGE_PATH, $row->image_ar);
            // $data['image_ar'] = $this->updateWithResize($data['image_ar'], ServiceType::IMAGE_PATH, $row->image_ar, 36, 36);
        }

        $this->serviceTypeRepository->update($data, $id);

        $this->handleIsActive($data['is_active'], $row);

        return $this->success202();
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $this->serviceTypeRepository->destroy($id);
        return $this->success202();
    }

    public function active($is_active, int $id)
    {
        $row = $this->serviceTypeRepository->showWithDetails($id);
        $this->handleIsActive($is_active, $row);
        $this->serviceTypeRepository->update(['is_active' => $is_active], $id);
        return $this->success202();
    }

    private function handleIsActive($is_active, $service_type)
    {
        if ($is_active == 0 && ($is_active != $service_type->is_active)) {
            foreach ($service_type->services as $service) {
                $this->serviceRepository->update(['is_active' => 0], $service->id);
            }
        }
    }
}
