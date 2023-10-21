<?php

namespace App\Services;

use App\Http\Resources\Dashboard\CompoundListResource;
use App\Models\Compound;
use App\Repositories\Interfaces\CompoundRepositoryInterface;
use App\Services\Interfaces\CompoundServiceInterface;
use App\Traits\ResponseTrait;




class CompoundService implements CompoundServiceInterface
{
    use ResponseTrait;

    private $compoundRepository;

    public function __construct(CompoundRepositoryInterface $compoundRepository) 
    {
        $this->compoundRepository = $compoundRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200($this->compoundRepository->all());
    }

        /**
     * Display a listing of the resource.
     */
    public function allActiveCompounds()
    {
        return $this->success200(CompoundListResource::collection($this->compoundRepository->allActiveWithDetails()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        return $this->success201($this->compoundRepository->create($data));
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->compoundRepository->show($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        $this->compoundRepository->update($data, $id);
        return $this->success202();
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $this->compoundRepository->destroy($id);
        return $this->success202();
    }

    public function active($is_active, int $id)
    {
        $this->compoundRepository->update(['is_active' => $is_active], $id);
        return $this->success202();
    }

   
}
