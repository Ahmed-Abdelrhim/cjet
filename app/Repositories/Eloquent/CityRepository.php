<?php

namespace App\Repositories\Eloquent;

use App\Models\City;
use App\Repositories\Interfaces\CityRepositoryInterface;

class CityRepository implements CityRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * Repository constructor.
     *
     * @param City $model
     */
    public function __construct(City $model)
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
            ->with(['compounds'])
            ->withCount(['compounds' => function ($q) {
                $q->where('is_active', 1);
            }])
            ->get();
    }


    /**
     * Display a listing of the resource.
     */
    public function allActiveWithDetails()
    {
        return $this->model
            ->where(['is_active' => 1])
            ->with(['compounds' => function ($q) {
                $q->where('is_active', 1);
            }])
            ->get();
    }

    public function allActiveWhereHasActiveCompoundsWithDetails()
    {
        return $this->model
            ->where(['is_active' => 1])
            ->whereHas('compounds', function ($q) {
                $q->where('is_active', 1);
            })
            ->with(['compounds' => function ($q) {
                $q->where('is_active', 1);
            }])
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
            ->with(['compounds'])
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
            ->with(['compounds'])
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
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        return $this->model
            ->destroy($id);
    }

    /**
     * Select specific fields from storage.
     */
    public function select()
    {
        return $this->model
            ->select('id', 'title_en', 'title_ar');
    }
}
