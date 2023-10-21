<?php

namespace App\Services\Interfaces;

interface InvoiceServiceInterface
{
    public function all();
    public function paginate();
    public function allWithDetails();
    public function show(int $id);
    public function getWithDetails(int $id);

    public function getWithDetailsWithSummaryArray(int $id);
    
    public function pdf(int $id);
    public function searchFilter( $from, $to, $filter, $sort, $paginate);
    public function searchInvoiceID(string $invoice_reference_number, $paginate);
    public function export(array $ids = null, array $filter_array = null);
    public function allInvoicesByUserId(int $id);

}
