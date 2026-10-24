-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2026 a las 20:32:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_otic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `2fa_trusted_devices`
--

CREATE TABLE `2fa_trusted_devices` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `2fa_trusted_devices`
--

INSERT INTO `2fa_trusted_devices` (`id`, `usuario_id`, `token_hash`, `expires_at`, `created_at`) VALUES
(4, 4, 'e888add1dbb1389c78ff903ea27c197d6e736cfa0950d5417be097c62845ca53', '2026-11-19 19:28:37', '2026-10-20 13:28:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`, `descripcion`, `activo`, `created_at`) VALUES
(1, 'Soporte técnico', 'Mantenimiento y reparación de equipos', 1, '2026-06-18 21:55:51'),
(2, 'Telecomunicaciones', 'Redes y comunicaciones', 0, '2026-06-18 21:55:51'),
(3, 'Servidores', 'Administración de servidores y bases de datos', 1, '2026-06-18 21:55:51'),
(4, 'Sistemas y Apps', NULL, 1, '2026-07-21 08:42:09'),
(5, 'Comunidades Virtuales', NULL, 1, '2026-07-21 08:42:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_username` varchar(50) DEFAULT NULL,
  `usuario_rol` varchar(20) DEFAULT NULL,
  `accion` varchar(100) NOT NULL,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `registro_id` int(11) DEFAULT NULL,
  `datos_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `datos_nuevos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `usuario_id`, `usuario_username`, `usuario_rol`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, NULL, 'admin', 'Jefe_OTIC', 'ACTUALIZACION_USUARIO', 'usuarios', 1, '{\"estado_usuario\": \"Activo\", \"rol\": \"Jefe_OTIC\", \"bloqueado_hasta\": \"2026-06-18 19:42:09\"}', '{\"estado_usuario\": \"Activo\", \"rol\": \"Jefe_OTIC\", \"bloqueado_hasta\": \"2026-06-18 19:42:49\"}', NULL, NULL, '2026-06-18 23:12:49'),
(2, NULL, 'admin', 'Jefe_OTIC', 'ACTUALIZACION_USUARIO', 'usuarios', 1, '{\"estado_usuario\": \"Activo\", \"rol\": \"Jefe_OTIC\", \"bloqueado_hasta\": \"2026-06-18 19:42:49\"}', '{\"estado_usuario\": \"Activo\", \"rol\": \"Jefe_OTIC\", \"bloqueado_hasta\": \"2026-06-18 20:42:57\"}', NULL, NULL, '2026-06-19 00:12:57'),
(3, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 00:21:45'),
(4, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 00:22:28'),
(5, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 00:22:40'),
(6, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 5, NULL, '{\"username\":\"coordinador\",\"rol\":\"Coordinador\",\"tipo_sub_usuario\":\"OTIC\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 01:53:07'),
(7, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 01:53:15'),
(8, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 01:53:27'),
(9, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:16:58'),
(10, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:17:20'),
(11, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 6, NULL, '{\"username\":\"tecnico\",\"rol\":\"Tecnico\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:19:47'),
(12, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:19:50'),
(13, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:20:03'),
(14, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:20:15'),
(15, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-19 02:27:52'),
(16, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 14:42:24'),
(17, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:31:05'),
(18, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:31:17'),
(19, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 1, NULL, '{\"codigo\":\"T-2026-0001\",\"titulo\":\"que te importa\",\"estado_inicial\":\"Aprobado\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:46:19'),
(20, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:46:41'),
(21, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:46:49'),
(22, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:54:42'),
(23, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:54:52'),
(24, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 2, NULL, '{\"codigo\":\"T-2026-0002\",\"titulo\":\"que te importa\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:55:10'),
(25, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:55:16'),
(26, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 15:55:26'),
(27, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 9, NULL, '{\"username\":\"sub usuario\",\"rol\":\"Sub_usuario\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:47:41'),
(28, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:47:52'),
(29, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:48:08'),
(30, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 3, NULL, '{\"codigo\":\"T-2026-0003\",\"titulo\":\"que te importa\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:48:36'),
(31, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:49:05'),
(32, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:49:25'),
(33, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:56:54'),
(34, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 19:57:04'),
(35, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:29:53'),
(36, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:41:26'),
(37, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:41:37'),
(38, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:43:00'),
(39, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:43:11'),
(40, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:44:01'),
(41, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:46:34'),
(42, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-20 20:46:46'),
(43, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 06:52:57'),
(44, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 06:57:18'),
(45, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:03:25'),
(46, 4, 'admin', 'Jefe_OTIC', 'ACTUALIZACION_USUARIO', 'usuarios', 4, '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:33:36.000000\"}', '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:33:42.000000\"}', NULL, NULL, '2026-07-21 07:03:42'),
(47, 4, 'admin', 'Jefe_OTIC', 'ACTUALIZACION_USUARIO', 'usuarios', 4, '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:33:42.000000\"}', '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:45:50.000000\"}', NULL, NULL, '2026-07-21 07:15:50'),
(48, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 07:16:00'),
(49, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:17:22'),
(50, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:17:43'),
(51, 4, 'admin', 'Jefe_OTIC', 'ACTUALIZACION_USUARIO', 'usuarios', 4, '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:45:50.000000\"}', '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:47:46.000000\"}', NULL, NULL, '2026-07-21 07:17:46'),
(52, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:17:48'),
(53, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:27:27'),
(54, 4, 'admin', 'Jefe_OTIC', 'ACTUALIZACION_USUARIO', 'usuarios', 4, '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:47:46.000000\"}', '{\"rol\": \"Jefe_OTIC\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 03:57:30.000000\"}', NULL, NULL, '2026-07-21 07:27:30'),
(55, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:27:34'),
(56, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 07:27:40'),
(57, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 07:27:42'),
(58, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 07:29:10'),
(59, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 07:29:34'),
(60, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:31:08'),
(61, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:31:26'),
(62, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:32:11'),
(63, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 1, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:32:13'),
(64, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 4, NULL, '{\"nombre\":\"PNF de Prueba\",\"codigo\":\"PDP\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:32:15'),
(65, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 07:32:35'),
(66, 6, 'tecnico', 'Tecnico', 'CAMBIAR_ESTADO_TICKET', 'tickets', 1, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"En_espera\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:35:04'),
(67, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:35:21'),
(68, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:38:30'),
(69, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:39:53'),
(70, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:39:58'),
(71, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:42:53'),
(72, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 3, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:52:34'),
(73, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:53:23'),
(74, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 07:53:27'),
(75, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:54:22'),
(76, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:54:25'),
(77, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:54:28'),
(78, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:54:31'),
(79, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:55:58'),
(80, 6, 'tecnico', 'Tecnico', 'CAMBIAR_ESTADO_TICKET', 'tickets', 1, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"En_proceso\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:56:00'),
(81, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:56:01'),
(82, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:56:03'),
(83, 5, 'coordinador', 'Coordinador', 'RECHAZAR_SOLUCION_TICKET', 'tickets', 1, NULL, '{\"motivo\":\"Sigue fallando la impresora, no imprime a color.\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 07:56:04'),
(84, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:00:12'),
(85, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:00:39'),
(86, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:08:31'),
(87, 4, 'admin', 'Jefe_OTIC', 'CREAR_TICKET', 'tickets', 4, NULL, '{\"codigo\":\"T-2026-0004\",\"titulo\":\"Prueba RF-05 ubicacion\",\"estado_inicial\":\"En_proceso\",\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:08:32'),
(88, 4, 'admin', 'Jefe_OTIC', 'GENERAR_RESPALDO_BD', 'sistema', NULL, NULL, '{\"archivo\":\"sistema_otic_20260721_080834.sql\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:08:35'),
(89, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:05'),
(90, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_USUARIO', 'usuarios', 10, '{\"username\":\"descartable\",\"rol\":\"Coordinador\"}', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:10'),
(91, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:43'),
(92, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:45'),
(93, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:46'),
(94, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:50'),
(95, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:10:51'),
(96, 6, 'tecnico', 'Tecnico', 'ACTUALIZACION_USUARIO', 'usuarios', 6, '{\"rol\": \"Tecnico\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 04:41:08.000000\"}', '{\"rol\": \"Tecnico\", \"estado_usuario\": \"Activo\", \"bloqueado_hasta\": \"2026-07-21 04:42:22.000000\"}', NULL, NULL, '2026-07-21 08:12:22'),
(97, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'curl/8.21.0', '2026-07-21 08:23:38'),
(98, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:36:02'),
(99, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:37:05'),
(100, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 5, NULL, '{\"nombre\":\"Administracion\",\"codigo\":\"PNF-04\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:38:10'),
(101, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 6, NULL, '{\"nombre\":\"Agroalimentaci\\u00f3n\",\"codigo\":\"PNF-05\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:39:02'),
(102, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 7, NULL, '{\"nombre\":\"Construcci\\u00f3n Civil\",\"codigo\":\"PNF-06\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:39:17'),
(103, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 8, NULL, '{\"nombre\":\"Instrumentaci\\u00f3n y Contro\",\"codigo\":\"PNF-07\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:39:36'),
(104, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 9, NULL, '{\"nombre\":\"Procesos Qu\\u00edmicos\",\"codigo\":\"PNF-08\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:39:50'),
(105, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_PNF', 'pnf', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:40:07'),
(106, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 10, NULL, '{\"nombre\":\"Administraci\\u00f3n de Empresas\",\"codigo\":\"PNF-04\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:40:14'),
(107, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 11, NULL, '{\"nombre\":\"Contadur\\u00eda P\\u00fablica\",\"codigo\":\"PNF-09\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:40:28'),
(108, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 12, NULL, '{\"nombre\":\"Qu\\u00edmica\",\"codigo\":\"PNF-10\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:40:39'),
(109, 4, 'admin', 'Jefe_OTIC', 'CREAR_AREA', 'area', 4, NULL, '{\"nombre\":\"Sistemas y Apps\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:42:09'),
(110, 4, 'admin', 'Jefe_OTIC', 'CREAR_AREA', 'area', 5, NULL, '{\"nombre\":\"Comunidades Virtuales\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:42:25'),
(111, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:48:17'),
(112, 4, 'admin', 'Jefe_OTIC', 'CREAR_PNF', 'pnf', 13, NULL, '{\"nombre\":\"PNF Segundo Temporal\",\"codigo\":\"PST\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:48:19'),
(113, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 5, NULL, '{\"email\":\"hendrykmr4@gmail.com\",\"telefono\":\"04246257872\",\"password_cambiada\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:48:20'),
(114, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:48:22'),
(115, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 5, NULL, '{\"email\":\"hendrykmr4@gmail.com\",\"telefono\":\"04246257872\",\"password_cambiada\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:48:24'),
(116, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_PNF', 'pnf', 13, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 08:48:26'),
(117, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:52:05'),
(118, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 08:52:37'),
(119, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:47:27'),
(120, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:50:43'),
(121, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:50:46'),
(122, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:51:51'),
(123, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:51:52'),
(124, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:52:14'),
(125, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:52:45'),
(126, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:52:57'),
(127, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:53:04'),
(128, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:54:09'),
(129, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:54:11'),
(130, 4, 'admin', 'Jefe_OTIC', 'BLOQUEAR_USUARIO', 'usuarios', 9, NULL, '{\"minutos\":10000}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:54:59'),
(131, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:57:22'),
(132, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 13:57:30'),
(133, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 13:58:38'),
(134, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 13:59:52'),
(135, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:00:10'),
(136, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:00:41'),
(137, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 3, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:01:17'),
(138, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/149.0.7827.55 Safari/537.36', '2026-07-21 14:01:41'),
(139, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:01:49'),
(140, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:02:23'),
(141, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:02:25'),
(142, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:04:35'),
(143, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:06:09'),
(144, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:08:52'),
(145, 4, 'admin', 'Jefe_OTIC', 'GENERAR_RESPALDO_BD', 'sistema', NULL, NULL, '{\"archivo\":\"sistema_otic_20260721_141012.sql\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:10:12'),
(146, 4, 'admin', 'Jefe_OTIC', 'DESCARGAR_RESPALDO_BD', 'sistema', NULL, NULL, '{\"archivo\":\"sistema_otic_20260721_141012.sql\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:10:15'),
(147, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:10:48'),
(148, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:10:59'),
(149, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:12:55'),
(150, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:12:56'),
(151, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:14:25'),
(152, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:17:13'),
(153, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '2026-07-21 14:18:03'),
(154, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:21:41'),
(155, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:24:27'),
(156, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:24:33'),
(157, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:24:35'),
(158, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:24:37'),
(159, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:24:48'),
(160, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 14:24:57'),
(161, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-21 14:57:48'),
(162, 5, 'coordinador', 'Coordinador', 'CERRAR_TICKET', 'tickets', 1, NULL, '{\"puntuacion\":5}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-21 14:58:16'),
(163, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 2, '{\"estado_anterior\":\"\"}', '{\"estado_nuevo\":\"En_proceso\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 15:01:53'),
(164, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 2, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"Pendiente\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 15:01:57'),
(165, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-21 15:04:47'),
(166, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 19:32:59'),
(167, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 19:33:03'),
(168, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 19:35:59'),
(169, 4, 'admin', 'Jefe_OTIC', 'EXPORTAR_TICKETS', 'tickets', NULL, NULL, '{\"total\":4}', '0.0.0.0', '', '2026-07-21 19:55:37'),
(170, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 19:56:12'),
(171, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '0.0.0.0', '', '2026-07-21 20:20:12'),
(172, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 2, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:48:22'),
(173, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:53:02'),
(174, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:53:16'),
(175, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:54:09'),
(176, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:54:50'),
(177, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 2, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:54:58'),
(178, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:55:11'),
(179, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 3, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:55:15'),
(180, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:55:23'),
(181, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:55:28'),
(182, 5, 'coordinador', 'Coordinador', 'CERRAR_TICKET', 'tickets', 2, NULL, '{\"puntuacion\":5}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:55:32'),
(183, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-21 21:55:50'),
(184, 5, 'coordinador', 'Coordinador', 'RECUPERAR_PASSWORD', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-25 20:45:49'),
(185, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-25 20:46:02'),
(186, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-25 20:49:45'),
(187, 4, 'admin', 'Jefe_OTIC', 'RECUPERAR_PASSWORD', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-25 20:55:04'),
(188, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-25 20:55:15'),
(189, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-25 21:02:38'),
(190, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 19:39:49'),
(191, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 19:40:05'),
(192, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 19:40:13'),
(193, 4, 'admin', 'Jefe_OTIC', 'EXPORTAR_TICKETS', 'tickets', NULL, NULL, '{\"total\":4}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 19:50:12'),
(194, 4, 'admin', 'Jefe_OTIC', 'CREAR_TICKET', 'tickets', 5, NULL, '{\"codigo\":\"T-2026-0005\",\"titulo\":\"Prueba\",\"estado_inicial\":\"En_proceso\",\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-03 00:05:35'),
(195, 4, 'admin', 'Jefe_OTIC', 'BLOQUEAR_USUARIO', 'usuarios', 9, NULL, '{\"minutos\":60}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-03 00:20:36'),
(196, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 9, NULL, '{\"email\":\"hendrykjm22@hotmail.com\",\"telefono\":\"04126421877\",\"password_cambiada\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-03 00:44:27'),
(197, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 22:54:39'),
(198, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 22:54:54'),
(199, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 22:58:02'),
(200, 9, 'sub usuario', 'Sub_usuario', 'RECUPERAR_PASSWORD', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 22:59:31'),
(201, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 22:59:48'),
(202, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 6, NULL, '{\"codigo\":\"T-2026-0006\",\"titulo\":\"*\\/-\\/*\\/-\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:01:31'),
(203, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:01:43'),
(204, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:01:54'),
(205, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:02:51'),
(206, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:02:58'),
(207, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:03:08'),
(208, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 6, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:04:34'),
(209, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:06:19'),
(210, 6, 'tecnico', 'Tecnico', 'RECUPERAR_PASSWORD', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:07:04'),
(211, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:07:19'),
(212, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-04 23:32:56');
INSERT INTO `bitacora` (`id`, `usuario_id`, `usuario_username`, `usuario_rol`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `created_at`) VALUES
(213, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 21:39:20'),
(214, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 21:57:55'),
(215, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 21:58:05'),
(216, 9, 'sub usuario', 'Sub_usuario', 'CERRAR_TICKET', 'tickets', 3, NULL, '{\"puntuacion\":5}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 21:58:52'),
(217, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:01:22'),
(218, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:01:45'),
(219, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:08:59'),
(220, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:09:22'),
(221, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 7, NULL, '{\"codigo\":\"T-2026-0007\",\"titulo\":\"Rechazar\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:09:40'),
(222, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:10:43'),
(223, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:10:55'),
(224, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:11:25'),
(225, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:11:36'),
(226, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 7, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:13:49'),
(227, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:13:53'),
(228, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:14:02'),
(229, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 7, '{\"estado_anterior\":\"Aprobado\"}', '{\"estado_nuevo\":\"Irreparable\",\"motivo\":\"Falta de materiales\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:18:05'),
(230, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:18:26'),
(231, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:18:33'),
(232, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:18:44'),
(233, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-07 22:18:52'),
(234, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 19:22:31'),
(235, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 19:22:42'),
(236, 4, 'admin', 'Jefe_OTIC', 'CREAR_TICKET', 'tickets', 8, NULL, '{\"codigo\":\"T-2026-0008\",\"titulo\":\"Prueba\",\"estado_inicial\":\"En_proceso\",\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 19:23:32'),
(237, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 9, NULL, '{\"email\":\"hendrykjm22@hotmail.com\",\"telefono\":\"04126421877\",\"password_cambiada\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 19:35:41'),
(238, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 8, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"Rechazado\",\"motivo\":\"vb\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 19:46:44'),
(239, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 7, '{\"estado_anterior\":\"Irreparable\"}', '{\"estado_nuevo\":\"En_proceso\",\"motivo\":\"25\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:02:54'),
(240, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:04:34'),
(241, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:04:56'),
(242, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 9, NULL, '{\"codigo\":\"T-2026-0009\",\"titulo\":\"Estados\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:05:11'),
(243, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:05:15'),
(244, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:05:24'),
(245, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 9, '{\"estado_anterior\":\"Pendiente\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"falta de materiales\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:07:36'),
(246, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:35:49'),
(247, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:36:12'),
(248, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 10, NULL, '{\"codigo\":\"T-2026-0010\",\"titulo\":\"Orden\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:36:31'),
(249, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:36:34'),
(250, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:36:41'),
(251, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:37:11'),
(252, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:37:23'),
(253, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 11, NULL, '{\"codigo\":\"T-2026-0011\",\"titulo\":\"Orden 2\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:37:36'),
(254, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:37:38'),
(255, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:37:57'),
(256, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 11, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:38:07'),
(257, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:51:07'),
(258, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:51:17'),
(259, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 12, NULL, '{\"codigo\":\"T-2026-0012\",\"titulo\":\"Prueba 2\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:51:37'),
(260, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:51:41'),
(261, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-10 20:51:50'),
(262, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:50:35'),
(263, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:50:44'),
(264, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:51:29'),
(265, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:51:37'),
(266, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 13, NULL, '{\"codigo\":\"T-2026-0013\",\"titulo\":\"Prueba admin\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:51:59'),
(267, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:52:02'),
(268, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:52:12'),
(269, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:55:09'),
(270, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:55:22'),
(271, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 14, NULL, '{\"codigo\":\"T-2026-0014\",\"titulo\":\"Prueba eliminar\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:55:42'),
(272, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:55:44'),
(273, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 22:55:53'),
(274, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:04:46'),
(275, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:04:55'),
(276, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 13, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:05:05'),
(277, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:05:19'),
(278, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:05:27'),
(279, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:42:16'),
(280, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:42:24'),
(281, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:42:37'),
(282, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-11 23:43:22'),
(283, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:18:15'),
(284, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:20:13'),
(285, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:20:22'),
(286, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:20:38'),
(287, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:20:46'),
(288, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:36:56'),
(289, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:37:05'),
(290, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:56:49'),
(291, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 22:56:56'),
(292, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 23:06:43'),
(293, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-15 23:06:51'),
(294, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 13, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 15:55:50'),
(295, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 15:58:37'),
(296, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 15:58:44'),
(297, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 13, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 15:58:54'),
(298, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 13, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 15:59:35'),
(299, 6, 'tecnico', 'Tecnico', 'CAMBIAR_ESTADO_TICKET', 'tickets', 5, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"Irreparable\",\"motivo\":\"tjhjhgjkk\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 15:59:55'),
(300, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:00:04'),
(301, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:00:22'),
(302, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:00:47'),
(303, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:00:55'),
(304, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:01:08'),
(305, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:01:16'),
(306, 6, 'tecnico', 'Tecnico', 'CAMBIAR_ESTADO_TICKET', 'tickets', 6, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"Irreparable\",\"motivo\":\"l\\u00f1l\\u00f1l\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:01:54'),
(307, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:01:57'),
(308, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:02:06'),
(309, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:02:13'),
(310, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:02:55'),
(311, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 15, NULL, '{\"codigo\":\"T-2026-0015\",\"titulo\":\"en espera\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:03:11'),
(312, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:03:14'),
(313, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:03:23'),
(314, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 15, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:04:24'),
(315, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:04:27'),
(316, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:04:49'),
(317, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 15, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:04:54'),
(318, 6, 'tecnico', 'Tecnico', 'CAMBIAR_ESTADO_TICKET', 'tickets', 15, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"En_espera\",\"motivo\":\"46542\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:05:00'),
(319, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:05:05'),
(320, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:05:19'),
(321, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:05:36'),
(322, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:05:44'),
(323, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:06:04'),
(324, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:06:12'),
(325, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:09:53'),
(326, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:10:01'),
(327, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 15, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:10:12'),
(328, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:10:15'),
(329, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:10:25'),
(330, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 7, '{\"estado_anterior\":\"En_proceso\"}', '{\"estado_nuevo\":\"Pendiente\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:11:13'),
(331, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 7, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:11:25'),
(332, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:30:08'),
(333, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:30:16'),
(334, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:30:20'),
(335, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:30:31'),
(336, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 16, NULL, '{\"codigo\":\"T-2026-0016\",\"titulo\":\"Sub10\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:30:51'),
(337, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:31:04'),
(338, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:31:11'),
(339, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:31:18'),
(340, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 17, NULL, '{\"codigo\":\"T-2026-0017\",\"titulo\":\"coord1\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:31:50'),
(341, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:31:52'),
(342, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:02'),
(343, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 18, NULL, '{\"codigo\":\"T-2026-0018\",\"titulo\":\"Sub20\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:17'),
(344, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:19'),
(345, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:27'),
(346, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 18, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:31'),
(347, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:34'),
(348, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:32:48'),
(349, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 17, '{\"estado_anterior\":\"Pendiente\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"123456\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:33:47'),
(350, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 17, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 16:57:28'),
(351, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:15:36'),
(352, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 7, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"adsads\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:16:22'),
(353, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 7, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:16:27'),
(354, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 18, '{\"estado_anterior\":\"Aprobado\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"dsgdsgdfhgh\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:17:43'),
(355, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 18, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:17:44'),
(356, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 18, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"asdsaf\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:21:14'),
(357, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 18, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:21:19'),
(358, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 16, '{\"estado_anterior\":\"Aprobado\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"poke si\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:21:51'),
(359, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:21:55'),
(360, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 16, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"asdsadsaf\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:30:38'),
(361, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:30:39'),
(362, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 16, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"hhfghfgnbnv\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:32:56'),
(363, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 17:32:58'),
(364, 4, 'admin', 'Jefe_OTIC', 'EDITAR_PNF', 'pnf', 1, NULL, '{\"nombre\":\"PNFI\",\"codigo\":\"PNF-01\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 20:14:27'),
(365, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 20:59:46'),
(366, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:00:32'),
(367, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 12, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:01:37'),
(368, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 12, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:01:42'),
(369, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 10, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:04:13'),
(370, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 10, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:04:18'),
(371, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 10, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:04:35'),
(372, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:04:43'),
(373, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:04:52'),
(374, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 12, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:05:02'),
(375, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_AREA', 'area', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:22:21'),
(376, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_AREA', 'area', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:22:29'),
(377, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 12, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:22:31'),
(378, 4, 'admin', 'Jefe_OTIC', 'EDITAR_PNF', 'pnf', 1, NULL, '{\"nombre\":\"Informatica\",\"codigo\":\"PNF-01\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:22:59'),
(379, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:23:13'),
(380, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:23:26'),
(381, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 19, NULL, '{\"codigo\":\"T-2026-0019\",\"titulo\":\"Prueba\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:23:58'),
(382, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:24:00'),
(383, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:24:06'),
(384, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:25:07'),
(385, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:37:47'),
(386, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:38:44'),
(387, 4, 'admin', 'Jefe_OTIC', 'MOSTRAR_PNF', 'pnf', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 21:39:50'),
(388, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 17, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"sdsdsd\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:06:34'),
(389, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:38:07'),
(390, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:38:15'),
(391, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 20, NULL, '{\"codigo\":\"T-2026-0020\",\"titulo\":\"Prueba\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:38:48'),
(392, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:38:58'),
(393, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:39:06'),
(394, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 21, NULL, '{\"codigo\":\"T-2026-0021\",\"titulo\":\"Prueba\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:39:22'),
(395, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:39:25'),
(396, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:39:53'),
(397, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 22, NULL, '{\"codigo\":\"T-2026-0022\",\"titulo\":\"Prueba\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:40:16'),
(398, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:49:43'),
(399, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 17:49:50'),
(400, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 18:04:59'),
(401, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 18:05:06'),
(402, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 18:06:18'),
(403, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 18:06:29'),
(404, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 18:30:16'),
(405, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 18:30:23'),
(406, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:22:11'),
(407, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:22:19'),
(408, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:24:34'),
(409, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:24:42'),
(410, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:27:09'),
(411, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:27:18'),
(412, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:28:10'),
(413, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:28:17'),
(414, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:28:41'),
(415, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:29:06'),
(416, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:35:52'),
(417, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:35:59'),
(418, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:36:06'),
(419, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-18 23:37:09'),
(420, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:33:15'),
(421, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:33:22');
INSERT INTO `bitacora` (`id`, `usuario_id`, `usuario_username`, `usuario_rol`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `created_at`) VALUES
(422, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 15, NULL, '{\"motivo\":\"Como co\\u00f1o le vas a poner windows 11 a una compu xp y menos de 512mb de ram\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:34:54'),
(423, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:35:36'),
(424, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:35:42'),
(425, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:35:50'),
(426, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:35:58'),
(427, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:48:00'),
(428, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:48:08'),
(429, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:48:26'),
(430, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 00:48:36'),
(431, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 01:09:07'),
(432, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 01:09:14'),
(433, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 01:14:33'),
(434, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 01:14:43'),
(435, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 01:14:53'),
(436, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-19 01:15:00'),
(437, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 16:57:11'),
(438, 4, 'admin', 'Jefe_OTIC', 'RECHAZAR_IRREPARABLE', 'tickets', 15, NULL, '{\"motivo\":\"Si se pude hacer morsh\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:15:13'),
(439, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:15:34'),
(440, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:15:43'),
(441, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:16:59'),
(442, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:17:07'),
(443, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 15, NULL, '{\"motivo\":\"123456789\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:17:31'),
(444, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:17:35'),
(445, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:17:43'),
(446, 4, 'admin', 'Jefe_OTIC', 'CONGELAR_DESDE_IRREPARABLE', 'tickets', 15, NULL, '{\"motivo\":\"Falta de materiales\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:18:39'),
(447, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:18:44'),
(448, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:18:51'),
(449, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:18:58'),
(450, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:07'),
(451, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:19'),
(452, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:27'),
(453, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 15, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:42'),
(454, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 15, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:46'),
(455, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:50'),
(456, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:19:58'),
(457, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 15, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:20:02'),
(458, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 15, NULL, '{\"motivo\":\"Esta y ya\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:20:11'),
(459, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:20:18'),
(460, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:20:28'),
(461, 4, 'admin', 'Jefe_OTIC', 'APROBAR_IRREPARABLE', 'tickets', 15, NULL, '{\"motivo\":\"Poke si njd\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:20:55'),
(462, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:21:15'),
(463, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:21:30'),
(464, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:32:09'),
(465, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:32:17'),
(466, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 7, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:32:24'),
(467, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 7, NULL, '{\"motivo\":\"Prueba chat\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:32:36'),
(468, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:32:44'),
(469, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:32:52'),
(470, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:33:12'),
(471, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:33:19'),
(472, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:33:24'),
(473, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:33:32'),
(474, 4, 'admin', 'Jefe_OTIC', 'CONGELAR_DESDE_IRREPARABLE', 'tickets', 7, NULL, '{\"motivo\":\"Co\\u00f1azo\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:34:08'),
(475, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:34:11'),
(476, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:34:19'),
(477, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:54:38'),
(478, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:54:46'),
(479, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:54:52'),
(480, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:54:59'),
(481, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 22, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 17:59:59'),
(482, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:05'),
(483, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:17'),
(484, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 22, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:21'),
(485, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 22, NULL, '{\"motivo\":\"123456789\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:28'),
(486, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:40'),
(487, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:48'),
(488, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:00:54'),
(489, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:01:04'),
(490, 4, 'admin', 'Jefe_OTIC', 'APROBAR_IRREPARABLE', 'tickets', 22, NULL, '{\"motivo\":\"poke si\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:01:22'),
(491, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:01:30'),
(492, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:01:37'),
(493, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 20, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:15'),
(494, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:18'),
(495, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:26'),
(496, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 20, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:33'),
(497, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:35'),
(498, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:42'),
(499, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 20, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:47'),
(500, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 20, NULL, '{\"motivo\":\".\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:52'),
(501, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:08:55'),
(502, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 18:09:01'),
(503, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 22:13:09'),
(504, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 22:13:17'),
(505, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 22:14:34'),
(506, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 22:25:11'),
(507, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 21, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 22:25:57'),
(508, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 23:14:15'),
(509, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 23:14:22'),
(510, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 21, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 23:14:28'),
(511, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 21, NULL, '{\"motivo\":\"pipipi\",\"imagenes\":1}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 23:15:23'),
(512, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 23:16:04'),
(513, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-19 23:16:13'),
(514, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:55:51'),
(515, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:56:21'),
(516, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:56:30'),
(517, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 11, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:57:20'),
(518, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:57:24'),
(519, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:57:33'),
(520, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 11, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:57:42'),
(521, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 11, NULL, '{\"motivo\":\"Poke no\",\"imagenes\":3}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:58:37'),
(522, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:58:41'),
(523, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:58:50'),
(524, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:59:04'),
(525, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 14:59:13'),
(526, 4, 'admin', 'Jefe_OTIC', 'RECHAZAR_IRREPARABLE', 'tickets', 11, NULL, '{\"motivo\":\"Aun se puede solventar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:00:36'),
(527, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:01:12'),
(528, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:01:19'),
(529, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:01:30'),
(530, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:01:39'),
(531, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 11, NULL, '{\"motivo\":\"El problema persiste\",\"imagenes\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:02:07'),
(532, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:02:28'),
(533, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:02:36'),
(534, 4, 'admin', 'Jefe_OTIC', 'APROBAR_IRREPARABLE', 'tickets', 11, NULL, '{\"motivo\":\".\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:02:52'),
(535, 4, 'admin', 'Jefe_OTIC', 'CONGELAR_DESDE_IRREPARABLE', 'tickets', 20, NULL, '{\"motivo\":\"Despues se vera\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:03:09'),
(536, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:03:24'),
(537, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:03:31'),
(538, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:03:37'),
(539, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:03:45'),
(540, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:03:58'),
(541, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:04:06'),
(542, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:04:26'),
(543, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:04:34'),
(544, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:04:49'),
(545, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:18:22'),
(546, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:18:33'),
(547, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:18:40'),
(548, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:34:44'),
(549, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:34:51'),
(550, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 18, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"h\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:35:30'),
(551, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 18, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:35:31'),
(552, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:06'),
(553, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:12'),
(554, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:24'),
(555, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:30'),
(556, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:36'),
(557, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:46'),
(558, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 16, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:37:57'),
(559, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:38:00'),
(560, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:38:07'),
(561, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:38:12'),
(562, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 16, NULL, '{\"motivo\":\"fg\",\"imagenes\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:38:16'),
(563, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:38:19'),
(564, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 15:38:25'),
(565, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 16:02:41'),
(566, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 16:02:48'),
(567, 4, 'admin', 'Jefe_OTIC', 'EDITAR_PERFIL', 'usuarios', 4, NULL, '{\"email\":\"amin@test.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 16:21:33'),
(568, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 16:29:38'),
(569, 4, 'admin', 'Jefe_OTIC', 'EDITAR_PERFIL', 'usuarios', 4, NULL, '{\"email\":\"admin@test.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 16:30:09'),
(570, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_USUARIO', 'usuarios', 11, '{\"username\":\"Borrar\",\"rol\":\"Sub_usuario\"}', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:29:43'),
(571, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 9, NULL, '{\"email\":\"hendrykjm22@hotmail.com\",\"telefono\":\"04126421877\",\"password_cambiada\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:30:42'),
(572, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 9, NULL, '{\"email\":\"hendrykjm22@hotmail.com\",\"telefono\":\"04126421877\",\"password_cambiada\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:30:56'),
(573, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 5, '{\"estado_anterior\":\"Activo\"}', '{\"estado_nuevo\":\"Reposo\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:31:59'),
(574, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 5, '{\"estado_anterior\":\"Reposo\"}', '{\"estado_nuevo\":\"Activo\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:32:09'),
(575, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 17, NULL, '{\"username\":\"Borrar\",\"rol\":\"Sub_usuario\",\"tipo_sub_usuario\":\"OTIC\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:38:30'),
(576, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:39:01'),
(577, NULL, 'Borrar', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 17, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:39:09'),
(578, NULL, 'Borrar', 'Sub_usuario', 'LOGOUT', 'usuarios', 17, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:39:20'),
(579, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:39:36'),
(580, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_USUARIO', 'usuarios', 17, '{\"username\":\"Borrar\",\"rol\":\"Sub_usuario\"}', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:39:54'),
(581, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 18, NULL, '{\"username\":\"Borrar\",\"rol\":\"Sub_usuario\",\"tipo_sub_usuario\":\"OTIC\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 17:42:28'),
(582, 4, 'admin', 'Jefe_OTIC', 'RECHAZAR_IRREPARABLE', 'tickets', 21, NULL, '{\"motivo\":\".\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:20:31'),
(583, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:20:34'),
(584, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:20:51'),
(585, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:21:06'),
(586, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:21:13'),
(587, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:22:11'),
(588, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:22:18'),
(589, 6, 'tecnico', 'Tecnico', 'REANUDAR_TICKET', 'tickets', 21, '{\"estado_anterior\":\"por_reanudar\"}', '{\"estado_nuevo\":\"En_proceso\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:22:34'),
(590, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:22:42'),
(591, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:22:48'),
(592, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:23:34'),
(593, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:23:42'),
(594, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 21, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:23:48'),
(595, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:36:55'),
(596, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:37:45'),
(597, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 19, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:40:32'),
(598, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:40:34'),
(599, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:40:42'),
(600, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 19, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:40:46'),
(601, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 19, NULL, '{\"motivo\":\".\",\"imagenes\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:40:51'),
(602, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:40:55'),
(603, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:41:06'),
(604, 4, 'admin', 'Jefe_OTIC', 'RECHAZAR_IRREPARABLE', 'tickets', 19, NULL, '{\"motivo\":\".\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:41:20'),
(605, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:42:01'),
(606, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:42:10'),
(607, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:56:20'),
(608, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:56:38'),
(609, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 18, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:56:56'),
(610, 4, 'admin', 'Jefe_OTIC', 'RECHAZAR_IRREPARABLE', 'tickets', 16, NULL, '{\"motivo\":\".\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:57:13'),
(611, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:57:15'),
(612, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:57:26'),
(613, 6, 'tecnico', 'Tecnico', 'REANUDAR_TICKET', 'tickets', 16, '{\"estado_anterior\":\"por_reanudar\"}', '{\"estado_nuevo\":\"En_proceso\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:57:36'),
(614, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 16, NULL, '{\"motivo\":\".\",\"imagenes\":1}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:57:46'),
(615, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 18, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:57:50'),
(616, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 18, NULL, '{\"motivo\":\".\",\"imagenes\":3}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:58:00'),
(617, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:58:02'),
(618, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 20:58:29'),
(619, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 17:12:50'),
(620, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 17:13:54'),
(621, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 17:19:51'),
(622, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 17:19:58'),
(623, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 18:41:49'),
(624, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 18:42:02'),
(625, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 21:05:39'),
(626, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-22 21:05:46'),
(627, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 14:01:45'),
(628, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_USUARIO', 'usuarios', 18, '{\"username\":\"Borrar\",\"rol\":\"Sub_usuario\"}', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 14:02:30'),
(629, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 19, NULL, '{\"username\":\"Borrar\",\"rol\":\"Jefe_OTIC\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 14:03:24'),
(630, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 21, NULL, '{\"username\":\"prueba\",\"rol\":\"Sub_usuario\",\"tipo_sub_usuario\":\"OTIC\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 14:04:59'),
(631, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 19, '{\"email\":\"rosilloyocceline@gmail.com\",\"telefono\":\"04246784519\",\"primer_nombre\":\"123\",\"primer_apellido\":\"Voj\",\"rol\":\"Jefe_OTIC\",\"pnf_id\":null,\"area_id\":null}', '{\"email\":\"rosilloyocceline@gmail.com\",\"telefono\":\"04246784519\",\"primer_nombre\":\"123\",\"primer_apellido\":\"Voj\",\"password_cambiada\":true,\"area_cambiada\":false,\"pnf_cambiado\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 14:05:52'),
(632, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_PASSWORD_OTRO_USUARIO', 'usuarios', 19, NULL, '{\"admin_cambio_password\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 14:05:52'),
(633, 16, 'Juan lucas', 'Sub_usuario', 'SOLICITAR_RECUPERACION', 'usuarios', 16, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 16:02:17'),
(634, 16, 'Juan lucas', 'Sub_usuario', 'SOLICITAR_RECUPERACION', 'usuarios', 16, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 16:13:22'),
(635, 16, 'Juan lucas', 'Sub_usuario', 'SOLICITAR_RECUPERACION', 'usuarios', 16, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 16:15:57');
INSERT INTO `bitacora` (`id`, `usuario_id`, `usuario_username`, `usuario_rol`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `created_at`) VALUES
(636, 16, 'Juan lucas', 'Sub_usuario', 'SOLICITAR_RECUPERACION', 'usuarios', 16, NULL, '{\"email\":\"Imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 16:24:17'),
(637, 16, 'Juan lucas', 'Sub_usuario', 'SOLICITAR_RECUPERACION', 'usuarios', 16, NULL, '{\"email\":\"Imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 16:27:29'),
(638, 16, 'Juan lucas', 'Sub_usuario', 'SOLICITAR_RECUPERACION', 'usuarios', 16, NULL, '{\"email\":\"Imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:29:09'),
(639, 16, 'Juan lucas', 'Sub_usuario', 'CAMBIAR_PASSWORD_TOKEN', 'usuarios', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:30:48'),
(640, 16, 'Juan lucas', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:31:44'),
(641, 16, 'Juan lucas', 'Sub_usuario', 'LOGOUT', 'usuarios', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:32:13'),
(642, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:32:20'),
(643, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:32:43'),
(644, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:32:52'),
(645, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:32:59'),
(646, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:33:07'),
(647, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:33:11'),
(648, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:47:55'),
(649, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:48:01'),
(650, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:48:09'),
(651, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:48:41'),
(652, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 19:48:49'),
(653, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:02:06'),
(654, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:02:13'),
(655, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:02:21'),
(656, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA_SETUP', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:06:16'),
(657, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:06:37'),
(658, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:08:17'),
(659, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:13:36'),
(660, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 21:57:16'),
(661, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 22:04:06'),
(662, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 22:04:13'),
(663, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 22:04:16'),
(664, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 22:41:38'),
(665, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-23 22:41:41'),
(666, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 16:53:22'),
(667, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 17:01:07'),
(668, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 17:04:26'),
(669, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 17:08:12'),
(670, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:21:59'),
(671, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:22:03'),
(672, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:22:20'),
(673, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:26:22'),
(674, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:26:35'),
(675, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:26:38'),
(676, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:28:23'),
(677, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:28:25'),
(678, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 18:42:12'),
(679, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 01:53:23'),
(680, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 01:53:30'),
(681, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 01:54:45'),
(682, 16, 'Juan lucas', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 01:55:25'),
(683, 16, 'Juan lucas', 'Sub_usuario', 'EDITAR_PERFIL', 'usuarios', 16, NULL, '{\"email\":\"imarru120902@gmail.co\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 01:59:57'),
(684, 16, 'Juan lucas', 'Sub_usuario', 'LOGOUT', 'usuarios', 16, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:00:00'),
(685, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:00:21'),
(686, 4, 'admin', 'Jefe_OTIC', 'EDITAR_PERFIL', 'usuarios', 4, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:00:51'),
(687, 4, 'admin', 'Jefe_OTIC', 'EDITAR_PERFIL', 'usuarios', 4, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:01:51'),
(688, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:10:32'),
(689, 4, 'admin', 'Jefe_OTIC', 'INTENTO_FALLIDO_DESVINCULAR_2FA', 'usuarios', 4, NULL, '{\"motivo\":\"c\\u00f3digo TOTP incorrecto\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:37:44'),
(690, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:38:13'),
(691, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:39:16'),
(692, 4, 'admin', 'Jefe_OTIC', 'DESVINCULAR_2FA_METODO_ALTERNO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:39:34'),
(693, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"password\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 02:39:53'),
(694, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 18:43:25'),
(695, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA_SETUP', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 18:44:49'),
(696, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 18:45:25'),
(697, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA_SETUP', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-26 18:48:53'),
(698, 4, 'admin', 'Jefe_OTIC', 'DESVINCULAR_2FA_METODO_ALTERNO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 18:49:23'),
(699, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"password\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 18:49:41'),
(700, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-26 18:50:37'),
(701, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA_SETUP', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-26 18:50:57'),
(702, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:18:40'),
(703, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:18:51'),
(704, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:26:02'),
(705, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA_SETUP', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:27:30'),
(706, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:28:00'),
(707, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA_SETUP', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-09-26 19:43:29'),
(708, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-09-26 19:44:00'),
(709, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-09-26 19:44:40'),
(710, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-09-26 19:44:46'),
(711, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-09-26 19:44:58'),
(712, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-09-26 19:45:01'),
(713, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:58:19'),
(714, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:58:49'),
(715, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:58:50'),
(716, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-26 19:59:35'),
(717, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:21'),
(718, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:27'),
(719, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:31'),
(720, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:40'),
(721, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:47'),
(722, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:53'),
(723, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:04:57'),
(724, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:05:04'),
(725, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:31:31'),
(726, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:32:16'),
(727, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:32:31'),
(728, 4, 'admin', 'Jefe_OTIC', 'DESACTIVAR_2FA', 'usuarios', 4, NULL, '{\"metodo\":\"app\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:33:10'),
(729, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 20:58:59'),
(730, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 21:35:19'),
(731, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 21:35:56'),
(732, 5, 'coordinador', 'Coordinador', 'BLOQUEO_PREVENTIVO', 'usuarios', 5, NULL, '{\"intentos_fallidos\":3,\"minutos\":15}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 21:36:12'),
(733, 5, 'coordinador', 'Coordinador', 'BLOQUEO_CRITICO', 'usuarios', 5, NULL, '{\"intentos_fallidos\":5}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 21:37:04'),
(734, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 21:37:23'),
(735, 4, 'admin', 'Jefe_OTIC', 'DESBLOQUEAR_USUARIO', 'usuarios', 5, '{\"tipo_bloqueo\":\"critico\"}', '{\"desbloqueado\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:00:32'),
(736, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:00:38'),
(737, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:00:44'),
(738, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:00:46'),
(739, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:00:53'),
(740, 4, 'admin', 'Jefe_OTIC', 'DESBLOQUEAR_USUARIO', 'usuarios', 5, '{\"tipo_bloqueo\":\"critico\"}', '{\"desbloqueado\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:01:43'),
(741, 4, 'admin', 'Jefe_OTIC', 'DESBLOQUEAR_USUARIO', 'usuarios', 5, '{\"tipo_bloqueo\":\"critico\"}', '{\"desbloqueado\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:11:56'),
(742, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:30:40'),
(743, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:30:47'),
(744, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:48:40'),
(745, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-28 22:48:45'),
(746, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 17:45:33'),
(747, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:07:40'),
(748, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:07:47'),
(749, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 23, NULL, '{\"codigo\":\"T-2026-0023\",\"titulo\":\"Prueba12\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:08:01'),
(750, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:08:03'),
(751, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:08:10'),
(752, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 17, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:41:43'),
(753, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 20, NULL, '{\"accion\":\"mantener_tecnico\",\"tecnico_id\":6}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:43:08'),
(754, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 7, '{\"tecnico_anterior\":6}', '{\"accion\":\"reasignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:43:48'),
(755, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 7, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-29 18:43:56'),
(756, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 16:53:20'),
(757, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 24, '{\"email\":\"test3@test.com\",\"telefono\":null,\"primer_nombre\":\"Test3\",\"primer_apellido\":\"Paginacion\",\"rol\":\"Tecnico\",\"pnf_id\":null,\"area_id\":null}', '{\"email\":\"test3@test.com\",\"telefono\":\"\",\"primer_nombre\":\"Test3\",\"primer_apellido\":\"Paginacion\",\"password_cambiada\":false,\"area_cambiada\":true,\"pnf_cambiado\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 17:32:15'),
(758, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 24, '{\"email\":\"test3@test.com\",\"telefono\":\"\",\"primer_nombre\":\"Test3\",\"primer_apellido\":\"Paginacion\",\"rol\":\"Tecnico\",\"pnf_id\":null,\"area_id\":null}', '{\"email\":\"test3@test.com\",\"telefono\":\"\",\"primer_nombre\":\"Test3\",\"primer_apellido\":\"Paginacion\",\"password_cambiada\":false,\"area_cambiada\":true,\"pnf_cambiado\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 17:32:50'),
(759, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 28, NULL, '{\"username\":\"testeo\",\"rol\":\"Tecnico\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 17:34:51'),
(760, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 19:01:30'),
(761, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 19:01:48'),
(762, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 19:03:19'),
(763, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 19:06:37'),
(764, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 19:17:54'),
(765, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 21:34:03'),
(766, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 21:43:45'),
(767, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 21:48:19'),
(768, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Activo\"}', '{\"estado_nuevo\":\"Vacaciones\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-03 01:41:41'),
(769, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Vacaciones\"}', '{\"estado_nuevo\":\"Activo\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-03 01:42:02'),
(770, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Activo\"}', '{\"estado_nuevo\":\"Vacaciones\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-03 02:12:45'),
(771, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Vacaciones\"}', '{\"estado_nuevo\":\"Vacaciones\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-03 02:15:44'),
(772, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Vacaciones\"}', '{\"estado_nuevo\":\"Vacaciones\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-03 02:16:02'),
(773, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Vacaciones\"}', '{\"estado_nuevo\":\"Vacaciones\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-03 02:16:14'),
(774, 4, 'admin', 'Jefe_OTIC', 'SOLICITAR_RECUPERACION', 'usuarios', 4, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 20:51:53'),
(775, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 29, NULL, '{\"username\":\"Juan\",\"rol\":\"Jefe_OTIC\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:11:33'),
(776, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_PNF', 'pnf', 7, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:16:00'),
(777, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 30, NULL, '{\"username\":\"admin1\",\"rol\":\"Jefe_OTIC\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:23:54'),
(778, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_USUARIO', 'usuarios', 30, '{\"username\":\"admin1\",\"rol\":\"Jefe_OTIC\"}', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:24:24'),
(779, 4, 'admin', 'Jefe_OTIC', 'ELIMINAR_USUARIO', 'usuarios', 29, '{\"username\":\"Juan\",\"rol\":\"Jefe_OTIC\"}', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:24:45'),
(780, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:24:48'),
(781, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:24:55'),
(782, 5, 'coordinador', 'Coordinador', 'CREAR_USUARIO', 'usuarios', 31, NULL, '{\"username\":\"juan\",\"rol\":\"Sub_usuario\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:26:16'),
(783, 5, 'coordinador', 'Coordinador', 'EDITAR_USUARIO', 'usuarios', 31, '{\"email\":\"asdsaf@gms.com\",\"telefono\":\"04154688523\",\"primer_nombre\":\"juan\",\"primer_apellido\":\"juan\",\"rol\":\"Sub_usuario\",\"pnf_id\":\"Informatica\",\"area_id\":null}', '{\"email\":\"asdsa@gms.com\",\"telefono\":\"04154688523\",\"primer_nombre\":\"juan\",\"primer_apellido\":\"juan\",\"password_cambiada\":false,\"area_cambiada\":false,\"pnf_cambiado\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:39:23'),
(784, 5, 'coordinador', 'Coordinador', 'EDITAR_USUARIO', 'usuarios', 31, '{\"email\":\"asdsa@gms.com\",\"telefono\":\"04154688523\",\"primer_nombre\":\"juan\",\"primer_apellido\":\"juan\",\"rol\":\"Sub_usuario\",\"pnf_id\":\"Informatica\",\"area_id\":null}', '{\"email\":\"asdsa@gms.com\",\"telefono\":\"04154688523\",\"primer_nombre\":\"juan\",\"primer_apellido\":\"juan\",\"password_cambiada\":false,\"area_cambiada\":false,\"pnf_cambiado\":false}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:39:38'),
(785, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:40:03'),
(786, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:40:10'),
(787, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 31, '{\"estado_anterior\":\"Activo\"}', '{\"estado_nuevo\":\"Inactivo\",\"motivo\":\"sdg*\\/-()%&amp;\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:55:20'),
(788, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 31, '{\"estado_anterior\":\"Inactivo\"}', '{\"estado_nuevo\":\"Activo\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 19:56:52'),
(789, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 20:06:48'),
(790, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 20:06:58'),
(791, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:05:30'),
(792, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:05:40'),
(793, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:08:17'),
(794, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-10-06 23:08:39'),
(795, 4, 'admin', 'Jefe_OTIC', 'CONGELAR_DESDE_IRREPARABLE', 'tickets', 18, NULL, '{\"motivo\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibu\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:10:25'),
(796, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 18, NULL, '{\"accion\":\"mantener_tecnico\",\"tecnico_id\":6}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:10:31'),
(797, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-07 18:37:30'),
(798, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-07 18:37:39'),
(799, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:21:45'),
(800, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:22:01'),
(801, 4, 'admin', 'Jefe_OTIC', 'ACTIVAR_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:23:03'),
(802, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:23:20'),
(803, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:23:36'),
(804, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:24:04'),
(805, 6, 'tecnico', 'Tecnico', 'BLOQUEO_PREVENTIVO', 'usuarios', 6, NULL, '{\"intentos_fallidos\":3,\"minutos\":15}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 01:24:39'),
(806, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:30:30'),
(807, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:46:18'),
(808, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:46:41'),
(809, 4, 'admin', 'Jefe_OTIC', 'CREAR_TICKET', 'tickets', 24, NULL, '{\"codigo\":\"T-2026-0024\",\"titulo\":\"Prueba rutas\",\"estado_inicial\":\"En_proceso\",\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:47:51'),
(810, 4, 'admin', 'Jefe_OTIC', 'EDITAR_USUARIO', 'usuarios', 31, '{\"email\":\"asdsa@gms.com\",\"telefono\":\"04154688523\",\"primer_nombre\":\"juan\",\"primer_apellido\":\"juan\",\"rol\":\"Sub_usuario\",\"pnf_id\":\"Informatica\",\"area_id\":null}', '{\"email\":\"asdsa@gms.com\",\"telefono\":\"04154688523\",\"primer_nombre\":\"juana\",\"primer_apellido\":\"juan\",\"password_cambiada\":false,\"area_cambiada\":false,\"pnf_cambiado\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:50:03'),
(811, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 31, '{\"estado_anterior\":\"Activo\"}', '{\"estado_nuevo\":\"Activo\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:50:31'),
(812, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 32, NULL, '{\"username\":\"asdfasffdgdfh\",\"rol\":\"Coordinador\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:53:10'),
(813, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:53:48'),
(814, 6, 'tecnico', 'Tecnico', 'BLOQUEO_CRITICO', 'usuarios', 6, NULL, '{\"intentos_fallidos\":5}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:54:00'),
(815, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:54:12'),
(816, 4, 'admin', 'Jefe_OTIC', 'DESBLOQUEAR_USUARIO', 'usuarios', 6, '{\"tipo_bloqueo\":\"critico\"}', '{\"desbloqueado\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:54:33'),
(817, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 23, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Baja\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:02:53'),
(818, 4, 'admin', 'Jefe_OTIC', 'OCULTAR_AREA', 'area', 2, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:03:13'),
(819, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:03:57'),
(820, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:04:16'),
(821, 4, 'admin', 'Jefe_OTIC', 'SOLICITAR_RECUPERACION', 'usuarios', 4, NULL, '{\"email\":\"imarru120902@gmail.com\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:04:29'),
(822, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_PASSWORD_TOKEN', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:05:33'),
(823, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:06:11'),
(824, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:15:29'),
(825, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:15:35'),
(826, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 24, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:24:16'),
(827, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 23, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:24:20'),
(828, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 23, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:24:33'),
(829, 6, 'tecnico', 'Tecnico', 'REANUDAR_TICKET', 'tickets', 19, '{\"estado_anterior\":\"por_reanudar\"}', '{\"estado_nuevo\":\"En_proceso\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 16:24:40'),
(830, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 13:42:31'),
(831, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 13:43:23'),
(832, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 13:43:37'),
(833, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 13:44:03'),
(834, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 13:45:10'),
(835, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:00:33'),
(836, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:01:15'),
(837, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:01:54');
INSERT INTO `bitacora` (`id`, `usuario_id`, `usuario_username`, `usuario_rol`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `created_at`) VALUES
(838, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 25, NULL, '{\"codigo\":\"T-2026-0025\",\"titulo\":\"Computadoras descompuestas\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:02:37'),
(839, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 25, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:03:06'),
(840, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 25, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:03:40'),
(841, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:03:44'),
(842, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:04:00'),
(843, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 19, NULL, '{\"motivo\":\"Falta de equipos para solucionar el caso\",\"imagenes\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:04:50'),
(844, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 25, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:05:02'),
(845, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 25, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:05:10'),
(846, 9, 'sub usuario', 'Sub_usuario', 'CERRAR_TICKET', 'tickets', 25, NULL, '{\"puntuacion\":4}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:05:55'),
(847, 4, 'admin', 'Jefe_OTIC', 'CONGELAR_DESDE_IRREPARABLE', 'tickets', 19, NULL, '{\"motivo\":\"Por falta de equipos, el caso se pondr\\u00e1 en pausa por un tiempo para ser reanudado en la medida de lo posible una vez haya llegado el material\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:07:07'),
(848, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 19, '{\"tecnico_anterior\":6}', '{\"accion\":\"reasignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:07:25'),
(849, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:09:43'),
(850, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:11:28'),
(851, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:11:39'),
(852, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:21:43'),
(853, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:26:25'),
(854, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:26:43'),
(855, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 26, NULL, '{\"codigo\":\"T-2026-0026\",\"titulo\":\"Fallo en las computadoras\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:27:16'),
(856, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:27:49'),
(857, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:28:06'),
(858, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 27, NULL, '{\"codigo\":\"T-2026-0027\",\"titulo\":\"Equipos descompuestos\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:28:45'),
(859, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 27, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:29:03'),
(860, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 27, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Alta\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:29:29'),
(861, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:29:33'),
(862, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:29:42'),
(863, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 27, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:29:52'),
(864, 6, 'tecnico', 'Tecnico', 'SOLVENTAR_TICKET', 'tickets', 27, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:30:04'),
(865, 9, 'sub usuario', 'Sub_usuario', 'CERRAR_TICKET', 'tickets', 27, NULL, '{\"puntuacion\":5}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:30:33'),
(866, 4, 'admin', 'Jefe_OTIC', 'APROBAR_IRREPARABLE', 'tickets', 16, NULL, '{\"motivo\":\"El ticket no puede ser marcado como irreparable puesto que aun tiene solucion\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:31:22'),
(867, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:31:37'),
(868, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:36:00'),
(869, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:36:09'),
(870, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:36:26'),
(871, 9, 'sub usuario', 'Sub_usuario', 'CREAR_TICKET', 'tickets', 28, NULL, '{\"codigo\":\"T-2026-0028\",\"titulo\":\"Prueba\",\"estado_inicial\":\"En_revision\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:36:43'),
(872, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:36:57'),
(873, 5, 'coordinador', 'Coordinador', 'APROBAR_TICKET', 'tickets', 28, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:37:03'),
(874, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:37:32'),
(875, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 28, NULL, '{\"tecnico_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:37:48'),
(876, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:37:54'),
(877, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:38:01'),
(878, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 28, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:38:07'),
(879, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 28, NULL, '{\"motivo\":\"No pues, ya no queda nada que hacer aca\",\"imagenes\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:38:23'),
(880, 6, 'tecnico', 'Tecnico', 'SOLICITAR_IRREPARABLE', 'tickets', 28, NULL, '{\"motivo\":\"No pues, ya no queda nada que hacer aca\",\"imagenes\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:39:05'),
(881, 4, 'admin', 'Jefe_OTIC', 'APROBAR_IRREPARABLE', 'tickets', 28, NULL, '{\"motivo\":\"No se puede solventar el caso por obsolescencia de los equipos\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-10 14:40:29'),
(882, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 14:54:18'),
(883, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-10 18:23:15'),
(884, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 33, NULL, '{\"username\":\"Tecnico2\",\"rol\":\"Tecnico\",\"tipo_sub_usuario\":\"PNF\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:15:23'),
(885, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 19, NULL, '{\"tecnicos_ids\":[6,33],\"principal_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:58:32'),
(886, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 19, NULL, '{\"tecnicos_ids\":[6,33],\"principal_id\":6,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:58:37'),
(887, 4, 'admin', 'Jefe_OTIC', 'ASIGNAR_TECNICO', 'tickets', 17, NULL, '{\"tecnicos_ids\":[33],\"principal_id\":33,\"prioridad\":\"Media\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:58:55'),
(888, 4, 'admin', 'Jefe_OTIC', 'CREAR_USUARIO', 'usuarios', 34, NULL, '{\"username\":\"sub_otic\",\"rol\":\"Sub_usuario\",\"tipo_sub_usuario\":\"OTIC\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 15:26:49'),
(889, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 15:26:52'),
(890, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 15:27:00'),
(891, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:27:52'),
(892, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:31:22'),
(893, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 00:05:30'),
(894, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 00:05:50'),
(895, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 00:08:54'),
(896, 9, 'sub usuario', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 00:09:00'),
(897, 9, 'sub usuario', 'Sub_usuario', 'LOGOUT', 'usuarios', 9, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 00:09:07'),
(898, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 00:09:15'),
(899, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 16:10:56'),
(900, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 16:11:23'),
(901, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 16:12:02'),
(902, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 00:51:21'),
(903, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 00:51:54'),
(904, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 00:52:13'),
(905, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 00:52:21'),
(906, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:05:13'),
(907, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:05:43'),
(908, 5, 'coordinador', 'Coordinador', 'CREAR_TICKET', 'tickets', 29, NULL, '{\"codigo\":\"T-2026-0029\",\"titulo\":\"que te importa\",\"estado_inicial\":\"Pendiente\",\"prioridad\":\"Sin asignar\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:05:55'),
(909, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:17:30'),
(910, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:17:47'),
(911, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:18:02'),
(912, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:18:29'),
(913, 34, 'sub_otic', 'Sub_usuario', 'ASIGNAR_TECNICO', 'tickets', 29, NULL, '{\"tecnicos_ids\":[33],\"principal_id\":33,\"prioridad\":\"Baja\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:18:45'),
(914, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 29, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"pokesi njd\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:21:51'),
(915, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 29, NULL, '{\"accion\":\"mantener_tecnico\",\"tecnico_id\":33}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:21:56'),
(916, 34, 'sub_otic', 'Sub_usuario', 'CAMBIAR_ESTADO_TICKET', 'tickets', 29, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"xq me da la gana carajito\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:40:29'),
(917, 34, 'sub_otic', 'Sub_usuario', 'REACTIVAR_TICKET', 'tickets', 29, NULL, '{\"accion\":\"mantener_tecnico\",\"tecnico_id\":33}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:40:34'),
(918, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_TICKET', 'tickets', 29, '{\"estado_anterior\":\"En_espera\"}', '{\"estado_nuevo\":\"Congelado\",\"motivo\":\"asfdfdgfhfgjhjg\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:40:44'),
(919, 4, 'admin', 'Jefe_OTIC', 'REACTIVAR_TICKET', 'tickets', 29, NULL, '{\"accion\":\"mantener_tecnico\",\"tecnico_id\":33}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 01:40:47'),
(920, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 16:28:07'),
(921, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 16:28:38'),
(922, 34, 'sub_otic', 'Sub_usuario', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 33, '{\"estado_anterior\":\"Activo\"}', '{\"estado_nuevo\":\"Inactivo\",\"motivo\":\"poke si\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 16:12:39'),
(923, 4, 'admin', 'Jefe_OTIC', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 33, '{\"estado_anterior\":\"Inactivo\"}', '{\"estado_nuevo\":\"Activo\",\"motivo\":\"poke si\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 16:13:08'),
(924, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 17:13:43'),
(925, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 17:14:07'),
(926, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 17:14:23'),
(927, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 17:14:29'),
(928, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 17:24:15'),
(929, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:00:37'),
(930, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 01:25:45'),
(931, 5, 'coordinador', 'Coordinador', 'LOGIN_EXITOSO', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 01:25:52'),
(932, 5, 'coordinador', 'Coordinador', 'LOGOUT', 'usuarios', 5, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 01:44:18'),
(933, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 01:44:25'),
(934, 34, 'sub_otic', 'Sub_usuario', 'CAMBIAR_ESTADO_USUARIO', 'usuarios', 21, '{\"estado_anterior\":\"Vacaciones\"}', '{\"estado_nuevo\":\"Vacaciones\",\"motivo\":\"\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 14:40:27'),
(935, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:10:42'),
(936, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:11:31'),
(937, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:12:12'),
(938, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:12:52'),
(939, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:28:32'),
(940, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:28:44'),
(941, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:28:46'),
(942, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:28:57'),
(943, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:28:59'),
(944, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:29:13'),
(945, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:29:15'),
(946, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:29:34'),
(947, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:29:37'),
(948, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:31:13'),
(949, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 15:31:15'),
(950, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO_2FA', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 17:28:37'),
(951, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 17:28:39'),
(952, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 17:28:48'),
(953, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-21 14:24:48'),
(954, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 00:38:45'),
(955, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 03:58:10'),
(956, 34, 'sub_otic', 'Sub_usuario', 'LOGIN_EXITOSO', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 03:58:18'),
(957, 34, 'sub_otic', 'Sub_usuario', 'LOGOUT', 'usuarios', 34, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 03:58:26'),
(958, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 03:58:33'),
(959, 4, 'admin', 'Jefe_OTIC', 'LOGOUT', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:02:04'),
(960, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:02:13'),
(961, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:08:36'),
(962, 6, 'tecnico', 'Tecnico', 'LOGIN_EXITOSO', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:08:45'),
(963, 6, 'tecnico', 'Tecnico', 'INICIAR_TICKET', 'tickets', 20, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:12:03'),
(964, 6, 'tecnico', 'Tecnico', 'LOGOUT', 'usuarios', 6, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:12:17'),
(965, 4, 'admin', 'Jefe_OTIC', 'LOGIN_EXITOSO', 'usuarios', 4, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 04:12:25');

--
-- Disparadores `bitacora`
--
DELIMITER $$
CREATE TRIGGER `bitacora_no_delete` BEFORE DELETE ON `bitacora` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La bitácora es inmutable. No se permite eliminar registros.';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bitacora_no_update` BEFORE UPDATE ON `bitacora` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La bitácora es inmutable. No se permite modificar registros.';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `ticket_id`, `usuario_id`, `puntuacion`, `comentario`, `created_at`) VALUES
(1, 1, 5, 5, 'TODO BIEN GRACIAS', '2026-07-21 14:58:16'),
(2, 2, 5, 5, '', '2026-07-21 21:55:32'),
(3, 3, 9, 5, '', '2026-09-07 21:58:52'),
(4, 25, 9, 4, 'Excelente trabajo, muchas gracias', '2026-10-10 14:05:55'),
(5, 27, 9, 5, 'Excelente servicio', '2026-10-10 14:30:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos_verificacion`
--

CREATE TABLE `codigos_verificacion` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `expira` datetime NOT NULL,
  `usado` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `codigos_verificacion`
--

INSERT INTO `codigos_verificacion` (`id`, `usuario_id`, `codigo`, `accion`, `expira`, `usado`, `created_at`) VALUES
(3, 4, '797874', 'vincular_2fa', '2026-09-26 04:18:28', 1, '2026-09-26 02:08:28'),
(4, 4, '085408', 'vincular_2fa', '2026-09-26 04:18:31', 1, '2026-09-26 02:08:31'),
(5, 4, '592051', 'desvincular_2fa', '2026-09-26 04:47:50', 1, '2026-09-26 02:37:50'),
(6, 4, '508136', 'vincular_2fa', '2026-09-26 04:48:32', 1, '2026-09-26 02:38:32'),
(7, 4, '214729', 'desvincular_2fa', '2026-09-26 04:49:33', 1, '2026-09-26 02:39:33'),
(8, 4, '783096', 'desvincular_2fa', '2026-09-26 20:55:02', 1, '2026-09-26 18:45:02'),
(9, 4, '663714', 'desvincular_2fa', '2026-09-26 20:59:23', 1, '2026-09-26 18:49:23'),
(10, 4, '273325', 'vincular_2fa', '2026-09-26 20:59:54', 1, '2026-09-26 18:49:54'),
(11, 4, '295259', 'desvincular_2fa', '2026-09-26 21:35:45', 1, '2026-09-26 19:25:45'),
(12, 4, '789135', 'vincular_2fa', '2026-09-26 21:36:19', 1, '2026-09-26 19:26:19'),
(13, 4, '425226', 'desvincular_2fa', '2026-09-26 21:37:43', 1, '2026-09-26 19:27:43'),
(14, 4, '833610', 'vincular_2fa', '2026-09-26 21:38:10', 1, '2026-09-26 19:28:10'),
(15, 4, '496503', 'desvincular_2fa', '2026-09-26 21:53:43', 1, '2026-09-26 19:43:43'),
(16, 4, '138906', 'vincular_2fa', '2026-09-26 21:54:10', 1, '2026-09-26 19:44:10'),
(17, 4, '843687', 'desvincular_2fa', '2026-09-26 22:08:30', 1, '2026-09-26 19:58:30'),
(18, 4, '076887', 'vincular_2fa', '2026-09-28 22:40:46', 1, '2026-09-28 20:30:46'),
(19, 4, '976209', 'desvincular_2fa', '2026-09-28 22:42:53', 1, '2026-09-28 20:32:53'),
(20, 4, '172251', 'vincular_2fa', '2026-10-08 03:32:13', 1, '2026-10-08 01:22:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `es_sistema` tinyint(1) DEFAULT 0,
  `com_privado` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `ticket_id`, `usuario_id`, `mensaje`, `es_sistema`, `com_privado`, `created_at`) VALUES
(1, 1, 4, 'Técnico asignado y ticket puesto en proceso.', 1, 0, '2026-07-21 07:32:13'),
(2, 1, 4, 'Comentario de prueba automatizado', 0, 0, '2026-07-21 07:32:13'),
(3, 1, 6, 'procedere a solventar', 0, 0, '2026-07-21 07:34:52'),
(4, 1, 6, 'Estado actualizado a En espera.', 1, 0, '2026-07-21 07:35:04'),
(5, 3, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-07-21 07:52:34'),
(6, 1, 6, 'Estado actualizado a En proceso.', 1, 0, '2026-07-21 07:56:00'),
(7, 1, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-07-21 07:56:00'),
(8, 1, 5, 'El solicitante rechazó la solución y el ticket vuelve a estar en proceso. Motivo: Sigue fallando la impresora, no imprime a color.', 1, 0, '2026-07-21 07:56:04'),
(9, 1, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-07-21 08:00:12'),
(10, 3, 4, 'Técnico asignado y ticket puesto en proceso.', 1, 0, '2026-07-21 14:01:17'),
(11, 1, 5, 'El solicitante confirmó el cierre y calificó el servicio con 5 estrella(s).', 1, 0, '2026-07-21 14:58:16'),
(12, 2, 4, 'Estado actualizado a En proceso.', 1, 0, '2026-07-21 15:01:53'),
(13, 2, 4, 'Estado actualizado a Pendiente.', 1, 0, '2026-07-21 15:01:57'),
(14, 2, 4, 'Técnico asignado y ticket puesto en proceso.', 1, 0, '2026-07-21 21:48:22'),
(15, 2, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-07-21 21:54:58'),
(16, 4, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-07-21 21:55:11'),
(17, 3, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-07-21 21:55:15'),
(18, 2, 5, 'El solicitante confirmó el cierre y calificó el servicio con 5 estrella(s).', 1, 0, '2026-07-21 21:55:32'),
(19, 6, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-04 23:02:51'),
(20, 6, 4, 'Técnico asignado y ticket puesto en proceso.', 1, 0, '2026-09-04 23:04:34'),
(21, 3, 9, 'El solicitante confirmó el cierre y calificó el servicio con 5 estrella(s).', 1, 0, '2026-09-07 21:58:52'),
(22, 7, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-07 22:13:49'),
(23, 7, 4, 'Estado actualizado a Irreparable. Motivo: Falta de materiales', 1, 0, '2026-09-07 22:18:05'),
(24, 8, 4, 'Estado actualizado a Rechazado. Motivo: vb', 1, 0, '2026-09-10 19:46:44'),
(25, 7, 4, 'Estado actualizado a En proceso. Motivo: 25', 1, 0, '2026-09-10 20:02:54'),
(26, 9, 4, 'Estado actualizado a Congelado. Motivo: falta de materiales', 1, 0, '2026-09-10 20:07:36'),
(27, 11, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-10 20:38:07'),
(28, 13, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-11 23:05:05'),
(29, 13, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-17 15:55:50'),
(30, 13, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-17 15:58:54'),
(31, 13, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-09-17 15:59:35'),
(32, 5, 6, 'Estado actualizado a Irreparable. Motivo: tjhjhgjkk', 1, 0, '2026-09-17 15:59:55'),
(33, 6, 6, 'Estado actualizado a Irreparable. Motivo: lñlñl', 1, 0, '2026-09-17 16:01:54'),
(34, 15, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-17 16:04:24'),
(35, 15, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-17 16:04:54'),
(36, 15, 6, 'Estado actualizado a En espera. Motivo: 46542', 1, 0, '2026-09-17 16:05:00'),
(37, 15, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-17 16:10:12'),
(38, 7, 4, 'Estado actualizado a Pendiente.', 1, 0, '2026-09-17 16:11:13'),
(39, 7, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-17 16:11:25'),
(40, 16, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-17 16:31:18'),
(41, 18, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-17 16:32:31'),
(42, 17, 4, 'Estado actualizado a Congelado. Motivo: 123456', 1, 0, '2026-09-17 16:33:47'),
(43, 17, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 16:57:28'),
(44, 9, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:15:36'),
(45, 7, 4, 'Estado actualizado a Congelado. Motivo: adsads', 1, 0, '2026-09-17 17:16:22'),
(46, 7, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:16:27'),
(47, 18, 4, 'Estado actualizado a Congelado. Motivo: dsgdsgdfhgh', 1, 0, '2026-09-17 17:17:43'),
(48, 18, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:17:44'),
(49, 18, 4, 'Estado actualizado a Congelado. Motivo: asdsaf', 1, 0, '2026-09-17 17:21:14'),
(50, 18, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:21:19'),
(51, 16, 4, 'Estado actualizado a Congelado. Motivo: poke si', 1, 0, '2026-09-17 17:21:51'),
(52, 16, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:21:55'),
(53, 16, 4, 'Estado actualizado a Congelado. Motivo: asdsadsaf', 1, 0, '2026-09-17 17:30:38'),
(54, 16, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:30:39'),
(55, 16, 4, 'Estado actualizado a Congelado. Motivo: hhfghfgnbnv', 1, 0, '2026-09-17 17:32:56'),
(56, 16, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-17 17:32:58'),
(57, 17, 4, 'Estado actualizado a Congelado. Motivo: sdsdsd', 1, 0, '2026-09-18 17:06:34'),
(58, 17, 4, 'sds', 0, 0, '2026-09-18 17:06:39'),
(59, 15, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 0, '2026-09-19 00:34:54'),
(60, 15, 4, 'asdsad', 0, 0, '2026-09-19 00:47:50'),
(61, 15, 6, 'ygghgy', 0, 0, '2026-09-19 00:48:23'),
(62, 15, 4, 'El Jefe OTIC rechazó la solicitud de irreparable. Motivo: Si se pude hacer morsh El ticket vuelve a estar en proceso.', 1, 0, '2026-09-19 17:15:13'),
(63, 15, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 0, '2026-09-19 17:17:31'),
(64, 15, 4, 'El Jefe OTIC congeló el ticket. Motivo: Falta de materiales', 1, 0, '2026-09-19 17:18:39'),
(65, 15, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-19 17:19:42'),
(66, 15, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-19 17:19:46'),
(67, 15, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-19 17:20:02'),
(68, 15, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 0, '2026-09-19 17:20:11'),
(69, 15, 6, 'fghfgjhgj', 0, 0, '2026-09-19 17:20:14'),
(70, 15, 4, 'El Jefe OTIC aprobó el irreparable. Justificación: Poke si njd', 1, 0, '2026-09-19 17:20:55'),
(71, 7, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-19 17:32:24'),
(72, 7, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 0, '2026-09-19 17:32:36'),
(73, 7, 6, 'dgfdhfhgjhj', 0, 0, '2026-09-19 17:32:39'),
(74, 7, 4, 'dfhgfhgj', 0, 0, '2026-09-19 17:33:39'),
(75, 7, 4, 'El Jefe OTIC congeló el ticket. Motivo: Coñazo', 1, 0, '2026-09-19 17:34:08'),
(76, 22, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-19 17:59:59'),
(77, 22, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-19 18:00:21'),
(78, 22, 6, 'El técnico solicitó marcar el ticket como irreparable.', 1, 1, '2026-09-19 18:00:28'),
(79, 22, 6, 'Chamo dejame la vida en paz', 0, 1, '2026-09-19 18:00:37'),
(80, 22, 4, 'Este ticket ha sido marcado como irreparable, motivo: poke si', 1, 0, '2026-09-19 18:01:22'),
(81, 20, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-09-19 18:08:15'),
(82, 20, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-19 18:08:33'),
(83, 20, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-19 18:08:47'),
(84, 20, 6, 'El técnico solicitó marcar el ticket como irreparable.', 1, 1, '2026-09-19 18:08:52'),
(85, 21, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-19 22:25:57'),
(86, 21, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-19 23:14:28'),
(87, 21, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC. Se adjuntaron 1 imagen(es).', 1, 1, '2026-09-19 23:15:23'),
(88, 11, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-21 14:57:20'),
(89, 11, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-21 14:57:42'),
(90, 11, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC. Se adjuntaron 3 imagen(es).', 1, 1, '2026-09-21 14:58:37'),
(91, 11, 4, 'NO, eso no es valido', 0, 1, '2026-09-21 15:00:20'),
(92, 11, 4, 'El Jefe OTIC rechazó la solicitud de cierre del caso. Motivo: Aun se puede solventar El ticket vuelve a estar en proceso.', 1, 0, '2026-09-21 15:00:36'),
(93, 11, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 1, '2026-09-21 15:02:07'),
(94, 11, 4, 'Este ticket ha sido marcado como irreparable, motivo: .', 1, 0, '2026-09-21 15:02:52'),
(95, 20, 4, 'Su ticket será pospuesto para una futura solución. Motivo: Despues se vera', 1, 0, '2026-09-21 15:03:09'),
(96, 18, 4, 'Estado actualizado a Congelado. Motivo: h', 1, 0, '2026-09-21 15:35:30'),
(97, 18, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar en espera.', 1, 0, '2026-09-21 15:35:31'),
(98, 16, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-21 15:37:57'),
(99, 16, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-21 15:38:12'),
(100, 16, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 1, '2026-09-21 15:38:16'),
(101, 21, 4, 'El Jefe OTIC rechazó la solicitud de cierre del caso. Motivo: . El técnico debe reanudar el trabajo.', 1, 1, '2026-09-21 20:20:31'),
(102, 21, 4, 'El ticket se encuentra en revisión técnica. El equipo continúa trabajando en él.', 1, 0, '2026-09-21 20:20:31'),
(103, 21, 6, 'El técnico ha reanudado el trabajo en el ticket.', 1, 0, '2026-09-21 20:22:34'),
(104, 21, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-09-21 20:23:48'),
(105, 19, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-21 20:40:32'),
(106, 19, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-21 20:40:46'),
(107, 19, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 1, '2026-09-21 20:40:51'),
(108, 19, 4, 'El Jefe OTIC rechazó la solicitud de cierre del caso. Motivo: . El técnico debe reanudar el trabajo.', 1, 1, '2026-09-21 20:41:20'),
(109, 19, 4, 'El ticket se encuentra en revisión técnica. El equipo continúa trabajando en él.', 1, 0, '2026-09-21 20:41:20'),
(110, 18, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-21 20:56:56'),
(111, 16, 4, 'El Jefe OTIC rechazó la solicitud de cierre del caso. Motivo: . El técnico debe reanudar el trabajo.', 1, 1, '2026-09-21 20:57:13'),
(112, 16, 4, 'El ticket se encuentra en revisión técnica. El equipo continúa trabajando en él.', 1, 0, '2026-09-21 20:57:13'),
(113, 16, 6, 'El técnico ha reanudado el trabajo en el ticket.', 1, 0, '2026-09-21 20:57:36'),
(114, 16, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC. Se adjuntaron 1 imagen(es).', 1, 1, '2026-09-21 20:57:46'),
(115, 18, 6, 'El técnico inició el trabajo en el ticket.', 1, 0, '2026-09-21 20:57:50'),
(116, 18, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC. Se adjuntaron 3 imagen(es).', 1, 1, '2026-09-21 20:58:00'),
(117, 16, 4, 'f', 0, 1, '2026-09-22 18:44:33'),
(118, 16, 4, 'f', 0, 1, '2026-09-22 18:44:36'),
(119, 16, 4, 'f', 0, 1, '2026-09-22 18:44:38'),
(120, 17, 4, 'El Jefe OTIC reactivó el ticket. Vuelve a estar pendiente de asignación.', 1, 0, '2026-09-29 18:41:43'),
(121, 20, 4, 'El Jefe OTIC reactivó el ticket y mantuvo al técnico asignado. Vuelve a estar en espera.', 1, 0, '2026-09-29 18:43:08'),
(122, 7, 4, 'El Jefe OTIC reactivó el ticket y decidió reasignarlo a otro técnico.', 1, 0, '2026-09-29 18:43:48'),
(123, 7, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-09-29 18:43:56'),
(124, 18, 4, 'Su ticket será pospuesto para una futura solución. Motivo: Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibu', 1, 0, '2026-10-06 23:10:25'),
(125, 18, 4, 'El Jefe OTIC reactivó el ticket y mantuvo al técnico asignado. Vuelve a estar en espera.', 1, 0, '2026-10-06 23:10:31'),
(126, 23, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-10-09 16:02:52'),
(127, 24, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-10-09 16:24:16'),
(128, 23, 6, 'El técnico empezó a trabajo en el ticket.', 1, 0, '2026-10-09 16:24:20'),
(129, 23, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-10-09 16:24:33'),
(130, 19, 6, 'El técnico ha reanudado el trabajo en el ticket.', 1, 0, '2026-10-09 16:24:40'),
(131, 25, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-10-10 14:03:06'),
(132, 25, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-10-10 14:03:40'),
(133, 19, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 1, '2026-10-10 14:04:50'),
(134, 25, 6, 'El técnico empezó a trabajo en el ticket.', 1, 0, '2026-10-10 14:05:02'),
(135, 25, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-10-10 14:05:10'),
(136, 25, 9, 'El solicitante confirmó el cierre y calificó el servicio con 4 estrella(s).', 1, 0, '2026-10-10 14:05:55'),
(137, 19, 4, 'Su ticket será pospuesto para una futura solución. Motivo: Por falta de equipos, el caso se pondrá en pausa por un tiempo para ser reanudado en la medida de lo posible una vez haya llegado el material', 1, 0, '2026-10-10 14:07:07'),
(138, 19, 4, 'El Jefe OTIC reactivó el ticket y decidió reasignarlo a otro técnico.', 1, 0, '2026-10-10 14:07:25'),
(139, 27, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-10-10 14:29:03'),
(140, 27, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-10-10 14:29:29'),
(141, 27, 6, 'El técnico empezó a trabajo en el ticket.', 1, 0, '2026-10-10 14:29:52'),
(142, 27, 6, 'El técnico marcó el ticket como solventado.', 1, 0, '2026-10-10 14:30:04'),
(143, 27, 9, 'El solicitante confirmó el cierre y calificó el servicio con 5 estrella(s).', 1, 0, '2026-10-10 14:30:33'),
(144, 16, 4, 'Este ticket ha sido marcado como irreparable, motivo: El ticket no puede ser marcado como irreparable puesto que aun tiene solucion', 1, 0, '2026-10-10 14:31:22'),
(145, 28, 5, 'Solicitud aprobada por el coordinador.', 1, 0, '2026-10-10 14:37:03'),
(146, 28, 4, 'Técnico asignado. El ticket queda en espera de que el técnico lo inicie.', 1, 0, '2026-10-10 14:37:48'),
(147, 28, 6, 'El técnico empezó a trabajo en el ticket.', 1, 0, '2026-10-10 14:38:07'),
(148, 28, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 1, '2026-10-10 14:38:23'),
(149, 28, 4, 'Necesito mas detalles para aprobar o negar tu solicitud de cierre', 0, 1, '2026-10-10 14:39:01'),
(150, 28, 6, 'El técnico solicitó marcar el ticket como irreparable. Esperando evaluación del Jefe OTIC.', 1, 1, '2026-10-10 14:39:05'),
(151, 28, 6, 'No, lo que pasa es que están pidiendo actualizacion a windows 11 promax evolution con una pentiun y 512 mb de ram', 0, 1, '2026-10-10 14:39:38'),
(152, 28, 4, 'Este ticket ha sido marcado como irreparable, motivo: No se puede solventar el caso por obsolescencia de los equipos', 1, 0, '2026-10-10 14:40:29'),
(153, 19, 4, 'Equipo de 2 técnicos asignado. El ticket queda en espera de que el principal lo inicie.', 1, 0, '2026-10-14 14:58:32'),
(154, 19, 4, 'Equipo de 2 técnicos asignado. El ticket queda en espera de que el principal lo inicie.', 1, 0, '2026-10-14 14:58:37'),
(155, 17, 4, 'Técnico asignado. El ticket queda en espera hasta ser iniciado.', 1, 0, '2026-10-14 14:58:55'),
(156, 29, 34, 'Técnico asignado. El ticket queda en espera hasta ser iniciado.', 1, 0, '2026-10-16 01:18:45'),
(157, 29, 4, 'Estado actualizado a Congelado. Motivo: pokesi njd', 1, 0, '2026-10-16 01:21:51'),
(158, 29, 4, 'El Jefe OTIC reactivó el ticket y mantuvo al técnico asignado. Vuelve a estar en espera.', 1, 0, '2026-10-16 01:21:56'),
(159, 29, 34, 'Estado actualizado a Congelado. Motivo: xq me da la gana carajito', 1, 0, '2026-10-16 01:40:29'),
(160, 29, 34, 'El Jefe OTIC reactivó el ticket y mantuvo al técnico asignado. Vuelve a estar en espera.', 1, 0, '2026-10-16 01:40:34'),
(161, 29, 4, 'Estado actualizado a Congelado. Motivo: asfdfdgfhfgjhjg', 1, 0, '2026-10-16 01:40:44'),
(162, 29, 4, 'El Jefe OTIC reactivó el ticket y mantuvo al técnico asignado. Vuelve a estar en espera.', 1, 0, '2026-10-16 01:40:47'),
(163, 20, 6, 'El técnico empezó a trabajo en el ticket.', 1, 0, '2026-10-23 04:12:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinador`
--

CREATE TABLE `coordinador` (
  `id` int(11) NOT NULL,
  `pnf_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coordinador`
--

INSERT INTO `coordinador` (`id`, `pnf_id`, `created_at`) VALUES
(5, 1, '2026-06-19 01:53:07'),
(32, 12, '2026-10-09 15:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas_tecnicos`
--

CREATE TABLE `estadisticas_tecnicos` (
  `id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `semana` int(11) NOT NULL,
  `estado_semana` enum('Activo','Inactivo','Vacaciones','Reposo') DEFAULT 'Activo',
  `tickets_resueltos` int(11) DEFAULT 0,
  `tickets_en_proceso` int(11) DEFAULT 0,
  `tiempo_promedio_resolucion` decimal(10,2) DEFAULT NULL,
  `puntuacion_promedio` decimal(3,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `mensaje` varchar(255) NOT NULL,
  `leida` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `usuario_id`, `ticket_id`, `mensaje`, `leida`, `created_at`) VALUES
(1, 5, 1, 'El ticket T-2026-0001 cambió a estado \"En proceso\".', 1, '2026-07-21 07:56:00'),
(2, 5, 1, 'Tu ticket T-2026-0001 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-07-21 07:56:00'),
(3, 6, 1, 'El solicitante rechazó tu solución al ticket T-2026-0001: Sigue fallando la impresora, no imprime a color.', 1, '2026-07-21 07:56:04'),
(4, 5, 1, 'Tu ticket T-2026-0001 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-07-21 08:00:12'),
(5, 6, 3, 'Se te asignó el ticket T-2026-0003 con prioridad Alta.', 1, '2026-07-21 14:01:17'),
(6, 6, 1, 'Tu solución al ticket T-2026-0001 fue aceptada y calificada con 5 estrella(s).', 1, '2026-07-21 14:58:16'),
(7, 5, 2, 'El ticket T-2026-0002 cambió a estado \"En proceso\".', 1, '2026-07-21 15:01:53'),
(8, 5, 2, 'El ticket T-2026-0002 cambió a estado \"Pendiente\".', 1, '2026-07-21 15:01:57'),
(9, 6, 2, 'Se te asignó el ticket T-2026-0002 con prioridad Media.', 1, '2026-07-21 21:48:22'),
(10, 5, 2, 'Tu ticket T-2026-0002 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-07-21 21:54:58'),
(11, 4, 4, 'Tu ticket T-2026-0004 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-07-21 21:55:11'),
(12, 9, 3, 'Tu ticket T-2026-0003 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-07-21 21:55:15'),
(13, 6, 2, 'Tu solución al ticket T-2026-0002 fue aceptada y calificada con 5 estrella(s).', 1, '2026-07-21 21:55:32'),
(14, 9, 6, 'Tu ticket T-2026-0006 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-04 23:02:51'),
(15, 4, 6, 'El ticket T-2026-0006 fue aprobado y necesita asignación de técnico.', 1, '2026-09-04 23:02:51'),
(16, 6, 6, 'Se te asignó el ticket T-2026-0006 con prioridad Alta.', 1, '2026-09-04 23:04:34'),
(17, 6, 3, 'Tu solución al ticket T-2026-0003 fue aceptada y calificada con 5 estrella(s).', 1, '2026-09-07 21:58:52'),
(18, 9, 7, 'Tu ticket T-2026-0007 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-07 22:13:49'),
(19, 4, 7, 'El ticket T-2026-0007 fue aprobado y necesita asignación de técnico.', 1, '2026-09-07 22:13:49'),
(20, 9, 7, 'El ticket T-2026-0007 quedó en \"Irreparable\": Falta de materiales', 1, '2026-09-07 22:18:05'),
(21, 4, 7, 'El ticket T-2026-0007 quedó en \"Irreparable\": Falta de materiales', 1, '2026-09-07 22:18:05'),
(22, 9, 7, 'El ticket T-2026-0007 cambió a estado \"En proceso\".', 1, '2026-09-10 20:02:54'),
(23, 5, 9, 'El ticket T-2026-0009 cambió a estado \"Congelado\".', 1, '2026-09-10 20:07:36'),
(24, 9, 11, 'Tu ticket T-2026-0011 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-10 20:38:07'),
(25, 4, 11, 'El ticket T-2026-0011 fue aprobado y necesita asignación de técnico.', 1, '2026-09-10 20:38:07'),
(26, 5, 12, 'Nuevo ticket T-2026-0012 pendiente de tu aprobación: \"Prueba 2\".', 1, '2026-09-10 20:51:37'),
(27, 5, 13, 'Nuevo ticket T-2026-0013 pendiente de tu aprobación: \"Prueba admin\".', 1, '2026-09-11 22:51:59'),
(28, 5, 14, 'Nuevo ticket T-2026-0014 pendiente de tu aprobación: \"Prueba eliminar\".', 1, '2026-09-11 22:55:42'),
(29, 9, 13, 'Tu ticket T-2026-0013 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-11 23:05:05'),
(30, 4, 13, 'El ticket T-2026-0013 fue aprobado y necesita asignación de técnico.', 1, '2026-09-11 23:05:05'),
(31, 6, 13, 'Se te asignó el ticket T-2026-0013 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-17 15:55:50'),
(32, 9, 13, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0013.', 1, '2026-09-17 15:58:54'),
(33, 9, 13, 'Tu ticket T-2026-0013 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-09-17 15:59:35'),
(34, 4, 5, 'El ticket T-2026-0005 quedó en \"Irreparable\": tjhjhgjkk', 1, '2026-09-17 15:59:55'),
(35, 4, 5, 'El ticket T-2026-0005 quedó en \"Irreparable\": tjhjhgjkk', 1, '2026-09-17 15:59:55'),
(36, 9, 6, 'El ticket T-2026-0006 quedó en \"Irreparable\": lñlñl', 1, '2026-09-17 16:01:54'),
(37, 4, 6, 'El ticket T-2026-0006 quedó en \"Irreparable\": lñlñl', 1, '2026-09-17 16:01:54'),
(38, 6, 15, 'Se te asignó el ticket T-2026-0015 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-17 16:04:24'),
(39, 5, 15, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0015.', 1, '2026-09-17 16:04:54'),
(40, 5, 15, 'El ticket T-2026-0015 quedó en \"En espera\": 46542', 1, '2026-09-17 16:05:00'),
(41, 4, 15, 'El ticket T-2026-0015 quedó en \"En espera\": 46542', 1, '2026-09-17 16:05:00'),
(42, 5, 15, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0015.', 1, '2026-09-17 16:10:12'),
(43, 9, 7, 'El ticket T-2026-0007 cambió a estado \"Pendiente\".', 1, '2026-09-17 16:11:13'),
(44, 6, 7, 'Se te asignó el ticket T-2026-0007 con prioridad Alta. Inícialo cuando estés listo.', 1, '2026-09-17 16:11:25'),
(45, 5, 16, 'Nuevo ticket T-2026-0016 pendiente de tu aprobación: \"Sub10\".', 1, '2026-09-17 16:30:51'),
(46, 9, 16, 'Tu ticket T-2026-0016 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-17 16:31:18'),
(47, 4, 16, 'El ticket T-2026-0016 fue aprobado y necesita asignación de técnico.', 1, '2026-09-17 16:31:18'),
(48, 5, 18, 'Nuevo ticket T-2026-0018 pendiente de tu aprobación: \"Sub20\".', 1, '2026-09-17 16:32:17'),
(49, 9, 18, 'Tu ticket T-2026-0018 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-17 16:32:31'),
(50, 4, 18, 'El ticket T-2026-0018 fue aprobado y necesita asignación de técnico.', 1, '2026-09-17 16:32:31'),
(51, 5, 17, 'El ticket T-2026-0017 cambió a estado \"Congelado\".', 1, '2026-09-17 16:33:47'),
(52, 5, 17, 'El ticket T-2026-0017 fue reactivado.', 1, '2026-09-17 16:57:28'),
(53, 5, 9, 'El ticket T-2026-0009 fue reactivado.', 1, '2026-09-17 17:15:36'),
(54, 9, 7, 'El ticket T-2026-0007 quedó en \"Congelado\": adsads', 1, '2026-09-17 17:16:22'),
(55, 4, 7, 'El ticket T-2026-0007 quedó en \"Congelado\": adsads', 1, '2026-09-17 17:16:22'),
(56, 6, 7, 'El ticket T-2026-0007 fue reactivado. Puedes iniciarlo cuando estés listo.', 1, '2026-09-17 17:16:27'),
(57, 9, 7, 'El ticket T-2026-0007 fue reactivado.', 1, '2026-09-17 17:16:27'),
(58, 9, 18, 'El ticket T-2026-0018 quedó en \"Congelado\": dsgdsgdfhgh', 1, '2026-09-17 17:17:43'),
(59, 4, 18, 'El ticket T-2026-0018 quedó en \"Congelado\": dsgdsgdfhgh', 1, '2026-09-17 17:17:43'),
(60, 9, 18, 'El ticket T-2026-0018 fue reactivado.', 1, '2026-09-17 17:17:44'),
(61, 9, 18, 'El ticket T-2026-0018 quedó en \"Congelado\": asdsaf', 1, '2026-09-17 17:21:14'),
(62, 4, 18, 'El ticket T-2026-0018 quedó en \"Congelado\": asdsaf', 1, '2026-09-17 17:21:14'),
(63, 9, 18, 'El ticket T-2026-0018 fue reactivado.', 1, '2026-09-17 17:21:19'),
(64, 9, 16, 'El ticket T-2026-0016 quedó en \"Congelado\": poke si', 1, '2026-09-17 17:21:51'),
(65, 4, 16, 'El ticket T-2026-0016 quedó en \"Congelado\": poke si', 1, '2026-09-17 17:21:51'),
(66, 9, 16, 'El ticket T-2026-0016 fue reactivado.', 1, '2026-09-17 17:21:55'),
(67, 9, 16, 'El ticket T-2026-0016 quedó en \"Congelado\": asdsadsaf', 1, '2026-09-17 17:30:38'),
(68, 4, 16, 'El ticket T-2026-0016 quedó en \"Congelado\": asdsadsaf', 1, '2026-09-17 17:30:38'),
(69, 9, 16, 'El ticket T-2026-0016 fue reactivado.', 1, '2026-09-17 17:30:39'),
(70, 9, 16, 'El ticket T-2026-0016 quedó en \"Congelado\": hhfghfgnbnv', 1, '2026-09-17 17:32:56'),
(71, 4, 16, 'El ticket T-2026-0016 quedó en \"Congelado\": hhfghfgnbnv', 1, '2026-09-17 17:32:56'),
(72, 9, 16, 'El ticket T-2026-0016 fue reactivado.', 1, '2026-09-17 17:32:58'),
(73, 5, 17, 'El ticket T-2026-0017 quedó en \"Congelado\": sdsdsd', 1, '2026-09-18 17:06:34'),
(74, 4, 17, 'El ticket T-2026-0017 quedó en \"Congelado\": sdsdsd', 1, '2026-09-18 17:06:34'),
(75, 5, 20, 'Nuevo ticket T-2026-0020 pendiente de tu aprobación: \"Prueba\".', 1, '2026-09-18 17:38:48'),
(76, 5, 15, 'Tu ticket T-2026-0015 está en evaluación técnica.', 1, '2026-09-19 00:34:54'),
(77, 4, 15, 'El técnico solicitó marcar el ticket T-2026-0015 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 00:34:54'),
(78, 6, 15, 'Tu solicitud de irreparable para el ticket T-2026-0015 fue RECHAZADA. Motivo: Si se pude hacer morsh', 1, '2026-09-19 17:15:13'),
(79, 5, 15, 'El ticket T-2026-0015 vuelve a estar en proceso. El equipo técnico continúa trabajando en él.', 1, '2026-09-19 17:15:13'),
(80, 5, 15, 'Tu ticket T-2026-0015 está en evaluación técnica.', 1, '2026-09-19 17:17:31'),
(81, 4, 15, 'El técnico solicitó marcar el ticket T-2026-0015 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 17:17:31'),
(82, 6, 15, 'El ticket T-2026-0015 fue congelado por el Jefe OTIC. Motivo: Falta de materiales', 1, '2026-09-19 17:18:39'),
(83, 5, 15, 'El ticket T-2026-0015 ha sido pausado. Motivo: Falta de materiales', 1, '2026-09-19 17:18:39'),
(84, 6, 15, 'El ticket T-2026-0015 fue reactivado. Puedes iniciarlo cuando estés listo.', 1, '2026-09-19 17:19:42'),
(85, 5, 15, 'El ticket T-2026-0015 fue reactivado.', 1, '2026-09-19 17:19:42'),
(86, 6, 15, 'Se te asignó el ticket T-2026-0015 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-19 17:19:46'),
(87, 5, 15, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0015.', 1, '2026-09-19 17:20:02'),
(88, 5, 15, 'Tu ticket T-2026-0015 está en evaluación técnica.', 1, '2026-09-19 17:20:11'),
(89, 4, 15, 'El técnico solicitó marcar el ticket T-2026-0015 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 17:20:11'),
(90, 6, 15, 'Tu solicitud de irreparable para el ticket T-2026-0015 fue APROBADA. Justificación: Poke si njd', 1, '2026-09-19 17:20:55'),
(91, 5, 15, 'El ticket T-2026-0015 fue marcado como NO REPARABLE. Motivo: Poke si njd', 1, '2026-09-19 17:20:55'),
(92, 9, 7, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0007.', 1, '2026-09-19 17:32:24'),
(93, 9, 7, 'Tu ticket T-2026-0007 está en evaluación técnica.', 1, '2026-09-19 17:32:36'),
(94, 4, 7, 'El técnico solicitó marcar el ticket T-2026-0007 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 17:32:36'),
(95, 6, 7, 'El ticket T-2026-0007 fue congelado por el Jefe OTIC. Motivo: Coñazo', 1, '2026-09-19 17:34:08'),
(96, 9, 7, 'El ticket T-2026-0007 ha sido pausado. Motivo: Coñazo', 1, '2026-09-19 17:34:08'),
(97, 6, 22, 'Se te asignó el ticket T-2026-0022 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-19 17:59:59'),
(98, 5, 22, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0022.', 1, '2026-09-19 18:00:21'),
(99, 5, 22, 'Tu ticket T-2026-0022 está en evaluación técnica.', 1, '2026-09-19 18:00:28'),
(100, 4, 22, 'El técnico solicitó marcar el ticket T-2026-0022 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 18:00:28'),
(101, 6, 22, 'Tu solicitud de irreparable para el ticket T-2026-0022 fue APROBADA. Justificación: poke si', 1, '2026-09-19 18:01:22'),
(102, 5, 22, 'El ticket T-2026-0022 fue marcado como NO REPARABLE. Motivo: poke si', 1, '2026-09-19 18:01:22'),
(103, 9, 20, 'Tu ticket T-2026-0020 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-09-19 18:08:15'),
(104, 4, 20, 'El ticket T-2026-0020 fue aprobado y necesita asignación de técnico.', 1, '2026-09-19 18:08:15'),
(105, 6, 20, 'Se te asignó el ticket T-2026-0020 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-19 18:08:33'),
(106, 9, 20, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0020.', 1, '2026-09-19 18:08:47'),
(107, 9, 20, 'Tu ticket T-2026-0020 está en evaluación técnica.', 1, '2026-09-19 18:08:52'),
(108, 4, 20, 'El técnico solicitó marcar el ticket T-2026-0020 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 18:08:52'),
(109, 6, 21, 'Se te asignó el ticket T-2026-0021 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-19 22:25:57'),
(110, 5, 21, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0021.', 1, '2026-09-19 23:14:28'),
(111, 5, 21, 'Tu ticket T-2026-0021 está en evaluación técnica.', 1, '2026-09-19 23:15:23'),
(112, 4, 21, 'El técnico solicitó marcar el ticket T-2026-0021 como irreparable. Requiere tu evaluación.', 1, '2026-09-19 23:15:23'),
(113, 6, 11, 'Se te asignó el ticket T-2026-0011 con prioridad Alta. Inícialo cuando estés listo.', 1, '2026-09-21 14:57:20'),
(114, 9, 11, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0011.', 1, '2026-09-21 14:57:42'),
(115, 9, 11, 'Tu ticket T-2026-0011 está en evaluación técnica.', 1, '2026-09-21 14:58:37'),
(116, 4, 11, 'El técnico solicitó marcar el ticket T-2026-0011 como irreparable. Requiere tu evaluación.', 1, '2026-09-21 14:58:37'),
(117, 6, 11, 'Tu solicitud de irreparable para el ticket T-2026-0011 fue RECHAZADA. Motivo: Aun se puede solventar', 1, '2026-09-21 15:00:36'),
(118, 9, 11, 'El ticket T-2026-0011 vuelve a estar en proceso. El equipo técnico continúa trabajando en él.', 1, '2026-09-21 15:00:36'),
(119, 9, 11, 'Tu ticket T-2026-0011 está en evaluación técnica.', 1, '2026-09-21 15:02:07'),
(120, 4, 11, 'El técnico solicitó marcar el ticket T-2026-0011 como irreparable. Requiere tu evaluación.', 1, '2026-09-21 15:02:07'),
(121, 6, 11, 'Tu solicitud de irreparable para el ticket T-2026-0011 fue APROBADA. Justificación: .', 1, '2026-09-21 15:02:52'),
(122, 9, 11, 'El ticket T-2026-0011 fue marcado como NO REPARABLE. Motivo: .', 1, '2026-09-21 15:02:52'),
(123, 6, 20, 'El ticket T-2026-0020 fue congelado por el Jefe OTIC. Motivo: Despues se vera', 1, '2026-09-21 15:03:09'),
(124, 9, 20, 'El ticket T-2026-0020 ha sido pausado. Motivo: Despues se vera', 1, '2026-09-21 15:03:09'),
(125, 9, 18, 'El ticket T-2026-0018 cambió a estado \"Congelado\".', 1, '2026-09-21 15:35:30'),
(126, 9, 18, 'El ticket T-2026-0018 fue reactivado.', 1, '2026-09-21 15:35:31'),
(127, 6, 16, 'Se te asignó el ticket T-2026-0016 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-21 15:37:57'),
(128, 9, 16, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0016.', 1, '2026-09-21 15:38:12'),
(129, 9, 16, 'Tu ticket T-2026-0016 está en evaluación técnica.', 1, '2026-09-21 15:38:16'),
(130, 4, 16, 'El técnico solicitó marcar el ticket T-2026-0016 como irreparable. Requiere tu evaluación.', 1, '2026-09-21 15:38:16'),
(131, 6, 21, 'Tu solicitud de irreparable para el ticket T-2026-0021 fue RECHAZADA. Motivo: . Reanuda el ticket cuando puedas.', 1, '2026-09-21 20:20:31'),
(132, 5, 21, 'El ticket T-2026-0021 se encuentra en revisión técnica. El equipo continúa trabajando en él.', 1, '2026-09-21 20:20:31'),
(133, 5, 21, 'El ticket T-2026-0021 ha sido reanudado. El equipo técnico continúa trabajando en él.', 1, '2026-09-21 20:22:34'),
(134, 4, 21, 'El técnico reanudó el ticket T-2026-0021.', 1, '2026-09-21 20:22:34'),
(135, 5, 21, 'Tu ticket T-2026-0021 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-09-21 20:23:48'),
(136, 6, 19, 'Se te asignó el ticket T-2026-0019 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-09-21 20:40:32'),
(137, 5, 19, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0019.', 1, '2026-09-21 20:40:46'),
(138, 5, 19, 'Tu ticket T-2026-0019 está en evaluación técnica.', 1, '2026-09-21 20:40:51'),
(139, 4, 19, 'El técnico solicitó marcar el ticket T-2026-0019 como irreparable. Requiere tu evaluación.', 1, '2026-09-21 20:40:51'),
(140, 6, 19, 'Tu solicitud de irreparable para el ticket T-2026-0019 fue RECHAZADA. Motivo: . Reanuda el ticket cuando puedas.', 1, '2026-09-21 20:41:20'),
(141, 5, 19, 'El ticket T-2026-0019 se encuentra en revisión técnica. El equipo continúa trabajando en él.', 1, '2026-09-21 20:41:20'),
(142, 6, 18, 'Se te asignó el ticket T-2026-0018 con prioridad Alta. Inícialo cuando estés listo.', 1, '2026-09-21 20:56:56'),
(143, 6, 16, 'Tu solicitud de irreparable para el ticket T-2026-0016 fue RECHAZADA. Motivo: . Reanuda el ticket cuando puedas.', 1, '2026-09-21 20:57:13'),
(144, 9, 16, 'El ticket T-2026-0016 se encuentra en revisión técnica. El equipo continúa trabajando en él.', 1, '2026-09-21 20:57:13'),
(145, 9, 16, 'El ticket T-2026-0016 ha sido reanudado. El equipo técnico continúa trabajando en él.', 1, '2026-09-21 20:57:36'),
(146, 4, 16, 'El técnico reanudó el ticket T-2026-0016.', 1, '2026-09-21 20:57:36'),
(147, 9, 16, 'Tu ticket T-2026-0016 está en evaluación técnica.', 1, '2026-09-21 20:57:46'),
(148, 4, 16, 'El técnico solicitó marcar el ticket T-2026-0016 como irreparable. Requiere tu evaluación.', 1, '2026-09-21 20:57:46'),
(149, 9, 18, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0018.', 1, '2026-09-21 20:57:50'),
(150, 9, 18, 'Tu ticket T-2026-0018 está en evaluación técnica.', 1, '2026-09-21 20:58:00'),
(151, 4, 18, 'El técnico solicitó marcar el ticket T-2026-0018 como irreparable. Requiere tu evaluación.', 1, '2026-09-21 20:58:00'),
(152, 5, 17, 'El ticket T-2026-0017 fue reactivado.', 1, '2026-09-29 18:41:43'),
(153, 6, 20, 'El ticket T-2026-0020 fue reactivado y se mantuvo tu asignación. Puedes iniciarlo cuando estés listo.', 1, '2026-09-29 18:43:08'),
(154, 9, 20, 'El ticket T-2026-0020 fue reactivado.', 0, '2026-09-29 18:43:08'),
(155, 6, 7, 'El ticket T-2026-0007 fue reactivado y reasignado a otro técnico.', 1, '2026-09-29 18:43:48'),
(156, 9, 7, 'El ticket T-2026-0007 fue reactivado y será reasignado.', 1, '2026-09-29 18:43:48'),
(157, 6, 7, 'Se te asignó el ticket T-2026-0007 con prioridad Alta. Inícialo cuando estés listo.', 1, '2026-09-29 18:43:56'),
(158, 6, 18, 'El ticket T-2026-0018 fue congelado por el Jefe OTIC. Motivo: Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. D', 1, '2026-10-06 23:10:25'),
(159, 9, 18, 'El ticket T-2026-0018 ha sido pausado. Motivo: Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis', 1, '2026-10-06 23:10:25'),
(160, 6, 18, 'El ticket T-2026-0018 fue reactivado y se mantuvo tu asignación. Puedes iniciarlo cuando estés listo.', 1, '2026-10-06 23:10:31'),
(161, 9, 18, 'El ticket T-2026-0018 fue reactivado.', 1, '2026-10-06 23:10:31'),
(162, 6, 23, 'Se te asignó el ticket T-2026-0023 con prioridad Baja. Inícialo cuando estés listo.', 1, '2026-10-09 16:02:52'),
(163, 4, 24, 'Tu ticket T-2026-0024 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-10-09 16:24:16'),
(164, 5, 23, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0023.', 1, '2026-10-09 16:24:20'),
(165, 5, 23, 'Tu ticket T-2026-0023 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-10-09 16:24:33'),
(166, 5, 19, 'El ticket T-2026-0019 ha sido reanudado. El equipo técnico continúa trabajando en él.', 1, '2026-10-09 16:24:40'),
(167, 4, 19, 'El técnico reanudó el ticket T-2026-0019.', 1, '2026-10-09 16:24:40'),
(168, 19, 19, 'El técnico reanudó el ticket T-2026-0019.', 0, '2026-10-09 16:24:40'),
(169, 5, 25, 'Nuevo ticket T-2026-0025 pendiente de tu aprobación: \"Computadoras descompuestas\".', 1, '2026-10-10 14:02:37'),
(170, 9, 25, 'Tu ticket T-2026-0025 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-10-10 14:03:06'),
(171, 4, 25, 'El ticket T-2026-0025 fue aprobado y necesita asignación de técnico.', 1, '2026-10-10 14:03:06'),
(172, 19, 25, 'El ticket T-2026-0025 fue aprobado y necesita asignación de técnico.', 0, '2026-10-10 14:03:06'),
(173, 6, 25, 'Se te asignó el ticket T-2026-0025 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-10-10 14:03:40'),
(174, 5, 19, 'Tu ticket T-2026-0019 está en evaluación técnica.', 1, '2026-10-10 14:04:50'),
(175, 4, 19, 'El técnico solicitó marcar el ticket T-2026-0019 como irreparable. Requiere tu evaluación.', 1, '2026-10-10 14:04:50'),
(176, 19, 19, 'El técnico solicitó marcar el ticket T-2026-0019 como irreparable. Requiere tu evaluación.', 0, '2026-10-10 14:04:50'),
(177, 9, 25, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0025.', 1, '2026-10-10 14:05:02'),
(178, 9, 25, 'Tu ticket T-2026-0025 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-10-10 14:05:10'),
(179, 6, 25, 'Tu solución al ticket T-2026-0025 fue aceptada y calificada con 4 estrella(s).', 0, '2026-10-10 14:05:55'),
(180, 6, 19, 'El ticket T-2026-0019 fue congelado por el Jefe OTIC. Motivo: Por falta de equipos, el caso se pondrá en pausa por un tiempo para ser reanudado en la medida de lo posible una vez haya llegado el material', 0, '2026-10-10 14:07:07'),
(181, 5, 19, 'El ticket T-2026-0019 ha sido pausado. Motivo: Por falta de equipos, el caso se pondrá en pausa por un tiempo para ser reanudado en la medida de lo posible una vez haya llegado el material', 1, '2026-10-10 14:07:07'),
(182, 6, 19, 'El ticket T-2026-0019 fue reactivado y reasignado a otro técnico.', 0, '2026-10-10 14:07:25'),
(183, 5, 19, 'El ticket T-2026-0019 fue reactivado y será reasignado.', 1, '2026-10-10 14:07:25'),
(184, 5, 26, 'Nuevo ticket T-2026-0026 pendiente de tu aprobación: \"Fallo en las computadoras\".', 0, '2026-10-10 14:27:16'),
(185, 5, 27, 'Nuevo ticket T-2026-0027 pendiente de tu aprobación: \"Equipos descompuestos\".', 1, '2026-10-10 14:28:45'),
(186, 9, 27, 'Tu ticket T-2026-0027 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-10-10 14:29:03'),
(187, 4, 27, 'El ticket T-2026-0027 fue aprobado y necesita asignación de técnico.', 1, '2026-10-10 14:29:03'),
(188, 19, 27, 'El ticket T-2026-0027 fue aprobado y necesita asignación de técnico.', 0, '2026-10-10 14:29:03'),
(189, 6, 27, 'Se te asignó el ticket T-2026-0027 con prioridad Alta. Inícialo cuando estés listo.', 1, '2026-10-10 14:29:29'),
(190, 9, 27, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0027.', 1, '2026-10-10 14:29:52'),
(191, 9, 27, 'Tu ticket T-2026-0027 fue marcado como solventado. Confirma o rechaza la solución.', 1, '2026-10-10 14:30:04'),
(192, 6, 27, 'Tu solución al ticket T-2026-0027 fue aceptada y calificada con 5 estrella(s).', 0, '2026-10-10 14:30:33'),
(193, 6, 16, 'Tu solicitud de irreparable para el ticket T-2026-0016 fue APROBADA. Justificación: El ticket no puede ser marcado como irreparable puesto que aun tiene solucion', 1, '2026-10-10 14:31:22'),
(194, 9, 16, 'El ticket T-2026-0016 fue marcado como NO REPARABLE. Motivo: El ticket no puede ser marcado como irreparable puesto que aun tiene solucion', 1, '2026-10-10 14:31:22'),
(195, 5, 28, 'Nuevo ticket T-2026-0028 pendiente de tu aprobación: \"Prueba\".', 1, '2026-10-10 14:36:43'),
(196, 9, 28, 'Tu ticket T-2026-0028 fue aprobado por el coordinador y espera asignación de técnico.', 1, '2026-10-10 14:37:03'),
(197, 4, 28, 'El ticket T-2026-0028 fue aprobado y necesita asignación de técnico.', 1, '2026-10-10 14:37:03'),
(198, 19, 28, 'El ticket T-2026-0028 fue aprobado y necesita asignación de técnico.', 0, '2026-10-10 14:37:03'),
(199, 6, 28, 'Se te asignó el ticket T-2026-0028 con prioridad Media. Inícialo cuando estés listo.', 1, '2026-10-10 14:37:48'),
(200, 9, 28, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0028.', 1, '2026-10-10 14:38:07'),
(201, 9, 28, 'Tu ticket T-2026-0028 está en evaluación técnica.', 1, '2026-10-10 14:38:23'),
(202, 4, 28, 'El técnico solicitó marcar el ticket T-2026-0028 como irreparable. Requiere tu evaluación.', 1, '2026-10-10 14:38:23'),
(203, 19, 28, 'El técnico solicitó marcar el ticket T-2026-0028 como irreparable. Requiere tu evaluación.', 0, '2026-10-10 14:38:23'),
(204, 9, 28, 'Tu ticket T-2026-0028 está en evaluación técnica.', 1, '2026-10-10 14:39:05'),
(205, 4, 28, 'El técnico solicitó marcar el ticket T-2026-0028 como irreparable. Requiere tu evaluación.', 1, '2026-10-10 14:39:05'),
(206, 19, 28, 'El técnico solicitó marcar el ticket T-2026-0028 como irreparable. Requiere tu evaluación.', 0, '2026-10-10 14:39:05'),
(207, 6, 28, 'Tu solicitud de irreparable para el ticket T-2026-0028 fue APROBADA. Justificación: No se puede solventar el caso por obsolescencia de los equipos', 0, '2026-10-10 14:40:29'),
(208, 9, 28, 'El ticket T-2026-0028 fue marcado como NO REPARABLE. Motivo: No se puede solventar el caso por obsolescencia de los equipos', 1, '2026-10-10 14:40:29'),
(209, 6, 19, 'Se te asignó como encargado del ticket T-2026-0019 con prioridad Media. Inícialo cuando estés listo.', 0, '2026-10-14 14:58:32'),
(210, 33, 19, 'Fuiste asignado como colaborador al ticket T-2026-0019.', 0, '2026-10-14 14:58:32'),
(211, 6, 19, 'Se te asignó como encargado del ticket T-2026-0019 con prioridad Media. Inícialo cuando estés listo.', 0, '2026-10-14 14:58:37'),
(212, 33, 19, 'Fuiste asignado como colaborador al ticket T-2026-0019.', 0, '2026-10-14 14:58:37'),
(213, 33, 17, 'Se te asignó como encargado del ticket T-2026-0017 con prioridad Media. Inícialo cuando estés listo.', 0, '2026-10-14 14:58:55'),
(214, 33, 29, 'Se te asignó como encargado del ticket T-2026-0029 con prioridad Baja. Inícialo cuando estés listo.', 0, '2026-10-16 01:18:45'),
(215, 5, 29, 'El ticket T-2026-0029 cambió a estado \"Congelado\".', 0, '2026-10-16 01:21:51'),
(216, 33, 29, 'El ticket T-2026-0029 fue reactivado y se mantuvo tu asignación. Puedes iniciarlo cuando estés listo.', 0, '2026-10-16 01:21:56'),
(217, 5, 29, 'El ticket T-2026-0029 fue reactivado.', 0, '2026-10-16 01:21:56'),
(218, 5, 29, 'El ticket T-2026-0029 cambió a estado \"Congelado\".', 0, '2026-10-16 01:40:29'),
(219, 33, 29, 'El ticket T-2026-0029 fue reactivado y se mantuvo tu asignación. Puedes iniciarlo cuando estés listo.', 0, '2026-10-16 01:40:34'),
(220, 5, 29, 'El ticket T-2026-0029 fue reactivado.', 0, '2026-10-16 01:40:34'),
(221, 5, 29, 'El ticket T-2026-0029 cambió a estado \"Congelado\".', 0, '2026-10-16 01:40:44'),
(222, 33, 29, 'El ticket T-2026-0029 fue reactivado y se mantuvo tu asignación. Puedes iniciarlo cuando estés listo.', 0, '2026-10-16 01:40:47'),
(223, 5, 29, 'El ticket T-2026-0029 fue reactivado.', 0, '2026-10-16 01:40:47'),
(224, 9, 20, 'El técnico ha comenzado a trabajar en tu ticket T-2026-0020.', 0, '2026-10-23 04:12:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expira` datetime NOT NULL,
  `usado` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`id`, `usuario_id`, `token`, `expira`, `usado`, `created_at`) VALUES
(7, 16, '7a1acb451621c81f3ec4ceb9a68d5ba88c2a9b53634b36f74ae0a7f4ad9e9e9c', '2026-09-23 18:57:28', 1, '2026-09-23 16:27:28'),
(8, 16, '3c9bf4fd399fe887ba855f78a9f810b263ee268f3cc097a37093639b8e9d04ad', '2026-09-23 21:59:06', 1, '2026-09-23 19:29:06'),
(9, 4, '702dcbb064aa632b371ce4cc72bd36ef1326d9848c397aec277d8b8612b45296', '2026-10-04 23:21:51', 1, '2026-10-04 20:51:51'),
(10, 4, '364573b7389a5d13353a9a61f89af24bbf9501fb881bdceeeebc8cdf15b4091d', '2026-10-09 18:34:25', 1, '2026-10-09 16:04:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pnf`
--

CREATE TABLE `pnf` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pnf`
--

INSERT INTO `pnf` (`id`, `nombre`, `codigo`, `descripcion`, `activo`, `created_at`) VALUES
(1, 'Informatica', 'PNF-01', 'Programa Nacional de Formación en Informática', 1, '2026-06-18 21:55:51'),
(2, 'Electrónica', 'PNF-02', 'Programa Nacional de Formación en Electrónica', 1, '2026-06-18 21:55:51'),
(3, 'Mecánica', 'PNF-03', 'Programa Nacional de Formación en Mecánica', 1, '2026-06-18 21:55:51'),
(6, 'Agroalimentación', 'PNF-05', NULL, 1, '2026-07-21 08:39:02'),
(7, 'Construcción Civil', 'PNF-06', NULL, 0, '2026-07-21 08:39:17'),
(8, 'Instrumentación y Contro', 'PNF-07', NULL, 1, '2026-07-21 08:39:36'),
(9, 'Procesos Químicos', 'PNF-08', NULL, 1, '2026-07-21 08:39:50'),
(10, 'Administración de Empresas', 'PNF-04', NULL, 1, '2026-07-21 08:40:14'),
(11, 'Contaduría Pública', 'PNF-09', NULL, 1, '2026-07-21 08:40:28'),
(12, 'Química', 'PNF-10', NULL, 1, '2026-07-21 08:40:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes_irreparables`
--

CREATE TABLE `reportes_irreparables` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `imagenes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`imagenes`)),
  `estado` enum('Pendiente','Aprobado','Rechazado','Congelado') DEFAULT 'Pendiente',
  `jefe_otic_id` int(11) DEFAULT NULL,
  `motivo_decision` text DEFAULT NULL,
  `fecha_decision` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes_irreparables`
--

INSERT INTO `reportes_irreparables` (`id`, `ticket_id`, `tecnico_id`, `motivo`, `imagenes`, `estado`, `jefe_otic_id`, `motivo_decision`, `fecha_decision`, `created_at`) VALUES
(1, 15, 6, 'Como coño le vas a poner windows 11 a una compu xp y menos de 512mb de ram', NULL, 'Rechazado', 4, 'Si se pude hacer morsh', '2026-09-19 13:15:13', '2026-09-19 00:34:54'),
(2, 15, 6, '123456789', NULL, 'Rechazado', 4, 'Ticket congelado. Motivo: Falta de materiales', '2026-09-19 13:18:39', '2026-09-19 17:17:31'),
(3, 15, 6, 'Esta y ya', NULL, 'Aprobado', 4, 'Poke si njd', '2026-09-19 13:20:55', '2026-09-19 17:20:11'),
(4, 7, 6, 'Prueba chat', NULL, 'Congelado', 4, 'Coñazo', '2026-09-19 13:34:08', '2026-09-19 17:32:36'),
(5, 22, 6, '123456789', NULL, 'Aprobado', 4, 'poke si', '2026-09-19 14:01:22', '2026-09-19 18:00:28'),
(6, 20, 6, '.', NULL, 'Congelado', 4, 'Despues se vera', '2026-09-21 11:03:09', '2026-09-19 18:08:52'),
(7, 21, 6, 'pipipi', '[\"uploads\\/tickets\\/21\\/1789859723_a9157f5e.png\"]', 'Rechazado', 4, '.', '2026-09-21 16:20:31', '2026-09-19 23:15:23'),
(8, 11, 6, 'Poke no', '[\"uploads\\/tickets\\/11\\/1790002717_ac6fa3a7.png\",\"uploads\\/tickets\\/11\\/1790002717_71aa5857.png\",\"uploads\\/tickets\\/11\\/1790002717_488702a9.png\"]', 'Rechazado', 4, 'Aun se puede solventar', '2026-09-21 11:00:36', '2026-09-21 14:58:37'),
(9, 11, 6, 'El problema persiste', NULL, 'Aprobado', 4, '.', '2026-09-21 11:02:52', '2026-09-21 15:02:07'),
(10, 16, 6, 'fg', NULL, 'Rechazado', 4, '.', '2026-09-21 16:57:13', '2026-09-21 15:38:16'),
(11, 19, 6, '.', NULL, 'Rechazado', 4, '.', '2026-09-21 16:41:20', '2026-09-21 20:40:51'),
(12, 16, 6, '.', '[\"uploads\\/tickets\\/16\\/1790024266_916f779d.png\"]', 'Aprobado', 4, 'El ticket no puede ser marcado como irreparable puesto que aun tiene solucion', '2026-10-10 10:31:22', '2026-09-21 20:57:46'),
(13, 18, 6, '.', '[\"uploads\\/tickets\\/18\\/1790024280_1e229bc3.png\",\"uploads\\/tickets\\/18\\/1790024280_e043c316.png\",\"uploads\\/tickets\\/18\\/1790024280_facea451.png\"]', 'Congelado', 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibu', '2026-10-06 19:10:25', '2026-09-21 20:58:00'),
(14, 19, 6, 'Falta de equipos para solucionar el caso', NULL, 'Congelado', 4, 'Por falta de equipos, el caso se pondrá en pausa por un tiempo para ser reanudado en la medida de lo posible una vez haya llegado el material', '2026-10-10 10:07:07', '2026-10-10 14:04:50'),
(15, 28, 6, 'No pues, ya no queda nada que hacer aca', NULL, 'Pendiente', NULL, NULL, NULL, '2026-10-10 14:38:23'),
(16, 28, 6, 'No pues, ya no queda nada que hacer aca', NULL, 'Aprobado', 4, 'No se puede solventar el caso por obsolescencia de los equipos', '2026-10-10 10:40:29', '2026-10-10 14:39:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_usuario`
--

CREATE TABLE `sub_usuario` (
  `id` int(11) NOT NULL,
  `coordinador_id` int(11) DEFAULT NULL,
  `pnf_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_sub_usuario` enum('PNF','OTIC') NOT NULL DEFAULT 'PNF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sub_usuario`
--

INSERT INTO `sub_usuario` (`id`, `coordinador_id`, `pnf_id`, `created_at`, `tipo_sub_usuario`) VALUES
(9, 5, 1, '2026-06-20 19:47:41', 'PNF'),
(21, NULL, NULL, '2026-09-23 14:04:59', 'OTIC'),
(31, 5, 1, '2026-10-06 19:26:16', 'PNF'),
(34, NULL, NULL, '2026-10-14 15:26:49', 'OTIC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `area_id`, `created_at`) VALUES
(6, 1, '2026-06-19 02:19:47'),
(33, 1, '2026-10-14 14:15:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `pnf_id` int(11) NOT NULL,
  `ubicacion` varchar(150) DEFAULT NULL,
  `prioridad` enum('Baja','Media','Alta') DEFAULT 'Media',
  `estado` enum('Pendiente','En_revision','Aprobado','Rechazado','Congelado','En_espera','En_proceso','Irreparable_Pendiente','por_reanudar','Solventado','Irreparable','Cerrado') DEFAULT 'Pendiente',
  `creador_id` int(11) NOT NULL,
  `es_sub_usuario` tinyint(1) DEFAULT 0,
  `aprobado_coordinador` tinyint(1) DEFAULT 0,
  `coordinador_aprobador_id` int(11) DEFAULT NULL,
  `jefe_otic_asignador_id` int(11) DEFAULT NULL,
  `tecnico_asignado_id` int(11) DEFAULT NULL,
  `fecha_asignacion` datetime DEFAULT NULL,
  `fecha_solucion` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `motivo_rechazo` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `codigo`, `titulo`, `descripcion`, `pnf_id`, `ubicacion`, `prioridad`, `estado`, `creador_id`, `es_sub_usuario`, `aprobado_coordinador`, `coordinador_aprobador_id`, `jefe_otic_asignador_id`, `tecnico_asignado_id`, `fecha_asignacion`, `fecha_solucion`, `fecha_cierre`, `motivo_rechazo`, `created_at`, `updated_at`) VALUES
(1, 'T-2026-0001', 'que te importa', 'se daño la impresora morsh', 1, NULL, 'Alta', 'Cerrado', 5, 0, 0, NULL, 4, 6, '2026-07-21 03:32:13', '2026-07-21 04:00:12', '2026-07-21 10:58:16', NULL, '2026-06-20 15:46:19', '2026-07-21 14:58:16'),
(2, 'T-2026-0002', 'que te importa', 'asdqweffdf', 1, NULL, 'Media', 'Cerrado', 5, 0, 0, NULL, 4, 6, '2026-07-21 17:48:22', '2026-07-21 17:54:58', '2026-07-21 17:55:32', NULL, '2026-06-20 15:55:10', '2026-07-21 21:55:32'),
(3, 'T-2026-0003', 'que te importa', '1234567890', 1, NULL, 'Alta', 'Cerrado', 9, 1, 1, 5, 4, 6, '2026-07-21 10:01:17', '2026-07-21 17:55:15', '2026-09-07 17:58:52', NULL, '2026-06-20 19:48:36', '2026-09-07 21:58:52'),
(4, 'T-2026-0004', 'Prueba RF-05 ubicacion', 'Descripcion de prueba con mas de diez caracteres.', 2, 'Laboratorio de Redes 3', 'Media', 'Solventado', 4, 0, 0, NULL, 4, 6, '2026-07-21 08:08:32', '2026-07-21 17:55:11', NULL, NULL, '2026-07-21 08:08:32', '2026-07-21 21:55:11'),
(5, 'T-2026-0005', 'Prueba', 'sadasfsfdgdsgdf.;!&quot;#', 1, 'Aula 02 de informática', 'Media', 'Irreparable', 4, 0, 0, NULL, 4, 6, '2026-09-03 02:05:35', NULL, NULL, NULL, '2026-09-03 00:05:35', '2026-09-17 15:59:55'),
(6, 'T-2026-0006', '*/-/*/-', '/*--*/-*/-', 1, '-/*-/*-', 'Alta', 'Irreparable', 9, 1, 1, 5, 4, 6, '2026-09-04 19:04:34', NULL, NULL, NULL, '2026-09-04 23:01:31', '2026-09-17 16:01:54'),
(7, 'T-2026-0007', 'Rechazar', 'asdsdffcvhg', 1, 'Aula 02 de informática', 'Alta', 'En_espera', 9, 1, 1, 5, 4, 6, '2026-09-29 14:43:56', NULL, NULL, NULL, '2026-09-07 22:09:40', '2026-09-29 18:43:56'),
(8, 'T-2026-0008', 'Prueba', 'vxvcbcvbvcn', 3, 'Aula 02 de informática', 'Media', 'Rechazado', 4, 0, 0, NULL, 4, 6, '2026-09-10 21:23:32', NULL, NULL, NULL, '2026-09-10 19:23:32', '2026-09-10 19:46:44'),
(9, 'T-2026-0009', 'Estados', 'asfdafsdfsdgg', 1, 'Aula 02 de informática', NULL, 'En_espera', 5, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-10 20:05:11', '2026-09-17 17:15:36'),
(10, 'T-2026-0010', 'Orden', 'xvfbfbfbnfgf', 1, '-/*-/*-', NULL, 'En_revision', 9, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-10 20:36:31', '2026-09-10 20:36:31'),
(11, 'T-2026-0011', 'Orden 2', 'Dsadasdafdfdgd', 1, '-/*-/*-', 'Alta', 'Irreparable', 9, 1, 1, 5, 4, 6, '2026-09-21 10:57:20', NULL, NULL, NULL, '2026-09-10 20:37:36', '2026-09-21 15:02:52'),
(12, 'T-2026-0012', 'Prueba 2', 'asdfghasdf', 1, 'asdasffds', NULL, 'En_revision', 9, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-10 20:51:37', '2026-09-10 20:51:37'),
(13, 'T-2026-0013', 'Prueba admin', 'asdfghjklñ', 1, 'nasod', 'Media', 'Solventado', 9, 1, 1, 5, 4, 6, '2026-09-17 11:55:50', '2026-09-17 11:59:35', NULL, NULL, '2026-09-11 22:51:59', '2026-09-17 15:59:35'),
(14, 'T-2026-0014', 'Prueba eliminar', '1234567890', 1, 'asdfg', NULL, 'En_revision', 9, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-11 22:55:42', '2026-09-11 22:55:42'),
(15, 'T-2026-0015', 'en espera', '1234567890', 1, 'aLas', 'Media', 'Irreparable', 5, 0, 0, NULL, 4, 6, '2026-09-19 13:19:46', NULL, NULL, NULL, '2026-09-17 16:03:11', '2026-09-19 17:20:55'),
(16, 'T-2026-0016', 'Sub10', '1234567890', 1, 'asdasd', 'Media', 'Irreparable', 9, 1, 1, 5, 4, 6, '2026-09-21 11:37:57', NULL, NULL, NULL, '2026-09-17 16:30:51', '2026-10-10 14:31:22'),
(17, 'T-2026-0017', 'coord1', '1234567890', 1, 'asd', 'Media', 'En_espera', 5, 0, 0, NULL, 4, 33, '2026-10-14 10:58:55', NULL, NULL, NULL, '2026-09-17 16:31:50', '2026-10-14 14:58:55'),
(18, 'T-2026-0018', 'Sub20', '1234567890', 1, 'asdf', 'Alta', 'En_espera', 9, 1, 1, 5, 4, 6, '2026-09-21 16:56:56', NULL, NULL, NULL, '2026-09-17 16:32:17', '2026-10-06 23:10:31'),
(19, 'T-2026-0019', 'Prueba', '1234567890', 1, 'Ocultos', 'Media', 'En_espera', 5, 0, 0, NULL, 4, 6, '2026-10-14 10:58:37', NULL, NULL, NULL, '2026-09-17 21:23:58', '2026-10-14 14:58:37'),
(20, 'T-2026-0020', 'Prueba', '1234567890', 1, 'Aula 02 de informática', 'Media', 'En_proceso', 9, 1, 1, 5, 4, 6, '2026-09-19 14:08:33', NULL, NULL, NULL, '2026-09-18 17:38:48', '2026-10-23 04:12:03'),
(21, 'T-2026-0021', 'Prueba', 'asdfghkjlq', 1, 'Aula 02 de informática', 'Media', 'Solventado', 5, 0, 0, NULL, 4, 6, '2026-09-19 18:25:57', '2026-09-21 16:23:48', NULL, NULL, '2026-09-18 17:39:22', '2026-09-21 20:23:48'),
(22, 'T-2026-0022', 'Prueba', '1234567890', 1, 'Aula 02 de informática', 'Media', 'Irreparable', 5, 0, 0, NULL, 4, 6, '2026-09-19 13:59:59', NULL, NULL, NULL, '2026-09-18 17:40:16', '2026-09-19 18:01:22'),
(23, 'T-2026-0023', 'Prueba12', 'asdfghjbdfdhyjytjtyj', 1, 'Aula 02 de informática', 'Baja', 'Solventado', 5, 0, 0, NULL, 4, 6, '2026-10-09 12:02:52', '2026-10-09 12:24:33', NULL, NULL, '2026-09-29 18:08:01', '2026-10-09 16:24:33'),
(24, 'T-2026-0024', 'Prueba rutas', 'sfregrehtrjytkuyk', 1, 'Aula 02 de informática', 'Media', 'Solventado', 4, 0, 0, NULL, 4, 6, '2026-10-09 17:47:51', '2026-10-09 12:24:16', NULL, NULL, '2026-10-09 15:47:51', '2026-10-09 16:24:16'),
(25, 'T-2026-0025', 'Computadoras descompuestas', '3 de los equipos dejaron de funcionar hoy en la mañana', 1, 'Laboratorio 02 de informatica', 'Media', 'Cerrado', 9, 1, 1, 5, 4, 6, '2026-10-10 10:03:40', '2026-10-10 10:05:10', '2026-10-10 10:05:55', NULL, '2026-10-10 14:02:37', '2026-10-10 14:05:55'),
(26, 'T-2026-0026', 'Fallo en las computadoras', 'Las computadoras no encienden', 1, 'Laboratorio 02 de informatica', NULL, 'En_revision', 9, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-10 14:27:16', '2026-10-10 14:27:16'),
(27, 'T-2026-0027', 'Equipos descompuestos', 'Las computadoras no encienden desde la mañana', 1, 'LC 02-Area de informatica', 'Alta', 'Cerrado', 9, 1, 1, 5, 4, 6, '2026-10-10 10:29:29', '2026-10-10 10:30:04', '2026-10-10 10:30:33', NULL, '2026-10-10 14:28:45', '2026-10-10 14:30:33'),
(28, 'T-2026-0028', 'Prueba', 'Epa Leonard', 1, 'Aula 02 de informática', 'Media', 'Irreparable', 9, 1, 1, 5, 4, 6, '2026-10-10 10:37:48', NULL, NULL, NULL, '2026-10-10 14:36:43', '2026-10-10 14:40:29'),
(29, 'T-2026-0029', 'que te importa', 'dsfsdfsdgsdgdhgjkuk', 1, 'asdfdsfdsggsdg', 'Baja', 'En_espera', 5, 0, 0, NULL, 34, 33, '2026-10-15 21:18:45', NULL, NULL, NULL, '2026-10-16 01:05:55', '2026-10-16 01:40:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_tecnicos`
--

CREATE TABLE `ticket_tecnicos` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `es_principal` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket_tecnicos`
--

INSERT INTO `ticket_tecnicos` (`id`, `ticket_id`, `tecnico_id`, `es_principal`, `created_at`) VALUES
(1, 1, 6, 1, '2026-10-09 16:46:44'),
(2, 2, 6, 1, '2026-10-09 16:46:44'),
(3, 3, 6, 1, '2026-10-09 16:46:44'),
(4, 4, 6, 1, '2026-10-09 16:46:44'),
(5, 5, 6, 1, '2026-10-09 16:46:44'),
(6, 6, 6, 1, '2026-10-09 16:46:44'),
(7, 7, 6, 1, '2026-10-09 16:46:44'),
(8, 8, 6, 1, '2026-10-09 16:46:44'),
(9, 11, 6, 1, '2026-10-09 16:46:44'),
(10, 13, 6, 1, '2026-10-09 16:46:44'),
(11, 15, 6, 1, '2026-10-09 16:46:44'),
(12, 16, 6, 1, '2026-10-09 16:46:44'),
(13, 18, 6, 1, '2026-10-09 16:46:44'),
(15, 20, 6, 1, '2026-10-09 16:46:44'),
(16, 21, 6, 1, '2026-10-09 16:46:44'),
(17, 22, 6, 1, '2026-10-09 16:46:44'),
(18, 23, 6, 1, '2026-10-09 16:46:44'),
(19, 24, 6, 1, '2026-10-09 16:46:44'),
(34, 19, 6, 1, '2026-10-14 14:58:37'),
(35, 19, 33, 0, '2026-10-14 14:58:37'),
(36, 17, 33, 1, '2026-10-14 14:58:55'),
(37, 29, 33, 1, '2026-10-16 01:18:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `tipo_cedula` enum('V','E') NOT NULL DEFAULT 'V',
  `cedula` varchar(20) NOT NULL,
  `sexo` enum('M','F','Otro') NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `foto_perfil` varchar(255) DEFAULT 'default.jpg',
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `totp_secret` varchar(255) DEFAULT NULL,
  `totp_habilitado` tinyint(1) NOT NULL DEFAULT 0,
  `rol` enum('Coordinador','Jefe_OTIC','Tecnico','Sub_usuario') NOT NULL,
  `estado_usuario` enum('Activo','Inactivo','Vacaciones','Reposo') DEFAULT 'Activo',
  `fecha_inicio_inactivo` datetime DEFAULT NULL,
  `fecha_fin_inactivo` datetime DEFAULT NULL,
  `motivo_inactivo` varchar(255) DEFAULT NULL,
  `intentos_fallidos` int(11) DEFAULT 0,
  `bloqueado_hasta` datetime DEFAULT NULL,
  `bloqueo_critico` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_bloqueo_critico` datetime DEFAULT NULL,
  `fecha_desbloqueo` datetime DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `tipo_cedula`, `cedula`, `sexo`, `email`, `telefono`, `fecha_nacimiento`, `foto_perfil`, `username`, `password_hash`, `totp_secret`, `totp_habilitado`, `rol`, `estado_usuario`, `fecha_inicio_inactivo`, `fecha_fin_inactivo`, `motivo_inactivo`, `intentos_fallidos`, `bloqueado_hasta`, `bloqueo_critico`, `fecha_bloqueo_critico`, `fecha_desbloqueo`, `ultimo_login`, `created_at`, `updated_at`) VALUES
(4, 'Admin', 'Super', 'Sistema', 'OTIC', 'V', '00000000', 'M', 'imarru120902@gmail.com', '0412-0000000', '1990-01-01', 'default.jpg', 'admin', '$2y$10$SoeO2c8Xlx8xsgN.Myyomep/BkFlBmEwo5M0ThhLmPPqkEDzlwADi', '9IwWYD0KRhE1TDMmla/ajX5JSaG3bes50VGR5AxpoR6X0BPOoIgmxQve8hV52gi5fz/HfLtZOeoV8IsSOxtPRw==', 1, 'Jefe_OTIC', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-06-19 00:21:24', '2026-10-09 16:05:33'),
(5, 'Rafael', 'Antonio', 'Rodriguez', 'Rosillo', 'V', '30987032', 'M', 'hendrykmr4@gmail.com', '04246257872', '2004-06-10', 'default.jpg', 'coordinador', '$2y$10$YIgLhdnwbpiomIqYjKif.Oj5FMM9a5M/WnT8aLvoPQycr2CYubSTK', NULL, 0, 'Coordinador', 'Activo', NULL, NULL, NULL, 0, NULL, 0, '2026-09-28 18:04:19', '2026-09-28 18:11:56', NULL, '2026-06-19 01:53:07', '2026-09-28 22:11:56'),
(6, 'Oliver', 'Agapito', 'Montilva', 'Colina', 'V', '1234567', 'F', 'nasid@gmail.com', '04241257871', '2004-06-10', 'default.jpg', 'tecnico', '$2y$10$3HqlqXw0QWIcm3DDM2KFIurPaLk9AL6R8gIHEc76GcSefkOJI1o/y', NULL, 0, 'Tecnico', 'Vacaciones', '2026-10-25 00:00:00', '2026-10-30 00:00:00', 'Prueba futura', 0, NULL, 0, '2026-10-09 11:54:00', '2026-10-09 11:54:33', NULL, '2026-06-19 02:19:47', '2026-10-20 15:12:31'),
(9, 'Acho', 'Quej */', 'Voj', 'Tajloco', 'V', '01234567', 'M', 'hendrykjm22@hotmail.com', '04126421877', '2004-06-22', 'default.jpg', 'sub usuario', '$2y$10$9KpsS5.e1muafHg76Byjv.mG7Paoor1sjtRNCspu.26Bu/uOiBvvK', NULL, 0, 'Sub_usuario', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-06-20 19:47:41', '2026-10-10 14:21:43'),
(16, 'hp', 'asd', 'asfd', 'sdfsdgfg', 'V', '12345678', 'F', 'imarru120902@gmail.co', '04246257873', '1999-05-10', 'default.jpg', 'Juan lucas', '$2y$10$3Didr1B7jo4FweOghbm3IehjfrIJuGyT6P9QhqGSjHBUuQRNesGQ.', NULL, 0, 'Sub_usuario', 'Activo', NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, '2026-09-21 17:00:37', '2026-09-28 20:59:03'),
(19, '123', 'Yocceline', 'Voj', 'Rosillo', 'V', '128540521', 'F', 'rosilloyocceline@gmail.com', '04246784519', '1977-03-01', 'default.jpg', 'Borrar', '$2y$10$BCJ6yT5dA.Gs.mbSfID6X.ahdLelslCANsnSF8EPZQM7maI/WnjHS', NULL, 0, 'Jefe_OTIC', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-09-23 14:03:24', '2026-09-23 14:05:52'),
(21, 'prueba cedula', 'ADs', 'fdssdg', 'fasgfh', 'V', '128540522', 'M', 'Comamonda@gmail.com', '0424984632', '1953-09-12', 'default.jpg', 'prueba', '$2y$10$WspobJ6GTv0oVwASZNbBd.SOOIKi.PIWZlNGTwP10hoqbRq.G0UuC', NULL, 0, 'Sub_usuario', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-09-23 14:04:59', '2026-10-20 15:11:31'),
(31, 'juana', 'juan', 'juan', 'juan', 'V', '123456789', 'F', 'asdsa@gms.com', '04154688523', '2003-02-10', 'default.jpg', 'juan', '$2y$10$YVO2YgNIQZC2OOTp6ZSAk.fpnCte28/kxoxepfacX.XezQvaNiBiG', NULL, 0, 'Sub_usuario', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-10-06 19:26:16', '2026-10-09 15:50:03'),
(32, 'hp', 'Yocceline', 'asdsaf', 'Rosillo', 'V', '30987021', 'M', 'rosilloyocline@gmail.com', '', '2004-06-10', 'default.jpg', 'asdfasffdgdfh', '$2y$10$uEN6sg2zCYaKhm2cVvSIl.T0rONfxrMgO/6tO2zzag6waI5.Wvley', NULL, 0, 'Coordinador', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-10-09 15:53:10', '2026-10-09 15:53:10'),
(33, 'Tecnico', 'dos', 'prueba', 'multiple', 'V', '25147812', 'M', 'amsiofnf@gmail.com', '04125489632', '2003-05-05', 'default.jpg', 'Tecnico2', '$2y$10$Rlzg3oxoqLaldJ0FTE09weEkN0rXL3x.SWHgnUSBZ5OPcx62Jkhoi', NULL, 0, 'Tecnico', 'Activo', NULL, NULL, 'poke si', 0, NULL, 0, NULL, NULL, NULL, '2026-10-14 14:15:23', '2026-10-17 16:13:08'),
(34, 'Sub', 'otic', 'prueba', 'funcionamiento', 'V', '98765432', 'F', 'subotic@gmail.com', '04162587413', '2001-01-11', 'default.jpg', 'sub_otic', '$2y$10$16ME2P1bw24sqcrN/.6iNeMKLY8PSY6SL/FG8afiPgfYkbl91xgk2', NULL, 0, 'Sub_usuario', 'Activo', NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2026-10-14 15:26:49', '2026-10-14 15:26:49');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `2fa_trusted_devices`
--
ALTER TABLE `2fa_trusted_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_token` (`token_hash`),
  ADD KEY `idx_usuario` (`usuario_id`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_fecha` (`created_at`),
  ADD KEY `idx_accion` (`accion`),
  ADD KEY `idx_tabla` (`tabla_afectada`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_ticket` (`ticket_id`);

--
-- Indices de la tabla `codigos_verificacion`
--
ALTER TABLE `codigos_verificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario_accion` (`usuario_id`,`accion`),
  ADD KEY `idx_expira` (`expira`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_ticket` (`ticket_id`);

--
-- Indices de la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pnf_id` (`pnf_id`);

--
-- Indices de la tabla `estadisticas_tecnicos`
--
ALTER TABLE `estadisticas_tecnicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_semana_tecnico` (`tecnico_id`,`semana`),
  ADD KEY `idx_semana` (`semana`),
  ADD KEY `idx_estado_semana` (`estado_semana`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_leida` (`leida`),
  ADD KEY `notificaciones_ibfk_2` (`ticket_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_usuario` (`usuario_id`);

--
-- Indices de la tabla `pnf`
--
ALTER TABLE `pnf`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `reportes_irreparables`
--
ALTER TABLE `reportes_irreparables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tecnico_id` (`tecnico_id`),
  ADD KEY `jefe_otic_id` (`jefe_otic_id`),
  ADD KEY `idx_ticket` (`ticket_id`),
  ADD KEY `idx_estado` (`estado`);

--
-- Indices de la tabla `sub_usuario`
--
ALTER TABLE `sub_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coordinador_id` (`coordinador_id`),
  ADD KEY `pnf_id` (`pnf_id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `pnf_id` (`pnf_id`),
  ADD KEY `coordinador_aprobador_id` (`coordinador_aprobador_id`),
  ADD KEY `jefe_otic_asignador_id` (`jefe_otic_asignador_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_prioridad` (`prioridad`),
  ADD KEY `idx_creador` (`creador_id`),
  ADD KEY `idx_tecnico` (`tecnico_asignado_id`),
  ADD KEY `idx_codigo` (`codigo`);

--
-- Indices de la tabla `ticket_tecnicos`
--
ALTER TABLE `ticket_tecnicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ticket_tecnico` (`ticket_id`,`tecnico_id`),
  ADD KEY `idx_ticket` (`ticket_id`),
  ADD KEY `idx_tecnico` (`tecnico_id`),
  ADD KEY `idx_principal` (`es_principal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `unique_cedula` (`tipo_cedula`,`cedula`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_estado_usuario` (`estado_usuario`),
  ADD KEY `idx_rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `2fa_trusted_devices`
--
ALTER TABLE `2fa_trusted_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `codigos_verificacion`
--
ALTER TABLE `codigos_verificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `estadisticas_tecnicos`
--
ALTER TABLE `estadisticas_tecnicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pnf`
--
ALTER TABLE `pnf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reportes_irreparables`
--
ALTER TABLE `reportes_irreparables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `ticket_tecnicos`
--
ALTER TABLE `ticket_tecnicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `2fa_trusted_devices`
--
ALTER TABLE `2fa_trusted_devices`
  ADD CONSTRAINT `2fa_trusted_devices_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `codigos_verificacion`
--
ALTER TABLE `codigos_verificacion`
  ADD CONSTRAINT `codigos_verificacion_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD CONSTRAINT `coordinador_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coordinador_ibfk_2` FOREIGN KEY (`pnf_id`) REFERENCES `pnf` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `estadisticas_tecnicos`
--
ALTER TABLE `estadisticas_tecnicos`
  ADD CONSTRAINT `estadisticas_tecnicos_ibfk_1` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reportes_irreparables`
--
ALTER TABLE `reportes_irreparables`
  ADD CONSTRAINT `reportes_irreparables_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reportes_irreparables_ibfk_2` FOREIGN KEY (`tecnico_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `reportes_irreparables_ibfk_3` FOREIGN KEY (`jefe_otic_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `sub_usuario`
--
ALTER TABLE `sub_usuario`
  ADD CONSTRAINT `sub_usuario_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_usuario_ibfk_2` FOREIGN KEY (`coordinador_id`) REFERENCES `coordinador` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_usuario_ibfk_3` FOREIGN KEY (`pnf_id`) REFERENCES `pnf` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tecnico_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`pnf_id`) REFERENCES `pnf` (`id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`coordinador_aprobador_id`) REFERENCES `coordinador` (`id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`jefe_otic_asignador_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`tecnico_asignado_id`) REFERENCES `tecnico` (`id`);

--
-- Filtros para la tabla `ticket_tecnicos`
--
ALTER TABLE `ticket_tecnicos`
  ADD CONSTRAINT `ticket_tecnicos_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_tecnicos_ibfk_2` FOREIGN KEY (`tecnico_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
