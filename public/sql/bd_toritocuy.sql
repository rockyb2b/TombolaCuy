-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2024 a las 17:23:00
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_toritocuy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apertura_caja`
--

CREATE TABLE `apertura_caja` (
  `idAperturaCaja` int(10) UNSIGNED NOT NULL,
  `idCaja` int(10) UNSIGNED DEFAULT NULL,
  `idTurno` int(10) UNSIGNED DEFAULT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaOperacion` date DEFAULT NULL,
  `fechaRegistro` datetime DEFAULT NULL,
  `fechaCierre` datetime DEFAULT NULL,
  `estado` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apuesta`
--

CREATE TABLE `apuesta` (
  `idApuesta` bigint(20) UNSIGNED NOT NULL,
  `idTicket` bigint(20) UNSIGNED DEFAULT NULL,
  `idTipoApuesta` int(10) UNSIGNED DEFAULT NULL,
  `idMoneda` int(10) UNSIGNED DEFAULT NULL,
  `montoApostado` decimal(18,2) DEFAULT NULL,
  `montoAPagar` decimal(18,2) DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL,
  `multiplicadorDefecto` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `apuesta`
--

INSERT INTO `apuesta` (`idApuesta`, `idTicket`, `idTipoApuesta`, `idMoneda`, `montoApostado`, `montoAPagar`, `ganador`, `multiplicadorDefecto`) VALUES
(820, 175, 5, 94, '12.00', '0.00', 0, '36'),
(821, 176, 17, 94, '1.00', '0.00', 0, '36'),
(822, 177, 11, 94, '1.00', '0.00', 0, '36'),
(823, 178, 11, 94, '3.00', '0.00', 0, '36'),
(824, 179, 2, 94, '10.00', '0.00', 0, '36'),
(825, 180, 11, 94, '1.00', '0.00', 0, '36'),
(826, 181, 10, 94, '1.00', '0.00', 0, '36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_nombre` varchar(150) COLLATE macroman_bin DEFAULT NULL,
  `permiso` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `controller` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `method` varchar(225) COLLATE macroman_bin DEFAULT NULL,
  `descripcion` varchar(225) COLLATE macroman_bin DEFAULT NULL,
  `data` text COLLATE macroman_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macroman COLLATE=macroman_bin;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id`, `fecha_registro`, `usuario_id`, `usuario_nombre`, `permiso`, `controller`, `method`, `descripcion`, `data`) VALUES
(2317, '2024-03-07 16:01:24', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2318, '2024-03-07 16:01:42', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2319, '2024-03-07 16:02:20', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2320, '2024-03-08 10:07:24', 1, NULL, 'VentanaCaja2', 'App\\Http\\Controllers\\VentaController@IndexNuevo', 'GET', NULL, '[]'),
(2321, '2024-03-08 10:14:01', 1, NULL, 'VentanaCaja2', 'App\\Http\\Controllers\\VentaController@IndexNuevo', 'GET', NULL, '[]'),
(2322, '2024-03-08 10:14:02', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2323, '2024-03-08 10:14:24', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2324, '2024-03-08 10:14:45', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2325, '2024-03-08 10:14:54', 1, NULL, 'JuegoListarVista', 'App\\Http\\Controllers\\JuegoController@JuegoListarVista', 'GET', NULL, '[]'),
(2326, '2024-03-08 10:14:56', 1, NULL, 'VentanaCaja2', 'App\\Http\\Controllers\\VentaController@IndexNuevo', 'GET', NULL, '[]'),
(2327, '2024-03-08 10:14:56', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2328, '2024-03-08 10:15:05', 1, NULL, 'DineroDefaultListar', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultListarVista', 'GET', NULL, '[]'),
(2329, '2024-03-08 10:15:10', 1, NULL, 'TurnoListar', 'App\\Http\\Controllers\\TurnoController@TurnoListarVista', 'GET', NULL, '[]'),
(2330, '2024-03-08 10:15:12', 1, NULL, 'EmpresaListar', 'App\\Http\\Controllers\\EmpresaController@EmpresaListarVista', 'GET', NULL, '[]'),
(2331, '2024-03-08 10:15:21', 1, NULL, 'TipoAlertaVista', 'App\\Http\\Controllers\\SeguridadController@TipoAlertaVista', 'GET', NULL, '[]'),
(2332, '2024-03-08 10:15:23', 1, NULL, 'Auditoria', 'App\\Http\\Controllers\\ReporteController@ReporteAuditoriaVista', 'GET', NULL, '[]'),
(2333, '2024-03-08 10:15:28', 1, NULL, 'UsuarioPuntoVenta', 'App\\Http\\Controllers\\UsuarioPuntoVentaController@UsuarioPuntoVentaListarVista', 'GET', NULL, '[]'),
(2334, '2024-03-08 10:15:38', 1, NULL, 'DineroDefaultListar', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultListarVista', 'GET', NULL, '[]'),
(2335, '2024-03-08 10:15:43', 1, NULL, 'TurnoListar', 'App\\Http\\Controllers\\TurnoController@TurnoListarVista', 'GET', NULL, '[]'),
(2336, '2024-03-08 10:15:48', 1, NULL, 'EmpresaListar', 'App\\Http\\Controllers\\EmpresaController@EmpresaListarVista', 'GET', NULL, '[]'),
(2337, '2024-03-08 10:15:50', 1, NULL, 'DineroDefaultListar', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultListarVista', 'GET', NULL, '[]'),
(2338, '2024-03-08 10:15:52', 1, NULL, 'ReportedeVentasVista', 'App\\Http\\Controllers\\ReporteController@ReporteApuestaVista', 'GET', NULL, '[]'),
(2339, '2024-03-08 10:16:00', 1, NULL, 'PuntoVentaListar', 'App\\Http\\Controllers\\PuntoVentaController@PuntoVentaListarVista', 'GET', NULL, '[]'),
(2340, '2024-03-08 10:16:24', 1, NULL, 'DineroDefaultListar', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultListarVista', 'GET', NULL, '[]'),
(2341, '2024-03-12 11:24:36', 1, NULL, 'VentanaCaja2', 'App\\Http\\Controllers\\VentaController@IndexNuevo', 'GET', NULL, '[]'),
(2342, '2024-03-12 11:24:37', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]'),
(2343, '2024-03-12 15:24:09', 1, NULL, 'VentanaCaja2', 'App\\Http\\Controllers\\VentaController@IndexNuevo', 'GET', NULL, '[]'),
(2344, '2024-03-12 15:24:10', 1, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '[]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `idCaja` int(10) UNSIGNED NOT NULL,
  `idPuntoVenta` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_general`
--

CREATE TABLE `configuracion_general` (
  `idConfiguracion` int(11) NOT NULL,
  `HoraInicioIntervalo` time DEFAULT NULL,
  `HoraFinIntervalo` time DEFAULT NULL,
  `CobrarTicket` tinyint(4) DEFAULT NULL,
  `CuentaCorreo` text DEFAULT NULL,
  `PasswordCorreo` text DEFAULT NULL,
  `Encriptacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `configuracion_general`
--

INSERT INTO `configuracion_general` (`idConfiguracion`, `HoraInicioIntervalo`, `HoraFinIntervalo`, `CobrarTicket`, `CuentaCorreo`, `PasswordCorreo`, `Encriptacion`) VALUES
(1, '08:00:00', '23:00:00', 0, 'AdmiWebOnline@gmail.com', 'qwertyytrewq', 'tls');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_punto_venta_tipo_alerta`
--

CREATE TABLE `detalle_punto_venta_tipo_alerta` (
  `idDetallePuntoVentaTipoAlerta` int(11) NOT NULL,
  `idPuntoVentaTipoAlerta` int(11) DEFAULT NULL,
  `correoDestino` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_punto_venta_tipo_alerta`
--

INSERT INTO `detalle_punto_venta_tipo_alerta` (`idDetallePuntoVentaTipoAlerta`, `idPuntoVentaTipoAlerta`, `correoDestino`, `estado`) VALUES
(3, 3, 'freditocarbonel@gmail.com', 1),
(4, 4, 'freditocarbonel@gmail.com', 1),
(5, 5, 'freditocarbonel@gmail.com', 1),
(6, 6, 'demo@gmail.com', 1),
(7, 7, 'freditocarbonel@gmail.com', 1),
(8, 8, 'freditocarbonel@gmail.com', 1),
(9, 9, 'freditocarbonel@gmail.com', 1),
(10, 10, 'christianrogerpm@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dinero_default`
--

CREATE TABLE `dinero_default` (
  `idDineroDefault` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;

--
-- Volcado de datos para la tabla `dinero_default`
--

INSERT INTO `dinero_default` (`idDineroDefault`, `monto`, `estado`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 1),
(4, 5, 1),
(5, 10, 1),
(6, 20, 1),
(7, 50, 1),
(8, 100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(10) UNSIGNED NOT NULL,
  `razonSocial` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` bigint(20) UNSIGNED NOT NULL,
  `idJuego` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaEvento` datetime DEFAULT NULL,
  `fechaFinEvento` datetime DEFAULT NULL,
  `apuestaMinima` decimal(18,2) DEFAULT NULL,
  `apuestaMaxima` decimal(18,2) DEFAULT NULL,
  `fechaEventoReprogramacion` datetime DEFAULT NULL,
  `idMoneda` int(11) UNSIGNED NOT NULL,
  `estadoEvento` int(11) DEFAULT NULL COMMENT '0=Anulado\r\n1=Ejecucion\r\n2=Terminado\r\n3=PendPago\r\n4=Pagado\r\n5=Suspendido',
  `estadoAnimacion` int(11) DEFAULT NULL,
  `tokenAnimacion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puntosCuy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessionToken` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playerID` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gameID` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `idJuego`, `nombre`, `fechaEvento`, `fechaFinEvento`, `apuestaMinima`, `apuestaMaxima`, `fechaEventoReprogramacion`, `idMoneda`, `estadoEvento`, `estadoAnimacion`, `tokenAnimacion`, `puntosCuy`, `sessionToken`, `playerID`, `gameID`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cuy', '2024-03-11 11:25:35', '2024-03-11 11:26:11', '1.00', '2000.00', NULL, 94, 2, 0, 'S0CWpA1m', '[{\"x\":-1.17,\"y\":0,\"z\":0.31,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.89,\"y\":0,\"z\":0.62,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.57,\"y\":0,\"z\":1.13,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.93,\"y\":0,\"z\":-0.62,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-1.08,\"y\":0,\"z\":-2.15,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.06,\"y\":0,\"z\":-1.59,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.8,\"y\":0,\"z\":1.91,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":1.57,\"y\":0,\"z\":2.12,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":1.89,\"y\":0,\"z\":-0.35,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.65,\"y\":0,\"z\":-1.55,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":1.76,\"y\":0,\"z\":0.18,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.14,\"y\":0,\"z\":-1.41,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-1.11,\"y\":0,\"z\":-1.7,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-1.61,\"y\":0,\"z\":-0.89,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":1.94,\"y\":0,\"z\":-0.83,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.17,\"y\":0,\"z\":1.5,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-0.76,\"y\":0,\"z\":-1.38,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.37,\"y\":0,\"z\":-1.79,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.89,\"y\":0,\"z\":-0.67,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-1.9,\"y\":0,\"z\":0.75,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":1.66,\"y\":0,\"z\":1.63,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-1.15,\"y\":0,\"z\":1.38,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-2.33,\"y\":0,\"z\":-0.74,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":0.27,\"y\":0,\"z\":0.34,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.74,\"y\":0,\"z\":-1.1,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.99,\"y\":0,\"z\":2.26,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.6,\"y\":0,\"z\":-1.15,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-0.35,\"y\":0,\"z\":-0.21,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-0.6,\"y\":0,\"z\":0.07,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.16,\"y\":0,\"z\":-1.44,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.04,\"y\":0,\"z\":-0.15,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.65,\"y\":0,\"z\":-2,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-0.84,\"y\":0,\"z\":-0.87,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.74,\"y\":0,\"z\":-1.49,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":1.2,\"y\":0,\"z\":-0.92,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.36,\"y\":0,\"z\":1.21,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.83,\"y\":0,\"z\":0.34,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-1.52,\"y\":0,\"z\":-1.45,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":2.09,\"y\":0,\"z\":-1.25,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":0.09,\"y\":0,\"z\":-1.44,\"rotarono\":false,\"mostrar_cuydudando\":false}]', '1', '2', '3', '2024-03-11 11:14:52', '2024-03-11 11:14:52'),
(2, 1, 'Cuy', '2024-03-12 12:39:52', '2024-03-12 12:40:28', '1.00', '2000.00', NULL, 94, 1, 0, 'XMaX78qS', '[{\"x\":-0.05,\"y\":0,\"z\":-2.16,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-0.31,\"y\":0,\"z\":-2.14,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-0.57,\"y\":0,\"z\":-0.43,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.34,\"y\":0,\"z\":-1.55,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-1.22,\"y\":0,\"z\":1.87,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.46,\"y\":0,\"z\":-1.68,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-2.23,\"y\":0,\"z\":-1.89,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-0.61,\"y\":0,\"z\":-0.78,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":0.31,\"y\":0,\"z\":-0.08,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.63,\"y\":0,\"z\":-1.65,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":2.29,\"y\":0,\"z\":1.04,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.17,\"y\":0,\"z\":-0.52,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.84,\"y\":0,\"z\":0.1,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.78,\"y\":0,\"z\":-1.66,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-0.04,\"y\":0,\"z\":1.63,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.42,\"y\":0,\"z\":-0.2,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.68,\"y\":0,\"z\":-1.5,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-1.16,\"y\":0,\"z\":-0.35,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-1.63,\"y\":0,\"z\":-1.5,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.68,\"y\":0,\"z\":1,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.46,\"y\":0,\"z\":-1.6,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.99,\"y\":0,\"z\":-0.19,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.02,\"y\":0,\"z\":-0.76,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.38,\"y\":0,\"z\":-1.41,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.31,\"y\":0,\"z\":1.18,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":2,\"y\":0,\"z\":0.96,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.63,\"y\":0,\"z\":-0.15,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.91,\"y\":0,\"z\":-0.32,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":2.17,\"y\":0,\"z\":0.7,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":0.42,\"y\":0,\"z\":0.7,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.95,\"y\":0,\"z\":-1.16,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":1.36,\"y\":0,\"z\":-0.61,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.83,\"y\":0,\"z\":-1.13,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-0.85,\"y\":0,\"z\":0.18,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":2.3,\"y\":0,\"z\":1.82,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-1.38,\"y\":0,\"z\":0.84,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-0.9,\"y\":0,\"z\":-0.71,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.61,\"y\":0,\"z\":-0.07,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":0.47,\"y\":0,\"z\":0.17,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":1.15,\"y\":0,\"z\":-0.63,\"rotarono\":false,\"mostrar_cuydudando\":true}]', '1', '2', '3', '2024-03-11 11:26:27', '2024-03-11 11:26:27'),
(3, 1, 'Cuy', '2024-03-13 00:54:52', '2024-03-13 00:55:28', '1.00', '2000.00', NULL, 94, 1, 0, 'fkNxedlA', '[{\"x\":-1.62,\"y\":0,\"z\":-0.57,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.13,\"y\":0,\"z\":-0.54,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.55,\"y\":0,\"z\":-0.52,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.45,\"y\":0,\"z\":-0.68,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-0.94,\"y\":0,\"z\":2.32,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.26,\"y\":0,\"z\":1.23,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-1.38,\"y\":0,\"z\":-0.03,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.93,\"y\":0,\"z\":-1.25,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.12,\"y\":0,\"z\":2.21,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.27,\"y\":0,\"z\":-0.41,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-2.26,\"y\":0,\"z\":0.96,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.84,\"y\":0,\"z\":1.19,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.51,\"y\":0,\"z\":-1.52,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-2.01,\"y\":0,\"z\":-1.47,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":-2.02,\"y\":0,\"z\":-0.93,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.4,\"y\":0,\"z\":-0.17,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":1.28,\"y\":0,\"z\":-1.76,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-0.09,\"y\":0,\"z\":-1.62,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-1.95,\"y\":0,\"z\":1.32,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.96,\"y\":0,\"z\":-0.12,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.56,\"y\":0,\"z\":-2.17,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":1.92,\"y\":0,\"z\":-1.74,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":1.93,\"y\":0,\"z\":2.05,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.02,\"y\":0,\"z\":0.08,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-0.2,\"y\":0,\"z\":-1.19,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":2.04,\"y\":0,\"z\":-1.3,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":0.68,\"y\":0,\"z\":0.65,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":-0.25,\"y\":0,\"z\":0.99,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.52,\"y\":0,\"z\":-2.12,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":0.51,\"y\":0,\"z\":-1.21,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":2.15,\"y\":0,\"z\":0.16,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.88,\"y\":0,\"z\":-2.07,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":1.24,\"y\":0,\"z\":0.24,\"rotarono\":true,\"mostrar_cuydudando\":true},{\"x\":0.68,\"y\":0,\"z\":1.17,\"rotarono\":false,\"mostrar_cuydudando\":false},{\"x\":0.8,\"y\":0,\"z\":-0.59,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":0.97,\"y\":0,\"z\":-0.05,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":-1.28,\"y\":0,\"z\":0.59,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":-1.19,\"y\":0,\"z\":1.3,\"rotarono\":false,\"mostrar_cuydudando\":true},{\"x\":0.46,\"y\":0,\"z\":0.64,\"rotarono\":true,\"mostrar_cuydudando\":false},{\"x\":1.15,\"y\":0,\"z\":0.84,\"rotarono\":false,\"mostrar_cuydudando\":true}]', '1', '3', '3', '2024-03-12 17:16:37', '2024-03-12 17:16:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganador_evento`
--

CREATE TABLE `ganador_evento` (
  `idGanadorEvento` int(10) UNSIGNED NOT NULL,
  `idApuesta` bigint(20) UNSIGNED DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `montoAPagar` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serieComprobante` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nroComprobante` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_alerta`
--

CREATE TABLE `historial_alerta` (
  `idHistorialAlerta` int(11) NOT NULL,
  `idPuntoVentaTipoAlerta` int(11) DEFAULT NULL,
  `fechaAlerta` datetime DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `correos_envio` varchar(255) DEFAULT NULL,
  `estado_envio` tinyint(1) DEFAULT NULL,
  `asunto` varchar(255) DEFAULT NULL,
  `mensaje` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial_alerta`
--

INSERT INTO `historial_alerta` (`idHistorialAlerta`, `idPuntoVentaTipoAlerta`, `fechaAlerta`, `monto`, `correos_envio`, `estado_envio`, `asunto`, `mensaje`) VALUES
(1, 5, '2019-05-16 12:55:02', '4704.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: EL GOLF', 'EL PUNTO DE VENTA EL GOLF LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(2, 7, '2019-05-16 13:09:23', '1940.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: MOYOBAMBA 01', 'EL PUNTO DE VENTA MOYOBAMBA 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(3, 8, '2019-05-16 13:13:47', '3000.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: VILLA EL SALVADOR', 'EL PUNTO DE VENTA VILLA EL SALVADOR LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(4, 7, '2019-05-17 10:00:42', '2140.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: MOYOBAMBA 01', 'EL PUNTO DE VENTA MOYOBAMBA 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(5, 4, '2019-05-17 11:42:31', '2400.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: AT SANTA BARBARA', 'EL PUNTO DE VENTA AT SANTA BARBARA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(6, 5, '2019-05-17 11:43:03', '2400.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: EL GOLF', 'EL PUNTO DE VENTA EL GOLF LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(7, 9, '2019-05-17 11:55:22', '600.00', 'freditocarbonel@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: GRIFO PECSA', 'EL PUNTO DE VENTA GRIFO PECSA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),
(8, 10, '2019-05-23 15:01:47', '1400.00', 'christianrogerpm@gmail.com', 1, 'MONTO MAXIMO VENTA PUNTO VENTA: AT LOCAL MERPROLIMA', 'EL PUNTO DE VENTA AT LOCAL MERPROLIMA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `idJuego` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lapsoProxEventoHoras` int(11) DEFAULT NULL,
  `lapsoProxEventoDia` int(11) DEFAULT NULL,
  `lapsoProxEventoMinutos` int(11) DEFAULT NULL,
  `apuestaMinima` decimal(18,2) DEFAULT NULL,
  `apuestaMaxima` decimal(18,2) DEFAULT NULL,
  `segBloqueoAntesEvento` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `diasVigentesCobroTicket` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `segBloqueoAntesAnimacion` int(11) NOT NULL,
  `segCajaGirando` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`idJuego`, `nombre`, `logo`, `lapsoProxEventoHoras`, `lapsoProxEventoDia`, `lapsoProxEventoMinutos`, `apuestaMinima`, `apuestaMaxima`, `segBloqueoAntesEvento`, `idMoneda`, `diasVigentesCobroTicket`, `estado`, `segBloqueoAntesAnimacion`, `segCajaGirando`) VALUES
(1, 'Cuy', 'icontombola.png', 0, 0, 2, '1.00', '2000.00', 10, 94, 3, 1, 30, 10),
(3, 'Cuy2', 'cuy.png', 0, 0, 2, '1.00', '1000.00', 10, 94, 3, 0, 30, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(441, '2014_10_12_000000_create_users_table', 1),
(442, '2014_10_12_100000_create_password_resets_table', 1),
(443, '2019_01_16_152206_create_empresa_table', 1),
(444, '2019_01_16_183845_create_punto_venta_table', 1),
(445, '2019_01_16_183930_create_ubigeo_table', 1),
(446, '2019_01_18_200749_create_apertura_caja_table', 1),
(447, '2019_01_18_200809_create_apuesta_table', 1),
(448, '2019_01_18_200825_create_caja_table', 1),
(449, '2019_01_18_200842_create_cliente_table', 1),
(450, '2019_01_18_200908_create_configuracion_evento_table', 1),
(451, '2019_01_18_200934_create_configuracion_jackpot_table', 1),
(452, '2019_01_18_200953_create_configuracion_pozo_table', 1),
(453, '2019_01_18_201019_create_detalle_evento_table', 1),
(454, '2019_01_18_201043_create_evento_table', 1),
(455, '2019_01_18_201108_create_ganador_evento_table', 1),
(456, '2019_01_18_201129_create_jackpot_table', 1),
(457, '2019_01_18_201148_create_moneda_table', 1),
(458, '2019_01_18_201236_create_pozo_jackpot_table', 1),
(459, '2019_01_18_201253_create_pozo_online_table', 1),
(460, '2019_01_18_201311_create_ticket_table', 1),
(461, '2019_01_18_201333_create_tipo_apuesta_table', 1),
(462, '2019_01_18_201356_create_tipo_pago_table', 1),
(463, '2019_01_18_201412_create_turno_table', 1),
(464, '2019_01_22_093627_create_jackpot_punto_venta_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `idMoneda` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `simbolo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codlso` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `principal` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`idMoneda`, `nombre`, `simbolo`, `codlso`, `principal`, `estado`) VALUES
(1, 'Dólar australiano', '$', 'AUD', 0, 1),
(2, 'Lek albanés', 'ALL', 'ALL', 0, 1),
(3, 'Dinar argelino', 'NA', 'DZD', 0, 1),
(4, 'Peso argentino', '$', 'ARS', 0, 1),
(5, 'Florín arubeño', '?', 'AWG', 0, 1),
(6, 'Libra esterlina', '£', 'GBP', 0, 1),
(7, 'Dólar de las Bahamas', 'B$', 'BSD', 0, 1),
(8, 'Dinar de Bahréin', 'NA', 'BHD', 0, 1),
(9, 'Taka de Bangladesh', 'Tk', 'BDT', 0, 1),
(10, 'Dólar de Barbados', 'BBD', 'BBD', 0, 1),
(11, 'Rublo bielorruso', 'Br', 'BYR', 0, 1),
(12, 'Dólar de Belice', 'BZ$', 'BZD', 0, 1),
(13, 'Dólar de Bermudas', 'BD$', 'BMD', 0, 1),
(14, 'Ngultrum de Bhutan', 'Nu.', 'BTN', 0, 1),
(15, 'Boliviano', 'Bs', 'BOB', 0, 1),
(16, 'Pula de Botsuana', 'P', 'BWP', 0, 1),
(17, 'Real brasileño', 'R$', 'BRL', 0, 1),
(18, 'Dólar de Brunéi', 'B$', 'BND', 0, 1),
(19, 'Lev búlgaro', 'NA', 'BGN', 0, 1),
(20, 'Franco burundí', 'FBu', 'BIF', 0, 1),
(21, 'Dólar canadiense', 'C$', 'CAD', 0, 1),
(22, 'Yuan chino', '¥', 'CNY', 0, 1),
(23, 'Riel camboyano', 'KHR', 'KHR', 0, 1),
(24, 'Escudo caboverdiano', 'Esc', 'CVE', 0, 1),
(25, 'Dólar de las Islas Caimán', '$', 'KYD', 0, 1),
(26, 'Franco CFA (BCEAO)', 'BCEAO', 'XOF', 0, 1),
(27, 'Franco CFA (BEAC)', 'BEAC', 'XAF', 0, 1),
(28, 'Peso chileno', '$', 'CLP', 0, 1),
(29, 'Peso colombiano', '$', 'COP', 0, 1),
(30, 'Franco comorano', 'KMF', 'KMF', 0, 1),
(31, 'Colón costarricense', 'NA', 'CRC', 0, 1),
(32, 'Kuna croata', 'kn', 'HRK', 0, 1),
(33, 'Peso cubano', '$MN', 'CUP', 0, 1),
(34, 'Corona checa', 'NA', 'CZK', 0, 1),
(35, 'Corona danesa', 'kr', 'DKK', 0, 1),
(36, 'Franco yibutiano', 'Fdj', 'DJF', 0, 1),
(37, 'Peso dominicano', 'RD$', 'DOP', 0, 1),
(38, 'Euro', '?', 'EUR', 0, 1),
(39, 'Dólar del Caribe Oriental', 'EC$', 'XCD', 0, 1),
(40, 'Libra egipcia', 'NA', 'EGP', 0, 1),
(41, 'El Colon del Salvador', 'NA', 'SVC', 0, 1),
(42, 'Corona estonia', 'EEK', 'EEK', 0, 1),
(43, 'Birr etíope', 'Br', 'ETB', 0, 1),
(44, 'Libra malvinense', '£', 'FKP', 0, 1),
(45, 'Dólar de Fiji', 'FJ$', 'FJD', 0, 1),
(46, 'Dalasi gambiano', 'D', 'GMD', 0, 1),
(47, 'Quetzal de Guatemala', 'Q', 'GTQ', 0, 1),
(48, 'Franco guineano', 'FG', 'GNF', 0, 1),
(49, 'Dólar guyanés', 'GY$', 'GYD', 0, 1),
(50, 'Cedi ghanes', 'GHS', 'GHS', 0, 1),
(51, 'Dólar de Hong Kong', 'HK$', 'HKD', 0, 1),
(52, 'Gourde haitiano', '', 'HTG', 0, 1),
(53, 'Lempira hondureña', 'L', 'HNL', 0, 1),
(54, 'Florín húngaro', 'Ft', 'HUF', 0, 1),
(55, 'Rupia indonesia', 'Rp', 'IDR', 0, 1),
(56, 'Rupia india', 'Rs.', 'INR', 0, 1),
(57, 'Corona islandesa', 'kr', 'ISK', 0, 1),
(58, 'Rial iraní', '', 'IRR', 0, 1),
(59, 'Dinar iraquí', 'NA', 'IQD', 0, 1),
(60, 'Shekel israelí', 'NA', 'ILS', 0, 1),
(61, 'Yen japonés', '¥', 'JPY', 0, 1),
(62, 'Dinar jordano', 'JOD', 'JOD', 0, 1),
(63, 'Tenge kazako', 'KZT', 'KZT', 0, 1),
(64, 'Chelín keniano', 'KSh', 'KES', 0, 1),
(65, 'Won coreano', 'NA', 'KRW', 0, 1),
(66, 'Dinar kuwaití', 'NA', 'KWD', 0, 1),
(67, 'Kirguistán Som', 'KGS', 'KGS', 0, 1),
(68, 'Pataca de Macao', '$', 'MOP', 0, 1),
(69, 'Dinar macedonio', 'MKD', 'MKD', 0, 1),
(70, 'Kwacha malawiano', 'MK', 'MWK', 0, 1),
(71, 'Ringgit malayo', 'RM', 'MYR', 0, 1),
(72, 'Rupia de Maldivas', 'Rf', 'MVR', 0, 1),
(73, 'Ouguiya de Mauritania', 'UM', 'MRO', 0, 1),
(74, 'Rupia mauricia', 'NA', 'MUR', 0, 1),
(75, 'Peso mexicano', '$', 'MXN', 0, 1),
(76, 'Leu moldavo', 'MDL', 'MDL', 0, 1),
(77, 'Tugrik mongol', 'NA', 'MNT', 0, 1),
(78, 'Dirham marroquí', 'NA', 'MAD', 0, 1),
(79, 'Kyat de Myanmar', 'K', 'MMK', 0, 1),
(80, 'Dólar de Namibia', 'N$', 'NAD', 0, 1),
(81, 'Rupia nepalí', 'NA', 'NPR', 0, 1),
(82, 'Guilder antillano', 'NA?', 'ANG', 0, 1),
(83, 'Dólar neozelandés', '$', 'NZD', 0, 1),
(84, 'Córdoba nicaragüense', 'C$', 'NIO', 0, 1),
(85, 'Naira nigeriano', 'NA', 'NGN', 0, 1),
(86, 'Won de Corea del Norte', 'NA', 'KPW', 0, 1),
(87, 'Corona noruega', 'kr', 'NOK', 0, 1),
(88, 'Rial omaní', 'NA', 'OMR', 0, 1),
(89, 'Franco CFP', 'F', 'XPF', 0, 1),
(90, 'Rupia pakistaní', 'Rs.', 'PKR', 0, 1),
(91, 'Balboa panameño', 'B', 'PAB', 0, 1),
(92, 'Kina de Papúa Nueva Guinea', 'K', 'PGK', 0, 1),
(93, 'Guaraní paraguayo', '', 'PYG', 0, 1),
(94, 'Nuevo Sol peruano', 'S/', 'PEN', 2, 1),
(95, 'Peso filipino', 'NA', 'PHP', 0, 1),
(96, 'Zloty polaco', 'NA', 'PLN', 0, 1),
(97, 'Riyal Qatarí', 'NA', 'QAR', 0, 1),
(98, 'Leu rumano', 'L', 'RON', 0, 1),
(99, 'Rublo ruso', 'NA', 'RUB', 0, 1),
(100, 'Franco ruandés', 'RF', 'RWF', 0, 1),
(101, 'Franco suizo', 'CHF', 'CHF', 0, 1),
(102, 'Tala de Samoa', 'WS$', 'WST', 0, 1),
(103, 'Dobra de Santo Tomé', 'Db', 'STD', 0, 1),
(104, 'Riyal saudí', 'NA', 'SAR', 0, 1),
(105, 'Rupia de Seychelles', 'SR', 'SCR', 0, 1),
(106, 'Leone de Sierra Leona', 'Le', 'SLL', 0, 1),
(107, 'Dólar de Singapur', 'S$', 'SGD', 0, 1),
(108, 'Corona eslovaca', 'Sk', 'SKK', 0, 1),
(109, 'Dólar de las Islas Salomón', 'SI$', 'SBD', 0, 1),
(110, 'Chelín somalí', 'So.', 'SOS', 0, 1),
(111, 'Rand sudafricano', 'R', 'ZAR', 0, 1),
(112, 'Rupia de Sri Lanka', 'NA', 'LKR', 0, 1),
(113, 'Libra de Santa Helena', '£', 'SHP', 0, 1),
(114, 'Libra sudanesa', 'SDG', 'SDG', 0, 1),
(115, 'Lilangeni de Suazilandia', 'SZL', 'SZL', 0, 1),
(116, 'Corona sueca', 'kr', 'SEK', 0, 1),
(117, 'Libra siria', 'SYP', 'SYP', 0, 1),
(118, 'Baht tailandés', 'NA', 'THB', 0, 1),
(119, 'Lira turca', 'YTL', 'TRY', 0, 1),
(120, 'Dólar taiwanés', 'NT$', 'TWD', 0, 1),
(121, 'Chelín tanzano', 'x', 'TZS', 0, 1),
(122, 'Pa\'anga del Reino de Tonga', 'T$', 'TOP', 0, 1),
(123, 'Dólar de Trinidad y Tobago', 'TTD', 'TTD', 0, 1),
(124, 'Dinar tunecino', 'NA', 'TND', 0, 1),
(125, 'Dólar estadounidense', '$', 'USD', 1, 1),
(126, 'Dirham de Emiratos Arabes Unidos', 'NA', 'AED', 0, 1),
(127, 'Chelín ugandés', 'USh', 'UGX', 0, 1),
(128, 'Grivnia de Ucrania', '', 'UAH', 0, 1),
(129, 'Peso uruguayo', 'UYU', 'UYU', 0, 1),
(130, 'Uzbekistán Sum', 'UZS', 'UZS', 0, 1),
(131, 'Vatu de Vanuatu', 'Vt', 'VUV', 0, 1),
(132, 'Dong de Vietnam', 'NA', 'VND', 0, 1),
(133, 'Bolívar venezolano', 'VEF', 'VEF', 0, 1),
(134, 'Rial yemení', 'YER', 'YER', 0, 1),
(135, 'Kwacha zambiano', 'ZMK', 'ZMK', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL COMMENT '0:menu,1:permiso',
  `nombre` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `controller` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `method` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `descripcion` varchar(450) COLLATE macroman_bin DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macroman COLLATE=macroman_bin;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `tipo`, `nombre`, `controller`, `method`, `descripcion`, `fecha_registro`, `estado`) VALUES
(1, NULL, 'Dashboard', 'App\\Http\\Controllers\\HomeController@DashboardVista', 'GET', NULL, '2019-04-25 17:56:07', 1),
(2, NULL, 'EmpresaListar', 'App\\Http\\Controllers\\EmpresaController@EmpresaListarVista', 'GET', NULL, '2019-04-25 17:56:07', 1),
(3, NULL, 'EmpresaInsertar', 'App\\Http\\Controllers\\EmpresaController@EmpresaInsertarVista', 'GET', NULL, '2019-04-25 17:56:07', 1),
(4, NULL, 'EmpresaEditar/{idEmpresa}', 'App\\Http\\Controllers\\EmpresaController@EmpresaEditarVista', 'GET', NULL, '2019-04-25 17:56:07', 1),
(5, NULL, 'EmpresaInsertarJson', 'App\\Http\\Controllers\\EmpresaController@EmpresaInsertarJson', 'POST', NULL, '2019-04-25 17:56:07', 1),
(6, NULL, 'EmpresaEditarJson', 'App\\Http\\Controllers\\EmpresaController@EmpresaEditarJson', 'POST', NULL, '2019-04-25 17:56:07', 1),
(7, NULL, 'PuntoVentaListar', 'App\\Http\\Controllers\\PuntoVentaController@PuntoVentaListarVista', 'GET', NULL, '2019-04-25 17:56:07', 1),
(8, NULL, 'PuntoVentaEditar/{idPuntoVenta}', 'App\\Http\\Controllers\\PuntoVentaController@PuntoVentaEditarVista', 'GET', NULL, '2019-04-25 17:56:07', 1),
(9, NULL, 'PuntoVentaEditarJson', 'App\\Http\\Controllers\\PuntoVentaController@PuntoVentaEditarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(10, NULL, 'JackpotListar', 'App\\Http\\Controllers\\JackpotController@JackpotListarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(11, NULL, 'JackpotInsertar', 'App\\Http\\Controllers\\JackpotController@JackpotInsertarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(12, NULL, 'JackpotEditar/{idJackpot}', 'App\\Http\\Controllers\\JackpotController@JackpotEditarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(13, NULL, 'VentanaCaja', 'App\\Http\\Controllers\\VentaController@Index', 'GET', NULL, '2019-04-25 17:56:08', 1),
(14, NULL, 'VentanaCaja2', 'App\\Http\\Controllers\\VentaController@IndexNuevo', 'GET', NULL, '2019-04-25 17:56:08', 1),
(15, NULL, 'ConfiguracionJackpotListar', 'App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotListarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(16, NULL, 'ConfiguracionJackpotInsertar', 'App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotInsertarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(17, NULL, 'ConfiguracionJackpotEditar/{idConfiguracionJackpot}', 'App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotEditarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(18, NULL, 'ConfiguracionJackpotInsertarJson', 'App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotInsertarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(19, NULL, 'ConfiguracionJackpotEditarJson', 'App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotEditarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(20, NULL, 'CajaListar', 'App\\Http\\Controllers\\CajaController@CajaListarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(21, NULL, 'CajaInsertar', 'App\\Http\\Controllers\\CajaController@CajaInsertarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(22, NULL, 'CajaEditar/{idCaja}', 'App\\Http\\Controllers\\CajaController@CajaEditarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(23, NULL, 'CajaInsertarJson', 'App\\Http\\Controllers\\CajaController@CajaInsertarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(24, NULL, 'CajaEditarJson', 'App\\Http\\Controllers\\CajaController@CajaEditarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(25, NULL, 'AperturaCajaListar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaListarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(26, NULL, 'AperturaCajaInsertar', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(27, NULL, 'AperturaCajaEditar/{idAperturaCaja}', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaEditarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(28, NULL, 'AperturaCajaInsertarJson', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(29, NULL, 'AperturaCajaEditarJson', 'App\\Http\\Controllers\\AperturaCajaController@AperturaCajaEditarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(30, NULL, 'AperturaRevisarJson', 'App\\Http\\Controllers\\AperturaCajaController@AperturaRevisarJson', 'POST', NULL, '2019-04-25 17:56:08', 1),
(31, NULL, 'TurnoListar', 'App\\Http\\Controllers\\TurnoController@TurnoListarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(32, NULL, 'TurnoInsertar', 'App\\Http\\Controllers\\TurnoController@TurnoInsertarVista', 'GET', NULL, '2019-04-25 17:56:08', 1),
(33, NULL, 'TurnoEditar/{idTurno}', 'App\\Http\\Controllers\\TurnoController@TurnoEditarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(34, NULL, 'TurnoInsertarJson', 'App\\Http\\Controllers\\TurnoController@TurnoInsertarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(35, NULL, 'TurnoEditarJson', 'App\\Http\\Controllers\\TurnoController@TurnoEditarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(36, NULL, 'DineroDefaultListar', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultListarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(37, NULL, 'DineroDefaultInsertar', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultInsertarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(38, NULL, 'DineroDefaultEditar/{idDineroDefault}', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultEditarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(39, NULL, 'DineroDefaultInsertarJson', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultInsertarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(40, NULL, 'DineroDefaultEditarJson', 'App\\Http\\Controllers\\DineroDefaultController@DineroDefaultEditarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(41, NULL, 'TipoPagoListar', 'App\\Http\\Controllers\\TipoPagoController@TipoPagoListarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(42, NULL, 'TipoPagoInsertar', 'App\\Http\\Controllers\\TipoPagoController@TipoPagoInsertarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(43, NULL, 'TipoPagoEditar/{idTipoPago}', 'App\\Http\\Controllers\\TipoPagoController@TipoPagoEditarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(44, NULL, 'TipoPagoInsertarJson', 'App\\Http\\Controllers\\TipoPagoController@TipoPagoInsertarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(45, NULL, 'TipoPagoEditarJson', 'App\\Http\\Controllers\\TipoPagoController@TipoPagoEditarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(46, NULL, 'TipoApuestaListar', 'App\\Http\\Controllers\\TipoApuestaController@TipoApuestaListarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(47, NULL, 'TipoApuestaInsertar', 'App\\Http\\Controllers\\TipoApuestaController@TipoApuestaInsertarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(48, NULL, 'TipoApuestaEditar/{idTipoApuesta}', 'App\\Http\\Controllers\\TipoApuestaController@TipoApuestaEditarVista', 'GET', NULL, '2019-04-25 17:56:09', 1),
(49, NULL, 'TipoApuestaInsertarJson', 'App\\Http\\Controllers\\TipoApuestaController@TipoApuestaInsertarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(50, NULL, 'TipoApuestaEditarJson', 'App\\Http\\Controllers\\TipoApuestaController@TipoApuestaEditarJson', 'POST', NULL, '2019-04-25 17:56:09', 1),
(56, NULL, 'ReportedeVentasVista', 'App\\Http\\Controllers\\ReporteController@ReporteApuestaVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(57, NULL, 'ReporteVentasEventosVista', 'App\\Http\\Controllers\\ReporteController@ReporteVentaVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(58, NULL, 'ReporteHistorialEventosVista', 'App\\Http\\Controllers\\ReporteController@ReporteVentaJuegoVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(60, NULL, 'ReporteHistorialTicketVista', 'App\\Http\\Controllers\\ReporteController@ReporteHistorialTicketVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(61, NULL, 'ReporteDetalleApuestaEventoVista', 'App\\Http\\Controllers\\ReporteController@ReporteHistorialGanadoresVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(62, NULL, 'ReporteJackPot', 'App\\Http\\Controllers\\ReporteController@ReporteJackPotVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(63, NULL, 'ProgresivoListar', 'App\\Http\\Controllers\\ProgresivoController@ProgresivoListarVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(64, NULL, 'ProgresivoInsertar', 'App\\Http\\Controllers\\ProgresivoController@ProgresivoInsertarVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(65, NULL, 'ProgresivoConfiguracion', 'App\\Http\\Controllers\\ProgresivoController@ProgresivoConfiguracionVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(66, NULL, 'UsuarioPuntoVenta', 'App\\Http\\Controllers\\UsuarioPuntoVentaController@UsuarioPuntoVentaListarVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(67, NULL, 'UsuarioPuntoVentaEditar/{idUsuarioPuntoVenta}', 'App\\Http\\Controllers\\UsuarioPuntoVentaController@UsuarioPuntoVentaEditarVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(68, NULL, 'Auditoria', 'App\\Http\\Controllers\\ReporteController@ReporteAuditoriaVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(69, NULL, 'ReporteJackPotListarJson', 'App\\Http\\Controllers\\ReporteController@ReporteJackPotListarJson', 'POST', NULL, '2019-04-25 17:56:10', 1),
(70, NULL, 'ConfiguracionJackpotListarJson', 'App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotListarJson', 'POST', NULL, '2019-04-25 17:56:10', 1),
(71, NULL, 'ConfiguracionGeneral', 'App\\Http\\Controllers\\ConfiguracionGeneralController@ConfiguracionGeneralVista', 'GET', NULL, '2019-04-25 17:56:10', 1),
(72, NULL, 'Seguridad', 'App\\Http\\Controllers\\SeguridadController@PermisosUsuarioVista', 'GET', NULL, '2019-04-25 17:56:11', 1),
(74, NULL, 'JuegoEditarVista/{IdJuego}', 'App\\Http\\Controllers\\JuegoController@JuegoEditarVista', 'GET', NULL, '2019-04-29 13:51:39', 1),
(75, NULL, 'JuegoEditarJson', 'App\\Http\\Controllers\\JuegoController@JuegoEditarJson', 'POST', NULL, '2019-04-29 13:51:39', 1),
(76, NULL, 'JuegoListarVista', 'App\\Http\\Controllers\\JuegoController@JuegoListarVista', 'GET', NULL, '2019-04-29 13:52:05', 1),
(77, NULL, 'ReporteAlertasVista', 'App\\Http\\Controllers\\ReporteController@ReporteAlertasVista', 'GET', NULL, '2019-04-30 11:29:25', 1),
(78, NULL, 'TipoAlertaVista', 'App\\Http\\Controllers\\SeguridadController@TipoAlertaVista', 'GET', NULL, '2019-05-02 13:00:02', 1),
(80, NULL, 'TipoAlertaPuntoVenta/{idTipoAlerta}', 'App\\Http\\Controllers\\SeguridadController@TipoAlertaPuntoVentaVista', 'GET', NULL, '2019-05-02 17:49:55', 1),
(81, NULL, 'TipoAlertaPuntoVentaInsertarJson', 'App\\Http\\Controllers\\SeguridadController@TipoAlertaPuntoVentaInsertarJson', 'POST', NULL, '2019-05-02 17:49:55', 1),
(82, NULL, 'TipoAlertaPuntoVentaEditarJson', 'App\\Http\\Controllers\\SeguridadController@TipoAlertaPuntoVentaEditarJson', 'POST', NULL, '2019-05-03 13:17:14', 1),
(83, NULL, 'CierreCajaVista', 'App\\Http\\Controllers\\ReporteController@ReporteCierraVentaVista', 'GET', NULL, '2019-05-14 21:44:03', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_perfil`
--

CREATE TABLE `permisos_perfil` (
  `id` int(11) NOT NULL,
  `perfil_id` int(11) DEFAULT NULL COMMENT '0:administrador,1:cajero',
  `permiso_id` int(11) DEFAULT NULL COMMENT 'usuario',
  `estado` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macroman COLLATE=macroman_bin;

--
-- Volcado de datos para la tabla `permisos_perfil`
--

INSERT INTO `permisos_perfil` (`id`, `perfil_id`, `permiso_id`, `estado`, `fecha_registro`) VALUES
(366, 1, 1, 1, '2019-05-02 17:50:16'),
(367, 1, 2, 1, '2019-05-02 17:50:16'),
(368, 1, 3, 1, '2019-05-02 17:50:16'),
(369, 1, 4, 1, '2019-05-02 17:50:16'),
(370, 1, 5, 1, '2019-05-02 17:50:16'),
(371, 1, 6, 1, '2019-05-02 17:50:16'),
(372, 1, 7, 1, '2019-05-02 17:50:16'),
(373, 1, 8, 1, '2019-05-02 17:50:17'),
(374, 1, 9, 1, '2019-05-02 17:50:17'),
(375, 1, 10, 1, '2019-05-02 17:50:17'),
(376, 1, 11, 1, '2019-05-02 17:50:17'),
(377, 1, 12, 1, '2019-05-02 17:50:17'),
(378, 1, 13, 1, '2019-05-02 17:50:17'),
(379, 1, 14, 1, '2019-05-02 17:50:17'),
(380, 1, 15, 1, '2019-05-02 17:50:17'),
(381, 1, 16, 1, '2019-05-02 17:50:17'),
(382, 1, 17, 1, '2019-05-02 17:50:17'),
(383, 1, 18, 1, '2019-05-02 17:50:17'),
(384, 1, 19, 1, '2019-05-02 17:50:17'),
(385, 1, 20, 1, '2019-05-02 17:50:17'),
(386, 1, 21, 1, '2019-05-02 17:50:17'),
(387, 1, 22, 1, '2019-05-02 17:50:17'),
(388, 1, 23, 1, '2019-05-02 17:50:17'),
(389, 1, 24, 1, '2019-05-02 17:50:17'),
(390, 1, 25, 1, '2019-05-02 17:50:17'),
(391, 1, 26, 1, '2019-05-02 17:50:17'),
(392, 1, 27, 1, '2019-05-02 17:50:17'),
(393, 1, 28, 1, '2019-05-02 17:50:17'),
(394, 1, 29, 1, '2019-05-02 17:50:17'),
(395, 1, 30, 1, '2019-05-02 17:50:17'),
(396, 1, 31, 1, '2019-05-02 17:50:17'),
(397, 1, 32, 1, '2019-05-02 17:50:17'),
(398, 1, 33, 1, '2019-05-02 17:50:17'),
(399, 1, 34, 1, '2019-05-02 17:50:17'),
(400, 1, 35, 1, '2019-05-02 17:50:17'),
(401, 1, 36, 1, '2019-05-02 17:50:18'),
(402, 1, 37, 1, '2019-05-02 17:50:18'),
(403, 1, 38, 1, '2019-05-02 17:50:18'),
(404, 1, 39, 1, '2019-05-02 17:50:18'),
(405, 1, 40, 1, '2019-05-02 17:50:18'),
(406, 1, 41, 1, '2019-05-02 17:50:18'),
(407, 1, 42, 1, '2019-05-02 17:50:18'),
(408, 1, 43, 1, '2019-05-02 17:50:18'),
(409, 1, 44, 1, '2019-05-02 17:50:18'),
(410, 1, 45, 1, '2019-05-02 17:50:18'),
(411, 1, 46, 1, '2019-05-02 17:50:18'),
(412, 1, 47, 1, '2019-05-02 17:50:18'),
(413, 1, 48, 1, '2019-05-02 17:50:18'),
(414, 1, 49, 1, '2019-05-02 17:50:18'),
(415, 1, 50, 1, '2019-05-02 17:50:18'),
(416, 1, 56, 1, '2019-05-02 17:50:18'),
(417, 1, 57, 1, '2019-05-02 17:50:18'),
(418, 1, 58, 1, '2019-05-02 17:50:18'),
(420, 1, 60, 1, '2019-05-02 17:50:18'),
(421, 1, 61, 1, '2019-05-02 17:50:18'),
(422, 1, 62, 1, '2019-05-02 17:50:18'),
(423, 1, 63, 1, '2019-05-02 17:50:18'),
(424, 1, 64, 1, '2019-05-02 17:50:18'),
(425, 1, 65, 1, '2019-05-02 17:50:18'),
(426, 1, 66, 1, '2019-05-02 17:50:18'),
(427, 1, 67, 1, '2019-05-02 17:50:18'),
(428, 1, 68, 1, '2019-05-02 17:50:18'),
(429, 1, 69, 1, '2019-05-02 17:50:19'),
(430, 1, 70, 1, '2019-05-02 17:50:19'),
(431, 1, 71, 1, '2019-05-02 17:50:19'),
(432, 1, 72, 1, '2019-05-02 17:50:19'),
(433, 1, 74, 1, '2019-05-02 17:50:19'),
(434, 1, 75, 1, '2019-05-02 17:50:19'),
(435, 1, 76, 1, '2019-05-02 17:50:19'),
(436, 1, 77, 1, '2019-05-02 17:50:19'),
(437, 1, 78, 1, '2019-05-02 17:50:19'),
(438, 1, 80, 1, '2019-05-02 17:50:19'),
(439, 1, 81, 1, '2019-05-02 17:50:19'),
(440, 1, 82, 1, '2019-05-03 13:18:01'),
(441, 1, 83, 1, '2019-05-14 21:44:25'),
(442, 0, 1, 1, '2019-05-15 22:27:51'),
(443, 0, 2, 1, '2019-05-15 22:27:51'),
(444, 0, 3, 1, '2019-05-15 22:27:51'),
(445, 0, 4, 1, '2019-05-15 22:27:51'),
(446, 0, 5, 1, '2019-05-15 22:27:51'),
(447, 0, 6, 1, '2019-05-15 22:27:51'),
(448, 0, 7, 1, '2019-05-15 22:27:51'),
(449, 0, 8, 1, '2019-05-15 22:27:51'),
(450, 0, 9, 1, '2019-05-15 22:27:51'),
(451, 0, 10, 1, '2019-05-15 22:27:52'),
(452, 0, 11, 1, '2019-05-15 22:27:52'),
(453, 0, 12, 1, '2019-05-15 22:27:52'),
(454, 0, 13, 1, '2019-05-15 22:27:52'),
(455, 0, 14, 1, '2019-05-15 22:27:52'),
(456, 0, 15, 1, '2019-05-15 22:27:52'),
(457, 0, 16, 1, '2019-05-15 22:27:52'),
(458, 0, 17, 1, '2019-05-15 22:27:52'),
(459, 0, 18, 1, '2019-05-15 22:27:52'),
(460, 0, 19, 1, '2019-05-15 22:27:52'),
(461, 0, 20, 1, '2019-05-15 22:27:52'),
(462, 0, 21, 1, '2019-05-15 22:27:52'),
(463, 0, 22, 1, '2019-05-15 22:27:52'),
(464, 0, 23, 1, '2019-05-15 22:27:52'),
(465, 0, 24, 1, '2019-05-15 22:27:52'),
(466, 0, 25, 1, '2019-05-15 22:27:52'),
(467, 0, 26, 1, '2019-05-15 22:27:52'),
(468, 0, 27, 1, '2019-05-15 22:27:52'),
(469, 0, 28, 1, '2019-05-15 22:27:52'),
(470, 0, 29, 1, '2019-05-15 22:27:52'),
(471, 0, 30, 1, '2019-05-15 22:27:52'),
(472, 0, 31, 1, '2019-05-15 22:27:52'),
(473, 0, 32, 1, '2019-05-15 22:27:52'),
(474, 0, 33, 1, '2019-05-15 22:27:52'),
(475, 0, 34, 1, '2019-05-15 22:27:52'),
(476, 0, 35, 1, '2019-05-15 22:27:52'),
(477, 0, 36, 1, '2019-05-15 22:27:52'),
(478, 0, 37, 1, '2019-05-15 22:27:52'),
(479, 0, 38, 1, '2019-05-15 22:27:52'),
(480, 0, 39, 1, '2019-05-15 22:27:52'),
(481, 0, 40, 1, '2019-05-15 22:27:52'),
(482, 0, 41, 1, '2019-05-15 22:27:52'),
(483, 0, 42, 1, '2019-05-15 22:27:52'),
(484, 0, 43, 1, '2019-05-15 22:27:52'),
(485, 0, 44, 1, '2019-05-15 22:27:52'),
(486, 0, 45, 1, '2019-05-15 22:27:52'),
(487, 0, 46, 1, '2019-05-15 22:27:52'),
(488, 0, 47, 1, '2019-05-15 22:27:52'),
(489, 0, 48, 1, '2019-05-15 22:27:52'),
(490, 0, 49, 1, '2019-05-15 22:27:52'),
(491, 0, 50, 1, '2019-05-15 22:27:52'),
(492, 0, 56, 1, '2019-05-15 22:27:52'),
(493, 0, 57, 1, '2019-05-15 22:27:52'),
(494, 0, 58, 1, '2019-05-15 22:27:52'),
(495, 0, 60, 1, '2019-05-15 22:27:52'),
(496, 0, 61, 1, '2019-05-15 22:27:52'),
(497, 0, 62, 1, '2019-05-15 22:27:52'),
(498, 0, 63, 1, '2019-05-15 22:27:52'),
(499, 0, 64, 1, '2019-05-15 22:27:52'),
(500, 0, 65, 1, '2019-05-15 22:27:52'),
(501, 0, 66, 1, '2019-05-15 22:27:52'),
(502, 0, 67, 1, '2019-05-15 22:27:52'),
(503, 0, 68, 1, '2019-05-15 22:27:52'),
(504, 0, 69, 1, '2019-05-15 22:27:52'),
(505, 0, 70, 1, '2019-05-15 22:27:52'),
(506, 0, 71, 1, '2019-05-15 22:27:52'),
(507, 0, 72, 1, '2019-05-15 22:27:52'),
(508, 0, 74, 1, '2019-05-15 22:27:52'),
(509, 0, 75, 1, '2019-05-15 22:27:52'),
(510, 0, 76, 1, '2019-05-15 22:27:52'),
(511, 0, 77, 1, '2019-05-15 22:27:52'),
(512, 0, 78, 1, '2019-05-15 22:27:52'),
(513, 0, 80, 1, '2019-05-15 22:27:52'),
(514, 0, 81, 1, '2019-05-15 22:27:52'),
(515, 0, 82, 1, '2019-05-15 22:27:52'),
(516, 0, 83, 1, '2019-05-15 22:27:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `punto_venta`
--

CREATE TABLE `punto_venta` (
  `idPuntoVenta` int(10) UNSIGNED NOT NULL,
  `idEmpresa` int(10) UNSIGNED DEFAULT NULL,
  `idUbigeo` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZonaComercial` int(11) DEFAULT NULL,
  `cc_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `unit_ids` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `punto_venta_tipo_alerta`
--

CREATE TABLE `punto_venta_tipo_alerta` (
  `idPuntoVentaTipoAlerta` int(11) NOT NULL,
  `idTipoAlerta` int(11) DEFAULT NULL,
  `idPuntoVenta` int(10) UNSIGNED DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `punto_venta_tipo_alerta`
--

INSERT INTO `punto_venta_tipo_alerta` (`idPuntoVentaTipoAlerta`, `idTipoAlerta`, `idPuntoVenta`, `monto`, `asunto`, `mensaje`, `estado`) VALUES
(3, 1, 7, '1000.00', 'MONTO MAXIMO VENTA PUNTO VENTA: TARAPOTO 01', 'EL PUNTO DE VENTA TARAPOTO 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00', 1),
(4, 1, 241, '1000.00', 'MONTO MAXIMO VENTA PUNTO VENTA: AT SANTA BARBARA', 'EL PUNTO DE VENTA AT SANTA BARBARA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n', 1),
(5, 1, 2, '1000.00', 'MONTO MAXIMO VENTA PUNTO VENTA: EL GOLF', 'EL PUNTO DE VENTA EL GOLF LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n', 1),
(6, 1, 3, '10000.00', 'MONTO MAXIMO VENTA PUNTO VENTA: CIX CENTRO 1\r\n', 'EL PUNTO DE VENTA CIX CENTRO 1 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00\r\n', 1),
(7, 1, 9, '1500.00', 'MONTO MAXIMO VENTA PUNTO VENTA: MOYOBAMBA 01', 'EL PUNTO DE VENTA MOYOBAMBA 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1500.00\r\n', 1),
(8, 1, 8, '2500.00', 'MONTO MAXIMO VENTA PUNTO VENTA: VILLA EL SALVADOR', 'EL PUNTO DE VENTA VILLA EL SALVADOR LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 2500.00\r\n', 1),
(9, 1, 4, '1500.00', 'MONTO MAXIMO VENTA PUNTO VENTA: GRIFO PECSA', 'EL PUNTO DE VENTA GRIFO PECSA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1500.00\r\n', 1),
(10, 1, 259, '1000.00', 'MONTO MAXIMO VENTA PUNTO VENTA: AT LOCAL MERPROLIMA', 'EL PUNTO DE VENTA AT LOCAL MERPROLIMA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_evento`
--

CREATE TABLE `resultado_evento` (
  `idResultadosEvento` bigint(20) UNSIGNED NOT NULL,
  `idEvento` bigint(20) UNSIGNED DEFAULT NULL,
  `multiplicadorApuestaGanada` decimal(18,2) DEFAULT NULL,
  `valorGanador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idTipoPago` int(10) UNSIGNED DEFAULT NULL,
  `estado` int(11) DEFAULT NULL COMMENT '0=Anulado\r\n1=Activo',
  `idTipoApuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resultado_evento`
--

INSERT INTO `resultado_evento` (`idResultadosEvento`, `idEvento`, `multiplicadorApuestaGanada`, `valorGanador`, `idTipoPago`, `estado`, `idTipoApuesta`) VALUES
(1, 20, '36.00', '14', 1, 1, 14),
(2, 20, '2.00', '14', 3, 1, 43),
(3, 20, '3.00', '14', 5, 1, 41),
(4, 20, '2.00', '14', 2, 1, 38),
(5, 1, '36.00', '14', 1, 1, 14),
(6, 1, '2.00', '14', 3, 1, 43),
(7, 1, '3.00', '14', 5, 1, 41),
(8, 1, '2.00', '14', 2, 1, 38),
(9, 2, '36.00', '22', 1, 1, 22),
(10, 2, '2.00', '22', 3, 1, 43),
(11, 2, '3.00', '22', 5, 1, 41),
(12, 2, '2.00', '22', 2, 1, 37),
(13, 3, '36.00', '24', 1, 1, 24),
(14, 3, '2.00', '24', 3, 1, 43),
(15, 3, '3.00', '24', 5, 1, 41),
(16, 3, '2.00', '24', 2, 1, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `idTicket` bigint(20) UNSIGNED NOT NULL,
  `idEvento` bigint(20) UNSIGNED DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL COMMENT '0=NoGano,1=gano',
  `estadoTicket` int(11) DEFAULT NULL COMMENT '0=Anulado\r\n1=Ejecucion\r\n2=Pagado\r\n3=Suspendido',
  `montoTotal` decimal(18,2) DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `fechaRegistro` datetime DEFAULT NULL,
  `PremioMaximoPagar` decimal(10,0) NOT NULL,
  `PremioMaximoPotencial` decimal(10,0) NOT NULL,
  `sessionToken` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `playerID` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gameID` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`idTicket`, `idEvento`, `ganador`, `estadoTicket`, `montoTotal`, `fechaPago`, `fechaRegistro`, `PremioMaximoPagar`, `PremioMaximoPotencial`, `sessionToken`, `playerID`, `gameID`) VALUES
(175, NULL, 0, 1, '12.00', NULL, '2024-03-12 10:33:30', '2000', '432', '1', '2', '3'),
(176, NULL, 0, 1, '1.00', NULL, '2024-03-12 10:35:50', '2000', '36', '1', '2', '3'),
(177, NULL, 0, 1, '1.00', NULL, '2024-03-12 10:35:57', '2000', '36', '1', '2', '3'),
(178, 2, 0, 1, '3.00', NULL, '2024-03-12 10:36:19', '2000', '108', '1', '2', '3'),
(179, 2, 0, 1, '10.00', NULL, '2024-03-12 10:37:01', '2000', '360', '1', '2', '3'),
(180, 2, 0, 1, '1.00', NULL, '2024-03-12 11:21:55', '2000', '36', '1', '2', '3'),
(181, 2, 0, 1, '1.00', NULL, '2024-03-12 11:31:02', '2000', '36', '1', '2', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_alerta`
--

CREATE TABLE `tipo_alerta` (
  `idTipoAlerta` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `mensaje` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_alerta`
--

INSERT INTO `tipo_alerta` (`idTipoAlerta`, `nombre`, `monto`, `estado`, `asunto`, `mensaje`) VALUES
(1, 'MAXIMA VENTA DIA\r\n', '10000.00', 1, 'MONTO MAXIMO VENTA PUNTO VENTA:XXXXX\r\n', 'EL PUNTO DE VENTA XXXXX LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE YYYYYY\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_apuesta`
--

CREATE TABLE `tipo_apuesta` (
  `idTipoApuesta` int(10) UNSIGNED NOT NULL,
  `idTipoPago` int(10) UNSIGNED DEFAULT NULL,
  `valorapuesta` int(11) DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rgb` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `rgbLetra` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_apuesta`
--

INSERT INTO `tipo_apuesta` (`idTipoApuesta`, `idTipoPago`, `valorapuesta`, `nombre`, `descripcion`, `rgb`, `estado`, `rgbLetra`) VALUES
(1, 1, 1, 'pleno', '1 pleno', '#16277D', 1, '#FFFFFF'),
(2, 1, 2, 'pleno', '2 pleno', '#EAE399', 1, '#5B1312'),
(3, 1, 3, 'pleno', '3 pleno', '#16277D', 1, '#FFFFFF'),
(4, 1, 4, 'pleno', '4 pleno', '#EAE399', 1, '#5B1312'),
(5, 1, 5, 'pleno', '5 pleno', '#16277D', 1, '#FFFFFF'),
(6, 1, 6, 'pleno', '6 pleno', '#EAE399', 1, '#5B1312'),
(7, 1, 7, 'pleno', '7 pleno', '#16277D', 1, '#FFFFFF'),
(8, 1, 8, 'pleno', '8 pleno', '#EAE399', 1, '#5B1312'),
(9, 1, 9, 'pleno', '9 pleno', '#16277D', 1, '#FFFFFF'),
(10, 1, 10, 'pleno', '10 pleno', '#EAE399', 1, '#5B1312'),
(11, 1, 11, 'pleno', '11 pleno', '#EAE399', 1, '#5B1312'),
(12, 1, 12, 'pleno', '12 pleno', '#16277D', 1, '#FFFFFF'),
(13, 1, 13, 'pleno', '13 pleno', '#EAE399', 1, '#5B1312'),
(14, 1, 14, 'pleno', '14 pleno', '#16277D', 1, '#FFFFFF'),
(15, 1, 15, 'pleno', '15 pleno', '#EAE399', 1, '#5B1312'),
(16, 1, 16, 'pleno', '16 pleno', '#16277D', 1, '#FFFFFF'),
(17, 1, 17, 'pleno', '17 pleno', '#EAE399', 1, '#5B1312'),
(18, 1, 18, 'pleno', '18 pleno', '#16277D', 1, '#FFFFFF'),
(19, 1, 19, 'pleno', '19 pleno', '#16277D', 1, '#FFFFFF'),
(20, 1, 20, 'pleno', '20 pleno', '#EAE399', 1, '#5B1312'),
(21, 1, 21, 'pleno', '21 pleno', '#16277D', 1, '#FFFFFF'),
(22, 1, 22, 'pleno', '22 pleno', '#EAE399', 1, '#5B1312'),
(23, 1, 23, 'pleno', '23 pleno', '#16277D', 1, '#FFFFFF'),
(24, 1, 24, 'pleno', '24 pleno', '#EAE399', 1, '#5B1312'),
(25, 1, 25, 'pleno', '25 pleno', '#16277D', 1, '#FFFFFF'),
(26, 1, 26, 'pleno', '26 pleno', '#EAE399', 1, '#5B1312'),
(27, 1, 27, 'pleno', '27 pleno', '#16277D', 1, '#FFFFFF'),
(28, 1, 28, 'pleno', '28 pleno', '#EAE399', 1, '#5B1312'),
(29, 1, 29, 'pleno', '29 pleno', '#EAE399', 1, '#5B1312'),
(30, 1, 30, 'pleno', '30 pleno', '#16277D', 1, '#FFFFFF'),
(31, 1, 31, 'pleno', '31 pleno', '#EAE399', 1, '#5B1312'),
(32, 1, 32, 'pleno', '32 pleno', '#16277D', 1, '#FFFFFF'),
(33, 1, 33, 'pleno', '33 pleno', '#EAE399', 1, '#5B1312'),
(34, 1, 34, 'pleno', '34 pleno', '#16277D', 1, '#FFFFFF'),
(35, 1, 35, 'pleno', '35 pleno', '#EAE399', 1, '#5B1312'),
(36, 1, 36, 'pleno', '36 pleno', '#16277D', 1, '#FFFFFF'),
(37, 2, -1, 'CREMA', 'COLOR 1', '#EAE399', 1, '#5B1312'),
(38, 2, -1, 'AZUL', 'COLOR 2', '#16277D', 1, '#FFFFFF'),
(39, 6, 0, 'CAJA X', 'CAJA BLOQUEDA', '#2d572c', 1, ''),
(40, 5, -1, '1-12', '1-12', '#4D586C', 1, ''),
(41, 5, -1, '13-24', '13-24', '#4D586C', 1, ''),
(42, 5, -1, '25-36', '25-36', '#4D586C', 1, ''),
(43, 3, -1, 'PAR', 'PAR', '#4D586C', 1, ''),
(44, 3, -1, 'IMPAR', 'IMPAR', '#4D586C', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `idTipoPago` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multiplicadorDefecto` decimal(18,2) DEFAULT NULL,
  `plenoMinimo` int(11) DEFAULT NULL,
  `plenoMaximo` int(11) DEFAULT NULL,
  `intercalado` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`idTipoPago`, `nombre`, `multiplicadorDefecto`, `plenoMinimo`, `plenoMaximo`, `intercalado`, `estado`) VALUES
(1, 'Pleno', '36.00', 1, 36, 0, 1),
(2, 'Color', '2.00', 1, 24, 0, 1),
(3, 'Par e Impar', '2.00', 1, 24, 1, 1),
(4, '1era, 2da, 3ra ½ docena', '3.00', 1, 24, 1, 1),
(5, 'Del 1 al 12, 13 al 24', '3.00', 1, 24, 0, 1),
(6, 'CajaBloqueada', '36.00', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `idTurno` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`idTurno`, `nombre`, `estado`) VALUES
(1, '1', 1),
(2, '2', 1),
(3, '3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo`
--

CREATE TABLE `ubigeo` (
  `idUbigeo` int(10) UNSIGNED NOT NULL,
  `cod_depa` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_prov` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_dist` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ubigeo`
--

INSERT INTO `ubigeo` (`idUbigeo`, `cod_depa`, `cod_prov`, `cod_dist`, `nombre`, `estado`) VALUES
(1, '01', '00', '00', 'AMAZONAS', 1),
(2, '01', '01', '00', 'CHACHAPOYAS', 1),
(3, '01', '01', '01', 'CHACHAPOYAS', 1),
(4, '01', '01', '02', 'ASUNCION', 1),
(5, '01', '01', '03', 'BALSAS', 1),
(6, '01', '01', '04', 'CHETO', 1),
(7, '01', '01', '05', 'CHILIQUIN', 1),
(8, '01', '01', '06', 'CHUQUIBAMBA', 1),
(9, '01', '01', '07', 'GRANADA', 1),
(10, '01', '01', '08', 'HUANCAS', 1),
(11, '01', '01', '09', 'LA JALCA', 1),
(12, '01', '01', '10', 'LEIMEBAMBA', 1),
(13, '01', '01', '11', 'LEVANTO', 1),
(14, '01', '01', '12', 'MAGDALENA', 1),
(15, '01', '01', '13', 'MARISCAL CASTILLA', 1),
(16, '01', '01', '14', 'MOLINOPAMPA', 1),
(17, '01', '01', '15', 'MONTEVIDEO', 1),
(18, '01', '01', '16', 'OLLEROS', 1),
(19, '01', '01', '17', 'QUINJALCA', 1),
(20, '01', '01', '18', 'SAN FRANCISCO DE DAGUAS', 1),
(21, '01', '01', '19', 'SAN ISIDRO DE MAINO', 1),
(22, '01', '01', '20', 'SOLOCO', 1),
(23, '01', '01', '21', 'SONCHE', 1),
(24, '01', '02', '00', 'BAGUA', 1),
(25, '01', '02', '01', 'LA PECA', 1),
(26, '01', '02', '02', 'ARAMANGO', 1),
(27, '01', '02', '03', 'COPALLIN', 1),
(28, '01', '02', '04', 'EL PARCO', 1),
(29, '01', '02', '05', 'BAGUA', 1),
(30, '01', '02', '06', 'IMAZA', 1),
(31, '01', '03', '00', 'BONGARA', 1),
(32, '01', '03', '01', 'JUMBILLA', 1),
(33, '01', '03', '02', 'COROSHA', 1),
(34, '01', '03', '03', 'CUISPES', 1),
(35, '01', '03', '04', 'CHISQUILLA', 1),
(36, '01', '03', '05', 'CHURUJA', 1),
(37, '01', '03', '06', 'FLORIDA', 1),
(38, '01', '03', '07', 'RECTA', 1),
(39, '01', '03', '08', 'SAN CARLOS', 1),
(40, '01', '03', '09', 'SHIPASBAMBA', 1),
(41, '01', '03', '10', 'VALERA', 1),
(42, '01', '03', '11', 'YAMBRASBAMBA', 1),
(43, '01', '03', '12', 'JAZAN', 1),
(44, '01', '04', '00', 'LUYA', 1),
(45, '01', '04', '01', 'LAMUD', 1),
(46, '01', '04', '02', 'CAMPORREDONDO', 1),
(47, '01', '04', '03', 'COCABAMBA', 1),
(48, '01', '04', '04', 'COLCAMAR', 1),
(49, '01', '04', '05', 'CONILA', 1),
(50, '01', '04', '06', 'INGUILPATA', 1),
(51, '01', '04', '07', 'LONGUITA', 1),
(52, '01', '04', '08', 'LONYA CHICO', 1),
(53, '01', '04', '09', 'LUYA', 1),
(54, '01', '04', '10', 'LUYA VIEJO', 1),
(55, '01', '04', '11', 'MARIA', 1),
(56, '01', '04', '12', 'OCALLI', 1),
(57, '01', '04', '13', 'OCUMAL', 1),
(58, '01', '04', '14', 'PISUQUIA', 1),
(59, '01', '04', '15', 'SAN CRISTOBAL', 1),
(60, '01', '04', '16', 'SAN FRANCISCO DE YESO', 1),
(61, '01', '04', '17', 'SAN JERONIMO', 1),
(62, '01', '04', '18', 'SAN JUAN DE LOPECANCHA', 1),
(63, '01', '04', '19', 'SANTA CATALINA', 1),
(64, '01', '04', '20', 'SANTO TOMAS', 1),
(65, '01', '04', '21', 'TINGO', 1),
(66, '01', '04', '22', 'TRITA', 1),
(67, '01', '04', '23', 'PROVIDENCIA', 1),
(68, '01', '05', '00', 'RODRIGUEZ DE MENDOZA', 1),
(69, '01', '05', '01', 'SAN NICOLAS', 1),
(70, '01', '05', '02', 'COCHAMAL', 1),
(71, '01', '05', '03', 'CHIRIMOTO', 1),
(72, '01', '05', '04', 'HUAMBO', 1),
(73, '01', '05', '05', 'LIMABAMBA', 1),
(74, '01', '05', '06', 'LONGAR', 1),
(75, '01', '05', '07', 'MILPUCC', 1),
(76, '01', '05', '08', 'MARISCAL BENAVIDES', 1),
(77, '01', '05', '09', 'OMIA', 1),
(78, '01', '05', '10', 'SANTA ROSA', 1),
(79, '01', '05', '11', 'TOTORA', 1),
(80, '01', '05', '12', 'VISTA ALEGRE', 1),
(81, '01', '06', '00', 'CONDORCANQUI', 1),
(82, '01', '06', '01', 'NIEVA', 1),
(83, '01', '06', '02', 'RIO SANTIAGO', 1),
(84, '01', '06', '03', 'EL CENEPA', 1),
(85, '01', '07', '00', 'UTCUBAMBA', 1),
(86, '01', '07', '01', 'BAGUA GRANDE', 1),
(87, '01', '07', '02', 'CAJARURO', 1),
(88, '01', '07', '03', 'CUMBA', 1),
(89, '01', '07', '04', 'EL MILAGRO', 1),
(90, '01', '07', '05', 'JAMALCA', 1),
(91, '01', '07', '06', 'LONYA GRANDE', 1),
(92, '01', '07', '07', 'YAMON', 1),
(93, '02', '00', '00', 'ANCASH', 1),
(94, '02', '01', '00', 'HUARAZ', 1),
(95, '02', '01', '01', 'HUARAZ', 1),
(96, '02', '01', '02', 'INDEPENDENCIA', 1),
(97, '02', '01', '03', 'COCHABAMBA', 1),
(98, '02', '01', '04', 'COLCABAMBA', 1),
(99, '02', '01', '05', 'HUANCHAY', 1),
(100, '02', '01', '06', 'JANGAS', 1),
(101, '02', '01', '07', 'LA LIBERTAD', 1),
(102, '02', '01', '08', 'OLLEROS', 1),
(103, '02', '01', '09', 'PAMPAS GRANDE', 1),
(104, '02', '01', '10', 'PARIACOTO', 1),
(105, '02', '01', '11', 'PIRA', 1),
(106, '02', '01', '12', 'TARICA', 1),
(107, '02', '02', '00', 'AIJA', 1),
(108, '02', '02', '01', 'AIJA', 1),
(109, '02', '02', '03', 'CORIS', 1),
(110, '02', '02', '05', 'HUACLLAN', 1),
(111, '02', '02', '06', 'LA MERCED', 1),
(112, '02', '02', '08', 'SUCCHA', 1),
(113, '02', '03', '00', 'BOLOGNESI', 1),
(114, '02', '03', '01', 'CHIQUIAN', 1),
(115, '02', '03', '02', 'ABELARDO PARDO LEZAMETA', 1),
(116, '02', '03', '04', 'AQUIA', 1),
(117, '02', '03', '05', 'CAJACAY', 1),
(118, '02', '03', '10', 'HUAYLLACAYAN', 1),
(119, '02', '03', '11', 'HUASTA', 1),
(120, '02', '03', '13', 'MANGAS', 1),
(121, '02', '03', '15', 'PACLLON', 1),
(122, '02', '03', '17', 'SAN MIGUEL DE CORPANQUI', 1),
(123, '02', '03', '20', 'TICLLOS', 1),
(124, '02', '03', '21', 'ANTONIO RAIMONDI', 1),
(125, '02', '03', '22', 'CANIS', 1),
(126, '02', '03', '23', 'COLQUIOC', 1),
(127, '02', '03', '24', 'LA PRIMAVERA', 1),
(128, '02', '03', '25', 'HUALLANCA', 1),
(129, '02', '04', '00', 'CARHUAZ', 1),
(130, '02', '04', '01', 'CARHUAZ', 1),
(131, '02', '04', '02', 'ACOPAMPA', 1),
(132, '02', '04', '03', 'AMASHCA', 1),
(133, '02', '04', '04', 'ANTA', 1),
(134, '02', '04', '05', 'ATAQUERO', 1),
(135, '02', '04', '06', 'MARCARA', 1),
(136, '02', '04', '07', 'PARIAHUANCA', 1),
(137, '02', '04', '08', 'SAN MIGUEL DE ACO', 1),
(138, '02', '04', '09', 'SHILLA', 1),
(139, '02', '04', '10', 'TINCO', 1),
(140, '02', '04', '11', 'YUNGAR', 1),
(141, '02', '05', '00', 'CASMA', 1),
(142, '02', '05', '01', 'CASMA', 1),
(143, '02', '05', '02', 'BUENA VISTA ALTA', 1),
(144, '02', '05', '03', 'COMANDANTE NOEL', 1),
(145, '02', '05', '05', 'YAUTAN', 1),
(146, '02', '06', '00', 'CORONGO', 1),
(147, '02', '06', '01', 'CORONGO', 1),
(148, '02', '06', '02', 'ACO', 1),
(149, '02', '06', '03', 'BAMBAS', 1),
(150, '02', '06', '04', 'CUSCA', 1),
(151, '02', '06', '05', 'LA PAMPA', 1),
(152, '02', '06', '06', 'YANAC', 1),
(153, '02', '06', '07', 'YUPAN', 1),
(154, '02', '07', '00', 'HUAYLAS', 1),
(155, '02', '07', '01', 'CARAZ', 1),
(156, '02', '07', '02', 'HUALLANCA', 1),
(157, '02', '07', '03', 'HUATA', 1),
(158, '02', '07', '04', 'HUAYLAS', 1),
(159, '02', '07', '05', 'MATO', 1),
(160, '02', '07', '06', 'PAMPAROMAS', 1),
(161, '02', '07', '07', 'PUEBLO LIBRE', 1),
(162, '02', '07', '08', 'SANTA CRUZ', 1),
(163, '02', '07', '09', 'YURACMARCA', 1),
(164, '02', '07', '10', 'SANTO TORIBIO', 1),
(165, '02', '08', '00', 'HUARI', 1),
(166, '02', '08', '01', 'HUARI', 1),
(167, '02', '08', '02', 'CAJAY', 1),
(168, '02', '08', '03', 'CHAVIN DE HUANTAR', 1),
(169, '02', '08', '04', 'HUACACHI', 1),
(170, '02', '08', '05', 'HUACHIS', 1),
(171, '02', '08', '06', 'HUACCHIS', 1),
(172, '02', '08', '07', 'HUANTAR', 1),
(173, '02', '08', '08', 'MASIN', 1),
(174, '02', '08', '09', 'PAUCAS', 1),
(175, '02', '08', '10', 'PONTO', 1),
(176, '02', '08', '11', 'RAHUAPAMPA', 1),
(177, '02', '08', '12', 'RAPAYAN', 1),
(178, '02', '08', '13', 'SAN MARCOS', 1),
(179, '02', '08', '14', 'SAN PEDRO DE CHANA', 1),
(180, '02', '08', '15', 'UCO', 1),
(181, '02', '08', '16', 'ANRA', 1),
(182, '02', '09', '00', 'MARISCAL LUZURIAGA', 1),
(183, '02', '09', '01', 'PISCOBAMBA', 1),
(184, '02', '09', '02', 'CASCA', 1),
(185, '02', '09', '03', 'LUCMA', 1),
(186, '02', '09', '04', 'FIDEL OLIVAS ESCUDERO', 1),
(187, '02', '09', '05', 'LLAMA', 1),
(188, '02', '09', '06', 'LLUMPA', 1),
(189, '02', '09', '07', 'MUSGA', 1),
(190, '02', '09', '08', 'ELEAZAR GUZMAN BARRON', 1),
(191, '02', '10', '00', 'PALLASCA', 1),
(192, '02', '10', '01', 'CABANA', 1),
(193, '02', '10', '02', 'BOLOGNESI', 1),
(194, '02', '10', '03', 'CONCHUCOS', 1),
(195, '02', '10', '04', 'HUACASCHUQUE', 1),
(196, '02', '10', '05', 'HUANDOVAL', 1),
(197, '02', '10', '06', 'LACABAMBA', 1),
(198, '02', '10', '07', 'LLAPO', 1),
(199, '02', '10', '08', 'PALLASCA', 1),
(200, '02', '10', '09', 'PAMPAS', 1),
(201, '02', '10', '10', 'SANTA ROSA', 1),
(202, '02', '10', '11', 'TAUCA', 1),
(203, '02', '11', '00', 'POMABAMBA', 1),
(204, '02', '11', '01', 'POMABAMBA', 1),
(205, '02', '11', '02', 'HUAYLLAN', 1),
(206, '02', '11', '03', 'PAROBAMBA', 1),
(207, '02', '11', '04', 'QUINUABAMBA', 1),
(208, '02', '12', '00', 'RECUAY', 1),
(209, '02', '12', '01', 'RECUAY', 1),
(210, '02', '12', '02', 'COTAPARACO', 1),
(211, '02', '12', '03', 'HUAYLLAPAMPA', 1),
(212, '02', '12', '04', 'MARCA', 1),
(213, '02', '12', '05', 'PAMPAS CHICO', 1),
(214, '02', '12', '06', 'PARARIN', 1),
(215, '02', '12', '07', 'TAPACOCHA', 1),
(216, '02', '12', '08', 'TICAPAMPA', 1),
(217, '02', '12', '09', 'LLACLLIN', 1),
(218, '02', '12', '10', 'CATAC', 1),
(219, '02', '13', '00', 'SANTA', 1),
(220, '02', '13', '01', 'CHIMBOTE', 1),
(221, '02', '13', '02', 'CACERES DEL PERU', 1),
(222, '02', '13', '03', 'MACATE', 1),
(223, '02', '13', '04', 'MORO', 1),
(224, '02', '13', '05', 'NEPEÑA', 1),
(225, '02', '13', '06', 'SAMANCO', 1),
(226, '02', '13', '07', 'SANTA', 1),
(227, '02', '13', '08', 'COISHCO', 1),
(228, '02', '13', '09', 'NUEVO CHIMBOTE', 1),
(229, '02', '14', '00', 'SIHUAS', 1),
(230, '02', '14', '01', 'SIHUAS', 1),
(231, '02', '14', '02', 'ALFONSO UGARTE', 1),
(232, '02', '14', '03', 'CHINGALPO', 1),
(233, '02', '14', '04', 'HUAYLLABAMBA', 1),
(234, '02', '14', '05', 'QUICHES', 1),
(235, '02', '14', '06', 'SICSIBAMBA', 1),
(236, '02', '14', '07', 'ACOBAMBA', 1),
(237, '02', '14', '08', 'CASHAPAMPA', 1),
(238, '02', '14', '09', 'RAGASH', 1),
(239, '02', '14', '10', 'SAN JUAN', 1),
(240, '02', '15', '00', 'YUNGAY', 1),
(241, '02', '15', '01', 'YUNGAY', 1),
(242, '02', '15', '02', 'CASCAPARA', 1),
(243, '02', '15', '03', 'MANCOS', 1),
(244, '02', '15', '04', 'MATACOTO', 1),
(245, '02', '15', '05', 'QUILLO', 1),
(246, '02', '15', '06', 'RANRAHIRCA', 1),
(247, '02', '15', '07', 'SHUPLUY', 1),
(248, '02', '15', '08', 'YANAMA', 1),
(249, '02', '16', '00', 'ANTONIO RAIMONDI', 1),
(250, '02', '16', '01', 'LLAMELLIN', 1),
(251, '02', '16', '02', 'ACZO', 1),
(252, '02', '16', '03', 'CHACCHO', 1),
(253, '02', '16', '04', 'CHINGAS', 1),
(254, '02', '16', '05', 'MIRGAS', 1),
(255, '02', '16', '06', 'SAN JUAN DE RONTOY', 1),
(256, '02', '17', '00', 'CARLOS FERMIN FITZCARRALD', 1),
(257, '02', '17', '01', 'SAN LUIS', 1),
(258, '02', '17', '02', 'YAUYA', 1),
(259, '02', '17', '03', 'SAN NICOLAS', 1),
(260, '02', '18', '00', 'ASUNCION', 1),
(261, '02', '18', '01', 'CHACAS', 1),
(262, '02', '18', '02', 'ACOCHACA', 1),
(263, '02', '19', '00', 'HUARMEY', 1),
(264, '02', '19', '01', 'HUARMEY', 1),
(265, '02', '19', '02', 'COCHAPETI', 1),
(266, '02', '19', '03', 'HUAYAN', 1),
(267, '02', '19', '04', 'MALVAS', 1),
(268, '02', '19', '05', 'CULEBRAS', 1),
(269, '02', '20', '00', 'OCROS', 1),
(270, '02', '20', '01', 'ACAS', 1),
(271, '02', '20', '02', 'CAJAMARQUILLA', 1),
(272, '02', '20', '03', 'CARHUAPAMPA', 1),
(273, '02', '20', '04', 'COCHAS', 1),
(274, '02', '20', '05', 'CONGAS', 1),
(275, '02', '20', '06', 'LLIPA', 1),
(276, '02', '20', '07', 'OCROS', 1),
(277, '02', '20', '08', 'SAN CRISTOBAL DE RAJAN', 1),
(278, '02', '20', '09', 'SAN PEDRO', 1),
(279, '02', '20', '10', 'SANTIAGO DE CHILCAS', 1),
(280, '03', '00', '00', 'APURIMAC', 1),
(281, '03', '01', '00', 'ABANCAY', 1),
(282, '03', '01', '01', 'ABANCAY', 1),
(283, '03', '01', '02', 'CIRCA', 1),
(284, '03', '01', '03', 'CURAHUASI', 1),
(285, '03', '01', '04', 'CHACOCHE', 1),
(286, '03', '01', '05', 'HUANIPACA', 1),
(287, '03', '01', '06', 'LAMBRAMA', 1),
(288, '03', '01', '07', 'PICHIRHUA', 1),
(289, '03', '01', '08', 'SAN PEDRO DE CACHORA', 1),
(290, '03', '01', '09', 'TAMBURCO', 1),
(291, '03', '02', '00', 'AYMARAES', 1),
(292, '03', '02', '01', 'CHALHUANCA', 1),
(293, '03', '02', '02', 'CAPAYA', 1),
(294, '03', '02', '03', 'CARAYBAMBA', 1),
(295, '03', '02', '04', 'COLCABAMBA', 1),
(296, '03', '02', '05', 'COTARUSE', 1),
(297, '03', '02', '06', 'CHAPIMARCA', 1),
(298, '03', '02', '07', 'HUAYLLO', 1),
(299, '03', '02', '08', 'LUCRE', 1),
(300, '03', '02', '09', 'POCOHUANCA', 1),
(301, '03', '02', '10', 'SAÑAYCA', 1),
(302, '03', '02', '11', 'SORAYA', 1),
(303, '03', '02', '12', 'TAPAIRIHUA', 1),
(304, '03', '02', '13', 'TINTAY', 1),
(305, '03', '02', '14', 'TORAYA', 1),
(306, '03', '02', '15', 'YANACA', 1),
(307, '03', '02', '16', 'SAN JUAN DE CHACÑA', 1),
(308, '03', '02', '17', 'JUSTO APU SAHUARAURA', 1),
(309, '03', '03', '00', 'ANDAHUAYLAS', 1),
(310, '03', '03', '01', 'ANDAHUAYLAS', 1),
(311, '03', '03', '02', 'ANDARAPA', 1),
(312, '03', '03', '03', 'CHIARA', 1),
(313, '03', '03', '04', 'HUANCARAMA', 1),
(314, '03', '03', '05', 'HUANCARAY', 1),
(315, '03', '03', '06', 'KISHUARA', 1),
(316, '03', '03', '07', 'PACOBAMBA', 1),
(317, '03', '03', '08', 'PAMPACHIRI', 1),
(318, '03', '03', '09', 'SAN ANTONIO DE CACHI', 1),
(319, '03', '03', '10', 'SAN JERONIMO', 1),
(320, '03', '03', '11', 'TALAVERA', 1),
(321, '03', '03', '12', 'TURPO', 1),
(322, '03', '03', '13', 'PACUCHA', 1),
(323, '03', '03', '14', 'POMACOCHA', 1),
(324, '03', '03', '15', 'SANTA MARIA DE CHICMO', 1),
(325, '03', '03', '16', 'TUMAY HUARACA', 1),
(326, '03', '03', '17', 'HUAYANA', 1),
(327, '03', '03', '18', 'SAN MIGUEL DE CHACCRAMPA', 1),
(328, '03', '03', '19', 'KAQUIABAMBA', 1),
(329, '03', '04', '00', 'ANTABAMBA', 1),
(330, '03', '04', '01', 'ANTABAMBA', 1),
(331, '03', '04', '02', 'EL ORO', 1),
(332, '03', '04', '03', 'HUAQUIRCA', 1),
(333, '03', '04', '04', 'JUAN ESPINOZA MEDRANO', 1),
(334, '03', '04', '05', 'OROPESA', 1),
(335, '03', '04', '06', 'PACHACONAS', 1),
(336, '03', '04', '07', 'SABAINO', 1),
(337, '03', '05', '00', 'COTABAMBAS', 1),
(338, '03', '05', '01', 'TAMBOBAMBA', 1),
(339, '03', '05', '02', 'COYLLURQUI', 1),
(340, '03', '05', '03', 'COTABAMBAS', 1),
(341, '03', '05', '04', 'HAQUIRA', 1),
(342, '03', '05', '05', 'MARA', 1),
(343, '03', '05', '06', 'CHALLHUAHUACHO', 1),
(344, '03', '06', '00', 'GRAU', 1),
(345, '03', '06', '01', 'CHUQUIBAMBILLA', 1),
(346, '03', '06', '02', 'CURPAHUASI', 1),
(347, '03', '06', '03', 'HUAILLATI', 1),
(348, '03', '06', '04', 'MAMARA', 1),
(349, '03', '06', '05', 'MARISCAL GAMARRA', 1),
(350, '03', '06', '06', 'MICAELA BASTIDAS', 1),
(351, '03', '06', '07', 'PROGRESO', 1),
(352, '03', '06', '08', 'PATAYPAMPA', 1),
(353, '03', '06', '09', 'SAN ANTONIO', 1),
(354, '03', '06', '10', 'TURPAY', 1),
(355, '03', '06', '11', 'VILCABAMBA', 1),
(356, '03', '06', '12', 'VIRUNDO', 1),
(357, '03', '06', '13', 'SANTA ROSA', 1),
(358, '03', '06', '14', 'CURASCO', 1),
(359, '03', '07', '00', 'CHINCHEROS', 1),
(360, '03', '07', '01', 'CHINCHEROS', 1),
(361, '03', '07', '02', 'ONGOY', 1),
(362, '03', '07', '03', 'OCOBAMBA', 1),
(363, '03', '07', '04', 'COCHARCAS', 1),
(364, '03', '07', '05', 'ANCO HUALLO', 1),
(365, '03', '07', '06', 'HUACCANA', 1),
(366, '03', '07', '07', 'URANMARCA', 1),
(367, '03', '07', '08', 'RANRACANCHA', 1),
(368, '04', '00', '00', 'AREQUIPA', 1),
(369, '04', '01', '00', 'AREQUIPA', 1),
(370, '04', '01', '01', 'AREQUIPA', 1),
(371, '04', '01', '02', 'CAYMA', 1),
(372, '04', '01', '03', 'CERRO COLORADO', 1),
(373, '04', '01', '04', 'CHARACATO', 1),
(374, '04', '01', '05', 'CHIGUATA', 1),
(375, '04', '01', '06', 'LA JOYA', 1),
(376, '04', '01', '07', 'MIRAFLORES', 1),
(377, '04', '01', '08', 'MOLLEBAYA', 1),
(378, '04', '01', '09', 'PAUCARPATA', 1),
(379, '04', '01', '10', 'POCSI', 1),
(380, '04', '01', '11', 'POLOBAYA', 1),
(381, '04', '01', '12', 'QUEQUEÑA', 1),
(382, '04', '01', '13', 'SABANDIA', 1),
(383, '04', '01', '14', 'SACHACA', 1),
(384, '04', '01', '15', 'SAN JUAN DE SIGUAS', 1),
(385, '04', '01', '16', 'SAN JUAN DE TARUCANI', 1),
(386, '04', '01', '17', 'SANTA ISABEL DE SIGUAS', 1),
(387, '04', '01', '18', 'SANTA RITA DE SIHUAS', 1),
(388, '04', '01', '19', 'SOCABAYA', 1),
(389, '04', '01', '20', 'TIABAYA', 1),
(390, '04', '01', '21', 'UCHUMAYO', 1),
(391, '04', '01', '22', 'VITOR', 1),
(392, '04', '01', '23', 'YANAHUARA', 1),
(393, '04', '01', '24', 'YARABAMBA', 1),
(394, '04', '01', '25', 'YURA', 1),
(395, '04', '01', '26', 'MARIANO MELGAR', 1),
(396, '04', '01', '27', 'JACOBO HUNTER', 1),
(397, '04', '01', '28', 'ALTO SELVA ALEGRE', 1),
(398, '04', '01', '29', 'JOSE LUIS BUSTAMANTE Y RIVERO', 1),
(399, '04', '02', '00', 'CAYLLOMA', 1),
(400, '04', '02', '01', 'CHIVAY', 1),
(401, '04', '02', '02', 'ACHOMA', 1),
(402, '04', '02', '03', 'CABANACONDE', 1),
(403, '04', '02', '04', 'CAYLLOMA', 1),
(404, '04', '02', '05', 'CALLALLI', 1),
(405, '04', '02', '06', 'COPORAQUE', 1),
(406, '04', '02', '07', 'HUAMBO', 1),
(407, '04', '02', '08', 'HUANCA', 1),
(408, '04', '02', '09', 'ICHUPAMPA', 1),
(409, '04', '02', '10', 'LARI', 1),
(410, '04', '02', '11', 'LLUTA', 1),
(411, '04', '02', '12', 'MACA', 1),
(412, '04', '02', '13', 'MADRIGAL', 1),
(413, '04', '02', '14', 'SAN ANTONIO DE CHUCA', 1),
(414, '04', '02', '15', 'SIBAYO', 1),
(415, '04', '02', '16', 'TAPAY', 1),
(416, '04', '02', '17', 'TISCO', 1),
(417, '04', '02', '18', 'TUTI', 1),
(418, '04', '02', '19', 'YANQUE', 1),
(419, '04', '02', '20', 'MAJES', 1),
(420, '04', '03', '00', 'CAMANA', 1),
(421, '04', '03', '01', 'CAMANA', 1),
(422, '04', '03', '02', 'JOSE MARIA QUIMPER', 1),
(423, '04', '03', '03', 'MARIANO NICOLAS VALCARCEL', 1),
(424, '04', '03', '04', 'MARISCAL CACERES', 1),
(425, '04', '03', '05', 'NICOLAS DE PIEROLA', 1),
(426, '04', '03', '06', 'OCOÑA', 1),
(427, '04', '03', '07', 'QUILCA', 1),
(428, '04', '03', '08', 'SAMUEL PASTOR', 1),
(429, '04', '04', '00', 'CARAVELI', 1),
(430, '04', '04', '01', 'CARAVELI', 1),
(431, '04', '04', '02', 'ACARI', 1),
(432, '04', '04', '03', 'ATICO', 1),
(433, '04', '04', '04', 'ATIQUIPA', 1),
(434, '04', '04', '05', 'BELLA UNION', 1),
(435, '04', '04', '06', 'CAHUACHO', 1),
(436, '04', '04', '07', 'CHALA', 1),
(437, '04', '04', '08', 'CHAPARRA', 1),
(438, '04', '04', '09', 'HUANUHUANU', 1),
(439, '04', '04', '10', 'JAQUI', 1),
(440, '04', '04', '11', 'LOMAS', 1),
(441, '04', '04', '12', 'QUICACHA', 1),
(442, '04', '04', '13', 'YAUCA', 1),
(443, '04', '05', '00', 'CASTILLA', 1),
(444, '04', '05', '01', 'APLAO', 1),
(445, '04', '05', '02', 'ANDAGUA', 1),
(446, '04', '05', '03', 'AYO', 1),
(447, '04', '05', '04', 'CHACHAS', 1),
(448, '04', '05', '05', 'CHILCAYMARCA', 1),
(449, '04', '05', '06', 'CHOCO', 1),
(450, '04', '05', '07', 'HUANCARQUI', 1),
(451, '04', '05', '08', 'MACHAGUAY', 1),
(452, '04', '05', '09', 'ORCOPAMPA', 1),
(453, '04', '05', '10', 'PAMPACOLCA', 1),
(454, '04', '05', '11', 'TIPAN', 1),
(455, '04', '05', '12', 'URACA', 1),
(456, '04', '05', '13', 'UÑON', 1),
(457, '04', '05', '14', 'VIRACO', 1),
(458, '04', '06', '00', 'CONDESUYOS', 1),
(459, '04', '06', '01', 'CHUQUIBAMBA', 1),
(460, '04', '06', '02', 'ANDARAY', 1),
(461, '04', '06', '03', 'CAYARANI', 1),
(462, '04', '06', '04', 'CHICHAS', 1),
(463, '04', '06', '05', 'IRAY', 1),
(464, '04', '06', '06', 'SALAMANCA', 1),
(465, '04', '06', '07', 'YANAQUIHUA', 1),
(466, '04', '06', '08', 'RIO GRANDE', 1),
(467, '04', '07', '00', 'ISLAY', 1),
(468, '04', '07', '01', 'MOLLENDO', 1),
(469, '04', '07', '02', 'COCACHACRA', 1),
(470, '04', '07', '03', 'DEAN VALDIVIA', 1),
(471, '04', '07', '04', 'ISLAY', 1),
(472, '04', '07', '05', 'MEJIA', 1),
(473, '04', '07', '06', 'PUNTA DE BOMBON', 1),
(474, '04', '08', '00', 'LA UNION', 1),
(475, '04', '08', '01', 'COTAHUASI', 1),
(476, '04', '08', '02', 'ALCA', 1),
(477, '04', '08', '03', 'CHARCANA', 1),
(478, '04', '08', '04', 'HUAYNACOTAS', 1),
(479, '04', '08', '05', 'PAMPAMARCA', 1),
(480, '04', '08', '06', 'PUYCA', 1),
(481, '04', '08', '07', 'QUECHUALLA', 1),
(482, '04', '08', '08', 'SAYLA', 1),
(483, '04', '08', '09', 'TAURIA', 1),
(484, '04', '08', '10', 'TOMEPAMPA', 1),
(485, '04', '08', '11', 'TORO', 1),
(486, '05', '00', '00', 'AYACUCHO', 1),
(487, '05', '01', '00', 'HUAMANGA', 1),
(488, '05', '01', '01', 'AYACUCHO', 1),
(489, '05', '01', '02', 'ACOS VINCHOS', 1),
(490, '05', '01', '03', 'CARMEN ALTO', 1),
(491, '05', '01', '04', 'CHIARA', 1),
(492, '05', '01', '05', 'QUINUA', 1),
(493, '05', '01', '06', 'SAN JOSE DE TICLLAS', 1),
(494, '05', '01', '07', 'SAN JUAN BAUTISTA', 1),
(495, '05', '01', '08', 'SANTIAGO DE PISCHA', 1),
(496, '05', '01', '09', 'VINCHOS', 1),
(497, '05', '01', '10', 'TAMBILLO', 1),
(498, '05', '01', '11', 'ACOCRO', 1),
(499, '05', '01', '12', 'SOCOS', 1),
(500, '05', '01', '13', 'OCROS', 1),
(501, '05', '01', '14', 'PACAYCASA', 1),
(502, '05', '01', '15', 'JESUS NAZARENO', 1),
(503, '05', '02', '00', 'CANGALLO', 1),
(504, '05', '02', '01', 'CANGALLO', 1),
(505, '05', '02', '04', 'CHUSCHI', 1),
(506, '05', '02', '06', 'LOS MOROCHUCOS', 1),
(507, '05', '02', '07', 'PARAS', 1),
(508, '05', '02', '08', 'TOTOS', 1),
(509, '05', '02', '11', 'MARIA PARADO DE BELLIDO', 1),
(510, '05', '03', '00', 'HUANTA', 1),
(511, '05', '03', '01', 'HUANTA', 1),
(512, '05', '03', '02', 'AYAHUANCO', 1),
(513, '05', '03', '03', 'HUAMANGUILLA', 1),
(514, '05', '03', '04', 'IGUAIN', 1),
(515, '05', '03', '05', 'LURICOCHA', 1),
(516, '05', '03', '07', 'SANTILLANA', 1),
(517, '05', '03', '08', 'SIVIA', 1),
(518, '05', '03', '09', 'LLOCHEGUA', 1),
(519, '05', '04', '00', 'LA MAR', 1),
(520, '05', '04', '01', 'SAN MIGUEL', 1),
(521, '05', '04', '02', 'ANCO', 1),
(522, '05', '04', '03', 'AYNA', 1),
(523, '05', '04', '04', 'CHILCAS', 1),
(524, '05', '04', '05', 'CHUNGUI', 1),
(525, '05', '04', '06', 'TAMBO', 1),
(526, '05', '04', '07', 'LUIS CARRANZA', 1),
(527, '05', '04', '08', 'SANTA ROSA', 1),
(528, '05', '04', '09', 'SAMUGARI', 1),
(529, '05', '05', '00', 'LUCANAS', 1),
(530, '05', '05', '01', 'PUQUIO', 1),
(531, '05', '05', '02', 'AUCARA', 1),
(532, '05', '05', '03', 'CABANA', 1),
(533, '05', '05', '04', 'CARMEN SALCEDO', 1),
(534, '05', '05', '06', 'CHAVIÑA', 1),
(535, '05', '05', '08', 'CHIPAO', 1),
(536, '05', '05', '10', 'HUAC-HUAS', 1),
(537, '05', '05', '11', 'LARAMATE', 1),
(538, '05', '05', '12', 'LEONCIO PRADO', 1),
(539, '05', '05', '13', 'LUCANAS', 1),
(540, '05', '05', '14', 'LLAUTA', 1),
(541, '05', '05', '16', 'OCAÑA', 1),
(542, '05', '05', '17', 'OTOCA', 1),
(543, '05', '05', '20', 'SANCOS', 1),
(544, '05', '05', '21', 'SAN JUAN', 1),
(545, '05', '05', '22', 'SAN PEDRO', 1),
(546, '05', '05', '24', 'SANTA ANA DE HUAYCAHUACHO', 1),
(547, '05', '05', '25', 'SANTA LUCIA', 1),
(548, '05', '05', '29', 'SAISA', 1),
(549, '05', '05', '31', 'SAN PEDRO DE PALCO', 1),
(550, '05', '05', '32', 'SAN CRISTOBAL', 1),
(551, '05', '06', '00', 'PARINACOCHAS', 1),
(552, '05', '06', '01', 'CORACORA', 1),
(553, '05', '06', '04', 'CORONEL CASTAÑEDA', 1),
(554, '05', '06', '05', 'CHUMPI', 1),
(555, '05', '06', '08', 'PACAPAUSA', 1),
(556, '05', '06', '11', 'PULLO', 1),
(557, '05', '06', '12', 'PUYUSCA', 1),
(558, '05', '06', '15', 'SAN FRANCISCO DE RAVACAYCO', 1),
(559, '05', '06', '16', 'UPAHUACHO', 1),
(560, '05', '07', '00', 'VICTOR FAJARDO', 1),
(561, '05', '07', '01', 'HUANCAPI', 1),
(562, '05', '07', '02', 'ALCAMENCA', 1),
(563, '05', '07', '03', 'APONGO', 1),
(564, '05', '07', '04', 'CANARIA', 1),
(565, '05', '07', '06', 'CAYARA', 1),
(566, '05', '07', '07', 'COLCA', 1),
(567, '05', '07', '08', 'HUALLA', 1),
(568, '05', '07', '09', 'HUAMANQUIQUIA', 1),
(569, '05', '07', '10', 'HUANCARAYLLA', 1),
(570, '05', '07', '13', 'SARHUA', 1),
(571, '05', '07', '14', 'VILCANCHOS', 1),
(572, '05', '07', '15', 'ASQUIPATA', 1),
(573, '05', '08', '00', 'HUANCA SANCOS', 1),
(574, '05', '08', '01', 'SANCOS', 1),
(575, '05', '08', '02', 'SACSAMARCA', 1),
(576, '05', '08', '03', 'SANTIAGO DE LUCANAMARCA', 1),
(577, '05', '08', '04', 'CARAPO', 1),
(578, '05', '09', '00', 'VILCAS HUAMAN', 1),
(579, '05', '09', '01', 'VILCAS HUAMAN', 1),
(580, '05', '09', '02', 'VISCHONGO', 1),
(581, '05', '09', '03', 'ACCOMARCA', 1),
(582, '05', '09', '04', 'CARHUANCA', 1),
(583, '05', '09', '05', 'CONCEPCION', 1),
(584, '05', '09', '06', 'HUAMBALPA', 1),
(585, '05', '09', '07', 'SAURAMA', 1),
(586, '05', '09', '08', 'INDEPENDENCIA', 1),
(587, '05', '10', '00', 'PAUCAR DEL SARA SARA', 1),
(588, '05', '10', '01', 'PAUSA', 1),
(589, '05', '10', '02', 'COLTA', 1),
(590, '05', '10', '03', 'CORCULLA', 1),
(591, '05', '10', '04', 'LAMPA', 1),
(592, '05', '10', '05', 'MARCABAMBA', 1),
(593, '05', '10', '06', 'OYOLO', 1),
(594, '05', '10', '07', 'PARARCA', 1),
(595, '05', '10', '08', 'SAN JAVIER DE ALPABAMBA', 1),
(596, '05', '10', '09', 'SAN JOSE DE USHUA', 1),
(597, '05', '10', '10', 'SARA SARA', 1),
(598, '05', '11', '00', 'SUCRE', 1),
(599, '05', '11', '01', 'QUEROBAMBA', 1),
(600, '05', '11', '02', 'BELEN', 1),
(601, '05', '11', '03', 'CHALCOS', 1),
(602, '05', '11', '04', 'SAN SALVADOR DE QUIJE', 1),
(603, '05', '11', '05', 'PAICO', 1),
(604, '05', '11', '06', 'SANTIAGO DE PAUCARAY', 1),
(605, '05', '11', '07', 'SAN PEDRO DE LARCAY', 1),
(606, '05', '11', '08', 'SORAS', 1),
(607, '05', '11', '09', 'HUACAÑA', 1),
(608, '05', '11', '10', 'CHILCAYOC', 1),
(609, '05', '11', '11', 'MORCOLLA', 1),
(610, '06', '00', '00', 'CAJAMARCA', 1),
(611, '06', '01', '00', 'CAJAMARCA', 1),
(612, '06', '01', '01', 'CAJAMARCA', 1),
(613, '06', '01', '02', 'ASUNCION', 1),
(614, '06', '01', '03', 'COSPAN', 1),
(615, '06', '01', '04', 'CHETILLA', 1),
(616, '06', '01', '05', 'ENCAÑADA', 1),
(617, '06', '01', '06', 'JESUS', 1),
(618, '06', '01', '07', 'LOS BAÑOS DEL INCA', 1),
(619, '06', '01', '08', 'LLACANORA', 1),
(620, '06', '01', '09', 'MAGDALENA', 1),
(621, '06', '01', '10', 'MATARA', 1),
(622, '06', '01', '11', 'NAMORA', 1),
(623, '06', '01', '12', 'SAN JUAN', 1),
(624, '06', '02', '00', 'CAJABAMBA', 1),
(625, '06', '02', '01', 'CAJABAMBA', 1),
(626, '06', '02', '02', 'CACHACHI', 1),
(627, '06', '02', '03', 'CONDEBAMBA', 1),
(628, '06', '02', '05', 'SITACOCHA', 1),
(629, '06', '03', '00', 'CELENDIN', 1),
(630, '06', '03', '01', 'CELENDIN', 1),
(631, '06', '03', '02', 'CORTEGANA', 1),
(632, '06', '03', '03', 'CHUMUCH', 1),
(633, '06', '03', '04', 'HUASMIN', 1),
(634, '06', '03', '05', 'JORGE CHAVEZ', 1),
(635, '06', '03', '06', 'JOSE GALVEZ', 1),
(636, '06', '03', '07', 'MIGUEL IGLESIAS', 1),
(637, '06', '03', '08', 'OXAMARCA', 1),
(638, '06', '03', '09', 'SOROCHUCO', 1),
(639, '06', '03', '10', 'SUCRE', 1),
(640, '06', '03', '11', 'UTCO', 1),
(641, '06', '03', '12', 'LA LIBERTAD DE PALLAN', 1),
(642, '06', '04', '00', 'CONTUMAZA', 1),
(643, '06', '04', '01', 'CONTUMAZA', 1),
(644, '06', '04', '03', 'CHILETE', 1),
(645, '06', '04', '04', 'GUZMANGO', 1),
(646, '06', '04', '05', 'SAN BENITO', 1),
(647, '06', '04', '06', 'CUPISNIQUE', 1),
(648, '06', '04', '07', 'TANTARICA', 1),
(649, '06', '04', '08', 'YONAN', 1),
(650, '06', '04', '09', 'SANTA CRUZ DE TOLED', 1),
(651, '06', '05', '00', 'CUTERVO', 1),
(652, '06', '05', '01', 'CUTERVO', 1),
(653, '06', '05', '02', 'CALLAYUC', 1),
(654, '06', '05', '03', 'CUJILLO', 1),
(655, '06', '05', '04', 'CHOROS', 1),
(656, '06', '05', '05', 'LA RAMADA', 1),
(657, '06', '05', '06', 'PIMPINGOS', 1),
(658, '06', '05', '07', 'QUEROCOTILLO', 1),
(659, '06', '05', '08', 'SAN ANDRES DE CUTERVO', 1),
(660, '06', '05', '09', 'SAN JUAN DE CUTERVO', 1),
(661, '06', '05', '10', 'SAN LUIS DE LUCMA', 1),
(662, '06', '05', '11', 'SANTA CRUZ', 1),
(663, '06', '05', '12', 'SANTO DOMINGO DE LA CAPILLA', 1),
(664, '06', '05', '13', 'SANTO TOMAS', 1),
(665, '06', '05', '14', 'SOCOTA', 1),
(666, '06', '05', '15', 'TORIBIO CASANOVA', 1),
(667, '06', '06', '00', 'CHOTA', 1),
(668, '06', '06', '01', 'CHOTA', 1),
(669, '06', '06', '02', 'ANGUIA', 1),
(670, '06', '06', '03', 'COCHABAMBA', 1),
(671, '06', '06', '04', 'CONCHAN', 1),
(672, '06', '06', '05', 'CHADIN', 1),
(673, '06', '06', '06', 'CHIGUIRIP', 1),
(674, '06', '06', '07', 'CHIMBAN', 1),
(675, '06', '06', '08', 'HUAMBOS', 1),
(676, '06', '06', '09', 'LAJAS', 1),
(677, '06', '06', '10', 'LLAMA', 1),
(678, '06', '06', '11', 'MIRACOSTA', 1),
(679, '06', '06', '12', 'PACCHA', 1),
(680, '06', '06', '13', 'PION', 1),
(681, '06', '06', '14', 'QUEROCOTO', 1),
(682, '06', '06', '15', 'TACABAMBA', 1),
(683, '06', '06', '16', 'TOCMOCHE', 1),
(684, '06', '06', '17', 'SAN JUAN DE LICUPIS', 1),
(685, '06', '06', '18', 'CHOROPAMPA', 1),
(686, '06', '06', '19', 'CHALAMARCA', 1),
(687, '06', '07', '00', 'HUALGAYOC', 1),
(688, '06', '07', '01', 'BAMBAMARCA', 1),
(689, '06', '07', '02', 'CHUGUR', 1),
(690, '06', '07', '03', 'HUALGAYOC', 1),
(691, '06', '08', '00', 'JAEN', 1),
(692, '06', '08', '01', 'JAEN', 1),
(693, '06', '08', '02', 'BELLAVISTA', 1),
(694, '06', '08', '03', 'COLASAY', 1),
(695, '06', '08', '04', 'CHONTALI', 1),
(696, '06', '08', '05', 'POMAHUACA', 1),
(697, '06', '08', '06', 'PUCARA', 1),
(698, '06', '08', '07', 'SALLIQUE', 1),
(699, '06', '08', '08', 'SAN FELIPE', 1),
(700, '06', '08', '09', 'SAN JOSE DEL ALTO', 1),
(701, '06', '08', '10', 'SANTA ROSA', 1),
(702, '06', '08', '11', 'LAS PIRIAS', 1),
(703, '06', '08', '12', 'HUABAL', 1),
(704, '06', '09', '00', 'SANTA CRUZ', 1),
(705, '06', '09', '01', 'SANTA CRUZ', 1),
(706, '06', '09', '02', 'CATACHE', 1),
(707, '06', '09', '03', 'CHANCAYBAÑOS', 1),
(708, '06', '09', '04', 'LA ESPERANZA', 1),
(709, '06', '09', '05', 'NINABAMBA', 1),
(710, '06', '09', '06', 'PULAN', 1),
(711, '06', '09', '07', 'SEXI', 1),
(712, '06', '09', '08', 'UTICYACU', 1),
(713, '06', '09', '09', 'YAUYUCAN', 1),
(714, '06', '09', '10', 'ANDABAMBA', 1),
(715, '06', '09', '11', 'SAUCEPAMPA', 1),
(716, '06', '10', '00', 'SAN MIGUEL', 1),
(717, '06', '10', '01', 'SAN MIGUEL', 1),
(718, '06', '10', '02', 'CALQUIS', 1),
(719, '06', '10', '03', 'LA FLORIDA', 1),
(720, '06', '10', '04', 'LLAPA', 1),
(721, '06', '10', '05', 'NANCHOC', 1),
(722, '06', '10', '06', 'NIEPOS', 1),
(723, '06', '10', '07', 'SAN GREGORIO', 1),
(724, '06', '10', '08', 'SAN SILVESTRE DE COCHAN', 1),
(725, '06', '10', '09', 'EL PRADO', 1),
(726, '06', '10', '10', 'UNION AGUA BLANCA', 1),
(727, '06', '10', '11', 'TONGOD', 1),
(728, '06', '10', '12', 'CATILLUC', 1),
(729, '06', '10', '13', 'BOLIVAR', 1),
(730, '06', '11', '00', 'SAN IGNACIO', 1),
(731, '06', '11', '01', 'SAN IGNACIO', 1),
(732, '06', '11', '02', 'CHIRINOS', 1),
(733, '06', '11', '03', 'HUARANGO', 1),
(734, '06', '11', '04', 'NAMBALLE', 1),
(735, '06', '11', '05', 'LA COIPA', 1),
(736, '06', '11', '06', 'SAN JOSE DE LOURDES', 1),
(737, '06', '11', '07', 'TABACONAS', 1),
(738, '06', '12', '00', 'SAN MARCOS', 1),
(739, '06', '12', '01', 'PEDRO GALVEZ', 1),
(740, '06', '12', '02', 'ICHOCAN', 1),
(741, '06', '12', '03', 'GREGORIO PITA', 1),
(742, '06', '12', '04', 'JOSE MANUEL QUIROZ', 1),
(743, '06', '12', '05', 'EDUARDO VILLANUEVA', 1),
(744, '06', '12', '06', 'JOSE SABOGAL', 1),
(745, '06', '12', '07', 'CHANCAY', 1),
(746, '06', '13', '00', 'SAN PABLO', 1),
(747, '06', '13', '01', 'SAN PABLO', 1),
(748, '06', '13', '02', 'SAN BERNARDINO', 1),
(749, '06', '13', '03', 'SAN LUIS', 1),
(750, '06', '13', '04', 'TUMBADEN', 1),
(751, '07', '00', '00', 'CUSCO', 1),
(752, '07', '01', '00', 'CUSCO', 1),
(753, '07', '01', '01', 'CUSCO', 1),
(754, '07', '01', '02', 'CCORCA', 1),
(755, '07', '01', '03', 'POROY', 1),
(756, '07', '01', '04', 'SAN JERONIMO', 1),
(757, '07', '01', '05', 'SAN SEBASTIAN', 1),
(758, '07', '01', '06', 'SANTIAGO', 1),
(759, '07', '01', '07', 'SAYLLA', 1),
(760, '07', '01', '08', 'WANCHAQ', 1),
(761, '07', '02', '00', 'ACOMAYO', 1),
(762, '07', '02', '01', 'ACOMAYO', 1),
(763, '07', '02', '02', 'ACOPIA', 1),
(764, '07', '02', '03', 'ACOS', 1),
(765, '07', '02', '04', 'POMACANCHI', 1),
(766, '07', '02', '05', 'RONDOCAN', 1),
(767, '07', '02', '06', 'SANGARARA', 1),
(768, '07', '02', '07', 'MOSOC LLACTA', 1),
(769, '07', '03', '00', 'ANTA', 1),
(770, '07', '03', '01', 'ANTA', 1),
(771, '07', '03', '02', 'CHINCHAYPUJIO', 1),
(772, '07', '03', '03', 'HUAROCONDO', 1),
(773, '07', '03', '04', 'LIMATAMBO', 1),
(774, '07', '03', '05', 'MOLLEPATA', 1),
(775, '07', '03', '06', 'PUCYURA', 1),
(776, '07', '03', '07', 'ZURITE', 1),
(777, '07', '03', '08', 'CACHIMAYO', 1),
(778, '07', '03', '09', 'ANCAHUASI', 1),
(779, '07', '04', '00', 'CALCA', 1),
(780, '07', '04', '01', 'CALCA', 1),
(781, '07', '04', '02', 'COYA', 1),
(782, '07', '04', '03', 'LAMAY', 1),
(783, '07', '04', '04', 'LARES', 1),
(784, '07', '04', '05', 'PISAC', 1),
(785, '07', '04', '06', 'SAN SALVADOR', 1),
(786, '07', '04', '07', 'TARAY', 1),
(787, '07', '04', '08', 'YANATILE', 1),
(788, '07', '05', '00', 'CANAS', 1),
(789, '07', '05', '01', 'YANAOCA', 1),
(790, '07', '05', '02', 'CHECCA', 1),
(791, '07', '05', '03', 'KUNTURKANKI', 1),
(792, '07', '05', '04', 'LANGUI', 1),
(793, '07', '05', '05', 'LAYO', 1),
(794, '07', '05', '06', 'PAMPAMARCA', 1),
(795, '07', '05', '07', 'QUEHUE', 1),
(796, '07', '05', '08', 'TUPAC AMARU', 1),
(797, '07', '06', '00', 'CANCHIS', 1),
(798, '07', '06', '01', 'SICUANI', 1),
(799, '07', '06', '02', 'COMBAPATA', 1),
(800, '07', '06', '03', 'CHECACUPE', 1),
(801, '07', '06', '04', 'MARANGANI', 1),
(802, '07', '06', '05', 'PITUMARCA', 1),
(803, '07', '06', '06', 'SAN PABLO', 1),
(804, '07', '06', '07', 'SAN PEDRO', 1),
(805, '07', '06', '08', 'TINTA', 1),
(806, '07', '07', '00', 'CHUMBIVILCAS', 1),
(807, '07', '07', '01', 'SANTO TOMAS', 1),
(808, '07', '07', '02', 'CAPACMARCA', 1),
(809, '07', '07', '03', 'COLQUEMARCA', 1),
(810, '07', '07', '04', 'CHAMACA', 1),
(811, '07', '07', '05', 'LIVITACA', 1),
(812, '07', '07', '06', 'LLUSCO', 1),
(813, '07', '07', '07', 'QUIÑOTA', 1),
(814, '07', '07', '08', 'VELILLE', 1),
(815, '07', '08', '00', 'ESPINAR', 1),
(816, '07', '08', '01', 'ESPINAR', 1),
(817, '07', '08', '02', 'CONDOROMA', 1),
(818, '07', '08', '03', 'COPORAQUE', 1),
(819, '07', '08', '04', 'OCORURO', 1),
(820, '07', '08', '05', 'PALLPATA', 1),
(821, '07', '08', '06', 'PICHIGUA', 1),
(822, '07', '08', '07', 'SUYCKUTAMBO', 1),
(823, '07', '08', '08', 'ALTO PICHIGUA', 1),
(824, '07', '09', '00', 'LA CONVENCION', 1),
(825, '07', '09', '01', 'SANTA ANA', 1),
(826, '07', '09', '02', 'ECHARATE', 1),
(827, '07', '09', '03', 'HUAYOPATA', 1),
(828, '07', '09', '04', 'MARANURA', 1),
(829, '07', '09', '05', 'OCOBAMBA', 1),
(830, '07', '09', '06', 'SANTA TERESA', 1),
(831, '07', '09', '07', 'VILCABAMBA', 1),
(832, '07', '09', '08', 'QUELLOUNO', 1),
(833, '07', '09', '09', 'KIMBIRI', 1),
(834, '07', '09', '10', 'PICHARI', 1),
(835, '07', '10', '00', 'PARURO', 1),
(836, '07', '10', '01', 'PARURO', 1),
(837, '07', '10', '02', 'ACCHA', 1),
(838, '07', '10', '03', 'CCAPI', 1),
(839, '07', '10', '04', 'COLCHA', 1),
(840, '07', '10', '05', 'HUANOQUITE', 1),
(841, '07', '10', '06', 'OMACHA', 1),
(842, '07', '10', '07', 'YAURISQUE', 1),
(843, '07', '10', '08', 'PACCARITAMBO', 1),
(844, '07', '10', '09', 'PILLPINTO', 1),
(845, '07', '11', '00', 'PAUCARTAMBO', 1),
(846, '07', '11', '01', 'PAUCARTAMBO', 1),
(847, '07', '11', '02', 'CAICAY', 1),
(848, '07', '11', '03', 'COLQUEPATA', 1),
(849, '07', '11', '04', 'CHALLABAMBA', 1),
(850, '07', '11', '05', 'KOSÑIPATA', 1),
(851, '07', '11', '06', 'HUANCARANI', 1),
(852, '07', '12', '00', 'QUISPICANCHI', 1),
(853, '07', '12', '01', 'URCOS', 1),
(854, '07', '12', '02', 'ANDAHUAYLILLAS', 1),
(855, '07', '12', '03', 'CAMANTI', 1),
(856, '07', '12', '04', 'CCARHUAYO', 1),
(857, '07', '12', '05', 'CCATCA', 1),
(858, '07', '12', '06', 'CUSIPATA', 1),
(859, '07', '12', '07', 'HUARO', 1),
(860, '07', '12', '08', 'LUCRE', 1),
(861, '07', '12', '09', 'MARCAPATA', 1),
(862, '07', '12', '10', 'OCONGATE', 1),
(863, '07', '12', '11', 'OROPESA', 1),
(864, '07', '12', '12', 'QUIQUIJANA', 1),
(865, '07', '13', '00', 'URUBAMBA', 1),
(866, '07', '13', '01', 'URUBAMBA', 1),
(867, '07', '13', '02', 'CHINCHERO', 1),
(868, '07', '13', '03', 'HUAYLLABAMBA', 1),
(869, '07', '13', '04', 'MACHUPICCHU', 1),
(870, '07', '13', '05', 'MARAS', 1),
(871, '07', '13', '06', 'OLLANTAYTAMBO', 1),
(872, '07', '13', '07', 'YUCAY', 1),
(873, '08', '00', '00', 'HUANCAVELICA', 1),
(874, '08', '01', '00', 'HUANCAVELICA', 1),
(875, '08', '01', '01', 'HUANCAVELICA', 1),
(876, '08', '01', '02', 'ACOBAMBILLA', 1),
(877, '08', '01', '03', 'ACORIA', 1),
(878, '08', '01', '04', 'CONAYCA', 1),
(879, '08', '01', '05', 'CUENCA', 1),
(880, '08', '01', '06', 'HUACHOCOLPA', 1),
(881, '08', '01', '08', 'HUAYLLAHUARA', 1),
(882, '08', '01', '09', 'IZCUCHACA', 1),
(883, '08', '01', '10', 'LARIA', 1),
(884, '08', '01', '11', 'MANTA', 1),
(885, '08', '01', '12', 'MARISCAL CACERES', 1),
(886, '08', '01', '13', 'MOYA', 1),
(887, '08', '01', '14', 'NUEVO OCCORO', 1),
(888, '08', '01', '15', 'PALCA', 1),
(889, '08', '01', '16', 'PILCHACA', 1),
(890, '08', '01', '17', 'VILCA', 1),
(891, '08', '01', '18', 'YAULI', 1),
(892, '08', '01', '19', 'ASCENSION', 1),
(893, '08', '01', '20', 'HUANDO', 1),
(894, '08', '02', '00', 'ACOBAMBA', 1),
(895, '08', '02', '01', 'ACOBAMBA', 1),
(896, '08', '02', '02', 'ANTA', 1),
(897, '08', '02', '03', 'ANDABAMBA', 1),
(898, '08', '02', '04', 'CAJA', 1),
(899, '08', '02', '05', 'MARCAS', 1),
(900, '08', '02', '06', 'PAUCARA', 1),
(901, '08', '02', '07', 'POMACOCHA', 1),
(902, '08', '02', '08', 'ROSARIO', 1),
(903, '08', '03', '00', 'ANGARAES', 1),
(904, '08', '03', '01', 'LIRCAY', 1),
(905, '08', '03', '02', 'ANCHONGA', 1),
(906, '08', '03', '03', 'CALLANMARCA', 1),
(907, '08', '03', '04', 'CONGALLA', 1),
(908, '08', '03', '05', 'CHINCHO', 1),
(909, '08', '03', '06', 'HUALLAY-GRANDE', 1),
(910, '08', '03', '07', 'HUANCA-HUANCA', 1),
(911, '08', '03', '08', 'JULCAMARCA', 1),
(912, '08', '03', '09', 'SAN ANTONIO DE ANTAPARCO', 1),
(913, '08', '03', '10', 'SANTO TOMAS DE PATA', 1),
(914, '08', '03', '11', 'SECCLLA', 1),
(915, '08', '03', '12', 'CCOCHACCASA', 1),
(916, '08', '04', '00', 'CASTROVIRREYNA', 1),
(917, '08', '04', '01', 'CASTROVIRREYNA', 1),
(918, '08', '04', '02', 'ARMA', 1),
(919, '08', '04', '03', 'AURAHUA', 1),
(920, '08', '04', '05', 'CAPILLAS', 1),
(921, '08', '04', '06', 'COCAS', 1),
(922, '08', '04', '08', 'CHUPAMARCA', 1),
(923, '08', '04', '09', 'HUACHOS', 1),
(924, '08', '04', '10', 'HUAMATAMBO', 1),
(925, '08', '04', '14', 'MOLLEPAMPA', 1),
(926, '08', '04', '22', 'SAN JUAN', 1),
(927, '08', '04', '27', 'TANTARA', 1),
(928, '08', '04', '28', 'TICRAPO', 1),
(929, '08', '04', '29', 'SANTA ANA', 1),
(930, '08', '05', '00', 'TAYACAJA', 1),
(931, '08', '05', '01', 'PAMPAS', 1),
(932, '08', '05', '02', 'ACOSTAMBO', 1),
(933, '08', '05', '03', 'ACRAQUIA', 1),
(934, '08', '05', '04', 'AHUAYCHA', 1),
(935, '08', '05', '06', 'COLCABAMBA', 1),
(936, '08', '05', '09', 'DANIEL HERNANDEZ', 1),
(937, '08', '05', '11', 'HUACHOCOLPA', 1),
(938, '08', '05', '12', 'HUARIBAMBA', 1),
(939, '08', '05', '15', 'ÑAHUIMPUQUIO', 1),
(940, '08', '05', '17', 'PAZOS', 1),
(941, '08', '05', '18', 'QUISHUAR', 1),
(942, '08', '05', '19', 'SALCABAMBA', 1),
(943, '08', '05', '20', 'SAN MARCOS DE ROCCHAC', 1),
(944, '08', '05', '23', 'SURCUBAMBA', 1),
(945, '08', '05', '25', 'TINTAY PUNCU', 1),
(946, '08', '05', '26', 'SALCAHUASI', 1),
(947, '08', '06', '00', 'HUAYTARA', 1),
(948, '08', '06', '01', 'AYAVI', 1),
(949, '08', '06', '02', 'CORDOVA', 1),
(950, '08', '06', '03', 'HUAYACUNDO ARMA', 1),
(951, '08', '06', '04', 'HUAYTARA', 1),
(952, '08', '06', '05', 'LARAMARCA', 1),
(953, '08', '06', '06', 'OCOYO', 1),
(954, '08', '06', '07', 'PILPICHACA', 1),
(955, '08', '06', '08', 'QUERCO', 1),
(956, '08', '06', '09', 'QUITO ARMA', 1),
(957, '08', '06', '10', 'SAN ANTONIO DE CUSICANCHA', 1),
(958, '08', '06', '11', 'SAN FRANCISCO DE SANGAYAICO', 1),
(959, '08', '06', '12', 'SAN ISIDRO', 1),
(960, '08', '06', '13', 'SANTIAGO DE CHOCORVOS', 1),
(961, '08', '06', '14', 'SANTIAGO DE QUIRAHUARA', 1),
(962, '08', '06', '15', 'SANTO DOMINGO DE CAPILLAS', 1),
(963, '08', '06', '16', 'TAMBO', 1),
(964, '08', '07', '00', 'CHURCAMPA', 1),
(965, '08', '07', '01', 'CHURCAMPA', 1),
(966, '08', '07', '02', 'ANCO', 1),
(967, '08', '07', '03', 'CHINCHIHUASI', 1),
(968, '08', '07', '04', 'EL CARMEN', 1),
(969, '08', '07', '05', 'LA MERCED', 1),
(970, '08', '07', '06', 'LOCROJA', 1),
(971, '08', '07', '07', 'PAUCARBAMBA', 1),
(972, '08', '07', '08', 'SAN MIGUEL DE MAYOCC', 1),
(973, '08', '07', '09', 'SAN PEDRO DE CORIS', 1),
(974, '08', '07', '10', 'PACHAMARCA', 1),
(975, '08', '07', '11', 'COSME', 1),
(976, '09', '00', '00', 'HUANUCO', 1),
(977, '09', '01', '00', 'HUANUCO', 1),
(978, '09', '01', '01', 'HUANUCO', 1),
(979, '09', '01', '02', 'CHINCHAO', 1),
(980, '09', '01', '03', 'CHURUBAMBA', 1),
(981, '09', '01', '04', 'MARGOS', 1),
(982, '09', '01', '05', 'QUISQUI', 1),
(983, '09', '01', '06', 'SAN FRANCISCO DE CAYRAN', 1),
(984, '09', '01', '07', 'SAN PEDRO DE CHAULAN', 1),
(985, '09', '01', '08', 'SANTA MARIA DEL VALLE', 1),
(986, '09', '01', '09', 'YARUMAYO', 1),
(987, '09', '01', '10', 'AMARILIS', 1),
(988, '09', '01', '11', 'PILLCO MARCA', 1),
(989, '09', '01', '12', 'YACUS', 1),
(990, '09', '02', '00', 'AMBO', 1),
(991, '09', '02', '01', 'AMBO', 1),
(992, '09', '02', '02', 'CAYNA', 1),
(993, '09', '02', '03', 'COLPAS', 1),
(994, '09', '02', '04', 'CONCHAMARCA', 1),
(995, '09', '02', '05', 'HUACAR', 1),
(996, '09', '02', '06', 'SAN FRANCISCO', 1),
(997, '09', '02', '07', 'SAN RAFAEL', 1),
(998, '09', '02', '08', 'TOMAY-KICHWA', 1),
(999, '09', '03', '00', 'DOS DE MAYO', 1),
(1000, '09', '03', '01', 'LA UNION', 1),
(1001, '09', '03', '07', 'CHUQUIS', 1),
(1002, '09', '03', '12', 'MARIAS', 1),
(1003, '09', '03', '14', 'PACHAS', 1),
(1004, '09', '03', '16', 'QUIVILLA', 1),
(1005, '09', '03', '17', 'RIPAN', 1),
(1006, '09', '03', '21', 'SHUNQUI', 1),
(1007, '09', '03', '22', 'SILLAPATA', 1),
(1008, '09', '03', '23', 'YANAS', 1),
(1009, '09', '04', '00', 'HUAMALIES', 1),
(1010, '09', '04', '01', 'LLATA', 1),
(1011, '09', '04', '02', 'ARANCAY', 1),
(1012, '09', '04', '03', 'CHAVIN DE PARIARCA', 1),
(1013, '09', '04', '04', 'JACAS GRANDE', 1),
(1014, '09', '04', '05', 'JIRCAN', 1),
(1015, '09', '04', '06', 'MIRAFLORES', 1),
(1016, '09', '04', '07', 'MONZON', 1),
(1017, '09', '04', '08', 'PUNCHAO', 1),
(1018, '09', '04', '09', 'PUÑOS', 1),
(1019, '09', '04', '10', 'SINGA', 1),
(1020, '09', '04', '11', 'TANTAMAYO', 1),
(1021, '09', '05', '00', 'MARAÑON', 1),
(1022, '09', '05', '01', 'HUACRACHUCO', 1),
(1023, '09', '05', '02', 'CHOLON', 1),
(1024, '09', '05', '05', 'SAN BUENAVENTURA', 1),
(1025, '09', '06', '00', 'LEONCIO PRADO', 1),
(1026, '09', '06', '01', 'RUPA-RUPA', 1),
(1027, '09', '06', '02', 'DANIEL ALOMIA ROBLES', 1),
(1028, '09', '06', '03', 'HERMILIO VALDIZAN', 1),
(1029, '09', '06', '04', 'LUYANDO', 1),
(1030, '09', '06', '05', 'MARIANO DAMASO BERAUN', 1),
(1031, '09', '06', '06', 'JOSE CRESPO Y CASTILLO', 1),
(1032, '09', '07', '00', 'PACHITEA', 1),
(1033, '09', '07', '01', 'PANAO', 1),
(1034, '09', '07', '02', 'CHAGLLA', 1),
(1035, '09', '07', '04', 'MOLINO', 1),
(1036, '09', '07', '06', 'UMARI', 1),
(1037, '09', '08', '00', 'PUERTO INCA', 1),
(1038, '09', '08', '01', 'HONORIA', 1),
(1039, '09', '08', '02', 'PUERTO INCA', 1),
(1040, '09', '08', '03', 'CODO DEL POZUZO', 1),
(1041, '09', '08', '04', 'TOURNAVISTA', 1),
(1042, '09', '08', '05', 'YUYAPICHIS', 1),
(1043, '09', '09', '00', 'HUACAYBAMBA', 1),
(1044, '09', '09', '01', 'HUACAYBAMBA', 1),
(1045, '09', '09', '02', 'PINRA', 1),
(1046, '09', '09', '03', 'CANCHABAMBA', 1),
(1047, '09', '09', '04', 'COCHABAMBA', 1),
(1048, '09', '10', '00', 'LAURICOCHA', 1),
(1049, '09', '10', '01', 'JESUS', 1),
(1050, '09', '10', '02', 'BAÑOS', 1),
(1051, '09', '10', '03', 'SAN FRANCISCO DE ASIS', 1),
(1052, '09', '10', '04', 'QUEROPALCA', 1),
(1053, '09', '10', '05', 'SAN MIGUEL DE CAURI', 1),
(1054, '09', '10', '06', 'RONDOS', 1),
(1055, '09', '10', '07', 'JIVIA', 1),
(1056, '09', '11', '00', 'YAROWILCA', 1),
(1057, '09', '11', '01', 'CHAVINILLO', 1),
(1058, '09', '11', '02', 'APARICIO POMARES', 1),
(1059, '09', '11', '03', 'CAHUAC', 1),
(1060, '09', '11', '04', 'CHACABAMBA', 1),
(1061, '09', '11', '05', 'JACAS CHICO', 1),
(1062, '09', '11', '06', 'OBAS', 1),
(1063, '09', '11', '07', 'PAMPAMARCA', 1),
(1064, '09', '11', '08', 'CHORAS', 1),
(1065, '10', '00', '00', 'ICA', 1),
(1066, '10', '01', '00', 'ICA', 1),
(1067, '10', '01', '01', 'ICA', 1),
(1068, '10', '01', '02', 'LA TINGUIÑA', 1),
(1069, '10', '01', '03', 'LOS AQUIJES', 1),
(1070, '10', '01', '04', 'PARCONA', 1),
(1071, '10', '01', '05', 'PUEBLO NUEVO', 1),
(1072, '10', '01', '06', 'SALAS', 1),
(1073, '10', '01', '07', 'SAN JOSE DE LOS MOLINOS', 1),
(1074, '10', '01', '08', 'SAN JUAN BAUTISTA', 1),
(1075, '10', '01', '09', 'SANTIAGO', 1),
(1076, '10', '01', '10', 'SUBTANJALLA', 1),
(1077, '10', '01', '11', 'YAUCA DEL ROSARIO', 1),
(1078, '10', '01', '12', 'TATE', 1),
(1079, '10', '01', '13', 'PACHACUTEC', 1),
(1080, '10', '01', '14', 'OCUCAJE', 1),
(1081, '10', '02', '00', 'CHINCHA', 1),
(1082, '10', '02', '01', 'CHINCHA ALTA', 1),
(1083, '10', '02', '02', 'CHAVIN', 1),
(1084, '10', '02', '03', 'CHINCHA BAJA', 1),
(1085, '10', '02', '04', 'EL CARMEN', 1),
(1086, '10', '02', '05', 'GROCIO PRADO', 1),
(1087, '10', '02', '06', 'SAN PEDRO DE HUACARPANA', 1),
(1088, '10', '02', '07', 'SUNAMPE', 1),
(1089, '10', '02', '08', 'TAMBO DE MORA', 1),
(1090, '10', '02', '09', 'ALTO LARAN', 1),
(1091, '10', '02', '10', 'PUEBLO NUEVO', 1),
(1092, '10', '02', '11', 'SAN JUAN DE YANAC', 1),
(1093, '10', '03', '00', 'NAZCA', 1),
(1094, '10', '03', '01', 'NAZCA', 1),
(1095, '10', '03', '02', 'CHANGUILLO', 1),
(1096, '10', '03', '03', 'EL INGENIO', 1),
(1097, '10', '03', '04', 'MARCONA', 1),
(1098, '10', '03', '05', 'VISTA ALEGRE', 1),
(1099, '10', '04', '00', 'PISCO', 1),
(1100, '10', '04', '01', 'PISCO', 1),
(1101, '10', '04', '02', 'HUANCANO', 1),
(1102, '10', '04', '03', 'HUMAY', 1),
(1103, '10', '04', '04', 'INDEPENDENCIA', 1),
(1104, '10', '04', '05', 'PARACAS', 1),
(1105, '10', '04', '06', 'SAN ANDRES', 1),
(1106, '10', '04', '07', 'SAN CLEMENTE', 1),
(1107, '10', '04', '08', 'TUPAC AMARU INCA', 1),
(1108, '10', '05', '00', 'PALPA', 1),
(1109, '10', '05', '01', 'PALPA', 1),
(1110, '10', '05', '02', 'LLIPATA', 1),
(1111, '10', '05', '03', 'RIO GRANDE', 1),
(1112, '10', '05', '04', 'SANTA CRUZ', 1),
(1113, '10', '05', '05', 'TIBILLO', 1),
(1114, '11', '00', '00', 'JUNIN', 1),
(1115, '11', '01', '00', 'HUANCAYO', 1),
(1116, '11', '01', '01', 'HUANCAYO', 1),
(1117, '11', '01', '03', 'CARHUACALLANGA', 1),
(1118, '11', '01', '04', 'COLCA', 1),
(1119, '11', '01', '05', 'CULLHUAS', 1),
(1120, '11', '01', '06', 'CHACAPAMPA', 1),
(1121, '11', '01', '07', 'CHICCHE', 1),
(1122, '11', '01', '08', 'CHILCA', 1),
(1123, '11', '01', '09', 'CHONGOS ALTO', 1),
(1124, '11', '01', '12', 'CHUPURO', 1),
(1125, '11', '01', '13', 'EL TAMBO', 1),
(1126, '11', '01', '14', 'HUACRAPUQUIO', 1),
(1127, '11', '01', '16', 'HUALHUAS', 1),
(1128, '11', '01', '18', 'HUANCAN', 1),
(1129, '11', '01', '19', 'HUASICANCHA', 1),
(1130, '11', '01', '20', 'HUAYUCACHI', 1),
(1131, '11', '01', '21', 'INGENIO', 1),
(1132, '11', '01', '22', 'PARIAHUANCA', 1),
(1133, '11', '01', '23', 'PILCOMAYO', 1),
(1134, '11', '01', '24', 'PUCARA', 1),
(1135, '11', '01', '25', 'QUICHUAY', 1),
(1136, '11', '01', '26', 'QUILCAS', 1),
(1137, '11', '01', '27', 'SAN AGUSTIN', 1),
(1138, '11', '01', '28', 'SAN JERONIMO DE TUNAN', 1),
(1139, '11', '01', '31', 'SANTO DOMINGO DE ACOBAMBA', 1),
(1140, '11', '01', '32', 'SAÑO', 1),
(1141, '11', '01', '33', 'SAPALLANGA', 1),
(1142, '11', '01', '34', 'SICAYA', 1),
(1143, '11', '01', '36', 'VIQUES', 1),
(1144, '11', '02', '00', 'CONCEPCION', 1),
(1145, '11', '02', '01', 'CONCEPCION', 1),
(1146, '11', '02', '02', 'ACO', 1),
(1147, '11', '02', '03', 'ANDAMARCA', 1),
(1148, '11', '02', '04', 'COMAS', 1),
(1149, '11', '02', '05', 'COCHAS', 1),
(1150, '11', '02', '06', 'CHAMBARA', 1),
(1151, '11', '02', '07', 'HEROINAS TOLEDO', 1),
(1152, '11', '02', '08', 'MANZANARES', 1),
(1153, '11', '02', '09', 'MARISCAL CASTILLA', 1),
(1154, '11', '02', '10', 'MATAHUASI', 1),
(1155, '11', '02', '11', 'MITO', 1),
(1156, '11', '02', '12', 'NUEVE DE JULIO', 1),
(1157, '11', '02', '13', 'ORCOTUNA', 1),
(1158, '11', '02', '14', 'SANTA ROSA DE OCOPA', 1),
(1159, '11', '02', '15', 'SAN JOSE DE QUERO', 1),
(1160, '11', '03', '00', 'JAUJA', 1),
(1161, '11', '03', '01', 'JAUJA', 1),
(1162, '11', '03', '02', 'ACOLLA', 1),
(1163, '11', '03', '03', 'APATA', 1),
(1164, '11', '03', '04', 'ATAURA', 1),
(1165, '11', '03', '05', 'CANCHAYLLO', 1),
(1166, '11', '03', '06', 'EL MANTARO', 1),
(1167, '11', '03', '07', 'HUAMALI', 1),
(1168, '11', '03', '08', 'HUARIPAMPA', 1),
(1169, '11', '03', '09', 'HUERTAS', 1),
(1170, '11', '03', '10', 'JANJAILLO', 1),
(1171, '11', '03', '11', 'JULCAN', 1),
(1172, '11', '03', '12', 'LEONOR ORDOÑEZ', 1),
(1173, '11', '03', '13', 'LLOCLLAPAMPA', 1),
(1174, '11', '03', '14', 'MARCO', 1),
(1175, '11', '03', '15', 'MASMA', 1),
(1176, '11', '03', '16', 'MOLINOS', 1),
(1177, '11', '03', '17', 'MONOBAMBA', 1),
(1178, '11', '03', '18', 'MUQUI', 1),
(1179, '11', '03', '19', 'MUQUIYAUYO', 1),
(1180, '11', '03', '20', 'PACA', 1),
(1181, '11', '03', '21', 'PACCHA', 1),
(1182, '11', '03', '22', 'PANCAN', 1),
(1183, '11', '03', '23', 'PARCO', 1),
(1184, '11', '03', '24', 'POMACANCHA', 1),
(1185, '11', '03', '25', 'RICRAN', 1),
(1186, '11', '03', '26', 'SAN LORENZO', 1),
(1187, '11', '03', '27', 'SAN PEDRO DE CHUNAN', 1),
(1188, '11', '03', '28', 'SINCOS', 1),
(1189, '11', '03', '29', 'TUNAN MARCA', 1),
(1190, '11', '03', '30', 'YAULI', 1),
(1191, '11', '03', '31', 'CURICACA', 1),
(1192, '11', '03', '32', 'MASMA CHICCHE', 1),
(1193, '11', '03', '33', 'SAUSA', 1),
(1194, '11', '03', '34', 'YAUYOS', 1),
(1195, '11', '04', '00', 'JUNIN', 1),
(1196, '11', '04', '01', 'JUNIN', 1),
(1197, '11', '04', '02', 'CARHUAMAYO', 1),
(1198, '11', '04', '03', 'ONDORES', 1),
(1199, '11', '04', '04', 'ULCUMAYO', 1),
(1200, '11', '05', '00', 'TARMA', 1),
(1201, '11', '05', '01', 'TARMA', 1),
(1202, '11', '05', '02', 'ACOBAMBA', 1),
(1203, '11', '05', '03', 'HUARICOLCA', 1),
(1204, '11', '05', '04', 'HUASAHUASI', 1),
(1205, '11', '05', '05', 'LA UNION', 1),
(1206, '11', '05', '06', 'PALCA', 1),
(1207, '11', '05', '07', 'PALCAMAYO', 1),
(1208, '11', '05', '08', 'SAN PEDRO DE CAJAS', 1),
(1209, '11', '05', '09', 'TAPO', 1),
(1210, '11', '06', '00', 'YAULI', 1),
(1211, '11', '06', '01', 'LA OROYA', 1),
(1212, '11', '06', '02', 'CHACAPALPA', 1),
(1213, '11', '06', '03', 'HUAY HUAY', 1),
(1214, '11', '06', '04', 'MARCAPOMACOCHA', 1),
(1215, '11', '06', '05', 'MOROCOCHA', 1),
(1216, '11', '06', '06', 'PACCHA', 1),
(1217, '11', '06', '07', 'SANTA BARBARA DE CARHUACAYAN', 1),
(1218, '11', '06', '08', 'SUITUCANCHA', 1),
(1219, '11', '06', '09', 'YAULI', 1),
(1220, '11', '06', '10', 'SANTA ROSA DE SACCO', 1),
(1221, '11', '07', '00', 'SATIPO', 1),
(1222, '11', '07', '01', 'SATIPO', 1),
(1223, '11', '07', '02', 'COVIRIALI', 1),
(1224, '11', '07', '03', 'LLAYLLA', 1),
(1225, '11', '07', '04', 'MAZAMARI', 1),
(1226, '11', '07', '05', 'PAMPA HERMOSA', 1),
(1227, '11', '07', '06', 'PANGOA', 1),
(1228, '11', '07', '07', 'RIO NEGRO', 1),
(1229, '11', '07', '08', 'RIO TAMBO', 1),
(1230, '11', '08', '00', 'CHANCHAMAYO', 1),
(1231, '11', '08', '01', 'CHANCHAMAYO', 1),
(1232, '11', '08', '02', 'SAN RAMON', 1),
(1233, '11', '08', '03', 'VITOC', 1),
(1234, '11', '08', '04', 'SAN LUIS DE SHUARO', 1),
(1235, '11', '08', '05', 'PICHANAQUI', 1),
(1236, '11', '08', '06', 'PERENE', 1),
(1237, '11', '09', '00', 'CHUPACA', 1),
(1238, '11', '09', '01', 'CHUPACA', 1),
(1239, '11', '09', '02', 'AHUAC', 1),
(1240, '11', '09', '03', 'CHONGOS BAJO', 1),
(1241, '11', '09', '04', 'HUACHAC', 1),
(1242, '11', '09', '05', 'HUAMANCACA CHICO', 1),
(1243, '11', '09', '06', 'SAN JUAN DE YSCOS', 1),
(1244, '11', '09', '07', 'SAN JUAN DE JARPA', 1),
(1245, '11', '09', '08', 'TRES DE DICIEMBRE', 1),
(1246, '11', '09', '09', 'YANACANCHA', 1),
(1247, '12', '00', '00', 'LA LIBERTAD', 1),
(1248, '12', '01', '00', 'TRUJILLO', 1),
(1249, '12', '01', '01', 'TRUJILLO', 1),
(1250, '12', '01', '02', 'HUANCHACO', 1),
(1251, '12', '01', '03', 'LAREDO', 1),
(1252, '12', '01', '04', 'MOCHE', 1),
(1253, '12', '01', '05', 'SALAVERRY', 1),
(1254, '12', '01', '06', 'SIMBAL', 1),
(1255, '12', '01', '07', 'VICTOR LARCO HERRERA', 1),
(1256, '12', '01', '09', 'POROTO', 1),
(1257, '12', '01', '10', 'EL PORVENIR', 1),
(1258, '12', '01', '11', 'LA ESPERANZA', 1),
(1259, '12', '01', '12', 'FLORENCIA DE MORA', 1),
(1260, '12', '02', '00', 'BOLIVAR', 1),
(1261, '12', '02', '01', 'BOLIVAR', 1),
(1262, '12', '02', '02', 'BAMBAMARCA', 1),
(1263, '12', '02', '03', 'CONDORMARCA', 1),
(1264, '12', '02', '04', 'LONGOTEA', 1),
(1265, '12', '02', '05', 'UCUNCHA', 1),
(1266, '12', '02', '06', 'UCHUMARCA', 1),
(1267, '12', '03', '00', 'SANCHEZ CARRION', 1),
(1268, '12', '03', '01', 'HUAMACHUCO', 1),
(1269, '12', '03', '02', 'COCHORCO', 1),
(1270, '12', '03', '03', 'CURGOS', 1),
(1271, '12', '03', '04', 'CHUGAY', 1),
(1272, '12', '03', '05', 'MARCABAL', 1);
INSERT INTO `ubigeo` (`idUbigeo`, `cod_depa`, `cod_prov`, `cod_dist`, `nombre`, `estado`) VALUES
(1273, '12', '03', '06', 'SANAGORAN', 1),
(1274, '12', '03', '07', 'SARIN', 1),
(1275, '12', '03', '08', 'SARTIMBAMBA', 1),
(1276, '12', '04', '00', 'OTUZCO', 1),
(1277, '12', '04', '01', 'OTUZCO', 1),
(1278, '12', '04', '02', 'AGALLPAMPA', 1),
(1279, '12', '04', '03', 'CHARAT', 1),
(1280, '12', '04', '04', 'HUARANCHAL', 1),
(1281, '12', '04', '05', 'LA CUESTA', 1),
(1282, '12', '04', '08', 'PARANDAY', 1),
(1283, '12', '04', '09', 'SALPO', 1),
(1284, '12', '04', '10', 'SINSICAP', 1),
(1285, '12', '04', '11', 'USQUIL', 1),
(1286, '12', '04', '13', 'MACHE', 1),
(1287, '12', '05', '00', 'PACASMAYO', 1),
(1288, '12', '05', '01', 'SAN PEDRO DE LLOC', 1),
(1289, '12', '05', '03', 'GUADALUPE', 1),
(1290, '12', '05', '04', 'JEQUETEPEQUE', 1),
(1291, '12', '05', '06', 'PACASMAYO', 1),
(1292, '12', '05', '08', 'SAN JOSE', 1),
(1293, '12', '06', '00', 'PATAZ', 1),
(1294, '12', '06', '01', 'TAYABAMBA', 1),
(1295, '12', '06', '02', 'BULDIBUYO', 1),
(1296, '12', '06', '03', 'CHILLIA', 1),
(1297, '12', '06', '04', 'HUAYLILLAS', 1),
(1298, '12', '06', '05', 'HUANCASPATA', 1),
(1299, '12', '06', '06', 'HUAYO', 1),
(1300, '12', '06', '07', 'ONGON', 1),
(1301, '12', '06', '08', 'PARCOY', 1),
(1302, '12', '06', '09', 'PATAZ', 1),
(1303, '12', '06', '10', 'PIAS', 1),
(1304, '12', '06', '11', 'TAURIJA', 1),
(1305, '12', '06', '12', 'URPAY', 1),
(1306, '12', '06', '13', 'SANTIAGO DE CHALLAS', 1),
(1307, '12', '07', '00', 'SANTIAGO DE CHUCO', 1),
(1308, '12', '07', '01', 'SANTIAGO DE CHUCO', 1),
(1309, '12', '07', '02', 'CACHICADAN', 1),
(1310, '12', '07', '03', 'MOLLEBAMBA', 1),
(1311, '12', '07', '04', 'MOLLEPATA', 1),
(1312, '12', '07', '05', 'QUIRUVILCA', 1),
(1313, '12', '07', '06', 'SANTA CRUZ DE CHUCA', 1),
(1314, '12', '07', '07', 'SITABAMBA', 1),
(1315, '12', '07', '08', 'ANGASMARCA', 1),
(1316, '12', '08', '00', 'ASCOPE', 1),
(1317, '12', '08', '01', 'ASCOPE', 1),
(1318, '12', '08', '02', 'CHICAMA', 1),
(1319, '12', '08', '03', 'CHOCOPE', 1),
(1320, '12', '08', '04', 'SANTIAGO DE CAO', 1),
(1321, '12', '08', '05', 'MAGDALENA DE CAO', 1),
(1322, '12', '08', '06', 'PAIJAN', 1),
(1323, '12', '08', '07', 'RAZURI', 1),
(1324, '12', '08', '08', 'CASA GRANDE', 1),
(1325, '12', '09', '00', 'CHEPEN', 1),
(1326, '12', '09', '01', 'CHEPEN', 1),
(1327, '12', '09', '02', 'PACANGA', 1),
(1328, '12', '09', '03', 'PUEBLO NUEVO', 1),
(1329, '12', '10', '00', 'JULCAN', 1),
(1330, '12', '10', '01', 'JULCAN', 1),
(1331, '12', '10', '02', 'CARABAMBA', 1),
(1332, '12', '10', '03', 'CALAMARCA', 1),
(1333, '12', '10', '04', 'HUASO', 1),
(1334, '12', '11', '00', 'GRAN CHIMU', 1),
(1335, '12', '11', '01', 'CASCAS', 1),
(1336, '12', '11', '02', 'LUCMA', 1),
(1337, '12', '11', '03', 'MARMOT', 1),
(1338, '12', '11', '04', 'SAYAPULLO', 1),
(1339, '12', '12', '00', 'VIRU', 1),
(1340, '12', '12', '01', 'VIRU', 1),
(1341, '12', '12', '02', 'CHAO', 1),
(1342, '12', '12', '03', 'GUADALUPITO', 1),
(1343, '13', '00', '00', 'LAMBAYEQUE', 1),
(1344, '13', '01', '00', 'CHICLAYO', 1),
(1345, '13', '01', '01', 'CHICLAYO', 1),
(1346, '13', '01', '02', 'CHONGOYAPE', 1),
(1347, '13', '01', '03', 'ETEN', 1),
(1348, '13', '01', '04', 'ETEN PUERTO', 1),
(1349, '13', '01', '05', 'LAGUNAS', 1),
(1350, '13', '01', '06', 'MONSEFU', 1),
(1351, '13', '01', '07', 'NUEVA ARICA', 1),
(1352, '13', '01', '08', 'OYOTUN', 1),
(1353, '13', '01', '09', 'PICSI', 1),
(1354, '13', '01', '10', 'PIMENTEL', 1),
(1355, '13', '01', '11', 'REQUE', 1),
(1356, '13', '01', '12', 'JOSE LEONARDO ORTIZ', 1),
(1357, '13', '01', '13', 'SANTA ROSA', 1),
(1358, '13', '01', '14', 'SAÑA', 1),
(1359, '13', '01', '15', 'LA VICTORIA', 1),
(1360, '13', '01', '16', 'CAYALTI', 1),
(1361, '13', '01', '17', 'PATAPO', 1),
(1362, '13', '01', '18', 'POMALCA', 1),
(1363, '13', '01', '19', 'PUCALA', 1),
(1364, '13', '01', '20', 'TUMAN', 1),
(1365, '13', '02', '00', 'FERREÑAFE', 1),
(1366, '13', '02', '01', 'FERREÑAFE', 1),
(1367, '13', '02', '02', 'INCAHUASI', 1),
(1368, '13', '02', '03', 'CAÑARIS', 1),
(1369, '13', '02', '04', 'PITIPO', 1),
(1370, '13', '02', '05', 'PUEBLO NUEVO', 1),
(1371, '13', '02', '06', 'MANUEL ANTONIO MESONES MURO', 1),
(1372, '13', '03', '00', 'LAMBAYEQUE', 1),
(1373, '13', '03', '01', 'LAMBAYEQUE', 1),
(1374, '13', '03', '02', 'CHOCHOPE', 1),
(1375, '13', '03', '03', 'ILLIMO', 1),
(1376, '13', '03', '04', 'JAYANCA', 1),
(1377, '13', '03', '05', 'MOCHUMI', 1),
(1378, '13', '03', '06', 'MORROPE', 1),
(1379, '13', '03', '07', 'MOTUPE', 1),
(1380, '13', '03', '08', 'OLMOS', 1),
(1381, '13', '03', '09', 'PACORA', 1),
(1382, '13', '03', '10', 'SALAS', 1),
(1383, '13', '03', '11', 'SAN JOSE', 1),
(1384, '13', '03', '12', 'TUCUME', 1),
(1385, '14', '00', '00', 'LIMA', 1),
(1386, '14', '01', '00', 'LIMA', 1),
(1387, '14', '01', '01', 'LIMA', 1),
(1388, '14', '01', '02', 'ANCON', 1),
(1389, '14', '01', '03', 'ATE', 1),
(1390, '14', '01', '04', 'BREÑA', 1),
(1391, '14', '01', '05', 'CARABAYLLO', 1),
(1392, '14', '01', '06', 'COMAS', 1),
(1393, '14', '01', '07', 'CHACLACAYO', 1),
(1394, '14', '01', '08', 'CHORRILLOS', 1),
(1395, '14', '01', '09', 'LA VICTORIA', 1),
(1396, '14', '01', '10', 'LA MOLINA', 1),
(1397, '14', '01', '11', 'LINCE', 1),
(1398, '14', '01', '12', 'LURIGANCHO', 1),
(1399, '14', '01', '13', 'LURIN', 1),
(1400, '14', '01', '14', 'MAGDALENA DEL MAR', 1),
(1401, '14', '01', '15', 'MIRAFLORES', 1),
(1402, '14', '01', '16', 'PACHACAMAC', 1),
(1403, '14', '01', '17', 'PUEBLO LIBRE', 1),
(1404, '14', '01', '18', 'PUCUSANA', 1),
(1405, '14', '01', '19', 'PUENTE PIEDRA', 1),
(1406, '14', '01', '20', 'PUNTA HERMOSA', 1),
(1407, '14', '01', '21', 'PUNTA NEGRA', 1),
(1408, '14', '01', '22', 'RIMAC', 1),
(1409, '14', '01', '23', 'SAN BARTOLO', 1),
(1410, '14', '01', '24', 'SAN ISIDRO', 1),
(1411, '14', '01', '25', 'BARRANCO', 1),
(1412, '14', '01', '26', 'SAN MARTIN DE PORRES', 1),
(1413, '14', '01', '27', 'SAN MIGUEL', 1),
(1414, '14', '01', '28', 'SANTA MARIA DEL MAR', 1),
(1415, '14', '01', '29', 'SANTA ROSA', 1),
(1416, '14', '01', '30', 'SANTIAGO DE SURCO', 1),
(1417, '14', '01', '31', 'SURQUILLO', 1),
(1418, '14', '01', '32', 'VILLA MARIA DEL TRIUNFO', 1),
(1419, '14', '01', '33', 'JESUS MARIA', 1),
(1420, '14', '01', '34', 'INDEPENDENCIA', 1),
(1421, '14', '01', '35', 'EL AGUSTINO', 1),
(1422, '14', '01', '36', 'SAN JUAN DE MIRAFLORES', 1),
(1423, '14', '01', '37', 'SAN JUAN DE LURIGANCHO', 1),
(1424, '14', '01', '38', 'SAN LUIS', 1),
(1425, '14', '01', '39', 'CIENEGUILLA', 1),
(1426, '14', '01', '40', 'SAN BORJA', 1),
(1427, '14', '01', '41', 'VILLA EL SALVADOR', 1),
(1428, '14', '01', '42', 'LOS OLIVOS', 1),
(1429, '14', '01', '43', 'SANTA ANITA', 1),
(1430, '14', '02', '00', 'CAJATAMBO', 1),
(1431, '14', '02', '01', 'CAJATAMBO', 1),
(1432, '14', '02', '05', 'COPA', 1),
(1433, '14', '02', '06', 'GORGOR', 1),
(1434, '14', '02', '07', 'HUANCAPON', 1),
(1435, '14', '02', '08', 'MANAS', 1),
(1436, '14', '03', '00', 'CANTA', 1),
(1437, '14', '03', '01', 'CANTA', 1),
(1438, '14', '03', '02', 'ARAHUAY', 1),
(1439, '14', '03', '03', 'HUAMANTANGA', 1),
(1440, '14', '03', '04', 'HUAROS', 1),
(1441, '14', '03', '05', 'LACHAQUI', 1),
(1442, '14', '03', '06', 'SAN BUENAVENTURA', 1),
(1443, '14', '03', '07', 'SANTA ROSA DE QUIVES', 1),
(1444, '14', '04', '00', 'CAÑETE', 1),
(1445, '14', '04', '01', 'SAN VICENTE DE CAÑETE', 1),
(1446, '14', '04', '02', 'CALANGO', 1),
(1447, '14', '04', '03', 'CERRO AZUL', 1),
(1448, '14', '04', '04', 'COAYLLO', 1),
(1449, '14', '04', '05', 'CHILCA', 1),
(1450, '14', '04', '06', 'IMPERIAL', 1),
(1451, '14', '04', '07', 'LUNAHUANA', 1),
(1452, '14', '04', '08', 'MALA', 1),
(1453, '14', '04', '09', 'NUEVO IMPERIAL', 1),
(1454, '14', '04', '10', 'PACARAN', 1),
(1455, '14', '04', '11', 'QUILMANA', 1),
(1456, '14', '04', '12', 'SAN ANTONIO', 1),
(1457, '14', '04', '13', 'SAN LUIS', 1),
(1458, '14', '04', '14', 'SANTA CRUZ DE FLORES', 1),
(1459, '14', '04', '15', 'ZUÑIGA', 1),
(1460, '14', '04', '16', 'ASIA', 1),
(1461, '14', '05', '00', 'HUAURA', 1),
(1462, '14', '05', '01', 'HUACHO', 1),
(1463, '14', '05', '02', 'AMBAR', 1),
(1464, '14', '05', '04', 'CALETA DE CARQUIN', 1),
(1465, '14', '05', '05', 'CHECRAS', 1),
(1466, '14', '05', '06', 'HUALMAY', 1),
(1467, '14', '05', '07', 'HUAURA', 1),
(1468, '14', '05', '08', 'LEONCIO PRADO', 1),
(1469, '14', '05', '09', 'PACCHO', 1),
(1470, '14', '05', '11', 'SANTA LEONOR', 1),
(1471, '14', '05', '12', 'SANTA MARIA', 1),
(1472, '14', '05', '13', 'SAYAN', 1),
(1473, '14', '05', '16', 'VEGUETA', 1),
(1474, '14', '06', '00', 'HUAROCHIRI', 1),
(1475, '14', '06', '01', 'MATUCANA', 1),
(1476, '14', '06', '02', 'ANTIOQUIA', 1),
(1477, '14', '06', '03', 'CALLAHUANCA', 1),
(1478, '14', '06', '04', 'CARAMPOMA', 1),
(1479, '14', '06', '05', 'CASTA', 1),
(1480, '14', '06', '06', 'SAN JOSE DE LOS CHORRILLOS', 1),
(1481, '14', '06', '07', 'CHICLA', 1),
(1482, '14', '06', '08', 'HUANZA', 1),
(1483, '14', '06', '09', 'HUAROCHIRI', 1),
(1484, '14', '06', '10', 'LAHUAYTAMBO', 1),
(1485, '14', '06', '11', 'LANGA', 1),
(1486, '14', '06', '12', 'MARIATANA', 1),
(1487, '14', '06', '13', 'RICARDO PALMA', 1),
(1488, '14', '06', '14', 'SAN ANDRES DE TUPICOCHA', 1),
(1489, '14', '06', '15', 'SAN ANTONIO', 1),
(1490, '14', '06', '16', 'SAN BARTOLOME', 1),
(1491, '14', '06', '17', 'SAN DAMIAN', 1),
(1492, '14', '06', '18', 'SANGALLAYA', 1),
(1493, '14', '06', '19', 'SAN JUAN DE TANTARANCHE', 1),
(1494, '14', '06', '20', 'SAN LORENZO DE QUINTI', 1),
(1495, '14', '06', '21', 'SAN MATEO', 1),
(1496, '14', '06', '22', 'SAN MATEO DE OTAO', 1),
(1497, '14', '06', '23', 'SAN PEDRO DE HUANCAYRE', 1),
(1498, '14', '06', '24', 'SANTA CRUZ DE COCACHACRA', 1),
(1499, '14', '06', '25', 'SANTA EULALIA', 1),
(1500, '14', '06', '26', 'SANTIAGO DE ANCHUCAYA', 1),
(1501, '14', '06', '27', 'SANTIAGO DE TUNA', 1),
(1502, '14', '06', '28', 'SANTO DOMINGO DE LOS OLLEROS', 1),
(1503, '14', '06', '29', 'SURCO', 1),
(1504, '14', '06', '30', 'HUACHUPAMPA', 1),
(1505, '14', '06', '31', 'LARAOS', 1),
(1506, '14', '06', '32', 'SAN JUAN DE IRIS', 1),
(1507, '14', '07', '00', 'YAUYOS', 1),
(1508, '14', '07', '01', 'YAUYOS', 1),
(1509, '14', '07', '02', 'ALIS', 1),
(1510, '14', '07', '03', 'ALLAUCA', 1),
(1511, '14', '07', '04', 'AYAVIRI', 1),
(1512, '14', '07', '05', 'AZANGARO', 1),
(1513, '14', '07', '06', 'CACRA', 1),
(1514, '14', '07', '07', 'CARANIA', 1),
(1515, '14', '07', '08', 'COCHAS', 1),
(1516, '14', '07', '09', 'COLONIA', 1),
(1517, '14', '07', '10', 'CHOCOS', 1),
(1518, '14', '07', '11', 'HUAMPARA', 1),
(1519, '14', '07', '12', 'HUANCAYA', 1),
(1520, '14', '07', '13', 'HUANGASCAR', 1),
(1521, '14', '07', '14', 'HUANTAN', 1),
(1522, '14', '07', '15', 'HUAÑEC', 1),
(1523, '14', '07', '16', 'LARAOS', 1),
(1524, '14', '07', '17', 'LINCHA', 1),
(1525, '14', '07', '18', 'MIRAFLORES', 1),
(1526, '14', '07', '19', 'OMAS', 1),
(1527, '14', '07', '20', 'QUINCHES', 1),
(1528, '14', '07', '21', 'QUINOCAY', 1),
(1529, '14', '07', '22', 'SAN JOAQUIN', 1),
(1530, '14', '07', '23', 'SAN PEDRO DE PILAS', 1),
(1531, '14', '07', '24', 'TANTA', 1),
(1532, '14', '07', '25', 'TAURIPAMPA', 1),
(1533, '14', '07', '26', 'TUPE', 1),
(1534, '14', '07', '27', 'TOMAS', 1),
(1535, '14', '07', '28', 'VIÑAC', 1),
(1536, '14', '07', '29', 'VITIS', 1),
(1537, '14', '07', '30', 'HONGOS', 1),
(1538, '14', '07', '31', 'MADEAN', 1),
(1539, '14', '07', '32', 'PUTINZA', 1),
(1540, '14', '07', '33', 'CATAHUASI', 1),
(1541, '14', '08', '00', 'HUARAL', 1),
(1542, '14', '08', '01', 'HUARAL', 1),
(1543, '14', '08', '02', 'ATAVILLOS ALTO', 1),
(1544, '14', '08', '03', 'ATAVILLOS BAJO', 1),
(1545, '14', '08', '04', 'AUCALLAMA', 1),
(1546, '14', '08', '05', 'CHANCAY', 1),
(1547, '14', '08', '06', 'IHUARI', 1),
(1548, '14', '08', '07', 'LAMPIAN', 1),
(1549, '14', '08', '08', 'PACARAOS', 1),
(1550, '14', '08', '09', 'SAN MIGUEL DE ACOS', 1),
(1551, '14', '08', '10', 'VEINTISIETE DE NOVIEMBRE', 1),
(1552, '14', '08', '11', 'SANTA CRUZ DE ANDAMARCA', 1),
(1553, '14', '08', '12', 'SUMBILCA', 1),
(1554, '14', '09', '00', 'BARRANCA', 1),
(1555, '14', '09', '01', 'BARRANCA', 1),
(1556, '14', '09', '02', 'PARAMONGA', 1),
(1557, '14', '09', '03', 'PATIVILCA', 1),
(1558, '14', '09', '04', 'SUPE', 1),
(1559, '14', '09', '05', 'SUPE PUERTO', 1),
(1560, '14', '10', '00', 'OYON', 1),
(1561, '14', '10', '01', 'OYON', 1),
(1562, '14', '10', '02', 'NAVAN', 1),
(1563, '14', '10', '03', 'CAUJUL', 1),
(1564, '14', '10', '04', 'ANDAJES', 1),
(1565, '14', '10', '05', 'PACHANGARA', 1),
(1566, '14', '10', '06', 'COCHAMARCA', 1),
(1567, '15', '00', '00', 'LORETO', 1),
(1568, '15', '01', '00', 'MAYNAS', 1),
(1569, '15', '01', '01', 'IQUITOS', 1),
(1570, '15', '01', '02', 'ALTO NANAY', 1),
(1571, '15', '01', '03', 'FERNANDO LORES', 1),
(1572, '15', '01', '04', 'LAS AMAZONAS', 1),
(1573, '15', '01', '05', 'MAZAN', 1),
(1574, '15', '01', '06', 'NAPO', 1),
(1575, '15', '01', '07', 'PUTUMAYO', 1),
(1576, '15', '01', '08', 'TORRES CAUSANA', 1),
(1577, '15', '01', '10', 'INDIANA', 1),
(1578, '15', '01', '11', 'PUNCHANA', 1),
(1579, '15', '01', '12', 'BELEN', 1),
(1580, '15', '01', '13', 'SAN JUAN BAUTISTA', 1),
(1581, '15', '01', '14', 'TENIENTE MANUEL CLAVERO', 1),
(1582, '15', '02', '00', 'ALTO AMAZONAS', 1),
(1583, '15', '02', '01', 'YURIMAGUAS', 1),
(1584, '15', '02', '02', 'BALSAPUERTO', 1),
(1585, '15', '02', '05', 'JEBEROS', 1),
(1586, '15', '02', '06', 'LAGUNAS', 1),
(1587, '15', '02', '10', 'SANTA CRUZ', 1),
(1588, '15', '02', '11', 'TENIENTE CESAR LOPEZ ROJAS', 1),
(1589, '15', '03', '00', 'LORETO', 1),
(1590, '15', '03', '01', 'NAUTA', 1),
(1591, '15', '03', '02', 'PARINARI', 1),
(1592, '15', '03', '03', 'TIGRE', 1),
(1593, '15', '03', '04', 'URARINAS', 1),
(1594, '15', '03', '05', 'TROMPETEROS', 1),
(1595, '15', '04', '00', 'REQUENA', 1),
(1596, '15', '04', '01', 'REQUENA', 1),
(1597, '15', '04', '02', 'ALTO TAPICHE', 1),
(1598, '15', '04', '03', 'CAPELO', 1),
(1599, '15', '04', '04', 'EMILIO SAN MARTIN', 1),
(1600, '15', '04', '05', 'MAQUIA', 1),
(1601, '15', '04', '06', 'PUINAHUA', 1),
(1602, '15', '04', '07', 'SAQUENA', 1),
(1603, '15', '04', '08', 'SOPLIN', 1),
(1604, '15', '04', '09', 'TAPICHE', 1),
(1605, '15', '04', '10', 'JENARO HERRERA', 1),
(1606, '15', '04', '11', 'YAQUERANA', 1),
(1607, '15', '05', '00', 'UCAYALI', 1),
(1608, '15', '05', '01', 'CONTAMANA', 1),
(1609, '15', '05', '02', 'VARGAS GUERRA', 1),
(1610, '15', '05', '03', 'PADRE MARQUEZ', 1),
(1611, '15', '05', '04', 'PAMPA HERMOSA', 1),
(1612, '15', '05', '05', 'SARAYACU', 1),
(1613, '15', '05', '06', 'INAHUAYA', 1),
(1614, '15', '06', '00', 'MARISCAL RAMON CASTILLA', 1),
(1615, '15', '06', '01', 'RAMON CASTILLA', 1),
(1616, '15', '06', '02', 'PEBAS', 1),
(1617, '15', '06', '03', 'YAVARI', 1),
(1618, '15', '06', '04', 'SAN PABLO', 1),
(1619, '15', '07', '00', 'DATEM DEL MARAÑON', 1),
(1620, '15', '07', '01', 'BARRANCA', 1),
(1621, '15', '07', '02', 'ANDOAS', 1),
(1622, '15', '07', '03', 'CAHUAPANAS', 1),
(1623, '15', '07', '04', 'MANSERICHE', 1),
(1624, '15', '07', '05', 'MORONA', 1),
(1625, '15', '07', '06', 'PASTAZA', 1),
(1626, '16', '00', '00', 'MADRE DE DIOS', 1),
(1627, '16', '01', '00', 'TAMBOPATA', 1),
(1628, '16', '01', '01', 'TAMBOPATA', 1),
(1629, '16', '01', '02', 'INAMBARI', 1),
(1630, '16', '01', '03', 'LAS PIEDRAS', 1),
(1631, '16', '01', '04', 'LABERINTO', 1),
(1632, '16', '02', '00', 'MANU', 1),
(1633, '16', '02', '01', 'MANU', 1),
(1634, '16', '02', '02', 'FITZCARRALD', 1),
(1635, '16', '02', '03', 'MADRE DE DIOS', 1),
(1636, '16', '02', '04', 'HUEPETUHE', 1),
(1637, '16', '03', '00', 'TAHUAMANU', 1),
(1638, '16', '03', '01', 'IÑAPARI', 1),
(1639, '16', '03', '02', 'IBERIA', 1),
(1640, '16', '03', '03', 'TAHUAMANU', 1),
(1641, '17', '00', '00', 'MOQUEGUA', 1),
(1642, '17', '01', '00', 'MARISCAL NIETO', 1),
(1643, '17', '01', '01', 'MOQUEGUA', 1),
(1644, '17', '01', '02', 'CARUMAS', 1),
(1645, '17', '01', '03', 'CUCHUMBAYA', 1),
(1646, '17', '01', '04', 'SAN CRISTOBAL', 1),
(1647, '17', '01', '05', 'TORATA', 1),
(1648, '17', '01', '06', 'SAMEGUA', 1),
(1649, '17', '02', '00', 'GENERAL SANCHEZ CERRO', 1),
(1650, '17', '02', '01', 'OMATE', 1),
(1651, '17', '02', '02', 'COALAQUE', 1),
(1652, '17', '02', '03', 'CHOJATA', 1),
(1653, '17', '02', '04', 'ICHUÑA', 1),
(1654, '17', '02', '05', 'LA CAPILLA', 1),
(1655, '17', '02', '06', 'LLOQUE', 1),
(1656, '17', '02', '07', 'MATALAQUE', 1),
(1657, '17', '02', '08', 'PUQUINA', 1),
(1658, '17', '02', '09', 'QUINISTAQUILLAS', 1),
(1659, '17', '02', '10', 'UBINAS', 1),
(1660, '17', '02', '11', 'YUNGA', 1),
(1661, '17', '03', '00', 'ILO', 1),
(1662, '17', '03', '01', 'ILO', 1),
(1663, '17', '03', '02', 'EL ALGARROBAL', 1),
(1664, '17', '03', '03', 'PACOCHA', 1),
(1665, '18', '00', '00', 'PASCO', 1),
(1666, '18', '01', '00', 'PASCO', 1),
(1667, '18', '01', '01', 'CHAUPIMARCA', 1),
(1668, '18', '01', '03', 'HUACHON', 1),
(1669, '18', '01', '04', 'HUARIACA', 1),
(1670, '18', '01', '05', 'HUAYLLAY', 1),
(1671, '18', '01', '06', 'NINACACA', 1),
(1672, '18', '01', '07', 'PALLANCHACRA', 1),
(1673, '18', '01', '08', 'PAUCARTAMBO', 1),
(1674, '18', '01', '09', 'SAN FCO DE ASIS DE YARUSYACAN', 1),
(1675, '18', '01', '10', 'SIMON BOLIVAR', 1),
(1676, '18', '01', '11', 'TICLACAYAN', 1),
(1677, '18', '01', '12', 'TINYAHUARCO', 1),
(1678, '18', '01', '13', 'VICCO', 1),
(1679, '18', '01', '14', 'YANACANCHA', 1),
(1680, '18', '02', '00', 'DANIEL ALCIDES CARRION', 1),
(1681, '18', '02', '01', 'YANAHUANCA', 1),
(1682, '18', '02', '02', 'CHACAYAN', 1),
(1683, '18', '02', '03', 'GOYLLARISQUIZGA', 1),
(1684, '18', '02', '04', 'PAUCAR', 1),
(1685, '18', '02', '05', 'SAN PEDRO DE PILLAO', 1),
(1686, '18', '02', '06', 'SANTA ANA DE TUSI', 1),
(1687, '18', '02', '07', 'TAPUC', 1),
(1688, '18', '02', '08', 'VILCABAMBA', 1),
(1689, '18', '03', '00', 'OXAPAMPA', 1),
(1690, '18', '03', '01', 'OXAPAMPA', 1),
(1691, '18', '03', '02', 'CHONTABAMBA', 1),
(1692, '18', '03', '03', 'HUANCABAMBA', 1),
(1693, '18', '03', '04', 'PUERTO BERMUDEZ', 1),
(1694, '18', '03', '05', 'VILLA RICA', 1),
(1695, '18', '03', '06', 'POZUZO', 1),
(1696, '18', '03', '07', 'PALCAZU', 1),
(1697, '18', '03', '08', 'CONSTITUCION', 1),
(1698, '19', '00', '00', 'PIURA', 1),
(1699, '19', '01', '00', 'PIURA', 1),
(1700, '19', '01', '01', 'PIURA', 1),
(1701, '19', '01', '03', 'CASTILLA', 1),
(1702, '19', '01', '04', 'CATACAOS', 1),
(1703, '19', '01', '05', 'LA ARENA', 1),
(1704, '19', '01', '06', 'LA UNION', 1),
(1705, '19', '01', '07', 'LAS LOMAS', 1),
(1706, '19', '01', '09', 'TAMBO GRANDE', 1),
(1707, '19', '01', '13', 'CURA MORI', 1),
(1708, '19', '01', '14', 'EL TALLAN', 1),
(1709, '19', '01', '15', 'VEINTISEIS DE OCTUBRE', 1),
(1710, '19', '02', '00', 'AYABACA', 1),
(1711, '19', '02', '01', 'AYABACA', 1),
(1712, '19', '02', '02', 'FRIAS', 1),
(1713, '19', '02', '03', 'LAGUNAS', 1),
(1714, '19', '02', '04', 'MONTERO', 1),
(1715, '19', '02', '05', 'PACAIPAMPA', 1),
(1716, '19', '02', '06', 'SAPILLICA', 1),
(1717, '19', '02', '07', 'SICCHEZ', 1),
(1718, '19', '02', '08', 'SUYO', 1),
(1719, '19', '02', '09', 'JILILI', 1),
(1720, '19', '02', '10', 'PAIMAS', 1),
(1721, '19', '03', '00', 'HUANCABAMBA', 1),
(1722, '19', '03', '01', 'HUANCABAMBA', 1),
(1723, '19', '03', '02', 'CANCHAQUE', 1),
(1724, '19', '03', '03', 'HUARMACA', 1),
(1725, '19', '03', '04', 'SONDOR', 1),
(1726, '19', '03', '05', 'SONDORILLO', 1),
(1727, '19', '03', '06', 'EL CARMEN DE LA FRONTERA', 1),
(1728, '19', '03', '07', 'SAN MIGUEL DE EL FAIQUE', 1),
(1729, '19', '03', '08', 'LALAQUIZ', 1),
(1730, '19', '04', '00', 'MORROPON', 1),
(1731, '19', '04', '01', 'CHULUCANAS', 1),
(1732, '19', '04', '02', 'BUENOS AIRES', 1),
(1733, '19', '04', '03', 'CHALACO', 1),
(1734, '19', '04', '04', 'MORROPON', 1),
(1735, '19', '04', '05', 'SALITRAL', 1),
(1736, '19', '04', '06', 'SANTA CATALINA DE MOSSA', 1),
(1737, '19', '04', '07', 'SANTO DOMINGO', 1),
(1738, '19', '04', '08', 'LA MATANZA', 1),
(1739, '19', '04', '09', 'YAMANGO', 1),
(1740, '19', '04', '10', 'SAN JUAN DE BIGOTE', 1),
(1741, '19', '05', '00', 'PAITA', 1),
(1742, '19', '05', '01', 'PAITA', 1),
(1743, '19', '05', '02', 'AMOTAPE', 1),
(1744, '19', '05', '03', 'ARENAL', 1),
(1745, '19', '05', '04', 'LA HUACA', 1),
(1746, '19', '05', '05', 'COLAN', 1),
(1747, '19', '05', '06', 'TAMARINDO', 1),
(1748, '19', '05', '07', 'VICHAYAL', 1),
(1749, '19', '06', '00', 'SULLANA', 1),
(1750, '19', '06', '01', 'SULLANA', 1),
(1751, '19', '06', '02', 'BELLAVISTA', 1),
(1752, '19', '06', '03', 'LANCONES', 1),
(1753, '19', '06', '04', 'MARCAVELICA', 1),
(1754, '19', '06', '05', 'MIGUEL CHECA', 1),
(1755, '19', '06', '06', 'QUERECOTILLO', 1),
(1756, '19', '06', '07', 'SALITRAL', 1),
(1757, '19', '06', '08', 'IGNACIO ESCUDERO', 1),
(1758, '19', '07', '00', 'TALARA', 1),
(1759, '19', '07', '01', 'PARIÑAS', 1),
(1760, '19', '07', '02', 'EL ALTO', 1),
(1761, '19', '07', '03', 'LA BREA', 1),
(1762, '19', '07', '04', 'LOBITOS', 1),
(1763, '19', '07', '05', 'MANCORA', 1),
(1764, '19', '07', '06', 'LOS ORGANOS', 1),
(1765, '19', '08', '00', 'SECHURA', 1),
(1766, '19', '08', '01', 'SECHURA', 1),
(1767, '19', '08', '02', 'VICE', 1),
(1768, '19', '08', '03', 'BERNAL', 1),
(1769, '19', '08', '04', 'BELLAVISTA DE LA UNION', 1),
(1770, '19', '08', '05', 'CRISTO NOS VALGA', 1),
(1771, '19', '08', '06', 'RINCONADA-LLICUAR', 1),
(1772, '20', '00', '00', 'PUNO', 1),
(1773, '20', '01', '00', 'PUNO', 1),
(1774, '20', '01', '01', 'PUNO', 1),
(1775, '20', '01', '02', 'ACORA', 1),
(1776, '20', '01', '03', 'ATUNCOLLA', 1),
(1777, '20', '01', '04', 'CAPACHICA', 1),
(1778, '20', '01', '05', 'COATA', 1),
(1779, '20', '01', '06', 'CHUCUITO', 1),
(1780, '20', '01', '07', 'HUATA', 1),
(1781, '20', '01', '08', 'MAÑAZO', 1),
(1782, '20', '01', '09', 'PAUCARCOLLA', 1),
(1783, '20', '01', '10', 'PICHACANI', 1),
(1784, '20', '01', '11', 'SAN ANTONIO', 1),
(1785, '20', '01', '12', 'TIQUILLACA', 1),
(1786, '20', '01', '13', 'VILQUE', 1),
(1787, '20', '01', '14', 'PLATERIA', 1),
(1788, '20', '01', '15', 'AMANTANI', 1),
(1789, '20', '02', '00', 'AZANGARO', 1),
(1790, '20', '02', '01', 'AZANGARO', 1),
(1791, '20', '02', '02', 'ACHAYA', 1),
(1792, '20', '02', '03', 'ARAPA', 1),
(1793, '20', '02', '04', 'ASILLO', 1),
(1794, '20', '02', '05', 'CAMINACA', 1),
(1795, '20', '02', '06', 'CHUPA', 1),
(1796, '20', '02', '07', 'JOSE DOMINGO CHOQUEHUANCA', 1),
(1797, '20', '02', '08', 'MUÑANI', 1),
(1798, '20', '02', '10', 'POTONI', 1),
(1799, '20', '02', '12', 'SAMAN', 1),
(1800, '20', '02', '13', 'SAN ANTON', 1),
(1801, '20', '02', '14', 'SAN JOSE', 1),
(1802, '20', '02', '15', 'SAN JUAN DE SALINAS', 1),
(1803, '20', '02', '16', 'SANTIAGO DE PUPUJA', 1),
(1804, '20', '02', '17', 'TIRAPATA', 1),
(1805, '20', '03', '00', 'CARABAYA', 1),
(1806, '20', '03', '01', 'MACUSANI', 1),
(1807, '20', '03', '02', 'AJOYANI', 1),
(1808, '20', '03', '03', 'AYAPATA', 1),
(1809, '20', '03', '04', 'COASA', 1),
(1810, '20', '03', '05', 'CORANI', 1),
(1811, '20', '03', '06', 'CRUCERO', 1),
(1812, '20', '03', '07', 'ITUATA', 1),
(1813, '20', '03', '08', 'OLLACHEA', 1),
(1814, '20', '03', '09', 'SAN GABAN', 1),
(1815, '20', '03', '10', 'USICAYOS', 1),
(1816, '20', '04', '00', 'CHUCUITO', 1),
(1817, '20', '04', '01', 'JULI', 1),
(1818, '20', '04', '02', 'DESAGUADERO', 1),
(1819, '20', '04', '03', 'HUACULLANI', 1),
(1820, '20', '04', '06', 'PISACOMA', 1),
(1821, '20', '04', '07', 'POMATA', 1),
(1822, '20', '04', '10', 'ZEPITA', 1),
(1823, '20', '04', '12', 'KELLUYO', 1),
(1824, '20', '05', '00', 'HUANCANE', 1),
(1825, '20', '05', '01', 'HUANCANE', 1),
(1826, '20', '05', '02', 'COJATA', 1),
(1827, '20', '05', '04', 'INCHUPALLA', 1),
(1828, '20', '05', '06', 'PUSI', 1),
(1829, '20', '05', '07', 'ROSASPATA', 1),
(1830, '20', '05', '08', 'TARACO', 1),
(1831, '20', '05', '09', 'VILQUE CHICO', 1),
(1832, '20', '05', '11', 'HUATASANI', 1),
(1833, '20', '06', '00', 'LAMPA', 1),
(1834, '20', '06', '01', 'LAMPA', 1),
(1835, '20', '06', '02', 'CABANILLA', 1),
(1836, '20', '06', '03', 'CALAPUJA', 1),
(1837, '20', '06', '04', 'NICASIO', 1),
(1838, '20', '06', '05', 'OCUVIRI', 1),
(1839, '20', '06', '06', 'PALCA', 1),
(1840, '20', '06', '07', 'PARATIA', 1),
(1841, '20', '06', '08', 'PUCARA', 1),
(1842, '20', '06', '09', 'SANTA LUCIA', 1),
(1843, '20', '06', '10', 'VILAVILA', 1),
(1844, '20', '07', '00', 'MELGAR', 1),
(1845, '20', '07', '01', 'AYAVIRI', 1),
(1846, '20', '07', '02', 'ANTAUTA', 1),
(1847, '20', '07', '03', 'CUPI', 1),
(1848, '20', '07', '04', 'LLALLI', 1),
(1849, '20', '07', '05', 'MACARI', 1),
(1850, '20', '07', '06', 'NUÑOA', 1),
(1851, '20', '07', '07', 'ORURILLO', 1),
(1852, '20', '07', '08', 'SANTA ROSA', 1),
(1853, '20', '07', '09', 'UMACHIRI', 1),
(1854, '20', '08', '00', 'SANDIA', 1),
(1855, '20', '08', '01', 'SANDIA', 1),
(1856, '20', '08', '03', 'CUYOCUYO', 1),
(1857, '20', '08', '04', 'LIMBANI', 1),
(1858, '20', '08', '05', 'PHARA', 1),
(1859, '20', '08', '06', 'PATAMBUCO', 1),
(1860, '20', '08', '07', 'QUIACA', 1),
(1861, '20', '08', '08', 'SAN JUAN DEL ORO', 1),
(1862, '20', '08', '10', 'YANAHUAYA', 1),
(1863, '20', '08', '11', 'ALTO INAMBARI', 1),
(1864, '20', '08', '12', 'SAN PEDRO DE PUTINA PUNCO', 1),
(1865, '20', '09', '00', 'SAN ROMAN', 1),
(1866, '20', '09', '01', 'JULIACA', 1),
(1867, '20', '09', '02', 'CABANA', 1),
(1868, '20', '09', '03', 'CABANILLAS', 1),
(1869, '20', '09', '04', 'CARACOTO', 1),
(1870, '20', '10', '00', 'YUNGUYO', 1),
(1871, '20', '10', '01', 'YUNGUYO', 1),
(1872, '20', '10', '02', 'UNICACHI', 1),
(1873, '20', '10', '03', 'ANAPIA', 1),
(1874, '20', '10', '04', 'COPANI', 1),
(1875, '20', '10', '05', 'CUTURAPI', 1),
(1876, '20', '10', '06', 'OLLARAYA', 1),
(1877, '20', '10', '07', 'TINICACHI', 1),
(1878, '20', '11', '00', 'SAN ANTONIO DE PUTINA', 1),
(1879, '20', '11', '01', 'PUTINA', 1),
(1880, '20', '11', '02', 'PEDRO VILCA APAZA', 1),
(1881, '20', '11', '03', 'QUILCAPUNCU', 1),
(1882, '20', '11', '04', 'ANANEA', 1),
(1883, '20', '11', '05', 'SINA', 1),
(1884, '20', '12', '00', 'EL COLLAO', 1),
(1885, '20', '12', '01', 'ILAVE', 1),
(1886, '20', '12', '02', 'PILCUYO', 1),
(1887, '20', '12', '03', 'SANTA ROSA', 1),
(1888, '20', '12', '04', 'CAPASO', 1),
(1889, '20', '12', '05', 'CONDURIRI', 1),
(1890, '20', '13', '00', 'MOHO', 1),
(1891, '20', '13', '01', 'MOHO', 1),
(1892, '20', '13', '02', 'CONIMA', 1),
(1893, '20', '13', '03', 'TILALI', 1),
(1894, '20', '13', '04', 'HUAYRAPATA', 1),
(1895, '21', '00', '00', 'SAN MARTIN', 1),
(1896, '21', '01', '00', 'MOYOBAMBA', 1),
(1897, '21', '01', '01', 'MOYOBAMBA', 1),
(1898, '21', '01', '02', 'CALZADA', 1),
(1899, '21', '01', '03', 'HABANA', 1),
(1900, '21', '01', '04', 'JEPELACIO', 1),
(1901, '21', '01', '05', 'SORITOR', 1),
(1902, '21', '01', '06', 'YANTALO', 1),
(1903, '21', '02', '00', 'HUALLAGA', 1),
(1904, '21', '02', '01', 'SAPOSOA', 1),
(1905, '21', '02', '02', 'PISCOYACU', 1),
(1906, '21', '02', '03', 'SACANCHE', 1),
(1907, '21', '02', '04', 'TINGO DE SAPOSOA', 1),
(1908, '21', '02', '05', 'ALTO SAPOSOA', 1),
(1909, '21', '02', '06', 'EL ESLABON', 1),
(1910, '21', '03', '00', 'LAMAS', 1),
(1911, '21', '03', '01', 'LAMAS', 1),
(1912, '21', '03', '03', 'BARRANQUITA', 1),
(1913, '21', '03', '04', 'CAYNARACHI', 1),
(1914, '21', '03', '05', 'CUÑUMBUQUI', 1),
(1915, '21', '03', '06', 'PINTO RECODO', 1),
(1916, '21', '03', '07', 'RUMISAPA', 1),
(1917, '21', '03', '11', 'SHANAO', 1),
(1918, '21', '03', '13', 'TABALOSOS', 1),
(1919, '21', '03', '14', 'ZAPATERO', 1),
(1920, '21', '03', '15', 'ALONSO DE ALVARADO', 1),
(1921, '21', '03', '16', 'SAN ROQUE DE CUMBAZA', 1),
(1922, '21', '04', '00', 'MARISCAL CACERES', 1),
(1923, '21', '04', '01', 'JUANJUI', 1),
(1924, '21', '04', '02', 'CAMPANILLA', 1),
(1925, '21', '04', '03', 'HUICUNGO', 1),
(1926, '21', '04', '04', 'PACHIZA', 1),
(1927, '21', '04', '05', 'PAJARILLO', 1),
(1928, '21', '05', '00', 'RIOJA', 1),
(1929, '21', '05', '01', 'RIOJA', 1),
(1930, '21', '05', '02', 'POSIC', 1),
(1931, '21', '05', '03', 'YORONGOS', 1),
(1932, '21', '05', '04', 'YURACYACU', 1),
(1933, '21', '05', '05', 'NUEVA CAJAMARCA', 1),
(1934, '21', '05', '06', 'ELIAS SOPLIN VARGAS', 1),
(1935, '21', '05', '07', 'SAN FERNANDO', 1),
(1936, '21', '05', '08', 'PARDO MIGUEL', 1),
(1937, '21', '05', '09', 'AWAJUN', 1),
(1938, '21', '06', '00', 'SAN MARTIN', 1),
(1939, '21', '06', '01', 'TARAPOTO', 1),
(1940, '21', '06', '02', 'ALBERTO LEVEAU', 1),
(1941, '21', '06', '04', 'CACATACHI', 1),
(1942, '21', '06', '06', 'CHAZUTA', 1),
(1943, '21', '06', '07', 'CHIPURANA', 1),
(1944, '21', '06', '08', 'EL PORVENIR', 1),
(1945, '21', '06', '09', 'HUIMBAYOC', 1),
(1946, '21', '06', '10', 'JUAN GUERRA', 1),
(1947, '21', '06', '11', 'MORALES', 1),
(1948, '21', '06', '12', 'PAPAPLAYA', 1),
(1949, '21', '06', '16', 'SAN ANTONIO', 1),
(1950, '21', '06', '19', 'SAUCE', 1),
(1951, '21', '06', '20', 'SHAPAJA', 1),
(1952, '21', '06', '21', 'LA BANDA DE SHILCAYO', 1),
(1953, '21', '07', '00', 'BELLAVISTA', 1),
(1954, '21', '07', '01', 'BELLAVISTA', 1),
(1955, '21', '07', '02', 'SAN RAFAEL', 1),
(1956, '21', '07', '03', 'SAN PABLO', 1),
(1957, '21', '07', '04', 'ALTO BIAVO', 1),
(1958, '21', '07', '05', 'HUALLAGA', 1),
(1959, '21', '07', '06', 'BAJO BIAVO', 1),
(1960, '21', '08', '00', 'TOCACHE', 1),
(1961, '21', '08', '01', 'TOCACHE', 1),
(1962, '21', '08', '02', 'NUEVO PROGRESO', 1),
(1963, '21', '08', '03', 'POLVORA', 1),
(1964, '21', '08', '04', 'SHUNTE', 1),
(1965, '21', '08', '05', 'UCHIZA', 1),
(1966, '21', '09', '00', 'PICOTA', 1),
(1967, '21', '09', '01', 'PICOTA', 1),
(1968, '21', '09', '02', 'BUENOS AIRES', 1),
(1969, '21', '09', '03', 'CASPIZAPA', 1),
(1970, '21', '09', '04', 'PILLUANA', 1),
(1971, '21', '09', '05', 'PUCACACA', 1),
(1972, '21', '09', '06', 'SAN CRISTOBAL', 1),
(1973, '21', '09', '07', 'SAN HILARION', 1),
(1974, '21', '09', '08', 'TINGO DE PONASA', 1),
(1975, '21', '09', '09', 'TRES UNIDOS', 1),
(1976, '21', '09', '10', 'SHAMBOYACU', 1),
(1977, '21', '10', '00', 'EL DORADO', 1),
(1978, '21', '10', '01', 'SAN JOSE DE SISA', 1),
(1979, '21', '10', '02', 'AGUA BLANCA', 1),
(1980, '21', '10', '03', 'SHATOJA', 1),
(1981, '21', '10', '04', 'SAN MARTIN', 1),
(1982, '21', '10', '05', 'SANTA ROSA', 1),
(1983, '22', '00', '00', 'TACNA', 1),
(1984, '22', '01', '00', 'TACNA', 1),
(1985, '22', '01', '01', 'TACNA', 1),
(1986, '22', '01', '02', 'CALANA', 1),
(1987, '22', '01', '04', 'INCLAN', 1),
(1988, '22', '01', '07', 'PACHIA', 1),
(1989, '22', '01', '08', 'PALCA', 1),
(1990, '22', '01', '09', 'POCOLLAY', 1),
(1991, '22', '01', '10', 'SAMA', 1),
(1992, '22', '01', '11', 'ALTO DE LA ALIANZA', 1),
(1993, '22', '01', '12', 'CIUDAD NUEVA', 1),
(1994, '22', '01', '13', 'CORONEL GREGORIO ALBARRACIN L.', 1),
(1995, '22', '02', '00', 'TARATA', 1),
(1996, '22', '02', '01', 'TARATA', 1),
(1997, '22', '02', '05', 'HEROES ALBARRACIN', 1),
(1998, '22', '02', '06', 'ESTIQUE', 1),
(1999, '22', '02', '07', 'ESTIQUE PAMPA', 1),
(2000, '22', '02', '10', 'SITAJARA', 1),
(2001, '22', '02', '11', 'SUSAPAYA', 1),
(2002, '22', '02', '12', 'TARUCACHI', 1),
(2003, '22', '02', '13', 'TICACO', 1),
(2004, '22', '03', '00', 'JORGE BASADRE', 1),
(2005, '22', '03', '01', 'LOCUMBA', 1),
(2006, '22', '03', '02', 'ITE', 1),
(2007, '22', '03', '03', 'ILABAYA', 1),
(2008, '22', '04', '00', 'CANDARAVE', 1),
(2009, '22', '04', '01', 'CANDARAVE', 1),
(2010, '22', '04', '02', 'CAIRANI', 1),
(2011, '22', '04', '03', 'CURIBAYA', 1),
(2012, '22', '04', '04', 'HUANUARA', 1),
(2013, '22', '04', '05', 'QUILAHUANI', 1),
(2014, '22', '04', '06', 'CAMILACA', 1),
(2015, '23', '00', '00', 'TUMBES', 1),
(2016, '23', '01', '00', 'TUMBES', 1),
(2017, '23', '01', '01', 'TUMBES', 1),
(2018, '23', '01', '02', 'CORRALES', 1),
(2019, '23', '01', '03', 'LA CRUZ', 1),
(2020, '23', '01', '04', 'PAMPAS DE HOSPITAL', 1),
(2021, '23', '01', '05', 'SAN JACINTO', 1),
(2022, '23', '01', '06', 'SAN JUAN DE LA VIRGEN', 1),
(2023, '23', '02', '00', 'CONTRALMIRANTE VILLAR', 1),
(2024, '23', '02', '01', 'ZORRITOS', 1),
(2025, '23', '02', '02', 'CASITAS', 1),
(2026, '23', '02', '03', 'CANOAS DE PUNTA SAL', 1),
(2027, '23', '03', '00', 'ZARUMILLA', 1),
(2028, '23', '03', '01', 'ZARUMILLA', 1),
(2029, '23', '03', '02', 'MATAPALO', 1),
(2030, '23', '03', '03', 'PAPAYAL', 1),
(2031, '23', '03', '04', 'AGUAS VERDES', 1),
(2032, '24', '00', '00', 'CALLAO', 1),
(2033, '24', '01', '00', 'CALLAO', 1),
(2034, '24', '01', '01', 'CALLAO', 1),
(2035, '24', '01', '02', 'BELLAVISTA', 1),
(2036, '24', '01', '03', 'LA PUNTA', 1),
(2037, '24', '01', '04', 'CARMEN DE LA LEGUA-REYNOSO', 1),
(2038, '24', '01', '05', 'LA PERLA', 1),
(2039, '24', '01', '06', 'VENTANILLA', 1),
(2040, '25', '00', '00', 'UCAYALI', 1),
(2041, '25', '01', '00', 'CORONEL PORTILLO', 1),
(2042, '25', '01', '01', 'CALLERIA', 1),
(2043, '25', '01', '02', 'YARINACOCHA', 1),
(2044, '25', '01', '03', 'MASISEA', 1),
(2045, '25', '01', '04', 'CAMPOVERDE', 1),
(2046, '25', '01', '05', 'IPARIA', 1),
(2047, '25', '01', '06', 'NUEVA REQUENA', 1),
(2048, '25', '01', '07', 'MANANTAY', 1),
(2049, '25', '02', '00', 'PADRE ABAD', 1),
(2050, '25', '02', '01', 'PADRE ABAD', 1),
(2051, '25', '02', '02', 'IRAZOLA', 1),
(2052, '25', '02', '03', 'CURIMANA', 1),
(2053, '25', '03', '00', 'ATALAYA', 1),
(2054, '25', '03', '01', 'RAIMONDI', 1),
(2055, '25', '03', '02', 'TAHUANIA', 1),
(2056, '25', '03', '03', 'YURUA', 1),
(2057, '25', '03', '04', 'SEPAHUA', 1),
(2058, '25', '04', '00', 'PURUS', 1),
(2059, '25', '04', '01', 'PURUS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perfil_id` int(11) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUsuario`, `usuario`, `perfil_id`, `password`, `remember_token`, `fecha_registro`, `session_id`) VALUES
(1, 'test.cajero1', 1, '$2y$10$8hjo9mowaz5nauKbMhhSFeaIaHIR6wCEcwr2ioi6chy183PB45ngC', 'GBKA6kHlwBztznIJ4PNqXF9KrZfyxBgiduF2KzCpjR1ZPlpjD8PS1KvbWPkg', '2019-03-20 17:50:59', 'DRqNMbwaEAY2WQ43FQNQUqOU4PBYtr9ViNLf5cFC'),
(2, 'test.cajero2', 1, '$2y$10$8hjo9mowaz5nauKbMhhSFeaIaHIR6wCEcwr2ioi6chy183PB45ngC', 'wzyr6inbTGYlJqM0QeIXEcjiA9wekwy7oDmUU209N2WLmxeE8sWUTFyU6YOV', '2019-03-20 17:50:59', ''),
(3, 'test.cajero3', 1, '$2y$10$8hjo9mowaz5nauKbMhhSFeaIaHIR6wCEcwr2ioi6chy183PB45ngC', '9yX772IlNWKtFarSqDDwFqVLeKFk9Ixt1FyHK2ieV0jiLRf1F1Y5gXIja3rY', '2019-03-20 17:51:00', ''),
(4, 'test.cajero4', 1, '$2y$10$SouD8VeM6.6jANR9zySj9.19S3xBMneVCxfdWROf3TtvcePLHIZSu', NULL, '2019-05-23 11:21:09', ''),
(5, 'test.cajero5', 1, '$2y$10$qjj2r/jniPjl/MAoD3CGVuVi8IN0qvXL/c4JQqxWz6D9/TCqEQlMW', NULL, '2019-05-23 11:21:10', ''),
(6, 'test.cajero6', 1, '$2y$10$8nZbD8p.6i7o4wvCh2lPa.U72HokGnaxPWIa3Q2pjVLoOLHRqU7nG', NULL, '2019-05-23 11:21:10', ''),
(7, 'test.cajero7', 1, '$2y$10$mbzCWvH/ElTo1LQF.2x0nek6f3Dkf8aQjwvZTCR/xcuhpr9KO5SzK', NULL, '2019-05-23 11:21:10', ''),
(8, 'test.cajero8', 1, '$2y$10$.E40t8IfHGroGXU5IoUe3e6I4DPm7JUsJlLBfRWW29Yw.WinHXMA.', NULL, '2019-05-23 11:21:10', ''),
(9, 'test.cajero9', 1, '$2y$10$vNMp0ozabWJ/21iLphd.aedX5xFJ0ZjQhuqMsiVnSxXxP78stvUbC', NULL, '2019-05-23 11:21:10', ''),
(10, 'test.cajero10', 1, '$2y$10$qL74as5J8kN4wPrhi2bmg.SAz0Jx0V0kpHDTLgUXxF5FzzCnGAWTi', NULL, '2019-05-23 11:21:10', ''),
(11, 'test.cajero11', 1, '$2y$10$vn8kbaS.laqOaC7sXLo9PuyqyYH1UevGHeREpX2dFXcReyGS96oGK', NULL, '2019-05-23 11:21:10', ''),
(12, 'test.cajero12', 1, '$2y$10$M1pAcVOZTekl1v3LpktXGuN1RUBTb9ko40JQr/1sWc.4F6.JgOa2u', NULL, '2019-05-23 11:21:10', ''),
(13, 'test.cajero13', 1, '$2y$10$ba/3SQRi7w3jMCjpX29AJOQ1kEmO9BhHlHDfROP8lIpcCN5VUuk92', NULL, '2019-05-23 11:21:10', ''),
(14, 'test.cajero14', 1, '$2y$10$ImPeHIyvO4/HCxfzJyIzmuH0igd5iJfc0MUYaKC1anwXEqXZBxdfG', NULL, '2019-05-23 11:21:11', ''),
(15, 'test.cajero15', 1, '$2y$10$AW06G0JYOddGP0kufCLz1OhFVxOwgAXHEy3zhVSqzvyA3ob4EG9ay', NULL, '2019-05-23 11:21:11', ''),
(16, 'test.cajero16', 1, '$2y$10$/qLjeawy1.aUoC9Vn0EnOO4dTgNqx3CCOx2NCyHHPRw.5eb4INd4m', NULL, '2019-05-23 11:21:11', ''),
(17, 'test.cajero17', 1, '$2y$10$T4vm/3Y7oI9xqGEriizDKONrfBELoJJaYJSG1Y6jDSK8lDkIieb..', NULL, '2019-05-23 11:21:11', ''),
(18, 'test.cajero18', 1, '$2y$10$tSBer5/4ek8TExRJtsUoZOJuiktjoUeSZXhOL7jylyLMIm4VFK9PC', NULL, '2019-05-23 11:21:11', ''),
(19, 'test.cajero19', 1, '$2y$10$0VOsWvgAKGem/cXc1h7R8eioOoSaClEy80SgR4MlFqAAObrwWdiZy', NULL, '2019-05-23 11:21:11', ''),
(20, 'test.cajero20', 1, '$2y$10$gYkBn27J5cG0ExNc2u7vk.Rq01u4VEBn3Rs94SYzwQ865is2pXBIW', NULL, '2019-05-23 11:21:11', ''),
(21, 'test.cajero21', 1, '$2y$10$sTZY97r1UEpt8D6yQXAWOOJ7Sad7BUg2pe1V3kG5XC4PzD.8FMBlG', NULL, '2019-05-23 11:21:11', ''),
(22, 'test.cajero22', 1, '$2y$10$JyZsspUGpgzt1huMlGfp2OTPy.i/WkwpRR3eO0.YESIC2OQMPyv1K', NULL, '2019-05-23 11:21:11', ''),
(23, 'test.cajero23', 1, '$2y$10$Oi05fkmwEVvPzV1xlzvg1eMgjMqUdXZaBdbHXoDkHhx.kLs.fHyNS', NULL, '2019-05-23 11:21:11', ''),
(24, 'test.cajero24', 1, '$2y$10$3o3afzGGk2VGYbAIknc64u9O2K3H5nxn0RS73D82w/qpqeLh3ZXLG', NULL, '2019-05-23 11:21:11', ''),
(25, 'test.cajero25', 1, '$2y$10$tqUpbmIVA1yEHeFceivShu0rqj6EP2yA2vGEJIpNyEX7XeYr0AQd2', NULL, '2019-05-23 11:21:11', ''),
(26, 'test.cajero26', 1, '$2y$10$v8kxcG5BuyqkseoqRydhteosWXv4wIkQeTwEVKI4bJWeBaR0ZrE8.', NULL, '2019-05-23 11:21:12', ''),
(27, 'test.cajero27', 1, '$2y$10$VEfelHw85cxw5w0F4gf24uTmU./tOtoHorCEZzOOUOIcyuMG4c7HG', NULL, '2019-05-23 11:21:12', ''),
(28, 'test.cajero28', 1, '$2y$10$miT9fFCuGK6BoTKoVwUXiOCymnVHesr83RWYxq5fV.zsIDpoqSaWK', NULL, '2019-05-23 11:21:12', ''),
(29, 'test.cajero29', 1, '$2y$10$lXVCiInTtcN5BhKCCunWeOUxuTZrSsRTqWQIv0MePTwP3fKB9dTWS', NULL, '2019-05-23 11:21:12', ''),
(30, 'test.cajero30', 1, '$2y$10$abBYZXvSu1lMlZ3IBYEFh.S86lUsWkqdj6zCykaEGDoggP8F14T/6', NULL, '2019-05-23 11:21:12', ''),
(31, 'test.cajero31', 1, '$2y$10$774mdJGfWuKTJAXHHx6lKOgFlBda8tl/mtiieYva6oeoPV7vA365a', NULL, '2019-05-23 11:21:12', ''),
(32, 'test.cajero32', 1, '$2y$10$unnoc0/u3uAHoJVyGx1RXONVX8CIuXRIn2J1uC9INIzZpzsilG2LO', NULL, '2019-05-23 11:21:12', ''),
(33, 'test.cajero33', 1, '$2y$10$81IH919CbibXuK3tWALV4euA5k43mOzSmxyEzg1ZiYfcFgNOebfXu', NULL, '2019-05-23 11:21:12', ''),
(34, 'test.cajero34', 1, '$2y$10$urWJ9dIR62RnMfmk11qW4..xI4rKI/UmipiTyvOIsG/YfWfPb4U7q', NULL, '2019-05-23 11:21:12', ''),
(35, 'test.cajero35', 1, '$2y$10$FyBPKJO4lUjvBOWrkyMP6udr1Fx3SSV6wmehI3FI25sTHmjpovuGm', NULL, '2019-05-23 11:21:12', ''),
(36, 'test.cajero36', 1, '$2y$10$rwSUKdkgRdWgGie.51WMkO5h64Ntez8hoz6govBs1xa.s33r7epmm', NULL, '2019-05-23 11:21:12', ''),
(37, 'test.cajero37', 1, '$2y$10$AMGa2vCYfXDY7Csq6FwG/u/I8CPV6S7TwuCNQ52OmGF2v83JpX5q2', NULL, '2019-05-23 11:21:13', ''),
(38, 'test.cajero38', 1, '$2y$10$4SK1hgtAL3hXHnvJVRR0deyuk5e1RyD7KvmtYgAS2ulGZjwwyiFaW', NULL, '2019-05-23 11:21:13', ''),
(39, 'test.cajero39', 1, '$2y$10$.0ElPNOf.sDZRRXGXfePOul7sFmpYfjVdt6iYzdIAXi7EZ2BsEooO', NULL, '2019-05-23 11:21:13', ''),
(40, 'test.cajero40', 1, '$2y$10$FEh4za/wiC6Tz6og2lRz.OMC2Y3WOmX6dgwke1Q.eVT22M7IkeNjK', NULL, '2019-05-23 11:21:13', ''),
(41, 'test.cajero41', 1, '$2y$10$4C8.dq6KgAl/0ugQ6/ZL3esliZc2JwUMB2oZ44.le.cm8D1rIURWu', NULL, '2019-05-23 11:21:13', ''),
(42, 'test.cajero42', 1, '$2y$10$2uvnChJRmhi8.VE1lSuUke7TI6ldu5ekld2nI4tmwRJHXPHHqKhzG', NULL, '2019-05-23 11:21:13', ''),
(43, 'test.cajero43', 1, '$2y$10$7R6G7JvbKnHR1F6GrkoQWuwtfgQL2nuIf.b9W2NQKE74Ao8k/lCSm', NULL, '2019-05-23 11:21:13', ''),
(44, 'test.cajero44', 1, '$2y$10$/NeOn9aeP8E9j6R9GHfNh.Gaj8s9.u07rg5rr3m57Amr/l2FzwL1.', NULL, '2019-05-23 11:21:13', ''),
(45, 'test.cajero45', 1, '$2y$10$5oYSbfgMSm5WHUqlxpewAOZjXEXrIVDmdKRZ.Wp4ceBvBHmY./B7C', NULL, '2019-05-23 11:21:13', ''),
(46, 'test.cajero46', 1, '$2y$10$IJ0bo/CiL0pPKe/zcko1sOUJRbTIpbSirfBzSZzA251AlBXs1v5Lu', NULL, '2019-05-23 11:21:13', ''),
(47, 'test.cajero47', 1, '$2y$10$gRK9NWFdbIcNj6vHToWj.elrlATGXi8vwFyjH5ZPZG6lUW2pJatyq', NULL, '2019-05-23 11:21:13', ''),
(48, 'test.cajero48', 1, '$2y$10$xNCrKEPLJGmg01fzA89VMeNlaM0h8gkrSlj04pJrSK/8zV1Z4ZAem', NULL, '2019-05-23 11:21:14', ''),
(49, 'test.cajero49', 1, '$2y$10$VqhIOeloLfym2sVvo3Wq2.SeQ0jD7lx3uYaNo233soZOH9kRj0BjC', NULL, '2019-05-23 11:21:14', ''),
(50, 'test.cajero50', 1, '$2y$10$bnU7fcAcXovZSAbMVJaDbeGsS4gjpoJlcf0k857lACo0clDKZHvty', NULL, '2019-05-23 11:21:14', ''),
(51, 'test.cajero51', 1, '$2y$10$o55Y9Bj0bUJNR/HRDkOe7.QHxAoY62GiIjitDlliXO/qQ1qjHugmm', NULL, '2019-05-23 11:21:14', ''),
(52, 'test.cajero52', 1, '$2y$10$lG4oSb2QJ0jjtYZwawBwaui6uVq96DVSJrBaBfym/ZAqa0EZTl/ZS', NULL, '2019-05-23 11:21:14', ''),
(53, 'test.cajero53', 1, '$2y$10$a2CfmZXHNFwGHjZ4fuTwD.Ued84wnYduGJNEcjVx3LV/t8JJ.FlWy', NULL, '2019-05-23 11:21:14', ''),
(54, 'test.cajero54', 1, '$2y$10$SWt.j24T4/NhlQjZE7tOQ.bM83dklQ1bagC2ezp7qilqrHvtrPMoC', NULL, '2019-05-23 11:21:14', ''),
(55, 'test.cajero55', 1, '$2y$10$UVqTIZyKXcJVH.RNfdPQLemFmqo1XAZdHUrHzgxjgxVkXCC6465Di', NULL, '2019-05-23 11:21:14', ''),
(56, 'test.cajero56', 1, '$2y$10$YGAmBeCtkxIFZgCghWDJ0O5etFTDJEPDY6Vc6MDw4JlRQQ2qsj3Oy', NULL, '2019-05-23 11:21:14', ''),
(57, 'test.cajero57', 1, '$2y$10$i6M46ON7NFTw6w5nHoCH8.05lIbaKK1dpTJsyjZrzQMKXkRl6LNxS', NULL, '2019-05-23 11:21:14', ''),
(58, 'test.cajero58', 1, '$2y$10$c8F38H4WluG/VcYOo9sURuZ.nsBicNBZJVSk5u4BNKTbI1qmXUxFO', NULL, '2019-05-23 11:21:14', ''),
(59, 'test.cajero59', 1, '$2y$10$eElkN690AIHa/IvMHEqcDe37Y/Y2yvwwXx0z2pLrstYYjogZDyizq', NULL, '2019-05-23 11:21:15', ''),
(60, 'test.cajero60', 1, '$2y$10$gaQRU/1p21jVksJWDrBK1eKBe.JgMMrTYz6Vo5IJ0lTPv0pV.2CUa', NULL, '2019-05-23 11:21:15', ''),
(61, 'test.cajero61', 1, '$2y$10$gVBgSVH9eXxS5IbcQSQCueZIRg1nRwmuN4S1Mn7/fRSyKOB9Vv1dS', NULL, '2019-05-23 11:21:15', ''),
(62, 'test.cajero62', 1, '$2y$10$aEiWTY49yEJfvkAt/3wIheV0RVLZNvPPofZoDYOZudk94G5MZwY9e', NULL, '2019-05-23 11:21:15', ''),
(63, 'test.cajero63', 1, '$2y$10$8zdkeZkJ2Wl0kTO7CoABX.ZdDU1HxH6P59OGhc0H.aa2gm08OR4FS', NULL, '2019-05-23 11:21:15', ''),
(64, 'test.cajero64', 1, '$2y$10$SB2uJfSEK40P20rw0xGM1uxLouHr..lAPc3fup/Op9eHh/fMTMsUm', NULL, '2019-05-23 11:21:15', ''),
(65, 'test.cajero65', 1, '$2y$10$n/yXKoPeSrzPwyg6PFPeveKCK4JaKYWEaVqQeiUmNgbfFd7aMzbGS', NULL, '2019-05-23 11:21:15', ''),
(66, 'test.cajero66', 1, '$2y$10$IyhLHIawCWoS9p4R7DkhW.9XaaGAZbaZ9dYFtTFRcm/6WoAzN1yQa', NULL, '2019-05-23 11:21:15', ''),
(67, 'test.cajero67', 1, '$2y$10$Q40.t5UaLmRkC3f6hQlA7e9.85mWAJe.DmA7SaGMkFdPfa8keeUQ2', NULL, '2019-05-23 11:21:15', ''),
(68, 'test.cajero68', 1, '$2y$10$GNuaUIKqwr5xhJ9rhBjj3.d54fgrZzDqTiSqMSFiEX7OgwY1cVCWW', NULL, '2019-05-23 11:21:15', ''),
(69, 'test.cajero69', 1, '$2y$10$oSRRN4NKzF.gcI2LeFGfPugBkiIt65zEgnbpbbo8CskYmrJF6CdU.', NULL, '2019-05-23 11:21:15', ''),
(70, 'test.cajero70', 1, '$2y$10$cXYQsyTq9nXP5xxt7QQGo.gCL7tYU2yNG7BRjZckIwAekWL3TlTUm', NULL, '2019-05-23 11:21:15', ''),
(71, 'test.cajero71', 1, '$2y$10$xMhrX/qt9CG5wg7et9iCm.L5A1XWXTwVXqQ5k.5dxAJkz4h2A8RFO', NULL, '2019-05-23 11:21:16', ''),
(72, 'test.cajero72', 1, '$2y$10$RG16cX3tyiR6mcDPQGsltOSAqycnhPmtL5mdYD5vfip8hanzNEN6S', NULL, '2019-05-23 11:21:16', ''),
(73, 'test.cajero73', 1, '$2y$10$sJQXvOWx62vLU3jXXxCNx.BjVTsb.LFY9OiYeFe77247ZcycWOmm2', NULL, '2019-05-23 11:21:16', ''),
(74, 'test.cajero74', 1, '$2y$10$s9/lDliPJLOgb5K2G0.5g.DY4dIMAX5aaaRaU5OwIwZLe6BwsKPGa', NULL, '2019-05-23 11:21:16', ''),
(75, 'test.cajero75', 1, '$2y$10$I3Pa3TP.gf/6zSbbo0XpVOxxmbbP6dtnHpEuPLxviOASMK3XgJfQ6', NULL, '2019-05-23 11:21:16', ''),
(76, 'test.cajero76', 1, '$2y$10$3T8S3M0RNj5ZkY4pSgZfWuD.hmLwe8TNzMrwOM4t0T2aiqTP5IXHO', NULL, '2019-05-23 11:21:16', ''),
(77, 'test.cajero77', 1, '$2y$10$Y.kOy5BDLmPNdA08TkFyu.eKRczlrjWXQ1InvldpDHBZcesgLVdQO', NULL, '2019-05-23 11:21:16', ''),
(78, 'test.cajero78', 1, '$2y$10$JJIwLL4Z1YzJnUDdrqWhAufPNBvfdQD9Eayl.JhdQAbUAPQll7tsm', NULL, '2019-05-23 11:21:16', ''),
(79, 'test.cajero79', 1, '$2y$10$CcwOZaPa6fIzuZg3P7frg.ZbpDwee7y7hddln1Wn7iwM.nK3QM9Wa', NULL, '2019-05-23 11:21:16', ''),
(80, 'test.cajero80', 1, '$2y$10$sO1RPBJAu2aF1wBTybwfRO.n1G1YucQXa/OwW./44zvLfQkkFhtby', NULL, '2019-05-23 11:21:16', ''),
(81, 'test.cajero81', 1, '$2y$10$g8kpINE2SJMymftv7zHnZ.R.BtWwdkAG2GVGFWrsk918QMjWAT3e6', NULL, '2019-05-23 11:21:16', ''),
(82, 'test.cajero82', 1, '$2y$10$7qSqeIvaMND/0ks.y3iGkeSxfz7BgA9RizVIgPDvtXsQbbHiwlBMW', NULL, '2019-05-23 11:21:17', ''),
(83, 'test.cajero83', 1, '$2y$10$u0nWD.iSUaLM3OHozNpjJ.nN7qqzRVifQY6wCbmo7oQTeeZO.1vfm', NULL, '2019-05-23 11:21:17', ''),
(84, 'test.cajero84', 1, '$2y$10$UN48Art8mrkSCIoP/XTjJuapzqevJu7omIrxmErgvZgmEPZveEwA2', NULL, '2019-05-23 11:21:17', ''),
(85, 'test.cajero85', 1, '$2y$10$l.c7jv/YG27sK3/BktLOo.NVNMlk8Ddh9cvNHhVxGhwImjDyV/R5m', NULL, '2019-05-23 11:21:17', ''),
(86, 'test.cajero86', 1, '$2y$10$v/8M3Rrgu3iIl9cS97XogeGMP2jU027U8qGKuq/kMp.1lFP7YnJuy', NULL, '2019-05-23 11:21:17', ''),
(87, 'test.cajero87', 1, '$2y$10$62snvxdLx6sCLguZwB4eyOPIJVN78LMVNG/B.N4fKDA/T1Pp3sD5C', NULL, '2019-05-23 11:21:17', ''),
(88, 'test.cajero88', 1, '$2y$10$R9CtLaEFJikZSJQ7T1qIPeoFyFQiyanKpMhD9g2Wq/JhA6bfYSBXC', NULL, '2019-05-23 11:21:17', ''),
(89, 'test.cajero89', 1, '$2y$10$QpUkCwGV6KEuf0UcPqDZbuJH.dWdsufPuTYQJibJVNb2pKv5lySMm', NULL, '2019-05-23 11:21:17', ''),
(90, 'test.cajero90', 1, '$2y$10$CQRZ2JvLuwtr/o8H.cLh2.XP7p.gqrtAz3W5iZnVO/6BOjxuaWuGO', NULL, '2019-05-23 11:21:17', ''),
(91, 'test.cajero91', 1, '$2y$10$z4Kn99mzQPuAFfX7N1nX2Or4reY0yVx.u5.bmJpBEyU0uqwGVYUMe', NULL, '2019-05-23 11:21:17', ''),
(92, 'test.cajero92', 1, '$2y$10$qCMIeZ2vzecCqRUnJ16qFumDEFCJwyx8gEquYky4YX7S/XdRsalbm', NULL, '2019-05-23 11:21:17', ''),
(93, 'test.cajero93', 1, '$2y$10$zaunlaOtqVNDhdsB4cSZRe5lSATgrq2/68lOqkfGCisqQFyh69wlS', NULL, '2019-05-23 11:21:18', ''),
(94, 'test.cajero94', 1, '$2y$10$82UMJHOtnY90.cAX6HKUzuRL7eOAEYwswnd87e7k9zGj7kAqpNKTK', NULL, '2019-05-23 11:21:18', ''),
(95, 'test.cajero95', 1, '$2y$10$jJKdihs0pdNLcReR5L77seHJVUyiH.UOHHmlXebhlZWpjCLIizwL2', NULL, '2019-05-23 11:21:18', ''),
(96, 'test.cajero96', 1, '$2y$10$x3AXF.VAEsnJPol4dNqK7ObeToqC0WOwCWgS6VeguDubDlQkojdRe', NULL, '2019-05-23 11:21:18', ''),
(97, 'test.cajero97', 1, '$2y$10$SkStOqmeWswv3CLXMSsJVeiUzi7PXl42xIOSLKctBJeuj/YzzUKpu', NULL, '2019-05-23 11:21:18', ''),
(98, 'test.cajero98', 1, '$2y$10$lxKMfG3x1NNc5uXUIPABI.ZuIUW8BNZEe.RgMXN06lysdcHnxVpvy', NULL, '2019-05-23 11:21:18', ''),
(99, 'test.cajero99', 1, '$2y$10$YB91sBMek0WHLDpeuvUsS.G8d6XrlpdUF5uqPFsSrAGsZ7wYMEv/i', NULL, '2019-05-23 11:21:18', ''),
(100, 'test.cajero100', 1, '$2y$10$iivryYvm53fRpEzO0XuIGeZzrzfttII4tHDwLhfF.6YezCAiM5WYq', NULL, '2019-05-23 11:21:18', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_punto_venta`
--

CREATE TABLE `usuario_punto_venta` (
  `idUsuarioPuntoVenta` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPuntoVenta` int(11) UNSIGNED NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_punto_venta`
--

INSERT INTO `usuario_punto_venta` (`idUsuarioPuntoVenta`, `idUsuario`, `idPuntoVenta`, `estado`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0),
(6, 1, 7, 0),
(7, 1, 6, 0),
(8, 1, 8, 0),
(9, 1, 10, 0),
(10, 1, 9, 0),
(12, 1, 11, 0),
(13, 1, 12, 0),
(14, 2, 2, 1),
(15, 1, 241, 0),
(16, 2, 241, 0),
(17, 3, 9, 1),
(18, 2, 7, 0),
(19, 3, 8, 1),
(20, 100, 259, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apertura_caja`
--
ALTER TABLE `apertura_caja`
  ADD PRIMARY KEY (`idAperturaCaja`),
  ADD KEY `apertura_caja_fk1` (`idCaja`),
  ADD KEY `apertura_caja_fk2` (`idTurno`);

--
-- Indices de la tabla `apuesta`
--
ALTER TABLE `apuesta`
  ADD PRIMARY KEY (`idApuesta`),
  ADD KEY `apuesta_fk1` (`idTipoApuesta`),
  ADD KEY `apuesta_fk2` (`idTicket`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`idCaja`),
  ADD KEY `caja_fk1` (`idPuntoVenta`);

--
-- Indices de la tabla `configuracion_general`
--
ALTER TABLE `configuracion_general`
  ADD PRIMARY KEY (`idConfiguracion`);

--
-- Indices de la tabla `detalle_punto_venta_tipo_alerta`
--
ALTER TABLE `detalle_punto_venta_tipo_alerta`
  ADD PRIMARY KEY (`idDetallePuntoVentaTipoAlerta`),
  ADD KEY `FK1` (`idPuntoVentaTipoAlerta`);

--
-- Indices de la tabla `dinero_default`
--
ALTER TABLE `dinero_default`
  ADD PRIMARY KEY (`idDineroDefault`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `evento_fk1` (`idJuego`),
  ADD KEY `idMoneda` (`idMoneda`);

--
-- Indices de la tabla `ganador_evento`
--
ALTER TABLE `ganador_evento`
  ADD PRIMARY KEY (`idGanadorEvento`),
  ADD KEY `ganador_evento_fk1` (`idApuesta`);

--
-- Indices de la tabla `historial_alerta`
--
ALTER TABLE `historial_alerta`
  ADD PRIMARY KEY (`idHistorialAlerta`),
  ADD KEY `F8` (`idPuntoVentaTipoAlerta`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`idJuego`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`idMoneda`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos_perfil`
--
ALTER TABLE `permisos_perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `punto_venta`
--
ALTER TABLE `punto_venta`
  ADD PRIMARY KEY (`idPuntoVenta`),
  ADD KEY `punto_venta_fk1` (`idEmpresa`),
  ADD KEY `punto_venta_fk2` (`idUbigeo`);

--
-- Indices de la tabla `punto_venta_tipo_alerta`
--
ALTER TABLE `punto_venta_tipo_alerta`
  ADD PRIMARY KEY (`idPuntoVentaTipoAlerta`),
  ADD KEY `F4` (`idTipoAlerta`),
  ADD KEY `FK3` (`idPuntoVenta`);

--
-- Indices de la tabla `resultado_evento`
--
ALTER TABLE `resultado_evento`
  ADD PRIMARY KEY (`idResultadosEvento`),
  ADD KEY `resultado_evento_fk1` (`idEvento`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `ticket_fk2` (`idEvento`);

--
-- Indices de la tabla `tipo_alerta`
--
ALTER TABLE `tipo_alerta`
  ADD PRIMARY KEY (`idTipoAlerta`);

--
-- Indices de la tabla `tipo_apuesta`
--
ALTER TABLE `tipo_apuesta`
  ADD PRIMARY KEY (`idTipoApuesta`),
  ADD KEY `tipo_apuesta_fk1` (`idTipoPago`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`idTipoPago`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`idTurno`);

--
-- Indices de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
  ADD PRIMARY KEY (`idUbigeo`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `users_email_unique` (`usuario`);

--
-- Indices de la tabla `usuario_punto_venta`
--
ALTER TABLE `usuario_punto_venta`
  ADD PRIMARY KEY (`idUsuarioPuntoVenta`),
  ADD KEY `FK_usuario_punto_venta_users` (`idUsuario`),
  ADD KEY `FK_usuario_punto_venta_punto_venta` (`idPuntoVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apertura_caja`
--
ALTER TABLE `apertura_caja`
  MODIFY `idAperturaCaja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `apuesta`
--
ALTER TABLE `apuesta`
  MODIFY `idApuesta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=827;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2345;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `idCaja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT de la tabla `configuracion_general`
--
ALTER TABLE `configuracion_general`
  MODIFY `idConfiguracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_punto_venta_tipo_alerta`
--
ALTER TABLE `detalle_punto_venta_tipo_alerta`
  MODIFY `idDetallePuntoVentaTipoAlerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `dinero_default`
--
ALTER TABLE `dinero_default`
  MODIFY `idDineroDefault` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idEmpresa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ganador_evento`
--
ALTER TABLE `ganador_evento`
  MODIFY `idGanadorEvento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_alerta`
--
ALTER TABLE `historial_alerta`
  MODIFY `idHistorialAlerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `idJuego` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `permisos_perfil`
--
ALTER TABLE `permisos_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

--
-- AUTO_INCREMENT de la tabla `punto_venta`
--
ALTER TABLE `punto_venta`
  MODIFY `idPuntoVenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT de la tabla `punto_venta_tipo_alerta`
--
ALTER TABLE `punto_venta_tipo_alerta`
  MODIFY `idPuntoVentaTipoAlerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `resultado_evento`
--
ALTER TABLE `resultado_evento`
  MODIFY `idResultadosEvento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `idTicket` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de la tabla `tipo_alerta`
--
ALTER TABLE `tipo_alerta`
  MODIFY `idTipoAlerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_apuesta`
--
ALTER TABLE `tipo_apuesta`
  MODIFY `idTipoApuesta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `idTipoPago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `idTurno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;

--
-- AUTO_INCREMENT de la tabla `usuario_punto_venta`
--
ALTER TABLE `usuario_punto_venta`
  MODIFY `idUsuarioPuntoVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apertura_caja`
--
ALTER TABLE `apertura_caja`
  ADD CONSTRAINT `apertura_caja_fk1` FOREIGN KEY (`idCaja`) REFERENCES `caja` (`idCaja`),
  ADD CONSTRAINT `apertura_caja_fk2` FOREIGN KEY (`idTurno`) REFERENCES `turno` (`idTurno`);

--
-- Filtros para la tabla `apuesta`
--
ALTER TABLE `apuesta`
  ADD CONSTRAINT `apuesta_fk1` FOREIGN KEY (`idTipoApuesta`) REFERENCES `tipo_apuesta` (`idTipoApuesta`),
  ADD CONSTRAINT `apuesta_fk2` FOREIGN KEY (`idTicket`) REFERENCES `ticket` (`idTicket`);

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `caja_fk1` FOREIGN KEY (`idPuntoVenta`) REFERENCES `punto_venta` (`idPuntoVenta`);

--
-- Filtros para la tabla `detalle_punto_venta_tipo_alerta`
--
ALTER TABLE `detalle_punto_venta_tipo_alerta`
  ADD CONSTRAINT `FK5` FOREIGN KEY (`idPuntoVentaTipoAlerta`) REFERENCES `punto_venta_tipo_alerta` (`idPuntoVentaTipoAlerta`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_fk1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`),
  ADD CONSTRAINT `evento_fk2` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`);

--
-- Filtros para la tabla `ganador_evento`
--
ALTER TABLE `ganador_evento`
  ADD CONSTRAINT `ganador_evento_fk1` FOREIGN KEY (`idApuesta`) REFERENCES `apuesta` (`idApuesta`);

--
-- Filtros para la tabla `historial_alerta`
--
ALTER TABLE `historial_alerta`
  ADD CONSTRAINT `F9` FOREIGN KEY (`idPuntoVentaTipoAlerta`) REFERENCES `punto_venta_tipo_alerta` (`idPuntoVentaTipoAlerta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
