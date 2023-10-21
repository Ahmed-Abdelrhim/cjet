<?php

namespace App\Repositories\Eloquent;

use App\Models\UserAddress;
use App\Repositories\Interfaces\UserAddressRepositoryInterface;

class UserAddressRepository implements UserAddressRepositoryInterface
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
    public function __construct(UserAddress $model)
    {
        $this->model = $model;
    }

    public function list(int $user_id)
    {
        return $this->model
            ->where('user_id', $user_id)
            ->with('city', 'compound')
            ->get();
    }

    public function listActive(int $user_id)
 {
            return $this->model
            ->where('user_id', $user_id)
            ->where('is_active', 1)
            ->with('city', 'compound')
            ->get();
    }
    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with('city', 'compound')
            ->first();
    }

    public function updateWhere(array $condition, array $data)
    {
        return $this->model
            ->where($condition)
            ->update($data);
    }

    public function destroy($id){
        return $this->model
        ->destroy($id);

    }
}
