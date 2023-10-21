<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\InvoiceExcelExportRequest;
use App\Http\Requests\Dashboard\InvoiceFilterRequest;
use App\Http\Requests\Dashboard\InvoiceSearchInvoiceIDRequest;
use App\Http\Requests\Dashboard\InvoiceValidateIDRequest;
use App\Http\Requests\Dashboard\ServiceProviderExcelExportRequest;
use App\Services\Interfaces\InvoiceServiceInterface;
use PDF;

class InvoiceController extends Controller
{

    private $invoiceService;

    public function __construct(InvoiceServiceInterface $invoiceService)
    {
        $this->invoiceService = $invoiceService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return $this->invoiceService->allWithDetails();
    }

    /**
     * Display a paginated listing of the resource.
     */
    public function paginate()
    {
        return $this->invoiceService->paginate();
    }

    /**
     * Display a listing search of the resource.
     */
    public function searchFilter(InvoiceFilterRequest $request)
    {
        return $this->invoiceService->searchFilter( $request->from. ' 00:00:00', $request->to. ' 23:59:59', $request->filter, $request->sort, $request->paginate);
    }

    /**
     * Display a listing search of the resource.
     */
    public function searchInvoiceID(InvoiceSearchInvoiceIDRequest $request)
    {
        return $this->invoiceService->searchInvoiceID($request->invoice_id,  $request->paginate);
    }



    /**
     * Display the specified resource.
     */
    public function show(InvoiceValidateIDRequest $request, int $id)
    {
        return $this->invoiceService->show($id);
    }


        /**
     * Display the specified resource.
     */
    public function getWithDetails(InvoiceValidateIDRequest $request, int $id)
    {
        return $this->invoiceService->getWithDetails($id);
    }
    

        /**
     * Display the specified resource.
     */
    public function pdf(InvoiceValidateIDRequest $request, int $id)
    {
        return $this->invoiceService->pdf($id);
    }
    

    // public function pdfTest()
    // {
    //     $data = [
    //         'title' => 'Welcome to ItSolutionStuff.com',
    //         'date' => date('m/d/Y')
    //     ];
    //     $pdf = PDF::loadView('invoice', $data);
    //     // $pdf = PDF::loadView('invoice');

    //     return $pdf->download('cjet_invoice.pdf');
    // }




    public function export(InvoiceExcelExportRequest $request)
    {
        $filter_array = $this->handleExcelFilterData($request);
        return $this->invoiceService->export($request->ids, $filter_array);
    }



    
    private function handleExcelFilterData($request)
    {
        if (is_null($request->sort) && is_null($request->filter)) {
            return null;
        } else {
            return [
                'from' => (is_null($request->from)) ? '2023-01-01' . ' 0:00:00' : $request->from. ' 00:00:00',
                'to' => (is_null($request->to)) ? date('Y-m-d') . '23:59:59' : $request->to. ' 23:59:59',
                'sort' => $request->sort,
                'filter' => $request->filter,
            ];
        }
    }

}
