# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Base de datos: sistemas_vendimia
# Tiempo de Generación: 2017-03-28 17:24:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla acc_configuracion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acc_configuracion`;

CREATE TABLE `acc_configuracion` (
  `tasa` varchar(50) NOT NULL DEFAULT '',
  `enganche` varchar(50) NOT NULL DEFAULT '',
  `plazo` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla int_catarticulos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `int_catarticulos`;

CREATE TABLE `int_catarticulos` (
  `id_articulo` tinyint(50) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL DEFAULT '',
  `modelo` varchar(255) NOT NULL DEFAULT '',
  `precio` varchar(50) NOT NULL DEFAULT '',
  `existencia` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla int_catclientes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `int_catclientes`;

CREATE TABLE `int_catclientes` (
  `id_cliente` tinyint(50) NOT NULL AUTO_INCREMENT,
  `apepaterno` varchar(50) NOT NULL DEFAULT '',
  `apematerno` varchar(50) NOT NULL DEFAULT '',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `rfc` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla int_catventas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `int_catventas`;

CREATE TABLE `int_catventas` (
  `id_venta` tinyint(50) NOT NULL AUTO_INCREMENT,
  `id_cliente` varchar(50) NOT NULL DEFAULT '',
  `total` varchar(50) NOT NULL DEFAULT '',
  `plazo` varchar(50) NOT NULL DEFAULT '',
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla int_catventas_detalle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `int_catventas_detalle`;

CREATE TABLE `int_catventas_detalle` (
  `id_venta` varchar(50) NOT NULL DEFAULT '',
  `id_articulo` varchar(50) NOT NULL DEFAULT '',
  `cantidad` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- Dumping routines (PROCEDURE) for database 'sistemas_vendimia'
--
DELIMITER ;;

# Dump of PROCEDURE acc_configuracionAgregar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `acc_configuracionAgregar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `acc_configuracionAgregar`(V_tasa VARCHAR(50),V_enganche VARCHAR(50),V_plazo VARCHAR(50))
BEGIN
	/*DELETE*/
		DELETE FROM acc_configuracion;
	/*INSERT*/
		INSERT acc_configuracion(tasa,enganche,plazo)
		VALUES(V_tasa,V_enganche,V_plazo);
		SELECT 1 AS success, 'Bien Hecho. La configuración ha sido registrada.' AS msg;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE acc_configuracionConsultar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `acc_configuracionConsultar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `acc_configuracionConsultar`()
BEGIN
	SELECT * FROM acc_configuracion;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catarticulosAgregar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catarticulosAgregar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catarticulosAgregar`(V_id_articulo VARCHAR(50),V_descripcion VARCHAR(255),V_modelo VARCHAR(255),V_precio VARCHAR(50),V_exixtencia VARCHAR(255),V_tipo TINYINT(1))
BEGIN
	/*INSERT*/
	IF (V_id_articulo="")THEN
		INSERT int_catarticulos(id_articulo,descripcion,modelo,precio,existencia)
		VALUES('',V_descripcion,V_modelo,V_precio,V_exixtencia);
		SELECT 1 AS success, 'Bien Hecho. El Articulo ha sido registrado correctamente.' AS msg;
	ELSE
	/*MODIFY*/
		IF(V_tipo='1')THEN
			UPDATE int_catarticulos SET existencia= V_exixtencia WHERE id_articulo = V_id_articulo;
			SELECT 1 AS success, 'Bien Hecho. El Articulo ha sido modificado correctamente.' AS msg;
		ELSE
			UPDATE int_catarticulos SET descripcion= V_descripcion, modelo=V_modelo,precio= V_precio, existencia= V_exixtencia WHERE id_articulo = V_id_articulo;
			SELECT 1 AS success, 'Bien Hecho. El Articulo ha sido modificado correctamente.' AS msg;
		END IF;
    END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catarticulosConsultar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catarticulosConsultar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catarticulosConsultar`()
BEGIN
	SELECT * FROM int_catarticulos ORDER BY id_articulo;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catarticulosConsultarLastId
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catarticulosConsultarLastId` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catarticulosConsultarLastId`()
BEGIN
	SELECT MAX(id_articulo + 1) AS id_articulo FROM int_catarticulos;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catclientesAgregar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catclientesAgregar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catclientesAgregar`(V_id_cliente VARCHAR(50),V_apepaterno VARCHAR(50),V_apematerno VARCHAR(50),V_nombre VARCHAR(50),V_rfc VARCHAR(12))
BEGIN
	/*INSERT*/
	IF(V_id_cliente="")THEN
		INSERT int_catclientes(id_cliente,apepaterno,apematerno,nombre,rfc)
		VALUES('',V_apepaterno,V_apematerno,V_nombre,V_rfc);
		SELECT 1 AS success, 'Bien Hecho. El cliente ha sido registrado correctamente.' AS msg;
    ELSE
    /*MODIFY*/
        UPDATE int_catclientes SET apepaterno= V_apepaterno, apematerno=V_apematerno,nombre= V_nombre, rfc= V_rfc WHERE id_cliente = V_id_cliente;
		SELECT 1 AS success, 'Bien Hecho. El cliente ha sido modificado correctamente.' AS msg;
	END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catclientesConsultar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catclientesConsultar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catclientesConsultar`()
BEGIN
	SELECT *,CONCAT(apepaterno,' ',apematerno,' ',nombre) AS nombrecompleto FROM int_catclientes ORDER BY id_cliente;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catclientesConsultarLastId
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catclientesConsultarLastId` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catclientesConsultarLastId`()
BEGIN
	SELECT MAX(id_cliente + 1) AS id_cliente FROM int_catclientes;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catventasAgregar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catventasAgregar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catventasAgregar`(V_id_venta VARCHAR(50),V_id_cliente VARCHAR(50),V_total VARCHAR(255),V_plazo VARCHAR(50))
BEGIN
	/*INSERT*/
		INSERT int_catventas(id_venta,id_cliente,total,plazo,fecha)
		VALUES(V_id_venta,V_id_cliente,V_total,V_plazo,NOW());
		SELECT 1 AS success, 'Bien Hecho, Tu venta ha sido registrada correctamente' AS msg;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catventasConsultar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catventasConsultar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catventasConsultar`()
BEGIN
	SELECT ventas.*,CONCAT(clientes.apepaterno,' ',clientes.apematerno,' ',clientes.nombre) AS nombrecompleto, CONCAT(LPAD(DAY(ventas.fecha),2,'0'),'/',LPAD(MONTH(ventas.fecha),2,'0'),'/',YEAR(ventas.fecha)) AS fecha FROM int_catventas AS ventas
	INNER JOIN int_catclientes AS clientes ON ventas.id_cliente = clientes.id_cliente;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catventasConsultarLastId
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catventasConsultarLastId` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catventasConsultarLastId`()
BEGIN
	SELECT MAX(id_venta + 1) AS id_venta FROM int_catventas;
	SELECT 1 AS success, '{"success": true}' AS respuesta;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE int_catventas_DetalleAgregar
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `int_catventas_DetalleAgregar` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sistemas_vendimia`@`localhost`*/ /*!50003 PROCEDURE `int_catventas_DetalleAgregar`(V_id_venta VARCHAR(50),V_id_articulo VARCHAR(50),V_cantidad VARCHAR(50))
BEGIN
	/*INSERT*/
		INSERT int_catventas_detalle(id_venta,id_articulo,cantidad)
		VALUES(V_id_venta,V_id_articulo,V_cantidad);
		SELECT 1 AS success, 'Bien Hecho, Tu venta ha sido registrada correctamente' AS msg;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
