<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tb_rel_kriteria', function (Blueprint $table) {
            if (!Schema::hasColumn('tb_rel_kriteria', 'kode_kriteria1')) {
                $table->string('kode_kriteria1')->after('id');
            }

            if (!Schema::hasColumn('tb_rel_kriteria', 'kode_kriteria2')) {
                $table->string('kode_kriteria2')->after('kode_kriteria1');
            }

            if (!Schema::hasColumn('tb_rel_kriteria', 'nilai')) {
                $table->double('nilai')->default(1)->after('kode_kriteria2');
            }

            if (!Schema::hasColumn('tb_rel_kriteria', 'tahun')) {
                $table->year('tahun')->nullable()->after('nilai');
            }
        });
    }

    public function down(): void
    {
        Schema::table('tb_rel_kriteria', function (Blueprint $table) {
            $table->dropColumn(['kode_kriteria1', 'kode_kriteria2', 'nilai', 'tahun']);
        });
    }
};
