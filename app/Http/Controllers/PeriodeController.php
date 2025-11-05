<?php

namespace App\Http\Controllers;

use App\Models\Periode;
use Illuminate\Http\Request;

class PeriodeController extends Controller
{
    public function index()
    {
        $periodes = Periode::all();
        return view('periode.index', compact('periodes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'tahun' => 'required|unique:tb_periode',
            'nama' => 'required',
        ]);

        Periode::create($request->all());
        return back()->with('success', 'Periode berhasil ditambahkan.');
    }

    public function destroy($tahun)
    {
        Periode::where('tahun', $tahun)->delete();
        return back()->with('success', 'Periode berhasil dihapus.');
    }
}
