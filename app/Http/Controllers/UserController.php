<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Portfolio;

class UserController extends Controller
{
    public function show(User $user = null)
    {
        // Als de gebruiker geen ID heeft, haal de ingelogde gebruiker op
        if (!$user) {
            $user = auth()->user();
        }

        // Haal de portfolios van de geselecteerde gebruiker op
        $portfolios = Portfolio::where('user_id', $user->id)->get();
        $totalLikes = $portfolios->sum(function ($portfolio) {
            return $portfolio->likes->count();
        });

        // Pass the portfolios and totalLikes to the view
        return view('user.show', compact('user', 'portfolios', 'totalLikes'));
        // Retourneer de view met de gegevens van de gebruiker en portfolios
        return view('user.show', compact('user', 'portfolios'));
    }
}
