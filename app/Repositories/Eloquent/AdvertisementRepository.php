<?php

namespace App\Repositories\Eloquent;

use App\Models\Advertisement;
use App\Repositories\Interfaces\AdvertisementRepositoryInterface;

class AdvertisementRepository implements AdvertisementRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * Repository constructor.
     *
     * @param Advertisement $model
     */
    public function __construct(Advertisement $model)
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
    public function allWithDetails()
    {
        return $this->model
            ->with(['advertiseable'])
            ->get();
    }

    /**
     * Display a listing of the resource.
     */
    public function allActiveWithDetails()
    {
        return $this->model
            ->where('is_active', 1)
            ->with(['advertiseable'])
            ->get();
    }
    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->model
            ->with(['advertiseable'])
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



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        return $this->model
            ->destroy($id);
    }
}
