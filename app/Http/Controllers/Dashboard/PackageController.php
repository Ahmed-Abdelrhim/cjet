<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\PackageActiveRequest;
use App\Http\Requests\Dashboard\PackageDataRequest;
use App\Http\Requests\Dashboard\PackageValidateIDRequest;
use App\Services\Interfaces\PackageServiceInterface;


class PackageController extends Controller
{

    private $packageService;

    public function __construct(PackageServiceInterface $packageService)
    {
        $this->packageService = $packageService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->packageService->all();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(PackageDataRequest $request)
    {
        return $this->packageService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(PackageValidateIDRequest $request, int $id)
    {
        return $this->packageService->show($id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(PackageDataRequest $request, int $id)
    {
        return $this->packageService->update($request->validated(), $id);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PackageValidateIDRequest $request, int $id)
    {
        return $this->packageService->destroy($id);
    }



    /**
     * Update the specified resource in storage.
     */
    public function active(PackageActiveRequest $request, int $id)
    {
        return $this->packageService->active($request->is_active, $id);
    }


    /**
     * Display a listing of the resource.
     */
    public function dropdowns()
    {
        return $this->packageService->dropdowns();
    }
}
