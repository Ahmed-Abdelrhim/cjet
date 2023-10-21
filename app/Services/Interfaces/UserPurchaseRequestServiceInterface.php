<?php

namespace App\Services\Interfaces;

interface UserPurchaseRequestServiceInterface
{
    public function package(array $data);
    public function service(array $data);
    public function handleSuccessPackagePurchase(string $invoice_reference_number);
    public function handleSuccessServicePurchase(string $invoice_reference_number);
    public function handleFailedPurchase(int $user_purchase_request_id);
    public function getWithDetails(int $id);
    public function cancelPackageSubscription(int $id);
    public function getUserActivePackageSubscriptionWhere(int $user_id, int $user_car_id);
    public function getUserActiveServiceSubscriptionWhere(int $user_id, int $user_car_id, int $service_id, string $start_date);
}
