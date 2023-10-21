<?php

namespace App\Repositories\Eloquent;

use App\Models\UserPaymentMethod;
use App\Repositories\Interfaces\UserPaymentMethodRepositoryInterface;

class UserPaymentMethodRepository implements UserPaymentMethodRepositoryInterface
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
    public function __construct(UserPaymentMethod $model)
    {
        $this->model = $model;
    }

    public function list(int $user_id)
    {
        return $this->model
            ->where('user_id',$user_id)
            ->get();
    }
   public function listActive(int $user_id)
       {
        return $this->model
            ->where('user_id',$user_id)
            ->where('is_active', 1)
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
            ->find($id);
    }

    public function updateWhere(array $condition, array $data)
    {
        return $this->model
            ->where($condition)
            ->update($data);
    }


    public function destroy($id)
    {
        return $this->model->destroy($id);
    }
}
