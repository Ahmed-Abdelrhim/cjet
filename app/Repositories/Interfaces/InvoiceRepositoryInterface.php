<?php

namespace App\Repositories\Interfaces;


interface InvoiceRepositoryInterface
{
    public function all();
    public function paginate();
    public function allWithDetails();
    public function create(array $data);
    public function show(int $id);
    public function getWithDetails(int $id);
    public function getWhereInIDs(array $ids);
    public function searchFilter($from, $to, $filter = null, $sort = null, $paginate = 1);
    public function searchInvoiceID(string $invoice_reference_number, $paginate = 1);
    public function allInvoicesByUserId(int $id);
    public function getWithDetailsWithSummaryArray(int $id);
}
