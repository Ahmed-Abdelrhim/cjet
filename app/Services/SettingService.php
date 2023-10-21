<?php

namespace App\Services;

use App\Models\Setting;
use App\Repositories\Interfaces\SettingRepositoryInterface;
use App\Services\Interfaces\SettingServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Str;


class SettingService implements SettingServiceInterface
{
    use ResponseTrait, UploadTrait;

    private $settingRepository;

    public function __construct(SettingRepositoryInterface $settingRepository)
    {
        $this->settingRepository = $settingRepository;
    }


    public function all()
    {
        return $this->success200($this->settingRepository->all());
    }

    public function associative()
    {
        return $this->success200($this->settingRepository->associative());
    }


    public function group()
    {
        return $this->success200($this->settingRepository->group());
    }

    public function update(array $data)
    {
        $data = $this->uploadImages($data);
        $this->settingRepository->update($data);
        return $this->success202();
    }


    private function uploadImages(array $data)
    {
        foreach ($data as $key => $value) {
            if (Str::contains($key, ['image', 'icon', 'logo'])) {
                is_file($data[$key]) ?  $data[$key] = $this->upload($value, Setting::IMAGE_PATH) : null;
            }
        }
        return $data;
    }
}
