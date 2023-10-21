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
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('order_id');
            $table->bigInteger('user_id');
            $table->bigInteger('user_purchase_request_id');
            $table->string('payment_status')->nullable();
            $table->string('payment_pending')->nullable();
            $table->string('amount')->nullable();
            $table->string('currency')->nullable();
            $table->bigInteger('paymob_transaction_id')->nullable();
            $table->dateTime('paid_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment');
    }
};
