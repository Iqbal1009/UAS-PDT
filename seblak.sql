-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 04:53 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seblak`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

CREATE TABLE `tb_log` (
  `id_log` int(11) NOT NULL,
  `isi_log` text NOT NULL,
  `tanggal_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_log`
--

INSERT INTO `tb_log` (`id_log`, `isi_log`, `tanggal_log`, `id_user`) VALUES
(1, 'Menu dengan nama menu <b>Dimsum Sayur</b> berhasil diubah menjadi <b>Dimsum Sayur</b>', 1659741138, 1),
(2, 'Menu dengan nama menu <b>Dimsum Ayam</b> berhasil diubah menjadi <b>Dimsum Ayam</b>', 1659741142, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_log_pengeluaran`
--

CREATE TABLE `tb_log_pengeluaran` (
  `id_log_pengeluaran` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga_menu` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`id_menu`, `nama_menu`, `harga_menu`, `id_outlet`) VALUES
(1, 'Dimsum Ayam', 2500, 1),
(2, 'Dimsum Sayur', 2000, 1),
(3, 'Dimsum Sapi', 3000, 1),
(4, 'Dimsum Keju', 3000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) NOT NULL,
  `no_telepon_outlet` varchar(20) NOT NULL,
  `alamat_outlet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_outlet`
--

INSERT INTO `tb_outlet` (`id_outlet`, `nama_outlet`, `no_telepon_outlet`, `alamat_outlet`) VALUES
(1, 'At Dymsum Aww', '088211623915', 'Jl. AMD Babakan Pocis 11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `jml_uang_dibayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tgl_pembayaran` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `jumlah_pengeluaran` int(11) NOT NULL,
  `keterangan_pengeluaran` text NOT NULL,
  `tanggal_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `status_bayar` enum('belum_dibayar','sudah_dibayar') NOT NULL,
  `tgl_transaksi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` enum('administrator','kasir') NOT NULL,
  `id_outlet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `jabatan`, `id_outlet`) VALUES
(1, 'Dimas Ramadhan', 'admin', '$2y$10$yICyAfAkWZDX2nGec2BwqOf2le4TAxGtjU53AKb0QeutbD7akJw92', 'administrator', 1),
(2, 'Haus Coding Dev', 'hako-975', '$2y$10$b4VVR0au7fQTJH8C/FKGL.WmpSja8TCTuWunQaQN0vYCu8WfHfxcO', 'administrator', 2),
(12, 'Whiki', 'kasir01', '$2y$10$AjK7x3/4nCzMV/2GKJhk2.hadFXn34eplSw/bwzFvi8jo1H3W8VqG', 'kasir', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_log_pengeluaran`
--
ALTER TABLE `tb_log_pengeluaran`
  ADD PRIMARY KEY (`id_log_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indexes for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`kode_invoice`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indexes for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_log_pengeluaran`
--
ALTER TABLE `tb_log_pengeluaran`
  MODIFY `id_log_pengeluaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
