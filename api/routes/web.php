<?php

use App\Http\Controllers\AdminHeaderController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\PartnerController;
use App\Http\Controllers\DateController;
use App\Http\Controllers\LunasController;
use App\Http\Controllers\BelumLunasController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\MessageController;

use Illuminate\Support\Facades\Route;

use function PHPUnit\Framework\returnSelf;


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

//Route login dan logout
Route::get('/', [AuthController::class, 'login']);
Route::post('/', [AuthController::class, 'authenticating'])->name('login');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

//Route dashboard
Route::get('/dashboard', [DashboardController::class, 'index'])->middleware('auth');

//Route products
Route::get('/products', [ProductsController::class, 'index'])->name('products.index')->middleware('auth');
Route::post('/products', [ProductsController::class, 'store'])->name('products.store');
Route::get('/update_product/{id}', [ProductsController::class, 'show'])->name('products.show');
Route::post('/product_update/{id}', [ProductsController::class, 'update'])->name('products.update');
Route::delete('/products/{id}', [ProductsController::class, 'destroy'])->name('products.destroy');

//Route header
Route::get('/admin_header/{id}', [AdminHeaderController::class, 'index'])->middleware('auth');

//Route orders
Route::get('/placed_orders', [OrdersController::class, 'index'])->name('orders.index')->middleware('auth');
Route::post('/update_orders/{id}', [OrdersController::class, 'update'])->name('orders.update');
Route::delete('/orders-delete/{id}', [OrdersController::class, 'destroy'])->name('orders.destroy');

//Route customer lunas dan belum
Route::get('/lunas', [LunasController::class, 'index'])->name('lunas.index')->middleware('auth');
Route::post('/kelunasan2/{id}', [LunasController::class, 'update'])->name('lunas.update');
Route::delete('/lunas2-delete/{id}', [LunasController::class, 'destroy'])->name('lunas.destroy');


//Route belum lunas
Route::get('/belum_lunas', [BelumLunasController::class, 'index'])->name('belumlunas.index')->middleware('auth');
Route::post('/kelunasan/{id}', [BelumLunasController::class, 'update'])->name('belumlunas.update');
Route::delete('/lunas-delete/{id}', [BelumLunasController::class, 'destroy'])->name('belumlunas.destroy');

//Route akun user admin
Route::get('/admin_accounts', [AdminController::class, 'index'])->name('admin.index')->middleware('auth');
Route::get('/admin-reg', [AdminController::class, 'add'])->name('admin.add');
Route::post('/admin-add', [AdminController::class, 'store'])->name('admin.store');
Route::delete('/admin-delete/{id}', [AdminController::class, 'destroy'])->name('admin.destroy');
Route::get('/edit_profile/{id}', [AdminController::class, 'show'])->name('admin.show');
Route::post('/update_profile/{id}', [AdminController::class, 'update'])->name('admin.update');

//Route akun customer
Route::get('/customer_accounts', [UsersController::class, 'index'])->name('user.index')->middleware('auth');
Route::delete('/customer-delete/{id}', [UsersController::class, 'destroy'])->name('users.destroy');

//Route pegawai
Route::get('/employees', [EmployeeController::class, 'index'])->name('employee.index')->middleware('auth');
Route::get('/employees/{id}', [EmployeeController::class, 'show'])->name('employee.show');
Route::post('/employee-add', [EmployeeController::class, 'store'])->name('employee.store');
Route::post('/update_employee/{id}', [EmployeeController::class, 'update'])->name('employee.update');
Route::delete('/employee-delete/{id}', [EmployeeController::class, 'destroy'])->name('employee.destroy');

//Route mitra
Route::get('/partners', [PartnerController::class, 'index'])->name('partner.index')->middleware('auth');
Route::get('/partners/{id}', [PartnerController::class, 'show'])->name('partner.show');
Route::post('/partner-add', [PartnerController::class, 'store'])->name('partner.store');
Route::post('/update_partner/{id}', [PartnerController::class, 'update'])->name('partner.update');
Route::delete('/partner-delete/{id}', [PartnerController::class, 'destroy'])->name('partner.destroy');

//Route pesan
Route::get('/messages', [MessageController::class, 'index'])->name('message.index')->middleware('auth');
Route::delete('/messages-delete/{id}', [MessageController::class, 'destroy'])->name('message.destroy');

//Route review
Route::get('/review', [ReviewController::class, 'index'])->name('review.index')->middleware('auth');
Route::delete('/reviews-delete/{id}', [ReviewController::class, 'destroy'])->name('review.destroy');

//Route update tanggal
Route::get('/date_update/{id}', [DateController::class, 'show'])->name('date.show');
Route::post('/update_date/{id}', [DateController::class, 'update'])->name('date.update');
