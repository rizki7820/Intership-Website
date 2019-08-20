-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 Agu 2019 pada 03.25
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PASS` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `ID_CATEGORY` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `ID_MEMBER` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `ID_ORDER` varchar(12) NOT NULL,
  `DATE` datetime NOT NULL,
  `ID_ADMIN` varchar(12) DEFAULT NULL,
  `ID_VISIT` varchar(12) DEFAULT NULL,
  `ID_PRODUCT` varchar(12) DEFAULT NULL,
  `ID_MEMBER` varchar(12) DEFAULT NULL,
  `TOTAL` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `ID_PRODUCT` varchar(12) NOT NULL,
  `ID_CATEGORY` varchar(12) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `DESCRIBEs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `visitor`
--

CREATE TABLE `visitor` (
  `ID_VISIT` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_CATEGORY`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID_MEMBER`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_ORDER`),
  ADD KEY `FK_RELATIONSHIP_1` (`ID_ADMIN`),
  ADD KEY `FK_RELATIONSHIP_2` (`ID_MEMBER`),
  ADD KEY `FK_RELATIONSHIP_3` (`ID_VISIT`),
  ADD KEY `FK_RELATIONSHIP_4` (`ID_PRODUCT`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID_PRODUCT`),
  ADD KEY `FK_RELATIONSHIP_5` (`ID_CATEGORY`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`ID_VISIT`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_MEMBER`) REFERENCES `member` (`ID_MEMBER`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_VISIT`) REFERENCES `visitor` (`ID_VISIT`),
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`);

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `category` (`ID_CATEGORY`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
