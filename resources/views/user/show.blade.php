@extends('layouts.app')

@section('content')
    <div class="profile-container">
        <div class="profile-header">
            <h1 class="profile-name">{{ $user->name }}</h1>
            <p class="profile-email">Email: {{ $user->email }}</p>
            <p class="profile-joined">Joined: {{ $user->created_at->format('d M Y') }}</p>
            <div class="profile-likes">
                <h2>Total Likes: <span class="likes-count">{{ $totalLikes }}</span></h2>
            </div>
        </div>

        <div class="profile-portfolios">

            <div class="cards-container">
                @forelse ($portfolios as $portfolio)
                    <x-portfolio-card :portfolio="$portfolio" />
                @empty
                    <p>No portfolios yet. <a href="{{ route('portfolios.create') }}">Create one now!</a></p>
                @endforelse
            </div>
        </div>
    </div>
@endsection
