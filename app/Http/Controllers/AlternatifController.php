<?php

namespace App\Http\Controllers;

use App\Models\Alternatif;
use App\Models\Periode;
use Illuminate\Http\Request;

class AlternatifController extends Controller
{
    public function index()
    {
        $periodes = Periode::all();
        $alternatifs = Alternatif::all();
        return view('alternatif.index', compact('periodes', 'alternatifs'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_alternatif' => 'required|unique:tb_alternatif',
            'nama_alternatif' => 'required',
            'deskripsi' => 'nullable',
            'tahun' => 'required',
        ]);

        Alternatif::create($request->all());
        return back()->with('success', 'Alternatif berhasil ditambahkan.');
    }

    public function update(Request $request, $kode)
{
    $data = $request->validate([
    'kode_alternatif' => 'required',
    'nama_alternatif' => 'required',
    'deskripsi' => 'nullable',
    'tahun' => 'required',
    ]);

    Alternatif::where('kode_alternatif', $kode)->update($data);
    return back()->with('success', 'Alternatif berhasil diperbarui.');
}

    public function destroy($kode)
    {
        Alternatif::where('kode_alternatif', $kode)->delete();
        return back()->with('success', 'Alternatif berhasil dihapus.');
    }
}


