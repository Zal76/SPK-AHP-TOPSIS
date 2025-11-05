<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Alternatif;
use App\Models\Kriteria;
use App\Models\Penilaian;

class PerhitunganController extends Controller
{
    public function index()
    {
        // ======================
        // === DATA DARI AHP ===
        // ======================
        $kriterias = Kriteria::all();
        $matriks = session('matriks', []);
        $bobot = session('bobot', []);
        $totalKolom = session('totalKolom', []);
        $lamdaMax = session('lamdaMax');
        $ci = session('ci');
        $ri = session('ri');
        $cr = session('cr');

        // Jika belum ada hasil AHP, arahkan ke pembobotan
        if (!$lamdaMax || empty($bobot)) {
            return redirect()->route('pembobotan.index')
                ->with('error', 'Silakan lakukan perhitungan pembobotan AHP terlebih dahulu.');
        }

        // ============================
        // === DATA UNTUK TOPSIS ======
        // ============================
        $alternatifs = Alternatif::all();
        $penilaians = Penilaian::all();

        // Jika belum ada data alternatif atau penilaian
        if ($alternatifs->isEmpty() || $penilaians->isEmpty()) {
            return view('perhitungan.index', [
                'kriterias' => $kriterias,
                'matriks' => $matriks,
                'bobot' => $bobot,
                'totalKolom' => $totalKolom,
                'lamdaMax' => $lamdaMax,
                'ci' => $ci,
                'ri' => $ri,
                'cr' => $cr,
                'topsis' => [],
                'normalisasi' => [],
                'terbobot' => [],
                'idealPos' => [],   // blade expects these names
                'idealNeg' => [],
                'distPos' => [],
                'distNeg' => [],
                'preferensi' => [],
                'hasilRanking' => []
            ])->with('warning', 'Belum ada data penilaian alternatif. Menampilkan hasil AHP saja.');
        }

        // ============================
        // ====== PROSES TOPSIS =======
        // ============================

        // 1. Matriks keputusan (gunakan alternatif_id / kriteria_id sesuai struktur tabel)
        $topsis = [];
        foreach ($alternatifs as $alt) {
            foreach ($kriterias as $k) {
                $nilai = $penilaians
                    ->where('alternatif_id', $alt->id)
                    ->where('kriteria_id', $k->id)
                    ->first()
                    ->nilai ?? 0;

                $topsis[$alt->kode_alternatif][$k->kode_kriteria] = (float) $nilai;
            }
        }

        // 2. Normalisasi
        $normalisasi = [];
        foreach ($kriterias as $k) {
            $kode = $k->kode_kriteria;
            $sumKuadrat = 0;
            foreach ($alternatifs as $alt) {
                $sumKuadrat += pow($topsis[$alt->kode_alternatif][$kode], 2);
            }
            $pembagi = sqrt($sumKuadrat);

            foreach ($alternatifs as $alt) {
                $normalisasi[$alt->kode_alternatif][$kode] = $pembagi > 0
                    ? $topsis[$alt->kode_alternatif][$kode] / $pembagi
                    : 0;
            }
        }

        // 3. Matriks terbobot (pakai bobot kriteria dari AHP)
        $bobot = $kriterias->pluck('bobot', 'kode_kriteria')->toArray();
        $terbobot = [];
        foreach ($alternatifs as $alt) {
            foreach ($kriterias as $k) {
                $kode = $k->kode_kriteria;
                $w = $bobot[$kode] ?? 0;
                $terbobot[$alt->kode_alternatif][$kode] =
                    $normalisasi[$alt->kode_alternatif][$kode] * $w;
            }
        }

        // 4. Solusi ideal
        $idealPositif = [];
        $idealNegatif = [];
        foreach ($kriterias as $k) {
            $kode = $k->kode_kriteria;
            $values = array_column($terbobot, $kode);
            if (count($values) === 0) {
                $idealPositif[$kode] = 0;
                $idealNegatif[$kode] = 0;
            } else {
                if ($k->atribut === 'Benefit') {
                    $idealPositif[$kode] = max($values);
                    $idealNegatif[$kode] = min($values);
                } else { // Cost
                    $idealPositif[$kode] = min($values);
                    $idealNegatif[$kode] = max($values);
                }
            }
        }

        // 5. Jarak ke solusi ideal
        $dPositif = [];
        $dNegatif = [];
        foreach ($alternatifs as $alt) {
            $kodeAlt = $alt->kode_alternatif;
            $sumPos = $sumNeg = 0;
            foreach ($kriterias as $k) {
                $kode = $k->kode_kriteria;
                $y = $terbobot[$kodeAlt][$kode] ?? 0;
                $sumPos += pow($y - ($idealPositif[$kode] ?? 0), 2);
                $sumNeg += pow($y - ($idealNegatif[$kode] ?? 0), 2);
            }
            $dPositif[$kodeAlt] = sqrt($sumPos);
            $dNegatif[$kodeAlt] = sqrt($sumNeg);
        }

        // 6. Nilai preferensi (Ci)
        $preferensi = [];
        foreach ($alternatifs as $alt) {
            $kodeAlt = $alt->kode_alternatif;
            $denom = ($dPositif[$kodeAlt] ?? 0) + ($dNegatif[$kodeAlt] ?? 0);
            $preferensi[$kodeAlt] = $denom > 0 ? ($dNegatif[$kodeAlt] / $denom) : 0;
        }

        // 7. Ranking
        arsort($preferensi);
        $ranking = 1;
        $hasilRanking = [];
            foreach ($preferensi as $kodeAlt => $nilai) {
            $alt = $alternatifs->firstWhere('kode_alternatif', $kodeAlt);
            $hasilRanking[] = [
                'kode_alternatif' => $kodeAlt,
                'nama_alternatif' => $alt->nama_alternatif ?? '-',
                'tampil_alternatif' => $kodeAlt . ' - ' . ($alt->nama_alternatif ?? '-'),
                'nilai_preferensi' => round($nilai, 4),
                'ranking' => $ranking++
            ];
        }



        // --- Buat alias sesuai nama yang blade pakai (menghindari mismatch) ---
        $idealPos = $idealPositif;
        $idealNeg = $idealNegatif;
        $distPos = $dPositif;
        $distNeg = $dNegatif;

        // ============================
        // ======== TAMPILAN ==========
        // ============================
        return view('perhitungan.index', [
            'kriterias' => $kriterias,
            'alternatifs' => $alternatifs,
            'matriks' => $matriks,
            'bobot' => $bobot,
            'totalKolom' => $totalKolom,
            'lamdaMax' => $lamdaMax,
            'ci' => $ci,
            'ri' => $ri,
            'cr' => $cr,
            'topsis' => $topsis,
            'normalisasi' => $normalisasi,
            'terbobot' => $terbobot,
            'idealPos' => $idealPos,
            'idealNeg' => $idealNeg,
            'distPos' => $distPos,
            'distNeg' => $distNeg,
            'preferensi' => $preferensi,
            'hasilRanking' => $hasilRanking
        ]);
    }
}
