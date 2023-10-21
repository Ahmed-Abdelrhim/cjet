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
        Schema::create('otps', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('otp');
            $table->integer('attempts_count')->default(0);
            $table->integer('send_count')->default(0);
            $table->integer('is_send_count')->default(0);
            $table->timestamp('expire_at')->nullable();
            $table->timestamp('unblocked_at')->nullable();
            $table->boolean('is_success')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('otps');
    }
};
