<?php

namespace App\Repositories\Eloquent;

use App\Models\Setting;
use App\Repositories\Interfaces\SettingRepositoryInterface;

class SettingRepository implements SettingRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * Repository constructor.
     *
     * @param  $model
     */
    public function __construct(Setting $model)
    {
        $this->model = $model;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->model
            ->all();
    }

    /**
     * Display a listing of the resource.
     */
    public function associative()
    {
        return $this->model
            ->pluck('value', 'key')
            ->toArray();
    }



    public function getWhereKey(string $key)
    {
        return $this->model
            ->where('key', $key)
            ->first();
    }


    public function getWhereAll(array $data)
    {
        return $this->model
            ->where($data)
            ->get();
    }


    public function group()
    {
        return $this->model
            ->get()
            ->groupBy('type');
    }


    public function update(array $data)
    {
        foreach ($data as $key => $value) {
            $this->model
                ->where('key', $key)
                ->update(['value' => $value]);
        }
    }
}
