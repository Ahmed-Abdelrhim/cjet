<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\InvoiceValidateIDRequest;

use App\Services\Interfaces\InvoiceServiceInterface;

class UserInvoicesController extends Controller
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
        return $this->invoiceService->allInvoicesByUserId(auth('sanctum')->id());
    }


        /**
     * Display the specified resource.
     */
    public function getWithDetails(InvoiceValidateIDRequest $request, int $id)
    {
        return $this->invoiceService->getWithDetailsWithSummaryArray($id);
    }






}
