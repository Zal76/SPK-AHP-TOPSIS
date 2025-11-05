<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('tb_rel_alternatif', function (Blueprint $table) {
            $table->id();
            $table->year('tahun')->nullable();
            $table->string('kode_alternatif', 16)->nullable();
            $table->string('kode_kriteria', 16)->nullable();
            $table->double('nilai')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('tb_rel_alternatif');
    }
};
