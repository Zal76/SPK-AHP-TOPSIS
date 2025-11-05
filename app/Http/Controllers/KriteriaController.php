<?php

namespace App\Http\Controllers;

use App\Models\Kriteria;
use App\Models\Periode;
use Illuminate\Http\Request;

class KriteriaController extends Controller
{
    public function index()
    {
        $periodes = Periode::all();
        $kriterias = Kriteria::all();
        return view('kriteria.index', compact('periodes', 'kriterias'));
    }

    public function update(Request $request, $kode)
{
    $request->validate([
        'nama_kriteria' => 'required',
        'atribut' => 'required',
        'tahun' => 'required',
    ]);

    $kriteria = Kriteria::where('kode_kriteria', $kode)->firstOrFail();
    $kriteria->update([
        'nama_kriteria' => $request->nama_kriteria,
        'atribut' => $request->atribut,
        'tahun' => $request->tahun,
    ]);

    return back()->with('success', 'Kriteria berhasil diperbarui.');
}

    public function store(Request $request)
    {
            $request->validate([
            'kode_kriteria' => 'required',
            'nama_kriteria' => 'required',
            'atribut' => 'required',
            'tahun' => 'required',
        ]);


        Kriteria::create($request->all());
        return back()->with('success', 'Kriteria berhasil ditambahkan.');
    }

    public function destroy($kode)
    {
        Kriteria::where('kode_kriteria', $kode)->delete();
        return back()->with('success', 'Kriteria berhasil dihapus.');
    }   
}
