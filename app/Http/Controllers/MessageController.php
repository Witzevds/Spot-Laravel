<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    // Haal alle berichten op
    public function index()
    {
        $messages = Message::all(); // Alle berichten ophalen
        return view('messages.index', compact('messages'));
    }

    // Toon het formulier voor het aanmaken van een nieuw bericht
    public function create()
    {
        return view('messages.create');
    }

    // Sla een nieuw bericht op in de database
    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required|string|max:255', // Validatie voor content
        ]);

        // Maak een nieuw bericht
        Message::create([
            'content' => $request->content,
        ]);

        return redirect()->route('messages.create')->with('success', 'Message created successfully!');
    }

    // Toon het formulier voor het bewerken van een bericht
    public function edit($id)
    {
        $message = Message::findOrFail($id); // Zoek het bericht op basis van ID
        return view('messages.edit', compact('message')); // Geef het bericht door aan de view
    }

    // Werk een bericht bij
    public function update(Request $request, $id)
    {
        $message = Message::findOrFail($id); // Zoek het bericht op basis van ID

        $request->validate([
            'content' => 'required|string|max:255', // Validatie voor content
        ]);

        // Werk het bericht bij
        $message->update([
            'content' => $request->content, // Werk de content bij
        ]);

        return redirect()->route('messages.index')->with('success', 'Message updated successfully!');
    }

    // Verwijder een bericht
    public function destroy($id)
    {
        $message = Message::findOrFail($id); // Zoek het bericht op basis van ID
        $message->delete(); // Verwijder het bericht

        return redirect()->route('messages.index')->with('success', 'Message deleted successfully!');
    }
}
