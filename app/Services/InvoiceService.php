<?php

namespace App\Services;

use App\Exports\InvoicesExport;
use App\Http\Resources\Dashboard\InvoiceExportListResource;
use App\Http\Resources\Dashboard\InvoiceListResource;
use App\Http\Resources\Dashboard\InvoiceSingleDetailsResource;
use App\Http\Resources\Dashboard\InvoiceSingleWithSummaryResource;
use App\Repositories\Eloquent\SettingRepository;
use App\Repositories\Interfaces\InvoiceRepositoryInterface;
use App\Repositories\Interfaces\SettingRepositoryInterface;
use App\Services\Interfaces\InvoiceServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Maatwebsite\Excel\Excel;
use PDF;

class InvoiceService implements InvoiceServiceInterface
{
    use ResponseTrait, UploadTrait;

    private $invoiceRepository;
    private $settingRepository;

    public function __construct(
        InvoiceRepositoryInterface $invoiceRepository,
        SettingRepositoryInterface $settingRepository
    ) {
        $this->invoiceRepository = $invoiceRepository;
        $this->settingRepository = $settingRepository;
    }


    /**
     * Display a listing of the resource.
     */
    public function all()
    {
        return $this->success200(InvoiceListResource::collection($this->invoiceRepository->all())
            ->response()
            ->getData(true));
    }


    /**
     * Display a paginated listing of the resource.
     */
    public function paginate()
    {
        return $this->success200(InvoiceListResource::collection($this->invoiceRepository->paginate())
            ->response()
            ->getData(true));
    }

    /**
     * Display a listing of the resource.
     */
    public function allWithDetails()
    {
        return $this->success200(InvoiceListResource::collection($this->invoiceRepository->allWithDetails()));
    }

    public function show(int $id)
    {
        return $this->success200(new InvoiceSingleDetailsResource($this->invoiceRepository->getWithDetails($id)));
    }

    public function getWithDetails(int $id)
    {
        return $this->success200(new InvoiceSingleDetailsResource($this->invoiceRepository->getWithDetails($id)));
    }

    public function pdf(int $id)
    {
        $data = new InvoiceSingleDetailsResource($this->invoiceRepository->getWithDetails($id));
        $invoice_data = $data->resolve();
        $data = [
            'invoice_data' => $invoice_data,
            'setting_data' => $this->settingRepository->associative(),
        ];
        // return $data;
        $pdf = PDF::loadView('invoice', $data);
        return $pdf->download('cjet_invoice.pdf');
    }


    public function searchFilter($from, $to, $filter, $sort, $paginate)
    {
        return $this->success200(InvoiceListResource::collection($this->invoiceRepository->searchFilter($from, $to, $filter, $sort, $paginate))
            ->response()
            ->getData(true));
    }

    public function searchInvoiceID(string $invoice_reference_number, $paginate)
    {
        return $this->success200(InvoiceListResource::collection($this->invoiceRepository->searchInvoiceID($invoice_reference_number, $paginate))
            ->response()
            ->getData(true));
    }

    public function export(array $ids = null, array $filter_array = null)
    {
    
        $file_data = $this->getExcelData($ids, $filter_array);
        ob_end_clean(); //for generating excel XLSX
        ob_start(); //for generating excel XLSX
        return (new InvoicesExport(InvoiceExportListResource::collection($file_data)))->download('invoices.xlsx', Excel::XLSX);
    }

    private function getExcelData(array $ids = null, array $filter_array = null)
    {
        if ($ids) {
            return $this->invoiceRepository->getWhereInIDs($ids);
        } else if ($filter_array) {
            return $this->invoiceRepository->searchFilter($filter_array['from'], $filter_array['to'], $filter_array['filter'],  $filter_array['sort'], 0);
        } else {
            return $this->invoiceRepository->all();
        }
    }



    /**
     * Display a listing of the resource.
     */
    public function allInvoicesByUserId($id)
    {
        return $this->success200(InvoiceListResource::collection($this->invoiceRepository->allInvoicesByUserId($id))
             
             );
    }
    public function getWithDetailsWithSummaryArray(int $id)
    {
        return $this->success200(new InvoiceSingleWithSummaryResource($this->invoiceRepository->getWithDetailsWithSummaryArray($id)));
    }
}
