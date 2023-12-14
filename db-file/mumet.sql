-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Des 2023 pada 23.20
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mumet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` varchar(25) NOT NULL,
  `id_invoice` varchar(30) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`) VALUES
(27, '11', 'INV-90893503', 2, 'Sepatu New Era', 1, 300000),
(28, '11', 'INV-83978910', 2, 'tempat nasi', 1, 300000),
(29, '11', 'INV-83978910', 4, 'tempat nasi', 1, 150000),
(30, '11', 'INV-63975550', 1, 'tempat nasi', 1, 100000),
(31, '11', 'INV-63975550', 5, 'tempat nasi', 1, 7850000),
(32, '11', 'INV-62672893', 2, 'tempat nasi', 1, 300000),
(33, '11', 'INV-62672893', 6, 'tas prempuan', 1, 55000),
(34, '11', 'INV-62672893', 5, 'tempat nasi', 1, 78500),
(35, '11', 'INV-62672893', 4, 'tempat nasi', 1, 150000);

--
-- Trigger `cart`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `cart` FOR EACH ROW BEGIN
	UPDATE product SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(2, 'tempat nasi', 'kerajinan tanngan', 'sutra', 300000, 10, 'foto2.jpeg'),
(4, 'tempat nasi', 'kerajinan tanngan', 'serat', 150000, 9, 'foto3.jpeg'),
(5, 'tempat nasi', 'kerajinan tanngan', 'Eceng', 78500, 99, 'foto4.jpeg'),
(6, 'tas prempuan', 'bagus ', 'bulu', 55000, 14, 'images1.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `order_id` char(30) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `city` varchar(255) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `ekspedisi` varchar(100) NOT NULL,
  `tracking_id` varchar(30) NOT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `payment_limit` datetime DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`order_id`, `id_user`, `name`, `email`, `alamat`, `mobile_phone`, `city`, `kode_pos`, `payment_method`, `ekspedisi`, `tracking_id`, `transaction_time`, `payment_limit`, `status`, `gambar`) VALUES
('INV-62672893', '11', 'joko', 'joko@gmail.com', 'Graha lestari', '083821100553', 'Bungo', '1750', 'Direct Bank Transfer', 'SICEPAT', '296797384695', '2023-12-13 01:57:07', '2023-12-14 01:57:07', '0', NULL),
('INV-63975550', '11', 'joko', 'joko@gmail.com', 'Graha lestari', '083821100553', 'Gunung Kidul', '1750', 'Direct Bank Transfer', 'JNE', '309608195351', '2023-12-12 03:22:24', '2023-12-13 03:22:24', '0', NULL),
('INV-83978910', '11', 'joko', 'joko@gmail.com', 'Graha lestari', '083821100553', 'Serang', '1750', 'Direct Bank Transfer', 'J&T Express', '206954415562', '2023-12-05 14:20:17', '2023-12-06 14:20:17', '1', NULL),
('INV-90893503', '11', 'joko', 'joko@gmail.com', 'Graha lestari', '083821100553', 'Lebak', '1750', 'Direct Bank Transfer', 'J&T Express', '312301325566', '2023-11-29 14:13:35', '2023-11-30 14:13:35', '1', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `avatar`) VALUES
(6, 'Helpdesk Shoppify', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'user.png'),
(11, 'joko', 'joko@gmail.com', '278ea841c0d133059032b8a75320c3e0', '2', 'user.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
