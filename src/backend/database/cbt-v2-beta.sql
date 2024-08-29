-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 04:27 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbt-unit_test_erl`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `sandi` varchar(255) DEFAULT NULL,
  `panel_admin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `sandi`, `panel_admin`) VALUES
(1, 'admin', 'akusukamatcha', NULL),
(2, 'erl', 'Shiesuta12', NULL),
(3, 'dimas', 'dimasanjay', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_ujian`
--

CREATE TABLE `detail_ujian` (
  `id` varchar(255) NOT NULL,
  `judul_soal` text NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `durasi` time NOT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_mapel` varchar(255) DEFAULT NULL,
  `nig_guru` int(11) NOT NULL,
  `id_ujian` varchar(255) DEFAULT NULL,
  `id_kelas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_ujian`
--

INSERT INTO `detail_ujian` (`id`, `judul_soal`, `jumlah_soal`, `durasi`, `dibuat_pada`, `id_mapel`, `nig_guru`, `id_ujian`, `id_kelas`) VALUES
('XI-RPL-1-PBO-1214001', 'Pemrograman Berorientasi Objek', 50, '01:00:00', '2024-08-27 12:56:45', 'PBO', 1214001, 'PTS-2024-08-3031', 'XI-RPL-1'),
('XI-RPL-3-PBO-1214001', 'Pemrograman Berorientasi Objek', 50, '01:00:00', '2024-08-27 11:29:56', 'PBO', 1214001, 'PTS-2024-08-3031', 'XI-RPL-3');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nig` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kode_guru` varchar(255) NOT NULL,
  `sandi` varchar(255) NOT NULL,
  `id_kelas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nig`, `nama`, `kode_guru`, `sandi`, `id_kelas`) VALUES
(1214001, 'Erl ft Siesta', 'erl', 'Shiesuta12', NULL),
(1214002, 'Gogu Jadu', 'gogo', 'Indojuara1', NULL),
(1214003, 'haikal', 'kal', 'alek', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_pertanyaan`
--

CREATE TABLE `jawaban_pertanyaan` (
  `id` varchar(255) NOT NULL,
  `id_pertanyaan` varchar(255) NOT NULL,
  `isi_jawaban` text NOT NULL,
  `id_detail_ujian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jawaban_pertanyaan`
--

INSERT INTO `jawaban_pertanyaan` (`id`, `id_pertanyaan`, `isi_jawaban`, `id_detail_ujian`) VALUES
('CDJOzcXwAG', 'CDJOzcXwAG', '\"{\\\"jawaban_yang_di_pilih\\\":\\\"Javascript memiliki tipe data Null, Undefined, Float dan Integer\\\",\\\"jawaban_alphabet\\\":\\\"C\\\"}\"', 'XI-RPL-3-PBO-1214001'),
('d5gFkh-FpI', 'd5gFkh-FpI', '\"{\\\"jawaban_yang_di_pilih\\\":\\\"Javascript memiliki tipe data Null, Undefined, Float dan Integer\\\",\\\"jawaban_alphabet\\\":\\\"C\\\"}\"', 'XI-RPL-1-PBO-1214001'),
('DxPx4N7jAr', 'DxPx4N7jAr', '\"{\\\"jawaban_yang_di_pilih\\\":\\\"Application Programming Interface\\\",\\\"jawaban_alphabet\\\":\\\"A\\\"}\"', 'XI-RPL-3-PBO-1214001'),
('FxA-iyLFpk', 'FxA-iyLFpk', '\"{\\\"jawaban_yang_di_pilih\\\":\\\"JS\\\",\\\"jawaban_alphabet\\\":\\\"B\\\"}\"', 'XI-RPL-3-PBO-1214001'),
('ijXpWaMf53', 'ijXpWaMf53', '\"{\\\"jawaban_yang_di_pilih\\\":\\\"JS\\\",\\\"jawaban_alphabet\\\":\\\"B\\\"}\"', 'XI-RPL-1-PBO-1214001'),
('oxIi4NzOd7', 'oxIi4NzOd7', '\"{\\\"jawaban_yang_di_pilih\\\":\\\"Application Programming Interface\\\",\\\"jawaban_alphabet\\\":\\\"A\\\"}\"', 'XI-RPL-1-PBO-1214001');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_siswa`
--

CREATE TABLE `jawaban_siswa` (
  `id` int(11) NOT NULL,
  `nis` int(11) NOT NULL,
  `id_pertanyaan` varchar(255) NOT NULL,
  `jawaban` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`jawaban`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` varchar(255) NOT NULL,
  `kelas` enum('X','XI','XII') NOT NULL,
  `jurusan` enum('RPL','TKJ','MM','PKM') NOT NULL,
  `nomor_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `kelas`, `jurusan`, `nomor_kelas`) VALUES
('XI-RPL-1', 'XI', 'RPL', 1),
('XI-RPL-3', 'XI', 'RPL', 3),
('XII-RPL-1', 'XII', 'RPL', 1),
('XII-RPL-2', 'XII', 'RPL', 2),
('XII-RPL-3', 'XII', 'RPL', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` varchar(255) NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `mapel`, `dibuat_pada`) VALUES
('PBO', 'PBO', '2024-08-19 10:00:00'),
('PPL', 'PPL', '2024-08-14 12:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_siswa`
--

CREATE TABLE `nilai_siswa` (
  `id` int(11) NOT NULL,
  `nis` int(11) NOT NULL,
  `hasil` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`hasil`)),
  `detil_nilai` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`detil_nilai`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai_siswa`
--

INSERT INTO `nilai_siswa` (`id`, `nis`, `hasil`, `detil_nilai`) VALUES
(1, 10201, '0', '{\"id_pertanyaan\":1,\"benar\":false,\"jawaban_siswa\":\"B\",\"jawaban_benar\":\"A\"}'),
(2, 10202, '100', '{\"id_pertanyaan\":1,\"benar\":true,\"jawaban_siswa\":\"A\",\"jawaban_benar\":\"A\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` varchar(255) NOT NULL,
  `nomor` varchar(255) DEFAULT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` text DEFAULT NULL,
  `id_detail_ujian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id`, `nomor`, `pertanyaan`, `gambar`, `id_detail_ujian`) VALUES
('CDJOzcXwAG', '2', 'Manakah yang tidak benar dari Pernyataan tentang Javascript berikut ini?...', NULL, 'XI-RPL-3-PBO-1214001'),
('d5gFkh-FpI', '2', 'Manakah yang tidak benar dari Pernyataan tentang Javascript berikut ini?...', NULL, 'XI-RPL-1-PBO-1214001'),
('DxPx4N7jAr', '1', 'Gambar diatas merupakan gambar bertuliskan ‘API’, Apa itu API? …', NULL, 'XI-RPL-3-PBO-1214001'),
('FxA-iyLFpk', '3', 'Manakah gambar bahasa pemrograman yang dipakai untuk pemrograman di sisi Web?...', NULL, 'XI-RPL-3-PBO-1214001'),
('ijXpWaMf53', '3', 'Manakah gambar bahasa pemrograman yang dipakai untuk pemrograman di sisi Web?...', NULL, 'XI-RPL-1-PBO-1214001'),
('oxIi4NzOd7', '1', 'Gambar diatas merupakan gambar bertuliskan ‘API’, Apa itu API? …', NULL, 'XI-RPL-1-PBO-1214001');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `panggilan` varchar(255) NOT NULL,
  `sandi` varchar(255) NOT NULL,
  `is_lulus` tinyint(4) NOT NULL,
  `is_switch_tab` tinyint(4) DEFAULT NULL,
  `id_kelas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `panggilan`, `sandi`, `is_lulus`, `is_switch_tab`, `id_kelas`) VALUES
(10201, 'John Anak Baik', 'John', 'alek', 0, NULL, 'XII-RPL-3'),
(10202, 'Dante Umumakan', 'Dante', 'kumaumakan10', 0, NULL, 'XII-RPL-3'),
(10203, 'dimas', 'mas', 'legion', 0, 0, 'XI-RPL-3');

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id` varchar(255) NOT NULL,
  `ujian` varchar(255) NOT NULL,
  `dimulai_pada` date NOT NULL,
  `berakhir_pada` date NOT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id`, `ujian`, `dimulai_pada`, `berakhir_pada`, `dibuat_pada`) VALUES
('PTS-2024-08-3031', 'PTS', '2024-08-30', '2024-08-31', '2024-08-14 12:01:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_ujian`
--
ALTER TABLE `detail_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_ujian` (`id_ujian`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `nig_guru` (`nig_guru`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nig`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `jawaban_pertanyaan`
--
ALTER TABLE `jawaban_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_detail_ujian` (`id_detail_ujian`),
  ADD KEY `id_pertanyaan` (`id_pertanyaan`);

--
-- Indexes for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_pertanyaan` (`id_pertanyaan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nilai_siswa_ibfk_1` (`nis`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_soal` (`id_detail_ujian`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_ujian`
--
ALTER TABLE `detail_ujian`
  ADD CONSTRAINT `detail_ujian_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_ujian_ibfk_2` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_ujian_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_ujian_ibfk_4` FOREIGN KEY (`nig_guru`) REFERENCES `guru` (`nig`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jawaban_pertanyaan`
--
ALTER TABLE `jawaban_pertanyaan`
  ADD CONSTRAINT `jawaban_pertanyaan_ibfk_2` FOREIGN KEY (`id_detail_ujian`) REFERENCES `detail_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jawaban_pertanyaan_ibfk_3` FOREIGN KEY (`id_pertanyaan`) REFERENCES `pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD CONSTRAINT `jawaban_siswa_ibfk_2` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jawaban_siswa_ibfk_3` FOREIGN KEY (`id_pertanyaan`) REFERENCES `pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  ADD CONSTRAINT `nilai_siswa_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD CONSTRAINT `pertanyaan_ibfk_1` FOREIGN KEY (`id_detail_ujian`) REFERENCES `detail_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
