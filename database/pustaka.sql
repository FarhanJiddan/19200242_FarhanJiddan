-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2022 at 04:30 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(12) CHARACTER SET latin1 NOT NULL,
  `tgl_booking` date NOT NULL,
  `batas_ambil` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `batas_ambil`, `id_user`) VALUES
('30042022001', '2022-04-30', '2022-05-02', 17);

-- --------------------------------------------------------

--
-- Table structure for table `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `id_booking` varchar(12) CHARACTER SET latin1 NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_detail`
--

INSERT INTO `booking_detail` (`id`, `id_booking`, `id_buku`) VALUES
(19, '30042022001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(128) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `pengarang` varchar(64) NOT NULL,
  `penerbit` varchar(64) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` varchar(64) NOT NULL,
  `stok` int(11) NOT NULL,
  `dipinjam` int(11) NOT NULL,
  `dibooking` int(11) NOT NULL,
  `image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul_buku`, `id_kategori`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `stok`, `dipinjam`, `dibooking`, `image`) VALUES
(1, 'Statistika dengan Program Komputer', 1, 'Ahmad Koliqul Amin', 'Deep Publish', 2014, '97860122809432', 1, 1, 16, 'img1557402455.jpg'),
(2, 'Mudah Belajar Komputer untuk Anak', 1, 'Bambang Agus Setiawan', 'Huta Media', 2014, '9786025118500', 5, 3, 1, 'img1557402397.jpg'),
(5, 'PHP Komplet', 1, 'Jubilee', 'Elex Media Komputindo', 2017, '8346753547', 5, 1, 1, 'img1555522493.jpg'),
(10, 'Detektif Conan Ep 200', 9, 'Okigawa sasuke', 'Cultura', 2016, '874387583987', 5, 0, 0, 'img1557401465.jpg'),
(14, 'Bahasa Indonesia', 2, 'Umri Nur\'aini dan Indriyani', 'Pusat Perbukuan', 2015, '757254724884', 3, 0, 0, 'img1557402703.jpg'),
(15, 'Komunikasi Lintas Budaya', 5, 'Dr. Dedi Kurnia', 'Published', 2015, '878674646488', 5, 0, 0, 'img1557403156.jpg'),
(16, 'Kolaborasi Codeigniter dan Ajax dalam Perancangan', 1, 'Anton Subagia', 'Elex Media komputindo', 2017, '43345356577', 5, 0, 0, 'img1557403502.jpg'),
(17, 'From Hobby to Money', 4, 'Deasylawati', 'Elex Media Komputindo', 2015, '87968686787879', 5, 0, 0, 'img1557403658.jpg'),
(18, 'Buku Saku Pramuka', 8, 'Rudi Himawan', 'Pusat Perbukuan', 2016, '97868687978796', 6, 0, 0, 'img1557404613.jpg'),
(19, 'Rahasia Keajaiban Bumi', 3, 'Nurul Ihsan', 'Luxima', 2014, '565756565768868', 5, 0, 0, 'img1557404689.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Komputer'),
(2, 'Bahasa'),
(3, 'Sains'),
(4, 'Hobby'),
(5, 'Komunikasi'),
(6, 'Hukum'),
(7, 'Agama'),
(8, 'Populer'),
(9, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` enum('Pinjam','Kembali') DEFAULT 'Pinjam',
  `total_denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `tgl_booking` datetime DEFAULT NULL,
  `id_user` varchar(12) CHARACTER SET latin1 NOT NULL,
  `email_user` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `judul_buku` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `penulis` varchar(128) CHARACTER SET latin1 NOT NULL,
  `penerbit` varchar(128) CHARACTER SET latin1 NOT NULL,
  `tahun_terbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `alamat`, `email`, `image`, `password`, `role_id`, `is_active`, `tanggal_input`) VALUES
(17, 'Farhan Jiddan', 'GG.annur', 'farhanjiddan666@gmail.com', 'pro1648464367.png', '$2y$10$4Ka2V5GJxuh47sFnRDC4M.ColoFnJvSJMcv84RswQTPriTjbfBe0C', 2, 1, 1648457505),
(18, 'farhan', '', 'farhanjiddan66@gmail.com', 'default.jpg', '$2y$10$Yqk4pdG0kd7YMbAharxEtuTR1kg8JESmSqpT3MdtrD3M06ge/k1nq', 2, 1, 1651290788);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`no_pinjam`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
