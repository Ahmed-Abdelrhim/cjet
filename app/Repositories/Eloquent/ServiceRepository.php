<?php

namespace App\Repositories\Eloquent;

use App\Models\Service;
use App\Repositories\Interfaces\ServiceRepositoryInterface;

class ServiceRepository implements ServiceRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * Repository constructor.
     *
     * @param Otp $model
     */
    public function __construct(Service $model)
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
            ->with([
                'service_type', 'features',
                'price_options' => function ($q) {
                    $q->orderBy('price', 'asc');
                }
            ])
            ->get();
    }

    /**
     * Display a listing of the active resource.
     */
    public function allActive()
    {
        return $this->getWhereAll(['is_active' => 1]);
    }

    /**
     * Display a listing of the resource with average price.
     */
    public function allActiveAverageOptions()
    {
        return $this->getWhereAll(['is_price_options' => 1, 'is_active' => 1]);
    }

    /**
     * Display a listing of the resource with single price.
     */
    public function allActiveWithoutAverageOptions()
    {
        return $this->getWhereAll(['is_price_options' => 0, 'is_active' => 1]);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $service = $this->model->create($data);
        return $service;
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->model
            ->with([
                'service_type', 'features',
                'price_options' => function ($q) {
                    $q->orderBy('price', 'asc');
                }
            ])
            ->find($id);
    }


    public function getWhereAll(array $data)
    {
        return $this->model
            ->where($data)
            ->with(['service_type'])
            ->get();
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
     * Update the specified resource in storage.
     */
    public function updateWithDetails(array $data, array $features,array $price_options ,int $id)
    {
        $service =  $this->model->find($id);
        $service->update($data);
        $service->features_sync()->sync($features);
        $service->price_options_sync()->sync($price_options);

    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        return $this->model->destroy($id);
    }
}
