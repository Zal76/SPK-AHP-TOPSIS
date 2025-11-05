<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Periode extends Model
{
    use HasFactory;

    protected $table = 'tb_periode';
    protected $primaryKey = 'tahun';
    public $incrementing = false; // karena kolom primary key-nya bukan auto-increment
    protected $keyType = 'string'; // tipe data year
    protected $fillable = ['tahun', 'nama', 'keterangan'];

    // Relasi: 1 periode punya banyak kriteria dan alternatif
    public function kriterias()
    {
        return $this->hasMany(Kriteria::class, 'tahun', 'tahun');
    }

    public function alternatifs()
    {
        return $this->hasMany(Alternatif::class, 'tahun', 'tahun');
    }
}
