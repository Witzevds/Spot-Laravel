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

                        <p>not a member?</p>
                        <a href="/register">register now</a>

                    </div>
                    <div></div>
                </div>
            </div>

            <div class="login__right--mid">
                <form class="mid__form" method="POST" action="{{ route('login') }}">
                    @csrf

                    <!-- Email Address -->


                    <x-text-input id="email" type="email" name="email" :value="old('email')" required autofocus
                        autocomplete="username" placeholder="example@gmail.com" />
                    <x-input-error :messages="$errors->get('email')" />


                    <!-- Password -->


                    <x-text-input id="password" type="password" name="password" required
                        autocomplete="current-password" placeholder="*********" />
                    <x-input-error :messages="$errors->get('password')" />


                    <!-- Remember Me -->
                    <div>
                        <label class="remember-me" for="remember_me">
                            <input id="remember_me" type="checkbox" name="remember">
                            <span>{{ __('Remember me') }}</span>
                        </label>
                    </div>

                    <div>
                        @if (Route::has('password.request'))
                            <a href="{{ route('password.request') }}">
                                {{ __('Forgot your password?') }}
                            </a>
                        @endif

                        <x-primary-button class="login-btn">
                            {{ __('Log in') }}
                        </x-primary-button>

                    </div>
                </form>
            </div>
            <div class="login__right--bot"></div>


        </div>
    </div>

</body>

</html>
