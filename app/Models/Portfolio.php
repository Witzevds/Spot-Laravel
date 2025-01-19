<?php

// app/Models/Portfolio.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'title', 'description', 'link'];

    // Relatie met likes
    public function likes()
    {
        return $this->hasMany(Like::class);
    }
    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    // Relatie met comments
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    // Relatie met gebruiker
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
