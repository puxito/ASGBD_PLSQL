-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-02-2024 a las 07:43:24
-- Versión del servidor: 8.0.36-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresatecnicos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `idAlmacen` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `stockDisponible` int DEFAULT NULL,
  `cantidadMinima` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`idAlmacen`, `idProducto`, `stockDisponible`, `cantidadMinima`) VALUES
(1, 1, 2500, 1),
(2, 2, 1645, 1),
(3, 3, 2100, 1),
(4, 2, 185, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idUsuario` int NOT NULL,
  `idAlmacen` int DEFAULT NULL,
  `nombreUsuario` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `contraseña` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `incidenciasAsociadas` int DEFAULT NULL,
  `tareasAsociadas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `aplicacion`
--

INSERT INTO `aplicacion` (`idUsuario`, `idAlmacen`, `nombreUsuario`, `contraseña`, `email`, `incidenciasAsociadas`, `tareasAsociadas`) VALUES
(1, 1, 'ivanpuxito', 'Studium2022;', 'ivanrani2004@gmail.com', 5, 2),
(2, 2, 'ferquiroga', 'Sevilla99', 'ferquiroga99@gmail.com', 3, 6),
(3, 3, 'mariolorca02', 'usuario', 'mariolorca@gmail.com', 1, 9),
(4, 4, 'alanclue', 'clemente123', 'alansete@gmail.com', 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCliente`) VALUES
(1, 'Joaquín Sabina'),
(2, 'Julio Iglesias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `idContrato` int NOT NULL,
  `idCliente` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinalizacion` date DEFAULT NULL,
  `tipoContratoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`idContrato`, `idCliente`, `idEmpleado`, `fechaInicio`, `fechaFinalizacion`, `tipoContratoId`) VALUES
(1, 1, 1, '2024-02-01', '2025-02-07', 1),
(2, 2, 2, '2024-03-03', '2024-04-01', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombre`, `apellido`, `email`, `telefono`) VALUES
(1, 'Iván', 'Castañeda', 'ivanrani2004@gmail.com', '601304859'),
(2, 'Fernando', 'Quiroga', 'ferquiroga99@gmail.com', '654987321'),
(3, 'Mario', 'Lorca', 'mariolorca@gmail.com', '665428190'),
(4, 'Alan', 'Clemente', 'alansete@gmail.com', '774201286'),
(7, 'Francisco', 'Dona', 'donete@gmail.com', '69587321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int NOT NULL,
  `nombreproducto` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreproducto`) VALUES
(1, 'Teclado Logitech'),
(2, 'Ratón Logitech'),
(3, 'Auriculares Mars Gaming'),
(4, 'Monitor HP'),
(5, 'PC Sobremesa Fujitsu'),
(6, 'Cable HDMI 2 Metros'),
(7, 'Cable RJ 45'),
(8, 'Cable Corriente 1.8 Metros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicosredes`
--

CREATE TABLE `tecnicosredes` (
  `idTecnico` int NOT NULL,
  `experienciaRedes` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicossistemas`
--

CREATE TABLE `tecnicossistemas` (
  `idTecnico` int NOT NULL,
  `experienciaSistemas` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tecnicossistemas`
--

INSERT INTO `tecnicossistemas` (`idTecnico`, `experienciaSistemas`) VALUES
(3, '2 años y 1 mes'),
(4, '4 años y 4 meses');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicossoporte`
--

CREATE TABLE `tecnicossoporte` (
  `idTecnico` int NOT NULL,
  `experienciaSoporte` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tecnicossoporte`
--

INSERT INTO `tecnicossoporte` (`idTecnico`, `experienciaSoporte`) VALUES
(1, '3 años'),
(2, '2 años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcontratos`
--

CREATE TABLE `tiposcontratos` (
  `idTipoContrato` int NOT NULL,
  `descripcionTipoContrato` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `condicionesEspecificas` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tiposcontratos`
--

INSERT INTO `tiposcontratos` (`idTipoContrato`, `descripcionTipoContrato`, `duracion`, `condicionesEspecificas`) VALUES
(1, 'Subcontratación de empresa (ANUAL)', 1, 'Jornada completa de 8:00 a 14:00'),
(2, 'Contrato de instalación (Mensual)', 1, 'Jornada partida (9 a 13 y 16 a 19)');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`idAlmacen`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idAlmacen` (`idAlmacen`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`idContrato`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `tipoContratoId` (`tipoContratoId`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `tecnicosredes`
--
ALTER TABLE `tecnicosredes`
  ADD PRIMARY KEY (`idTecnico`);

--
-- Indices de la tabla `tecnicossistemas`
--
ALTER TABLE `tecnicossistemas`
  ADD PRIMARY KEY (`idTecnico`);

--
-- Indices de la tabla `tecnicossoporte`
--
ALTER TABLE `tecnicossoporte`
  ADD PRIMARY KEY (`idTecnico`);

--
-- Indices de la tabla `tiposcontratos`
--
ALTER TABLE `tiposcontratos`
  ADD PRIMARY KEY (`idTipoContrato`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_4` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_4` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contratos_ibfk_5` FOREIGN KEY (`tipoContratoId`) REFERENCES `tiposcontratos` (`idTipoContrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contratos_ibfk_6` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tecnicosredes`
--
ALTER TABLE `tecnicosredes`
  ADD CONSTRAINT `tecnicosredes_ibfk_1` FOREIGN KEY (`idTecnico`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tecnicossistemas`
--
ALTER TABLE `tecnicossistemas`
  ADD CONSTRAINT `tecnicossistemas_ibfk_1` FOREIGN KEY (`idTecnico`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tecnicossoporte`
--
ALTER TABLE `tecnicossoporte`
  ADD CONSTRAINT `tecnicossoporte_ibfk_2` FOREIGN KEY (`idTecnico`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
