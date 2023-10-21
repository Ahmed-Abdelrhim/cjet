<?php

use App\Http\Controllers\Dashboard\PackageController;
use App\Http\Controllers\Dashboard\PromotionalNotificationController;
use App\Http\Controllers\Dashboard\ServiceController;
use App\Http\Controllers\Dashboard\ServiceTypeController;
use App\Http\Controllers\Dashboard\AdminController;
use App\Http\Controllers\Dashboard\AdvertisementController;
use App\Http\Controllers\Dashboard\CityController;
use App\Http\Controllers\Dashboard\CompoundController;
use App\Http\Controllers\Dashboard\DimensionsController;
use App\Http\Controllers\Dashboard\InvoiceController;
use App\Http\Controllers\Dashboard\SettingController;
use App\Http\Controllers\Dashboard\UserController;
use App\Http\Controllers\Dashboard\ServiceProviderController;
use App\Http\Controllers\Dashboard\ServiceProviderSchedulesController;
use App\Http\Controllers\Dashboard\RequestScheduleController;
use App\Http\Controllers\Dashboard\UserPurchaseScheduleController;
use App\Http\Controllers\Dashboard\UserPurchaseRequestController;
use App\Http\Controllers\User\OnlinePaymentController;
use App\Http\Controllers\User\UserAddressController;
use App\Http\Controllers\User\UserCarController;
use Illuminate\Support\Facades\Route;




Route::get('invoices/pdf/test/{id}',  [InvoiceController::class, 'pdf']);


Route::post('dashboard/login', [AdminController::class, 'login']);
Route::post('dashboard/register', [AdminController::class, 'register']);

Route::group(['prefix' => 'dashboard', 'middleware' => ['auth:sanctum', 'abilities:admin']], function () {

    Route::get('dropdowns',  [PackageController::class, 'dropdowns']);
    Route::get('dimensions',  DimensionsController::class);


    Route::post('admins/update', [AdminController::class, 'update']);
    Route::post('admins/update/password', [AdminController::class, 'updatePassword']);


    Route::get('users/paginate', [UserController::class, 'paginate']);
    Route::post('users/search', [UserController::class, 'search']);
    Route::post('users/export', [UserController::class, 'export']);
    Route::apiResource('users', UserController::class);

    Route::get('users/{id}/schedules/list', [UserController::class, 'schedules']);
    Route::get('users/schedules/details/{id}',  [UserController::class, 'getScheduleWithDetails']);
    Route::post('users/schedules/search', [UserController::class, 'searchSchedules']);
    Route::post('users/schedules/search/booking_id', [UserPurchaseScheduleController::class, 'searchUserBookingID']);




    Route::post('packages/active/{id}',  [PackageController::class, 'active']);
    Route::post('packages/update/{id}', [PackageController::class, 'update']);
    Route::apiResource('packages', PackageController::class);


    Route::get('service_types_details',  [ServiceTypeController::class, 'details']);
    Route::post('service_types/active/{id}',  [ServiceTypeController::class, 'active']);
    Route::post('service_types/update/{id}', [ServiceTypeController::class, 'update']);
    Route::apiResource('service_types', ServiceTypeController::class);


    Route::post('services/active/{id}',  [ServiceController::class, 'active']);
    Route::post('services/update/{id}', [ServiceController::class, 'update']);
    Route::apiResource('services', ServiceController::class);


    Route::post('advertisements/active/{id}',  [AdvertisementController::class, 'active']);
    Route::post('advertisements/update/{id}', [AdvertisementController::class, 'update']);
    Route::apiResource('advertisements', AdvertisementController::class);


    Route::post('cities/active/{id}',  [CityController::class, 'active']);
    Route::post('cities/update/{id}', [CityController::class, 'update']);
    Route::apiResource('cities', CityController::class);


    Route::get('compounds/active',  [CompoundController::class, 'activeCompounds']);
    Route::post('compounds/active/{id}',  [CompoundController::class, 'active']);
    Route::post('compounds/update/{id}', [CompoundController::class, 'update']);
    Route::apiResource('compounds', CompoundController::class);


    Route::get('setting', [SettingController::class, 'index']);
    Route::get('setting/group', [SettingController::class, 'group']);
    Route::get('setting/associative', [SettingController::class, 'associative']);
    Route::post('setting', [SettingController::class, 'update']);


    Route::get('service_providers/select',  [ServiceProviderController::class, 'select']);
    Route::get('service_providers/paginate',  [ServiceProviderController::class, 'paginate']);
    Route::post('service_providers/search',  [ServiceProviderController::class, 'filter']);
    Route::post('service_providers/filter',  [ServiceProviderController::class, 'filter']);
    Route::post('service_providers/export',  [ServiceProviderController::class, 'export']);
    Route::post('service_providers/active/{id}',  [ServiceProviderController::class, 'active']);
    Route::post('service_providers/available/{id}',  [ServiceProviderController::class, 'available']);
    Route::post('service_providers/update/{id}', [ServiceProviderController::class, 'update']);
    Route::apiResource('service_providers', ServiceProviderController::class);


    Route::get('schedules/details/{id}',  [UserPurchaseScheduleController::class, 'getWithDetails']); // user_purchase_schedule
    Route::post('service_providers/schedules/search',  [ServiceProviderSchedulesController::class, 'search']);
    Route::get('service_providers/schedules/active/{id}',  [ServiceProviderSchedulesController::class, 'activeSchedules']);
    Route::get('service_providers/schedules/completed/{id}',  [ServiceProviderSchedulesController::class, 'completedSchedules']);
    Route::post('service_providers/schedules/status/update/{id}', [ServiceProviderSchedulesController::class, 'updateStatus']);
    Route::post('service_providers/schedules/search/booking_id',  [UserPurchaseScheduleController::class, 'searchServiceProviderBookingID']);




    // assign/reassign schedules
    Route::get('service_providers/schedules/{id}',  [UserPurchaseScheduleController::class, 'getScheduleAvailableServiceProviders']);
    Route::post('schedules/reassign',  [UserPurchaseScheduleController::class, 'reassignMulti']);
    Route::post('schedules/assign/{id}',  [UserPurchaseScheduleController::class, 'assign']);
    Route::post('schedules/reassign/{id}',  [UserPurchaseScheduleController::class, 'assign']);
    Route::post('service_providers/schedules/reassign',  [UserPurchaseScheduleController::class, 'getSchedulesAvailableServiceProviders']);


    Route::get('requests/details/{id}',  [UserPurchaseRequestController::class, 'getWithDetails']); // user_purchase_request

    Route::post('requests/schedules/export',  [RequestScheduleController::class, 'export']);
    Route::post('requests/schedules/search',  [RequestScheduleController::class, 'searchRequestsSchedules']);
    Route::post('requests/schedules/search/booking_id',  [RequestScheduleController::class, 'searchRequestsSchedulesBookingID']);

    Route::get('requests/schedules/pending/service_providers/{id}',  [RequestScheduleController::class, 'getPendingRequestAvailableServiceProviders']);
    Route::get('requests/schedules/rescheduled/service_providers/{id}',  [RequestScheduleController::class, 'getRescheduledScheduleAvailableServiceProviders']);
    Route::get('requests/schedules/inprogress/service_providers/{id}',  [RequestScheduleController::class, 'getInprogressScheduleAvailableServiceProviders']);

    Route::post('requests/schedules/pending/assign/{id}',  [RequestScheduleController::class, 'assignRequest']);
    Route::post('requests/schedules/rescheduled/assign/{id}',  [RequestScheduleController::class, 'assignRescheduledSchedule']);

    Route::post('requests/schedules/inprogress/reassign/{id}',  [RequestScheduleController::class, 'assignInprogressSchedule']);

    Route::post('requests/schedules/status/update/{id}', [RequestScheduleController::class, 'updateStatus']);

    Route::get('invoices/details/{id}',  [InvoiceController::class, 'getWithDetails']); //
    Route::post('invoices/pdf/{id}',  [InvoiceController::class, 'pdf']); //
    Route::post('invoices/export',  [InvoiceController::class, 'export']);
    Route::post('invoices/search',  [InvoiceController::class, 'searchFilter']);
    Route::post('invoices/search/invoice_id',  [InvoiceController::class, 'searchInvoiceID']);

    Route::get('promotional-notifications',  [PromotionalNotificationController::class, 'index']);
    Route::post('promotional-notifications',  [PromotionalNotificationController::class, 'store']);

    Route::apiResource('invoices', InvoiceController::class);



    // Route::get('service_providers/user_purchase_request/{id}',  [UserPurchaseRequestController::class, 'getRequestAvailableServiceProviders']);
    // Route::post('user_purchase_request/assign/{id}',  [UserPurchaseRequestController::class, 'assign']);

});
