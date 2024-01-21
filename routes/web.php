<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
// try  catch
use App\Services\PayUService\Exception;
use App\Http\Controllers\HitlogController;
use App\Models\Product;
use App\Models\ProductViewModel;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});


Route::get('login', [App\Http\Controllers\CustomAuthController::class, 'index'])->name('login');
Route::get('home', [App\Http\Controllers\CustomAuthController::class, 'customHome'])->name('home');
Route::post('custom-login', [App\Http\Controllers\CustomAuthController::class, 'customLogin'])->name('login.custom');

Route::get('registration', [App\Http\Controllers\CustomAuthController::class, 'registration'])->name('register-user');
Route::post('custom-registration', [App\Http\Controllers\CustomAuthController::class, 'customRegistration'])->name('register.custom');
Route::post('verificationresend/{id}', [App\Http\Controllers\CustomAuthController::class, 'verificationResend'])->name('verification.resend');
Route::get('logout', [App\Http\Controllers\CustomAuthController::class, 'signOut'])->name('logout');

/* New Added Routes */
Route::get('dashboard', [App\Http\Controllers\CustomAuthController::class, 'dashboard'])->middleware(['auth', 'is_verify_email']);
Route::get('account/verify/{token}', [App\Http\Controllers\CustomAuthController::class, 'verifyAccount'])->name('user.verify');

// pagination
Route::get('pagination/fetch_data', [App\Http\Controllers\SuperAdminController::class, 'categoryPagination']);

Route::get('categoryCheck.name/{nameValue}', [App\Http\Controllers\SuperAdminController::class, 'categoryCheckname']); 

Route::post('/process-device-size', [App\Http\Controllers\HitlogController::class, 'processDeviceSize']);

// Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/dashboard-filter/{start_date}/{end_date}', [App\Http\Controllers\HomeController::class, 'dashboardFilter']);