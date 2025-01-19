<!-- resources/views/components/portfolio-card.blade.php -->

<div class="portfolio-card">
    <h2 class="portfolio-card__title">{{ $portfolio->title }}</h2>
    <p class="portfolio-card__description">{{ $portfolio->description }}</p>
    @if ($portfolio->link)
        <a href="{{ $portfolio->link }}" target="_blank" class="portfolio-card__view">View Project</a>
    @endif
    <p>Created by:
        <a href="{{ route('user.show', $portfolio->user->id) }}">
            {{ $portfolio->user->name }}
        </a>
    </p>

    <!-- Afbeelding van het portfolio -->
    @if ($portfolio->image)
        <img class="portfolio-card__image" src="{{ asset('storage/' . $portfolio->image) }}"
            alt="{{ $portfolio->title }} image" />
    @endif

    <!-- Acties voor het bewerken en verwijderen van het portfolio -->
    @if (auth()->id() === $portfolio->user_id)
        <div class="actions">
            <a class="portfolio-card__edit" href="{{ route('portfolios.edit', $portfolio) }}">Edit</a>
            <form action="{{ route('portfolios.destroy', $portfolio) }}" method="POST" style="display:inline;">
                @csrf
                @method('DELETE')
                <button class="portfolio-card__delete" type="submit"
                    onclick="return confirm('Are you sure?')">Delete</button>
            </form>
        </div>
    @endif

    <!-- Likes sectie -->

    <div class="portfolio-likes">
        <form action="{{ route('portfolio.like', $portfolio->id) }}" method="POST">
            @csrf
            <button type="submit" class="like-button-wrapper">
                @if ($portfolio->likes()->where('user_id', auth()->id())->exists())
                    <!-- Ingekleurd hartje -->
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                        viewBox="0 0 24 24" class="like-button">
                        <path
                            d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
                    </svg>
                @else
                    <!-- Uitgekleurd hartje -->
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                        viewBox="0 0 24 24" stroke="black" class="like-button">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4.318 6.318a4.5 4.5 0 016.364 0L12 7.657l1.318-1.339a4.5 4.5 0 116.364 6.364L12 21l-7.682-7.682a4.5 4.5 0 010-6.364z" />
                    </svg>
                @endif
            </button>
        </form>
        <p>{{ $portfolio->likes->count() }} likes</p>
    </div>


    <div class="portfolio-tags">
        @foreach ($portfolio->tags as $tag)
            <span class="tag">{{ $tag->name }}</span>
        @endforeach
    </div>

    <!-- Commentaar sectie -->
    <div class="comments-section">
        <h3>Comments:</h3>
        @foreach ($portfolio->comments as $comment)
            <p><strong>{{ $comment->user->name }}:</strong> {{ $comment->comment }}</p>
        @endforeach

        @if (auth()->check())
            <form action="{{ route('portfolio.comment', $portfolio->id) }}" method="POST">
                @csrf
                <textarea name="comment" placeholder="Add a comment..." required></textarea>
                <button type="submit">Post Comment</button>
            </form>
        @else
            <p>You need to be logged in to comment.</p>
        @endif
    </div>
</div>
