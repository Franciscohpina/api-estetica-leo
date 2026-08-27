-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para estetica_db
CREATE DATABASE IF NOT EXISTS `estetica_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estetica_db`;

-- Volcando estructura para tabla estetica_db.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `hora_fin` time DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `cliente_tel` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estilista_id` int DEFAULT NULL,
  `servicio_id` int DEFAULT NULL,
  `origen_id` int DEFAULT NULL,
  `notas` text COLLATE utf8mb4_general_ci,
  `anticipo` decimal(10,2) DEFAULT '0.00',
  `estatus_pago` enum('Pendiente','Pagado') COLLATE utf8mb4_general_ci DEFAULT 'Pendiente',
  `estatus_cita` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'Agendada',
  `referencia_pago` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `estilista_id` (`estilista_id`),
  KEY `servicio_id` (`servicio_id`),
  KEY `fecha` (`fecha`,`hora`),
  KEY `cliente_tel` (`cliente_tel`),
  KEY `origen_id` (`origen_id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`estilista_id`) REFERENCES `estilistas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `agenda_ibfk_3` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `agenda_ibfk_4` FOREIGN KEY (`origen_id`) REFERENCES `pivote` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `agenda_ibfk_5` FOREIGN KEY (`estado_id`) REFERENCES `pivote` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.agenda: ~50 rows (aproximadamente)
INSERT INTO `agenda` (`id`, `fecha`, `hora`, `hora_fin`, `cliente_id`, `cliente_tel`, `estilista_id`, `servicio_id`, `origen_id`, `notas`, `anticipo`, `estatus_pago`, `estatus_cita`, `referencia_pago`, `estado_id`, `created_at`, `updated_at`) VALUES
	(2, '2026-02-19', '10:00:00', '11:00:00', 1, NULL, 1, 1, NULL, 'Viene por un corte y tinte raíz', 200.00, 'Pagado', 'Cancelada', 'TRANSF-9988', 1, '2026-02-19 16:29:26', '2026-04-03 18:42:17'),
	(3, '2026-02-19', '10:00:00', '11:00:00', 1, NULL, 1, 1, NULL, 'Viene por un corte y tinte raíz', 200.00, 'Pagado', 'No vino', 'TRANSF-9988', 1, '2026-02-19 16:30:09', '2026-04-03 18:42:17'),
	(4, '2026-02-19', '10:00:00', '11:00:00', 1, NULL, 1, 1, NULL, 'Viene por un corte y tinte raíz', 200.00, 'Pagado', 'Agendada', 'TRANSF-9988', 1, '2026-02-19 16:32:49', '2026-04-03 18:42:17'),
	(5, '2026-02-24', '10:00:00', '11:00:00', 7, NULL, 2, 3, NULL, 'tinte', 0.00, 'Pagado', 'Agendada', '12345', 1, '2026-02-24 19:02:33', '2026-04-03 18:42:17'),
	(6, '2026-02-25', '13:00:00', '14:00:00', 11, NULL, 2, 1, NULL, 'prueba1 ', 500.00, 'Pendiente', 'Agendada', '', 1, '2026-02-24 23:01:52', '2026-04-03 18:42:17'),
	(7, '2026-02-26', '17:00:00', '18:00:00', 8, NULL, 1, 1, NULL, 'matizado', 300.00, 'Pendiente', 'Agendada', NULL, 1, '2026-02-24 23:13:28', '2026-04-03 18:42:17'),
	(8, '2026-03-04', '09:00:00', '10:00:00', 16, NULL, 1, 1, NULL, 'Cita de prueba numerito 1', 200.00, 'Pagado', 'No vino', '12345', 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(9, '2026-03-18', '13:00:00', '14:00:00', 6, NULL, 1, 1, NULL, 'Cita de prueba numerito 2', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(10, '2026-03-10', '10:00:00', '11:00:00', 13, NULL, 1, 1, NULL, 'Cita de prueba numerito 3', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(11, '2026-03-08', '11:00:00', '12:00:00', 14, NULL, 1, 1, NULL, 'Cita de prueba numerito 4', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(12, '2026-03-03', '09:00:00', '10:00:00', 2, NULL, 1, 1, NULL, 'Cita de prueba numerito 5', 200.00, 'Pendiente', 'No vino', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(13, '2026-03-27', '15:00:00', '16:00:00', 10, NULL, 2, 1, NULL, 'Cita de prueba numerito 6', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(14, '2026-03-03', '13:00:00', '14:00:00', 4, NULL, 1, 1, NULL, 'Cita de prueba numerito 7', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(15, '2026-03-26', '16:00:00', '17:00:00', 2, NULL, 1, 1, NULL, 'Cita de prueba numerito 8', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(16, '2026-03-17', '14:00:00', '15:00:00', 5, NULL, 2, 1, NULL, 'Cita de prueba numerito 9', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(17, '2026-03-29', '18:00:00', '19:00:00', 2, NULL, 1, 1, NULL, 'Cita de prueba numerito 10', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(18, '2026-03-03', '09:00:00', '10:00:00', 17, NULL, 2, 1, NULL, 'Cita de prueba numerito 11', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(19, '2026-03-06', '10:00:00', '11:00:00', 2, NULL, 1, 1, NULL, 'Cita de prueba numerito 12', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(20, '2026-03-29', '13:00:00', '14:00:00', 13, NULL, 1, 1, NULL, 'Cita de prueba numerito 13', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(21, '2026-03-08', '09:00:00', '10:00:00', 5, NULL, 1, 1, NULL, 'Cita de prueba numerito 14', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(22, '2026-03-04', '13:00:00', '14:00:00', 13, NULL, 2, 1, NULL, 'Cita de prueba numerito 15', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(23, '2026-03-14', '14:00:00', '15:00:00', 5, NULL, 2, 1, NULL, 'Cita de prueba numerito 16', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(24, '2026-03-11', '10:00:00', '11:00:00', 17, NULL, 1, 1, NULL, 'Cita de prueba numerito 17', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(25, '2026-03-06', '11:00:00', '12:00:00', 15, NULL, 1, 1, NULL, 'Cita de prueba numerito 18', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(26, '2026-03-20', '16:00:00', '17:00:00', 2, NULL, 2, 1, NULL, 'Cita de prueba numerito 19', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(27, '2026-03-23', '15:00:00', '16:00:00', 16, NULL, 2, 1, NULL, 'Cita de prueba numerito 20', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(28, '2026-03-11', '10:00:00', '11:00:00', 16, NULL, 1, 1, NULL, 'Cita de prueba numerito 21', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(29, '2026-03-16', '11:00:00', '12:00:00', 1, NULL, 1, 1, NULL, 'Cita de prueba numerito 22', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(30, '2026-03-02', '14:00:00', '15:00:00', 11, NULL, 1, 1, NULL, 'Cita de prueba numerito 23', 200.00, 'Pendiente', 'No vino', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(31, '2026-03-07', '17:00:00', '18:00:00', 12, NULL, 2, 1, NULL, 'Cita de prueba numerito 24', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(32, '2026-03-23', '13:00:00', '14:00:00', 16, NULL, 1, 1, NULL, 'Cita de prueba numerito 25', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(33, '2026-03-21', '14:00:00', '15:00:00', 10, NULL, 1, 1, NULL, 'Cita de prueba numerito 26', 200.00, 'Pendiente', 'Cancelada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(34, '2026-03-21', '14:00:00', '15:00:00', 10, NULL, 1, 1, NULL, 'Cita de prueba numerito 27', 200.00, 'Pendiente', 'Cancelada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(35, '2026-03-13', '13:00:00', '14:00:00', 1, NULL, 2, 1, NULL, 'Cita de prueba numerito 28', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(36, '2026-03-11', '16:00:00', '17:00:00', 12, NULL, 1, 1, NULL, 'Cita de prueba numerito 29', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(37, '2026-03-23', '10:00:00', '11:00:00', 7, NULL, 2, 1, NULL, 'Cita de prueba numerito 30', 200.00, 'Pendiente', 'No vino', NULL, 1, '2026-03-03 21:05:13', '2026-04-03 18:42:17'),
	(38, '2026-03-21', '14:00:00', '15:00:00', 2, NULL, 1, 1, NULL, 'prueba horario', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-03-21 20:55:13', '2026-04-03 18:42:17'),
	(39, '2026-04-01', '09:00:00', '10:00:00', 1, NULL, 1, 1, NULL, 'Corte de caballero', 50.00, 'Pagado', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(40, '2026-04-01', '11:30:00', '13:00:00', 2, NULL, 2, 2, NULL, 'Tinte y secado', 100.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(41, '2026-04-02', '10:00:00', '11:00:00', 3, NULL, 2, 1, NULL, 'Barba y bigote', 0.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(42, '2026-04-03', '15:00:00', '16:30:00', 4, NULL, 1, 3, NULL, 'Manicure', 80.00, 'Pagado', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(43, '2026-04-04', '12:00:00', '13:30:00', 5, NULL, 2, 1, NULL, 'Corte de dama', 0.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(44, '2026-04-05', '16:00:00', '18:00:00', 6, NULL, 1, 2, NULL, 'Balayage', 200.00, 'Pagado', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(45, '2026-04-06', '09:30:00', '10:30:00', 7, NULL, 1, 1, NULL, 'Retoque de corte', 0.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(46, '2026-04-08', '14:00:00', '15:30:00', 8, NULL, 2, 3, NULL, 'Pedicure', 50.00, 'Pagado', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(47, '2026-04-09', '11:00:00', '12:00:00', 9, NULL, 2, 1, NULL, 'Corte infantil', 0.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(48, '2026-04-10', '17:00:00', '19:00:00', 10, NULL, 1, 2, NULL, 'Keratina profesional', 150.00, 'Pagado', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(49, '2026-04-12', '10:00:00', '11:30:00', 11, NULL, 2, 1, NULL, 'Peinado evento', 100.00, 'Pagado', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(50, '2026-04-14', '13:00:00', '14:00:00', 12, NULL, 1, 3, NULL, 'Limpieza facial', 0.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:49:45', '2026-04-03 18:49:45'),
	(51, '2026-04-03', '15:00:00', '16:00:00', 14, NULL, 1, 1, NULL, 'prueba ', 100.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:51:21', '2026-04-03 18:51:21'),
	(52, '2026-04-03', '16:00:00', '16:30:00', 15, NULL, 1, 1, NULL, 'prueba para ver empalme de citas ', 200.00, 'Pendiente', 'Agendada', NULL, 1, '2026-04-03 18:59:23', '2026-04-03 18:59:23');

-- Volcando estructura para tabla estetica_db.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `domicilio` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `facebook` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_permisos` int DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_clientes_tel` (`tel`),
  KEY `id_permisos` (`id_permisos`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_permisos`) REFERENCES `permisos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.clientes: ~16 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nombre`, `domicilio`, `ciudad`, `cp`, `fecha_nac`, `fecha_reg`, `tel`, `instagram`, `facebook`, `id_permisos`, `estatus`, `created_at`, `updated_at`) VALUES
	(1, 'Leonardo Yael Barrera Montero', 'Av Independencia 107, Col Centro', 'Zapopan', '44223', '2004-03-14', '2025-11-18', '5522148117', '@yaelbarrera64', 'yaelbarrera64', NULL, 1, '2025-11-19 03:04:55', '2025-11-19 03:04:55'),
	(2, 'Fernanda Rayo', NULL, 'Guadalajara', NULL, '2004-07-16', '2025-11-20', '3398765432', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-26 23:47:29'),
	(3, 'Laura Sánchez', NULL, 'Zapopan', NULL, NULL, '2025-11-20', '3322222222', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(4, 'Carmen López', NULL, 'Tlaquepaque', NULL, NULL, '2025-11-20', '3333333333', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(5, 'Isabel Gómez', NULL, 'Tonalá', NULL, NULL, '2025-11-20', '3344444444', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(6, 'Patricia Díaz', NULL, 'Guadalajara', NULL, NULL, '2025-11-20', '3355555555', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(7, 'Rosa Hernández', NULL, 'Zapopan', NULL, NULL, '2025-11-20', '3366666666', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(8, 'Teresa Rodríguez', NULL, 'Tlaquepaque', NULL, NULL, '2025-11-20', '3377777777', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(9, 'Lucía Fernández', NULL, 'Tonalá', NULL, NULL, '2025-11-20', '3388888888', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(10, 'Marta Pérez', NULL, 'Guadalajara', NULL, NULL, '2025-11-20', '3399999999', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(11, 'Elena García', NULL, 'Zapopan', NULL, NULL, '2025-11-20', '3300000000', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(12, 'Sofía Ruiz', NULL, 'Tlaquepaque', NULL, NULL, '2025-11-20', '3311112222', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(13, 'Julia Torres', NULL, 'Tonalá', NULL, NULL, '2025-11-20', '3322223333', NULL, NULL, NULL, 1, '2025-11-20 21:22:55', '2025-11-20 21:22:55'),
	(14, 'Franco pinia', NULL, NULL, NULL, '1899-01-01', '2026-02-24', '1234567890', NULL, NULL, NULL, 1, '2026-02-25 01:16:32', '2026-02-25 01:16:32'),
	(15, 'Javier Coria', NULL, NULL, NULL, '2003-01-01', '2026-02-24', '3312345678', NULL, NULL, NULL, 1, '2026-02-25 01:17:14', '2026-02-25 01:17:14'),
	(16, 'Maria Rodriguez ', NULL, NULL, NULL, '1950-01-01', '2026-02-24', '6641209338', NULL, NULL, NULL, 1, '2026-02-25 01:22:47', '2026-02-25 01:22:47'),
	(17, 'Maria Ramona ', NULL, NULL, NULL, '1982-08-01', '2026-02-24', '3312093847', NULL, NULL, NULL, 1, '2026-02-25 01:23:16', '2026-02-25 01:23:16');

-- Volcando estructura para tabla estetica_db.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `color_nat` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `porc_canas` decimal(5,2) DEFAULT NULL,
  `textura` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `colorimetrista` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estructura` text COLLATE utf8mb4_general_ci,
  `form_decol` text COLLATE utf8mb4_general_ci,
  `pose_decol_largos` int DEFAULT NULL,
  `pose_decol_raiz` int DEFAULT NULL,
  `form_tinte` text COLLATE utf8mb4_general_ci,
  `pose_tinte_largos` int DEFAULT NULL,
  `pose_tinte_raiz` int DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_general_ci,
  `fecha_foto1` datetime DEFAULT NULL,
  `foto1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_foto2` datetime DEFAULT NULL,
  `foto2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.estado: ~3 rows (aproximadamente)
INSERT INTO `estado` (`id`, `cliente_id`, `color_nat`, `porc_canas`, `textura`, `colorimetrista`, `estructura`, `form_decol`, `pose_decol_largos`, `pose_decol_raiz`, `form_tinte`, `pose_tinte_largos`, `pose_tinte_raiz`, `observaciones`, `fecha_foto1`, `foto1`, `fecha_foto2`, `foto2`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Castaño', 3.00, 'Lacio', 'Estilista', '*Estructura detallada*', '*Formula detallada*', 5, 10, '*Formula detallada', 8, 4, '*Anotaciones extra*', '2025-12-01 13:15:12', 'cliente_1_1764616511999-12489852_foto1.jpeg', '2025-11-26 18:11:56', 'cliente_1_1764202316244-410773500_foto2.jpg', '2025-11-19 03:24:10', '2025-12-01 19:15:12'),
	(2, 2, 'Castaño', 4.00, 'Lacio', 'Estilista', 'Largo lacio hasta la cadera', 'Formula decolorante utilizada 54x67', 20, 15, 'Formula Tinte utilizada 67x85', 10, 10, 'Lavado cada 3er dia', '2025-12-01 13:47:04', 'cliente_2_1764618424599-337759531_foto1.jpg', '2025-12-01 13:04:53', 'cliente_2_1764615893358-94220810_foto2.jpg', '2025-11-26 23:49:22', '2025-12-01 19:47:04'),
	(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-01 13:47:21', 'cliente_3_1764618441368-799581838_foto1.webp', '2025-12-01 13:47:21', 'cliente_3_1764618441368-904984175_foto2.webp', '2025-12-01 19:47:21', '2025-12-01 19:47:21');

-- Volcando estructura para tabla estetica_db.estilistas
CREATE TABLE IF NOT EXISTS `estilistas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `cel` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nota` text COLLATE utf8mb4_general_ci,
  `num_extra` int DEFAULT NULL,
  `tipo_id` int DEFAULT NULL,
  `pass_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_permisos` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tipo_id` (`tipo_id`),
  KEY `id_permisos` (`id_permisos`),
  KEY `cel` (`cel`),
  CONSTRAINT `estilistas_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `pivote` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `estilistas_ibfk_2` FOREIGN KEY (`id_permisos`) REFERENCES `permisos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.estilistas: ~3 rows (aproximadamente)
INSERT INTO `estilistas` (`id`, `nombre`, `cel`, `nota`, `num_extra`, `tipo_id`, `pass_hash`, `id_permisos`, `created_at`, `updated_at`) VALUES
	(1, 'Jesus', '3341234567', NULL, NULL, NULL, '$2b$10$gXBO2Pst1V4rudfnMEgDxutfSMx7CpZmwJMGRDIt0awirSeL5wkXa', NULL, '2026-02-18 16:15:30', '2026-03-22 19:49:44'),
	(2, 'Mariana', '3367654321', NULL, NULL, NULL, '$2b$10$GLIFhpCL75PDaw/caJ3MSOiMH636zdhgD23mTOKbXnpC.udV4AVUa', NULL, '2026-02-18 16:15:30', '2026-03-22 19:58:00'),
	(3, 'Administrador', '3315229718', NULL, NULL, NULL, '$2b$10$hL/gPax9ikDl6.8SGlPBWuOr7HgStN55AvUxNTemOe7EgwVk.V0f2', NULL, '2026-03-21 23:17:03', '2026-03-22 19:50:34');

-- Volcando estructura para tabla estetica_db.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permisos` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0,0,0,0,0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.permisos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla estetica_db.pivote
CREATE TABLE IF NOT EXISTS `pivote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`,`activo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.pivote: ~15 rows (aproximadamente)
INSERT INTO `pivote` (`id`, `tipo`, `clave`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
	(1, 'A', 'RED', 'Redes Sociales', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(2, 'A', 'WAPP', 'WhatsApp', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(3, 'A', 'TEL', 'Teléfono', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(4, 'A', 'FIS', 'Física', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(5, 'A', 'REF', 'Referido', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(6, 'A', 'WEB', 'Sitio Web', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(7, 'E', 'EST', 'Estilista', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(8, 'E', 'AST', 'Asistente', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(9, 'E', 'RECP', 'Recepcionista', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(10, 'E', 'ADMN', 'Administrador', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(11, 'S', 'P', 'Pendiente', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(12, 'S', 'C', 'Confirmada', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(13, 'S', 'A', 'Asistió', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(14, 'S', 'N', 'No Asistió', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22'),
	(15, 'S', 'X', 'Cancelada', 1, '2025-11-19 02:00:22', '2025-11-19 02:00:22');

-- Volcando estructura para tabla estetica_db.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) DEFAULT '0.00',
  `activo` tinyint(1) DEFAULT '1',
  `duracion_min` int DEFAULT '30',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.servicios: ~2 rows (aproximadamente)
INSERT INTO `servicios` (`id`, `nombre`, `precio`, `activo`, `duracion_min`, `created_at`, `updated_at`) VALUES
	(1, 'Corte de Dama', 250.00, 1, 30, '2026-02-19 16:27:51', '2026-02-19 16:27:51'),
	(2, 'Corte de Dama', 250.00, 1, 30, '2026-02-19 16:28:56', '2026-02-19 16:28:56'),
	(3, 'Tinte', 3000.00, 1, 120, '2026-02-19 16:28:56', '2026-02-19 16:28:56');

-- Volcando estructura para tabla estetica_db.visitas
CREATE TABLE IF NOT EXISTS `visitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `estilista_id` int DEFAULT NULL,
  `tipo` enum('Raiz','Largo','Matiz','Cambio de color') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `retoque` text COLLATE utf8mb4_general_ci,
  `fecha` datetime NOT NULL,
  `peticiones` text COLLATE utf8mb4_general_ci,
  `tipo_cambio` enum('Efecto de color','Limpieza de Color','Cambio de color') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `estilista_id` (`estilista_id`),
  KEY `fecha` (`fecha`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`estilista_id`) REFERENCES `estilistas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estetica_db.visitas: ~16 rows (aproximadamente)
INSERT INTO `visitas` (`id`, `cliente_id`, `estilista_id`, `tipo`, `retoque`, `fecha`, `peticiones`, `tipo_cambio`, `created_at`, `updated_at`) VALUES
	(2, 1, NULL, 'Largo', '*retoque realizado detallado*', '2025-11-18 15:40:00', '*peticiones extra detalladas*', NULL, '2025-11-20 00:37:03', '2025-11-20 00:37:03'),
	(3, 1, NULL, 'Cambio de color', 'Retoque cambio limpieza de color', '2025-11-19 16:40:00', 'Cambio de color al gusto', 'Limpieza de Color', '2025-11-20 00:40:29', '2025-11-20 00:40:29'),
	(16, 1, NULL, 'Raiz', NULL, '2025-11-20 09:00:00', 'Retoque de raíz', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(17, 1, NULL, 'Raiz', NULL, '2025-11-20 14:00:00', 'Color de raíz', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(18, 1, NULL, 'Largo', NULL, '2025-11-21 10:00:00', 'Corte largo', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(19, 1, NULL, 'Matiz', NULL, '2025-11-21 15:00:00', 'Matiz plateado', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(20, 1, NULL, 'Cambio de color', NULL, '2025-11-22 11:00:00', 'Cambio completo', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(21, 1, NULL, 'Raiz', NULL, '2025-11-22 16:00:00', 'Retoque raíz', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(22, 1, NULL, 'Largo', NULL, '2025-11-23 09:30:00', 'Mantenimiento largo', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(23, 1, NULL, 'Cambio de color', NULL, '2025-11-23 13:00:00', 'Decoloración', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(24, 1, NULL, 'Matiz', NULL, '2025-11-24 10:00:00', 'Tono rubio', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(25, 1, NULL, 'Raiz', NULL, '2025-11-24 14:30:00', 'Raíz castaño', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(26, 1, NULL, 'Largo', NULL, '2025-11-25 08:00:00', 'Corte y peinado', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(27, 1, NULL, 'Cambio de color', NULL, '2025-11-25 12:00:00', 'Color fantasía', NULL, '2025-11-21 01:40:59', '2025-11-21 01:40:59'),
	(28, 2, NULL, 'Cambio de color', 'Limpieza profunda con decolorante y tinte', '2025-11-26 17:49:00', 'Limpieza a mano junto con peinado', 'Limpieza de Color', '2025-11-26 23:54:40', '2025-11-26 23:54:40'),
	(29, 2, NULL, 'Raiz', 'retoque', '2025-11-26 17:57:00', 'peticion', NULL, '2025-11-26 23:57:19', '2025-11-26 23:57:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
