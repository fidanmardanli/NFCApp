<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::table('personal_informations', function (Blueprint $table) {
            $table->integer('myRoomID')->nullable();
        });
    }

    public function down()
    {
        Schema::table('personal_informations', function (Blueprint $table) {
            $table->dropColumn('myRoomID');
        });
    }
};

