<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\ServiceProviderActiveRequest;
use App\Http\Requests\Dashboard\ServiceProviderAvailableRequest;
use App\Http\Requests\Dashboard\ServiceProviderExcelExportRequest;
use App\Http\Requests\Dashboard\ServiceProviderFilterRequest;
use App\Http\Requests\Dashboard\ServiceProviderValidateDataRequest;
use App\Http\Requests\Dashboard\ServiceProviderValidateIDRequest;
use App\Services\Interfaces\ServiceProviderServiceInterface;

class ServiceProviderController extends Controller
{

    private $serviceProviderService;

    public function __construct(ServiceProviderServiceInterface $serviceProviderService)
    {
        $this->serviceProviderService = $serviceProviderService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->serviceProviderService->allWithDetails();
    }

    /**
     * Display a paginated listing of the resource.
     */
    public function paginate()
    {
        return $this->serviceProviderService->paginate();
    }

    /**
     * Display a listing search of the resource.
     */
    public function filter(ServiceProviderFilterRequest $request)
    {
        return $this->serviceProviderService->filter($request->filter, $request->sort, $request->paginate);
    }


    /**
     * Display a listing id, name of the resource.
     */
    public function select()
    {
        return $this->serviceProviderService->select();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ServiceProviderValidateDataRequest $request)
    {
        return $this->serviceProviderService->create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(ServiceProviderValidateIDRequest $request, int $id)
    {
        return $this->serviceProviderService->show($id);
    }



    /**
     * Update the specified resource in storage.
     */
    public function update(ServiceProviderValidateDataRequest $request, int $id)
    {
        return $this->serviceProviderService->update($request->validated(), $id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function active(ServiceProviderActiveRequest $request, int $id)
    {
        return $this->serviceProviderService->active($request->is_active, $id);
    }


    /**
     * Update the specified resource in storage.
     */
    public function available(ServiceProviderAvailableRequest $request, int $id)
    {
        return $this->serviceProviderService->available($request->is_available, $id);
    }



    public function export(ServiceProviderExcelExportRequest $request)
    {

        $filter_array = $this->handleExcelFilterData($request);
        return $this->serviceProviderService->export($request->ids, $filter_array);
    }

    
    private function handleExcelFilterData($request)
    {
        if (is_null($request->sort) && is_null($request->filter)) {
            return null;
        } else {
            return [
                'sort' => $request->sort,
                'filter' => $request->filter,
            ];
        }
    }

}
