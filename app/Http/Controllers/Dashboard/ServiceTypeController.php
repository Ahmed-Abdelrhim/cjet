<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\ServiceTypeActiveRequest;
use App\Http\Requests\Dashboard\ServiceTypeDataRequest;
use App\Http\Requests\Dashboard\ServiceTypeValidateIDRequest;
use App\Services\Interfaces\ServiceTypeServiceInterface;


class ServiceTypeController extends Controller
{

    private $serviceTypesService;
    public function __construct(ServiceTypeServiceInterface $serviceTypesService)
    {
        $this->serviceTypesService = $serviceTypesService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->serviceTypesService->all();
    }

    /**
     * Display a listing of the resource.
     */
    public function details()
    {
        return $this->serviceTypesService->allWithDetails();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(ServiceTypeDataRequest $request)
    {
        return $this->serviceTypesService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(ServiceTypeValidateIDRequest $request, int $id)
    {
        return $this->serviceTypesService->show($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(ServiceTypeDataRequest $request, int $id)
    {
        return $this->serviceTypesService->update($request->validated(), $id);
    }


    // /**
    //  * Remove the specified resource from storage.
    //  */
    // public function destroy(ServiceTypeValidateIDRequest $request, int $id)
    // {
    //     return $this->serviceTypesService->destroy($id);
    // }


    /**
     * Update the specified resource in storage.
     */
    public function active(ServiceTypeActiveRequest $request, int $id)
    {
        return $this->serviceTypesService->active( $request->is_active, $id);
    }
}
