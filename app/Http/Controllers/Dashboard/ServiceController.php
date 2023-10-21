<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\ServiceActiveRequest;
use App\Http\Requests\Dashboard\ServiceDataRequest;
use App\Http\Requests\Dashboard\ServiceValidateIDRequest;
use App\Services\Interfaces\ServiceServiceInterface;


class ServiceController extends Controller
{

    private $serviceService;
    
    public function __construct(ServiceServiceInterface $serviceService)
    {
        $this->serviceService = $serviceService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->serviceService->all();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(ServiceDataRequest $request)
    {
        return $this->serviceService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(ServiceValidateIDRequest $request, int $id)
    {
        return $this->serviceService->show($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(ServiceDataRequest $request, int $id)
    {
        return $this->serviceService->update($request->validated(), $id);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ServiceValidateIDRequest $request, int $id)
    {
        return $this->serviceService->destroy($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function active(ServiceActiveRequest $request, int $id)
    {
        return $this->serviceService->active($request->is_active, $id);
    }
}
