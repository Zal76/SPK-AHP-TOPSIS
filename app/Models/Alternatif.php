<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Alternatif extends Model
{
    use HasFactory;

    protected $table = 'tb_alternatif';
    protected $primaryKey = 'kode_alternatif';
    public $incrementing = false;
    protected $keyType = 'string';
    protected $fillable = [
        'kode_alternatif', 'tahun', 'nama_alternatif', 'deskripsi', 'total', 'rank'
    ];

    // Relasi ke periode
    public function periode()
    {
        return $this->belongsTo(Periode::class, 'tahun', 'tahun');
    }

    // Relasi ke relasi nilai alternatif (matriks keputusan TOPSIS)
    public function relAlternatif()
    {
        return $this->hasMany(RelAlternatif::class, 'kode_alternatif', 'kode_alternatif');
    }
}
