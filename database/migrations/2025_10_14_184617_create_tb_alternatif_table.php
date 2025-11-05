<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_alternatif', function (Blueprint $table) {
            $table->id(); // <- penting! tipe BIGINT UNSIGNED
            $table->string('kode_alternatif')->unique();
            $table->string('nama_alternatif');
            $table->text('deskripsi')->nullable();
            $table->year('tahun')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_alternatif');
    }
};
