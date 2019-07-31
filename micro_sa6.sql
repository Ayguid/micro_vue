CREATE DATABASE  IF NOT EXISTS `micro_sa6` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `micro_sa6`;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: micro_sa6
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Guido','guidoaimar@gmail.com',NULL,'asdf','$2y$10$80dyaqTN1rexQoOOcRXPcODTXeN0JOyuRveeUbSkhJ7p/oRkQnENW',NULL,'2019-06-14 02:10:25','2019-06-14 02:10:25');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attributes_category_id_foreign` (`category_id`),
  CONSTRAINT `attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (112,1,'Serie','string','2019-07-11 01:39:23','2019-07-11 01:39:23'),(113,1,'Tipo','string','2019-07-11 01:39:41','2019-07-11 01:39:41'),(114,1,'Descripción','string','2019-07-11 01:39:57','2019-07-11 01:39:57'),(115,1,'Norma','string','2019-07-11 01:40:04','2019-07-11 01:40:04'),(116,1,'Basado en la norma','string','2019-07-11 01:40:14','2019-07-11 01:40:14'),(117,1,'Diámetro','string','2019-07-11 01:40:51','2019-07-11 01:40:51'),(118,1,'Carrera','string','2019-07-11 01:40:58','2019-07-11 01:40:58'),(119,1,'Operación','string','2019-07-11 01:41:11','2019-07-11 01:41:11'),(120,1,'Resorte','string','2019-07-11 01:41:29','2019-07-11 01:41:29'),(121,1,'C/S Iman','string','2019-07-11 01:41:38','2019-07-11 01:41:38'),(122,1,'C/S Amort','string','2019-07-11 01:41:52','2019-07-11 01:41:52'),(123,1,'1Vast./2Vast.','string','2019-07-11 01:42:07','2019-07-11 01:42:07'),(124,1,'1Pistón/2Pistón','string','2019-07-11 01:42:38','2019-07-11 01:42:38'),(125,1,'Torque (Nm)','string','2019-07-11 01:42:58','2019-07-11 01:42:58'),(126,1,'Ajuste fino','string','2019-07-11 01:43:08','2019-07-11 01:43:08'),(127,1,'Rosca vast.','string','2019-07-11 01:43:16','2019-07-11 01:43:16'),(130,2,'Serie','string','2019-07-11 01:45:22','2019-07-11 01:45:22'),(131,2,'Tipo','string','2019-07-11 01:45:27','2019-07-11 01:45:27'),(132,2,'Descripción','string','2019-07-11 01:45:37','2019-07-11 01:45:37'),(133,2,'Posiciones','string','2019-07-11 01:46:51','2019-07-11 01:46:51'),(134,2,'Tamaño','string','2019-07-11 01:47:00','2019-07-11 01:47:00'),(135,2,'Función','string','2019-07-11 01:47:17','2019-07-11 01:47:17'),(136,2,'Conexión','string','2019-07-11 01:48:19','2019-07-11 01:48:19'),(137,2,'Caudal (l/min)','string','2019-07-11 01:48:33','2019-07-11 01:48:33'),(138,2,'Presión de trabajo','string','2019-07-11 01:49:12','2019-07-11 01:49:12'),(141,3,'Serie','string','2019-07-11 01:50:09','2019-07-11 01:50:09'),(142,3,'Tipo','string','2019-07-11 01:50:16','2019-07-11 01:50:16'),(143,3,'Descripción','string','2019-07-11 01:50:24','2019-07-11 01:50:24'),(144,3,'Nº posiciones','string','2019-07-11 01:50:34','2019-07-11 01:50:34'),(145,3,'Conexiones','string','2019-07-11 01:50:48','2019-07-11 01:50:48'),(146,3,'Caudal (l/min)','string','2019-07-11 01:50:59','2019-07-11 01:50:59'),(147,3,'Presión de trabajo','string','2019-07-11 01:53:41','2019-07-11 01:53:41'),(149,4,'Serie','string','2019-07-11 01:56:10','2019-07-11 01:56:10'),(150,4,'Tipo','string','2019-07-11 01:56:20','2019-07-11 01:56:20'),(151,4,'Conexión','string','2019-07-11 01:56:32','2019-07-11 01:56:32'),(152,4,'Tubo','string','2019-07-11 01:57:40','2019-07-11 01:57:40'),(153,4,'Presión de trabajo','string','2019-07-11 01:59:54','2019-07-11 01:59:54'),(154,5,'Serie','string','2019-07-11 02:00:34','2019-07-11 02:00:34'),(155,5,'Tipo','string','2019-07-11 02:00:40','2019-07-11 02:00:40'),(156,5,'Descripción','string','2019-07-11 02:00:48','2019-07-11 02:00:48'),(157,5,'Capacidad max. de asp. Nl/min','string','2019-07-11 02:01:12','2019-07-11 02:01:12'),(158,5,'Consumo Nl/min','string','2019-07-11 02:01:22','2019-07-11 02:01:22'),(159,5,'Presión de trabajo','string','2019-07-11 02:01:27','2019-07-11 02:01:27'),(160,5,'Diámetro','string','2019-07-11 02:01:45','2019-07-11 02:01:45'),(161,5,'Rosca','string','2019-07-11 02:01:50','2019-07-11 02:01:50'),(162,5,'Recorrido','string','2019-07-11 02:01:57','2019-07-11 02:01:57'),(163,5,'Material','string','2019-07-11 02:02:02','2019-07-11 02:02:02'),(164,5,'Fuerza aspiración (N)','string','2019-07-11 02:02:19','2019-07-11 02:02:19'),(165,5,'Carga V','string','2019-07-11 02:02:26','2019-07-11 02:02:26'),(166,5,'Momento','string','2019-07-11 02:02:31','2019-07-11 02:02:31'),(167,5,'Caudal 0.3','string','2019-07-11 02:02:44','2019-07-11 02:02:44'),(168,5,'Caudal 0.6','string','2019-07-11 02:02:52','2019-07-11 02:02:52'),(169,5,'Caudal descarga','string','2019-07-11 02:03:03','2019-07-11 02:03:03'),(170,6,'Serie','string','2019-07-11 02:03:21','2019-07-11 02:03:21'),(171,6,'Tipo','string','2019-07-11 02:03:28','2019-07-11 02:03:28'),(172,6,'Descripción','string','2019-07-11 02:03:34','2019-07-11 02:03:34'),(173,6,'Presión de trabajo','string','2019-07-11 02:03:40','2019-07-11 02:03:40'),(174,7,'Serie','string','2019-07-11 02:04:02','2019-07-11 02:04:02'),(175,7,'Tipo','string','2019-07-11 02:04:05','2019-07-11 02:04:05'),(176,7,'Descripción','string','2019-07-11 02:04:11','2019-07-11 02:04:11'),(177,7,'Presión de trabajo','string','2019-07-11 02:04:15','2019-07-11 02:04:15'),(178,7,'Conexión','string','2019-07-11 02:04:21','2019-07-11 02:04:21'),(179,7,'Poder filtrante (u)','string','2019-07-11 02:04:38','2019-07-11 02:04:38'),(180,7,'Caudal (l/min)','string','2019-07-11 02:04:46','2019-07-11 02:04:46'),(181,7,'Ensayo caudal','string','2019-07-11 02:04:59','2019-07-11 02:04:59'),(182,8,'Serie','string','2019-07-11 02:05:53','2019-07-11 02:05:53'),(183,8,'Tipo','string','2019-07-11 02:05:58','2019-07-11 02:05:58'),(184,8,'Descripción','string','2019-07-11 02:06:02','2019-07-11 02:06:02'),(185,8,'Presión de trabajo','string','2019-07-11 02:06:06','2019-07-11 02:06:06'),(186,8,'Conexión','string','2019-07-11 02:06:09','2019-07-11 02:06:09'),(187,8,'Tubo','string','2019-07-11 02:06:13','2019-07-11 02:06:13'),(188,8,'Cantidad de tubos','string','2019-07-11 02:06:56','2019-07-11 02:06:56'),(189,9,'Serie','string','2019-07-11 02:07:49','2019-07-11 02:07:49'),(190,9,'Tipo','string','2019-07-11 02:08:15','2019-07-11 02:08:15'),(191,9,'Descripción','string','2019-07-11 02:08:21','2019-07-11 02:08:21'),(192,9,'Presión de trabajo','string','2019-07-11 02:08:26','2019-07-11 02:08:26'),(193,9,'Diámetro','string','2019-07-11 02:08:32','2019-07-11 02:08:32'),(194,9,'Conexiones','string','2019-07-11 02:08:46','2019-07-11 02:08:46'),(195,10,'Serie','string','2019-07-11 02:09:02','2019-07-11 02:09:02'),(196,10,'Tipo','string','2019-07-11 02:09:09','2019-07-11 02:09:09'),(198,10,'Descripción','string','2019-07-11 02:09:14','2019-07-11 02:09:14'),(199,10,'Potencia','string','2019-07-11 02:09:25','2019-07-11 02:09:25'),(200,10,'Tensión','string','2019-07-11 02:09:35','2019-07-11 02:09:35'),(201,10,'RPM','string','2019-07-11 02:09:40','2019-07-11 02:09:40'),(202,10,'Torque Nom.','string','2019-07-11 02:09:48','2019-07-11 02:09:48'),(203,10,'Torque Máx.','string','2019-07-11 02:10:02','2019-07-11 02:10:02'),(204,10,'Carcasa','string','2019-07-11 02:10:10','2019-07-11 02:10:10'),(205,10,'Eje','string','2019-07-11 02:10:15','2019-07-11 02:10:15'),(206,10,'Comunicación','string','2019-07-11 02:10:50','2019-07-11 02:10:50'),(207,10,'Resolución','string','2019-07-11 02:11:03','2019-07-11 02:11:03'),(208,10,'Tamaño de display','string','2019-07-11 02:11:18','2019-07-11 02:11:18'),(209,10,'Caracteristicas','string','2019-07-11 02:11:30','2019-07-11 02:11:30'),(210,10,'Diámetro','string','2019-07-11 02:12:05','2019-07-11 02:12:05'),(211,10,'Distancia nominal (mm)','string','2019-07-11 02:12:18','2019-07-11 02:12:18'),(214,108,'Att test','string','2019-07-12 01:42:21','2019-07-12 01:42:21');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title_es` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_es` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'Cilindros','Actuadores rotantes','Actuadores rotantes','Actuadores rotantes1',NULL,NULL,'http://microautomacion.com/wp-content/uploads/2019/03/bloqueo-de-v%C3%A1stago.jpg',NULL,'2019-06-16 03:06:03'),(2,NULL,'Valvulas',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2019/03/UG-1.jpg',NULL,NULL),(3,NULL,'Estaciones de Valvulas',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2018/11/estaci%C3%B3n-de-v%C3%A1lvulas_MICROweb.jpg',NULL,NULL),(4,NULL,'Valvulas auxiliares',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2018/11/componentes-auxiliares-3.jpg',NULL,NULL),(5,NULL,'Equipos para vacio',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2018/11/Generadores-de-vac%C3%ADo-X-Pump-1.jpg',NULL,NULL),(6,NULL,'Manipulacion y Equipos',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2019/03/Pinza-paralela-2d-MCHC-001.jpg',NULL,NULL),(7,NULL,'Unidades FRL',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2018/11/QBS9.jpg',NULL,NULL),(8,NULL,'Conexiones',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2019/02/conex446-1-1.jpg',NULL,NULL),(9,NULL,'Procesos',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2018/11/cajas-1.jpg',NULL,NULL),(10,NULL,'Automatizacion y control',NULL,NULL,NULL,NULL,NULL,'http://microautomacion.com/wp-content/uploads/2018/11/060201_AC_SERVO_M-3.jpg',NULL,NULL),(11,1,'Actuadores rotantes',NULL,NULL,'Actuadores rotantes',NULL,NULL,NULL,NULL,'2019-06-15 05:32:17'),(12,1,'Amortiguadores de choque',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1,'Cilindros compactos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,'Cilindros compactos con guia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1,'Cilindros de impacto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1,'Cilindros ISO15552 - VDMA 24562',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,'Cilindros sin vástago',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,1,'Controles hidráulicos de velocidad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,1,'Interruptores magnéticos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,1,'Microcilindros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,1,'Minicilindros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,2,'Electroválvulas piezoeléctricas y antiexplosivas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,2,'Electroválvulas serie pesada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,2,'Solenoides y accesorios',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,2,'Válvulas de seguridad para prensas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,2,'Válvulas direccionales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,2,'Valvulas ISO 5599/1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,2,'Válvulas manuales y mecánicas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,2,'Válvulas para fluidos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,3,'Estaciones de válvulas bus de campo AS-i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,3,'Estaciones de válvulas bus de campo DEVICENET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,3,'Estaciones de válvulas bus de campo PROFIBUS DP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,3,'Estaciones de válvulas MULTIPOLO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,3,'Estaciones de válvulas MULTIPOLO con salida lateral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,3,'Válvulas para estaciónes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,3,'Válvulas para estaciónes con salida lateral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,4,'Colectores ecológicos de escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,4,'Conexiones con funciones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,4,'Elementos de visualización',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,4,'Emisores de señal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,4,'Funciones lógicas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,4,'Módulos de seguridad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,4,'Módulos temporizados',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,4,'Reguladores de caudal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,4,'Reguladores de caudal en línea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,4,'Reguladores de escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,4,'Silenciadores de escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,4,'Válvulas de escape rápido',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,4,'Válvulas de no retorno (retención)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,5,'Accesorios elementos de fijación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,5,'Accesorios emisores de señal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,5,'Accesorios filtros de vacío',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,5,'Accesorios vacuómetros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,5,'Accesorios válvulas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,5,'Generadores de vacío',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,5,'Ventosas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,6,'Elementos de manipulación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,6,'Mesas rotantes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,7,'Accesorios y repuestos para unidades FRL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,7,'Amplificador de presión',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,7,'Bridas intermedias',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,7,'Drenaje automático temporizado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,7,'Drenajes para condensados',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,7,'Filtro de sustancias higroscopicas o depuradoras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,7,'Microfiltro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,7,'Módulo presostato',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,7,'Regulador de presión proporcional - Serie PIEZO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,7,'Regulador de presión proporcional - Serie SRE y CRE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,7,'Reguladores de intrumentación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,7,'Sensor de presión digital',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,7,'Unidad F de sustancias higroscopicas o depuradoras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,7,'Unidades F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,7,'Unidades F+R+L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,7,'Unidades FR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,7,'Unidades FR+L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,7,'Unidades L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,7,'Unidades R',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,7,'Unidades R comando a distancia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,7,'Unidades R para instrumentación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,7,'Válvulas de corte para candado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,7,'Válvulas de corte y descarga',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,7,'Válvulas de presurización progresiva',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,7,'Válvulas de presurización y descarga',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,8,'Accesorios de conexión',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,8,'Accesorios de conexión de acero inoxidable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,8,'Acoples rápidos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,8,'Conexiones instantáneas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,8,'Conexiones instantáneas con rosca cilíndrica',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,8,'Conexiones instantáneas con rosca cónica',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,8,'Conexiones instantáneas de acero inoxidable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,8,'Conexiones instantáneas de latón niquelado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,8,'Conexiones universales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,8,'Conexiones y mangueras para ambientes rigurosos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,8,'Pistolas para aire comprimido',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,8,'Tubos y mangueras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,9,'Industria de procesos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,10,'Fuentes reguladas de alimentación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,10,'Interfaz Hombre-máquina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,10,'PLC Controladores Lógicos Programables',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,10,'Sensores capacitivos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,10,'Sensores inductivos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,10,'Sensores optoelectrónicos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,10,'Servomotores y drivers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,10,'Variadores de frecuencia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,NULL,'Test','Test testing facility','Test testing facility','Test testing facility','Aca testeamos','Aca testeamos','Aca testeamos','2019-07-12 01:37:00','2019-07-12 01:37:00'),(109,108,'Test sub 1','Test sub 1','Test sub 1','Test sub 1','Test sub 1','Test sub 1','Test sub 1','2019-07-12 01:37:28','2019-07-12 01:37:28'),(110,108,'Test sub 2','Test sub 2','Test sub 2','Test sub 2','Test sub 2','Test sub 2','Test sub 2','2019-07-12 01:37:41','2019-07-12 01:37:41');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Argentina','es','es','2019-06-14 02:58:24','2019-06-14 02:58:24'),(2,'Brasil','pt-BR','pt-BR','2019-06-14 02:58:24','2019-06-14 02:58:24'),(3,'Chile','es','es','2019-06-14 02:58:24','2019-06-14 02:58:24');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileable_id` int(10) unsigned NOT NULL,
  `fileable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_04_18_021835_create_admins_table',1),(4,'2019_06_13_215255_create_categories_table',1),(5,'2019_06_13_215313_create_products_table',1),(6,'2019_06_13_215326_create_countries_table',1),(7,'2019_06_13_215344_create_products_in_countries_table',1),(10,'2019_06_13_215359_create_attributes_table',2),(11,'2019_06_13_215418_create_products_attributes_table',2),(13,'2019_06_15_003029_create_files_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `title_es` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_es` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cad_2d` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cad_3d` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_es` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16955 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (16944,11,'Test','Test','Test','Test','Test','Test','Test','Test',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(16945,21,'Prod 3','test','test','test','test','test','1212','test',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(16948,11,'2','2','2','2','2','2','21212','2',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-11 04:48:00','2019-07-11 04:48:00'),(16949,11,'test3','test3','test3','ºtest3','test3','test3','test3','test3',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(16950,11,'Pepe','pepe1','pepe3','pepepep4','piii8','jkjhk','hlhlh555','123231',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(16951,11,'1','1','1','1','1','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-11 06:01:47','2019-07-11 06:01:47'),(16953,109,'prod test 1','prod test 1','prod test 1','prod test 1','prod test 1','prod test 1','prod test 1','prod test 1',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-12 01:38:06','2019-07-12 01:38:06'),(16954,110,'prod test 2','prod test 2','prod test 2','prod test 2','prod test 2','prod test 2','prod test 2','prod test 2',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-12 01:43:31','2019-07-12 01:43:31');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `attribute_id` bigint(20) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_attributes_product_id_foreign` (`product_id`),
  KEY `products_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `products_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `products_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` VALUES (52015,16944,112,'Prod1',NULL,'2019-07-11 02:24:57','2019-07-11 04:00:43'),(52016,16944,113,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52017,16944,114,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52018,16944,115,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52019,16944,116,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52020,16944,117,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52021,16944,118,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52022,16944,119,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52023,16944,120,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52024,16944,121,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52025,16944,122,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52026,16944,123,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52027,16944,124,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52028,16944,125,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52029,16944,126,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52030,16944,127,'Test',NULL,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(52031,16945,112,'Prod 3',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52032,16945,113,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52033,16945,114,'Prod 3',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52034,16945,115,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52035,16945,116,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52036,16945,117,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52037,16945,118,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52038,16945,119,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52039,16945,120,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52040,16945,121,'testtest',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52041,16945,122,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52042,16945,123,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52043,16945,124,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52044,16945,125,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52045,16945,126,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52046,16945,127,'test',NULL,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(52064,16948,112,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52065,16948,113,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52066,16948,114,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52067,16948,115,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52068,16948,116,'234q234',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52069,16948,117,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52070,16948,118,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52071,16948,119,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52072,16948,120,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52073,16948,121,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52074,16948,122,'234q234',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52075,16948,123,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52076,16948,124,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52077,16948,125,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52078,16948,126,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52079,16948,127,'2',NULL,'2019-07-11 04:48:01','2019-07-11 04:48:01'),(52080,16949,112,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52081,16949,113,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52082,16949,114,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52083,16949,115,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52084,16949,116,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52085,16949,117,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52086,16949,118,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52087,16949,119,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52088,16949,120,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52089,16949,121,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52090,16949,122,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52091,16949,123,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52092,16949,124,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52093,16949,125,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52094,16949,126,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52095,16949,127,'test3',NULL,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(52096,16950,112,'Guido Twest',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52097,16950,113,'Grande',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52098,16950,114,'Largo',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52099,16950,115,'Basica',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52100,16950,116,'Girl',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52101,16950,117,'5',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52102,16950,118,'20cm',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52103,16950,119,'rapida',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52104,16950,120,'seguro',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52105,16950,121,'con',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52106,16950,122,'sin',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52107,16950,123,'2v',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52108,16950,124,'1p',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52109,16950,125,'maso',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52110,16950,126,'yes',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52111,16950,127,'obvio',NULL,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(52116,16953,214,'val 1',NULL,'2019-07-12 01:42:39','2019-07-12 01:42:39'),(52117,16954,214,'prod test 2',NULL,'2019-07-12 01:43:48','2019-07-12 01:43:48');
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_in_countries`
--

DROP TABLE IF EXISTS `products_in_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_in_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_in_countries_product_id_foreign` (`product_id`),
  KEY `products_in_countries_country_id_foreign` (`country_id`),
  CONSTRAINT `products_in_countries_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `products_in_countries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_in_countries`
--

LOCK TABLES `products_in_countries` WRITE;
/*!40000 ALTER TABLE `products_in_countries` DISABLE KEYS */;
INSERT INTO `products_in_countries` VALUES (33738,16944,1,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(33739,16944,2,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(33740,16944,3,'2019-07-11 02:24:57','2019-07-11 02:24:57'),(33741,16945,1,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(33742,16945,2,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(33743,16945,3,'2019-07-11 02:37:19','2019-07-11 02:37:19'),(33750,16948,1,'2019-07-11 04:48:00','2019-07-11 04:48:00'),(33751,16948,2,'2019-07-11 04:48:00','2019-07-11 04:48:00'),(33752,16948,3,'2019-07-11 04:48:00','2019-07-11 04:48:00'),(33753,16949,1,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(33754,16949,2,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(33755,16949,3,'2019-07-11 05:24:44','2019-07-11 05:24:44'),(33756,16950,1,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(33757,16950,2,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(33758,16950,3,'2019-07-11 05:42:55','2019-07-11 05:42:55'),(33759,16951,1,'2019-07-11 06:01:47','2019-07-11 06:01:47'),(33760,16951,2,'2019-07-11 06:01:47','2019-07-11 06:01:47'),(33761,16951,3,'2019-07-11 06:01:47','2019-07-11 06:01:47'),(33765,16953,1,'2019-07-12 01:38:06','2019-07-12 01:38:06'),(33766,16953,2,'2019-07-12 01:38:06','2019-07-12 01:38:06'),(33767,16953,3,'2019-07-12 01:38:06','2019-07-12 01:38:06'),(33768,16954,1,'2019-07-12 01:43:31','2019-07-12 01:43:31'),(33769,16954,2,'2019-07-12 01:43:31','2019-07-12 01:43:31'),(33770,16954,3,'2019-07-12 01:43:31','2019-07-12 01:43:31');
/*!40000 ALTER TABLE `products_in_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Guido Aimar','guidoaimar@gmail.com',NULL,'$2y$10$80dyaqTN1rexQoOOcRXPcODTXeN0JOyuRveeUbSkhJ7p/oRkQnENW',NULL,'2019-06-14 02:10:25','2019-06-14 02:10:25');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-11 20:28:17
