<?php

// database/migrations/xxxx_xx_xx_xxxxxx_create_comments_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration
{
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // Gebruiker die de comment maakte
            $table->foreignId('portfolio_id')->constrained()->onDelete('cascade'); // Het portfolio dat de comment kreeg
            $table->text('comment'); // De comment tekst
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('comments');
    }
}
