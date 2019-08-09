-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: micro_sa6
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
  `country_id` int(10) DEFAULT NULL,
  `contactable` tinyint(1) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Guido','guidoaimar@gmail.com',NULL,NULL,NULL,'Super Admin','$2y$10$80dyaqTN1rexQoOOcRXPcODTXeN0JOyuRveeUbSkhJ7p/oRkQnENW',NULL,'2019-06-14 02:10:25','2019-06-14 02:10:25'),(18,'Chile','chile@micro.com',3,1,NULL,'Comercial','$2y$10$wQygq5ru8nlO0LMo48BQfOfV5Fk3J1ek7pV4itteuZl2HSurLGDLW',NULL,'2019-08-02 06:40:39','2019-08-08 02:36:20'),(19,'Brasil','brasil@micro.com',2,1,NULL,'Comercial','$2y$10$SY9R.Cittrrb5xo//q3koOxsLsRMrJDKLYbb7v0UyxKBDl1u1xIU2',NULL,'2019-08-02 06:41:24','2019-08-08 02:31:09'),(20,'Argentina Com','comercial@micro.com',1,1,NULL,'Comercial','$2y$10$PelnWVBx72Wangar0Lw7t.g.Cukq6AheDXleUtZDxrZyduX39ggPy',NULL,'2019-08-02 06:42:08','2019-08-02 06:42:08'),(21,'Argentina Ing','ingenieria@micro.com',1,1,NULL,'Ingenieria','$2y$10$ugX01DOuZQW6NXBmG.HUZevgvobB6aZX.Dytw6tarwwJr3g8bRseK',NULL,'2019-08-02 06:42:36','2019-08-06 02:03:12');
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
  `name_es` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filterable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attributes_category_id_foreign` (`category_id`),
  CONSTRAINT `attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (112,1,'Serie','string','2019-07-11 01:39:23','2019-07-27 06:39:32','Series','Série',1),(113,1,'Tipo','string','2019-07-11 01:39:41','2019-07-24 23:37:24',NULL,NULL,1),(114,1,'Descripción','string','2019-07-11 01:39:57','2019-08-09 02:24:45','Description','Descrição',1),(115,1,'Norma','string','2019-07-11 01:40:04','2019-07-11 01:40:04',NULL,NULL,NULL),(116,1,'Basado en la norma','string','2019-07-11 01:40:14','2019-07-11 01:40:14',NULL,NULL,NULL),(117,1,'Diámetro','string','2019-07-11 01:40:51','2019-07-24 23:37:42',NULL,NULL,1),(118,1,'Carrera','string','2019-07-11 01:40:58','2019-08-03 03:28:26',NULL,NULL,1),(119,1,'Operación','string','2019-07-11 01:41:11','2019-07-11 01:41:11',NULL,NULL,NULL),(120,1,'Resorte','string','2019-07-11 01:41:29','2019-07-11 01:41:29',NULL,NULL,NULL),(121,1,'C/S Iman','string','2019-07-11 01:41:38','2019-07-11 01:41:38',NULL,NULL,NULL),(122,1,'C/S Amort','string','2019-07-11 01:41:52','2019-07-11 01:41:52',NULL,NULL,NULL),(123,1,'1Vast./2Vast.','string','2019-07-11 01:42:07','2019-07-11 01:42:07',NULL,NULL,NULL),(124,1,'1Pistón/2Pistón','string','2019-07-11 01:42:38','2019-07-11 01:42:38',NULL,NULL,NULL),(125,1,'Torque (Nm)','string','2019-07-11 01:42:58','2019-07-11 01:42:58',NULL,NULL,NULL),(126,1,'Ajuste fino','string','2019-07-11 01:43:08','2019-07-11 01:43:08',NULL,NULL,NULL),(127,1,'Rosca vast.','string','2019-07-11 01:43:16','2019-07-11 01:43:16',NULL,NULL,NULL),(130,2,'Serie','string','2019-07-11 01:45:22','2019-07-11 01:45:22',NULL,NULL,NULL),(131,2,'Tipo','string','2019-07-11 01:45:27','2019-07-11 01:45:27',NULL,NULL,NULL),(132,2,'Descripción','string','2019-07-11 01:45:37','2019-07-11 01:45:37',NULL,NULL,NULL),(133,2,'Posiciones','string','2019-07-11 01:46:51','2019-07-11 01:46:51',NULL,NULL,NULL),(134,2,'Tamaño','string','2019-07-11 01:47:00','2019-07-11 01:47:00',NULL,NULL,NULL),(135,2,'Función','string','2019-07-11 01:47:17','2019-07-27 07:18:53',NULL,NULL,1),(136,2,'Conexión','string','2019-07-11 01:48:19','2019-07-11 01:48:19',NULL,NULL,NULL),(137,2,'Caudal (l/min)','string','2019-07-11 01:48:33','2019-07-11 01:48:33',NULL,NULL,NULL),(138,2,'Presión de trabajo','string','2019-07-11 01:49:12','2019-07-11 01:49:12',NULL,NULL,NULL),(141,3,'Serie','string','2019-07-11 01:50:09','2019-07-11 01:50:09',NULL,NULL,NULL),(142,3,'Tipo','string','2019-07-11 01:50:16','2019-07-11 01:50:16',NULL,NULL,NULL),(143,3,'Descripción','string','2019-07-11 01:50:24','2019-07-11 01:50:24',NULL,NULL,NULL),(144,3,'Nº posiciones','string','2019-07-11 01:50:34','2019-07-11 01:50:34',NULL,NULL,NULL),(145,3,'Conexiones','string','2019-07-11 01:50:48','2019-07-11 01:50:48',NULL,NULL,NULL),(146,3,'Caudal (l/min)','string','2019-07-11 01:50:59','2019-07-11 01:50:59',NULL,NULL,NULL),(147,3,'Presión de trabajo','string','2019-07-11 01:53:41','2019-07-11 01:53:41',NULL,NULL,NULL),(149,4,'Serie','string','2019-07-11 01:56:10','2019-07-29 20:40:25',NULL,NULL,1),(150,4,'Tipo','string','2019-07-11 01:56:20','2019-07-29 20:40:58',NULL,NULL,1),(151,4,'Conexión','string','2019-07-11 01:56:32','2019-07-11 01:56:32',NULL,NULL,NULL),(152,4,'Tubo','string','2019-07-11 01:57:40','2019-07-11 01:57:40',NULL,NULL,NULL),(153,4,'Presión de trabajo','string','2019-07-11 01:59:54','2019-07-11 01:59:54',NULL,NULL,NULL),(154,5,'Serie','string','2019-07-11 02:00:34','2019-07-11 02:00:34',NULL,NULL,NULL),(155,5,'Tipo','string','2019-07-11 02:00:40','2019-07-11 02:00:40',NULL,NULL,NULL),(156,5,'Descripción','string','2019-07-11 02:00:48','2019-07-11 02:00:48',NULL,NULL,NULL),(157,5,'Capacidad max. de asp. Nl/min','string','2019-07-11 02:01:12','2019-07-11 02:01:12',NULL,NULL,NULL),(158,5,'Consumo Nl/min','string','2019-07-11 02:01:22','2019-07-11 02:01:22',NULL,NULL,NULL),(159,5,'Presión de trabajo','string','2019-07-11 02:01:27','2019-07-11 02:01:27',NULL,NULL,NULL),(160,5,'Diámetro','string','2019-07-11 02:01:45','2019-07-11 02:01:45',NULL,NULL,NULL),(161,5,'Rosca','string','2019-07-11 02:01:50','2019-07-11 02:01:50',NULL,NULL,NULL),(162,5,'Recorrido','string','2019-07-11 02:01:57','2019-07-11 02:01:57',NULL,NULL,NULL),(163,5,'Material','string','2019-07-11 02:02:02','2019-07-11 02:02:02',NULL,NULL,NULL),(164,5,'Fuerza aspiración (N)','string','2019-07-11 02:02:19','2019-07-11 02:02:19',NULL,NULL,NULL),(165,5,'Carga V','string','2019-07-11 02:02:26','2019-07-11 02:02:26',NULL,NULL,NULL),(166,5,'Momento','string','2019-07-11 02:02:31','2019-07-11 02:02:31',NULL,NULL,NULL),(167,5,'Caudal 0.3','string','2019-07-11 02:02:44','2019-07-11 02:02:44',NULL,NULL,NULL),(168,5,'Caudal 0.6','string','2019-07-11 02:02:52','2019-07-11 02:02:52',NULL,NULL,NULL),(169,5,'Caudal descarga','string','2019-07-11 02:03:03','2019-07-11 02:03:03',NULL,NULL,NULL),(170,6,'Serie','string','2019-07-11 02:03:21','2019-07-11 02:03:21',NULL,NULL,NULL),(171,6,'Tipo','string','2019-07-11 02:03:28','2019-07-11 02:03:28',NULL,NULL,NULL),(172,6,'Descripción','string','2019-07-11 02:03:34','2019-07-11 02:03:34',NULL,NULL,NULL),(173,6,'Presión de trabajo','string','2019-07-11 02:03:40','2019-07-11 02:03:40',NULL,NULL,NULL),(174,7,'Serie','string','2019-07-11 02:04:02','2019-07-29 20:29:07',NULL,NULL,1),(175,7,'Tipo','string','2019-07-11 02:04:05','2019-07-11 02:04:05',NULL,NULL,NULL),(176,7,'Descripción','string','2019-07-11 02:04:11','2019-07-11 02:04:11',NULL,NULL,NULL),(177,7,'Presión de trabajo','string','2019-07-11 02:04:15','2019-07-11 02:04:15',NULL,NULL,NULL),(178,7,'Conexión','string','2019-07-11 02:04:21','2019-07-11 02:04:21',NULL,NULL,NULL),(179,7,'Poder filtrante (u)','string','2019-07-11 02:04:38','2019-07-11 02:04:38',NULL,NULL,NULL),(180,7,'Caudal (l/min)','string','2019-07-11 02:04:46','2019-07-11 02:04:46',NULL,NULL,NULL),(181,7,'Ensayo caudal','string','2019-07-11 02:04:59','2019-07-11 02:04:59',NULL,NULL,NULL),(182,8,'Serie','string','2019-07-11 02:05:53','2019-07-11 02:05:53',NULL,NULL,NULL),(183,8,'Tipo','string','2019-07-11 02:05:58','2019-07-11 02:05:58',NULL,NULL,NULL),(184,8,'Descripción','string','2019-07-11 02:06:02','2019-07-11 02:06:02',NULL,NULL,NULL),(185,8,'Presión de trabajo','string','2019-07-11 02:06:06','2019-07-11 02:06:06',NULL,NULL,NULL),(186,8,'Conexión','string','2019-07-11 02:06:09','2019-07-11 02:06:09',NULL,NULL,NULL),(187,8,'Tubo','string','2019-07-11 02:06:13','2019-07-11 02:06:13',NULL,NULL,NULL),(188,8,'Cantidad de tubos','string','2019-07-11 02:06:56','2019-07-11 02:06:56',NULL,NULL,NULL),(189,9,'Serie','string','2019-07-11 02:07:49','2019-07-11 02:07:49',NULL,NULL,NULL),(190,9,'Tipo','string','2019-07-11 02:08:15','2019-07-11 02:08:15',NULL,NULL,NULL),(191,9,'Descripción','string','2019-07-11 02:08:21','2019-07-11 02:08:21',NULL,NULL,NULL),(192,9,'Presión de trabajo','string','2019-07-11 02:08:26','2019-07-11 02:08:26',NULL,NULL,NULL),(193,9,'Diámetro','string','2019-07-11 02:08:32','2019-07-11 02:08:32',NULL,NULL,NULL),(194,9,'Conexiones','string','2019-07-11 02:08:46','2019-07-11 02:08:46',NULL,NULL,NULL),(195,10,'Serie','string','2019-07-11 02:09:02','2019-07-11 02:09:02',NULL,NULL,NULL),(196,10,'Tipo','string','2019-07-11 02:09:09','2019-07-11 02:09:09',NULL,NULL,NULL),(198,10,'Descripción','string','2019-07-11 02:09:14','2019-07-11 02:09:14',NULL,NULL,NULL),(199,10,'Potencia','string','2019-07-11 02:09:25','2019-07-11 02:09:25',NULL,NULL,NULL),(200,10,'Tensión','string','2019-07-11 02:09:35','2019-07-11 02:09:35',NULL,NULL,NULL),(201,10,'RPM','string','2019-07-11 02:09:40','2019-07-11 02:09:40',NULL,NULL,NULL),(202,10,'Torque Nom.','string','2019-07-11 02:09:48','2019-07-11 02:09:48',NULL,NULL,NULL),(203,10,'Torque Máx.','string','2019-07-11 02:10:02','2019-07-11 02:10:02',NULL,NULL,NULL),(204,10,'Carcasa','string','2019-07-11 02:10:10','2019-07-11 02:10:10',NULL,NULL,NULL),(205,10,'Eje','string','2019-07-11 02:10:15','2019-07-11 02:10:15',NULL,NULL,NULL),(206,10,'Comunicación','string','2019-07-11 02:10:50','2019-07-11 02:10:50',NULL,NULL,NULL),(207,10,'Resolución','string','2019-07-11 02:11:03','2019-07-11 02:11:03',NULL,NULL,NULL),(208,10,'Tamaño de display','string','2019-07-11 02:11:18','2019-07-11 02:11:18',NULL,NULL,NULL),(209,10,'Caracteristicas','string','2019-07-11 02:11:30','2019-07-11 02:11:30',NULL,NULL,NULL),(210,10,'Diámetro','string','2019-07-11 02:12:05','2019-07-11 02:12:05',NULL,NULL,NULL),(211,10,'Distancia nominal (mm)','string','2019-07-11 02:12:18','2019-07-11 02:12:18',NULL,NULL,NULL),(214,108,'Att test','string','2019-07-12 01:42:21','2019-07-30 05:19:04','a','s',1),(215,108,'Norma Mirco','string','2019-07-12 03:39:47','2019-08-09 02:00:05',NULL,NULL,1),(216,108,'Material','string','2019-07-24 22:19:57','2019-08-09 02:01:00','Materials',NULL,1),(217,108,'Voltaje','string','2019-07-24 22:29:32','2019-08-09 02:03:47','Voltage','Corriente',NULL);
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
INSERT INTO `categories` VALUES (1,NULL,'Cilindros','Cilinders','Cilindros','Cilindros',NULL,NULL,'cilindros.jpg',NULL,'2019-08-01 21:46:58'),(2,NULL,'Valvulas','Valves','Válvulas','Válvulas',NULL,NULL,'valvulas.jpg',NULL,'2019-08-01 21:47:36'),(3,NULL,'Estaciones de Valvulas',NULL,NULL,NULL,NULL,NULL,'estaciones_de_valvulas.jpg',NULL,'2019-08-01 21:47:58'),(4,NULL,'Valvulas auxiliares',NULL,NULL,NULL,NULL,NULL,'valvulas_auxiliares.jpg',NULL,'2019-08-01 21:48:21'),(5,NULL,'Equipos para vacio',NULL,NULL,NULL,NULL,NULL,'equipos_de_vacio.jpg',NULL,'2019-08-01 21:48:47'),(6,NULL,'Manipulacion y Equipos',NULL,NULL,NULL,NULL,NULL,'manipulacion.jpg',NULL,'2019-08-01 21:49:14'),(7,NULL,'Unidades FRL',NULL,NULL,NULL,NULL,NULL,'frl.jpg',NULL,'2019-08-01 21:49:26'),(8,NULL,'Conexiones',NULL,NULL,NULL,NULL,NULL,'conexiones.jpg',NULL,'2019-08-01 21:49:39'),(9,NULL,'Procesos','Processes','Processos',NULL,NULL,NULL,'procesos.jpg',NULL,'2019-08-01 21:49:57'),(10,NULL,'Automatizacion y control',NULL,NULL,NULL,NULL,NULL,'automatizacion_y_control.jpg',NULL,'2019-08-01 21:50:30'),(11,1,'Actuadores rotantes',NULL,NULL,'Actuadores rotantes',NULL,NULL,NULL,NULL,'2019-06-15 05:32:17'),(12,1,'Amortiguadores de choque',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1,'Cilindros compactos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,'Cilindros compactos con guia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1,'Cilindros de impacto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1,'Cilindros ISO15552 - VDMA 24562',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,'Cilindros sin vástago',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,1,'Controles hidráulicos de velocidad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,1,'Interruptores magnéticos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,1,'Microcilindros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,1,'Minicilindros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,2,'Electroválvulas piezoeléctricas y antiexplosivas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,2,'Electroválvulas serie pesada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,2,'Solenoides y accesorios',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,2,'Válvulas de seguridad para prensas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,2,'Válvulas direccionales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,2,'Valvulas ISO 5599/1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,2,'Válvulas manuales y mecánicas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,2,'Válvulas para fluidos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,3,'Estaciones de válvulas bus de campo AS-i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,3,'Estaciones de válvulas bus de campo DEVICENET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,3,'Estaciones de válvulas bus de campo PROFIBUS DP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,3,'Estaciones de válvulas MULTIPOLO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,3,'Estaciones de válvulas MULTIPOLO con salida lateral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,3,'Válvulas para estaciónes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,3,'Válvulas para estaciónes con salida lateral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,4,'Colectores ecológicos de escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,4,'Conexiones con funciones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,4,'Elementos de visualización',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,4,'Emisores de señal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,4,'Funciones lógicas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,4,'Módulos de seguridad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,4,'Módulos temporizados',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,4,'Reguladores de caudal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,4,'Reguladores de caudal en línea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,4,'Reguladores de escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,4,'Silenciadores de escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,4,'Válvulas de escape rápido',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,4,'Válvulas de no retorno (retención)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,5,'Accesorios elementos de fijación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,5,'Accesorios emisores de señal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,5,'Accesorios filtros de vacío',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,5,'Accesorios vacuómetros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,5,'Accesorios válvulas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,5,'Generadores de vacío',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,5,'Ventosas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,6,'Elementos de manipulación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,6,'Mesas rotantes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,7,'Accesorios y repuestos para unidades FRL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,7,'Amplificador de presión',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,7,'Bridas intermedias',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,7,'Drenaje automático temporizado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,7,'Drenajes para condensados',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,7,'Filtro de sustancias higroscopicas o depuradoras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,7,'Microfiltro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,7,'Módulo presostato',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,7,'Regulador de presión proporcional - Serie PIEZO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,7,'Regulador de presión proporcional - Serie SRE y CRE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,7,'Reguladores de intrumentación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,7,'Sensor de presión digital',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,7,'Unidad F de sustancias higroscopicas o depuradoras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,7,'Unidades F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,7,'Unidades F+R+L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,7,'Unidades FR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,7,'Unidades FR+L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,7,'Unidades L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,7,'Unidades R',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,7,'Unidades R comando a distancia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,7,'Unidades R para instrumentación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,7,'Válvulas de corte para candado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,7,'Válvulas de corte y descarga',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,7,'Válvulas de presurización progresiva',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,7,'Válvulas de presurización y descarga',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,8,'Accesorios de conexión',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,8,'Accesorios de conexión de acero inoxidable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,8,'Acoples rápidos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,8,'Conexiones instantáneas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,8,'Conexiones instantáneas con rosca cilíndrica',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,8,'Conexiones instantáneas con rosca cónica',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,8,'Conexiones instantáneas de acero inoxidable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,8,'Conexiones instantáneas de latón niquelado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,8,'Conexiones universales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,8,'Conexiones y mangueras para ambientes rigurosos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,8,'Pistolas para aire comprimido',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,8,'Tubos y mangueras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,9,'Industria de procesos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,10,'Fuentes reguladas de alimentación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,10,'Interfaz Hombre-máquina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,10,'PLC Controladores Lógicos Programables',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,10,'Sensores capacitivos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,10,'Sensores inductivos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,10,'Sensores optoelectrónicos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,10,'Servomotores y drivers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,10,'Variadores de frecuencia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,NULL,'Test','Test testing facility','Test testing facility','Test testing facility','Aca testeamos','Aca testeamos','valvulas.jpg','2019-07-12 01:37:00','2019-08-02 06:48:08'),(109,108,'Test sub 1','Test sub 1','Test sub 1','Test sub 1','Test sub 1','Test sub 1','Test sub 1','2019-07-12 01:37:28','2019-07-12 01:37:28'),(110,108,'Test sub 2','Test sub 2','Test sub 2','Test sub 2','Test sub 2','Test sub 2','Test sub 2','2019-07-12 01:37:41','2019-07-12 01:37:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (91,'FR_QBM1_G14_40U.stl',16963,'App\\Models440\\Product','2019-07-28 11:34:15','2019-07-28 11:34:15'),(92,'conector_testing.png',16962,'App\\Models440\\Product','2019-07-28 11:50:45','2019-07-28 11:50:45'),(93,'CN10_1350x900_72dpi.jpg',16963,'App\\Models440\\Product','2019-07-28 11:50:58','2019-07-28 11:50:58'),(107,'conector_testing2.png',16967,'App\\Models440\\Product','2019-07-31 04:15:46','2019-07-31 04:15:46'),(110,'CN10-32.dxf',16967,'App\\Models440\\Product','2019-08-02 01:17:19','2019-08-02 01:17:19'),(111,'FR_QBM1_G14_40U.stl',16967,'App\\Models440\\Product','2019-08-02 01:20:09','2019-08-02 01:20:09'),(114,'valvulas.jpg',16968,'App\\Models440\\Product','2019-08-02 06:48:47','2019-08-02 06:48:47'),(115,'FR_QBM1_G14_40U.stl',16971,'App\\Models440\\Product','2019-08-02 06:53:32','2019-08-02 06:53:32'),(117,'válvulas-para-fluidos_micro-automación (2).pdf',16962,'App\\Models440\\Product','2019-08-08 00:46:42','2019-08-08 00:46:42'),(120,'CN10-32.dxf',16962,'App\\Models440\\Product','2019-08-08 01:09:12','2019-08-08 01:09:12'),(121,'MiCRO_CN10_Ø32_30.zip',16962,'App\\Models440\\Product','2019-08-08 01:27:09','2019-08-08 01:27:09'),(122,'válvulas-para-fluidos_micro-automación (2).pdf',16968,'App\\Models440\\Product','2019-08-09 01:32:28','2019-08-09 01:32:28'),(123,'FR_QBM1_G14_40U.zip',16968,'App\\Models440\\Product','2019-08-09 01:32:28','2019-08-09 01:32:28'),(124,'CN10-32.dxf',16968,'App\\Models440\\Product','2019-08-09 01:32:29','2019-08-09 01:32:29'),(125,'CN10_1350x900_72dpi.jpg',16969,'App\\Models440\\Product','2019-08-09 01:42:25','2019-08-09 01:42:25'),(126,'manipulacion.jpg',16970,'App\\Models440\\Product','2019-08-09 01:51:18','2019-08-09 01:51:18'),(127,'cilindros.jpg',16971,'App\\Models440\\Product','2019-08-09 01:55:28','2019-08-09 01:55:28');
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
INSERT INTO `password_resets` VALUES ('guidoaimar@gmail.com','$2y$10$lR7aXmdWjT781hNL2aKv1Ofm5U7Kkq.aQGP8LooHoheZ.zKj4lKGC','2019-07-25 23:30:33');
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `has_image` tinyint(1) DEFAULT NULL,
  `has_pdf` tinyint(1) DEFAULT NULL,
  `has_cad_2d` tinyint(1) DEFAULT NULL,
  `has_cad_3d` tinyint(1) DEFAULT NULL,
  `has_zip` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16972 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (16962,109,'Español','Ingles','Portugues','123','123','123','123','123','123','2019-07-28 07:21:52','2019-08-08 01:41:47',1,1,1,NULL,1),(16963,109,'Test Español','Test Ingles','Test Portugues','Aca va la descripcion en español','Aca va la descripcion en ingles','Aca va la descripcion en portugues','123','1.1.1.1',NULL,'2019-07-28 08:40:21','2019-08-09 02:05:14',1,NULL,NULL,1,NULL),(16966,110,'RE TEST','RE TEST','RE TEST','tree','tree','terere','1412415','52454',NULL,'2019-07-29 19:59:21','2019-08-09 02:09:48',NULL,NULL,NULL,NULL,NULL),(16967,109,'Partes ES','Partes EN','Partes PT','Lorem Lorem','Lorem Lorem','Lorem Lorem','123','123',NULL,'2019-07-30 07:50:20','2019-08-09 02:07:08',1,NULL,1,1,NULL),(16968,109,'Valvulas ES','Valvulas EN','Valvulas PT','DESC ES','DESC EN','DESC PT','111','1.1.13',NULL,'2019-07-30 07:50:32','2019-08-09 02:09:09',1,1,1,NULL,1),(16969,11,'cil es','cil en','cil pt','descripcion cil 1 en es','descripcion cil 1 en en','descripcion cil 1 en pt','123.123.0.0.1','1.1.1.1',NULL,'2019-07-31 00:32:26','2019-08-09 02:48:24',1,NULL,NULL,NULL,NULL),(16970,11,'Actuadores rotantes AR','Actuadores rotantes US','Actuadores rotantes PT','actuadores nuevos','actuadores nuevos','actuadores nuevos','12.25.65','1.1.1.3',NULL,'2019-07-31 00:32:50','2019-08-09 01:51:18',1,NULL,NULL,NULL,NULL),(16971,11,'Actuadores AR','Actuadores US','Actuadores PT','La descripción del producto en español','La descripción del producto en ingles','La descripción del producto en portugues','1.11.333','1.1.1.2',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50',1,NULL,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=52260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` VALUES (52166,16962,214,'Test1',NULL,'2019-07-28 07:21:53','2019-08-09 02:03:28'),(52167,16962,215,'Norma 2019',NULL,'2019-07-28 07:21:53','2019-08-09 02:03:28'),(52168,16962,216,'Plastico',NULL,'2019-07-28 07:21:53','2019-08-09 02:03:28'),(52169,16962,217,'220V',NULL,'2019-07-28 07:21:53','2019-08-09 02:03:28'),(52174,16963,214,'Test2',NULL,'2019-07-28 08:40:22','2019-08-09 02:05:14'),(52175,16963,215,'Norma 2018',NULL,'2019-07-28 08:40:22','2019-08-09 02:05:14'),(52176,16963,216,'Metal',NULL,'2019-07-28 08:40:22','2019-08-09 02:05:26'),(52177,16963,217,'110V',NULL,'2019-07-28 08:40:22','2019-08-09 02:05:26'),(52198,16966,214,'Test2',NULL,'2019-07-29 19:59:21','2019-08-09 02:09:48'),(52199,16966,215,'Norma 2018',NULL,'2019-07-29 19:59:22','2019-08-09 02:10:03'),(52200,16966,216,'Plastico',NULL,'2019-07-29 19:59:22','2019-08-09 02:10:03'),(52201,16966,217,'220V',NULL,'2019-07-29 19:59:22','2019-08-09 02:10:03'),(52202,16967,214,'Test3',NULL,'2019-07-30 07:50:20','2019-08-09 02:07:08'),(52203,16967,215,'Norma 2019',NULL,'2019-07-30 07:50:20','2019-08-09 02:07:08'),(52204,16967,216,'Plastico',NULL,'2019-07-30 07:50:20','2019-08-09 02:07:08'),(52205,16967,217,'220V',NULL,'2019-07-30 07:50:20','2019-08-09 02:07:08'),(52206,16968,214,'Test2',NULL,'2019-07-30 07:50:32','2019-08-09 02:09:09'),(52207,16968,215,'Norma 2019',NULL,'2019-07-30 07:50:32','2019-08-09 02:09:09'),(52208,16968,216,'Metal',NULL,'2019-07-30 07:50:32','2019-08-09 02:09:09'),(52209,16968,217,'110V',NULL,'2019-07-30 07:50:32','2019-08-09 02:09:09'),(52211,16969,113,'Profesional',NULL,'2019-07-31 00:32:26','2019-08-09 01:45:56'),(52212,16969,114,'Cilindro de la serieu nueva de 10cm de recorrido',NULL,'2019-07-31 00:32:26','2019-08-09 01:45:56'),(52213,16969,115,'Iso 9001',NULL,'2019-07-31 00:32:26','2019-08-09 01:45:56'),(52214,16969,116,'ISO',NULL,'2019-07-31 00:32:26','2019-08-09 01:45:56'),(52215,16969,117,'5cm',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52216,16969,118,'30cm',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52217,16969,119,'Doble Efecto',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52218,16969,120,'con resorte',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52219,16969,121,'Con iman',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52220,16969,122,'con amort.',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52221,16969,123,'1 vastago',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52222,16969,124,'1 piston',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52223,16969,125,'20Nm',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52224,16969,126,'Si',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52225,16969,127,'rosca fina',NULL,'2019-07-31 00:32:27','2019-08-09 01:45:56'),(52227,16970,113,'Clasico',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52229,16970,115,'Iso 9002',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52230,16970,116,'IRAM',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52231,16970,117,'20cm',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52232,16970,118,'50cm',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52233,16970,119,'Triple',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52234,16970,120,'Blando',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52235,16970,121,'sin iman',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52236,16970,122,'sin amortiguador',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52237,16970,123,'2 vastagos',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52238,16970,124,'2 pistones',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52239,16970,125,'20Nm',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52240,16970,126,'si',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52241,16970,127,'gruesa',NULL,'2019-07-31 00:32:51','2019-08-09 01:50:05'),(52242,16971,112,'MD20',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52243,16971,113,'Modelos 2020',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52245,16971,115,'Iso 9001',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52246,16971,116,'IRAM',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52247,16971,117,'20cm',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52248,16971,118,'60cm',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52249,16971,119,'Doble Efecto',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52250,16971,120,'con resorte',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52251,16971,122,'con amort.',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52252,16971,123,'1 vastago',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52253,16971,124,'2 pistones',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52254,16971,125,'30Nm',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52255,16971,126,'Ajuste fino',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52256,16971,127,'rosca fina',NULL,'2019-07-31 00:33:36','2019-08-09 01:58:50'),(52257,16971,121,'sin iman',NULL,'2019-08-09 01:58:50','2019-08-09 01:58:50'),(52259,16970,112,'Modelo 2019',NULL,'2019-08-09 03:00:37','2019-08-09 03:00:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=33821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_in_countries`
--

LOCK TABLES `products_in_countries` WRITE;
/*!40000 ALTER TABLE `products_in_countries` DISABLE KEYS */;
INSERT INTO `products_in_countries` VALUES (33791,16962,1,'2019-07-28 07:21:52','2019-07-28 07:21:52'),(33792,16962,2,'2019-07-28 07:21:52','2019-07-28 07:21:52'),(33793,16962,3,'2019-07-28 07:21:53','2019-07-28 07:21:53'),(33794,16963,1,'2019-07-28 08:40:21','2019-07-28 08:40:21'),(33795,16963,2,'2019-07-28 08:40:21','2019-07-28 08:40:21'),(33796,16963,3,'2019-07-28 08:40:21','2019-07-28 08:40:21'),(33803,16966,1,'2019-07-29 19:59:21','2019-07-29 19:59:21'),(33804,16966,2,'2019-07-29 19:59:21','2019-07-29 19:59:21'),(33805,16966,3,'2019-07-29 19:59:21','2019-07-29 19:59:21'),(33806,16967,1,'2019-07-30 07:50:20','2019-07-30 07:50:20'),(33807,16967,2,'2019-07-30 07:50:20','2019-07-30 07:50:20'),(33808,16967,3,'2019-07-30 07:50:20','2019-07-30 07:50:20'),(33809,16968,1,'2019-07-30 07:50:32','2019-07-30 07:50:32'),(33810,16968,2,'2019-07-30 07:50:32','2019-07-30 07:50:32'),(33811,16968,3,'2019-07-30 07:50:32','2019-07-30 07:50:32'),(33812,16969,1,'2019-07-31 00:32:26','2019-07-31 00:32:26'),(33813,16969,2,'2019-07-31 00:32:26','2019-07-31 00:32:26'),(33814,16969,3,'2019-07-31 00:32:26','2019-07-31 00:32:26'),(33815,16970,1,'2019-07-31 00:32:50','2019-07-31 00:32:50'),(33816,16970,2,'2019-07-31 00:32:51','2019-07-31 00:32:51'),(33817,16970,3,'2019-07-31 00:32:51','2019-07-31 00:32:51'),(33818,16971,1,'2019-07-31 00:33:36','2019-07-31 00:33:36'),(33819,16971,2,'2019-07-31 00:33:36','2019-07-31 00:33:36'),(33820,16971,3,'2019-07-31 00:33:36','2019-07-31 00:33:36');
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

-- Dump completed on 2019-08-08 21:14:12
