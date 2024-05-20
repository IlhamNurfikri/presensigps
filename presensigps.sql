-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Bulan Mei 2024 pada 09.06
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensigps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang`
--

CREATE TABLE `cabang` (
  `kode_cabang` char(3) NOT NULL,
  `nama_cabang` varchar(50) NOT NULL,
  `lokasi_cabang` varchar(255) NOT NULL,
  `radius_cabang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cabang`
--

INSERT INTO `cabang` (`kode_cabang`, `nama_cabang`, `lokasi_cabang`, `radius_cabang`) VALUES
('JKT', 'KAP Yonathan & Rekan', '-7.321942518196893,107.86029333749414', 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `client`
--

CREATE TABLE `client` (
  `kode_client` varchar(255) NOT NULL,
  `nama_client` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `pic_client` varchar(255) DEFAULT NULL,
  `no_tlpn_client` varchar(13) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nik` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `client`
--

INSERT INTO `client` (`kode_client`, `nama_client`, `alamat`, `pic_client`, `no_tlpn_client`, `email`, `nik`) VALUES
('IPN', 'PT Indoritel Persada Nusantara', NULL, NULL, NULL, NULL, 17),
('JKS', 'PT Jaya Kainonia Sukses', NULL, NULL, NULL, NULL, 7),
('MRP', 'PT Martha Radha Pratama', NULL, NULL, NULL, NULL, 9),
('QMB', 'PT Qerja Manfaat Bangsa', NULL, NULL, NULL, NULL, 10),
('STMC', 'PT Serasi Tunggal Mandiri Cemerlang', NULL, NULL, NULL, NULL, 7),
('TR', 'PT Terra Resources', NULL, NULL, NULL, NULL, 7),
('WJEI', 'PT Wen Jaya Electronic International', NULL, NULL, NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `kode_dept` char(3) NOT NULL,
  `nama_dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`kode_dept`, `nama_dept`) VALUES
('ADM', 'Admin'),
('AUD', 'Auditor'),
('HRD', 'Human Resource Development '),
('IT', 'Information Technology'),
('ITR', 'Intern'),
('PRT', 'Partners '),
('VSC', 'Vast Consulting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harilibur`
--

CREATE TABLE `harilibur` (
  `kode_libur` char(7) NOT NULL,
  `tanggal_libur` date NOT NULL,
  `kode_cabang` char(3) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `harilibur_detail`
--

CREATE TABLE `harilibur_detail` (
  `kode_libur` char(7) DEFAULT NULL,
  `nik` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `harilibur_detail`
--

INSERT INTO `harilibur_detail` (`kode_libur`, `nik`) VALUES
('LB24002', '3636'),
('LB24002', '22-01'),
('LB24002', '99-99'),
('LB24002', '12349'),
('LB24003', '12345'),
('LB24003', '3636');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item`
--

CREATE TABLE `item` (
  `kode_item` varchar(255) NOT NULL,
  `nama_item` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `item`
--

INSERT INTO `item` (`kode_item`, `nama_item`) VALUES
('adt001', 'Pekerjaan Auditor'),
('vs001', 'Pekerjaan Vast Consulting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_kerja`
--

CREATE TABLE `jam_kerja` (
  `kode_jam_kerja` char(4) NOT NULL,
  `nama_jam_kerja` varchar(255) NOT NULL,
  `awal_jam_masuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL,
  `lintashari` char(1) DEFAULT NULL,
  `total_jam` time DEFAULT NULL,
  `awal_jam_istirahat` time DEFAULT NULL,
  `akhir_jam_istirahat` time DEFAULT NULL,
  `status_istirahat` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `jam_kerja`
--

INSERT INTO `jam_kerja` (`kode_jam_kerja`, `nama_jam_kerja`, `awal_jam_masuk`, `jam_masuk`, `akhir_jam_masuk`, `jam_pulang`, `lintashari`, `total_jam`, `awal_jam_istirahat`, `akhir_jam_istirahat`, `status_istirahat`) VALUES
('JK01', 'Jam Kerja Biasa', '09:00:00', '09:00:00', '23:59:00', '00:00:00', '0', '00:00:00', '12:00:00', '13:00:00', '1'),
('JK02', 'Sabtu & Minggu', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', '00:00:00', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(18) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(30) DEFAULT NULL,
  `kode_dept` char(3) NOT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `status_location` char(1) DEFAULT NULL,
  `status_jam_kerja` char(1) DEFAULT NULL,
  `alamat_ktp` varchar(255) DEFAULT NULL,
  `alamat_domisili` varchar(255) DEFAULT NULL,
  `alamat_email_kantor` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `foto`, `kode_dept`, `kode_cabang`, `password`, `tanggal_lahir`, `remember_token`, `status_location`, `status_jam_kerja`, `alamat_ktp`, `alamat_domisili`, `alamat_email_kantor`, `username`) VALUES
('0001', 'Yonathan Augustine', 'Partner', '0817154015', '1111.png', 'PRT', 'JKT', '$2y$10$Ah2Bll6TC.YiqUxKpN/QM.Gyiic5P1c1DOuPg5W12LkIi4ZfJvb/y', '1970-01-01', NULL, NULL, NULL, NULL, NULL, 'yonathan@kapsy.net', 'yonathan'),
('0002', 'Jimmy Cakranegara', 'Partners', '081510576500', '0001.png', 'PRT', 'JKT', '$2y$10$j0Qh8no9c9ma9Q9U3oMyX.P53wLI7oKxMymYmtA8bKz3wwLd3apMq', '1970-01-01', NULL, NULL, NULL, NULL, NULL, 'jimmy@kapsy.net', 'jimmy'),
('0003', 'Yessica Ekayuni', 'Manager', '081310500487', NULL, 'HRD', 'JKT', '$2y$10$UO8HjXSz0.8flAJ.rSaKcOJ4NO2KUlmZ4h13TLJblAcp6boa.svV6', NULL, NULL, NULL, NULL, NULL, NULL, 'yessica@kapsy.net', 'yessica'),
('0004', 'Yanti', 'Manager', '081932133664', NULL, 'VSC', 'JKT', '$2y$10$vT5r9iyHmMd1MJkK3cKubewZ.g1OAwnBQWNhbvivIkCFG3mXlEJTi', NULL, NULL, NULL, NULL, NULL, NULL, 'yanti@kapsy.net', 'yanti'),
('0005', 'I Gede Agastya', 'Manager', '087888766658', NULL, 'AUD', 'JKT', '$2y$10$nGVKysV01tjNOTCKn1dWD.OReFat3dfpq/l0OUPnM4MVHDb5ljcam', NULL, NULL, NULL, NULL, NULL, NULL, 'gede.aga@kapsy.net', 'agastya'),
('0006', 'Eko Sulistiyantoro', 'Manager', '085313305112', NULL, 'AUD', 'JKT', '$2y$10$CNhGAd7ZFsj.AlNCEwPPA.ePi8Q4YrkUBObam261xNttp9dXI2S1W', NULL, NULL, NULL, NULL, NULL, NULL, 'eko@kapsy.net', 'eko'),
('0007', 'Deni Ivan', 'Manager', '081212037104', NULL, 'AUD', 'JKT', '$2y$10$GYjUyItmHmXS8eFfAFu1Au/N62d1hMi5r.j23tvXXefUjwQC9ert2', NULL, NULL, NULL, NULL, NULL, NULL, 'deni@kapsy.net', 'deni'),
('0008', 'Yantonius Gulo', 'Manager', '081284371931', NULL, 'AUD', 'JKT', '$2y$10$8JPVka7YG8HuB5OAiLiITOErNr2xDvcRugDHgcK54mL08gJ0ZeaDC', NULL, NULL, NULL, NULL, NULL, NULL, 'yantonius@kapsy.net', 'yanto'),
('0009', 'Syska Putra Adhianzah', 'Senior', '085711192039', NULL, 'AUD', 'JKT', '$2y$10$HGGgZZRKjl6YbJj1KE18.u1eKNyUq3azC0t/8MvZfJ9XtPkMSWIYC', '1970-01-01', NULL, NULL, NULL, NULL, NULL, 'syska.putra@kapsy.net', 'putra'),
('0010', 'Dewamade Barunaputra', 'Senior', '089632172866', NULL, 'AUD', 'JKT', '$2y$10$vIcpDGddfJnC5auL8tuFQe2gsjNADtIIp6msGHmLSy.yEwW.1dw.G', NULL, NULL, NULL, NULL, NULL, NULL, 'made@kapsy.net', 'made'),
('0011', 'Raka', 'Senior', '085782002069', NULL, 'AUD', 'JKT', '$2y$10$/gTa.6W9yBEs8tN.dQa6ke1wFZLYFWL6.e/GelgfC58dmviP/Eqjy', NULL, NULL, NULL, NULL, NULL, NULL, 'raka@kapsy.net', 'raka'),
('0012', 'Ekaputri Wahyuningtias', 'Senior', '081293105927', NULL, 'AUD', 'JKT', '$2y$10$C/QFPHGKBmvjtlhYlG9qLucD9sr7cbA6Fl1AP8I.rZ7eOP5qRXiHy', NULL, NULL, NULL, NULL, NULL, NULL, 'ekaputri.wahyuningtias@kapsy.net', 'eka'),
('0013', 'Disya Badzlina', 'Senior', '081338385918', NULL, 'VSC', 'JKT', '$2y$10$t0IFSgPETYCKhGA3e.Mm/OJ4eKAGQNOX6Q0RzDURRVw2jZPMUoREC', NULL, NULL, NULL, NULL, NULL, NULL, 'disya.caca@kapsy.net', 'disya'),
('0014', 'Dita', 'Senior', '083897497342', NULL, 'VSC', 'JKT', '$2y$10$/.j3EVq4G5OtNm1skLTmJuGNxfahZqqcqjCde7ObEf/.AtLjU7oKa', NULL, NULL, NULL, NULL, NULL, NULL, 'dita@kapsy.net', 'dita'),
('0015', 'Aulia', 'Senior', '088975400707', NULL, 'VSC', 'JKT', '$2y$10$gECgsfP342VVeDR6up.h0uxGzDcc4EL4UAK6z1b4cXAjUErSrYL6K', NULL, NULL, NULL, NULL, NULL, NULL, 'aulia@kapsy.net', 'aulia'),
('0016', 'ulfiah', 'Senior', '083804866193', NULL, 'ADM', 'JKT', '$2y$10$37bXFi0X6rMntluHcpgEVOX3obVJGNzuBYiAQ8wWMy5LwEukdFMw2', NULL, NULL, NULL, NULL, NULL, NULL, 'ulfiah@kapsy.net', 'ulfiah'),
('0017', 'Marie Josephine Santosa', 'Associate', '082113086559', NULL, 'AUD', 'JKT', '$2y$10$ecnUe6ViJXjWGUT9XZE3y.pNiygO7ZAGMQ.X9G9LaN60YoleKAFj2', NULL, NULL, NULL, NULL, NULL, NULL, 'marie.josephine@kapsy.net', 'marie');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jamkerja`
--

CREATE TABLE `konfigurasi_jamkerja` (
  `nik` char(18) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jamkerja_by_date`
--

CREATE TABLE `konfigurasi_jamkerja_by_date` (
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jk_dept`
--

CREATE TABLE `konfigurasi_jk_dept` (
  `kode_jk_dept` char(7) NOT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `kode_dept` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jk_dept_detail`
--

CREATE TABLE `konfigurasi_jk_dept_detail` (
  `kode_jk_dept` char(7) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_cuti`
--

CREATE TABLE `master_cuti` (
  `kode_cuti` char(3) NOT NULL,
  `nama_cuti` varchar(30) DEFAULT NULL,
  `jml_hari` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `master_cuti`
--

INSERT INTO `master_cuti` (`kode_cuti`, `nama_cuti`, `jml_hari`) VALUES
('C01', 'Tahunan', 12),
('C02', 'Cuti Melahirkan', 90),
('C04', 'Cuti Menikah', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_12_14_233749_create_permission_tables', 1),
(5, '2023_12_15_002819_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 13),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_izin`
--

CREATE TABLE `pengajuan_izin` (
  `kode_izin` char(9) NOT NULL,
  `nik` char(18) DEFAULT NULL,
  `tgl_izin_dari` date DEFAULT NULL,
  `tgl_izin_sampai` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT 'i : izin s : sakit',
  `kode_cuti` char(3) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `doc_sid` varchar(255) DEFAULT NULL,
  `status_approved` char(1) DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-karyawan', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28'),
(2, 'view-departemen', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `nik` char(18) NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time DEFAULT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) DEFAULT NULL,
  `foto_out` varchar(255) DEFAULT NULL,
  `lokasi_in` text DEFAULT NULL,
  `lokasi_out` text DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `kode_izin` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id`, `nik`, `tgl_presensi`, `jam_in`, `jam_out`, `foto_in`, `foto_out`, `lokasi_in`, `lokasi_out`, `kode_jam_kerja`, `status`, `kode_izin`) VALUES
(46, '1001', '2024-05-06', '14:38:43', '14:42:12', '1001-2024-05-06-in.png', '1001-2024-05-06-out.png', '-6.1818346,106.876853', '-6.1672346,106.8764457', 'JK01', 'h', NULL),
(48, '1101', '2024-05-06', '16:45:01', NULL, '1101-2024-05-06-in.png', NULL, '-6.1672289,106.8764443', NULL, 'JK01', 'h', NULL),
(55, '1001', '2024-05-15', '14:48:12', '14:49:03', '1001-2024-05-15-in.png', '1001-2024-05-15-out.png', '-6.1672143,106.8764562', '-6.1672066,106.876458', 'JK01', 'h', NULL),
(56, '1001', '2024-05-16', '17:56:00', NULL, '1001-2024-05-16-in.png', NULL, '-6.1645303,106.876853', NULL, 'JK01', 'h', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `proposal`
--

CREATE TABLE `proposal` (
  `no_proposal` varchar(255) NOT NULL,
  `tanggal_proposal` date DEFAULT NULL,
  `kode_client` varchar(255) DEFAULT NULL,
  `kode_item` varchar(255) DEFAULT NULL,
  `nik` char(18) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `total_jam` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `proposal`
--

INSERT INTO `proposal` (`no_proposal`, `tanggal_proposal`, `kode_client`, `kode_item`, `nik`, `harga`, `total_jam`) VALUES
('YR/001/2024/05', '2024-05-15', 'TR', 'adt001', '0002', 45000, NULL),
('YR/001/2024/06', '2024-05-17', 'TR', 'adt001', '0002', 55000, NULL),
('YR/001/2024/07', '2024-05-17', 'TR', 'vs001', '0001', 45000, NULL),
('YR/002/2024/06', '2024-05-20', 'TR', 'vs001', '0002', 950000000, NULL);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `q_rekappresensi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `q_rekappresensi` (
`nik` char(18)
,`nama_lengkap` varchar(100)
,`jabatan` varchar(20)
,`tgl_1` text
,`tgl_2` text
,`tgl_3` text
,`tgl_4` text
,`tgl_5` text
,`tgl_6` text
,`tgl_7` text
,`tgl_8` text
,`tgl_9` text
,`tgl_10` text
,`tgl_11` text
,`tgl_12` text
,`tgl_13` text
,`tgl_14` text
,`tgl_15` text
,`tgl_16` text
,`tgl_17` text
,`tgl_18` text
,`tgl_19` text
,`tgl_20` text
,`tgl_21` text
,`tgl_22` text
,`tgl_23` text
,`tgl_24` text
,`tgl_25` text
,`tgl_26` text
,`tgl_27` text
,`tgl_28` text
,`tgl_29` text
,`tgl_30` text
,`tgl_31` text
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28'),
(2, 'admin departemen', 'web', '2023-12-17 17:22:14', '2023-12-17 17:22:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `kode_dept` char(3) DEFAULT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `kode_dept`, `kode_cabang`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Jimmy Cakranegara', 'admin@gmail.com', NULL, '$2y$10$/7PU0LlKeeoLLwEh/MvdAu5.7slx8hvBiUG8x3SNSNyZ1VdHxSnZ6', 'PRT', 'JKT', NULL, '2023-12-18 15:45:36', '2023-12-18 15:45:36'),
(13, 'Yessica Ekayuni', 'yessica@gmail.com', NULL, '$2y$10$DtEnUiNmvcPJUYkP0Y2J5.LqSkvKdAMTgTaPyJHVP0h/CWDumTz36', 'HRD', 'JKT', NULL, '2024-05-02 08:47:04', '2024-05-02 08:47:04'),
(14, 'Vanessa', 'vanessa@kapsy.net', NULL, '$2y$10$chDAVlxwKudTFAhwxmoShe5rzdKmMrr3Pj9ybQntFSTIkKsmFT2Hy', 'HRD', 'JKT', NULL, '2024-05-06 09:09:05', '2024-05-06 09:09:05'),
(15, 'Ilham Nurfikri', 'admin1@gmail.com', NULL, '$2y$10$lvURPdxvoo6tHkR3pXnq8e/U5bPTqBYxUvHOGDbXZV6O1oQ4RQvLm', 'IT', 'JKT', NULL, '2024-05-16 07:45:10', '2024-05-16 07:45:10');

-- --------------------------------------------------------

--
-- Struktur untuk view `q_rekappresensi`
--
DROP TABLE IF EXISTS `q_rekappresensi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_rekappresensi`  AS SELECT `karyawan`.`nik` AS `nik`, `karyawan`.`nama_lengkap` AS `nama_lengkap`, `karyawan`.`jabatan` AS `jabatan`, `presensi`.`tgl_1` AS `tgl_1`, `presensi`.`tgl_2` AS `tgl_2`, `presensi`.`tgl_3` AS `tgl_3`, `presensi`.`tgl_4` AS `tgl_4`, `presensi`.`tgl_5` AS `tgl_5`, `presensi`.`tgl_6` AS `tgl_6`, `presensi`.`tgl_7` AS `tgl_7`, `presensi`.`tgl_8` AS `tgl_8`, `presensi`.`tgl_9` AS `tgl_9`, `presensi`.`tgl_10` AS `tgl_10`, `presensi`.`tgl_11` AS `tgl_11`, `presensi`.`tgl_12` AS `tgl_12`, `presensi`.`tgl_13` AS `tgl_13`, `presensi`.`tgl_14` AS `tgl_14`, `presensi`.`tgl_15` AS `tgl_15`, `presensi`.`tgl_16` AS `tgl_16`, `presensi`.`tgl_17` AS `tgl_17`, `presensi`.`tgl_18` AS `tgl_18`, `presensi`.`tgl_19` AS `tgl_19`, `presensi`.`tgl_20` AS `tgl_20`, `presensi`.`tgl_21` AS `tgl_21`, `presensi`.`tgl_22` AS `tgl_22`, `presensi`.`tgl_23` AS `tgl_23`, `presensi`.`tgl_24` AS `tgl_24`, `presensi`.`tgl_25` AS `tgl_25`, `presensi`.`tgl_26` AS `tgl_26`, `presensi`.`tgl_27` AS `tgl_27`, `presensi`.`tgl_28` AS `tgl_28`, `presensi`.`tgl_29` AS `tgl_29`, `presensi`.`tgl_30` AS `tgl_30`, `presensi`.`tgl_31` AS `tgl_31` FROM (`karyawan` left join (select `presensi`.`nik` AS `nik`,max(if(`presensi`.`tgl_presensi` = '2023-11-01',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_1`,max(if(`presensi`.`tgl_presensi` = '2023-11-02',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_2`,max(if(`presensi`.`tgl_presensi` = '2023-11-03',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_3`,max(if(`presensi`.`tgl_presensi` = '2023-11-04',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_4`,max(if(`presensi`.`tgl_presensi` = '2023-11-05',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_5`,max(if(`presensi`.`tgl_presensi` = '2023-11-06',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_6`,max(if(`presensi`.`tgl_presensi` = '2023-11-07',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_7`,max(if(`presensi`.`tgl_presensi` = '2023-11-08',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_8`,max(if(`presensi`.`tgl_presensi` = '2023-11-09',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_9`,max(if(`presensi`.`tgl_presensi` = '2023-11-10',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_10`,max(if(`presensi`.`tgl_presensi` = '2023-11-11',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_11`,max(if(`presensi`.`tgl_presensi` = '2023-11-12',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_12`,max(if(`presensi`.`tgl_presensi` = '2023-11-13',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_13`,max(if(`presensi`.`tgl_presensi` = '2023-11-14',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_14`,max(if(`presensi`.`tgl_presensi` = '2023-11-15',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_15`,max(if(`presensi`.`tgl_presensi` = '2023-11-16',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_16`,max(if(`presensi`.`tgl_presensi` = '2023-11-17',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_17`,max(if(`presensi`.`tgl_presensi` = '2023-11-18',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_18`,max(if(`presensi`.`tgl_presensi` = '2023-11-19',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_19`,max(if(`presensi`.`tgl_presensi` = '2023-11-20',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_20`,max(if(`presensi`.`tgl_presensi` = '2023-11-21',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_21`,max(if(`presensi`.`tgl_presensi` = '2023-11-22',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_22`,max(if(`presensi`.`tgl_presensi` = '2023-11-23',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_23`,max(if(`presensi`.`tgl_presensi` = '2023-11-24',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_24`,max(if(`presensi`.`tgl_presensi` = '2023-11-25',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_25`,max(if(`presensi`.`tgl_presensi` = '2023-11-26',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_26`,max(if(`presensi`.`tgl_presensi` = '2023-11-27',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_27`,max(if(`presensi`.`tgl_presensi` = '2023-11-28',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_28`,max(if(`presensi`.`tgl_presensi` = '2023-11-29',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_29`,max(if(`presensi`.`tgl_presensi` = '2023-11-30',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_30`,max(if(`presensi`.`tgl_presensi` = '2023-11-31',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_31` from ((`presensi` left join `jam_kerja` on(`presensi`.`kode_jam_kerja` = `jam_kerja`.`kode_jam_kerja`)) left join `pengajuan_izin` on(`presensi`.`kode_izin` = `pengajuan_izin`.`kode_izin`)) group by `presensi`.`nik`) `presensi` on(`karyawan`.`nik` = `presensi`.`nik`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`kode_cabang`) USING BTREE;

--
-- Indeks untuk tabel `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`kode_client`);

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`kode_dept`) USING BTREE;

--
-- Indeks untuk tabel `harilibur`
--
ALTER TABLE `harilibur`
  ADD PRIMARY KEY (`kode_libur`) USING BTREE;

--
-- Indeks untuk tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`kode_item`);

--
-- Indeks untuk tabel `jam_kerja`
--
ALTER TABLE `jam_kerja`
  ADD PRIMARY KEY (`kode_jam_kerja`) USING BTREE;

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`) USING BTREE,
  ADD KEY `fk_karyawan_cabang` (`kode_cabang`) USING BTREE,
  ADD KEY `fk_karyawan_dept` (`kode_dept`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD KEY `fk_kj_karyawan` (`nik`) USING BTREE,
  ADD KEY `fk_kj_jk` (`kode_jam_kerja`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD KEY `fk_kjbydate_karyawan` (`nik`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD PRIMARY KEY (`kode_jk_dept`) USING BTREE,
  ADD KEY `fk_kjd_cabang` (`kode_cabang`) USING BTREE,
  ADD KEY `fk_kjd_dept` (`kode_dept`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD KEY `fk_jkdept` (`kode_jk_dept`) USING BTREE;

--
-- Indeks untuk tabel `master_cuti`
--
ALTER TABLE `master_cuti`
  ADD PRIMARY KEY (`kode_cuti`) USING BTREE;

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indeks untuk tabel `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD PRIMARY KEY (`kode_izin`) USING BTREE,
  ADD KEY `fk_pengajuan_karyawan` (`nik`) USING BTREE,
  ADD KEY `fk_pengajuan_cuti` (`kode_cuti`) USING BTREE;

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_presensi_karyawan` (`nik`) USING BTREE,
  ADD KEY `fk_prensesi_pengajuan_izin` (`kode_izin`) USING BTREE,
  ADD KEY `fk_presensi_jk` (`kode_jam_kerja`) USING BTREE;

--
-- Indeks untuk tabel `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`no_proposal`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_karyawan_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD CONSTRAINT `fk_kj_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kj_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD CONSTRAINT `fk_kjbydate_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD CONSTRAINT `fk_kjd_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kjd_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD CONSTRAINT `fk_jkdept` FOREIGN KEY (`kode_jk_dept`) REFERENCES `konfigurasi_jk_dept` (`kode_jk_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD CONSTRAINT `fk_pengajuan_cuti` FOREIGN KEY (`kode_cuti`) REFERENCES `master_cuti` (`kode_cuti`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pengajuan_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
