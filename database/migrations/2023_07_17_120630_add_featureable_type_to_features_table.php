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
    //     Schema::table('features', function (Blueprint $table) {
    //         $table->unsignedBigInteger('featureable_id')->after('id');
    //         $table->string('featureable_type')->after('featureable_id');
    //     });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Schema::table('features', function (Blueprint $table) {
        //     $table->dropColumn('featureable_id');
        //     $table->dropColumn('featureable_type');
        // });
    }
};
