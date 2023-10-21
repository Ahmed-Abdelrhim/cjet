<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Repositories\Eloquent\UserRepository;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Repositories\Eloquent\AdminRepository;
use App\Repositories\Interfaces\AdminRepositoryInterface;
use App\Repositories\Eloquent\OtpRepository;
use App\Repositories\Interfaces\OtpRepositoryInterface;
use App\Repositories\Eloquent\ServiceRepository;
use App\Repositories\Interfaces\ServiceRepositoryInterface;
use App\Repositories\Eloquent\ServiceTypeRepository;
use App\Repositories\Interfaces\ServiceTypeRepositoryInterface;
use App\Repositories\Eloquent\PackageRepository;
use App\Repositories\Interfaces\PackageRepositoryInterface;
use App\Repositories\Eloquent\AdvertisementRepository;
use App\Repositories\Interfaces\AdvertisementRepositoryInterface;
use App\Repositories\Eloquent\PriceOptionRepository;
use App\Repositories\Interfaces\PriceOptionRepositoryInterface;
use App\Repositories\Eloquent\FeatureRepository;
use App\Repositories\Interfaces\FeatureRepositoryInterface;
use App\Repositories\Eloquent\CityRepository;
use App\Repositories\Interfaces\CityRepositoryInterface;
use App\Repositories\Eloquent\CompoundRepository;
use App\Repositories\Eloquent\InvoiceRepository;
use App\Repositories\Eloquent\InvoiceUserPurchaseRequestRepository;
use App\Repositories\Eloquent\ServiceProviderRepository;
use App\Repositories\Interfaces\CompoundRepositoryInterface;
use App\Repositories\Eloquent\SettingRepository;
use App\Repositories\Eloquent\UserAddressRepository;
use App\Repositories\Eloquent\UserCarRepository;
use App\Repositories\Eloquent\UserPaymentMethodRepository;
use App\Repositories\Eloquent\UserPurchasePriceOptionRepository;
use App\Repositories\Eloquent\UserPurchaseRequestRepository;
use App\Repositories\Eloquent\UserPurchaseScheduleRepository;
use App\Repositories\Eloquent\UserSocialRepository;
use App\Repositories\Interfaces\InvoiceRepositoryInterface;
use App\Repositories\Interfaces\InvoiceUserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\ServiceProviderRepositoryInterface;
use App\Repositories\Interfaces\SettingRepositoryInterface;
use App\Repositories\Interfaces\UserAddressRepositoryInterface;
use App\Repositories\Interfaces\UserCarRepositoryInterface;
use App\Repositories\Interfaces\UserPaymentMethodRepositoryInterface;
use App\Repositories\Interfaces\UserPurchasePriceOptionRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Repositories\Interfaces\UserSocialRepositoryInterface;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->bind(UserRepositoryInterface::class, UserRepository::class);
        $this->app->bind(AdminRepositoryInterface::class, AdminRepository::class);
        $this->app->bind(OtpRepositoryInterface::class, OtpRepository::class);
        $this->app->bind(PackageRepositoryInterface::class, PackageRepository::class);
        $this->app->bind(ServiceTypeRepositoryInterface::class, ServiceTypeRepository::class);
        $this->app->bind(ServiceRepositoryInterface::class, ServiceRepository::class);
        $this->app->bind(AdvertisementRepositoryInterface::class, AdvertisementRepository::class);
        $this->app->bind(FeatureRepositoryInterface::class, FeatureRepository::class);
        $this->app->bind(PriceOptionRepositoryInterface::class, PriceOptionRepository::class);
        $this->app->bind(SettingRepositoryInterface::class, SettingRepository::class);
        $this->app->bind(UserSocialRepositoryInterface::class, UserSocialRepository::class);
        $this->app->bind(CityRepositoryInterface::class, CityRepository::class);
        $this->app->bind(CompoundRepositoryInterface::class, CompoundRepository::class);
        $this->app->bind(UserCarRepositoryInterface::class, UserCarRepository::class);
        $this->app->bind(UserAddressRepositoryInterface::class, UserAddressRepository::class);
        $this->app->bind(UserPaymentMethodRepositoryInterface::class, UserPaymentMethodRepository::class);
        $this->app->bind(UserPurchaseRequestRepositoryInterface::class, UserPurchaseRequestRepository::class);
        $this->app->bind(UserPurchaseScheduleRepositoryInterface::class, UserPurchaseScheduleRepository::class);
        $this->app->bind(UserPurchasePriceOptionRepositoryInterface::class, UserPurchasePriceOptionRepository::class);
        $this->app->bind(ServiceProviderRepositoryInterface::class, ServiceProviderRepository::class);
        $this->app->bind(InvoiceRepositoryInterface::class, InvoiceRepository::class);
        $this->app->bind(InvoiceUserPurchaseRequestRepositoryInterface::class, InvoiceUserPurchaseRequestRepository::class);
    }
}
