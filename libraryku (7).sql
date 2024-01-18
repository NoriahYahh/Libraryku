-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2024 pada 09.04
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libraryku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `status` enum('Aktif','Tidak Aktif','','') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `status`, `create_date`, `password`) VALUES
(1, 'admin', 'Aktif', '2023-11-24 14:38:11', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mdt_buku`
--

CREATE TABLE `mdt_buku` (
  `id_buku` int(5) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `jenis_buku` enum('Buku Bacaan','Buku Ajar(Diktat)','','') NOT NULL,
  `id_admin` int(5) NOT NULL,
  `file` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mdt_buku`
--

INSERT INTO `mdt_buku` (`id_buku`, `judul_buku`, `deskripsi`, `pengarang`, `jenis_buku`, `id_admin`, `file`, `create_date`) VALUES
(80, 'Makalah', 'Sebuahh Makalah', 'Nor', 'Buku Bacaan', 1, 'MAKALAH PRS - SMK NEGERI 1 MARABAHAN - NEW NORMAL.pdf', '2023-12-31 03:39:31'),
(82, 'Buku Masak', 'Untuk belajar masak', 'Noriah', 'Buku Bacaan', 1, 'Buku Masak.pdf', '2023-12-31 03:36:00'),
(83, 'Masakan', 'Untuk memasak', 'Noriah Polhas', 'Buku Bacaan', 1, 'Buku Masak.pdf', '2023-12-31 06:02:40'),
(90, 'Buku', 'Diktat', 'Maira', 'Buku Bacaan', 1, 'TUGAS_BAB_1_(bu-WPS_Office[1].doc', '2024-01-13 04:10:39'),
(91, 'Buku', 'Buku Belajar', 'Bella', 'Buku Ajar(Diktat)', 1, 'asset_buku_contoh-proposal (4).pdf', '2024-01-13 04:09:31'),
(92, 'Jurnal', 'Jurnal Saya', 'Inor', 'Buku Bacaan', 1, 'Jurnal 8.pdf', '2024-01-13 04:24:33'),
(93, 'Jurnal 5', 'Jurnal Noriah', 'Pencipta Noriah', 'Buku Ajar(Diktat)', 1, 'jurnal 5.pdf', '2024-01-13 04:26:57'),
(94, 'Jurnal 8', 'JURNAL 8', '88888', 'Buku Ajar(Diktat)', 1, 'Jurnal 8.pdf', '2024-01-13 04:28:30'),
(95, 'Asset buku 5', 'asset sebuah buku', 'Puspita', 'Buku Ajar(Diktat)', 1, 'asset_buku_contoh-proposal (6).pdf', '2024-01-17 08:13:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mdt_laporan_ta`
--

CREATE TABLE `mdt_laporan_ta` (
  `id_laporan` int(5) NOT NULL,
  `judul_laporan` varchar(255) NOT NULL,
  `abstrak` text NOT NULL,
  `nim` int(8) NOT NULL,
  `id_prodi` int(5) NOT NULL,
  `file` varchar(50) NOT NULL,
  `status` enum('Proses','Selesai','','') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mdt_laporan_ta`
--

INSERT INTO `mdt_laporan_ta` (`id_laporan`, `judul_laporan`, `abstrak`, `nim`, `id_prodi`, `file`, `status`, `create_date`) VALUES
(13, 'Tugas Akhir', 'Penjelasan tentang Jurnal Tugas Akhir', 22302016, 1, 'Jurnal 6.pdf', 'Proses', '2024-01-13 04:15:43'),
(16, 'Tugas Akhir', 'Tugas Akhir Saya', 22302016, 1, 'Buku Masak.pdf', 'Proses', '2024-01-13 04:21:52'),
(20, 'Tugas Akhir', 'Penjelasan Tugas Akhir', 22302016, 1, 'Deskripsi TA.pdf', 'Proses', '2024-01-17 08:47:20'),
(21, 'Tugas Akhir', 'Tugas Akhir Mahasiwa Akhir', 22302016, 1, 'Deskripsi TA.pdf', 'Selesai', '2024-01-17 08:48:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mhs`
--

CREATE TABLE `mhs` (
  `nim` int(8) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `jenkel` enum('Laki-Laki','Perempuan','','') NOT NULL,
  `id_prodi` int(5) NOT NULL,
  `id_smt` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` enum('Aktif','Cuti','DO','Undir') NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mhs`
--

INSERT INTO `mhs` (`nim`, `nama_mhs`, `jenkel`, `id_prodi`, `id_smt`, `email`, `password`, `status`, `username`) VALUES
(22302000, 'Nori', 'Perempuan', 2, 6, 'noriiiii@gmail.com', 'Nuri', 'Aktif', '3'),
(22302008, 'Noriah', 'Perempuan', 1, 3, 'noriahyahh', '1', 'Aktif', '1'),
(22302016, 'Noriah', 'Perempuan', 1, 6, 'noriahyahh@gmail.com', 'Noriah', 'Aktif', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(5) NOT NULL,
  `nama_prodi` varchar(50) NOT NULL,
  `jenjang` enum('D3','D4','','') NOT NULL,
  `status` enum('Aktif','Tidak Aktif','','') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `jenjang`, `status`, `create_date`) VALUES
(1, 'Teknik Informatika', 'D3', 'Aktif', '2023-11-24 14:40:32'),
(2, 'Teknik Otomotif', 'D3', 'Aktif', '2023-11-24 14:40:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `smt`
--

CREATE TABLE `smt` (
  `id_smt` int(5) NOT NULL,
  `nama_smt` enum('I','II','III','IV','V','VI','VII','VIII') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `smt`
--

INSERT INTO `smt` (`id_smt`, `nama_smt`, `create_date`) VALUES
(1, 'I', '2023-11-24 14:41:41'),
(2, 'II', '2023-11-24 14:41:41'),
(3, 'III', '2023-11-24 14:41:41'),
(4, 'IV', '2023-11-24 14:41:41'),
(5, 'V', '2023-11-24 14:41:41'),
(6, 'VI', '2023-11-24 14:41:41'),
(7, 'VII', '2023-11-24 14:41:41'),
(8, 'VIII', '2023-11-24 14:41:53');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `mdt_buku`
--
ALTER TABLE `mdt_buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `mdt_laporan_ta`
--
ALTER TABLE `mdt_laporan_ta`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `nim` (`nim`,`id_prodi`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indeks untuk tabel `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_prodi` (`id_prodi`,`id_smt`),
  ADD KEY `id_smt` (`id_smt`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indeks untuk tabel `smt`
--
ALTER TABLE `smt`
  ADD PRIMARY KEY (`id_smt`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mdt_buku`
--
ALTER TABLE `mdt_buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT untuk tabel `mdt_laporan_ta`
--
ALTER TABLE `mdt_laporan_ta`
  MODIFY `id_laporan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `mhs`
--
ALTER TABLE `mhs`
  MODIFY `nim` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22302018;

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `smt`
--
ALTER TABLE `smt`
  MODIFY `id_smt` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mdt_buku`
--
ALTER TABLE `mdt_buku`
  ADD CONSTRAINT `mdt_buku_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mdt_laporan_ta`
--
ALTER TABLE `mdt_laporan_ta`
  ADD CONSTRAINT `mdt_laporan_ta_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mdt_laporan_ta_ibfk_2` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mhs`
--
ALTER TABLE `mhs`
  ADD CONSTRAINT `mhs_ibfk_1` FOREIGN KEY (`id_smt`) REFERENCES `smt` (`id_smt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mhs_ibfk_2` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
