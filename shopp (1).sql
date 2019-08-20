-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 Agu 2019 pada 04.11
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
  `USERNAME` varchar(12) NOT NULL,
  `PASS` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`USERNAME`, `PASS`) VALUES
('FIZ', 'ADMIN1'),
('IKI', 'ADMIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `ID_CATEGORY` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`ID_CATEGORY`, `NAME`) VALUES
('IDC001', 'LAPTOPS'),
('IDC002', 'PRINTERS'),
('IDC003', 'MONITORS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `ID_MEMBER` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL,
  `CELL PHONE` varchar(15) NOT NULL,
  `GENDER` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`ID_MEMBER`, `NAME`, `ADDRESS`, `CELL PHONE`, `GENDER`) VALUES
('IDM001', 'FISH', 'BANJARMASIN', '+6281234567890', 'M'),
('IDM002', 'LENA', 'SURABAYA', '+6281098765432', 'F');

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

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`ID_ORDER`, `DATE`, `ID_ADMIN`, `ID_VISIT`, `ID_PRODUCT`, `ID_MEMBER`, `TOTAL`) VALUES
('IDO001', '2019-08-10 04:35:12', 'FIZ', NULL, 'IDP001', 'IDM001', NULL);

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

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`ID_PRODUCT`, `ID_CATEGORY`, `NAME`, `PRICE`, `QTY`, `DESCRIBEs`) VALUES
('IDP001', 'IDC001', 'ASUSX', 5000, 6, 'Fro gaming only');

-- --------------------------------------------------------

--
-- Struktur dari tabel `visitor`
--

CREATE TABLE `visitor` (
  `ID_VISIT` varchar(12) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL,
  `CELL PHONE` varchar(15) NOT NULL,
  `GENDER` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `visitor`
--

INSERT INTO `visitor` (`ID_VISIT`, `NAME`, `ADDRESS`, `CELL PHONE`, `GENDER`) VALUES
('IDV001', 'TANTAN', 'DA NANG', '+62999888777', 'M');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`USERNAME`);

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
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`username`),
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
