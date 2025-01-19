@extends('layouts.app')

@section('title', 'All Portfolios')
@section('meta_description', 'Browse through all the amazing portfolios from our community.')

@section('head')
    <script type="application/ld+json">
        {
            "@context": "https://schema.org",
            "@type": "CreativeWork",
            "name": "All Portfolios",
            "description": "Browse through the collection of portfolios created by our users.",
            "url": "{{ url()->current() }}",
            "creator": {
                "@type": "Organization",
                "name": "Your Website Name"
            }
        }
    </script>

    <meta property="og:title" content="All Portfolios">
    <meta property="og:description" content="Explore various portfolios created by talented users in our community.">
    <meta property="og:url" content="{{ url()->current() }}">
    <meta property="og:type" content="website">
    <meta property="og:image" content="{{ asset('images/logo-black.svg') }}">

    @vite('resources/css/app.css')
@endsection

@section('content')
    <div class="hero" style="background-image: url('{{ asset('images/hero-explore.svg') }}');">
        <h2 class="hero__h2">Discover the world's top designers</h2>
        <p class="hero__p">Explore work from the most talented and accomplished designers ready to take on your next project
        </p>
        <form method="GET" class="search-bar__hero">
            <input type="text" name="query" placeholder="Search portfolios, users or tags..."
                class="search-bar__input">
        </form>

        <div class="trending-searches">
            <div>Trending Searches</div>
            <div>
                <p class="trending-searches__btn">React</p>
            </div>
            <div>
                <p class="trending-searches__btn">Design</p>
            </div>
            <div>
                <p class="trending-searches__btn">Portfolio</p>
            </div>
            <div>
                <p class="trending-searches__btn">Web design</p>
            </div>
        </div>
    </div>

    <div class="cards-container">
        <!-- Highlight the top 3 most liked portfolios -->

        @foreach ($topPortfolios as $portfolio)
            <x-portfolio-card :portfolio="$portfolio" />
        @endforeach
    </div>

    <hr>

    <div class="cards-container">
        <!-- Display the rest of the portfolios -->

        @foreach ($portfolios as $portfolio)
            <x-portfolio-card :portfolio="$portfolio" />
        @endforeach
    </div>

    <!-- Pagination links -->
    <div class="pagination-container">
        {{ $portfolios->links() }}
    </div>

    <a href="/portfolios/create">Create a portfolio item!</a>
@endsection
