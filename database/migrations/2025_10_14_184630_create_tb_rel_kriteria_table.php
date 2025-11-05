<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        // Jika file ini sebenarnya untuk relasi, tambahkan tabel relasinya di sini,
        // bukan modifikasi tb_kriteria lagi
        Schema::create('tb_rel_kriteria', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('kriteria_1');
            $table->unsignedBigInteger('kriteria_2');
            $table->double('nilai');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tb_rel_kriteria');
    }
};
