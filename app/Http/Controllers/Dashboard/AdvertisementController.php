<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\AdvertisementActiveRequest;
use App\Http\Requests\Dashboard\AdvertisementDataRequest;
use App\Http\Requests\Dashboard\AdvertisementValidateIDRequest;
use App\Services\Interfaces\AdvertisementServiceInterface;

class AdvertisementController extends Controller
{

    private $advertisementService;


    public function __construct(AdvertisementServiceInterface $advertisementService)
    {
        $this->advertisementService = $advertisementService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->advertisementService->all();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(AdvertisementDataRequest $request)
    {
        return $this->advertisementService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(AdvertisementValidateIDRequest $request, int $id)
    {
        return $this->advertisementService->show($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(AdvertisementDataRequest $request, int $id)
    {
        return $this->advertisementService->update($request->validated(), $id);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AdvertisementValidateIDRequest $request, int $id)
    {
        return $this->advertisementService->destroy($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function active(AdvertisementActiveRequest $request, int $id)
    {
        return $this->advertisementService->active($request->is_active, $id);
    }


}
