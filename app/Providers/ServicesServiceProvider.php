<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\AdminService;
use App\Services\AdvertisementService;
use App\Services\CityService;
use App\Services\CompoundService;
use App\Services\DimensionsService;
use App\Services\GeneratePurchaseReferenceService;
use App\Services\HomeService;
use App\Services\OtpService;
use App\Services\UserAuthService;
use App\Services\ServiceService;
use App\Services\ServiceTypeService;
use App\Services\PackageService;
use App\Services\SettingService;
use App\Services\UserOtpService;
use App\Services\UserSocialService;
use App\Services\Interfaces\AdminServiceInterface;
use App\Services\Interfaces\AdvertisementServiceInterface;
use App\Services\Interfaces\CityServiceInterface;
use App\Services\Interfaces\CompoundServiceInterface;
use App\Services\Interfaces\DimensionsServiceInterface;
use App\Services\Interfaces\GeneratePurchaseReferenceServiceInterface;
use App\Services\Interfaces\HomeServiceInterface;
use App\Services\Interfaces\InvoiceServiceInterface;
use App\Services\Interfaces\OtpServiceInterface;
use App\Services\Interfaces\UserAuthServiceInterface;
use App\Services\Interfaces\ServiceServiceInterface;
use App\Services\Interfaces\ServiceTypeServiceInterface;
use App\Services\Interfaces\PackageServiceInterface;
use App\Services\Interfaces\ServiceProviderServiceInterface;
use App\Services\Interfaces\SettingServiceInterface;
use App\Services\Interfaces\UserAddressServiceInterface;
use App\Services\Interfaces\UserCarServiceInterface;
use App\Services\Interfaces\UserDashboardServiceInterface;
use App\Services\Interfaces\UserDataServiceInterface;
use App\Services\Interfaces\UserOtpServiceInterface;
use App\Services\Interfaces\UserPaymentMethodServiceInterface;
use App\Services\Interfaces\UserPurchaseRenewRequestServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestDashboardServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestServiceInterface;
use App\Services\Interfaces\UserPurchaseRescheduleServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleDashboardServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleServiceInterface;
use App\Services\Interfaces\UserSocialServiceInterface;
use App\Services\InvoiceService;
use App\Services\ServiceProviderService;
use App\Services\UserAddressService;
use App\Services\UserCarService;
use App\Services\UserDashboardService;
use App\Services\UserDataService;
use App\Services\UserPaymentMethodService;
use App\Services\UserPurchaseRenewRequestService;
use App\Services\UserPurchaseRequestDashboardService;
use App\Services\UserPurchaseRequestService;
use App\Services\UserPurchaseRescheduleService;
use App\Services\UserPurchaseScheduleDashboardService;
use App\Services\UserPurchaseScheduleService;

class ServicesServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->bind(UserAuthServiceInterface::class, UserAuthService::class);
        $this->app->bind(UserDashboardServiceInterface::class, UserDashboardService::class);
        $this->app->bind(UserSocialServiceInterface::class, UserSocialService::class);
        $this->app->bind(AdminServiceInterface::class, AdminService::class);
        $this->app->bind(HomeServiceInterface::class, HomeService::class);
        $this->app->bind(OtpServiceInterface::class, OtpService::class);
        $this->app->bind(PackageServiceInterface::class, PackageService::class);
        $this->app->bind(ServiceTypeServiceInterface::class, ServiceTypeService::class);
        $this->app->bind(ServiceServiceInterface::class, ServiceService::class);
        $this->app->bind(AdvertisementServiceInterface::class, AdvertisementService::class);
        $this->app->bind(SettingServiceInterface::class,SettingService::class);
        $this->app->bind(DimensionsServiceInterface::class,DimensionsService::class);
        $this->app->bind(UserOtpServiceInterface::class,UserOtpService::class);
        $this->app->bind(CityServiceInterface::class,CityService::class);
        $this->app->bind(CompoundServiceInterface::class,CompoundService::class);
        $this->app->bind(UserCarServiceInterface::class,UserCarService::class);
        $this->app->bind(UserAddressServiceInterface::class,UserAddressService::class);
        $this->app->bind(UserPaymentMethodServiceInterface::class,UserPaymentMethodService::class);
        $this->app->bind(UserDataServiceInterface::class,UserDataService::class);
        $this->app->bind(UserPurchaseRequestServiceInterface::class,UserPurchaseRequestService::class);
        $this->app->bind(UserPurchaseScheduleServiceInterface::class,UserPurchaseScheduleService::class);
        $this->app->bind(GeneratePurchaseReferenceServiceInterface::class,GeneratePurchaseReferenceService::class);
        $this->app->bind(UserPurchaseRescheduleServiceInterface::class,UserPurchaseRescheduleService::class);
        $this->app->bind(UserPurchaseRenewRequestServiceInterface::class,UserPurchaseRenewRequestService::class);
        $this->app->bind(ServiceProviderServiceInterface::class,ServiceProviderService::class);
        $this->app->bind(UserPurchaseScheduleDashboardServiceInterface::class,UserPurchaseScheduleDashboardService::class);
        $this->app->bind(UserPurchaseRequestDashboardServiceInterface::class,UserPurchaseRequestDashboardService::class);
        $this->app->bind(InvoiceServiceInterface::class,InvoiceService::class);
        
        
    }
}
