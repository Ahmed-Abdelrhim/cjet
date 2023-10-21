<?php

namespace App\Repositories\Eloquent;

use App\Models\ServiceProvider;
use App\Repositories\Interfaces\ServiceProviderRepositoryInterface;
use Carbon\Carbon;

class ServiceProviderRepository implements ServiceProviderRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;
    private $paginate;

    /**
     * Repository constructor.
     *
     * @param Otp $model
     */
    public function __construct(ServiceProvider $model)
    {
        $this->model = $model;
        $this->paginate = 10;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->model
            ->with(['compounds'])
            ->get();
    }

    /**
     * Display a paginated listing of the resource.
     */
    public function paginate()
    {
        return $this->model
            ->orderBy('id', 'desc')
            ->paginate($this->paginate);
    }


    /**
     * Display a listing of the active resource.
     */
    public function allActive()
    {
        return $this->getWhereAll(['is_active' => 1]);
    }

    /**
     * Display a listing of the active resource.
     */
    public function allAvailable()
    {
        return $this->getWhereAll(['is_active' => 1, 'is_available' => 1]);
    }

    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->model
            ->with(['compounds'])
            ->orderBy('id', 'desc')
            ->get();
    }


    /**
     * Display a listing of the resource.
     */
    public function allActiveWithDetails()
    {
        return $this->model
            ->where(['is_active' => 1])
            ->with(['compounds'])
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


    /**
     * Display the specified resource.
     */
    public function getWithSchedules(int $id, array $status = ['inprogress', 'completed'])
    // public function getWithSchedules(int $id,array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'])
    {
        return $this->model
            ->with(['compounds'])
            ->with(['schedules' => function ($query) use ($status) {
                $query->whereIn('status', $status);
                $query->orderBy('scheduled_at', 'asc');
            }])
            ->find($id);
    }


    /**
     * Display the specified resource.
     */
    public function getWithActiveSchedules(int $id)
    {
        return $this->getWithSchedules($id, ['inprogress']);
    }



    /**
     * Display the specified resource.
     */
    public function getWithCompletedSchedules(int $id)
    {
        return $this->getWithSchedules($id, ['completed']);
    }


    /**
     * Display the specified resource.
     */
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


    public function getWhereInIDs(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->with(['compounds'])
            ->get();
    }


    public function getAllWhereCompound(int $compound_id,  $service_provider_id = null)
    {
        is_null($service_provider_id) ? $query = $this->model  :  $query = $this->model->where('id', '!=', $service_provider_id);

        $data = $query->where(['is_active' => 1, 'is_available' => 1])
            ->whereHas('compounds', function ($q) use ($compound_id) {
                $q->where('compound_id', $compound_id);
            })
            ->withCount(['schedules' => function ($q) {
                $q->whereBetween('scheduled_at', [Carbon::now()->startOfMonth()  . ' 00:00:00', Carbon::now()->endOfMonth() . ' 23:59:59']);
                $q->whereIn('status',  ['inprogress', 'completed']);
            }])
            ->get();

        return $data->sortBy('schedules_count');
    }


    public function getAssignAllWhereCompound(int $compound_id)
    {
        return $this->getAllWhereCompound($compound_id);
    }
    public function getReassignAllWhereCompound(int $compound_id, int $service_provider_id)
    {
        return $this->getAllWhereCompound($compound_id, $service_provider_id);
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
    public function updateWithDetails(array $data, array $compounds_array, int $id)
    {
        $service_provider = $this->model->find($id);
        $service_provider->update($data);
        $service_provider->compounds()->sync($compounds_array);
    }



    public function incrementRatingCount(int $id)
    {
        $this->model->where('id', $id)
            ->increment('rating_count');
    }


    private function filterBy($query, $filter)
    {
        switch ($filter) {
            case 'active_providers':
                return $query->where('is_active', 1);
            case 'inactive_providers':
                return $query->where('is_active', 0);
            case 'available_providers':
                return $query->where('is_available', 1);
            case 'unavailable_providers':
                return $query->where('is_available', 0);
            default:
                return $query;
        }
    }


    private function sortBy($query, $sort)
    {

        switch ($sort) {
            case 'oldest':
                return $query->orderBy('id', 'asc');
            case 'high_rating':
                return $query->orderBy('rating', 'desc');
            case 'low_rating':
                return $query->orderBy('rating', 'asc');
            default:
                return $query->orderBy('id', 'desc');
        }
    }

    public function filter($filter = null, $sort = null, $paginate = 1)
    {
        $query = $this->model;
        $query = $this->filterBy($query, $filter);
        $query = $this->sortBy($query, $sort);
        $query = $query->with(['compounds']);
        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }
}
