<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminUserController;
use App\Http\Controllers\TimeController;

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

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

##AdminUser Controller
Route::get('/admin/users', [AdminUserController::class, 'ShowAdminUser'])->name('admin.user');

##UserTime Controller
Route::get('/users/time', [TimeController::class, 'ShowTime'])->name('users.time');
Route::post('/users/addtime', [TimeController::class, 'AddTimeIn'])->name('add.usertimein');
// Route::get('/users/addtimeout/{id}', [TimeController::class, 'AddTimeOut'])->name('add.usertimeout');
Route::post('/users/addtimeouton/{id}', [TimeController::class, 'AddTimeOutOn'])->name('add.usertimeouton');
