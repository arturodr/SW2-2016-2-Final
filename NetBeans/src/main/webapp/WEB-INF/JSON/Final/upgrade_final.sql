-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: gameshop2
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `distribuidoras`
--

DROP TABLE IF EXISTS `distribuidoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribuidoras` (
  `iddistribuidora` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`iddistribuidora`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidoras`
--

LOCK TABLES `distribuidoras` WRITE;
/*!40000 ALTER TABLE `distribuidoras` DISABLE KEYS */;
INSERT INTO `distribuidoras` VALUES (1,'Nintendo','Es una de las empresas m'),(2,'Electronic Arts','Es una empresa estadounidense desarrolladora y distribuidora de videojuegos para ordenador y videoconsolas fundada por Trip Hawkins'),(3,'Sony Computer Entertainment','Es una empresa multinacional dedicada a los videojuegos y subsidiaria de Sony Corporation. '),(4,'Activision','Es una empresa de videojuegos estadounidense. Fue el primer desarrollador y distribuidor independiente de este tipo de juegos, fundado el 1 de octubre de 1979');
/*!40000 ALTER TABLE `distribuidoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoras`
--

DROP TABLE IF EXISTS `editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoras` (
  `ideditora` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ideditora`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoras`
--

LOCK TABLES `editoras` WRITE;
/*!40000 ALTER TABLE `editoras` DISABLE KEYS */;
INSERT INTO `editoras` VALUES (1,'Nintendo','Se ha dedicado a la producci'),(2,'Sony Corporation','Es una de las empresas m'),(3,'Take-Two Interactive','Es una empresa estadounidense desarrolladora y distribuidora de videojuegos. Su base central est'),(4,'Infinity Ward','Es un estudio desarrollador de videojuegos con sede en Encino, California');
/*!40000 ALTER TABLE `editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEnvio` varchar(50) NOT NULL,
  `tarjeta` varchar(50) CHARACTER SET utf8 NOT NULL,
  `codigoVerificacion` varchar(5) CHARACTER SET utf8 NOT NULL,
  `direccion` varchar(500) CHARACTER SET utf8 NOT NULL,
  `monto` float NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'20/12/2014','1234567891234567891','123','Gral Miller 2020',219.8,2);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generos` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Acci','Videojuegos de acci'),(2,'Simulaci','Este g'),(3,'Agilidad ','El objetivo aqu');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegos` (
  `idjuego` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `idgenero` int(11) DEFAULT NULL,
  `idplataforma` int(11) DEFAULT NULL,
  `ideditora` int(11) DEFAULT NULL,
  `iddistribuidora` int(11) DEFAULT NULL,
  PRIMARY KEY (`idjuego`),
  KEY `FK_juegos_1` (`iddistribuidora`),
  KEY `FK_juegos_2` (`ideditora`),
  KEY `FK_juegos_3` (`idgenero`),
  KEY `FK_juegos_4` (`idplataforma`),
  CONSTRAINT `FK_juegos_1` FOREIGN KEY (`iddistribuidora`) REFERENCES `distribuidoras` (`iddistribuidora`),
  CONSTRAINT `FK_juegos_2` FOREIGN KEY (`ideditora`) REFERENCES `editoras` (`ideditora`),
  CONSTRAINT `FK_juegos_3` FOREIGN KEY (`idgenero`) REFERENCES `generos` (`idgenero`),
  CONSTRAINT `FK_juegos_4` FOREIGN KEY (`idplataforma`) REFERENCES `plataformas` (`idplataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (1,'FIFA 132','FIFA 13 es la vig',49.9,1,2,2,2),(2,'Call of Duty','Es una serie de videojuegos en primera persona, de estilo b',70,1,3,4,4),(3,'Assassin Creed 1','Es una serie de videojuegos de acci',100,1,2,4,3),(4,'Resident Evil 6','es un videojuego de disparos en tercera persona del g',120,1,3,3,4);
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegosxusuario`
--

DROP TABLE IF EXISTS `juegosxusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegosxusuario` (
  `idjuego` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  KEY `FK_juegosxusuario_2` (`idjuego`),
  KEY `fk_juegosxusuario_usuarios1` (`idusuario`),
  CONSTRAINT `FK_juegosxusuario_2` FOREIGN KEY (`idjuego`) REFERENCES `juegos` (`idjuego`),
  CONSTRAINT `fk_juegosxusuario_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegosxusuario`
--

LOCK TABLES `juegosxusuario` WRITE;
/*!40000 ALTER TABLE `juegosxusuario` DISABLE KEYS */;
INSERT INTO `juegosxusuario` VALUES (1,2,2),(4,2,1);
/*!40000 ALTER TABLE `juegosxusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plataformas` (
  `idplataforma` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idplataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (1,'Wii','Es una videoconsola producida por Nintendo y estrenada el 19 de noviembre de 2006 en Norteam'),(2,'PlayStation 4','Es la cuarta videoconsola de sobremesa fabricada por Sony Computer Entertainment y la sucesora de la PlayStation 3 como parte de la marca PlayStation.'),(3,'Xbox','Es la primera videoconsola de sobremesa producida por Microsoft, en colaboraci');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `password` varchar(65) DEFAULT NULL,
  `autorizacion` varchar(20) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2010 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2008,'Diaz Rosemberg','Arturo','arturo.d@pucp.pe','123456','1',NULL),(2009,'Gamboa Rojas','Henry','henry.g@pucp.pe','123456','1',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-05 10:20:24
