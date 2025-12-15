<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblGiStatusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_gi_status', function (Blueprint $table) {
            $table->id();  // Auto-incrementing primary key for the ID column
            $table->string('GeneralStatus');  // The 'GeneralStatus' column (e.g. 'Active', 'Passive')
            $table->text('Remarks');  // The 'Remarks' column to store remarks
            $table->timestamps();  // Created_at and updated_at columns
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_gi_status');
    }
}
