<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\CityActiveRequest;
use App\Http\Requests\Dashboard\CityValidateDataRequest;
use App\Http\Requests\Dashboard\CityValidateIDRequest;
use App\Services\Interfaces\CityServiceInterface;


class CityController extends Controller
{

    private $cityService;

    public function __construct(CityServiceInterface $cityService)
    {
        $this->cityService = $cityService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->cityService->allWithDetails();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(CityValidateDataRequest $request)
    {
        return $this->cityService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(CityValidateIDRequest $request, int $id)
    {
        return $this->cityService->show($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(CityValidateDataRequest $request, int $id)
    {
        return $this->cityService->update($request->validated(), $id);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CityValidateIDRequest $request, int $id)
    {
        return $this->cityService->destroy($id);
    }



    /**
     * Update the specified resource in storage.
     */
    public function active(CityActiveRequest $request, int $id)
    {
        return $this->cityService->active($request->is_active, $id);
    }


}
