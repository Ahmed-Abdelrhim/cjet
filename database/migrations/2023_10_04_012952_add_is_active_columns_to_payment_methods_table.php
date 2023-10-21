<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('user_payment_methods', function (Blueprint $table) {
      
            $table->boolean('is_active')->nullable()->default(1);            

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
   
    }
};