<?php

use App\Http\Controllers\User\OnlinePaymentController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

    Route::get('online/payment', [OnlinePaymentController::class, 'payment'])->name('online.payment');

Route::get('online/payment/callback', [OnlinePaymentController::class, 'successPayment']);
// https://30de-156-204-10-152.ngrok-free.app/online/payment/callback


Route::post('api/online/payment/success/callback',[OnlinePaymentController::class,'success'])->name('online.payment.success');
// https://30de-156-204-10-152.ngrok-free.app/api/user/online/payment/success/callback


//Route::get('online/payment/fail/callback', [OnlinePaymentController::class, 'fail'])->name('online.payment.fail');

//  https://30de-156-204-10-152.ngrok-free.app/online/payment/fail/callback

Route::get('create/payment/table', [OnlinePaymentController::class, 'createPaymentTable']);


// 158223085
// 158223145
