<?php

namespace App\Repositories\Eloquent;

use App\Models\Admin;
use App\Repositories\Interfaces\AdminRepositoryInterface;

class AdminRepository implements AdminRepositoryInterface
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
    public function __construct(Admin $model)
    {
        $this->model = $model;
    }

    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->find($id);
    }


    public function update(array $data,int $id)
    {
        return $this->model
        ->find($id)
        ->update($data);
    }


    public function getWhereFirst(array $data)
    {
        return $this->model
            ->where($data)
            ->first();
    }
}
