<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Laravel Website</title>
    @vite('resources/css/app.css')
</head>

<body>
    @include('components.header')


    @include('components.hero')

    @include('components.two-column')

    @include('components.is-this-you')

    @include('components.cta')

    @include('components.footer')
</body>

</html>
