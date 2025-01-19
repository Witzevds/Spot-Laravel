<?php

// database/migrations/xxxx_xx_xx_xxxxxx_create_likes_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLikesTable extends Migration
{
    public function up()
    {
        Schema::create('likes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // Gebruiker die de like gaf
            $table->foreignId('portfolio_id')->constrained()->onDelete('cascade'); // Het portfolio dat geliket wordt
            $table->timestamps();

            $table->unique(['user_id', 'portfolio_id']); // Zorg ervoor dat een gebruiker maar 1 keer kan liken per portfolio
        });
    }

    public function down()
    {
        Schema::dropIfExists('likes');
    }
}
