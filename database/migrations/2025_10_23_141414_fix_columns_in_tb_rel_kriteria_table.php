<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tb_rel_kriteria', function (Blueprint $table) {
            // Hapus kolom lama jika ada
            if (Schema::hasColumn('tb_rel_kriteria', 'kriteria_1')) {
                $table->dropColumn('kriteria_1');
            }
            if (Schema::hasColumn('tb_rel_kriteria', 'kriteria_2')) {
                $table->dropColumn('kriteria_2');
            }

            // Tambahkan kolom baru jika belum ada
            if (!Schema::hasColumn('tb_rel_kriteria', 'kode_kriteria1')) {
                $table->string('kode_kriteria1')->nullable()->after('id');
            }
            if (!Schema::hasColumn('tb_rel_kriteria', 'kode_kriteria2')) {
                $table->string('kode_kriteria2')->nullable()->after('kode_kriteria1');
            }
        });
    }

    public function down(): void
    {
        Schema::table('tb_rel_kriteria', function (Blueprint $table) {
            if (Schema::hasColumn('tb_rel_kriteria', 'kode_kriteria1')) {
                $table->dropColumn('kode_kriteria1');
            }
            if (Schema::hasColumn('tb_rel_kriteria', 'kode_kriteria2')) {
                $table->dropColumn('kode_kriteria2');
            }

            $table->string('kriteria_1')->nullable();
            $table->string('kriteria_2')->nullable();
        });
    }
};
