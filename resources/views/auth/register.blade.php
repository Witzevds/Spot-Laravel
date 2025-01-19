<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    @vite('resources/css/app.css')
</head>

<body>
    <!-- Session Status -->
    <x-auth-session-status :status="session('status')" />

    <div class="login">
        <div class="login__left">
            <img class="login__left--image" src="{{ asset('./images/logo-black.svg') }}" alt="">
            <h1 class="login__left--slogan">show your talent</h1>
        </div>
        <div class="login__right">
            <div class="login__right--top">
                <div>
                    <a class="top__left" href="/"><img class="top__left--back"
                            src="{{ asset('./images/Shape.svg') }}" alt="">
                        <h1>home</h1>
                    </a>
                </div>
                <div>
                    <div class="top__right">
                        <p>already a member?</p>
                        <a href="/login">login</a>
                    </div>
                    <div></div>
                </div>
            </div>

            <div class="login__right--mid">
                <form class="mid__form" method="POST" action="{{ route('register') }}">
                    @csrf

                    <!-- Name -->
                    <x-text-input id="name" type="text" name="name" :value="old('name')" required autofocus
                        autocomplete="name" placeholder="Name" />
                    <x-input-error :messages="$errors->get('name')" />

                    <!-- Email Address -->
                    <x-text-input id="email" type="email" name="email" :value="old('email')" required
                        autocomplete="username" placeholder="example@gmail.com" />
                    <x-input-error :messages="$errors->get('email')" />

                    <!-- Password -->
                    <x-text-input id="password" type="password" name="password" required autocomplete="new-password"
                        placeholder="*********" />
                    <x-input-error :messages="$errors->get('password')" />

                    <!-- Confirm Password -->
                    <x-text-input id="password_confirmation" type="password" name="password_confirmation" required
                        autocomplete="new-password" placeholder="*********" />
                    <x-input-error :messages="$errors->get('password_confirmation')" />

                    <div class="flex items-center justify-end mt-4">
                        <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            href="{{ route('login') }}">
                            {{ __('Already registered?') }}
                        </a>

                        <x-primary-button class="login-btn">
                            {{ __('Register') }}
                        </x-primary-button>
                    </div>
                </form>
            </div>
            <div class="login__right--bot"></div>
        </div>
    </div>

</body>

</html>
