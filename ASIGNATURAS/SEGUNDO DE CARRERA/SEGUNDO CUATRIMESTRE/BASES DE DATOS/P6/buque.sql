-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2025 a las 18:48:40
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
-- Base de datos: `buque`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buque`
--

CREATE TABLE `buque` (
  `NOMBREBUQUE` varchar(20) NOT NULL,
  `DUENO` varchar(20) DEFAULT NULL,
  `TIPO` varchar(20) DEFAULT NULL,
  `NOMBREPUERTO` varchar(20) DEFAULT NULL,
  `NOMBREPAIS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `buque`
--

INSERT INTO `buque` (`NOMBREBUQUE`, `DUENO`, `TIPO`, `NOMBREPUERTO`, `NOMBREPAIS`) VALUES
('AndraMari', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopais`
--

CREATE TABLE `estadopais` (
  `NOMBREPAIS` varchar(20) NOT NULL,
  `CONTINENTE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadopais`
--

INSERT INTO `estadopais` (`NOMBREPAIS`, `CONTINENTE`) VALUES
('Espana', 'Europa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maroceanolago`
--

CREATE TABLE `maroceanolago` (
  `NOMBREMAR` varchar(20) NOT NULL,
  `PROFUNDIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientobuque`
--

CREATE TABLE `movimientobuque` (
  `NOMBREBUQUE` varchar(20) NOT NULL,
  `FECHAHORA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LONGITUD` int(11) DEFAULT NULL,
  `LATITUD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerto`
--

CREATE TABLE `puerto` (
  `NOMBREPUERTO` varchar(20) NOT NULL,
  `NOMBREPAIS` varchar(20) NOT NULL,
  `NOMBREMAR` varchar(20) DEFAULT NULL,
  `DESCRIP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puerto`
--

INSERT INTO `puerto` (`NOMBREPUERTO`, `NOMBREPAIS`, `NOMBREMAR`, `DESCRIP`) VALUES
('Santander', 'Espana', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipobuque`
--

CREATE TABLE `tipobuque` (
  `TIPO` varchar(20) NOT NULL,
  `TONELAJE` decimal(7,2) DEFAULT NULL,
  `CASCO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `NOMBREBUQUE` varchar(20) NOT NULL,
  `NOMBREPUERTO` varchar(20) NOT NULL,
  `NOMBREPAIS` varchar(20) NOT NULL,
  `FECHAINICIO` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FECHAFIN` timestamp NOT NULL DEFAULT '2025-02-26 23:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`NOMBREBUQUE`, `NOMBREPUERTO`, `NOMBREPAIS`, `FECHAINICIO`, `FECHAFIN`) VALUES
('AndraMari', 'Santander', 'Espana', '2020-11-21 23:00:00', '2020-11-23 09:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buque`
--
ALTER TABLE `buque`
  ADD PRIMARY KEY (`NOMBREBUQUE`),
  ADD KEY `TIPO` (`TIPO`),
  ADD KEY `NOMBREPUERTO` (`NOMBREPUERTO`,`NOMBREPAIS`);

--
-- Indices de la tabla `estadopais`
--
ALTER TABLE `estadopais`
  ADD PRIMARY KEY (`NOMBREPAIS`);

--
-- Indices de la tabla `maroceanolago`
--
ALTER TABLE `maroceanolago`
  ADD PRIMARY KEY (`NOMBREMAR`);

--
-- Indices de la tabla `movimientobuque`
--
ALTER TABLE `movimientobuque`
  ADD KEY `NOMBREBUQUE` (`NOMBREBUQUE`);

--
-- Indices de la tabla `puerto`
--
ALTER TABLE `puerto`
  ADD PRIMARY KEY (`NOMBREPUERTO`,`NOMBREPAIS`),
  ADD KEY `NOMBREMAR` (`NOMBREMAR`),
  ADD KEY `NOMBREPAIS` (`NOMBREPAIS`);

--
-- Indices de la tabla `tipobuque`
--
ALTER TABLE `tipobuque`
  ADD PRIMARY KEY (`TIPO`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`NOMBREBUQUE`,`NOMBREPUERTO`,`NOMBREPAIS`,`FECHAINICIO`),
  ADD KEY `NOMBREPUERTO` (`NOMBREPUERTO`,`NOMBREPAIS`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `buque`
--
ALTER TABLE `buque`
  ADD CONSTRAINT `buque_ibfk_1` FOREIGN KEY (`TIPO`) REFERENCES `tipobuque` (`TIPO`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `buque_ibfk_2` FOREIGN KEY (`NOMBREPUERTO`,`NOMBREPAIS`) REFERENCES `puerto` (`NOMBREPUERTO`, `NOMBREPAIS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buque_ibfk_3` FOREIGN KEY (`NOMBREPUERTO`,`NOMBREPAIS`) REFERENCES `puerto` (`NOMBREPUERTO`, `NOMBREPAIS`);

--
-- Filtros para la tabla `movimientobuque`
--
ALTER TABLE `movimientobuque`
  ADD CONSTRAINT `movimientobuque_ibfk_1` FOREIGN KEY (`NOMBREBUQUE`) REFERENCES `buque` (`NOMBREBUQUE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puerto`
--
ALTER TABLE `puerto`
  ADD CONSTRAINT `puerto_ibfk_1` FOREIGN KEY (`NOMBREMAR`) REFERENCES `maroceanolago` (`NOMBREMAR`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `puerto_ibfk_2` FOREIGN KEY (`NOMBREPAIS`) REFERENCES `estadopais` (`NOMBREPAIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`NOMBREBUQUE`) REFERENCES `buque` (`NOMBREBUQUE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`NOMBREPUERTO`,`NOMBREPAIS`) REFERENCES `puerto` (`NOMBREPUERTO`, `NOMBREPAIS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visita_ibfk_3` FOREIGN KEY (`NOMBREPUERTO`,`NOMBREPAIS`) REFERENCES `puerto` (`NOMBREPUERTO`, `NOMBREPAIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
