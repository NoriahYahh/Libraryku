-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Des 2023 pada 07.34
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
  `gambar` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mdt_buku`
--

INSERT INTO `mdt_buku` (`id_buku`, `judul_buku`, `deskripsi`, `pengarang`, `jenis_buku`, `id_admin`, `gambar`, `create_date`) VALUES
(55, 'Java', 'Java adalah sebuah buku pelajaran tentang Codingan', 'Baihaqii', 'Buku Bacaan', 1, 'h.jpg', '2023-12-04 07:14:52'),
(64, 'Web', 'AAAAAAAAAA', 'UUUUUUUUUYAYAHAHH', 'Buku Bacaan', 1, 'h.jpg', '2023-12-06 05:30:10'),
(68, 'hjg', 'jh', 'jkh', 'Buku Bacaan', 1, 'h.jpg', '2023-12-07 04:05:02'),
(69, 'jkh', 'ghjhgjhkg', 'jhhgjg', 'Buku Ajar(Diktat)', 1, 'h.jpg', '2023-12-07 04:06:43'),
(70, '', '', '', 'Buku Bacaan', 1, 'h.jpg', '0000-00-00 00:00:00');

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
  `status` enum('Aktif','Cuti','DO','Undir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mhs`
--

INSERT INTO `mhs` (`nim`, `nama_mhs`, `jenkel`, `id_prodi`, `id_smt`, `email`, `password`, `status`) VALUES
(22302008, 'baihaqi', 'Laki-Laki', 1, 3, 'haqi20082004@gmail.com', 'baihaqi123', 'Aktif');

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
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT untuk tabel `mdt_laporan_ta`
--
ALTER TABLE `mdt_laporan_ta`
  MODIFY `id_laporan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mhs`
--
ALTER TABLE `mhs`
  MODIFY `nim` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22302009;

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
