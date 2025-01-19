<?php

// app/Models/Comment.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
  use HasFactory;

  protected $fillable = ['user_id', 'portfolio_id', 'comment'];

  // Relatie met user
  public function user()
  {
    return $this->belongsTo(User::class);
  }

  // Relatie met portfolio
  public function portfolio()
  {
    return $this->belongsTo(Portfolio::class);
  }
}
