<?php

use App\Http\Controllers\NotificationTestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\User\HomeController;

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


Route::get('delete/user/ibrahim', [UserController::class, 'deleteIbrahim']);
Route::get('email', function(){
    return view('emails.request-confirmed');
});
Route::get('sms', [UserController::class, 'sms']);

Route::get('home', [HomeController::class, 'index']);
Route::get('service_types', [HomeController::class, 'serviceTypes']);
Route::get('services/{id}', [HomeController::class, 'service']);
Route::get('packages/{id}', [HomeController::class, 'package']);
Route::get('days_of_week', [HomeController::class, 'daysOfWeek']);
Route::get('test_notification', [NotificationTestController::class, 'index']);

