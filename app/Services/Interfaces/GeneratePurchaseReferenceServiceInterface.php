<?php

namespace App\Services\Interfaces;

interface GeneratePurchaseReferenceServiceInterface
{
    public function generateUserPurchaseReference(string $purchaseable_type, int $purchaseable_id = null);
    public function generateInvoiceReferenceNumber();


}
