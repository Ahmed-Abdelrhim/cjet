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
        Schema::create('user_purchase_requests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users') ;
            $table->string('user_purchase_reference')->nullable();
            $table->unsignedBigInteger('purchaseable_id');
            $table->string('purchaseable_type');
            $table->string('purchaseable_request_payment_reference');
            $table->unsignedBigInteger('user_address_id');
            $table->unsignedBigInteger('user_car_id');
            $table->unsignedBigInteger('user_payment_method_id');
            $table->unsignedBigInteger('service_provider_id')->nullable();
            $table->foreign('service_provider_id')->references('id')->on('service_providers') ;
            $table->boolean('is_renewable')->default(0);
            $table->string('selected_days')->nullable();
            $table->enum('status', array('payment','pending', 'inprogress','completed','cancelled','rescheduled'))->default('payment');
            $table->float('price')->default(0);
            $table->string('title_en');
            $table->string('title_ar');
            $table->string('description_en',500);
            $table->string('description_ar',500);
            $table->enum('payment_status', array('pending', 'success','failed'))->nullable();
            $table->string('payment_reference')->nullable();
            $table->unsignedBigInteger('root_purchase_request_id')->nullable();
            $table->unsignedBigInteger('actionable_id')->nullable();
            $table->string('actionable_type')->nullable();
            $table->enum('refund_status', array('pending', 'inprogress', 'refunded', 'non_refundable'))->nullable();
            $table->date('start_date');
            $table->date('end_date');
            $table->date('renewable_date')->nullable();
            $table->timestamps();
            $table->softDeletes();


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_purchase_requests');
    }
};
