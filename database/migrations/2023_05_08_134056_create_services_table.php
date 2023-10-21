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
        Schema::create('services', function (Blueprint $table) {
            $table->id();
            $table->integer('service_type_id');
            $table->string('title_en');
            $table->string('title_ar');
            $table->string('short_description_en');
            $table->string('short_description_ar');
            $table->string('image_en');
            $table->string('image_ar');
            $table->string('description_en',500)->nullable();
            $table->string('description_ar',500)->nullable();
            $table->float('price')->default(0);
            $table->boolean('is_active')->default(1);
            $table->boolean('is_price_options')->default(0);
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('services');
    }
};
