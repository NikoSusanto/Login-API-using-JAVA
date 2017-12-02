-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02 Des 2017 pada 01.28
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qatest`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cluster`
--

CREATE TABLE `cluster` (
  `ID_Cluster` varchar(10) NOT NULL,
  `Nama_Cluster` text NOT NULL,
  `Alamat_Cluster` text NOT NULL,
  `ID_Perumahan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cluster`
--

INSERT INTO `cluster` (`ID_Cluster`, `Nama_Cluster`, `Alamat_Cluster`, `ID_Perumahan`) VALUES
('32', 'Besar', 'Jl. Pisang banana', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perumahan`
--

CREATE TABLE `perumahan` (
  `ID_Perumahan` varchar(10) NOT NULL,
  `Nama_Perumahan` text NOT NULL,
  `Alamat_Perumahan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perumahan`
--

INSERT INTO `perumahan` (`ID_Perumahan`, `Nama_Perumahan`, `Alamat_Perumahan`) VALUES
('111', 'Perumahan Aman', 'Jl. Aman Jaya'),
('123', 'Perumahan Sejahtra', 'Jl. Sejahtra Sentosa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rumah`
--

CREATE TABLE `rumah` (
  `ID_Rumah` varchar(10) NOT NULL,
  `Nama_Rumah` text NOT NULL,
  `Alamat_Rumah` text NOT NULL,
  `ID_Cluster` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rumah`
--

INSERT INTO `rumah` (`ID_Rumah`, `Nama_Rumah`, `Alamat_Rumah`, `ID_Cluster`) VALUES
('887', 'Rumah Idaman', 'Jl. Sejahtra Sentosa No.88', '32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `ID_Tagihan` varchar(10) NOT NULL,
  `Tgl_JatuhTempo` date NOT NULL,
  `Total_Tagihan` int(11) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`ID_Tagihan`, `Tgl_JatuhTempo`, `Total_Tagihan`, `Status`) VALUES
('j7hdmxbd', '2017-12-14', 300000, 'terbayar'),
('j7hdmxch', '2017-12-18', 300000, 'terbayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `ID_User` varchar(10) NOT NULL,
  `Nama_User` text NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `ID_Rumah` varchar(10) NOT NULL,
  `ID_Tagihan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID_User`, `Nama_User`, `Email`, `Password`, `ID_Rumah`, `ID_Tagihan`) VALUES
('1', 'Niko', 'Niko@gmail.com', 'niko123', '887', 'j7hdmxbd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cluster`
--
ALTER TABLE `cluster`
  ADD PRIMARY KEY (`ID_Cluster`);

--
-- Indexes for table `perumahan`
--
ALTER TABLE `perumahan`
  ADD PRIMARY KEY (`ID_Perumahan`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`ID_Rumah`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`ID_Tagihan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_User`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
