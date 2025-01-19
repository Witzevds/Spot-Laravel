<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>

<body>
    <h1>Messages</h1>
    <a href="/messages/create">Create a new message</a>

    <ul>
        @foreach ($messages as $message)
            <li>
                {{ $message->content }}
                <a href="{{ route('messages.edit', $message->id) }}">Edit</a>

                <!-- Formulier voor verwijderen van berichten -->
                <form action="{{ route('messages.destroy', $message->id) }}" method="POST" style="display:inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit"
                        onclick="return confirm('Are you sure you want to delete this message?')">Delete</button>
                </form>
            </li>
        @endforeach

    </ul>
</body>

</html>
