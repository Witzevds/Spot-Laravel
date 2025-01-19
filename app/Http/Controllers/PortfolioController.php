<?php

namespace App\Http\Controllers;

use App\Models\Portfolio;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Tag;

class PortfolioController extends Controller
{
    public function index(Request $request)
    {
        $query = $request->get('query');
        $portfoliosQuery = Portfolio::query();

        // Zoek op titel
        if ($query) {
            $portfoliosQuery->where(function ($queryBuilder) use ($query) {
                // Zoek op titel
                $queryBuilder->where('title', 'like', "%{$query}%")
                    // Zoek op gebruikersnaam
                    ->orWhereHas('user', function ($userQuery) use ($query) {
                        $userQuery->where('name', 'like', "%{$query}%");
                    })
                    // Zoek op tags
                    ->orWhereHas('tags', function ($tagQuery) use ($query) {
                        $tagQuery->where('name', 'like', "%{$query}%");
                    });
            });
        }

        // Haal de portfolios op, bijvoorbeeld 6 per pagina
        $portfolios = $portfoliosQuery->paginate(6);

        // Haal de top 3 meest gelikete portfolios op
        $topPortfolios = Portfolio::withCount('likes')
            ->orderByDesc('likes_count')
            ->take(3)
            ->get();

        return view('explore', compact('portfolios', 'topPortfolios'));
    }

    public function create()
    {
        $tags = Tag::all(); // Haal alle tags op
        return view('create-portfolio', compact('tags')); // Geef ze door aan de view
    }

    public function like($portfolioId)
    {
        $portfolio = Portfolio::findOrFail($portfolioId);

        $userId = auth()->id();

        // Controleer of de gebruiker de portfolio al heeft geliket
        $like = $portfolio->likes()->where('user_id', $userId)->first();

        if ($like) {
            // Verwijder de like als deze al bestaat
            $like->delete();
            return back()->with('success', 'You unliked this portfolio!');
        } else {
            // Voeg de like toe als deze nog niet bestaat
            $portfolio->likes()->create([
                'user_id' => $userId,
            ]);
            return back()->with('success', 'You liked this portfolio!');
        }
    }

    public function comment(Request $request, $portfolioId)
    {
        $portfolio = Portfolio::findOrFail($portfolioId);

        // Validate comment
        $request->validate([
            'comment' => 'required|string|max:500',
        ]);

        // Create a new comment
        $portfolio->comments()->create([
            'user_id' => auth()->id(),
            'comment' => $request->comment,
        ]);

        return back()->with('success', 'Your comment has been posted!');
    }

    // Bewaar het portfolio in de database, inclusief afbeelding
    public function store(Request $request)
    {
        // Validate the incoming request
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048', // Validation for image
            'link' => 'nullable|url',
            'tags' => 'nullable|string',
        ]);

        // Handle image upload
        if ($request->hasFile('image')) {
            // Store the image in the 'public/portfolios' directory
            $imagePath = $request->file('image')->store('portfolios', 'public');
        } else {
            $imagePath = null; // No image uploaded
        }

        // Create a new portfolio record and save it to the database
        $portfolio = new Portfolio();
        $portfolio->title = $validated['title'];
        $portfolio->description = $validated['description'];
        $portfolio->link = $validated['link'];
        $portfolio->image = $imagePath;  // Store the relative image path in the database
        $portfolio->user_id = auth()->id(); // Assuming the user is logged in
        $portfolio->save();

        if (!empty($validated['tags'])) {
            $tags = explode(',', $validated['tags']);
            $tagIds = [];

            foreach ($tags as $tagName) {
                $tagName = trim($tagName);
                $tag = Tag::firstOrCreate(['name' => $tagName]);
                $tagIds[] = $tag->id;
            }

            $portfolio->tags()->sync($tagIds); // Tags koppelen
        }
        // Redirect or return a success message
        return redirect()->route('portfolios.index')->with('success', 'Portfolio created successfully!');
    }




    public function show($id)
    {
        $portfolio = Portfolio::with('user')->findOrFail($id);

        return view('portfolios.show', compact('portfolio'));
    }

    public function edit($id)
    {
        $portfolio = Portfolio::findOrFail($id);

        if ($portfolio->user_id !== auth()->id()) {
            return redirect()->route('portfolios.index')->with('error', 'Unauthorized access');
        }

        $tags = Tag::all(); // Ophalen van alle beschikbare tags
        return view('portfolios.edit', [
            'portfolio' => $portfolio,
            'tags' => $tags, // Tags doorgeven aan de view
        ]);
    }

    public function update(Request $request, $id)
    {
        $portfolio = Portfolio::findOrFail($id);

        if ($portfolio->user_id !== auth()->id()) {
            return redirect()->route('portfolios.index')->with('error', 'Unauthorized access');
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'link' => 'nullable|url',
            'image' => 'nullable|image',
            'tags' => 'nullable|string',
        ]);

        $portfolio->update($request->all());

        return redirect()->route('portfolios.index')->with('success', 'Portfolio updated!');
    }

    public function destroy($id)
    {
        $portfolio = Portfolio::findOrFail($id);

        if ($portfolio->user_id !== auth()->id()) {
            return redirect()->route('portfolios.index')->with('error', 'Unauthorized access');
        }
        if ($portfolio->image) {
            Storage::delete('public/' . $portfolio->image);
        }

        $portfolio->delete();

        return redirect()->route('portfolios.index')->with('success', 'Portfolio deleted!');
    }
}
