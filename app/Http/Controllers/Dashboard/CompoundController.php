<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\CompoundActiveRequest;
use App\Http\Requests\Dashboard\CompoundValidateDataRequest;
use App\Http\Requests\Dashboard\CompoundValidateIDRequest;
use App\Services\Interfaces\CompoundServiceInterface;


class CompoundController extends Controller
{

    private $compoundService;

    public function __construct(CompoundServiceInterface $compoundService)
    {
        $this->compoundService = $compoundService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->compoundService->all();
    }



    /**
     * Get the specified resource in storage.
     */
    public function activeCompounds()
    {
        return $this->compoundService->allActiveCompounds();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CompoundValidateDataRequest $request)
    {
        return $this->compoundService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(CompoundValidateIDRequest $request, int $id)
    {
        return $this->compoundService->show($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(CompoundValidateDataRequest $request, int $id)
    {
        return $this->compoundService->update($request->validated(), $id);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CompoundValidateIDRequest $request, int $id)
    {
        return $this->compoundService->destroy($id);
    }



    /**
     * Update the specified resource in storage.
     */
    public function active(CompoundActiveRequest $request, int $id)
    {
        return $this->compoundService->active($request->is_active, $id);
    }
}
