<?php

namespace App\Http\Controllers;

use App\Models\Message;

class DashboardController extends Controller
{
  public function index()
  {
    // Fetch all messages from the database
    $messages = Message::all();

    // Pass messages to the dashboard view
    return view('dashboard', compact('messages'));
  }
}
