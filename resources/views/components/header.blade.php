<!-- resources/views/components/header.blade.php -->
<header class="header">

    <a href="/"><img class="header__logo" src="{{ asset('images/logo-black.svg') }}" alt=""></a>
    <nav class="nav">
        <ul class="nav__left">
            <li><a href="/">Home</a></li>

            <!-- Link naar je eigen profiel -->
            @auth
                <a href="{{ route('user.show', auth()->user()->id) }}">
                    {{ auth()->user()->name }}'s portfolio
                </a>
            @else
                <!-- Optionally, show something else if not logged in -->
                <a href="/login">Login</a>
            @endauth
            <li><a href="/explore">Explore</a></li>

        </ul>
        <ul class="nav__right">
            <li>

            </li>

            @auth
                <!-- Als de gebruiker is ingelogd -->
                <li><a href="/profile">{{ auth()->user()->name }}</a></li>
                <li>
                    <form action="{{ route('logout') }}" method="POST" style="display:inline;">
                        @csrf
                        <button type="submit" class="logout-button">Logout</button>
                    </form>
                </li>
            @else
                <!-- Als de gebruiker niet is ingelogd -->
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
            @endauth
        </ul>
    </nav>
</header>
