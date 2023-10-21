<?php

namespace App\Services;

use App\Models\Setting;
use App\Repositories\Interfaces\SettingRepositoryInterface;
use App\Services\Interfaces\DimensionsServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Str;
use stdClass;

class DimensionsService implements DimensionsServiceInterface
{
    use ResponseTrait;


    public function dimensions()
    {

        $data = [
            'service_types_details' => $this->getServicesDimensions(),
            'service_types' => $this->getServiceTypesDimensions(),
            'advertisements' => $this->getAdvertisementsDimensions(),
        ];

        return $this->success200($data);
    }
    
    private function getServiceTypesDimensions()
    {
        $obj = new stdClass;
        $obj->image_en = 'Please upload image of size 36 x 36';
        $obj->image_ar = 'Please upload image of size 36 x 36';
        return $obj;
    }

    private function getServicesDimensions()
    {
        $obj = new stdClass;
        $obj->image_en = 'Please upload image of size  327 x 182';
        $obj->image_ar = 'Please upload image of size  327 x 182';
        return $obj;
    }

    private function getAdvertisementsDimensions()
    {
        $obj = new stdClass;
        $obj->image_en = 'Please upload image of size 327 x 156';
        $obj->image_ar = 'Please upload image of size 327 x 156';
        return $obj;
    }
}
