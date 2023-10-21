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
            $table->boolean('is_reschedule_handled')->nullable()->after('rescheduled_at');
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('user_purchase_schedules', function (Blueprint $table) {
            $table->dropColumn('is_reschedule_handled');
        });
    }
};
