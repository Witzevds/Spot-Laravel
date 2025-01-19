@extends('layouts.app')

@section('content')
    <div class="create-container">
        <h1>Create Portfolio</h1>

        <form action="{{ route('portfolios.store') }}" method="POST" enctype="multipart/form-data" class="form">
            @csrf

            <div class="form-group">
                <label for="tags">Tags:</label>
                <input type="text" id="tags" name="tags" placeholder="Write tags and separate them with commas"
                    class="form-control">
            </div>

            <!-- Title -->
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" class="form-control" required>
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea name="description" id="description" class="form-control" rows="5" required></textarea>
            </div>

            <!-- Portfolio Image -->
            <div class="form-group">
                <label for="image">Portfolio Image:</label>
                <input type="file" id="image" name="image" accept="image/*" class="form-control">
                @error('image')
                    <p class="error-message">{{ $message }}</p>
                @enderror
            </div>

            <!-- Website Link (optional) -->
            <div class="form-group">
                <label for="link">Website Link (optional):</label>
                <input type="url" name="link" id="link" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Create Portfolio</button>
        </form>
    </div>
@endsection
