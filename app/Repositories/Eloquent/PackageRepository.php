<?php

namespace App\Repositories\Eloquent;

use App\Models\Package;
use App\Repositories\Interfaces\PackageRepositoryInterface;

class PackageRepository implements PackageRepositoryInterface
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
    public function __construct(Package $model)
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
     * Display a listing of the active resource.
     */
    public function allActive()
    {
        return $this->getWhereAll(['is_active' => 1]);
    }

    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->model
            ->with(['features'])
            ->get();
    }


    /**
     * Display a listing of the resource.
     */
    public function allActiveWithDetails()
    {
        return $this->model
            ->where(['is_active' => 1])
            ->with(['features'])
            ->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        return $this->model->create($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->model
            ->with([ 'features'])
            ->find($id);
    }


    public function getWhereAll(array $data)
    {
        return $this->model
            ->where($data)
            ->get();
    }


    public function getWhereAllWithDetails(array $data)
    {
        return $this->model
            ->with(['features'])
            ->where($data)
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
    public function updateWithDetails(array $data, array $features, int $id)
    {
        $package = $this->model->find($id);
        $package->update($data);
        $package->features_sync()->sync($features);
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
