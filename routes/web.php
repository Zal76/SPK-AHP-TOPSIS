<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    PeriodeController,
    KriteriaController,
    AlternatifController,
    PembobotanController,
    PerhitunganController,
    RelKriteriaController,
    RelAlternatifController,
    HasilController,
    PenilaianController
};

// =======================
// DASHBOARD
// =======================
Route::get('/', function () {
    $alternatifCount = \App\Models\Alternatif::count();
    $kriteriaCount = \App\Models\Kriteria::count();
    $pembobotanCount = \App\Models\RelKriteria::count();
    $perhitunganCount = \App\Models\RelAlternatif::count();

    return view('dashboard.index', compact(
        'alternatifCount',
        'kriteriaCount',
        'pembobotanCount',
        'perhitunganCount'
    ));
})->name('dashboard');

// =======================
// CRUD UTAMA
// =======================
Route::resource('periode', PeriodeController::class);
Route::resource('kriteria', KriteriaController::class);
Route::resource('alternatif', AlternatifController::class);

// =======================
// RELASI KRITERIA (AHP)
// =======================
Route::get('/rel-kriteria', [RelKriteriaController::class, 'index'])->name('relkriteria.index');
Route::post('/rel-kriteria', [RelKriteriaController::class, 'store'])->name('relkriteria.store');

// =======================
// RELASI ALTERNATIF (TOPSIS)
// =======================
Route::get('/rel-alternatif', [RelAlternatifController::class, 'index'])->name('relalternatif.index');
Route::post('/rel-alternatif', [RelAlternatifController::class, 'store'])->name('relalternatif.store');

// =======================
// PEMBOBOTAN KRITERIA (AHP)
// =======================
Route::get('/pembobotan', [PembobotanController::class, 'index'])->name('pembobotan.index');
Route::post('/pembobotan/update', [PembobotanController::class, 'updateNilai'])->name('pembobotan.update');
Route::post('/pembobotan/hitung', [PembobotanController::class, 'hitung'])->name('pembobotan.hitung');

// =======================
// PENILAIAN ALTERNATIF
// =======================
Route::get('/penilaian', [PenilaianController::class, 'index'])->name('penilaian.index');
Route::post('/penilaian/simpan', [PenilaianController::class, 'store'])->name('penilaian.store');

// =======================
// FORM NILAI ALTERNATIF (JIKA ADA)
// =======================
Route::get('/alternatif/nilai', [AlternatifController::class, 'formNilai'])->name('alternatif.formNilai');
Route::post('/alternatif/nilai', [AlternatifController::class, 'simpanNilai'])->name('alternatif.simpanNilai');

// =======================
// PERHITUNGAN AHP & TOPSIS
// =======================
Route::get('/perhitungan', [PerhitunganController::class, 'index'])->name('perhitungan.index');

// =======================
// HASIL AKHIR
// =======================
Route::get('/hasil', [HasilController::class, 'index'])->name('hasil.index');
Route::post('/hasil/hitung', [HasilController::class, 'hitung'])->name('hasil.hitung');
