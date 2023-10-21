<?php

use App\Http\Controllers\User\OnlinePaymentController;
use App\Http\Controllers\User\UserOtpController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\User\UserSocialController;
use App\Http\Controllers\User\UserCarController;
use App\Http\Controllers\User\UserAddressController;
use App\Http\Controllers\User\UserPaymentMethodController;
use App\Http\Controllers\User\UserDataController;
use App\Http\Controllers\User\UserInvoicesController;
use App\Http\Controllers\User\UserNotificationController;
use App\Http\Controllers\User\UserPurchaseRequestController;
use App\Http\Controllers\User\UserPurchaseScheduleController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/




// Sanctum Route Group
Route::group(['prefix' => 'user'], function () {
    Route::post('register', [UserController::class, 'register']);
    Route::post('login', [UserController::class, 'login']);


    Route::post('social/register', [UserSocialController::class, 'register']);
    Route::post('social/login', [UserSocialController::class, 'login']);
    Route::post('forgot/password', [UserController::class, 'forgotPassword']);



    // ABILITIES PHONE
    Route::group(['middleware' => ['auth:sanctum', 'abilities:otp-update-social-phone']], function () {
        Route::post('social/register/phone', [UserSocialController::class, 'updatePhone']);
    });



    // ABILITIES OTP || OTP UPDATE PHONE || OTP RESET PASSWORD
    Route::group(['middleware' => ['auth:sanctum', 'ability:otp,otp-update-social-phone,otp-reset-password']], function () {
        Route::get('otp/resend', [UserOtpController::class, 'resend']);
        Route::post('otp/verify', [UserOtpController::class, 'verify']);
    });


    // ABILITIES OTP
    Route::group(['middleware' => ['auth:sanctum', 'ability:otp,otp-update-social-phone,otp-reset-password']], function () {
        Route::post('otp/verify', [UserOtpController::class, 'verify']);
    });


    // ABILITIES PASSWORD
    Route::group(['middleware' => ['auth:sanctum', 'abilities:otp-reset-password']], function () {
        Route::post('otp/verify/reset_password', [UserOtpController::class, 'verifyResetPassword']);
    });

    // ABILITIES VERIFIED OTP PASSWORD RESET
    Route::group(['middleware' => ['auth:sanctum', 'abilities:reset-password']], function () {
        Route::post('reset/password', [UserController::class, 'resetPassword']);
    });

    // ABILITIES USER
    Route::group(['middleware' => ['auth:sanctum', 'abilities:user']], function () {


        Route::get('details', [UserDataController::class, 'details']);

        Route::get('cities-compounds', [UserDataController::class, 'citiesCompounds']);

        Route::get('cars', [UserCarController::class, 'listActive']);
        Route::get('addresses', [UserAddressController::class, 'listActive']);
        Route::get('payment_methods', [UserPaymentMethodController::class, 'listActive']);

        Route::get('cars/{id}', [UserCarController::class, 'show']);
        Route::get('addresses/{id}', [UserAddressController::class, 'show']);
        Route::get('payment_methods/{id}', [UserPaymentMethodController::class, 'show']);

        Route::post('cars', [UserCarController::class, 'store']);
        Route::post('addresses', [UserAddressController::class, 'store']);
        Route::post('payment_methods', [UserPaymentMethodController::class, 'store']);


        Route::post('purchase/package', [UserPurchaseRequestController::class, 'package']);


        Route::post('purchase/package/days/validation', [UserPurchaseRequestController::class, 'packageDaysValidation']);
        Route::post('purchase/package/callback', [UserPurchaseRequestController::class, 'purchasePackageCallback']);


        Route::post('purchase/service', [UserPurchaseRequestController::class, 'service']);
        Route::post('purchase/service/days/validation', [UserPurchaseRequestController::class, 'serviceDaysValidation']);


        Route::get('booking/schedules', [UserPurchaseScheduleController::class, 'schedules']);
        Route::get('booking/schedules/{id}', [UserPurchaseScheduleController::class, 'show']);

        Route::post('rate/service/{id}', [UserPurchaseScheduleController::class, 'rate']);

        Route::get('booking/schedules/cancel/{id}', [UserPurchaseScheduleController::class, 'cancel']);

        Route::get('booking/schedules/days/{id}', [UserPurchaseScheduleController::class, 'scheduledDays']);
        Route::post('booking/schedules/reschedule/{id}', [UserPurchaseScheduleController::class, 'reschedule']);

        Route::get('booking/renew/test', [UserPurchaseScheduleController::class, 'renew']);

        Route::get('profile', [UserController::class, 'profile']);
        Route::get('profile/details', [UserController::class, 'getProfileDetails']);

        Route::get('subscription/cancel/{id}', [UserController::class, 'cancelSubscription']);


        Route::post('profile/update', [UserController::class, 'updateProfile']);


        Route::post('update/password', [UserController::class, 'updatePassword']);


        Route::get('otp/resend/temp_phone', [UserOtpController::class, 'resendTempPhone']);
        Route::post('otp/verify/temp_phone', [UserOtpController::class, 'verifyTempPhone']);

        Route::get('logout', [UserController::class, 'logout']);

        Route::post('address/{id}', [UserAddressController::class, 'update']);

        Route::post('default/address/{id}', [UserAddressController::class, 'setDefault']);


        Route::delete('address/{id}', [UserAddressController::class, 'setInactive']);



        Route::post('car/{id}', [UserCarController::class, 'update']);

        Route::post('car/{id}', [UserCarController::class, 'setInactive']);

        Route::post('payment_methods/{id}', [UserPaymentMethodController::class, 'update']);
        Route::post('default/payment_methods/{id}', [UserPaymentMethodController::class, 'setDefault']);
        Route::delete('payment_methods/{id}', [UserPaymentMethodController::class, 'setInactive']);
        Route::get('invoices', [UserInvoicesController::class, 'index']);
        Route::get('invoice/{id}', [UserInvoicesController::class, 'getWithDetails']);
        Route::post('notification/setting', [UserController::class, 'setUserNotificationSettings']);
        Route::get('notification/setting', [UserController::class, 'getUserNotificationSettings']);
        Route::get('notifications/read/{id}', [UserController::class, 'markAsRead']);
        Route::get('notifications', [UserController::class, 'getUserNotifications']);
    });




    // User\OnlinePaymentController
    // OnlinePaymentService







    Route::post('send-email', [UserCarController::class,'sendEmailTesting']);
    // route to create the queue:table for background tasks
    Route::get('create-queue-table',[UserCarController::class,'createQueueTable']);
});


