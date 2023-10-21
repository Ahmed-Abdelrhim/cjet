<?php

namespace App\Services;

use App\Http\Resources\Dashboard\UserPurchaseRequestSingleDetailsResource;
use App\Models\Package;
use App\Models\Service;
use App\Models\UserPurchasePriceOption;
use App\Models\UserPurchaseRequest;
use App\Notifications\PackageSubscriptionEnded;
use App\Repositories\Interfaces\InvoiceRepositoryInterface;
use App\Repositories\Interfaces\InvoiceUserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\PackageRepositoryInterface;
use App\Repositories\Interfaces\PriceOptionRepositoryInterface;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Repositories\Interfaces\UserPurchasePriceOptionRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Services\Interfaces\GeneratePurchaseReferenceServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleServiceInterface;
use App\Traits\ResponseTrait;
// use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Carbon\Carbon;
use  App\Notifications\PackageBookingCancelled;


class UserPurchaseRequestService implements UserPurchaseRequestServiceInterface
{
    use ResponseTrait;

    private $userPurchaseScheduleService;
    private $generatePurchaseReferenceService;
    private $packageRepository;
    private $serviceRepository;
    private $userPurchaseRequestRepository;
    private $userPurchasePriceOptionRepository;
    private $priceOptionRepository;
    private $invoiceRepository;
    private $invoiceUserPurchaseRequestRepository;


    public function __construct(
        UserPurchaseScheduleServiceInterface $userPurchaseScheduleService,
        UserPurchasePriceOptionRepositoryInterface $userPurchasePriceOptionRepository,
        GeneratePurchaseReferenceServiceInterface $generatePurchaseReferenceService,
        PackageRepositoryInterface $packageRepository,
        ServiceRepositoryInterface $serviceRepository,
        UserPurchaseRequestRepositoryInterface $userPurchaseRequestRepository,
        PriceOptionRepositoryInterface $priceOptionRepository,
        InvoiceRepositoryInterface $invoiceRepository,
        InvoiceUserPurchaseRequestRepositoryInterface $invoiceUserPurchaseRequestRepository

    ) {
        $this->packageRepository = $packageRepository;
        $this->serviceRepository = $serviceRepository;
        $this->generatePurchaseReferenceService = $generatePurchaseReferenceService;
        $this->priceOptionRepository = $priceOptionRepository;
        $this->userPurchaseRequestRepository = $userPurchaseRequestRepository;
        $this->userPurchaseScheduleService = $userPurchaseScheduleService;
        $this->userPurchasePriceOptionRepository = $userPurchasePriceOptionRepository;
        $this->invoiceRepository = $invoiceRepository;
        $this->invoiceUserPurchaseRequestRepository = $invoiceUserPurchaseRequestRepository;
    }





    /**
     * PACKAGE REQUEST IMPLEMENTATION
     */


    private function handlePackageData(array &$data)
    {
        //  'package_id' => 'purchaseable_id', 'purchaseable_type'
        $data['purchaseable_id'] = $data['package_id'];
        $data['purchaseable_type'] = Package::class;
        $data['invoice_reference_number'] = $this->generatePurchaseReferenceService->generateInvoiceReferenceNumber();

        // 'start_date' + => 'end_date',
        //'renewable_date' handled with success payment,
        $data['end_date'] = date(Carbon::parse($data['start_date'])->addWeek(4));

        // 'selected_days []' => 'selected_days',
        $data['selected_days'] = implode(',', $data['selected_days']);

        // 'package_id' => 'title_en', 'title_ar', 'description_en', 'description_ar',
        $package = $this->packageRepository->show($data['package_id']);
        $data['title_en'] = $package->title_en;
        $data['title_ar'] = $package->title_ar;
        $data['description_en'] = $package->description_en;
        $data['description_ar'] = $package->description_ar;

        unset($data['package_id']);
    }


    /**
     * Display the specified resource.
     */
    public function package(array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        $this->handlePackageData($data);
        $user_purchase_request = $this->userPurchaseRequestRepository->create($data);
        $this->handleSuccessPackagePurchase($user_purchase_request->invoice_reference_number);
        return $this->success200();
    }




    public function handleSuccessPackagePurchase(string $invoice_reference_number)
    {
        $user_purchase_request = $this->userPurchaseRequestRepository->getWhereFirst(['invoice_reference_number' => $invoice_reference_number], ['payment']);
        $user_purchase_request_id =  $user_purchase_request->id;
        $data['renewable_date'] = date(Carbon::parse($user_purchase_request->end_date)->addDays(1));
        $data['user_purchase_reference'] = $this->generatePurchaseReferenceService->generateUserPurchaseReference('package');
        $data['payment_status'] = 'success';
        $data['payment_reference'] = 'xxxxxxxxxx';
        $data['status'] = 'pending';

        $this->userPurchaseRequestRepository->update($data, $user_purchase_request_id);

        $user_purchase_request_updated = $this->userPurchaseRequestRepository->show($user_purchase_request_id);

        // ADD PURCHASE DATA TO INVOICE TABLE.
        $this->handleAddPackageInvoice($user_purchase_request_updated);

        // TO HANDLE DATA IN SCHEDULES TABLE.
        $this->userPurchaseScheduleService->handlePackageSchedules($user_purchase_request_updated);
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
     * SERVICE REQUEST IMPLEMENTATION
     */


    private function getServiceCommonData(array $data)
    {
        return [
            'purchaseable_type' => Service::class,
            'user_id' => $data['user_id'],
            'user_car_id' => $data['user_car_id'],
            'user_address_id' => $data['user_address_id'],
            'user_payment_method_id' => $data['user_payment_method_id'],
            'is_renewable' => 0,
            'status' => 'payment',
        ];
    }


    private function handleSingleServiceData(array $data, array $service, string $invoice_reference_number)
    {

        $service_data = $this->serviceRepository->show($service['service_id']);
        $single_service_data_array = [
            'purchaseable_id' =>  $service['service_id'],
            'invoice_reference_number' => $invoice_reference_number,
            'start_date' => $service['selected_date'],
            'end_date' => $service['selected_date'],
            'price' => $service['subtotal_price'],
            'title_en' => $service_data->title_en,
            'title_ar' =>  $service_data->title_ar,
            'description_en' => $service_data->short_description_en,
            'description_ar' =>  $service_data->short_description_ar,
        ];

        $single_service_common_data_array = $this->getServiceCommonData($data);


        return array_merge($single_service_common_data_array, $single_service_data_array);
    }


    private function handlePriceOptionsData(array $price_options_array, int $user_purchase_request_id)
    {
        $price_options_array_data = [];
        foreach ($price_options_array as $price_option_id) {
            $price_option_data = $this->priceOptionRepository->show($price_option_id);
            $data['user_purchase_request_id'] = $user_purchase_request_id;
            $data['price_option_id'] = $price_option_id;
            $data['title_en'] = $price_option_data->title_en ?? ' ';
            $data['title_ar'] = $price_option_data->title_ar ?? ' ';
            $data['price'] = $price_option_data->price ?? 0;
            $data['created_at'] = $data['updated_at'] = now();
            array_push($price_options_array_data, $data);
        }
        $this->userPurchasePriceOptionRepository->insert($price_options_array_data);
    }

    /**
     * Display the specified resource.
     */
    public function service(array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        $invoice_reference_number = $this->generatePurchaseReferenceService->generateInvoiceReferenceNumber();
        foreach ($data['services'] as $single_service) {
            $single_service_data =  $this->handleSingleServiceData($data, $single_service, $invoice_reference_number);
            $user_purchase_request = $this->userPurchaseRequestRepository->create($single_service_data);
            isset($single_service['price_options_id']) ? $this->handlePriceOptionsData($single_service['price_options_id'], $user_purchase_request->id) : null;
        }
        $this->handleSuccessServicePurchase($invoice_reference_number);
        return $this->success200();
    }


    public function handleSuccessServicePurchase(string $invoice_reference_number)
    {
        $user_purchase_request_array = $this->userPurchaseRequestRepository->getWhereAll(['invoice_reference_number' => $invoice_reference_number], ['payment']);

        $this->handleAddServiceInvoice($user_purchase_request_array);

        foreach ($user_purchase_request_array as $user_purchase_request) {
            $data['user_purchase_reference'] = $this->generatePurchaseReferenceService->generateUserPurchaseReference('service', $user_purchase_request->purchaseable_id);
            $data['payment_status'] = 'success';
            $data['payment_reference'] = 'xxxxxxxxxx';
            $data['status'] = 'pending';
            $this->userPurchaseRequestRepository->update($data, $user_purchase_request->id);
            $user_purchase_request_updated = $this->userPurchaseRequestRepository->show($user_purchase_request->id);
            // TO HANDLE DATA IN SCHEDULES TABLE.
            $this->userPurchaseScheduleService->handleServiceSchedules($user_purchase_request_updated);
        }
    }


    private function handleAddServiceInvoice($user_purchase_request_array)
    {
        $total_amount = array_sum(array_column($user_purchase_request_array->toArray(), 'price'));
        $invoice = $this->invoiceRepository->create([
            'user_id' => $user_purchase_request_array[0]->user_id,
            'purchaseable_type'  => $user_purchase_request_array[0]->purchaseable_type,
            'invoice_reference_number' => $user_purchase_request_array[0]->invoice_reference_number,
            'amount' => $total_amount,
            'invoice_type' => 'purchase',
        ]);

        foreach ($user_purchase_request_array as $user_purchase_request) {
            $this->invoiceUserPurchaseRequestRepository->create([
                'invoice_id' => $invoice->id,
                'user_purchase_request_id' => $user_purchase_request->id,
            ]);
        }
    }


    public function getWithDetails(int $id)
    {
        return $this->success200(new UserPurchaseRequestSingleDetailsResource($this->userPurchaseRequestRepository->getWithDetails($id)));
    }

    public function getUserActivePackageSubscriptionWhere(int $user_id, int $user_car_id)
    {
        return $this->userPurchaseRequestRepository->getUserActivePackageSubscriptionWhere($user_id, $user_car_id);
    }

    public function getUserActiveServiceSubscriptionWhere(int $user_id, int $user_car_id, int $service_id,  $start_date)
    {
        return $this->userPurchaseRequestRepository->getUserActiveServiceSubscriptionWhere($user_id, $user_car_id, $service_id, $start_date);
    }

    public function cancelPackageSubscription(int $id)
    {
        $userPurchaseRequest = $this->userPurchaseRequestRepository->update(['is_renewable' => 0], $id);
        // NOTIFY USER SUBSCRIPTION ENDED
        if (isset($userPurchaseRequest->user->email) and !empty($userPurchaseRequest->user->email)) {
            $userPurchaseRequest->user->notify(new PackageBookingCancelled($userPurchaseRequest));
        }
        return $this->success200('Subscription cancelled successfully', 'Subscription cancelled successfully');
        //return $this->success200();
    }

    /**
     * COMMON IMPLEMENTATION
     */

    public function handleFailedPurchase(int $user_purchase_request_id)
    {
        $this->userPurchaseRequestRepository->update(['payment_status' => 'failed'], $user_purchase_request_id);
    }
}
