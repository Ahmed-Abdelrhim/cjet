<?php

namespace App\Services;

use App\Repositories\Interfaces\ServiceRepositoryInterface;
use Illuminate\Support\Str;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Services\Interfaces\GeneratePurchaseReferenceServiceInterface;

class GeneratePurchaseReferenceService implements GeneratePurchaseReferenceServiceInterface
{

    private $serviceRepository;
    private $userPurchaseRequestRepository;




    public function __construct(ServiceRepositoryInterface $serviceRepository, UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository)
    {
        $this->serviceRepository = $serviceRepository;
        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
    }

    private function getFirstLettersOfString(string $title)
    {
        $words = str_word_count($title, 1);
        $first_letters = '';
        foreach ($words as $word) {
            $first_letters .= substr($word, 0, 1);
        }
        return  $first_letters . 'S';
    }

    private function getStringInitialsPurchaseReference(string $purchaseable_type, int $purchaseable_id = null)
    {
        if ($purchaseable_type == 'service') {
            $service = $this->serviceRepository->show($purchaseable_id);
            $string_purchase_reference = $this->getFirstLettersOfString($service->service_type->title ?? 'CWS');
            return  Str::upper($string_purchase_reference) . '-';
        } else if ($purchaseable_type == 'package') {
            return 'CWP-';
        } else {
            return 'CJA-';
        }
    }

    private function randomNumericPurchaseGenerator()
    {
        return rand(1000000, 9999999);
    }



    private function randomInvoiceReferenceNumber()
    {
        return '#'. Str::upper(Str::random(11));
    }

    public function generateUserPurchaseReference(string $purchaseable_type, int $purchaseable_id = null)
    {
        $string_purchase_reference = $this->getStringInitialsPurchaseReference($purchaseable_type, $purchaseable_id);
        $user_purchase_reference = $string_purchase_reference . $this->randomNumericPurchaseGenerator();
        while ($this->userPurchaseRequestRepository->isExist(['user_purchase_reference' => $user_purchase_reference])) {
            $user_purchase_reference = $string_purchase_reference . $this->randomNumericPurchaseGenerator();
        }
        return $user_purchase_reference;
    }


    public function generateInvoiceReferenceNumber()
    {
        $invoice_reference_number = $this->randomInvoiceReferenceNumber();
        while ($this->userPurchaseRequestRepository->isExist(['invoice_reference_number' => $invoice_reference_number])) {
            $invoice_reference_number =  $this->randomInvoiceReferenceNumber();
        }
        return $invoice_reference_number;
    }
}
