<?php


use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('portfolios', function (Blueprint $table) {
            // Add the 'image' column
            $table->string('image')->nullable();  // Nullable in case no image is uploaded
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('portfolios', function (Blueprint $table) {
            // Drop the 'image' column if we rollback
            $table->dropColumn('image');
        });
    }
};
