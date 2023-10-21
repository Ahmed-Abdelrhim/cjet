<?php

namespace App\Repositories\Eloquent;

use App\Models\PriceOption;
use App\Repositories\Interfaces\PriceOptionRepositoryInterface;

class PriceOptionRepository implements PriceOptionRepositoryInterface
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
    public function __construct(PriceOption $model)
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
            ->with('service')
            ->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        return $this->model->create($data);
    }

    public function createArray(array $data, int $service_id)
    {
        foreach ($data as $priceOptionData) {
            $priceOptionData['service_id'] = $service_id;
            $this->model->create($priceOptionData);
        }
    }


    public function updateArray(array $data)
    {
        foreach ($data as $priceOptionData) {
            $this->model
                ->where('id', $priceOptionData['id'])
                ->update($priceOptionData);
        }
    }

    public function destroyArray(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->delete();
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->model
            ->with('service')
            ->find($id);
    }

    /**
     * Display the specified resource.
     */
    public function showWithDetails(int $id)
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


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        return $this->model
            ->destroy($id);
    }

        /**
     * Remove the specified resource from storage.
     */
    public function destroyAllWhere(array $data)
    {
        return $this->model
            ->where($data)
            ->delete();
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
