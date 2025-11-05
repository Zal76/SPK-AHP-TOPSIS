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
        Schema::create('tb_penilaian', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('alternatif_id');
            $table->unsignedBigInteger('kriteria_id');
            $table->double('nilai');
            $table->timestamps();

            // Relasi ke tabel alternatif dan kriteria
            $table->foreign('alternatif_id')
                  ->references('id')
                  ->on('tb_alternatif')
                  ->onDelete('cascade');

            $table->foreign('kriteria_id')
                  ->references('id')
                  ->on('tb_kriteria')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_penilaian');
    }
};
