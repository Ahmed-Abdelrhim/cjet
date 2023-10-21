<?php

namespace App\Repositories\Eloquent;

use App\Models\ServiceType;
use App\Repositories\Interfaces\ServiceTypeRepositoryInterface;

class ServiceTypeRepository implements ServiceTypeRepositoryInterface
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
    public function __construct(ServiceType $model)
    {
        $this->model = $model;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->model
            ->withCount('services')
            ->get();
    }
    public function activeOnly()
    {
        return $this->model 
        ->where('is_active', 1)
            ->withCount('services')
            ->get();
    }
    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->model
            ->with('services')
            ->get();
    }

    /**
     * Display a listing of the resource.
     */
    public function allActiveWithDetails()
    {
        return $this->model
            ->where('is_active', 1)
            ->with(['services' => function ($q) {
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
            ->find($id);
    }

    /**
     * Display the specified resource.
     */
    public function showWithDetails(int $id)
    {
        return $this->model
            ->with('services')
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


    /**
     * Select specific fields from storage.
     */
    public function select()
    {
        return $this->model
            ->select('id', 'title_en', 'title_ar');
    }
}
