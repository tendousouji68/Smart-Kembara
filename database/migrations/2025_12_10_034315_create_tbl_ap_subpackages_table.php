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
        Schema::create('tbl_ap_subpackages', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('package_id');
        $table->string('name');
        $table->string('picture')->nullable();
        $table->string('description')->nullable();
        $table->string('price')->nullable(); // your table shows price as varchar
        $table->timestamps();

        // FK
        $table->foreign('package_id')
              ->references('id')->on('tbl_ap_packages')
              ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_ap_subpackages');
    }
};
