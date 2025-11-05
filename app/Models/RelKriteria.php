<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelKriteria extends Model
{
    use HasFactory;

    protected $table = 'tb_rel_kriteria';
    protected $fillable = ['tahun', 'ID1', 'ID2', 'nilai'];

    // Relasi ke kriteria (dua arah)
    public function kriteria1()
    {
        return $this->belongsTo(Kriteria::class, 'ID1', 'kode_kriteria');
    }

    public function kriteria2()
    {
        return $this->belongsTo(Kriteria::class, 'ID2', 'kode_kriteria');
    }

    public function periode()
    {
        return $this->belongsTo(Periode::class, 'tahun', 'tahun');
    }
}
