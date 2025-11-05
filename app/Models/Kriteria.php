<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kriteria extends Model
{
    use HasFactory;

    protected $table = 'tb_kriteria';
    protected $primaryKey = 'kode_kriteria';
    public $incrementing = false;
    protected $keyType = 'string';
    protected $fillable = ['kode_kriteria', 'tahun', 'nama_kriteria', 'atribut'];

    // Relasi ke periode
    public function periode()
    {
        return $this->belongsTo(Periode::class, 'tahun', 'tahun');
    }

    // Relasi ke perbandingan antar kriteria (AHP)
    public function relKriteria1()
    {
        return $this->hasMany(RelKriteria::class, 'ID1', 'kode_kriteria');
    }

    public function relKriteria2()
    {
        return $this->hasMany(RelKriteria::class, 'ID2', 'kode_kriteria');
    }

    // Relasi ke nilai alternatif
    public function relAlternatif()
    {
        return $this->hasMany(RelAlternatif::class, 'kode_kriteria', 'kode_kriteria');
    }
}
