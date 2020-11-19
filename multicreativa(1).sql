-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2020 a las 07:30:09
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `multicreativa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CoTCostosTraeDatos` ()  SELECT ProductoNombre nombre,costo precio, estado, id from cotcostos$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (`usuario` VARCHAR(50), `psw` VARCHAR(50))  BEGIN
	declare contUsuario int;
    declare vtoken varchar(50);
    select count(*) into contUsuario from segusuarios where idUsuario = usuario and clave = md5(psw);
    if contUsuario > 0 then
		select md5(RAND()) into vtoken;
        insert  into segtokens (token,activo,usuario) value (vtoken,1,usuario);
    else
		select 0 into vtoken;
    end if;
    select token,usuario from segtokens where token = vtoken;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificaToken` (`vtoken` VARCHAR(50))  BEGIN
	select token,usuario from segtokens where token = vtoken and activo = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotcostos`
--

CREATE TABLE `cotcostos` (
  `id` int(11) NOT NULL,
  `ProductoNombre` varchar(250) DEFAULT NULL,
  `Costo` decimal(10,3) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT 1,
  `HoraTiempo` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cotcostos`
--

INSERT INTO `cotcostos` (`id`, `ProductoNombre`, `Costo`, `Estado`, `HoraTiempo`) VALUES
(1, 'VINIL LAMINADO MATE', '3.050', 1, '2020-11-07 04:56:58'),
(7, 'test', '10.000', 1, '2020-11-19 06:10:53'),
(8, 'test2', '4.500', 1, '2020-11-19 06:25:29'),
(9, 'VINIL TRANSPARENTE', '100.000', 1, '2020-11-19 06:26:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segtokens`
--

CREATE TABLE `segtokens` (
  `id` int(11) NOT NULL,
  `token` varchar(250) DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `horatiempo` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `segtokens`
--

INSERT INTO `segtokens` (`id`, `token`, `activo`, `usuario`, `horatiempo`) VALUES
(1, 'ceb633e9f4bf0cd58484bd23004948ac', b'1', 'SA', '2020-11-18 08:22:04'),
(2, 'aa0be075215dd41092261101f4150b45', b'1', 'SA', '2020-11-18 08:49:32'),
(3, '759da73f4dc4c4009d8cccb7b0cade2c', b'1', 'SA', '2020-11-18 09:35:11'),
(4, '35bd3ca4bcb0a1d7cb290a8004b7e4f9', b'1', 'SA', '2020-11-18 09:37:08'),
(5, '9849446cbe5d99ba9f3866b711c49bff', b'1', 'SA', '2020-11-18 09:44:25'),
(6, '7a05b6d68509dacb2615347a0abd8941', b'1', 'SA', '2020-11-18 09:52:57'),
(7, '462413d0c51ac5acc66c5e6d8c1d6a19', b'1', 'SA', '2020-11-18 10:11:55'),
(8, '0630ba12c46e5a3f354eb1d80752332a', b'1', 'SA', '2020-11-18 10:12:20'),
(9, 'e24cba77314bc2f33fdd3e217a1260ca', b'1', 'SA', '2020-11-18 10:19:08'),
(10, 'dc57b525d661da450e0d336cd65707a2', b'1', 'SA', '2020-11-18 10:19:12'),
(11, '0841db4aa627e3292922a64d6e3979f1', b'1', 'SA', '2020-11-18 10:20:43'),
(12, '3584ba519c20ddc64d62b0528a90d532', b'1', 'SA', '2020-11-18 10:20:49'),
(13, '0fca8698afabdf1661cddd5395b76e27', b'1', 'SA', '2020-11-18 10:22:20'),
(14, '00a89877725fc559adf7554d381c677c', b'1', 'SA', '2020-11-18 10:22:24'),
(15, '380bc3af1bf98eb7eba9c0f0d9afcc12', b'1', 'SA', '2020-11-19 01:17:30'),
(16, '266654d4930071f34305629f54a09d78', b'1', 'SA', '2020-11-19 01:22:55'),
(17, 'c6281613f1aa4c0d847e52d21ab7df0e', b'1', 'SA', '2020-11-19 01:22:59'),
(18, 'c4928c9e7c2d20d6a324a93d8ff8576b', b'1', 'SA', '2020-11-19 01:23:47'),
(19, 'bf2045c78bbf51e4ef44c4168a125bf1', b'1', 'SA', '2020-11-19 01:23:52'),
(20, '910df119eb612abf6801555ff8afbd8f', b'1', 'SA', '2020-11-19 01:35:52'),
(21, '810ced54c56c89bee525e184ce9231f6', b'1', 'SA', '2020-11-19 01:35:58'),
(22, 'aa8df88d9d3e15d2292efc7fe2e4ad84', b'1', 'SA', '2020-11-19 01:47:06'),
(23, '2e9afa7ae72288c00863790463be39d0', b'1', 'SA', '2020-11-19 01:49:20'),
(24, 'c8c4780ce968cc3ddab9a5b22a678857', b'1', 'SA', '2020-11-19 02:26:21'),
(25, '2fa9d459672e5159b2e1c2dbbfca4f65', b'1', 'SA', '2020-11-19 02:34:23'),
(26, '598dd152d32761b096323d0ab199c4ac', b'1', 'SA', '2020-11-19 02:57:09'),
(27, '71e38ef10a00201f0152423264ae1d04', b'1', 'SA', '2020-11-19 04:47:25'),
(28, '129391f82c9c53f7caa0a7d7c2c81e1f', b'1', 'SA', '2020-11-19 04:58:27'),
(29, 'e2656ca8ee408f8ae2e6540f524f973f', b'1', 'SA', '2020-11-19 05:01:12'),
(30, '8bd7090103f80fea107c77f4b0c9e0a1', b'1', 'SA', '2020-11-19 05:04:09'),
(31, '8578022c5742aa84a081e1f69c944593', b'1', 'SA', '2020-11-19 05:05:24'),
(32, '0', b'0', 'N/A', '2020-11-19 05:29:08'),
(33, '51f8fbb72f1b69bff674757e041f7ded', b'1', 'SA', '2020-11-19 05:36:28'),
(34, '9c40a4a00b7a0c297fc837b27673aecc', b'1', 'SA', '2020-11-19 05:42:26'),
(35, '277ad2a1e61a13ef4ce99e43e3db1763', b'1', 'SA', '2020-11-19 05:45:19'),
(36, '4b3e97af436ef0d583f2f881d0395fd5', b'1', 'SA', '2020-11-19 05:49:20'),
(37, '960ce397bffaf09d24a6d080fb1b465a', b'1', 'SA', '2020-11-19 05:51:40'),
(38, '9df551a3ac30783bdd36688d780c7260', b'1', 'SA', '2020-11-19 06:21:01'),
(39, '874e87eafed4eba3a850bd5ff2874683', b'1', 'SA', '2020-11-19 06:25:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segusuarios`
--

CREATE TABLE `segusuarios` (
  `idUsuario` varchar(50) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `HoraTiempo` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `segusuarios`
--

INSERT INTO `segusuarios` (`idUsuario`, `clave`, `rol`, `correo`, `HoraTiempo`) VALUES
('SA', '94fe67ddcba0c4f0d90e75894fa2dca2', 'admin', NULL, '2020-11-18 07:11:40');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cotcostos`
--
ALTER TABLE `cotcostos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `segtokens`
--
ALTER TABLE `segtokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `segusuarios`
--
ALTER TABLE `segusuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cotcostos`
--
ALTER TABLE `cotcostos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `segtokens`
--
ALTER TABLE `segtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
