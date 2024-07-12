-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jul 2024 pada 05.05
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barcode` int(20) NOT NULL,
  `name` char(100) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `harga_beli` bigint(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `kategori_id` int(8) NOT NULL,
  `satuan_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `supplier_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id` int(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `pembelian_id` int(8) NOT NULL,
  `barang_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int(8) NOT NULL,
  `barang_id` int(8) NOT NULL,
  `penjualan_id` int(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(2, 'Foods'),
(3, 'Cleaning tool'),
(4, 'soap'),
(5, 'groceries'),
(10, 'saya'),
(11, 'yayay');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` char(100) NOT NULL,
  `telp` char(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `member` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `member`) VALUES
(3, 123, '123', '132', '123', '123', 'YES'),
(4, 32323232, '23232', '3232', '232', '3232', 'YES'),
(5, 233232, 'test', 'test', 'test', 'test', 'NO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) NOT NULL,
  `total` bigint(200) NOT NULL,
  `bayar` bigint(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `supplier_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) NOT NULL,
  `total` bigint(200) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(8) NOT NULL,
  `barcode` int(15) NOT NULL,
  `name` char(25) NOT NULL,
  `price` bigint(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `kategori_id` int(5) NOT NULL,
  `satuan_id` int(5) NOT NULL,
  `supplier` int(5) NOT NULL,
  `is_ative` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `deskripsi`) VALUES
(1, 'pcss', 'pieces'),
(2, 'dus', 'dus'),
(3, 'kg', 'Kilogram'),
(4, 'bal', 'bal'),
(5, 'sak', 'sak'),
(6, 'box', 'box');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` char(100) NOT NULL,
  `telp` char(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `perusahaan` varchar(150) NOT NULL,
  `name_bank` varchar(150) NOT NULL,
  `name_akun_bank` varchar(150) NOT NULL,
  `no_akun_bank` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipe` char(20) NOT NULL,
  `email` varchar(125) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telp` char(20) NOT NULL,
  `is_active` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `tipe`, `email`, `alamat`, `telp`, `is_active`) VALUES
(1, 1122334455, 'Owner', 'Muhammad Adnan', '12345678', 'Owner', 'adnan@gmail.com', 'Jl. Bintara', '87854557899', 'active'),
(2, 223311433, 'Admin', 'Muhammad Rizky', '12345678', 'Admin', 'rizky@gmail.com', 'Jl. Surapati', '85152887766', 'active'),
(3, 1122554433, 'Kasir1', 'Linda', '12345678', 'Kasir', 'linda@gmail.com', 'Jl. Antasari', '85277116611', 'inactive'),
(4, 664433221, 'Kasir2', 'Aminah', '12345678', 'Kasir', 'aminah@gmail.com', 'Jl. Kenanga', '83167521111', 'inactive'),
(5, 334411223, 'Kasir3', 'Ratna', '12345678', 'Kasir', 'ratna@gmail.com', 'Jl. Kejaksaan', '85766552244', 'active'),
(6, 667744331, 'Kasir4', 'Fadil', '12345678', 'Kasir', 'fadil@gmail.com', 'Jl. Malioboro', '82156078357', 'inactive');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`,`barcode`,`name`,`harga_jual`,`harga_beli`,`stok`);

--
-- Indeks untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`id`,`harga`,`qty`,`subtotal`);

--
-- Indeks untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`,`nik`,`name`,`telp`,`email`,`alamat`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
