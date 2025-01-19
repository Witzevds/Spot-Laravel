@extends('layouts.app')

@section('content')
    <div class="edit-portfolio-container">
        <h1 class="edit-portfolio-title">Edit Portfolio Item</h1>

        <form action="{{ route('portfolios.update', $portfolio) }}" method="POST" class="edit-portfolio-form">
            @csrf
            @method('PUT')

            <div class="form-group">
                <label for="title" class="form-label">Title:</label>
                <input type="text" name="title" id="title" value="{{ $portfolio->title }}" class="form-input"
                    required>
            </div>

            <div class="form-group">
                <label for="tags" class="form-label">Tags:</label>
                <select name="tags[]" id="tags" multiple class="form-select">
                    @foreach ($tags as $tag)
                        <option value="{{ $tag->id }}"
                            {{ in_array($tag->id, old('tags', $portfolio->tags->pluck('id')->toArray() ?? [])) ? 'selected' : '' }}>
                            {{ $tag->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="description" class="form-label">Description:</label>
                <textarea name="description" id="description" class="form-textarea" required>{{ $portfolio->description }}</textarea>
            </div>

            <div class="form-group">
                <label for="link" class="form-label">Project Link:</label>
                <input type="url" name="link" id="link" value="{{ $portfolio->link }}" class="form-input">
            </div>

            <button type="submit" class="submit-button">Update Portfolio</button>
        </form>
    </div>
@endsection
