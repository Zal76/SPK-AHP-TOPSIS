<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penilaian extends Model
{
    use HasFactory;

    // Tabel aslinya
    protected $table = 'tb_penilaian';

    // Kolom yang bisa diisi
    protected $fillable = [
        'kode_alternatif',
        'kode_kriteria',
        'nilai',
    ];
}
