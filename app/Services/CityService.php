<?php

namespace App\Services;

use App\Http\Resources\User\CityListResource;
use App\Models\City;
use App\Repositories\Interfaces\CityRepositoryInterface;
use App\Repositories\Interfaces\CompoundRepositoryInterface;
use App\Services\Interfaces\CityServiceInterface;
use App\Traits\ResponseTrait;




class CityService implements CityServiceInterface
{
    use ResponseTrait;

    private $cityRepository;
    private $compoundRepository;

    public function __construct(
        CityRepositoryInterface $cityRepository,
        CompoundRepositoryInterface $compoundRepository
    ) {
        $this->cityRepository = $cityRepository;
        $this->compoundRepository = $compoundRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200($this->cityRepository->all());
    }


    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->success200($this->cityRepository->allWithDetails());
    }


    /**
     * Display a listing of the resource.
     */
    public function allActiveWithDetails()
    {
        return $this->success200(CityListResource::collection($this->cityRepository->allActiveWithDetails()));
    }

    public function allActiveWhereHasActiveCompoundsWithDetails()
    {
        return $this->success200(CityListResource::collection($this->cityRepository->allActiveWhereHasActiveCompoundsWithDetails()));

    }


    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        return $this->success201($this->cityRepository->create($data));
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->cityRepository->show($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $this->cityRepository->update($data, $id);
        return $this->success202();
    }

    
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $this->cityRepository->destroy($id);
        return $this->success202();
    }

    public function active($is_active, int $id)
    {
        $this->cityRepository->update(['is_active' => $is_active], $id);
        $is_active == 0 ? $this->compoundRepository->updateWhere(['city_id' => $id], ['is_active' => $is_active]) : null;
        return $this->success202();
    }
}
