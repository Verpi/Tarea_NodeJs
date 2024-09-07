-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_empresa
DROP DATABASE IF EXISTS `db_empresa`;
CREATE DATABASE IF NOT EXISTS `db_empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_empresa`;


-- Volcando estructura para tabla db_empresa.estudiantes
DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `carne` varchar(10) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo_electronico` varchar(20) NOT NULL,
  `id_tipo_sangre` smallint(6) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `FK_tipo_sangre` (`id_tipo_sangre`),
  CONSTRAINT `FK_tipo_sangre` FOREIGN KEY (`id_tipo_sangre`) REFERENCES `tipos_sangre` (`id_tipo_sangre`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_empresa.estudiantes: ~4 rows (aproximadamente)
INSERT INTO `estudiantes` (`id_estudiante`, `carne`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo_electronico`, `id_tipo_sangre`, `fecha_nacimiento`) VALUES
	(1, 'E001', 'Dennys Stuar', 'Hernandez Moran', 'Boca', '47714712', 'dhernandezm@gmail.co', 3, '2024-09-08'),
	(2, 'E002', 'Henry Estuardo', 'Hernandez', 'Zona 7', '41499876', 'hhernandez@gmail.com', 5, '1998-01-15'),
	(6, 'E005', 'Karen', 'Rodriguez', 'Villa Canales', '98467523', 'krodriguez@gmail.com', 8, '2024-09-01'),
	(8, 'E007', 'Kenya', 'Rodas', 'Porvenir', '12345678', 'krodas@gmail.com', 1, '1111-11-11');


-- Volcando estructura para tabla db_empresa.tipos_sangre
DROP TABLE IF EXISTS `tipos_sangre`;
CREATE TABLE IF NOT EXISTS `tipos_sangre` (
  `id_tipo_sangre` smallint(6) NOT NULL AUTO_INCREMENT,
  `sangre` varchar(3) NOT NULL,
  PRIMARY KEY (`id_tipo_sangre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_empresa.tipos_sangre: ~8 rows (aproximadamente)
INSERT INTO `tipos_sangre` (`id_tipo_sangre`, `sangre`) VALUES
	(1, 'A+'),
	(2, 'A-'),
	(3, 'B+'),
	(4, 'B-'),
	(5, 'AB+'),
	(6, 'AB-'),
	(7, 'O+'),
	(8, 'O-');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
