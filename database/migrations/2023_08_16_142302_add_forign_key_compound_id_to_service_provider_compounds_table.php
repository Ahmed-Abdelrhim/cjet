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
        Schema::table('service_provider_compounds', function (Blueprint $table) {
            $table->foreign('compound_id')->references('id')->on('compounds') ;
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('service_provider_compounds', function (Blueprint $table) {
            $table->dropForeign(['compound_id']);
        });
    }
};
