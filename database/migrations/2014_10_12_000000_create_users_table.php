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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('password')->nullable();
            $table->string('email')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('phone',11)->nullable()->unique();
            $table->timestamp('phone_verified_at')->nullable();
            $table->string('temp_phone',11)->nullable();
            $table->string('apple_social_id')->nullable();
            $table->string('google_social_id')->nullable();
            $table->string('facebook_social_id')->nullable();
            $table->string('image')->nullable();
            $table->enum('lang',['en','ar'])->default('en');
            $table->boolean('is_sms_offers')->default(1);
            $table->timestamp('last_activity_at')->nullable();
            $table->rememberToken();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
