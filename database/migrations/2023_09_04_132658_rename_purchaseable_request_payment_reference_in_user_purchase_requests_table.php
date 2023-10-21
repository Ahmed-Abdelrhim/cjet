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
        Schema::table('user_purchase_requests', function (Blueprint $table) {
            $table->renameColumn('purchaseable_request_payment_reference', 'invoice_reference_number');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('user_purchase_requests', function (Blueprint $table) {
            $table->renameColumn('invoice_reference_number', 'purchaseable_request_payment_reference');
        });
    }
};
