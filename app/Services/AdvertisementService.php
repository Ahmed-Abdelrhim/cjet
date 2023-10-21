<?php

namespace App\Services;

use App\Models\Advertisement;
use App\Repositories\Interfaces\AdvertisementRepositoryInterface;
use App\Services\Interfaces\AdminServiceInterface;
use App\Services\Interfaces\AdvertisementServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Auth;
use App\Models\Service;
use App\Models\Package;


class AdvertisementService implements AdvertisementServiceInterface
{
    use ResponseTrait, UploadTrait;

    private $advertisementRepository;

    public function __construct(AdvertisementRepositoryInterface $advertisementRepository)
    {
        $this->advertisementRepository = $advertisementRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200($this->advertisementRepository->allWithDetails());
    }

    private function getAdvertiseableType($type)
    {
        if ($type == 'services') {
            return Service::class;
        } else {
            return Package::class;
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $data['image_en'] = $this->upload($data['image_en'], Advertisement::IMAGE_PATH);
        $data['image_ar'] = $this->upload($data['image_ar'], Advertisement::IMAGE_PATH,);

        $data['advertiseable_type'] = $this->getAdvertiseableType($data['type']);
        return $this->success201($this->advertisementRepository->create($data));
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->advertisementRepository->show($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $row = $this->advertisementRepository->show($id);

        if (isset($data['image_en']) && is_file($data['image_en'])) {
            $data['image_en'] = $this->updateFile($data['image_en'], Advertisement::IMAGE_PATH, $row->image_en);
        }

        if (isset($data['image_ar']) && is_file($data['image_ar'])) {
            $data['image_ar'] = $this->updateFile($data['image_ar'], Advertisement::IMAGE_PATH, $row->image_ar);
        }

        $data['advertiseable_type'] = $this->getAdvertiseableType($data['type']);

        $this->advertisementRepository->update($data, $id);
        return $this->success202();
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $row = $this->advertisementRepository->show($id);
        $this->advertisementRepository->destroy($id);
        $this->deleteFile($row->image_en);
        $this->deleteFile($row->image_ar);
        return $this->success202();
    }


    public function active($is_active, int $id)
    {
        $this->advertisementRepository->update(['is_active' => $is_active], $id);
        return $this->success202();
    }
}
