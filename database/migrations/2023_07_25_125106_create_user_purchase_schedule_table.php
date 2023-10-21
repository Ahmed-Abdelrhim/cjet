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
        Schema::create('user_purchase_schedules', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->unsignedBigInteger('user_purchase_request_id');
            $table->foreign('user_purchase_request_id')->references('id')->on('user_purchase_requests');
            $table->unsignedBigInteger('service_provider_id')->nullable();
            $table->foreign('service_provider_id')->references('id')->on('service_providers');
            $table->string('user_purchase_reference');
            $table->enum('status', array('pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'))->default('pending');
            $table->date('scheduled_at');
            $table->integer('service_rate')->nullable();
            $table->date('reschedule_maximum_date');
            $table->unsignedBigInteger('actionable_id')->nullable();
            $table->string('actionable_type')->nullable();
            $table->enum('refund_status', array('pending', 'inprogress', 'refunded', 'non_refundable'))->nullable();
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_purchase_schedules');
    }
};
