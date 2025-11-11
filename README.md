<p align="center">
  <img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo">
</p>

# 🧠 SPK AHP-TOPSIS: Pemilihan Bimbel

Aplikasi berbasis web untuk membantu siswa memilih bimbingan belajar terbaik berdasarkan kriteria tertentu menggunakan metode **AHP (Analytical Hierarchy Process)** dan **TOPSIS (Technique for Order of Preference by Similarity to Ideal Solution)**.

---

## 🚀 Fitur Utama
- Penentuan bobot kriteria menggunakan AHP  
- Perangkingan alternatif menggunakan TOPSIS  
- CRUD data kriteria, alternatif, dan hasil perhitungan  
- Dashboard admin interaktif berbasis Laravel  

---

## 🖼️ Tampilan Aplikasi

<p align="center">
  <img src="https://raw.githubusercontent.com/Zal76/SPK-AHP-TOPSIS/main/public/screenshoot/dashboard.png" width="600" alt="Dashboard">
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/username/repo-name/main/screenshots/hasil_perhitungan.png" width="600" alt="Hasil Perhitungan">
</p>

> 💡 *Letakkan semua screenshot kamu di folder `screenshots/` di dalam repo ini.*

---

## 🛠️ Teknologi yang Digunakan
- Laravel 10  
- MySQL  
- Tailwind CSS  
- JavaScript  
- Vite  

---

## ⚙️ Cara Menjalankan
```bash
git clone https://github.com/username/Spk_Pemilihan_Bimbel.git
cd Spk_Pemilihan_Bimbel
composer install
cp .env.example .env
php artisan key:generate
php artisan serve
