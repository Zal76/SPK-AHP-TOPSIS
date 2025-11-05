-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Nov 2025 pada 05.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spkbimbel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_10_14_184439_create_tb_periode_table', 1),
(2, '2025_10_14_184542_create_tb_kriteria_table', 1),
(3, '2025_10_14_184617_create_tb_alternatif_table', 1),
(4, '2025_10_14_184630_create_tb_rel_kriteria_table', 1),
(5, '2025_10_14_184647_create_tb_rel_alternatif_table', 1),
(6, '2025_10_14_192935_create_sessions_table', 1),
(7, '2025_10_14_194600_rename_deskrsipsi_to_deskripsi_in_tb_alternatif_table', 1),
(8, '2025_10_14_194812_rename_deskrsipsi_to_deskripsi_in_tb_alternatif_table', 1),
(9, '2025_10_15_010526_add_bobot_to_tb_kriteria_table', 1),
(10, '2025_10_15_044200_add_bobot_to_tb_kriteria_table', 1),
(11, '2025_10_15_044517_add_bobot_to_tb_kriteria_table', 1),
(12, '2025_10_23_125707_create_tb_penilaian_table', 1),
(13, '2025_10_23_141234_add_kode_kriteria_columns_to_tb_rel_kriteria_table', 2),
(14, '2025_10_23_141414_fix_columns_in_tb_rel_kriteria_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('04DG3dHQ1PDM2j4mzAH9DkASd8PkytvQEm6c2uSx', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/391.0.820341064 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0Z0N0hMdDJhbk95cTNZWTBXSzM4MWw0RExvZ2I1SmpKam5WQXEycSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly81NjA5MzA0ODA5OTUubmdyb2stZnJlZS5hcHAvcGVtYm9ib3RhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761725879),
('0bX145xvIR89j111D8Kx0ddrTw40GbYGRumyA895', NULL, '127.0.0.1', 'WhatsApp/2.2542.2 W', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE9FVzAyOXBGaEJlVWFQaHhhbDBIQWJzRUxCRFJSTW1ZZGZJeU9NdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly81NjA5MzA0ODA5OTUubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1761725725),
('3OEA6v6hVzxrJOInAXuBYMOlKEMKALx0VcKeMpAB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTE5OWdnRkJ3eEgxeFZFZXNobFNSWFV4QTNpeTExdHpscXZWV3Y3ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761725037),
('9AjK3KrjgYXHhSvDqp55l0jeqtpkWorDI1UnTM5d', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6IkV5VHAydTJEU2Voa1NBWU5tTkxCd2lVeW9zYXpyeHhSSG41WVFtbTQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwOi8vNTYwOTMwNDgwOTk1Lm5ncm9rLWZyZWUuYXBwL3BlcmhpdHVuZ2FuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo3OiJtYXRyaWtzIjthOjU6e3M6MjoiSzEiO2E6NTp7czoyOiJLMSI7aToxO3M6MjoiSzIiO2Q6NDtzOjI6IkszIjtkOjAuNTtzOjI6Iks0IjtkOjI7czoyOiJLNSI7ZDo1O31zOjI6IksyIjthOjU6e3M6MjoiSzEiO2Q6MC4yNTtzOjI6IksyIjtpOjE7czoyOiJLMyI7ZDowLjI7czoyOiJLNCI7ZDowLjU7czoyOiJLNSI7ZDoyO31zOjI6IkszIjthOjU6e3M6MjoiSzEiO2Q6MjtzOjI6IksyIjtkOjU7czoyOiJLMyI7aToxO3M6MjoiSzQiO2Q6NDtzOjI6Iks1IjtkOjU7fXM6MjoiSzQiO2E6NTp7czoyOiJLMSI7ZDowLjU7czoyOiJLMiI7ZDoyO3M6MjoiSzMiO2Q6MC4yNTtzOjI6Iks0IjtpOjE7czoyOiJLNSI7ZDo0O31zOjI6Iks1IjthOjU6e3M6MjoiSzEiO2Q6MC4yO3M6MjoiSzIiO2Q6MC41O3M6MjoiSzMiO2Q6MC4yO3M6MjoiSzQiO2Q6MC4yNTtzOjI6Iks1IjtpOjE7fX1zOjU6ImJvYm90IjthOjU6e3M6MjoiSzEiO2Q6MC4yNzE1ODA5NzE5MzY5NTI5NjtzOjI6IksyIjtkOjAuMDgzNjk1NTE2NTgyMDQ5NDY7czoyOiJLMyI7ZDowLjQzNjMzODQxNDQ2MjE0MTE3O3M6MjoiSzQiO2Q6MC4xNTM0Mzc1NDQ3OTIwMDU5MTtzOjI6Iks1IjtkOjAuMDU0OTQ3NTUyMjI2ODUwNDY7fXM6MTA6InRvdGFsS29sb20iO2E6NTp7czoyOiJLMSI7ZDozLjk1O3M6MjoiSzIiO2Q6MTIuNTtzOjI6IkszIjtkOjIuMTU7czoyOiJLNCI7ZDo3Ljc1O3M6MjoiSzUiO2Q6MTc7fXM6ODoibGFtZGFNYXgiO2Q6NS4xMzE0MDgzMTg1MDgyODk7czoyOiJjaSI7ZDowLjAzMjg1MjA3OTYyNzA3MjE1O3M6MjoicmkiO2Q6MS4xMjtzOjI6ImNyIjtkOjAuMDI5MzMyMjEzOTUyNzQyOTg4O30=', 1761725882),
('b1jIQzIbBA5afgNfxWp7vsGNan7RkokKSSaqcpnQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1VzaExjVThqRVFsOTBHc0UzMGY4cFNmMWVRekdBUXBBZG1Rd2pESyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761725037),
('bZOuTNbyuDMo9WVxc6ryv03m15KMG4N7xYxs4xTz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6Imd0TXdrZHpGa3BmVFROekxHTk5WTHhmdFhDTHM4MFRhTHBXVkdidEoiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVyaGl0dW5nYW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjc6Im1hdHJpa3MiO2E6NTp7czoyOiJLMSI7YTo1OntzOjI6IksxIjtpOjE7czoyOiJLMiI7ZDo0O3M6MjoiSzMiO2Q6MC41O3M6MjoiSzQiO2Q6MjtzOjI6Iks1IjtkOjU7fXM6MjoiSzIiO2E6NTp7czoyOiJLMSI7ZDowLjI1O3M6MjoiSzIiO2k6MTtzOjI6IkszIjtkOjAuMjtzOjI6Iks0IjtkOjAuNTtzOjI6Iks1IjtkOjI7fXM6MjoiSzMiO2E6NTp7czoyOiJLMSI7ZDoyO3M6MjoiSzIiO2Q6NTtzOjI6IkszIjtpOjE7czoyOiJLNCI7ZDo0O3M6MjoiSzUiO2Q6NTt9czoyOiJLNCI7YTo1OntzOjI6IksxIjtkOjAuNTtzOjI6IksyIjtkOjI7czoyOiJLMyI7ZDowLjI1O3M6MjoiSzQiO2k6MTtzOjI6Iks1IjtkOjQ7fXM6MjoiSzUiO2E6NTp7czoyOiJLMSI7ZDowLjI7czoyOiJLMiI7ZDowLjU7czoyOiJLMyI7ZDowLjI7czoyOiJLNCI7ZDowLjI1O3M6MjoiSzUiO2k6MTt9fXM6NToiYm9ib3QiO2E6NTp7czoyOiJLMSI7ZDowLjI3MTU4MDk3MTkzNjk1Mjk2O3M6MjoiSzIiO2Q6MC4wODM2OTU1MTY1ODIwNDk0NjtzOjI6IkszIjtkOjAuNDM2MzM4NDE0NDYyMTQxMTc7czoyOiJLNCI7ZDowLjE1MzQzNzU0NDc5MjAwNTkxO3M6MjoiSzUiO2Q6MC4wNTQ5NDc1NTIyMjY4NTA0Njt9czoxMDoidG90YWxLb2xvbSI7YTo1OntzOjI6IksxIjtkOjMuOTU7czoyOiJLMiI7ZDoxMi41O3M6MjoiSzMiO2Q6Mi4xNTtzOjI6Iks0IjtkOjcuNzU7czoyOiJLNSI7ZDoxNzt9czo4OiJsYW1kYU1heCI7ZDo1LjEzMTQwODMxODUwODI4OTtzOjI6ImNpIjtkOjAuMDMyODUyMDc5NjI3MDcyMTU7czoyOiJyaSI7ZDoxLjEyO3M6MjoiY3IiO2Q6MC4wMjkzMzIyMTM5NTI3NDI5ODg7fQ==', 1761725196),
('JMO3aGBnIqpY52WAPp75AMrGecUPFEwQwkgbBjq9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6IjZDSGlKUWdUTXNoM0IzUnM5YVU2M2hQb1A5VHN1WUlNdkdLVXJBMFQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwOi8vNTYwOTMwNDgwOTk1Lm5ncm9rLWZyZWUuYXBwL3BlcmhpdHVuZ2FuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo3OiJtYXRyaWtzIjthOjU6e3M6MjoiSzEiO2E6NTp7czoyOiJLMSI7aToxO3M6MjoiSzIiO2Q6NDtzOjI6IkszIjtkOjAuNTtzOjI6Iks0IjtkOjI7czoyOiJLNSI7ZDo1O31zOjI6IksyIjthOjU6e3M6MjoiSzEiO2Q6MC4yNTtzOjI6IksyIjtpOjE7czoyOiJLMyI7ZDowLjI7czoyOiJLNCI7ZDowLjU7czoyOiJLNSI7ZDoyO31zOjI6IkszIjthOjU6e3M6MjoiSzEiO2Q6MjtzOjI6IksyIjtkOjU7czoyOiJLMyI7aToxO3M6MjoiSzQiO2Q6NDtzOjI6Iks1IjtkOjU7fXM6MjoiSzQiO2E6NTp7czoyOiJLMSI7ZDowLjU7czoyOiJLMiI7ZDoyO3M6MjoiSzMiO2Q6MC4yNTtzOjI6Iks0IjtpOjE7czoyOiJLNSI7ZDo0O31zOjI6Iks1IjthOjU6e3M6MjoiSzEiO2Q6MC4yO3M6MjoiSzIiO2Q6MC41O3M6MjoiSzMiO2Q6MC4yO3M6MjoiSzQiO2Q6MC4yNTtzOjI6Iks1IjtpOjE7fX1zOjU6ImJvYm90IjthOjU6e3M6MjoiSzEiO2Q6MC4yNzE1ODA5NzE5MzY5NTI5NjtzOjI6IksyIjtkOjAuMDgzNjk1NTE2NTgyMDQ5NDY7czoyOiJLMyI7ZDowLjQzNjMzODQxNDQ2MjE0MTE3O3M6MjoiSzQiO2Q6MC4xNTM0Mzc1NDQ3OTIwMDU5MTtzOjI6Iks1IjtkOjAuMDU0OTQ3NTUyMjI2ODUwNDY7fXM6MTA6InRvdGFsS29sb20iO2E6NTp7czoyOiJLMSI7ZDozLjk1O3M6MjoiSzIiO2Q6MTIuNTtzOjI6IkszIjtkOjIuMTU7czoyOiJLNCI7ZDo3Ljc1O3M6MjoiSzUiO2Q6MTc7fXM6ODoibGFtZGFNYXgiO2Q6NS4xMzE0MDgzMTg1MDgyODk7czoyOiJjaSI7ZDowLjAzMjg1MjA3OTYyNzA3MjE1O3M6MjoicmkiO2Q6MS4xMjtzOjI6ImNyIjtkOjAuMDI5MzMyMjEzOTUyNzQyOTg4O30=', 1761726007),
('NCBV9bjhyNhm7JIM3EkVdaSM44OqQVAQ0HtnusEg', NULL, '127.0.0.1', 'WhatsApp/2.2542.2 W', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNktrYWJDQVVsOEM2RTZybGJhQVhvWlRjYTJydlJsVVdBYlBTNVpkWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly81NjA5MzA0ODA5OTUubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1761725714),
('VwV9khINnsrMDo02Na2gN42RgMJZk6xXZHag94Gi', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6ImYwV3o3U2FCbnQ2Tnk4NGxSMWNnT2JZZHF0OThOeFgxUWlyQmhybW0iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwOi8vNTYwOTMwNDgwOTk1Lm5ncm9rLWZyZWUuYXBwL3BlcmhpdHVuZ2FuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo3OiJtYXRyaWtzIjthOjU6e3M6MjoiSzEiO2E6NTp7czoyOiJLMSI7aToxO3M6MjoiSzIiO2Q6NDtzOjI6IkszIjtkOjAuNTtzOjI6Iks0IjtkOjI7czoyOiJLNSI7ZDo1O31zOjI6IksyIjthOjU6e3M6MjoiSzEiO2Q6MC4yNTtzOjI6IksyIjtpOjE7czoyOiJLMyI7ZDowLjI7czoyOiJLNCI7ZDowLjU7czoyOiJLNSI7ZDoyO31zOjI6IkszIjthOjU6e3M6MjoiSzEiO2Q6MjtzOjI6IksyIjtkOjU7czoyOiJLMyI7aToxO3M6MjoiSzQiO2Q6NDtzOjI6Iks1IjtkOjU7fXM6MjoiSzQiO2E6NTp7czoyOiJLMSI7ZDowLjU7czoyOiJLMiI7ZDoyO3M6MjoiSzMiO2Q6MC4yNTtzOjI6Iks0IjtpOjE7czoyOiJLNSI7ZDo0O31zOjI6Iks1IjthOjU6e3M6MjoiSzEiO2Q6MC4yO3M6MjoiSzIiO2Q6MC41O3M6MjoiSzMiO2Q6MC4yO3M6MjoiSzQiO2Q6MC4yNTtzOjI6Iks1IjtpOjE7fX1zOjU6ImJvYm90IjthOjU6e3M6MjoiSzEiO2Q6MC4yNzE1ODA5NzE5MzY5NTI5NjtzOjI6IksyIjtkOjAuMDgzNjk1NTE2NTgyMDQ5NDY7czoyOiJLMyI7ZDowLjQzNjMzODQxNDQ2MjE0MTE3O3M6MjoiSzQiO2Q6MC4xNTM0Mzc1NDQ3OTIwMDU5MTtzOjI6Iks1IjtkOjAuMDU0OTQ3NTUyMjI2ODUwNDY7fXM6MTA6InRvdGFsS29sb20iO2E6NTp7czoyOiJLMSI7ZDozLjk1O3M6MjoiSzIiO2Q6MTIuNTtzOjI6IkszIjtkOjIuMTU7czoyOiJLNCI7ZDo3Ljc1O3M6MjoiSzUiO2Q6MTc7fXM6ODoibGFtZGFNYXgiO2Q6NS4xMzE0MDgzMTg1MDgyODk7czoyOiJjaSI7ZDowLjAzMjg1MjA3OTYyNzA3MjE1O3M6MjoicmkiO2Q6MS4xMjtzOjI6ImNyIjtkOjAuMDI5MzMyMjEzOTUyNzQyOTg4O30=', 1761726468),
('Z1yvPciK50lsUjWSgZKS9Q1jaTKfWb03IbCfHfMa', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0NRem83SG5OOE1pUGJZWnpnQVo2UEVEbWVMN2VIR2VmczNRV25pWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly81NjA5MzA0ODA5OTUubmdyb2stZnJlZS5hcHAvcGVtYm9ib3RhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761725749),
('zW19AIiH8vmEPeYNECW4t4ngWAsVqViJ0SFp1mYv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6ImFNTEVrT3U2ZmprNHhTM0tab0JRUDFHR3daUjZmT1dEblA2a1I2aU0iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVyaGl0dW5nYW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjc6Im1hdHJpa3MiO2E6NTp7czoyOiJLMSI7YTo1OntzOjI6IksxIjtpOjE7czoyOiJLMiI7ZDo3O3M6MjoiSzMiO2Q6MC41O3M6MjoiSzQiO2Q6MjtzOjI6Iks1IjtkOjU7fXM6MjoiSzIiO2E6NTp7czoyOiJLMSI7ZDowLjE0Mjg1NzE0Mjg1NzE0O3M6MjoiSzIiO2k6MTtzOjI6IkszIjtkOjAuMjtzOjI6Iks0IjtkOjAuNTtzOjI6Iks1IjtkOjI7fXM6MjoiSzMiO2E6NTp7czoyOiJLMSI7ZDoyO3M6MjoiSzIiO2Q6NTtzOjI6IkszIjtpOjE7czoyOiJLNCI7ZDo0O3M6MjoiSzUiO2Q6NTt9czoyOiJLNCI7YTo1OntzOjI6IksxIjtkOjAuNTtzOjI6IksyIjtkOjI7czoyOiJLMyI7ZDowLjI1O3M6MjoiSzQiO2k6MTtzOjI6Iks1IjtkOjQ7fXM6MjoiSzUiO2E6NTp7czoyOiJLMSI7ZDowLjI7czoyOiJLMiI7ZDowLjU7czoyOiJLMyI7ZDowLjI7czoyOiJLNCI7ZDowLjI1O3M6MjoiSzUiO2k6MTt9fXM6NToiYm9ib3QiO2E6NTp7czoyOiJLMSI7ZDowLjI5OTMxNTI1MDg1NTEzNjc3O3M6MjoiSzIiO2Q6MC4wNzUzNzU0NTg3NzgzMTc4OTtzOjI6IkszIjtkOjAuNDIzNjc3OTQwMDQwNDQ0MjM7czoyOiJLNCI7ZDowLjE0Nzk0OTg0NTU0MTQyMDM4O3M6MjoiSzUiO2Q6MC4wNTM2ODE1MDQ3ODQ2ODA3Nzt9czoxMDoidG90YWxLb2xvbSI7YTo1OntzOjI6IksxIjtkOjMuODQyODU3MTQyODU3MTQ7czoyOiJLMiI7ZDoxNS41O3M6MjoiSzMiO2Q6Mi4xNTtzOjI6Iks0IjtkOjcuNzU7czoyOiJLNSI7ZDoxNzt9czo4OiJsYW1kYU1heCI7ZDo1LjIxMzY3NTEzNzE1Njg3NTU7czoyOiJjaSI7ZDowLjA1MzQxODc4NDI4OTIxODg3O3M6MjoicmkiO2Q6MS4xMjtzOjI6ImNyIjtkOjAuMDQ3Njk1MzQzMTE1MzczOTg7fQ==', 1762317123);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alternatif`
--

CREATE TABLE `tb_alternatif` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_alternatif` varchar(255) NOT NULL,
  `nama_alternatif` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_alternatif`
--

INSERT INTO `tb_alternatif` (`id`, `kode_alternatif`, `nama_alternatif`, `deskripsi`, `tahun`, `created_at`, `updated_at`) VALUES
(5, 'A1', 'Bimbel GO', 'Bagus', '2025', '2025-10-23 08:38:31', '2025-10-23 08:38:47'),
(6, 'A2', 'Neutron', 'Bagus', '2025', '2025-10-23 08:38:44', '2025-10-23 08:38:44'),
(7, 'A3', 'Bimbel Maju', 'Cocok', '2025', '2025-10-23 08:39:09', '2025-10-23 08:39:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_kriteria` varchar(255) NOT NULL,
  `nama_kriteria` varchar(255) NOT NULL,
  `tahun` year(4) DEFAULT NULL,
  `atribut` varchar(255) NOT NULL,
  `bobot` decimal(8,5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id`, `kode_kriteria`, `nama_kriteria`, `tahun`, `atribut`, `bobot`, `created_at`, `updated_at`) VALUES
(6, 'K1', 'Biaya Bimbel', '2025', 'Cost', 0.29932, '2025-10-23 08:45:01', '2025-11-04 21:25:45'),
(7, 'K2', 'Lokasi Kedekatan', '2025', 'Cost', 0.07538, '2025-10-23 08:45:18', '2025-11-04 21:25:45'),
(8, 'K3', 'Fasilitas Belajar', '2025', 'Benefit', 0.42368, '2025-10-23 08:45:29', '2025-11-04 21:25:45'),
(9, 'K4', 'Reputasi Kelulusan', '2025', 'Benefit', 0.14795, '2025-10-23 08:45:45', '2025-11-04 21:25:45'),
(10, 'K5', 'Kualitas Pengajar', '2025', 'Benefit', 0.05368, '2025-10-23 08:45:57', '2025-11-04 21:25:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penilaian`
--

CREATE TABLE `tb_penilaian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alternatif_id` bigint(20) UNSIGNED NOT NULL,
  `kriteria_id` bigint(20) UNSIGNED NOT NULL,
  `nilai` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_penilaian`
--

INSERT INTO `tb_penilaian` (`id`, `alternatif_id`, `kriteria_id`, `nilai`, `created_at`, `updated_at`) VALUES
(21, 5, 6, 3, NULL, NULL),
(22, 5, 7, 2, NULL, NULL),
(23, 5, 8, 3, NULL, NULL),
(24, 5, 9, 4, NULL, NULL),
(25, 5, 10, 5, NULL, NULL),
(26, 6, 6, 2, NULL, NULL),
(27, 6, 7, 3, NULL, NULL),
(28, 6, 8, 4, NULL, NULL),
(29, 6, 9, 3, NULL, NULL),
(30, 6, 10, 4, NULL, NULL),
(31, 7, 6, 1, NULL, NULL),
(32, 7, 7, 1, NULL, NULL),
(33, 7, 8, 5, NULL, NULL),
(34, 7, 9, 5, NULL, NULL),
(35, 7, 10, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_periode`
--

CREATE TABLE `tb_periode` (
  `tahun` year(4) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rel_alternatif`
--

CREATE TABLE `tb_rel_alternatif` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun` year(4) DEFAULT NULL,
  `kode_alternatif` varchar(16) DEFAULT NULL,
  `kode_kriteria` varchar(16) DEFAULT NULL,
  `nilai` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rel_kriteria`
--

CREATE TABLE `tb_rel_kriteria` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_kriteria1` varchar(255) NOT NULL,
  `kode_kriteria2` varchar(255) NOT NULL,
  `nilai` double NOT NULL,
  `tahun` year(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_rel_kriteria`
--

INSERT INTO `tb_rel_kriteria` (`id`, `kode_kriteria1`, `kode_kriteria2`, `nilai`, `tahun`, `created_at`, `updated_at`) VALUES
(40, 'K5', 'K4', 0.25, '2025', NULL, NULL),
(41, 'K2', 'K3', 0.2, '2025', NULL, NULL),
(42, 'K3', 'K2', 5, '2025', NULL, NULL),
(43, 'K2', 'K1', 0.14285714285714, '2025', NULL, NULL),
(44, 'K1', 'K2', 7, '2025', NULL, NULL),
(45, 'K3', 'K1', 2, '2025', NULL, NULL),
(46, 'K1', 'K3', 0.5, '2025', NULL, NULL),
(47, 'K4', 'K5', 4, '2025', NULL, NULL),
(48, 'K4', 'K1', 0.5, '2025', NULL, NULL),
(49, 'K1', 'K4', 2, '2025', NULL, NULL),
(50, 'K4', 'K2', 2, '2025', NULL, NULL),
(51, 'K2', 'K4', 0.5, '2025', NULL, NULL),
(52, 'K4', 'K3', 0.25, '2025', NULL, NULL),
(53, 'K3', 'K4', 4, '2025', NULL, NULL),
(54, 'K5', 'K1', 0.2, '2025', NULL, NULL),
(55, 'K1', 'K5', 5, '2025', NULL, NULL),
(56, 'K5', 'K2', 0.5, '2025', NULL, NULL),
(57, 'K2', 'K5', 2, '2025', NULL, NULL),
(58, 'K5', 'K3', 0.2, '2025', NULL, NULL),
(59, 'K3', 'K5', 5, '2025', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_alternatif_kode_alternatif_unique` (`kode_alternatif`);

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_penilaian_alternatif_id_foreign` (`alternatif_id`),
  ADD KEY `tb_penilaian_kriteria_id_foreign` (`kriteria_id`);

--
-- Indeks untuk tabel `tb_periode`
--
ALTER TABLE `tb_periode`
  ADD PRIMARY KEY (`tahun`);

--
-- Indeks untuk tabel `tb_rel_alternatif`
--
ALTER TABLE `tb_rel_alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_rel_kriteria`
--
ALTER TABLE `tb_rel_kriteria`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_rel_alternatif`
--
ALTER TABLE `tb_rel_alternatif`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_rel_kriteria`
--
ALTER TABLE `tb_rel_kriteria`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD CONSTRAINT `tb_penilaian_alternatif_id_foreign` FOREIGN KEY (`alternatif_id`) REFERENCES `tb_alternatif` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_penilaian_kriteria_id_foreign` FOREIGN KEY (`kriteria_id`) REFERENCES `tb_kriteria` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
