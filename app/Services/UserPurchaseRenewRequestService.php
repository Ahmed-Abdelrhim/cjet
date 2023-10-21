<?php

namespace App\Services;

use App\Repositories\Interfaces\InvoiceRepositoryInterface;
use App\Repositories\Interfaces\InvoiceUserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\PackageRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Services\Interfaces\GeneratePurchaseReferenceServiceInterface;
use App\Services\Interfaces\UserPurchaseRenewRequestServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleServiceInterface;
use App\Traits\ResponseTrait;

use Carbon\Carbon;

class UserPurchaseRenewRequestService implements UserPurchaseRenewRequestServiceInterface
{
    use ResponseTrait;

    private $userPurchaseScheduleService;
    private $generatePurchaseReferenceService;
    private $packageRepository;
    private $userPurchaseRequestRepository;
    private $invoiceRepository;
    private $invoiceUserPurchaseRequestRepository;

    public function __construct(
        UserPurchaseScheduleServiceInterface $userPurchaseScheduleService,
        GeneratePurchaseReferenceServiceInterface $generatePurchaseReferenceService,
        PackageRepositoryInterface $packageRepository,
        UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository,
        InvoiceRepositoryInterface $invoiceRepository,
        InvoiceUserPurchaseRequestRepositoryInterface $invoiceUserPurchaseRequestRepository

    ) {
        $this->packageRepository = $packageRepository;
        $this->generatePurchaseReferenceService = $generatePurchaseReferenceService;
        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
        $this->userPurchaseScheduleService = $userPurchaseScheduleService;
        $this->invoiceRepository = $invoiceRepository;
        $this->invoiceUserPurchaseRequestRepository = $invoiceUserPurchaseRequestRepository;
    }



    private function getUsersRenewRequests()
    {
        $data = ['is_renewable' => 1, 'renewable_date' => date('Y-m-d'),];
        return $this->userPurchaseRequestRepository->getWhereAll($data, ['inprogress']);
    }


    private function handleUserRenewPackageRequestData($renew_user_package_request)
    {
        $data['user_id'] = $renew_user_package_request->user_id;
        $data['root_purchase_request_id'] =  $renew_user_package_request->root_purchase_request_id ?? $renew_user_package_request->id;
        $data['purchaseable_id'] = $renew_user_package_request->purchaseable_id;
        $data['purchaseable_type'] = $renew_user_package_request->purchaseable_type;
        $data['invoice_reference_number'] = $this->generatePurchaseReferenceService->generateInvoiceReferenceNumber();


        $data['user_address_id'] = $renew_user_package_request->user_address_id;
        $data['user_car_id'] = $renew_user_package_request->user_car_id;
        $data['user_payment_method_id'] = $renew_user_package_request->user_payment_method_id;


        $data['selected_days'] = $renew_user_package_request->selected_days;
        $data['start_date'] =  $data['end_date'] = now();
        $data['status'] = 'payment';

        $package = $this->packageRepository->show($data['purchaseable_id']);
        $data['price'] = $package->price;
        $data['title_en'] = $package->title_en;
        $data['title_ar'] = $package->title_ar;
        $data['description_en'] = $package->description_en;
        $data['description_ar'] = $package->description_ar;
        return $data;
    }


    public function renew()
    {
        $renew_user_package_request_array = $this->getUsersRenewRequests();

        foreach ($renew_user_package_request_array as $renew_user_package_request) {
            $user_purchase_request = $this->userPurchaseRequestRepository->create($this->handleUserRenewPackageRequestData($renew_user_package_request));
            $this->handleSuccessPackagePurchase($user_purchase_request->invoice_reference_number);
        }
        return $this->success200();
    }



    public function handleSuccessPackagePurchase(string $invoice_reference_number)
    {

        if ($user_purchase_request = $this->userPurchaseRequestRepository->getWhereFirst(['invoice_reference_number' => $invoice_reference_number], ['payment'])) {
            $user_purchase_request_id =  $user_purchase_request->id;
            $data['is_renewable'] = 1;
            $data['start_date'] = now();
            $data['end_date'] = date(Carbon::parse($data['start_date'])->addWeek(4));
            $data['renewable_date'] = date(Carbon::parse($data['end_date'])->addDays(1));
            $data['user_purchase_reference'] = $this->generatePurchaseReferenceService->generateUserPurchaseReference('package');
            $data['payment_status'] = 'success';
            $data['payment_reference'] = 'xxxxxxxxxx';
            $data['status'] = 'pending';

            $this->userPurchaseRequestRepository->update($data, $user_purchase_request_id);

            $user_purchase_request_updated = $this->userPurchaseRequestRepository->show($user_purchase_request_id);

            $this->handleAddPackageInvoice($user_purchase_request_updated);

            $this->userPurchaseScheduleService->handlePackageSchedules($user_purchase_request_updated);
        }
    }




    private function handleAddPackageInvoice($user_purchase_request)
    {
        $invoice = $this->invoiceRepository->create([
            'user_id' => $user_purchase_request->user_id,
            'purchaseable_type'  => $user_purchase_request->purchaseable_type,
            'invoice_reference_number' => $user_purchase_request->invoice_reference_number,
            'amount' => $user_purchase_request->price,
            'invoice_type' => 'purchase',
        ]);


        $this->invoiceUserPurchaseRequestRepository->create([
            'invoice_id' => $invoice->id,
            'user_purchase_request_id' => $user_purchase_request->id,
        ]);
    }




    /**
     * COMMON IMPLEMENTATION
     */



    public function handleFailedPurchase(int $user_purchase_request_id)
    {
        $this->userPurchaseRequestRepository->update(['payment_status' => 'failed'], $user_purchase_request_id);
    }
}
