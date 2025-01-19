<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    // Methode voor de homepagina
    public function index()
    {
        // Data die we aan de view willen doorgeven
        $navItems = ['item1', 'item2', 'item3', 'item4', 'item5'];

        // Retourneer de view en geef de data door
        return view('home', ['items' => $navItems]);
    }
}
