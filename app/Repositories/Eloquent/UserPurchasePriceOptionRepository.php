<?php

namespace App\Repositories\Eloquent;

use App\Models\UserPurchasePriceOption;
use App\Repositories\Interfaces\UserPurchasePriceOptionRepositoryInterface;

class UserPurchasePriceOptionRepository implements UserPurchasePriceOptionRepositoryInterface
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
    public function __construct(UserPurchasePriceOption $model)
    {
        $this->model = $model;
    }



    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function insert(array $data)
    {
        return $this->model
            ->insert($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->find($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        return $this->model
            ->where('id', $id)
            ->update($data);
    }

    public function updateWhere(array $search_data, array $updated_data)
    {
        return $this->model
            ->where($search_data)
            ->update($updated_data);
    }



    public function getWhereAll(array $data)
    {
        return $this->model
            ->where($data)
            ->get();
    }
}
