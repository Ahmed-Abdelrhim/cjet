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
        Schema::table('user_purchase_schedules', function (Blueprint $table) {
            $table->timestamp('assigned_at')->nullable()->after('service_provider_id');
            $table->timestamp('cancelled_at')->nullable()->after('refund_status');            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('user_purchase_schedules', function (Blueprint $table) {
            $table->dropColumn('assigned_at');
            $table->dropColumn('cancelled_at');
            
        });
    }
};
