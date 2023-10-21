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
        Schema::create('user_purchase_price_options', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_purchase_request_id');
            $table->foreign('user_purchase_request_id')->references('id')->on('user_purchase_requests');
            $table->unsignedBigInteger('user_purchase_schedule_id')->nullable();
            $table->foreign('user_purchase_schedule_id')->references('id')->on('user_purchase_schedules');
            $table->unsignedBigInteger('price_option_id');
            $table->foreign('price_option_id')->references('id')->on('price_options');
            $table->string('title_en');
            $table->string('title_ar');
            $table->float('price')->default(0);
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_purchase_price_options');
    }
};
