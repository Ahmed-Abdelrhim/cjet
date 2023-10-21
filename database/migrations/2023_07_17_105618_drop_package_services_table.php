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
        Schema::dropIfExists('package_services');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::create('package_services', function (Blueprint $table) {
            $table->id();
            $table->integer('package_id');
            $table->integer('service_id');
            $table->timestamps();
        });
    }
};
