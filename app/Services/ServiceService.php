<?php

namespace App\Services;

use App\Models\Service;
use App\Repositories\Interfaces\FeatureRepositoryInterface;
use App\Repositories\Interfaces\PriceOptionRepositoryInterface;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Services\Interfaces\ServiceServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;



class ServiceService implements ServiceServiceInterface
{
    use ResponseTrait, UploadTrait;

    private $serviceRepository;
    private $featureRepository;
    private $priceOptionsRepository;


    public function __construct(
        ServiceRepositoryInterface $serviceRepository,
        FeatureRepositoryInterface $featureRepository,
        PriceOptionRepositoryInterface $priceOptionsRepository
    ) {
        $this->serviceRepository = $serviceRepository;
        $this->featureRepository = $featureRepository;
        $this->priceOptionsRepository = $priceOptionsRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200($this->serviceRepository->all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        if ($data['is_price_options']) {
            $price_options = $data['price_options'];
            unset($data['price_options']);
        }

        $features = $data['features'];
        unset($data['features']);

        $data['image_en'] = $this->upload($data['image_en'], Service::IMAGE_PATH);
        $data['image_ar'] = $this->upload($data['image_ar'], Service::IMAGE_PATH,);


        $service = $this->serviceRepository->create($data);

        $this->featureRepository->createArrayService($features, $service->id);
        if ($data['is_price_options']) {
            $this->priceOptionsRepository->createArray($price_options, $service->id);
        }

        return $this->success201($service);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->serviceRepository->show($id));
    }

    public function active($is_active, int $id)
    {
        $this->serviceRepository->update(['is_active' => $is_active], $id);
        return $this->success202();
    }


    private function getAndHandlePriceOptions(&$data){
        $price_options = [];

        if(isset($data['price_options'])){
            $price_options = $data['price_options'];
            $data['price'] = 0 ;
            unset($data['price_options']);
        }
        return $price_options;
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $features = $data['features'];
        unset( $data['features']);

        $price_options = $this->getAndHandlePriceOptions($data);

        $row = $this->serviceRepository->show($id);


        if (isset($data['image_en']) && is_file($data['image_en'])) {
            $data['image_en'] = $this->updateFile($data['image_en'], Service::IMAGE_PATH, $row->image_en);
        }

        if (isset($data['image_ar']) && is_file($data['image_ar'])) {
            $data['image_ar'] = $this->updateFile($data['image_ar'], Service::IMAGE_PATH, $row->image_ar);
        }

        $this->serviceRepository->updateWithDetails($data, $features, $price_options, $id);

        return $this->success202();
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $row = $this->serviceRepository->show($id);
        $this->serviceRepository->updateWithDetails([], [], [], $id);
        $this->serviceRepository->destroy($id);
        $this->deleteFile($row->image_en);
        $this->deleteFile($row->image_ar);
        return $this->success202();
    }



}
