<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Kriteria;
use App\Models\Alternatif;

class PenilaianController extends Controller
{
    public function index()
    {
        $kriterias = Kriteria::all();
        $alternatifs = Alternatif::all();

        // ambil penilaian lama kalau ada
        $penilaian = DB::table('tb_penilaian')->get();

        return view('penilaian.index', compact('kriterias', 'alternatifs', 'penilaian'));
    }

    public function store(Request $request)
    {
        foreach ($request->alternatif as $altId => $nilaiKriteria) {
            foreach ($nilaiKriteria as $kritId => $nilai) {
                DB::table('tb_penilaian')->updateOrInsert(
                    ['alternatif_id' => $altId, 'kriteria_id' => $kritId],
                    ['nilai' => $nilai]
                );
            }
        }

        return redirect()->route('penilaian.index')->with('success', 'Penilaian berhasil disimpan!');
    }
}
