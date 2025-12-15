<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblGiCountryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_gi_country', function (Blueprint $table) {
            $table->id();
            $table->string('Country')->nullable();
            $table->string('CountryCode')->nullable();
            $table->string('CountryPhoneCode')->nullable();
            $table->integer('StatusCountry')->nullable();
            $table->string('Remarks')->nullable();
            $table->timestamps();

            // Foreign key constraint referencing the tbl_gi_status table
            $table->foreign('StatusCountry')->references('id')->on('tbl_gi_status');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_gi_country');
    }
}
