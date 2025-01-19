<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PortfolioController;
use App\Http\Controllers\UserController;


Route::get('/', function () {
    return view('home');
});

Route::get('/portfolios/create', [PortfolioController::class, 'create'])->name('portfolios.create');

// Route om het portfolio op te slaan in de database
Route::post('/portfolios', [PortfolioController::class, 'store'])->name('portfolios.store');

Route::get('/explore', [PortfolioController::class, 'index'])->middleware(['auth', 'verified'])->name('portfolios.index');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/profile', [UserController::class, 'show'])->name('profile.show');

    // Like een portfolio
    Route::post('/portfolio/{portfolioId}/like', [PortfolioController::class, 'like'])->name('portfolio.like');

    // Voeg een comment toe
    Route::post('/portfolio/{portfolioId}/comment', [PortfolioController::class, 'comment'])->name('portfolio.comment');
});

Route::resource('portfolios', PortfolioController::class)->middleware('auth');

// Route voor het profiel van een gebruiker
Route::get('/user/{user:id}', [UserController::class, 'show'])->name('user.show');



Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

require __DIR__ . '/auth.php';
