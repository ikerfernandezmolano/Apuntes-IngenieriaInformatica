-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2025 a las 17:56:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa_ejemplo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depto`
--

CREATE TABLE `depto` (
  `NOMBRED` varchar(15) NOT NULL,
  `NUMEROD` int(11) NOT NULL,
  `NSS_JEFE` char(9) DEFAULT NULL,
  `FECHA_INIC_JEFE` date DEFAULT '2015-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depto`
--

INSERT INTO `depto` (`NOMBRED`, `NUMEROD`, `NSS_JEFE`, `FECHA_INIC_JEFE`) VALUES
('CALIDAD', 25, '123456789', '2025-02-27'),
('VENTAS', 35, NULL, '2015-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `NSS` char(9) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `SUELDO` decimal(10,2) DEFAULT NULL,
  `ND` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`NSS`, `NOMBRE`, `SUELDO`, `ND`) VALUES
('123456789', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `depto`
--
ALTER TABLE `depto`
  ADD PRIMARY KEY (`NUMEROD`),
  ADD UNIQUE KEY `NOMBRED` (`NOMBRED`),
  ADD KEY `NSS_JEFE` (`NSS_JEFE`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`NSS`),
  ADD KEY `ND` (`ND`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `depto`
--
ALTER TABLE `depto`
  ADD CONSTRAINT `depto_ibfk_1` FOREIGN KEY (`NSS_JEFE`) REFERENCES `empleado` (`NSS`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ND`) REFERENCES `depto` (`NUMEROD`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
