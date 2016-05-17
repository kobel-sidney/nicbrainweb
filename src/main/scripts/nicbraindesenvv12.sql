CREATE DATABASE  IF NOT EXISTS `nicbraindesenvv12` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nicbraindesenvv12`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: nicbraindesenvv12
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `agendamento_rastreamento_usuario`
--

DROP TABLE IF EXISTS `agendamento_rastreamento_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agendamento_rastreamento_usuario` (
  `id_agn_rast_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `data_fim_rastreamento` datetime NOT NULL,
  `data_inicio_rastreamento` datetime NOT NULL,
  `intervalo_rastreamento` int(11) NOT NULL,
  `rastreamento_por_rota` tinyint(1) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_agn_rast_usuario`),
  KEY `FK_e47jofrrwp7u01x3if1ererkn` (`id_usuario`),
  CONSTRAINT `FK_e47jofrrwp7u01x3if1ererkn` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento_rastreamento_usuario`
--

LOCK TABLES `agendamento_rastreamento_usuario` WRITE;
/*!40000 ALTER TABLE `agendamento_rastreamento_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamento_rastreamento_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamento_rastreamento_veiculo`
--

DROP TABLE IF EXISTS `agendamento_rastreamento_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agendamento_rastreamento_veiculo` (
  `id_agn_rast_veiculo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `data_fim_rastreamento` datetime NOT NULL,
  `data_inicio_rastreamento` datetime NOT NULL,
  `intervalo_rastreamento` int(11) NOT NULL,
  `id_veiculo` bigint(20) NOT NULL,
  PRIMARY KEY (`id_agn_rast_veiculo`),
  KEY `FK_j7mcefwvybbr5mvl2teg16mnr` (`id_veiculo`),
  CONSTRAINT `FK_j7mcefwvybbr5mvl2teg16mnr` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento_rastreamento_veiculo`
--

LOCK TABLES `agendamento_rastreamento_veiculo` WRITE;
/*!40000 ALTER TABLE `agendamento_rastreamento_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamento_rastreamento_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `id_atividade` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `campo_check` tinyint(1) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_fim_previsto` datetime DEFAULT NULL,
  `data_fim_realizado` datetime DEFAULT NULL,
  `data_inicio_previsto` datetime DEFAULT NULL,
  `data_inicio_realizado` datetime DEFAULT NULL,
  `descricao_atividade` varchar(255) DEFAULT NULL,
  `distancia_limite` int(11) DEFAULT NULL,
  `nome_atividade` varchar(255) NOT NULL,
  `nr_item` int(11) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `tempo_exec_estimado` int(11) NOT NULL,
  `tempo_toler_antec` int(11) DEFAULT NULL,
  `tempo_toler_fim` int(11) NOT NULL,
  `tempo_toler_inicio` int(11) NOT NULL,
  `id_checklist` bigint(20) DEFAULT NULL,
  `id_formulario` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) NOT NULL,
  `id_usuario_responsavel` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `FK_qfa3vc89b8am1hcpbytck7vs2` (`id_checklist`),
  KEY `FK_3mo7s4ebvjpkgqwgk4g0vpd8q` (`id_formulario`),
  KEY `FK_mhetj8gdkkau5mq5trcbirgu0` (`id_status`),
  KEY `FK_rvnnwb2mx8ulb0hm4u3skfrxr` (`id_usuario_responsavel`),
  CONSTRAINT `FK_rvnnwb2mx8ulb0hm4u3skfrxr` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_3mo7s4ebvjpkgqwgk4g0vpd8q` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id_formulario`),
  CONSTRAINT `FK_mhetj8gdkkau5mq5trcbirgu0` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_qfa3vc89b8am1hcpbytck7vs2` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id_checklist`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
INSERT INTO `atividade` VALUES (1,1,0,NULL,NULL,'2014-11-12 09:10:00',NULL,'2014-11-12 09:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,1,NULL,1,7),(2,1,0,NULL,NULL,'2014-11-12 10:00:00',NULL,'2014-11-12 09:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,1,NULL,1,7),(3,1,0,NULL,NULL,'2014-11-12 22:00:00',NULL,'2014-11-12 10:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,1,NULL,1,7),(4,1,0,NULL,NULL,'2014-11-12 11:10:00',NULL,'2014-11-12 11:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,1,NULL,1,7),(5,1,0,NULL,NULL,'2014-11-12 13:00:00',NULL,'2014-11-12 11:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,1,NULL,1,7),(6,1,0,NULL,NULL,'2014-11-13 05:10:00',NULL,'2014-11-13 05:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,2,NULL,1,7),(7,1,0,NULL,NULL,'2014-11-13 06:00:00',NULL,'2014-11-13 05:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,2,NULL,1,7),(8,1,0,NULL,NULL,'2014-11-13 18:00:00',NULL,'2014-11-13 06:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,2,NULL,1,7),(9,1,0,NULL,NULL,'2014-11-13 07:10:00',NULL,'2014-11-13 07:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,2,NULL,1,7),(10,1,0,NULL,NULL,'2014-11-13 09:00:00',NULL,'2014-11-13 07:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,2,NULL,1,7),(11,1,0,NULL,NULL,'2014-11-13 08:10:00',NULL,'2014-11-13 08:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,3,NULL,1,7),(12,1,0,NULL,NULL,'2014-11-13 09:00:00',NULL,'2014-11-13 08:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,3,NULL,1,7),(13,1,0,NULL,NULL,'2014-11-13 21:00:00',NULL,'2014-11-13 09:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,3,NULL,1,7),(14,1,0,NULL,NULL,'2014-11-13 10:10:00',NULL,'2014-11-13 10:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,3,NULL,1,7),(15,1,0,NULL,NULL,'2014-11-13 12:00:00',NULL,'2014-11-13 10:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,3,NULL,1,7),(16,1,0,NULL,NULL,'2014-11-13 11:10:00',NULL,'2014-11-13 11:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,4,NULL,1,7),(17,1,0,NULL,NULL,'2014-11-13 12:00:00',NULL,'2014-11-13 11:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,4,NULL,1,7),(18,1,0,NULL,NULL,'2014-11-15 00:00:00',NULL,'2014-11-13 12:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,4,NULL,1,7),(19,1,0,NULL,NULL,'2014-11-13 13:10:00',NULL,'2014-11-13 13:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,4,NULL,1,7),(20,1,0,NULL,NULL,'2014-11-13 15:00:00',NULL,'2014-11-13 13:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,4,NULL,1,7),(21,1,0,NULL,NULL,'2014-11-22 05:10:00',NULL,'2014-11-22 05:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,5,NULL,1,7),(22,1,0,NULL,NULL,'2014-11-22 06:00:00',NULL,'2014-11-22 05:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,5,NULL,1,7),(23,1,0,NULL,NULL,'2014-11-22 18:00:00',NULL,'2014-11-22 06:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,5,NULL,1,7),(24,1,0,NULL,NULL,'2014-11-22 07:10:00',NULL,'2014-11-22 07:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,5,NULL,1,7),(25,1,0,NULL,NULL,'2014-11-22 09:00:00',NULL,'2014-11-22 07:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,5,NULL,1,7),(26,1,0,NULL,NULL,'2014-11-22 08:10:00',NULL,'2014-11-22 08:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,6,NULL,1,7),(27,1,0,NULL,NULL,'2014-11-22 09:00:00',NULL,'2014-11-22 08:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,6,NULL,1,7),(28,1,0,NULL,NULL,'2014-11-22 21:00:00',NULL,'2014-11-22 09:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,6,NULL,1,7),(29,1,0,NULL,NULL,'2014-11-22 10:10:00',NULL,'2014-11-22 10:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,6,NULL,1,7),(30,1,0,NULL,NULL,'2014-11-22 12:00:00',NULL,'2014-11-22 10:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,6,NULL,1,7),(31,1,0,NULL,NULL,'2014-11-22 11:10:00',NULL,'2014-11-22 11:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,7,NULL,1,7),(32,1,0,NULL,NULL,'2014-11-22 12:00:00',NULL,'2014-11-22 11:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,7,NULL,1,7),(33,1,0,NULL,NULL,'2014-11-23 00:00:00',NULL,'2014-11-22 12:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,7,NULL,1,7),(34,1,0,NULL,NULL,'2014-11-22 13:10:00',NULL,'2014-11-22 13:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,7,NULL,1,7),(35,1,0,NULL,NULL,'2014-11-22 15:00:00',NULL,'2014-11-22 13:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,7,NULL,1,7),(36,1,0,NULL,NULL,'2014-11-22 14:10:00',NULL,'2014-11-22 14:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,8,NULL,1,7),(37,1,0,NULL,NULL,'2014-11-22 15:00:00',NULL,'2014-11-22 14:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,8,NULL,1,7),(38,1,0,NULL,NULL,'2014-11-23 03:00:00',NULL,'2014-11-22 15:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,8,NULL,1,7),(39,1,0,NULL,NULL,'2014-11-22 16:10:00',NULL,'2014-11-22 16:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,8,NULL,1,7),(40,1,0,NULL,NULL,'2014-11-22 18:00:00',NULL,'2014-11-22 16:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,8,NULL,1,7),(41,1,0,NULL,NULL,'2014-11-22 05:10:00',NULL,'2014-11-22 05:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,9,NULL,1,7),(42,1,0,NULL,NULL,'2014-11-22 06:00:00',NULL,'2014-11-22 05:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,9,NULL,1,7),(43,1,0,NULL,NULL,'2014-11-22 18:00:00',NULL,'2014-11-22 06:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,9,NULL,1,7),(44,1,0,NULL,NULL,'2014-11-22 07:10:00',NULL,'2014-11-22 07:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,9,NULL,1,7),(45,1,0,NULL,NULL,'2014-11-22 09:00:00',NULL,'2014-11-22 07:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,9,NULL,1,7),(46,1,0,NULL,NULL,'2014-11-22 08:10:00',NULL,'2014-11-22 08:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,10,NULL,1,7),(47,1,0,NULL,NULL,'2014-11-22 09:00:00',NULL,'2014-11-22 08:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,10,NULL,1,7),(48,1,0,NULL,NULL,'2014-11-22 21:00:00',NULL,'2014-11-22 09:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,10,NULL,1,7),(49,1,0,NULL,NULL,'2014-11-22 10:10:00',NULL,'2014-11-22 10:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,10,NULL,1,7),(50,1,0,NULL,NULL,'2014-11-22 12:00:00',NULL,'2014-11-22 10:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,10,NULL,1,7),(51,1,0,NULL,NULL,'2014-11-22 11:10:00',NULL,'2014-11-22 11:00:00',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',NULL,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',1,NULL,10,5,5,5,11,NULL,1,7),(52,1,0,NULL,NULL,'2014-11-22 12:00:00',NULL,'2014-11-22 11:00:00',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',NULL,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',2,NULL,60,5,5,5,11,NULL,1,7),(53,1,0,NULL,NULL,'2014-11-23 00:00:00',NULL,'2014-11-22 12:00:00',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',NULL,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',3,NULL,720,5,5,5,11,NULL,1,7),(54,1,0,NULL,NULL,'2014-11-22 13:10:00',NULL,'2014-11-22 13:00:00',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',NULL,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',4,NULL,10,5,5,5,11,NULL,1,7),(55,1,0,NULL,NULL,'2014-11-22 15:00:00',NULL,'2014-11-22 13:00:00',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',NULL,'Varredura antibombas (VVIP, √°rbitros, vesti√°rio das delega√ß√µes e campo)',5,NULL,120,5,5,5,11,NULL,1,7),(56,1,1,'-23.584511','-46.729257','2014-11-22 09:30:00',NULL,'2014-11-22 09:00:00',NULL,'Posto de ronda 1',NULL,'Posto de ronda 1',1,NULL,30,5,5,5,12,NULL,1,12),(57,1,1,'-23.585511','-46.729957','2014-11-22 10:00:00',NULL,'2014-11-22 09:31:00',NULL,'Posto de ronda 2',NULL,'Posto de ronda 2',2,NULL,30,5,5,5,12,NULL,1,12),(58,1,1,'-23.586511','-46.731957','2014-11-22 10:30:00',NULL,'2014-11-22 10:01:00',NULL,'Posto de ronda 3',NULL,'Posto de ronda 3',3,NULL,30,5,5,5,12,NULL,1,12),(59,1,1,'-23.587511','-46.732957','2014-11-22 11:00:00',NULL,'2014-11-22 10:31:00',NULL,'Posto de ronda 4',NULL,'Posto de ronda 4',4,NULL,30,5,5,5,12,NULL,1,12),(60,1,1,'-23.584511','-46.729257','2014-11-22 15:30:00',NULL,'2014-11-22 15:00:00',NULL,'Posto de ronda 1',NULL,'Posto de ronda 1',1,NULL,30,5,5,5,12,NULL,1,12),(61,1,1,'-23.585511','-46.729957','2014-11-22 16:00:00',NULL,'2014-11-22 15:31:00',NULL,'Posto de ronda 2',NULL,'Posto de ronda 2',2,NULL,30,5,5,5,12,NULL,1,12),(62,1,1,'-23.586511','-46.731957','2014-11-22 16:30:00',NULL,'2014-11-22 16:01:00',NULL,'Posto de ronda 3',NULL,'Posto de ronda 3',3,NULL,30,5,5,5,12,NULL,1,12),(63,1,1,'-23.587511','-46.732957','2014-11-22 17:00:00',NULL,'2014-11-22 16:31:00',NULL,'Posto de ronda 4',NULL,'Posto de ronda 4',4,NULL,30,5,5,5,12,NULL,1,12),(64,1,1,'-23.658226','-46.533063','2014-11-01 15:30:00',NULL,'2014-11-01 15:00:00',NULL,'Posto de ronda 1',NULL,'Posto de ronda 1',1,NULL,30,5,5,5,13,NULL,1,7),(65,1,1,'-23.659226','-46.534063','2014-11-01 16:00:00',NULL,'2014-11-01 15:31:00',NULL,'Posto de ronda 2',NULL,'Posto de ronda 2',2,NULL,30,5,5,5,13,NULL,1,7),(66,1,1,'-23.660226','-46.535063','2014-11-01 16:30:00',NULL,'2014-11-01 16:01:00',NULL,'Posto de ronda 3',NULL,'Posto de ronda 3',3,NULL,30,5,5,5,13,NULL,1,7),(67,1,1,'-23.661226','-46.536063','2014-11-01 17:00:00',NULL,'2014-11-01 16:31:00',NULL,'Posto de ronda 4',NULL,'Posto de ronda 4',4,NULL,30,5,5,5,13,NULL,1,7);
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_comentario`
--

DROP TABLE IF EXISTS `atividade_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_comentario` (
  `id_atividade_comentario` bigint(20) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) NOT NULL,
  `data_comentario` datetime NOT NULL,
  `id_atividade` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_atividade_comentario`),
  KEY `FK_84fxvuxrdwotymkpb75qj9uoo` (`id_atividade`),
  KEY `FK_995vpqec2wyebbwmtdk7ss1tw` (`id_usuario`),
  CONSTRAINT `FK_995vpqec2wyebbwmtdk7ss1tw` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_84fxvuxrdwotymkpb75qj9uoo` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_comentario`
--

LOCK TABLES `atividade_comentario` WRITE;
/*!40000 ALTER TABLE `atividade_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_mensagem`
--

DROP TABLE IF EXISTS `atividade_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_mensagem` (
  `id_atv_mgs` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `data_envio` datetime DEFAULT NULL,
  `tempo_escala` int(11) NOT NULL,
  `id_atividade` bigint(20) DEFAULT NULL,
  `id_mensagem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_atv_mgs`),
  KEY `FK_bu5gubd83ds2csux6ldnfwgjm` (`id_atividade`),
  KEY `FK_lj6umwnftsot6laaa9u06smdi` (`id_mensagem`),
  CONSTRAINT `FK_lj6umwnftsot6laaa9u06smdi` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`),
  CONSTRAINT `FK_bu5gubd83ds2csux6ldnfwgjm` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_mensagem`
--

LOCK TABLES `atividade_mensagem` WRITE;
/*!40000 ALTER TABLE `atividade_mensagem` DISABLE KEYS */;
INSERT INTO `atividade_mensagem` VALUES (1,1,'2015-01-29 15:49:00',1,1,12),(2,1,NULL,1,1,13),(3,1,NULL,1,1,14),(4,1,'2015-01-29 15:48:20',1,1,15),(5,1,NULL,1,1,16),(6,1,NULL,1,1,17),(7,1,'2015-01-29 15:49:00',1,2,12),(8,1,NULL,1,2,13),(9,1,NULL,1,2,14),(10,1,'2015-01-29 15:48:20',1,2,15),(11,1,NULL,1,2,16),(12,1,NULL,1,2,17),(13,1,'2015-01-29 15:49:00',1,3,12),(14,1,NULL,1,3,13),(15,1,NULL,1,3,14),(16,1,'2015-01-29 15:48:20',1,3,15),(17,1,NULL,1,3,16),(18,1,NULL,1,3,17),(19,1,'2015-01-29 15:49:00',1,4,12),(20,1,NULL,1,4,13),(21,1,NULL,1,4,14),(22,1,'2015-01-29 15:48:20',1,4,15),(23,1,NULL,1,4,16),(24,1,NULL,1,4,17),(25,1,'2015-01-29 15:49:00',1,5,12),(26,1,NULL,1,5,13),(27,1,NULL,1,5,14),(28,1,'2015-01-29 15:48:20',1,5,15),(29,1,NULL,1,5,16),(30,1,NULL,1,5,17),(31,1,'2015-01-29 15:49:00',1,6,12),(32,1,NULL,1,6,13),(33,1,NULL,1,6,14),(34,1,'2015-01-29 15:48:20',1,6,15),(35,1,NULL,1,6,16),(36,1,NULL,1,6,17),(37,1,'2015-01-29 15:49:00',1,7,12),(38,1,NULL,1,7,13),(39,1,NULL,1,7,14),(40,1,'2015-01-29 15:48:20',1,7,15),(41,1,NULL,1,7,16),(42,1,NULL,1,7,17),(43,1,'2015-01-29 15:49:00',1,8,12),(44,1,NULL,1,8,13),(45,1,NULL,1,8,14),(46,1,'2015-01-29 15:48:20',1,8,15),(47,1,NULL,1,8,16),(48,1,NULL,1,8,17),(49,1,'2015-01-29 15:49:00',1,9,12),(50,1,NULL,1,9,13),(51,1,NULL,1,9,14),(52,1,'2015-01-29 15:48:20',1,9,15),(53,1,NULL,1,9,16),(54,1,NULL,1,9,17),(55,1,'2015-01-29 15:49:00',1,10,12),(56,1,NULL,1,10,13),(57,1,NULL,1,10,14),(58,1,'2015-01-29 15:48:20',1,10,15),(59,1,NULL,1,10,16),(60,1,NULL,1,10,17),(61,1,'2015-01-29 15:49:00',1,11,12),(62,1,NULL,1,11,13),(63,1,NULL,1,11,14),(64,1,'2015-01-29 15:48:20',1,11,15),(65,1,NULL,1,11,16),(66,1,NULL,1,11,17),(67,1,'2015-01-29 15:49:00',1,12,12),(68,1,NULL,1,12,13),(69,1,NULL,1,12,14),(70,1,'2015-01-29 15:48:20',1,12,15),(71,1,NULL,1,12,16),(72,1,NULL,1,12,17),(73,1,'2015-01-29 15:49:00',1,13,12),(74,1,NULL,1,13,13),(75,1,NULL,1,13,14),(76,1,'2015-01-29 15:48:20',1,13,15),(77,1,NULL,1,13,16),(78,1,NULL,1,13,17),(79,1,'2015-01-29 15:49:00',1,14,12),(80,1,NULL,1,14,13),(81,1,NULL,1,14,14),(82,1,'2015-01-29 15:48:20',1,14,15),(83,1,NULL,1,14,16),(84,1,NULL,1,14,17),(85,1,'2015-01-29 15:49:00',1,15,12),(86,1,NULL,1,15,13),(87,1,NULL,1,15,14),(88,1,'2015-01-29 15:48:20',1,15,15),(89,1,NULL,1,15,16),(90,1,NULL,1,15,17),(91,1,'2015-01-29 15:49:00',1,16,12),(92,1,NULL,1,16,13),(93,1,NULL,1,16,14),(94,1,'2015-01-29 15:48:20',1,16,15),(95,1,NULL,1,16,16),(96,1,NULL,1,16,17),(97,1,'2015-01-29 15:49:00',1,17,12),(98,1,NULL,1,17,13),(99,1,NULL,1,17,14),(100,1,'2015-01-29 15:48:20',1,17,15),(101,1,NULL,1,17,16),(102,1,NULL,1,17,17),(103,1,'2015-01-29 15:49:00',1,18,12),(104,1,NULL,1,18,13),(105,1,NULL,1,18,14),(106,1,'2015-01-29 15:48:20',1,18,15),(107,1,NULL,1,18,16),(108,1,NULL,1,18,17),(109,1,'2015-01-29 15:49:00',1,19,12),(110,1,NULL,1,19,13),(111,1,NULL,1,19,14),(112,1,'2015-01-29 15:48:20',1,19,15),(113,1,NULL,1,19,16),(114,1,NULL,1,19,17),(115,1,'2015-01-29 15:49:00',1,20,12),(116,1,NULL,1,20,13),(117,1,NULL,1,20,14),(118,1,'2015-01-29 15:48:20',1,20,15),(119,1,NULL,1,20,16),(120,1,NULL,1,20,17),(121,1,'2015-01-29 15:49:00',1,21,12),(122,1,NULL,1,21,13),(123,1,NULL,1,21,14),(124,1,'2015-01-29 15:48:20',1,21,15),(125,1,NULL,1,21,16),(126,1,NULL,1,21,17),(127,1,'2015-01-29 15:49:00',1,22,12),(128,1,NULL,1,22,13),(129,1,NULL,1,22,14),(130,1,'2015-01-29 15:48:20',1,22,15),(131,1,NULL,1,22,16),(132,1,NULL,1,22,17),(133,1,'2015-01-29 15:49:00',1,23,12),(134,1,NULL,1,23,13),(135,1,NULL,1,23,14),(136,1,'2015-01-29 15:48:20',1,23,15),(137,1,NULL,1,23,16),(138,1,NULL,1,23,17),(139,1,'2015-01-29 15:49:00',1,24,12),(140,1,NULL,1,24,13),(141,1,NULL,1,24,14),(142,1,'2015-01-29 15:48:20',1,24,15),(143,1,NULL,1,24,16),(144,1,NULL,1,24,17),(145,1,'2015-01-29 15:49:00',1,25,12),(146,1,NULL,1,25,13),(147,1,NULL,1,25,14),(148,1,'2015-01-29 15:48:20',1,25,15),(149,1,NULL,1,25,16),(150,1,NULL,1,25,17),(151,1,'2015-01-29 15:49:00',1,26,12),(152,1,NULL,1,26,13),(153,1,NULL,1,26,14),(154,1,'2015-01-29 15:48:20',1,26,15),(155,1,NULL,1,26,16),(156,1,NULL,1,26,17),(157,1,'2015-01-29 15:49:00',1,27,12),(158,1,NULL,1,27,13),(159,1,NULL,1,27,14),(160,1,'2015-01-29 15:48:20',1,27,15),(161,1,NULL,1,27,16),(162,1,NULL,1,27,17),(163,1,'2015-01-29 15:49:00',1,28,12),(164,1,NULL,1,28,13),(165,1,NULL,1,28,14),(166,1,'2015-01-29 15:48:20',1,28,15),(167,1,NULL,1,28,16),(168,1,NULL,1,28,17),(169,1,'2015-01-29 15:49:00',1,29,12),(170,1,NULL,1,29,13),(171,1,NULL,1,29,14),(172,1,'2015-01-29 15:48:20',1,29,15),(173,1,NULL,1,29,16),(174,1,NULL,1,29,17),(175,1,'2015-01-29 15:49:00',1,30,12),(176,1,NULL,1,30,13),(177,1,NULL,1,30,14),(178,1,'2015-01-29 15:48:20',1,30,15),(179,1,NULL,1,30,16),(180,1,NULL,1,30,17),(181,1,'2015-01-29 15:49:00',1,31,12),(182,1,NULL,1,31,13),(183,1,NULL,1,31,14),(184,1,'2015-01-29 15:48:20',1,31,15),(185,1,NULL,1,31,16),(186,1,NULL,1,31,17),(187,1,'2015-01-29 15:49:00',1,32,12),(188,1,NULL,1,32,13),(189,1,NULL,1,32,14),(190,1,'2015-01-29 15:48:20',1,32,15),(191,1,NULL,1,32,16),(192,1,NULL,1,32,17),(193,1,'2015-01-29 15:49:00',1,33,12),(194,1,NULL,1,33,13),(195,1,NULL,1,33,14),(196,1,'2015-01-29 15:48:20',1,33,15),(197,1,NULL,1,33,16),(198,1,NULL,1,33,17),(199,1,'2015-01-29 15:49:00',1,34,12),(200,1,NULL,1,34,13),(201,1,NULL,1,34,14),(202,1,'2015-01-29 15:48:20',1,34,15),(203,1,NULL,1,34,16),(204,1,NULL,1,34,17),(205,1,'2015-01-29 15:49:00',1,35,12),(206,1,NULL,1,35,13),(207,1,NULL,1,35,14),(208,1,'2015-01-29 15:48:20',1,35,15),(209,1,NULL,1,35,16),(210,1,NULL,1,35,17),(211,1,'2015-01-29 15:49:00',1,36,12),(212,1,NULL,1,36,13),(213,1,NULL,1,36,14),(214,1,'2015-01-29 15:48:20',1,36,15),(215,1,NULL,1,36,16),(216,1,NULL,1,36,17),(217,1,'2015-01-29 15:49:00',1,37,12),(218,1,NULL,1,37,13),(219,1,NULL,1,37,14),(220,1,'2015-01-29 15:48:20',1,37,15),(221,1,NULL,1,37,16),(222,1,NULL,1,37,17),(223,1,'2015-01-29 15:49:00',1,38,12),(224,1,NULL,1,38,13),(225,1,NULL,1,38,14),(226,1,'2015-01-29 15:48:20',1,38,15),(227,1,NULL,1,38,16),(228,1,NULL,1,38,17),(229,1,'2015-01-29 15:49:00',1,39,12),(230,1,NULL,1,39,13),(231,1,NULL,1,39,14),(232,1,'2015-01-29 15:48:20',1,39,15),(233,1,NULL,1,39,16),(234,1,NULL,1,39,17),(235,1,'2015-01-29 15:49:00',1,40,12),(236,1,NULL,1,40,13),(237,1,NULL,1,40,14),(238,1,'2015-01-29 15:48:20',1,40,15),(239,1,NULL,1,40,16),(240,1,NULL,1,40,17),(241,1,'2015-01-29 15:49:00',1,41,12),(242,1,NULL,1,41,13),(243,1,NULL,1,41,14),(244,1,'2015-01-29 15:48:20',1,41,15),(245,1,NULL,1,41,16),(246,1,NULL,1,41,17),(247,1,'2015-01-29 15:49:00',1,42,12),(248,1,NULL,1,42,13),(249,1,NULL,1,42,14),(250,1,'2015-01-29 15:48:20',1,42,15),(251,1,NULL,1,42,16),(252,1,NULL,1,42,17),(253,1,'2015-01-29 15:49:00',1,43,12),(254,1,NULL,1,43,13),(255,1,NULL,1,43,14),(256,1,'2015-01-29 15:48:20',1,43,15),(257,1,NULL,1,43,16),(258,1,NULL,1,43,17),(259,1,'2015-01-29 15:49:00',1,44,12),(260,1,NULL,1,44,13),(261,1,NULL,1,44,14),(262,1,'2015-01-29 15:48:20',1,44,15),(263,1,NULL,1,44,16),(264,1,NULL,1,44,17),(265,1,'2015-01-29 15:49:00',1,45,12),(266,1,NULL,1,45,13),(267,1,NULL,1,45,14),(268,1,'2015-01-29 15:48:20',1,45,15),(269,1,NULL,1,45,16),(270,1,NULL,1,45,17),(271,1,'2015-01-29 15:49:00',1,46,12),(272,1,NULL,1,46,13),(273,1,NULL,1,46,14),(274,1,'2015-01-29 15:48:20',1,46,15),(275,1,NULL,1,46,16),(276,1,NULL,1,46,17),(277,1,'2015-01-29 15:49:00',1,47,12),(278,1,NULL,1,47,13),(279,1,NULL,1,47,14),(280,1,'2015-01-29 15:48:20',1,47,15),(281,1,NULL,1,47,16),(282,1,NULL,1,47,17),(283,1,'2015-01-29 15:49:00',1,48,12),(284,1,NULL,1,48,13),(285,1,NULL,1,48,14),(286,1,'2015-01-29 15:48:20',1,48,15),(287,1,NULL,1,48,16),(288,1,NULL,1,48,17),(289,1,'2015-01-29 15:49:00',1,49,12),(290,1,NULL,1,49,13),(291,1,NULL,1,49,14),(292,1,'2015-01-29 15:48:20',1,49,15),(293,1,NULL,1,49,16),(294,1,NULL,1,49,17),(295,1,'2015-01-29 15:49:00',1,50,12),(296,1,NULL,1,50,13),(297,1,NULL,1,50,14),(298,1,'2015-01-29 15:48:20',1,50,15),(299,1,NULL,1,50,16),(300,1,NULL,1,50,17),(301,1,'2015-01-29 15:49:00',1,51,12),(302,1,NULL,1,51,13),(303,1,NULL,1,51,14),(304,1,'2015-01-29 15:48:20',1,51,15),(305,1,NULL,1,51,16),(306,1,NULL,1,51,17),(307,1,'2015-01-29 15:49:00',1,52,12),(308,1,NULL,1,52,13),(309,1,NULL,1,52,14),(310,1,'2015-01-29 15:48:20',1,52,15),(311,1,NULL,1,52,16),(312,1,NULL,1,52,17),(313,1,'2015-01-29 15:49:00',1,53,12),(314,1,NULL,1,53,13),(315,1,NULL,1,53,14),(316,1,'2015-01-29 15:48:20',1,53,15),(317,1,NULL,1,53,16),(318,1,NULL,1,53,17),(319,1,'2015-01-29 15:49:00',1,54,12),(320,1,NULL,1,54,13),(321,1,NULL,1,54,14),(322,1,'2015-01-29 15:48:20',1,54,15),(323,1,NULL,1,54,16),(324,1,NULL,1,54,17),(325,1,'2015-01-29 15:49:00',1,55,12),(326,1,NULL,1,55,13),(327,1,NULL,1,55,14),(328,1,'2015-01-29 15:48:20',1,55,15),(329,1,NULL,1,55,16),(330,1,NULL,1,55,17),(331,1,'2015-01-29 15:49:00',1,56,12),(332,1,NULL,1,56,13),(333,1,NULL,1,56,14),(334,1,'2015-01-29 15:48:20',1,56,15),(335,1,NULL,1,56,16),(336,1,NULL,1,56,17),(337,1,'2015-01-29 15:49:00',1,57,12),(338,1,NULL,1,57,13),(339,1,NULL,1,57,14),(340,1,'2015-01-29 15:48:20',1,57,15),(341,1,NULL,1,57,16),(342,1,NULL,1,57,17),(343,1,'2015-01-29 15:49:00',1,58,12),(344,1,NULL,1,58,13),(345,1,NULL,1,58,14),(346,1,'2015-01-29 15:48:20',1,58,15),(347,1,NULL,1,58,16),(348,1,NULL,1,58,17),(349,1,'2015-01-29 15:49:00',1,59,12),(350,1,NULL,1,59,13),(351,1,NULL,1,59,14),(352,1,'2015-01-29 15:48:20',1,59,15),(353,1,NULL,1,59,16),(354,1,NULL,1,59,17),(355,1,'2015-01-29 15:49:00',1,60,12),(356,1,NULL,1,60,13),(357,1,NULL,1,60,14),(358,1,'2015-01-29 15:48:20',1,60,15),(359,1,NULL,1,60,16),(360,1,NULL,1,60,17),(361,1,'2015-01-29 15:49:00',1,61,12),(362,1,NULL,1,61,13),(363,1,NULL,1,61,14),(364,1,'2015-01-29 15:48:20',1,61,15),(365,1,NULL,1,61,16),(366,1,NULL,1,61,17),(367,1,'2015-01-29 15:49:00',1,62,12),(368,1,NULL,1,62,13),(369,1,NULL,1,62,14),(370,1,'2015-01-29 15:48:20',1,62,15),(371,1,NULL,1,62,16),(372,1,NULL,1,62,17),(373,1,'2015-01-29 15:49:00',1,63,12),(374,1,NULL,1,63,13),(375,1,NULL,1,63,14),(376,1,'2015-01-29 15:48:20',1,63,15),(377,1,NULL,1,63,16),(378,1,NULL,1,63,17),(379,1,'2015-01-29 15:49:00',1,64,12),(380,1,NULL,1,64,13),(381,1,NULL,1,64,14),(382,1,'2015-01-29 15:48:20',1,64,15),(383,1,NULL,1,64,16),(384,1,NULL,1,64,17),(385,1,'2015-01-29 15:49:00',1,65,12),(386,1,NULL,1,65,13),(387,1,NULL,1,65,14),(388,1,'2015-01-29 15:48:20',1,65,15),(389,1,NULL,1,65,16),(390,1,NULL,1,65,17),(391,1,'2015-01-29 15:49:00',1,66,12),(392,1,NULL,1,66,13),(393,1,NULL,1,66,14),(394,1,'2015-01-29 15:48:20',1,66,15),(395,1,NULL,1,66,16),(396,1,NULL,1,66,17),(397,1,'2015-01-29 15:49:00',1,67,12),(398,1,NULL,1,67,13),(399,1,NULL,1,67,14),(400,1,'2015-01-29 15:48:20',1,67,15),(401,1,NULL,1,67,16),(402,1,NULL,1,67,17);
/*!40000 ALTER TABLE `atividade_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_msg_grupo`
--

DROP TABLE IF EXISTS `atividade_msg_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_msg_grupo` (
  `id_atv_msg_grp` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_atv_mgs` bigint(20) NOT NULL,
  `id_grupo` bigint(20) NOT NULL,
  `id_tipo_envio` bigint(20) NOT NULL,
  PRIMARY KEY (`id_atv_msg_grp`),
  KEY `FK_tfexdkebbysmfnoja5h68i8lx` (`id_atv_mgs`),
  KEY `FK_7otx8psdrjr5howm18vxjxpjy` (`id_grupo`),
  KEY `FK_e12pul563h5y47ih7h4msdisr` (`id_tipo_envio`),
  CONSTRAINT `FK_e12pul563h5y47ih7h4msdisr` FOREIGN KEY (`id_tipo_envio`) REFERENCES `tipo_envio` (`id_tipo_envio`),
  CONSTRAINT `FK_7otx8psdrjr5howm18vxjxpjy` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `FK_tfexdkebbysmfnoja5h68i8lx` FOREIGN KEY (`id_atv_mgs`) REFERENCES `atividade_mensagem` (`id_atv_mgs`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_msg_grupo`
--

LOCK TABLES `atividade_msg_grupo` WRITE;
/*!40000 ALTER TABLE `atividade_msg_grupo` DISABLE KEYS */;
INSERT INTO `atividade_msg_grupo` VALUES (1,1,11,1),(2,2,11,1),(3,3,11,1),(4,4,11,1),(5,5,11,1),(6,6,11,1),(7,7,11,1),(8,8,11,1),(9,9,11,1),(10,10,11,1),(11,11,11,1),(12,12,11,1),(13,13,11,1),(14,14,11,1),(15,15,11,1),(16,16,11,1),(17,17,11,1),(18,18,11,1),(19,19,11,1),(20,20,11,1),(21,21,11,1),(22,22,11,1),(23,23,11,1),(24,24,11,1),(25,25,11,1),(26,26,11,1),(27,27,11,1),(28,28,11,1),(29,29,11,1),(30,30,11,1),(31,31,11,1),(32,32,11,1),(33,33,11,1),(34,34,11,1),(35,35,11,1),(36,36,11,1),(37,37,11,1),(38,38,11,1),(39,39,11,1),(40,40,11,1),(41,41,11,1),(42,42,11,1),(43,43,11,1),(44,44,11,1),(45,45,11,1),(46,46,11,1),(47,47,11,1),(48,48,11,1),(49,49,11,1),(50,50,11,1),(51,51,11,1),(52,52,11,1),(53,53,11,1),(54,54,11,1),(55,55,11,1),(56,56,11,1),(57,57,11,1),(58,58,11,1),(59,59,11,1),(60,60,11,1),(61,61,11,1),(62,62,11,1),(63,63,11,1),(64,64,11,1),(65,65,11,1),(66,66,11,1),(67,67,11,1),(68,68,11,1),(69,69,11,1),(70,70,11,1),(71,71,11,1),(72,72,11,1),(73,73,11,1),(74,74,11,1),(75,75,11,1),(76,76,11,1),(77,77,11,1),(78,78,11,1),(79,79,11,1),(80,80,11,1),(81,81,11,1),(82,82,11,1),(83,83,11,1),(84,84,11,1),(85,85,11,1),(86,86,11,1),(87,87,11,1),(88,88,11,1),(89,89,11,1),(90,90,11,1),(91,91,11,1),(92,92,11,1),(93,93,11,1),(94,94,11,1),(95,95,11,1),(96,96,11,1),(97,97,11,1),(98,98,11,1),(99,99,11,1),(100,100,11,1),(101,101,11,1),(102,102,11,1),(103,103,11,1),(104,104,11,1),(105,105,11,1),(106,106,11,1),(107,107,11,1),(108,108,11,1),(109,109,11,1),(110,110,11,1),(111,111,11,1),(112,112,11,1),(113,113,11,1),(114,114,11,1),(115,115,11,1),(116,116,11,1),(117,117,11,1),(118,118,11,1),(119,119,11,1),(120,120,11,1),(121,121,11,1),(122,122,11,1),(123,123,11,1),(124,124,11,1),(125,125,11,1),(126,126,11,1),(127,127,11,1),(128,128,11,1),(129,129,11,1),(130,130,11,1),(131,131,11,1),(132,132,11,1),(133,133,11,1),(134,134,11,1),(135,135,11,1),(136,136,11,1),(137,137,11,1),(138,138,11,1),(139,139,11,1),(140,140,11,1),(141,141,11,1),(142,142,11,1),(143,143,11,1),(144,144,11,1),(145,145,11,1),(146,146,11,1),(147,147,11,1),(148,148,11,1),(149,149,11,1),(150,150,11,1),(151,151,11,1),(152,152,11,1),(153,153,11,1),(154,154,11,1),(155,155,11,1),(156,156,11,1),(157,157,11,1),(158,158,11,1),(159,159,11,1),(160,160,11,1),(161,161,11,1),(162,162,11,1),(163,163,11,1),(164,164,11,1),(165,165,11,1),(166,166,11,1),(167,167,11,1),(168,168,11,1),(169,169,11,1),(170,170,11,1),(171,171,11,1),(172,172,11,1),(173,173,11,1),(174,174,11,1),(175,175,11,1),(176,176,11,1),(177,177,11,1),(178,178,11,1),(179,179,11,1),(180,180,11,1),(181,181,11,1),(182,182,11,1),(183,183,11,1),(184,184,11,1),(185,185,11,1),(186,186,11,1),(187,187,11,1),(188,188,11,1),(189,189,11,1),(190,190,11,1),(191,191,11,1),(192,192,11,1),(193,193,11,1),(194,194,11,1),(195,195,11,1),(196,196,11,1),(197,197,11,1),(198,198,11,1),(199,199,11,1),(200,200,11,1),(201,201,11,1),(202,202,11,1),(203,203,11,1),(204,204,11,1),(205,205,11,1),(206,206,11,1),(207,207,11,1),(208,208,11,1),(209,209,11,1),(210,210,11,1),(211,211,11,1),(212,212,11,1),(213,213,11,1),(214,214,11,1),(215,215,11,1),(216,216,11,1),(217,217,11,1),(218,218,11,1),(219,219,11,1),(220,220,11,1),(221,221,11,1),(222,222,11,1),(223,223,11,1),(224,224,11,1),(225,225,11,1),(226,226,11,1),(227,227,11,1),(228,228,11,1),(229,229,11,1),(230,230,11,1),(231,231,11,1),(232,232,11,1),(233,233,11,1),(234,234,11,1),(235,235,11,1),(236,236,11,1),(237,237,11,1),(238,238,11,1),(239,239,11,1),(240,240,11,1),(241,241,11,1),(242,242,11,1),(243,243,11,1),(244,244,11,1),(245,245,11,1),(246,246,11,1),(247,247,11,1),(248,248,11,1),(249,249,11,1),(250,250,11,1),(251,251,11,1),(252,252,11,1),(253,253,11,1),(254,254,11,1),(255,255,11,1),(256,256,11,1),(257,257,11,1),(258,258,11,1),(259,259,11,1),(260,260,11,1),(261,261,11,1),(262,262,11,1),(263,263,11,1),(264,264,11,1),(265,265,11,1),(266,266,11,1),(267,267,11,1),(268,268,11,1),(269,269,11,1),(270,270,11,1),(271,271,11,1),(272,272,11,1),(273,273,11,1),(274,274,11,1),(275,275,11,1),(276,276,11,1),(277,277,11,1),(278,278,11,1),(279,279,11,1),(280,280,11,1),(281,281,11,1),(282,282,11,1),(283,283,11,1),(284,284,11,1),(285,285,11,1),(286,286,11,1),(287,287,11,1),(288,288,11,1),(289,289,11,1),(290,290,11,1),(291,291,11,1),(292,292,11,1),(293,293,11,1),(294,294,11,1),(295,295,11,1),(296,296,11,1),(297,297,11,1),(298,298,11,1),(299,299,11,1),(300,300,11,1),(301,301,11,1),(302,302,11,1),(303,303,11,1),(304,304,11,1),(305,305,11,1),(306,306,11,1),(307,307,11,1),(308,308,11,1),(309,309,11,1),(310,310,11,1),(311,311,11,1),(312,312,11,1),(313,313,11,1),(314,314,11,1),(315,315,11,1),(316,316,11,1),(317,317,11,1),(318,318,11,1),(319,319,11,1),(320,320,11,1),(321,321,11,1),(322,322,11,1),(323,323,11,1),(324,324,11,1),(325,325,11,1),(326,326,11,1),(327,327,11,1),(328,328,11,1),(329,329,11,1),(330,330,11,1),(331,331,11,1),(332,332,11,1),(333,333,11,1),(334,334,11,1),(335,335,11,1),(336,336,11,1),(337,337,11,1),(338,338,11,1),(339,339,11,1),(340,340,11,1),(341,341,11,1),(342,342,11,1),(343,343,11,1),(344,344,11,1),(345,345,11,1),(346,346,11,1),(347,347,11,1),(348,348,11,1),(349,349,11,1),(350,350,11,1),(351,351,11,1),(352,352,11,1),(353,353,11,1),(354,354,11,1),(355,355,11,1),(356,356,11,1),(357,357,11,1),(358,358,11,1),(359,359,11,1),(360,360,11,1),(361,361,11,1),(362,362,11,1),(363,363,11,1),(364,364,11,1),(365,365,11,1),(366,366,11,1),(367,367,11,1),(368,368,11,1),(369,369,11,1),(370,370,11,1),(371,371,11,1),(372,372,11,1),(373,373,11,1),(374,374,11,1),(375,375,11,1),(376,376,11,1),(377,377,11,1),(378,378,11,1),(379,379,11,1),(380,380,11,1),(381,381,11,1),(382,382,11,1),(383,383,11,1),(384,384,11,1),(385,385,11,1),(386,386,11,1),(387,387,11,1),(388,388,11,1),(389,389,11,1),(390,390,11,1),(391,391,11,1),(392,392,11,1),(393,393,11,1),(394,394,11,1),(395,395,11,1),(396,396,11,1),(397,397,11,1),(398,398,11,1),(399,399,11,1),(400,400,11,1),(401,401,11,1),(402,402,11,1),(403,1,11,2),(404,2,11,2),(405,3,11,2),(406,4,11,2),(407,5,11,2),(408,6,11,2),(409,7,11,2),(410,8,11,2),(411,9,11,2),(412,10,11,2),(413,11,11,2),(414,12,11,2),(415,13,11,2),(416,14,11,2),(417,15,11,2),(418,16,11,2),(419,17,11,2),(420,18,11,2),(421,19,11,2),(422,20,11,2),(423,21,11,2),(424,22,11,2),(425,23,11,2),(426,24,11,2),(427,25,11,2),(428,26,11,2),(429,27,11,2),(430,28,11,2),(431,29,11,2),(432,30,11,2),(433,31,11,2),(434,32,11,2),(435,33,11,2),(436,34,11,2),(437,35,11,2),(438,36,11,2),(439,37,11,2),(440,38,11,2),(441,39,11,2),(442,40,11,2),(443,41,11,2),(444,42,11,2),(445,43,11,2),(446,44,11,2),(447,45,11,2),(448,46,11,2),(449,47,11,2),(450,48,11,2),(451,49,11,2),(452,50,11,2),(453,51,11,2),(454,52,11,2),(455,53,11,2),(456,54,11,2),(457,55,11,2),(458,56,11,2),(459,57,11,2),(460,58,11,2),(461,59,11,2),(462,60,11,2),(463,61,11,2),(464,62,11,2),(465,63,11,2),(466,64,11,2),(467,65,11,2),(468,66,11,2),(469,67,11,2),(470,68,11,2),(471,69,11,2),(472,70,11,2),(473,71,11,2),(474,72,11,2),(475,73,11,2),(476,74,11,2),(477,75,11,2),(478,76,11,2),(479,77,11,2),(480,78,11,2),(481,79,11,2),(482,80,11,2),(483,81,11,2),(484,82,11,2),(485,83,11,2),(486,84,11,2),(487,85,11,2),(488,86,11,2),(489,87,11,2),(490,88,11,2),(491,89,11,2),(492,90,11,2),(493,91,11,2),(494,92,11,2),(495,93,11,2),(496,94,11,2),(497,95,11,2),(498,96,11,2),(499,97,11,2),(500,98,11,2),(501,99,11,2),(502,100,11,2),(503,101,11,2),(504,102,11,2),(505,103,11,2),(506,104,11,2),(507,105,11,2),(508,106,11,2),(509,107,11,2),(510,108,11,2),(511,109,11,2),(512,110,11,2),(513,111,11,2),(514,112,11,2),(515,113,11,2),(516,114,11,2),(517,115,11,2),(518,116,11,2),(519,117,11,2),(520,118,11,2),(521,119,11,2),(522,120,11,2),(523,121,11,2),(524,122,11,2),(525,123,11,2),(526,124,11,2),(527,125,11,2),(528,126,11,2),(529,127,11,2),(530,128,11,2),(531,129,11,2),(532,130,11,2),(533,131,11,2),(534,132,11,2),(535,133,11,2),(536,134,11,2),(537,135,11,2),(538,136,11,2),(539,137,11,2),(540,138,11,2),(541,139,11,2),(542,140,11,2),(543,141,11,2),(544,142,11,2),(545,143,11,2),(546,144,11,2),(547,145,11,2),(548,146,11,2),(549,147,11,2),(550,148,11,2),(551,149,11,2),(552,150,11,2),(553,151,11,2),(554,152,11,2),(555,153,11,2),(556,154,11,2),(557,155,11,2),(558,156,11,2),(559,157,11,2),(560,158,11,2),(561,159,11,2),(562,160,11,2),(563,161,11,2),(564,162,11,2),(565,163,11,2),(566,164,11,2),(567,165,11,2),(568,166,11,2),(569,167,11,2),(570,168,11,2),(571,169,11,2),(572,170,11,2),(573,171,11,2),(574,172,11,2),(575,173,11,2),(576,174,11,2),(577,175,11,2),(578,176,11,2),(579,177,11,2),(580,178,11,2),(581,179,11,2),(582,180,11,2),(583,181,11,2),(584,182,11,2),(585,183,11,2),(586,184,11,2),(587,185,11,2),(588,186,11,2),(589,187,11,2),(590,188,11,2),(591,189,11,2),(592,190,11,2),(593,191,11,2),(594,192,11,2),(595,193,11,2),(596,194,11,2),(597,195,11,2),(598,196,11,2),(599,197,11,2),(600,198,11,2),(601,199,11,2),(602,200,11,2),(603,201,11,2),(604,202,11,2),(605,203,11,2),(606,204,11,2),(607,205,11,2),(608,206,11,2),(609,207,11,2),(610,208,11,2),(611,209,11,2),(612,210,11,2),(613,211,11,2),(614,212,11,2),(615,213,11,2),(616,214,11,2),(617,215,11,2),(618,216,11,2),(619,217,11,2),(620,218,11,2),(621,219,11,2),(622,220,11,2),(623,221,11,2),(624,222,11,2),(625,223,11,2),(626,224,11,2),(627,225,11,2),(628,226,11,2),(629,227,11,2),(630,228,11,2),(631,229,11,2),(632,230,11,2),(633,231,11,2),(634,232,11,2),(635,233,11,2),(636,234,11,2),(637,235,11,2),(638,236,11,2),(639,237,11,2),(640,238,11,2),(641,239,11,2),(642,240,11,2),(643,241,11,2),(644,242,11,2),(645,243,11,2),(646,244,11,2),(647,245,11,2),(648,246,11,2),(649,247,11,2),(650,248,11,2),(651,249,11,2),(652,250,11,2),(653,251,11,2),(654,252,11,2),(655,253,11,2),(656,254,11,2),(657,255,11,2),(658,256,11,2),(659,257,11,2),(660,258,11,2),(661,259,11,2),(662,260,11,2),(663,261,11,2),(664,262,11,2),(665,263,11,2),(666,264,11,2),(667,265,11,2),(668,266,11,2),(669,267,11,2),(670,268,11,2),(671,269,11,2),(672,270,11,2),(673,271,11,2),(674,272,11,2),(675,273,11,2),(676,274,11,2),(677,275,11,2),(678,276,11,2),(679,277,11,2),(680,278,11,2),(681,279,11,2),(682,280,11,2),(683,281,11,2),(684,282,11,2),(685,283,11,2),(686,284,11,2),(687,285,11,2),(688,286,11,2),(689,287,11,2),(690,288,11,2),(691,289,11,2),(692,290,11,2),(693,291,11,2),(694,292,11,2),(695,293,11,2),(696,294,11,2),(697,295,11,2),(698,296,11,2),(699,297,11,2),(700,298,11,2),(701,299,11,2),(702,300,11,2),(703,301,11,2),(704,302,11,2),(705,303,11,2),(706,304,11,2),(707,305,11,2),(708,306,11,2),(709,307,11,2),(710,308,11,2),(711,309,11,2),(712,310,11,2),(713,311,11,2),(714,312,11,2),(715,313,11,2),(716,314,11,2),(717,315,11,2),(718,316,11,2),(719,317,11,2),(720,318,11,2),(721,319,11,2),(722,320,11,2),(723,321,11,2),(724,322,11,2),(725,323,11,2),(726,324,11,2),(727,325,11,2),(728,326,11,2),(729,327,11,2),(730,328,11,2),(731,329,11,2),(732,330,11,2),(733,331,11,2),(734,332,11,2),(735,333,11,2),(736,334,11,2),(737,335,11,2),(738,336,11,2),(739,337,11,2),(740,338,11,2),(741,339,11,2),(742,340,11,2),(743,341,11,2),(744,342,11,2),(745,343,11,2),(746,344,11,2),(747,345,11,2),(748,346,11,2),(749,347,11,2),(750,348,11,2),(751,349,11,2),(752,350,11,2),(753,351,11,2),(754,352,11,2),(755,353,11,2),(756,354,11,2),(757,355,11,2),(758,356,11,2),(759,357,11,2),(760,358,11,2),(761,359,11,2),(762,360,11,2),(763,361,11,2),(764,362,11,2),(765,363,11,2),(766,364,11,2),(767,365,11,2),(768,366,11,2),(769,367,11,2),(770,368,11,2),(771,369,11,2),(772,370,11,2),(773,371,11,2),(774,372,11,2),(775,373,11,2),(776,374,11,2),(777,375,11,2),(778,376,11,2),(779,377,11,2),(780,378,11,2),(781,379,11,2),(782,380,11,2),(783,381,11,2),(784,382,11,2),(785,383,11,2),(786,384,11,2),(787,385,11,2),(788,386,11,2),(789,387,11,2),(790,388,11,2),(791,389,11,2),(792,390,11,2),(793,391,11,2),(794,392,11,2),(795,393,11,2),(796,394,11,2),(797,395,11,2),(798,396,11,2),(799,397,11,2),(800,398,11,2),(801,399,11,2),(802,400,11,2),(803,401,11,2),(804,402,11,2);
/*!40000 ALTER TABLE `atividade_msg_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_ocorrencia`
--

DROP TABLE IF EXISTS `atividade_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_ocorrencia` (
  `id_atividade_ocorrencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_fim_atividade` datetime DEFAULT NULL,
  `data_inicio_atividade` datetime NOT NULL,
  `descricao_atividade_ocorrencia` varchar(255) DEFAULT NULL,
  `nome_atividade_ocorrencia` varchar(255) NOT NULL,
  `nr_item` int(11) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `tempo_exec_estimado` int(11) NOT NULL,
  `tempo_toler_fim` int(11) NOT NULL,
  `tempo_toler_inicio` int(11) NOT NULL,
  `id_ocorrencia` bigint(20) NOT NULL,
  `id_status` bigint(20) NOT NULL,
  `id_usuario_responsavel` bigint(20) NOT NULL,
  PRIMARY KEY (`id_atividade_ocorrencia`),
  KEY `FK_ut9db15djwh4tbjnv86bd7hr` (`id_ocorrencia`),
  KEY `FK_am0ke60k5ngjhd4ftofrpcm46` (`id_status`),
  KEY `FK_p1fr57boh4yb2lompkm5grxm8` (`id_usuario_responsavel`),
  CONSTRAINT `FK_p1fr57boh4yb2lompkm5grxm8` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_am0ke60k5ngjhd4ftofrpcm46` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_ut9db15djwh4tbjnv86bd7hr` FOREIGN KEY (`id_ocorrencia`) REFERENCES `ocorrencia` (`id_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_ocorrencia`
--

LOCK TABLES `atividade_ocorrencia` WRITE;
/*!40000 ALTER TABLE `atividade_ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id_cargo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Gerente'),(2,'Arquiteto de Solu√ß√µes'),(3,'Diretor'),(4,'Supervisor'),(5,'Operador'),(6,'Vice-Presidente'),(7,'Presidente'),(8,'Coordenador');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist` (
  `id_checklist` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `checklist_ronda` tinyint(1) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_fim_previsto` datetime DEFAULT NULL,
  `data_fim_realizado` datetime DEFAULT NULL,
  `data_inicio_previsto` datetime DEFAULT NULL,
  `data_inicio_realizado` datetime DEFAULT NULL,
  `descricao_checklist` varchar(255) DEFAULT NULL,
  `nome_checklist` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `recorrente` tinyint(1) NOT NULL,
  `tempo_exec_estimado` int(11) NOT NULL,
  `tempo_toler_fim` int(11) NOT NULL,
  `tempo_toler_inicio` int(11) NOT NULL,
  `id_evento` bigint(20) NOT NULL,
  `id_status` bigint(20) NOT NULL,
  `id_usuario_responsavel` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_checklist`),
  KEY `FK_c7ijapyfqxei8dutgm6x11b3i` (`id_evento`),
  KEY `FK_8conydrxmaj63ar18w54uk8kw` (`id_status`),
  KEY `FK_cf91nx80oxspbg1egwe3hyn02` (`id_usuario_responsavel`),
  CONSTRAINT `FK_cf91nx80oxspbg1egwe3hyn02` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_8conydrxmaj63ar18w54uk8kw` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_c7ijapyfqxei8dutgm6x11b3i` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (1,1,0,NULL,NULL,'2014-11-12 19:00:00',NULL,'2014-11-12 17:00:00',NULL,'Brasil x Cro√°cia','Match Day',NULL,0,880,5,5,1,1,7),(2,1,0,NULL,NULL,'2014-11-13 15:00:00',NULL,'2014-11-13 13:00:00',NULL,'M√©xico x Camar√µes','Match Day',NULL,0,880,5,5,2,1,7),(3,1,0,NULL,NULL,'2014-11-13 18:00:00',NULL,'2014-11-13 16:00:00',NULL,'Espanha x Holanda','Match Day',NULL,0,880,5,5,3,1,7),(4,1,0,NULL,NULL,'2014-11-13 21:00:00',NULL,'2014-11-13 19:00:00',NULL,'Chile x Austr√°lia','Match Day',NULL,0,880,5,5,4,1,7),(5,1,0,NULL,NULL,'2014-11-22 15:00:00',NULL,'2014-11-22 13:00:00',NULL,'Colombia x Gr√©cia','Match Day',NULL,0,880,5,5,5,1,7),(6,1,0,NULL,NULL,'2014-11-22 18:00:00',NULL,'2014-11-22 16:00:00',NULL,'Uruguai x Costa Rica','Match Day',NULL,0,880,5,5,6,1,7),(7,1,0,NULL,NULL,'2014-11-22 21:00:00',NULL,'2014-11-22 19:00:00',NULL,'Inglaterra x It√°lia','Match Day',NULL,0,880,5,5,7,1,7),(8,1,0,NULL,NULL,'2014-11-22 00:00:00',NULL,'2014-11-22 22:00:00',NULL,'Costa do Marfim x Jap√£o','Match Day',NULL,0,880,5,5,8,1,7),(9,1,0,NULL,NULL,'2014-11-22 15:00:00',NULL,'2014-11-22 13:00:00',NULL,'Su√≠√ßa x Equador','Match Day',NULL,0,880,5,5,9,1,7),(10,1,0,NULL,NULL,'2014-11-22 18:00:00',NULL,'2014-11-22 16:00:00',NULL,'Fran√ßa x Honduras','Match Day',NULL,0,880,5,5,10,1,7),(11,1,0,NULL,NULL,'2014-11-22 21:00:00',NULL,'2014-11-22 19:00:00',NULL,'Argentina x B√≥snia','Match Day',NULL,0,880,5,5,11,1,7),(12,1,1,'-23.584511','-46.729257','2014-11-30 18:00:00',NULL,'2014-11-22 08:00:00',NULL,'Ronda do Per√≠odo da Manh√£','Ronda do Per√≠odo da Manh√£',NULL,0,120,5,5,12,1,12),(13,1,1,'-23.584511','-46.729257','2014-11-30 18:00:00',NULL,'2014-11-01 08:00:00',NULL,'Ronda do Per√≠odo da Tarde','Ronda do Per√≠odo da Tarde',NULL,0,120,5,5,12,1,12),(14,1,1,'-23.658226','-46.533063','2014-11-30 18:00:00',NULL,'2014-11-01 08:00:00',NULL,'Ronda do Per√≠odo da Tarde','Ronda do Per√≠odo da Tarde',NULL,0,120,5,5,13,1,7);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_comentario`
--

DROP TABLE IF EXISTS `checklist_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_comentario` (
  `id_checklist_comentario` bigint(20) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) NOT NULL,
  `data_comentario` datetime NOT NULL,
  `id_checklist` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_checklist_comentario`),
  KEY `FK_smi0ybir1bvwicg1b5lwrw9bi` (`id_checklist`),
  KEY `FK_q09757lbgrumymioou0kskc4p` (`id_usuario`),
  CONSTRAINT `FK_q09757lbgrumymioou0kskc4p` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_smi0ybir1bvwicg1b5lwrw9bi` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id_checklist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_comentario`
--

LOCK TABLES `checklist_comentario` WRITE;
/*!40000 ALTER TABLE `checklist_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_mensagem`
--

DROP TABLE IF EXISTS `checklist_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_mensagem` (
  `id_chk_mgs` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `data_envio` datetime DEFAULT NULL,
  `tempo_escala` int(11) NOT NULL,
  `id_checklist` bigint(20) DEFAULT NULL,
  `id_mensagem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_chk_mgs`),
  KEY `FK_gg36upt29ysyv52jq951ofmio` (`id_checklist`),
  KEY `FK_8kte5nr9q9s92gvwtaa492jaa` (`id_mensagem`),
  CONSTRAINT `FK_8kte5nr9q9s92gvwtaa492jaa` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`),
  CONSTRAINT `FK_gg36upt29ysyv52jq951ofmio` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id_checklist`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_mensagem`
--

LOCK TABLES `checklist_mensagem` WRITE;
/*!40000 ALTER TABLE `checklist_mensagem` DISABLE KEYS */;
INSERT INTO `checklist_mensagem` VALUES (1,1,'2015-01-29 15:49:00',1,1,12),(2,1,NULL,1,1,13),(3,1,NULL,1,1,14),(4,1,'2015-01-29 15:48:20',1,1,15),(5,1,NULL,1,1,16),(6,1,NULL,1,1,17),(7,1,'2015-01-29 15:49:00',1,2,12),(8,1,NULL,1,2,13),(9,1,NULL,1,2,14),(10,1,'2015-01-29 15:48:20',1,2,15),(11,1,NULL,1,2,16),(12,1,NULL,1,2,17),(13,1,'2015-01-29 15:49:00',1,3,12),(14,1,NULL,1,3,13),(15,1,NULL,1,3,14),(16,1,'2015-01-29 15:48:20',1,3,15),(17,1,NULL,1,3,16),(18,1,NULL,1,3,17),(19,1,'2015-01-29 15:49:00',1,4,12),(20,1,NULL,1,4,13),(21,1,NULL,1,4,14),(22,1,'2015-01-29 15:48:20',1,4,15),(23,1,NULL,1,4,16),(24,1,NULL,1,4,17),(25,1,'2015-01-29 15:49:00',1,5,12),(26,1,NULL,1,5,13),(27,1,NULL,1,5,14),(28,1,'2015-01-29 15:48:20',1,5,15),(29,1,NULL,1,5,16),(30,1,NULL,1,5,17),(31,1,'2015-01-29 15:49:00',1,6,12),(32,1,NULL,1,6,13),(33,1,NULL,1,6,14),(34,1,'2015-01-29 15:48:20',1,6,15),(35,1,NULL,1,6,16),(36,1,NULL,1,6,17),(37,1,'2015-01-29 15:49:00',1,7,12),(38,1,NULL,1,7,13),(39,1,NULL,1,7,14),(40,1,'2015-01-29 15:48:20',1,7,15),(41,1,NULL,1,7,16),(42,1,NULL,1,7,17),(43,1,'2015-01-29 15:49:00',1,8,12),(44,1,NULL,1,8,13),(45,1,NULL,1,8,14),(46,1,'2015-01-29 15:48:20',1,8,15),(47,1,NULL,1,8,16),(48,1,NULL,1,8,17),(49,1,'2015-01-29 15:49:00',1,9,12),(50,1,NULL,1,9,13),(51,1,NULL,1,9,14),(52,1,'2015-01-29 15:48:20',1,9,15),(53,1,NULL,1,9,16),(54,1,NULL,1,9,17),(55,1,'2015-01-29 15:49:00',1,10,12),(56,1,NULL,1,10,13),(57,1,NULL,1,10,14),(58,1,'2015-01-29 15:48:20',1,10,15),(59,1,NULL,1,10,16),(60,1,NULL,1,10,17),(61,1,'2015-01-29 15:49:00',1,11,12),(62,1,NULL,1,11,13),(63,1,NULL,1,11,14),(64,1,'2015-01-29 15:48:20',1,11,15),(65,1,NULL,1,11,16),(66,1,NULL,1,11,17),(67,1,'2015-01-29 15:49:00',1,12,12),(68,1,NULL,1,12,13),(69,1,NULL,1,12,14),(70,1,'2015-01-29 15:48:20',1,12,15),(71,1,NULL,1,12,16),(72,1,NULL,1,12,17),(73,1,'2015-01-29 15:49:00',1,13,12),(74,1,NULL,1,13,13),(75,1,NULL,1,13,14),(76,1,'2015-01-29 15:48:20',1,13,15),(77,1,NULL,1,13,16),(78,1,NULL,1,13,17),(79,1,'2015-01-29 15:49:00',1,14,12),(80,1,NULL,1,14,13),(81,1,NULL,1,14,14),(82,1,'2015-01-29 15:48:20',1,14,15),(83,1,NULL,1,14,16),(84,1,NULL,1,14,17);
/*!40000 ALTER TABLE `checklist_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_msg_grupo`
--

DROP TABLE IF EXISTS `checklist_msg_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_msg_grupo` (
  `id_chk_msg_grp` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_chk_mgs` bigint(20) NOT NULL,
  `id_grupo` bigint(20) NOT NULL,
  `id_tipo_envio` bigint(20) NOT NULL,
  PRIMARY KEY (`id_chk_msg_grp`),
  KEY `FK_82pai9oln1hccduor85ykxl8j` (`id_chk_mgs`),
  KEY `FK_p9n2jck9e4v4nf0e6dy60gox4` (`id_grupo`),
  KEY `FK_ngohes3htf00hp68cae8hcqfk` (`id_tipo_envio`),
  CONSTRAINT `FK_ngohes3htf00hp68cae8hcqfk` FOREIGN KEY (`id_tipo_envio`) REFERENCES `tipo_envio` (`id_tipo_envio`),
  CONSTRAINT `FK_82pai9oln1hccduor85ykxl8j` FOREIGN KEY (`id_chk_mgs`) REFERENCES `checklist_mensagem` (`id_chk_mgs`),
  CONSTRAINT `FK_p9n2jck9e4v4nf0e6dy60gox4` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_msg_grupo`
--

LOCK TABLES `checklist_msg_grupo` WRITE;
/*!40000 ALTER TABLE `checklist_msg_grupo` DISABLE KEYS */;
INSERT INTO `checklist_msg_grupo` VALUES (1,1,11,1),(2,2,11,1),(3,3,11,1),(4,4,11,1),(5,5,11,1),(6,6,11,1),(7,7,11,1),(8,8,11,1),(9,9,11,1),(10,10,11,1),(11,11,11,1),(12,12,11,1),(13,13,11,1),(14,14,11,1),(15,15,11,1),(16,16,11,1),(17,17,11,1),(18,18,11,1),(19,19,11,1),(20,20,11,1),(21,21,11,1),(22,22,11,1),(23,23,11,1),(24,24,11,1),(25,25,11,1),(26,26,11,1),(27,27,11,1),(28,28,11,1),(29,29,11,1),(30,30,11,1),(31,31,11,1),(32,32,11,1),(33,33,11,1),(34,34,11,1),(35,35,11,1),(36,36,11,1),(37,37,11,1),(38,38,11,1),(39,39,11,1),(40,40,11,1),(41,41,11,1),(42,42,11,1),(43,43,11,1),(44,44,11,1),(45,45,11,1),(46,46,11,1),(47,47,11,1),(48,48,11,1),(49,49,11,1),(50,50,11,1),(51,51,11,1),(52,52,11,1),(53,53,11,1),(54,54,11,1),(55,55,11,1),(56,56,11,1),(57,57,11,1),(58,58,11,1),(59,59,11,1),(60,60,11,1),(61,61,11,1),(62,62,11,1),(63,63,11,1),(64,64,11,1),(65,65,11,1),(66,66,11,1),(67,67,11,1),(68,68,11,1),(69,69,11,1),(70,70,11,1),(71,71,11,1),(72,72,11,1),(73,73,11,1),(74,74,11,1),(75,75,11,1),(76,76,11,1),(77,77,11,1),(78,78,11,1),(79,79,11,1),(80,80,11,1),(81,81,11,1),(82,82,11,1),(83,83,11,1),(84,84,11,1),(85,1,11,2),(86,2,11,2),(87,3,11,2),(88,4,11,2),(89,5,11,2),(90,6,11,2),(91,7,11,2),(92,8,11,2),(93,9,11,2),(94,10,11,2),(95,11,11,2),(96,12,11,2),(97,13,11,2),(98,14,11,2),(99,15,11,2),(100,16,11,2),(101,17,11,2),(102,18,11,2),(103,19,11,2),(104,20,11,2),(105,21,11,2),(106,22,11,2),(107,23,11,2),(108,24,11,2),(109,25,11,2),(110,26,11,2),(111,27,11,2),(112,28,11,2),(113,29,11,2),(114,30,11,2),(115,31,11,2),(116,32,11,2),(117,33,11,2),(118,34,11,2),(119,35,11,2),(120,36,11,2),(121,37,11,2),(122,38,11,2),(123,39,11,2),(124,40,11,2),(125,41,11,2),(126,42,11,2),(127,43,11,2),(128,44,11,2),(129,45,11,2),(130,46,11,2),(131,47,11,2),(132,48,11,2),(133,49,11,2),(134,50,11,2),(135,51,11,2),(136,52,11,2),(137,53,11,2),(138,54,11,2),(139,55,11,2),(140,56,11,2),(141,57,11,2),(142,58,11,2),(143,59,11,2),(144,60,11,2),(145,61,11,2),(146,62,11,2),(147,63,11,2),(148,64,11,2),(149,65,11,2),(150,66,11,2),(151,67,11,2),(152,68,11,2),(153,69,11,2),(154,70,11,2),(155,71,11,2),(156,72,11,2),(157,73,11,2),(158,74,11,2),(159,75,11,2),(160,76,11,2),(161,77,11,2),(162,78,11,2),(163,79,11,2),(164,80,11,2),(165,81,11,2),(166,82,11,2),(167,83,11,2),(168,84,11,2);
/*!40000 ALTER TABLE `checklist_msg_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_padrao`
--

DROP TABLE IF EXISTS `checklist_padrao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_padrao` (
  `id_checklist_padrao` bigint(20) NOT NULL AUTO_INCREMENT,
  `checklist_ronda` tinyint(1) NOT NULL,
  `descricao_checklist_padrao` varchar(255) DEFAULT NULL,
  `nome_checklist_padrao` varchar(255) NOT NULL,
  `recorrente` tinyint(1) NOT NULL,
  `tempo_exec_estimado` int(11) NOT NULL,
  `tempo_toler_fim` int(11) NOT NULL,
  `tempo_toler_inicio` int(11) NOT NULL,
  PRIMARY KEY (`id_checklist_padrao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_padrao`
--

LOCK TABLES `checklist_padrao` WRITE;
/*!40000 ALTER TABLE `checklist_padrao` DISABLE KEYS */;
INSERT INTO `checklist_padrao` VALUES (1,0,'Match Day','Match Day',0,880,5,5),(2,1,'Ronda per√≠odo manh√£','Ronda per√≠odo manh√£',0,120,5,5),(3,1,'Ronda per√≠odo manh√£','Ronda per√≠odo tarde',0,120,5,5);
/*!40000 ALTER TABLE `checklist_padrao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_padrao_mensagem`
--

DROP TABLE IF EXISTS `checklist_padrao_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_padrao_mensagem` (
  `id_chk_pdr_mgs` bigint(20) NOT NULL AUTO_INCREMENT,
  `tempo_escala` int(11) NOT NULL,
  `id_checklist_padrao` bigint(20) DEFAULT NULL,
  `id_mensagem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_chk_pdr_mgs`),
  KEY `FK_fetdudrnv4h498uy353uiqj08` (`id_checklist_padrao`),
  KEY `FK_ot51wlhvbwn4241evt0wgdpjh` (`id_mensagem`),
  CONSTRAINT `FK_ot51wlhvbwn4241evt0wgdpjh` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`),
  CONSTRAINT `FK_fetdudrnv4h498uy353uiqj08` FOREIGN KEY (`id_checklist_padrao`) REFERENCES `checklist_padrao` (`id_checklist_padrao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_padrao_mensagem`
--

LOCK TABLES `checklist_padrao_mensagem` WRITE;
/*!40000 ALTER TABLE `checklist_padrao_mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist_padrao_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_padrao_segmento`
--

DROP TABLE IF EXISTS `checklist_padrao_segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_padrao_segmento` (
  `id_checklist_padrao` bigint(20) NOT NULL,
  `id_segmento` bigint(20) NOT NULL,
  PRIMARY KEY (`id_checklist_padrao`,`id_segmento`),
  KEY `FK_c3cmgwcy2bphlmw2bexqrj3f4` (`id_segmento`),
  KEY `FK_j1uaq9koun84va9u54gtn8j54` (`id_checklist_padrao`),
  CONSTRAINT `FK_j1uaq9koun84va9u54gtn8j54` FOREIGN KEY (`id_checklist_padrao`) REFERENCES `checklist_padrao` (`id_checklist_padrao`),
  CONSTRAINT `FK_c3cmgwcy2bphlmw2bexqrj3f4` FOREIGN KEY (`id_segmento`) REFERENCES `segmento` (`id_segmento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_padrao_segmento`
--

LOCK TABLES `checklist_padrao_segmento` WRITE;
/*!40000 ALTER TABLE `checklist_padrao_segmento` DISABLE KEYS */;
INSERT INTO `checklist_padrao_segmento` VALUES (2,1),(3,1),(1,2);
/*!40000 ALTER TABLE `checklist_padrao_segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_procedimento`
--

DROP TABLE IF EXISTS `checklist_procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_procedimento` (
  `id_checklist_padrao` bigint(20) NOT NULL DEFAULT '0',
  `id_procedimento` bigint(20) NOT NULL DEFAULT '0',
  `nr_item` int(11) NOT NULL,
  PRIMARY KEY (`id_checklist_padrao`,`id_procedimento`),
  KEY `FK_mvt9fyloc781cqj2xrw89w1cx` (`id_checklist_padrao`),
  KEY `FK_h9hx5myx3v1751l78sjph1xwx` (`id_procedimento`),
  CONSTRAINT `FK_h9hx5myx3v1751l78sjph1xwx` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`),
  CONSTRAINT `FK_mvt9fyloc781cqj2xrw89w1cx` FOREIGN KEY (`id_checklist_padrao`) REFERENCES `checklist_padrao` (`id_checklist_padrao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_procedimento`
--

LOCK TABLES `checklist_procedimento` WRITE;
/*!40000 ALTER TABLE `checklist_procedimento` DISABLE KEYS */;
INSERT INTO `checklist_procedimento` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10),(2,11,1),(2,12,2),(2,13,3),(2,14,4),(3,11,1),(3,12,2),(3,13,3),(3,14,4);
/*!40000 ALTER TABLE `checklist_procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clas_ocor_msg`
--

DROP TABLE IF EXISTS `clas_ocor_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clas_ocor_msg` (
  `id_clas_ocor_msg` bigint(20) NOT NULL AUTO_INCREMENT,
  `tempo_escala` int(11) NOT NULL,
  `id_classificacao_ocorrencia` bigint(20) DEFAULT NULL,
  `id_mensagem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_clas_ocor_msg`),
  KEY `FK_4379tdbv7ghfyd7ciq49tp5au` (`id_classificacao_ocorrencia`),
  KEY `FK_mcjtp1j7qqa9y8gbbxc6i98sn` (`id_mensagem`),
  CONSTRAINT `FK_mcjtp1j7qqa9y8gbbxc6i98sn` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`),
  CONSTRAINT `FK_4379tdbv7ghfyd7ciq49tp5au` FOREIGN KEY (`id_classificacao_ocorrencia`) REFERENCES `classificacao_ocorrencia` (`id_classificacao_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clas_ocor_msg`
--

LOCK TABLES `clas_ocor_msg` WRITE;
/*!40000 ALTER TABLE `clas_ocor_msg` DISABLE KEYS */;
INSERT INTO `clas_ocor_msg` VALUES (1,60,1,33),(2,60,2,33),(3,60,3,33),(4,60,4,33),(5,60,5,33),(6,60,6,33),(7,60,7,33),(8,60,8,33),(9,60,9,33),(10,60,10,33),(11,60,11,33);
/*!40000 ALTER TABLE `clas_ocor_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clas_ocor_msg_grupo`
--

DROP TABLE IF EXISTS `clas_ocor_msg_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clas_ocor_msg_grupo` (
  `id_clas_ocor_msg_grp` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_clas_ocor_mgs` bigint(20) NOT NULL,
  `id_grupo` bigint(20) NOT NULL,
  `id_tipo_envio` bigint(20) NOT NULL,
  PRIMARY KEY (`id_clas_ocor_msg_grp`),
  KEY `FK_9u29x5dmluv1yqcbm9l9obihh` (`id_clas_ocor_mgs`),
  KEY `FK_spks0r0k0afyk1x9x6lhnflev` (`id_grupo`),
  KEY `FK_8ia1un1n9eko8vq0wovgo1uud` (`id_tipo_envio`),
  CONSTRAINT `FK_8ia1un1n9eko8vq0wovgo1uud` FOREIGN KEY (`id_tipo_envio`) REFERENCES `tipo_envio` (`id_tipo_envio`),
  CONSTRAINT `FK_9u29x5dmluv1yqcbm9l9obihh` FOREIGN KEY (`id_clas_ocor_mgs`) REFERENCES `clas_ocor_msg` (`id_clas_ocor_msg`),
  CONSTRAINT `FK_spks0r0k0afyk1x9x6lhnflev` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clas_ocor_msg_grupo`
--

LOCK TABLES `clas_ocor_msg_grupo` WRITE;
/*!40000 ALTER TABLE `clas_ocor_msg_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `clas_ocor_msg_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_ocorrencia`
--

DROP TABLE IF EXISTS `classificacao_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificacao_ocorrencia` (
  `id_classificacao_ocorrencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `icone` longblob,
  `nome_classificacao_ocorrencia` varchar(255) NOT NULL,
  PRIMARY KEY (`id_classificacao_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_ocorrencia`
--

LOCK TABLES `classificacao_ocorrencia` WRITE;
/*!40000 ALTER TABLE `classificacao_ocorrencia` DISABLE KEYS */;
INSERT INTO `classificacao_ocorrencia` VALUES (1,NULL,'BRIGA'),(2,NULL,'ALARME'),(3,NULL,'FOGO'),(4,NULL,'TUMULTO'),(5,NULL,'ROUBO'),(6,NULL,'√ÅGUA'),(7,NULL,'ACIDENTE'),(8,NULL,'INVAS√ÉO'),(9,NULL,'MANUTEN√á√ÉO'),(10,NULL,'FERIDO'),(11,NULL,'MORTE');
/*!40000 ALTER TABLE `classificacao_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_procedimento`
--

DROP TABLE IF EXISTS `classificacao_procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificacao_procedimento` (
  `id_classificacao_ocorrencia` bigint(20) NOT NULL DEFAULT '0',
  `id_procedimento` bigint(20) NOT NULL DEFAULT '0',
  `nr_item` int(11) NOT NULL,
  PRIMARY KEY (`id_classificacao_ocorrencia`,`id_procedimento`),
  KEY `FK_798d2ckxb1qtmxo8rc86c898f` (`id_classificacao_ocorrencia`),
  KEY `FK_ajjhoqdj8x89gsnvne8fi9dda` (`id_procedimento`),
  CONSTRAINT `FK_ajjhoqdj8x89gsnvne8fi9dda` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`),
  CONSTRAINT `FK_798d2ckxb1qtmxo8rc86c898f` FOREIGN KEY (`id_classificacao_ocorrencia`) REFERENCES `classificacao_ocorrencia` (`id_classificacao_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_procedimento`
--

LOCK TABLES `classificacao_procedimento` WRITE;
/*!40000 ALTER TABLE `classificacao_procedimento` DISABLE KEYS */;
INSERT INTO `classificacao_procedimento` VALUES (1,15,1),(1,16,2),(1,17,3),(2,15,1),(2,16,2),(2,17,3),(3,15,1),(3,16,2),(3,17,3),(4,15,1),(4,16,2),(4,17,3),(5,15,1),(5,16,2),(5,17,3),(6,15,1),(6,16,2),(6,17,3),(7,15,1),(7,16,2),(7,17,3),(8,15,1),(8,16,2),(8,17,3),(9,15,1),(9,16,2),(9,17,3),(10,15,1),(10,16,2),(10,17,3),(11,15,1),(11,16,2),(11,17,3);
/*!40000 ALTER TABLE `classificacao_procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `celular_contato` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `email_contato` varchar(255) DEFAULT NULL,
  `ie` varchar(255) DEFAULT NULL,
  `logo` longblob,
  `nome_contato` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) NOT NULL,
  `site` varchar(255) DEFAULT NULL,
  `telefone_contato` varchar(255) NOT NULL,
  `id_contratante` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `FK_6852xex5p9p3a5f8d8d2pb60g` (`id_contratante`),
  CONSTRAINT `FK_6852xex5p9p3a5f8d8d2pb60g` FOREIGN KEY (`id_contratante`) REFERENCES `contratante` (`id_contratante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'(11) 99171-7827','19.335.987/0001-23',NULL,'sidney@kobel.com.br','ISENTO',NULL,'Sidney Samitsu da Silva','Kobel','Kobel','www.kobel.com.br','(11) 4427-7554',1),(2,1,'(11) 98448-5577','11.222.333/0001-44',NULL,'marcus@belfort.com.br','ISENTO',NULL,'Marcus Sandin','Belfort','Belfort','www.belfort.com.br','(11) 3723-2020',2),(3,1,'(11) 99171-7827','22.333.444/0001-55',NULL,'sidney@kobel.com.br','ISENTO',NULL,'Sidney Samitsu da Silva','Copa do Mundo de 2014','Copa do Mundo de 2014','www.brasil2014.com.br','(11) 4427-7554',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_class_ocorr`
--

DROP TABLE IF EXISTS `cliente_class_ocorr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_class_ocorr` (
  `id_classificacao_ocorrencia` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  PRIMARY KEY (`id_classificacao_ocorrencia`,`id_cliente`),
  KEY `FK_glu27mr6sw09v1d7gejmapuhx` (`id_cliente`),
  KEY `FK_own3xv4s53rnm1omwh754h5ib` (`id_classificacao_ocorrencia`),
  CONSTRAINT `FK_own3xv4s53rnm1omwh754h5ib` FOREIGN KEY (`id_classificacao_ocorrencia`) REFERENCES `classificacao_ocorrencia` (`id_classificacao_ocorrencia`),
  CONSTRAINT `FK_glu27mr6sw09v1d7gejmapuhx` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_class_ocorr`
--

LOCK TABLES `cliente_class_ocorr` WRITE;
/*!40000 ALTER TABLE `cliente_class_ocorr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_class_ocorr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_mensagem`
--

DROP TABLE IF EXISTS `cliente_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_mensagem` (
  `id_mensagem` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  PRIMARY KEY (`id_mensagem`,`id_cliente`),
  KEY `FK_6jo0xxih4e2583l1cn9lhqyyl` (`id_cliente`),
  KEY `FK_6rvg8of71lrk8rht05bonb17c` (`id_mensagem`),
  CONSTRAINT `FK_6rvg8of71lrk8rht05bonb17c` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`),
  CONSTRAINT `FK_6jo0xxih4e2583l1cn9lhqyyl` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_mensagem`
--

LOCK TABLES `cliente_mensagem` WRITE;
/*!40000 ALTER TABLE `cliente_mensagem` DISABLE KEYS */;
INSERT INTO `cliente_mensagem` VALUES (12,1),(13,1),(15,1),(17,1),(19,1),(32,1),(33,1),(34,1),(12,2),(13,2),(15,2),(17,2),(19,2),(32,2),(33,2),(34,2),(12,3),(13,3),(15,3),(17,3),(19,3),(32,3),(33,3),(34,3);
/*!40000 ALTER TABLE `cliente_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracao_email`
--

DROP TABLE IF EXISTS `configuracao_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracao_email` (
  `id_config_email` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_name` varchar(255) DEFAULT NULL,
  `from_sender` varchar(255) DEFAULT NULL,
  `host_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `smtp_port` int(11) NOT NULL,
  `ssl_on_Connect` tinyint(1) NOT NULL,
  `start_tls_enable` tinyint(1) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_config_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao_email`
--

LOCK TABLES `configuracao_email` WRITE;
/*!40000 ALTER TABLE `configuracao_email` DISABLE KEYS */;
INSERT INTO `configuracao_email` VALUES (1,'NicBrain','nicbrain@kobel.com.br','smtp.abc.terra.com.br','nickobel',587,0,0,'nicbrain@kobel.com.br');
/*!40000 ALTER TABLE `configuracao_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contexto`
--

DROP TABLE IF EXISTS `contexto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contexto` (
  `id_usuario` bigint(20) NOT NULL,
  `id_evento` bigint(20) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_evento`),
  KEY `FK_sta8eojmcjgie1bcmwvn7fk0j` (`id_evento`),
  KEY `FK_ak5xd3122xp5q41km8idrkh0k` (`id_usuario`),
  CONSTRAINT `FK_ak5xd3122xp5q41km8idrkh0k` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_sta8eojmcjgie1bcmwvn7fk0j` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contexto`
--

LOCK TABLES `contexto` WRITE;
/*!40000 ALTER TABLE `contexto` DISABLE KEYS */;
INSERT INTO `contexto` VALUES (1,1),(2,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(1,2),(2,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(1,3),(2,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(1,4),(2,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(1,5),(2,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(1,6),(2,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(1,7),(2,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(1,8),(2,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(1,9),(2,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(1,10),(2,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(1,11),(2,11),(4,11),(5,11),(6,11),(7,11),(8,11),(9,11),(3,12),(10,12),(11,12),(12,12),(1,13),(2,13),(4,13),(5,13),(6,13),(7,13),(8,13),(9,13);
/*!40000 ALTER TABLE `contexto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratante`
--

DROP TABLE IF EXISTS `contratante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratante` (
  `id_contratante` bigint(20) NOT NULL AUTO_INCREMENT,
  `celular_contato` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `email_contato` varchar(255) DEFAULT NULL,
  `ie` varchar(255) DEFAULT NULL,
  `logo` longblob,
  `nome_contato` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) NOT NULL,
  `site` varchar(255) DEFAULT NULL,
  `telefone_contato` varchar(255) NOT NULL,
  `id_config_email` bigint(20) DEFAULT NULL,
  `id_segmento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_contratante`),
  KEY `FK_s4c4n4bhdqebp1a519y7c4kl5` (`id_config_email`),
  KEY `FK_nawcxjhnji92fxx6ykej9iq9m` (`id_segmento`),
  CONSTRAINT `FK_nawcxjhnji92fxx6ykej9iq9m` FOREIGN KEY (`id_segmento`) REFERENCES `segmento` (`id_segmento`),
  CONSTRAINT `FK_s4c4n4bhdqebp1a519y7c4kl5` FOREIGN KEY (`id_config_email`) REFERENCES `configuracao_email` (`id_config_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratante`
--

LOCK TABLES `contratante` WRITE;
/*!40000 ALTER TABLE `contratante` DISABLE KEYS */;
INSERT INTO `contratante` VALUES (1,'(11) 99171-7827','19.335.987/0001-23',NULL,'sidney@kobel.com.br','ISENTO',NULL,'Sidney Samitsu da Silva','Kobel','Empresa especializada em solu√ß√µs de seguran√ßa','Kobel Software Ltda','www.kobel.com.br','(11) 4427-7554',1,1),(2,'(11) 98448-5577','11.222.333/0001-44',NULL,'marcus@belfort.com.br','ISENTO',NULL,'Marcus Sandin','Belfort','Belfort','Belfort','www.belfort.com.br','(11) 3723-2020',1,1);
/*!40000 ALTER TABLE `contratante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id_departamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_departamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Seguran√ßa Patrimonial'),(2,'Tecnologia da Informa√ß√£o'),(3,'Administrativo'),(4,'Comercial');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id_device` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_ultimo_login` datetime NOT NULL,
  `id_projeto` varchar(255) NOT NULL,
  `id_registro` varchar(255) NOT NULL,
  `id_usuario_responsavel` bigint(20) NOT NULL,
  PRIMARY KEY (`id_device`),
  UNIQUE KEY `UK_brtoxib2dxfv8mtc3n9283mwf` (`id_registro`),
  UNIQUE KEY `UK_paopycgnr5jsml1id4kyxdna4` (`id_usuario_responsavel`),
  KEY `FK_paopycgnr5jsml1id4kyxdna4` (`id_usuario_responsavel`),
  CONSTRAINT `FK_paopycgnr5jsml1id4kyxdna4` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_anexo`
--

DROP TABLE IF EXISTS `documento_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_anexo` (
  `id_documento_anexo` bigint(20) NOT NULL AUTO_INCREMENT,
  `documento_anexo` longblob NOT NULL,
  `nome_anexo` varchar(255) NOT NULL,
  `id_local` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_documento_anexo`),
  KEY `FK_dh0gqksom2b4t161cqwhdq54v` (`id_local`),
  CONSTRAINT `FK_dh0gqksom2b4t161cqwhdq54v` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_anexo`
--

LOCK TABLES `documento_anexo` WRITE;
/*!40000 ALTER TABLE `documento_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_pessoa`
--

DROP TABLE IF EXISTS `email_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_pessoa` (
  `id_email` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_atual` tinyint(1) NOT NULL,
  `id_pessoa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_email`),
  KEY `FK_arxv6ud1fd0r0h799m5i45ujf` (`id_pessoa`),
  CONSTRAINT `FK_arxv6ud1fd0r0h799m5i45ujf` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_pessoa`
--

LOCK TABLES `email_pessoa` WRITE;
/*!40000 ALTER TABLE `email_pessoa` DISABLE KEYS */;
INSERT INTO `email_pessoa` VALUES (1,'2014-12-17 09:52:08','administrador@kobel.com.br',1,1),(2,'2014-12-17 09:52:08','sidney@kobel.com.br',1,2),(3,'2014-12-17 09:52:08','marcus@belfort.com.br',1,3),(4,'2014-12-17 09:52:08','ederson@kolss.com.br',1,4),(5,'2014-12-17 09:52:08','alexandre@kolss.com.br',1,5),(6,'2014-12-17 09:52:08','eduardo@kolss.com.br',1,6),(7,'2014-12-17 09:52:08','opepadrao@kolss.com.br',1,7),(8,'2014-12-17 09:52:08','opemaster@kolss.com.br',1,8),(9,'2014-12-17 09:52:08','leonardo@kolss.com.br',1,9),(10,'2014-12-17 09:52:08','lamorim@belfort.com.br',1,10),(11,'2014-12-17 09:52:08','wxavier@belfort.com.br',1,11),(12,'2014-12-17 09:52:08','opebelfort@belfort.com.br',1,12),(13,'2014-12-17 09:52:08','anderson@kolss.com.br',1,13);
/*!40000 ALTER TABLE `email_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id_endereco` bigint(20) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL,
  `endereco_atual` tinyint(1) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_contratante` bigint(20) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `id_local` bigint(20) DEFAULT NULL,
  `id_municipio` bigint(20) NOT NULL,
  `id_pessoa` bigint(20) DEFAULT NULL,
  `id_tipo_endereco` bigint(20) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `FK_fgys7g3e5y42b6vvfpvjplmqj` (`id_cliente`),
  KEY `FK_p40mmgoi9c8w5xb7y1orgdb2b` (`id_contratante`),
  KEY `FK_2d9sj584nv4eptj1av6w5uc9r` (`id_fornecedor`),
  KEY `FK_2wbk047orng1x9csa6m1edupy` (`id_local`),
  KEY `FK_875mks9jrnr9cwl8p75rskgm4` (`id_municipio`),
  KEY `FK_j3dmglb2gm3gnum7qgf2ccbhf` (`id_pessoa`),
  KEY `FK_dklhs0fdnlraig88pkbso3u1a` (`id_tipo_endereco`),
  CONSTRAINT `FK_dklhs0fdnlraig88pkbso3u1a` FOREIGN KEY (`id_tipo_endereco`) REFERENCES `tipo_endereco` (`id_tipo_endereco`),
  CONSTRAINT `FK_2d9sj584nv4eptj1av6w5uc9r` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `FK_2wbk047orng1x9csa6m1edupy` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`),
  CONSTRAINT `FK_875mks9jrnr9cwl8p75rskgm4` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`),
  CONSTRAINT `FK_fgys7g3e5y42b6vvfpvjplmqj` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_j3dmglb2gm3gnum7qgf2ccbhf` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`),
  CONSTRAINT `FK_p40mmgoi9c8w5xb7y1orgdb2b` FOREIGN KEY (`id_contratante`) REFERENCES `contratante` (`id_contratante`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,' Vila Bastos','09040-210','Sala 12','-23.658226','-46.533063','2014-12-17 09:51:35',1,'Av. Jos√© Caballero',65,NULL,1,NULL,NULL,2,NULL,2),(2,' Jd. Trussardi','05518-000',NULL,'-23.584511','-46.729257','2014-12-17 09:51:35',1,'Rua Santa Albina',430,NULL,2,NULL,NULL,1,NULL,2),(3,' Vila Bastos','09040-210','Sala 12','-23.658226','-46.533063','2014-12-17 09:51:35',1,'Av. Jos√© Caballero',65,1,NULL,NULL,NULL,2,NULL,2),(4,' Jd. Trussardi','05518-000',NULL,'-23.584511','-46.729257','2014-12-17 09:51:35',1,'Rua Santa Albina',430,2,NULL,NULL,NULL,1,NULL,2),(5,'Barra da Tijuca','22783-127','Rio Centro-Port√£o B','-22.978049','-43.411488','2014-12-17 09:51:35',1,'Av. Salvador Allende',6555,3,NULL,NULL,NULL,1,NULL,2),(6,' Vila Bastos','09040-210','Sala 12','-23.658226','-46.533063','2014-12-17 10:00:00',1,'Av. Jos√© Caballero',65,NULL,NULL,NULL,1,2,NULL,2),(7,' Jd. Trussardi','05518-000',NULL,'-23.584511','-46.729257','2014-12-17 10:00:00',1,'Rua Santa Albina',430,NULL,NULL,NULL,2,1,NULL,2),(8,'Barra da Tijuca','22783-127','Rio Centro-Port√£o B','-22.978049','-43.411488','2014-12-17 10:00:00',1,'Av. Salvador Allende',6555,NULL,NULL,NULL,3,3,NULL,2),(9,'Maracan√£','20271-150',NULL,'-22.913931','-43.230989','2014-12-17 10:03:51',1,'Rua Professor Eurico Rabelo',20271,NULL,NULL,NULL,4,3,NULL,2),(10,'Itaquera','08295-005',NULL,'-23.543503','-46.476490','2014-12-17 10:03:52',1,'Rua Doutor Lu√≠s Aires',0,NULL,NULL,NULL,5,1,NULL,2),(11,'S√£o Lu√≠s','31275-000',NULL,'-19.865015','-43.970914','2014-12-17 10:03:52',1,'Rua Ant√¥nio Abrah√£o Caram',1001,NULL,NULL,NULL,6,4,NULL,2),(12,'Flores','69058-795',NULL,'-3.0838035','-60.026296','2014-12-17 10:03:52',1,'Constantino Nery',0,NULL,NULL,NULL,7,5,NULL,2),(13,'Verd√£o','78030-210',NULL,'-15.60379','-56.121605','2014-12-17 10:03:52',1,'Agr√≠cola Paes de Barros',0,NULL,NULL,NULL,8,7,NULL,2),(14,'Asa Norte','70077-000',NULL,'-15.783839','-47.897319','2014-12-17 10:03:52',1,'Complexo Poliesportivo Ayrton Senna',0,NULL,NULL,NULL,9,6,NULL,2),(15,'Castel√£o','60861-211',NULL,'-3.807231','-38.522434','2014-12-17 10:03:52',1,'Rua Alberto Craveiro',2901,NULL,NULL,NULL,10,9,NULL,2),(16,'Lagoa Nova','59056-200',NULL,'-5.8269481','-35.2134785','2014-12-17 10:03:52',1,'Av. Presidente Prudente de Morais',5121,NULL,NULL,NULL,11,10,NULL,2),(17,'Jardim Tenedo','54710-010',NULL,'-8.041675','-35.00782','2014-12-17 10:03:52',1,'Av. Deus √© Fiel',1,NULL,NULL,NULL,12,12,NULL,2),(18,'Nazar√©','40050-360',NULL,'-12.978644','-38.504044','2014-12-17 10:03:52',1,'Av. Presidente Costa e Silva',0,NULL,NULL,NULL,13,13,NULL,2),(19,'√Ågua Verde','80250-070',NULL,'-25.447873','-49.275899','2014-12-17 10:03:52',1,'Rua Buenos Aires',0,NULL,NULL,NULL,14,8,NULL,2),(201,'Praia de Belas','90810-240',NULL,'-30.0650812','-51.2352245','2014-12-17 10:03:52',1,'Rua Padre Cacique',891,NULL,NULL,NULL,15,11,NULL,2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipamento` (
  `id_equipamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ip_equipamento` varchar(255) DEFAULT NULL,
  `nome_equipamento` varchar(255) DEFAULT NULL,
  `nr_serie_equipamento` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `usuario_acesso` varchar(255) DEFAULT NULL,
  `id_modelo_equipamento` bigint(20) DEFAULT NULL,
  `id_setor` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_equipamento`),
  KEY `FK_69c4gwvyo37x65hw0e1onti56` (`id_modelo_equipamento`),
  KEY `FK_6mmpqe9rf88rbmce6eljxc760` (`id_setor`),
  CONSTRAINT `FK_6mmpqe9rf88rbmce6eljxc760` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id_setor`),
  CONSTRAINT `FK_69c4gwvyo37x65hw0e1onti56` FOREIGN KEY (`id_modelo_equipamento`) REFERENCES `modelo_equipamento` (`id_modelo_equipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (1,1,'-23.658226','46.533063','2014-12-17 10:04:55','http://sservices.dyndns.org:8181/videostream.cgi?user=admin&pwd=123&resolution=32&rate=30','C√¢mera 1','123456','senha','usuario',1,1),(2,1,' -22.910840','-43.231059','2014-12-17 10:04:55','mms://201.87.159.148/VO_KM_41.990_270','C√¢mera 1a','123456','senha','usuario',1,2),(3,1,' -22.911095','-43.229671','2014-12-17 10:04:55','rtsp://live240.impek.com/soleiltv/video','C√¢mera 1b','123456','senha','usuario',1,2),(4,1,'-22.912650','-43.230963','2014-12-17 10:04:55','rtsp://plazacam.studentaffairs.duke.edu:554/axis-media/media.amp?videocodec=h264','C√¢mera 2a','123456','senha','usuario',1,6),(5,1,'-22.911055','-43.228306','2014-12-17 10:04:55','mms://201.87.159.148/VO_KM_13.000_280','C√¢mera 2b','123456','senha','usuario',1,6),(6,1,'-22.913000','-43.231059','2014-12-17 10:04:55',' http://sservices.dyndns.org:8181/videostream.cgi?user=admin&pwd=123&resolution=32&rate=30','C√¢mera 2c','123456','senha','usuario',1,6),(7,1,'-23.584511','-46.729257','2014-12-17 10:04:55',' http://sservices.dyndns.org:8181/videostream.cgi?user=admin&pwd=123&resolution=32&rate=30','C√¢mera 3','123456','senha','usuario',1,7);
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(255) NOT NULL,
  `sigla_estado` varchar(255) NOT NULL,
  `id_pais` bigint(20) NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `FK_814hrp242abxs5hwm4huf7j92` (`id_pais`),
  CONSTRAINT `FK_814hrp242abxs5hwm4huf7j92` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'S√£o Paulo','SP',1),(2,'Rio de Janeiro','RJ',1),(3,'Minas Gerais','MG',1),(4,'Acre','AC',1),(5,'Alagoas','AL',1),(6,'Amap√°','AP',1),(7,'Amazonas','AM',1),(8,'Bahia','BA',1),(9,'Cear√°','CE',1),(10,'Distrito Federal','DF',1),(11,'Esp√≠rito Santo','ES',1),(12,'Goi√°s','GO',1),(13,'Tocantins','TO',1),(14,'Maranh√£o','MA',1),(15,'Mato Grosso','MT',1),(16,'Mato Grosso do Sul','MS',1),(17,'Par√°','PA',1),(18,'Para√≠ba','PB',1),(19,'Paran√°','PR',1),(20,'Pernambuco','PE',1),(21,'Piau√≠','PI',1),(22,'Rio Grande do Norte','RN',1),(23,'Rio Grande do Sul','RS',1),(24,'Rond√¥nia','RO',1),(25,'Roraima','RR',1),(26,'Santa Catarina','SC',1),(27,'Sergipe','SE',1);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `data_fim_evento` datetime NOT NULL,
  `data_inicio_evento` datetime NOT NULL,
  `nome_evento` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `id_local` bigint(20) DEFAULT NULL,
  `id_usuario_responsavel` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `FK_k035c9pq1qrc8e4l9a145pmta` (`id_local`),
  KEY `FK_2r9jhsrp02l6dvcfdmvic87wt` (`id_usuario_responsavel`),
  CONSTRAINT `FK_2r9jhsrp02l6dvcfdmvic87wt` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_k035c9pq1qrc8e4l9a145pmta` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,1,'2014-12-17 10:04:23','2014-11-12 19:00:00','2014-11-12 17:00:00','Brasil x Cro√°cia','GSS',5,7),(2,1,'2014-12-17 10:04:23','2014-11-13 15:00:00','2014-11-13 13:00:00','M√©xico x Camar√µes','GSS',11,7),(3,1,'2014-12-17 10:04:23','2014-11-13 18:00:00','2014-11-13 16:00:00','Espanha x Holanda','GSS',13,7),(4,1,'2014-12-17 10:04:23','2014-11-13 21:00:00','2014-11-13 19:00:00','Chile x Austr√°lia','GSS',8,7),(5,1,'2014-12-17 10:04:23','2014-11-22 15:00:00','2014-11-22 13:00:00','Colombia x Gr√©cia','GSS',6,7),(6,1,'2014-12-17 10:04:23','2014-11-22 18:00:00','2014-11-22 16:00:00','Uruguai x Costa Rica','GSS',10,7),(7,1,'2014-12-17 10:04:23','2014-11-22 21:00:00','2014-11-22 19:00:00','Inglaterra x It√°lia','GSS',7,7),(8,1,'2014-12-17 10:04:23','2014-11-22 00:00:00','2014-11-22 22:00:00','Costa do Marfim x Jap√£o','GSS',12,7),(9,1,'2014-12-17 10:04:23','2014-11-22 15:00:00','2014-11-22 13:00:00','Su√≠√ßa x Equador','GSS',9,7),(10,1,'2014-12-17 10:04:23','2014-11-22 18:00:00','2014-11-22 16:00:00','Fran√ßa x Honduras','GSS',15,7),(11,1,'2014-12-17 10:04:23','2014-11-22 21:00:00','2014-11-22 19:00:00','Argentina x B√≥snia','GSS',4,7),(12,1,'2014-12-17 10:04:23','2014-11-30 18:00:00','2014-11-22 08:00:00','Ronda de Seguran√ßa','Supervisor Belfort',2,12),(13,1,'2014-12-17 10:04:23','2014-11-30 18:00:00','2014-11-01 08:00:00','Ronda de Seguran√ßa','Supervisor Kobel',3,12);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulario` (
  `id_formulario` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `descricao_formulario` varchar(255) NOT NULL,
  `nome_formulario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `celular_contato` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `email_contato` varchar(255) DEFAULT NULL,
  `ie` varchar(255) DEFAULT NULL,
  `logo` longblob,
  `nome_contato` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) NOT NULL,
  `site` varchar(255) DEFAULT NULL,
  `telefone_contato` varchar(255) NOT NULL,
  `id_segmento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  KEY `FK_k83gqrdot8562vm1r1vuubyh4` (`id_segmento`),
  CONSTRAINT `FK_k83gqrdot8562vm1r1vuubyh4` FOREIGN KEY (`id_segmento`) REFERENCES `segmento` (`id_segmento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,1,'(21) 92014-2014','222.222.222/0001-22','geral@geral.com.br',NULL,NULL,'Jos√© Jo√£o','Geral','Fornecedor Geral',NULL,'(11) 2222-2222',1);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id_funcionario` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cargo` bigint(20) DEFAULT NULL,
  `id_departamento` bigint(20) DEFAULT NULL,
  `id_funcionario_superior` bigint(20) DEFAULT NULL,
  `id_turno` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `FK_mrg6xeuxxc2o06tmwyhbv88md` (`id_cargo`),
  KEY `FK_7wtf5jrmirs3uk5po6sh2b1ht` (`id_departamento`),
  KEY `FK_8wnnwc8hufia6uqxpbuce0ihf` (`id_funcionario_superior`),
  KEY `FK_boisp6wtqsug3p4snsxhvliqk` (`id_turno`),
  KEY `FK_gp0j9ms3en5ncu7guwvte080a` (`id_usuario`),
  CONSTRAINT `FK_gp0j9ms3en5ncu7guwvte080a` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_7wtf5jrmirs3uk5po6sh2b1ht` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`),
  CONSTRAINT `FK_8wnnwc8hufia6uqxpbuce0ihf` FOREIGN KEY (`id_funcionario_superior`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `FK_boisp6wtqsug3p4snsxhvliqk` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`),
  CONSTRAINT `FK_mrg6xeuxxc2o06tmwyhbv88md` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,2,2,2,NULL,1),(2,1,2,4,NULL,2),(3,3,1,NULL,NULL,3),(4,3,2,NULL,NULL,4),(5,2,2,2,NULL,5),(6,2,2,2,NULL,6),(7,2,2,2,NULL,7),(8,2,2,2,NULL,8),(9,2,2,2,NULL,9),(10,4,1,3,NULL,10),(11,4,1,3,NULL,11),(12,5,1,10,NULL,12),(13,2,2,2,NULL,13);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id_genero` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_genero` varchar(255) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Feminino');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gravidade_ocorrencia`
--

DROP TABLE IF EXISTS `gravidade_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gravidade_ocorrencia` (
  `id_gravidade_ocorrencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `icone` longblob,
  `nome_gravidade_ocorrencia` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gravidade_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravidade_ocorrencia`
--

LOCK TABLES `gravidade_ocorrencia` WRITE;
/*!40000 ALTER TABLE `gravidade_ocorrencia` DISABLE KEYS */;
INSERT INTO `gravidade_ocorrencia` VALUES (1,NULL,'M√°xima'),(2,NULL,'Alta'),(3,NULL,'M√©dia'),(4,NULL,'Baixa');
/*!40000 ALTER TABLE `gravidade_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime DEFAULT NULL,
  `nome_grupo` varchar(255) NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `FK_n3gon5nnx2rsx5qvym53gdna9` (`id_usuario`),
  CONSTRAINT `FK_n3gon5nnx2rsx5qvym53gdna9` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,NULL,'Superior Imediato',NULL),(2,NULL,'Gerentes',NULL),(3,NULL,'Diretores',NULL),(4,NULL,'Respons√°vel',NULL),(5,NULL,'Superintendente',NULL),(6,NULL,'Vice-Presidente',NULL),(7,NULL,'Presidente',NULL),(8,NULL,'Supervisor',NULL),(9,NULL,'Operador',NULL),(10,NULL,'Operador Master',NULL),(11,NULL,'nicBrain',NULL);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_usuario` (
  `id_grupo` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_usuario`),
  KEY `FK_nlx14csb9wsbdq0asxlep646` (`id_usuario`),
  KEY `FK_fhkqrklr51yuin1uh1t3523ee` (`id_grupo`),
  CONSTRAINT `FK_fhkqrklr51yuin1uh1t3523ee` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `FK_nlx14csb9wsbdq0asxlep646` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_usuario`
--

LOCK TABLES `grupo_usuario` WRITE;
/*!40000 ALTER TABLE `grupo_usuario` DISABLE KEYS */;
INSERT INTO `grupo_usuario` VALUES (2,2),(3,2),(4,2),(9,2),(11,2),(3,3),(3,4),(9,4),(9,5),(11,5),(9,6),(11,6),(9,7),(9,9),(11,9),(10,10),(9,11),(9,12),(9,13),(11,13);
/*!40000 ALTER TABLE `grupo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local` (
  `id_local` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `celular_responsavel` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL,
  `distancia_limite` int(11) DEFAULT NULL,
  `email_responsavel` varchar(255) DEFAULT NULL,
  `icone_local` longblob,
  `logo_local` longblob,
  `nome_local` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `responsavel_local` varchar(255) DEFAULT NULL,
  `site_local` varchar(255) DEFAULT NULL,
  `telefone_local` varchar(255) DEFAULT NULL,
  `telefone_responsavel` varchar(255) DEFAULT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_tipo_local` bigint(20) NOT NULL,
  `id_usuario_responsavel` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_local`),
  KEY `FK_jnsoct9kqqtngn4diyjghpdrk` (`id_cliente`),
  KEY `FK_ave0cx9hkyks8031wjm5ckbgj` (`id_tipo_local`),
  KEY `FK_q0dxh9vq8hte2sqthaato20aj` (`id_usuario_responsavel`),
  CONSTRAINT `FK_q0dxh9vq8hte2sqthaato20aj` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_ave0cx9hkyks8031wjm5ckbgj` FOREIGN KEY (`id_tipo_local`) REFERENCES `tipo_local` (`id_tipo_local`),
  CONSTRAINT `FK_jnsoct9kqqtngn4diyjghpdrk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,1,'(11) 99171-7827','-23.658226','-46.533063','2014-12-17 10:00:00',100,'sidney@kobel.com.br',NULL,NULL,'Escrit√≥rio da Kobel','Escrit√≥rio Kobel - Santo Andr√©','Sidney Samitsu da Silva','www.kobel.com.br','(11) 4427-7554','(11) 4427-7554',1,2,2),(2,1,'(11) 98448-5577','-23.584511','-46.729257','2014-12-17 10:00:00',100,'marcus@belfort.com.br',NULL,NULL,'Escrit√≥rio da Belfort','Escrit√≥rio Belfort ‚Äì S√£o Paulo','Marcus Sandin','www.belfort.com.br','(11) 3723-2020','(11) 3723-2020',2,2,3),(3,1,NULL,NULL,NULL,'2014-12-17 10:00:00',100,'gss@brasil2014.com.br',NULL,NULL,'COL - Rio Centro','Rio Centro ‚Äì Rio de Janeiro','GSS COL',NULL,'(21) 2014-2014','(21) 2014-2014',1,2,2),(4,1,'(21) 2014-2014',NULL,NULL,'2014-12-17 10:03:51',100,'gss@brasil2014.com.br',NULL,NULL,'Est√°dio do Maracan√£','Est√°dio M√°rio Filho','GSS Maracan√£',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(5,1,'(11) 2014-2014',NULL,NULL,'2014-12-17 10:03:51',100,'gss@brasil2014.com.br',NULL,NULL,'Arena de S√£o Paulo','Arena Corinthians','GSS S√£o Paulo',NULL,'(21) 2014-2014','(11) 2014-2014',1,1,2),(6,1,'(31) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Est√°dio Mineir√£o','Est√°dio Governador Magalh√£es Pinto','GSS Miner√£o',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(7,1,'(92) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Arena da Amaz√¥nia','Arena da Amaz√¥nia - Manaus','GSS Amaz√¥nia',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(8,1,'(65) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Arena Pantanal','Arena Pantanal - Cuiab√°','GSS Pantanal',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(9,1,'(61) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Est√°dio Nacional','Man√© Garrincha - Bras√≠lia','GSS Nacional',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(10,1,'(85) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Est√°dio Castel√£o','Castel√£o - Fortaleza','GSS Castel√£o',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(11,1,'(84) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Est√°dio das Dunas','Arena das Dunas - Natal','GSS Dunas',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(12,1,'(81) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Arena Pernambuco','Arena Pernambuco - Recife','GSS Pernambuco',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(13,1,'(71) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Arena Fonte Nova','Fonte Nova - Salvador','GSS Fonte Nova',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(14,1,'(41) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Arena da Baixada','Arena da Baixada - Curitiba','GSS Baixada',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2),(15,1,'(51) 2014-2014',NULL,NULL,'2014-12-17 10:03:52',100,'gss@brasil2014.com.br',NULL,NULL,'Est√°dio Beira Rio','Beira Rio ‚Äì Porto Alegre','GSS Beira Rio',NULL,'(21) 2014-2014','(21) 2014-2014',1,1,2);
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagem` (
  `id_mensagem` bigint(20) NOT NULL AUTO_INCREMENT,
  `atividade` tinyint(1) NOT NULL,
  `atividade_ocorrencia` tinyint(1) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `checklist` tinyint(1) NOT NULL,
  `descricao_mensagem` varchar(255) DEFAULT NULL,
  `ocorrencia` tinyint(1) NOT NULL,
  `id_tipo_mensagem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_mensagem`),
  KEY `FK_ji2fqr0d2glid60c9vcmn9wao` (`id_tipo_mensagem`),
  CONSTRAINT `FK_ji2fqr0d2glid60c9vcmn9wao` FOREIGN KEY (`id_tipo_mensagem`) REFERENCES `tipo_mensagem` (`id_tipo_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,1,1,1,1,'In√≠cio na data e hora prevista',1,1),(2,1,1,1,1,'In√≠cio dentro do periodo de toler√¢ncia',1,1),(3,1,1,1,1,'25% do tempo percorrido',1,1),(4,1,1,1,1,'50% do tempo percorrido',1,1),(5,1,1,1,1,'75% do tempo percorrido',1,1),(6,1,1,1,0,'Parab√©ns, atividade conclu√≠da com √™xito',1,1),(7,1,1,1,0,'Atividade conclu√≠da dentro do per√≠odo de toler√¢ncia com √™xito',1,1),(8,0,1,1,1,'Parab√©ns, checklist conclu√≠do com √™xito',1,1),(9,1,1,1,1,'Checklist conclu√≠do com √™xito dentro do per√≠odo de toler√¢ncia',1,1),(10,0,1,1,1,'Produtividade da atividade',1,1),(11,0,1,1,1,'Produtividade do checklist',1,1),(12,1,1,1,1,'In√≠cio n√£o realizado na data e hora prevista',1,2),(13,1,1,1,1,'In√≠cio com atraso',1,2),(14,1,1,1,1,'Estouro do tempo de toler√¢ncia para in√≠cio',1,2),(15,1,1,1,1,'Estouro do tempo previsto para finaliza√ß√£o',1,2),(16,1,1,1,1,'Estouro do per√≠odo previsto para finaliza√ß√£o',1,2),(17,1,1,1,1,'Finalizado com atraso',1,2),(18,1,1,1,1,'Checklist ou atividade Pausada',1,2),(19,1,1,1,1,'Checklist Cancelado',1,2),(20,0,1,1,1,'Checklist e atividades pendentes',1,2),(21,0,1,1,1,'Clientes n√£o visitados na semana',1,2),(22,1,1,1,0,'Atividade por per√≠odo n√£o iniciada',1,2),(23,1,1,1,1,'Realiza√ß√£o fora do local designado',1,2),(24,0,1,1,0,'Alerta manual',1,2),(25,0,1,1,0,'Alerta de equipamento com defeito',1,2),(26,0,1,1,1,'Item Normas e procedimentos / treinamento avaliado como Ruim - vide relat√≥rio de \n\nOSs',1,2),(27,0,1,1,1,'Itens SARCC RQO e Nextel / Celular avaliado como Ruim - vide relat√≥rio de \n\nOSs',1,2),(28,0,1,1,0,'Item Normas e procedimentos / treinamento avaliado como Ruim menos de 10 vezes no \n\nm√™s',1,2),(29,0,1,1,0,'Respostas semelhantes nas OSs do dia - vide relat√≥rio de OSs',1,2),(30,0,1,1,1,'Respostas pontuadas como RUIM nas OSs - vide relat√≥rio de OSs',1,2),(31,0,1,1,0,' Alerta Mensal de Desempenho',1,2),(32,0,1,1,0,'Voc√™ possui checklist e atividades agendadas. Consulte o sistema.',1,1),(33,1,1,1,1,'Alerta de Ocorr√™ncia',1,2),(34,1,1,1,1,'Atividade Cancelada',1,2),(35,1,1,1,1,'Atividade n√£o realizada no per√≠metro designado',1,2);
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `descricao_menu` varchar(255) DEFAULT NULL,
  `lado_menu` char(1) DEFAULT NULL,
  `nome_menu` varchar(255) DEFAULT NULL,
  `nr_item_menu` int(11) NOT NULL,
  `url_icone` varchar(255) DEFAULT NULL,
  `url_menu` varchar(255) DEFAULT NULL,
  `id_menu_superior` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `FK_jpab1ndrrmy6s7tpsxs3kfcx1` (`id_menu_superior`),
  CONSTRAINT `FK_jpab1ndrrmy6s7tpsxs3kfcx1` FOREIGN KEY (`id_menu_superior`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Contratante','E','menu.contratante',1,'/images/iconesNovos/contratante.png',NULL,NULL),(2,1,'Perfil de Acesso','E','menu.perfiAcesso',2,'/images/iconesNovos/perfil-acesso.png',NULL,NULL),(3,1,'Usu√°rio','E','menu.usuario',3,'/images/iconesNovos/usuario.png',NULL,NULL),(4,1,'Dados Mestres','E','menu.dadosMestres',4,'/images/iconesNovos/dados-mestre.png',NULL,NULL),(5,1,'Controle de Acesso','E','menu.controleDeAcesso',5,'/images/iconesNovos/controle-acesso.png',NULL,NULL),(6,1,'Ocorr√™ncia','E','menu.ocorrencia',6,'/images/iconesNovos/ocorrencias.png',NULL,NULL),(7,1,'CheckList','E','menu.checklist',7,'/images/iconesNovos/check-list.png',NULL,NULL),(8,1,'Monitorar','E','menu.monitorar',8,'/images/iconesNovos/monitorar.png',NULL,NULL),(9,1,'Rastrear','E','menu.rastrear',9,'/images/iconesNovos/rastrear.png',NULL,NULL),(10,1,'Relat√≥rios','E','menu.relatorio',10,'/images/iconesNovos/relatorios.png',NULL,NULL),(11,1,'Telefones Uteis','E','menu.telefonesUteis',11,'/images/iconesNovos/tel-uteis.png','TelefonesUteis.nicbrain',NULL),(12,1,'Meus Alertas','D','Meus Alertas',12,'/images/icones/icon-alerta.png',NULL,NULL),(13,1,'Envio de Mensagem','D','Envio de Mensagem',13,'/images/icones/icon-mensagem.png',NULL,NULL),(14,1,'C√¢meras','D','C√¢meras',14,'/images/icones/icon-camera.png',NULL,NULL),(15,1,'Documentos','D','Documentos',15,'/images/icones/icon-documento.png',NULL,NULL),(16,1,'Cadastro Contratante','E','menu.cadastroContratante',1,NULL,'ListaContratante.nicbrain',1),(17,1,'Cliente','E','menu.cliente',3,NULL,'ListaCliente.nicbrain',1),(18,1,'Local','E','menu.local',4,NULL,'ListaLocal.nicbrain',1),(19,1,'Evento','E','menu.evento',5,NULL,'ListaEvento.nicbrain',1),(20,1,'Funcion√°rio','E','menu.funcionario',3,NULL,'ListaFuncionario.nicbrain',3),(21,1,'Configura√ß√£o de CheckList e Atividades','E','menu.confChecklist',7,NULL,'ListaConfiguracaoChecklist.nicbrain',1),(22,1,'Cadastro de Equipamentos','E','menu.equipamento',8,NULL,'ListaEquipamento.nicbrain',1),(23,1,'Cadastro de Postos de Servi√ßos','E','menu.postoservico',9,NULL,'ListaPosto.nicbrain',1),(24,1,'Setor','E','menu.setor',10,NULL,'ListaSetor.nicbrain',1),(25,1,'Perfil de Acesso','E','menu.perfilAcesso',1,NULL,'ListaPerfil.nicbrain',2),(26,1,'Usu√°rios','E','menu.usuarios',2,NULL,'ListaUsuarioFuncionario.nicbrain',3),(27,1,'Trocar Senha','E','menu.trocasenha',2,NULL,'TrocarSenha.nicbrain',3),(28,1,'Cargo','E','menu.cargo',1,NULL,'ListaCargo.nicbrain',4),(29,1,'CheckList e Procedimentos','E','menu.checklistProcedimento',2,NULL,'layout.nicbrain',4),(30,1,'CheckList Padr√£o','E','menu.checklistPadrao',1,NULL,'ListaChecklistPadrao.nicbrain',29),(31,1,'Classifica√ß√£o de Ocorr√™ncia ','E','menu.classificacaoOcorrencia',2,NULL,'ListaClassificacaoOcorrencia.nicbrain',29),(32,1,'Procedimento','E','menu.procedimento',3,NULL,'ListaProcedimento.nicbrain',29),(33,1,'Departamento','E','menu.departamento',3,NULL,'ListaDepartamento.nicbrain',4),(34,1,'Estado','E','menu.estado',4,NULL,'ListaEstado.nicbrain',4),(35,1,'Formul√°rio','E','menu.formulario',5,NULL,'layout.nicbrain',4),(36,1,'Formul√°rio','E','menu.formulario',1,NULL,'ListaFormulario.nicbrain',35),(37,1,'Pergunta','E','menu.pergunta',2,NULL,' ListaPergunta.nicbrain',35),(38,1,'T√≥pico','E','menu.topico',3,NULL,'ListaTopico.nicbrain',35),(39,1,'Fornecedor','E','menu.fornecedor',6,NULL,'ListaFornecedor.nicbrain',4),(40,1,'Gravidade Ocorr√™ncia','E','menu.gravidadeOcorrencia',7,NULL,'ListaGravidadeOcorrencia.nicbrain',4),(41,1,'Grupo','E','menu.grupo',8,NULL,'ListaGrupo.nicbrain',4),(42,1,'Mensagem','E','menu.mensagem',9,NULL,'ListaMensagem.nicbrain',4),(43,1,'Menu','E','menu.menu',10,NULL,'ListaMenu.nicbrain',4),(44,1,'Modelo Equipamento','E','menu.modeloequipto',11,NULL,'ListaModeloEquipamento.nicbrain',4),(45,1,'Munic√≠pio','E','menu.municipio',12,NULL,'ListaMunicipio.nicbrain',4),(46,1,'Pa√≠s','E','menu.pais',13,NULL,'ListaPais.nicbrain',4),(47,1,'Segmento','E','menu.segmento',14,NULL,'ListaSegmento.nicbrain',4),(48,1,'Status','E','menu.status',15,NULL,'ListaStatus.nicbrain',4),(49,1,'Telefones Uteis','E','menu.telefonesUteis',16,NULL,'ListaTelefoneUtil.nicbrain',4),(50,1,'Turno','E','menu.turno',17,NULL,'ListaTurno.nicbrain',4),(51,1,'Outras Tabelas','E','menu.outrasTabelas',18,NULL,'layout.nicbrain',4),(52,1,'Tipo de Endere√ßo','E','menu.tipoEndereco',1,NULL,'ListaTipoEndereco.nicbrain',51),(53,1,'Tipo de Envio','E','menu.tipoEnvio',2,NULL,'ListaTipoEnvio.nicbrain',51),(54,1,'Tipo de Equipamento','E','menu.tipoEquipamento',3,NULL,'ListaTipoEquipamento.nicbrain',51),(55,1,'Tipo de Usu√°rio','E','menu.tipousuario',20,NULL,'ListaTipoUsuario.nicbrain',4),(56,1,'Tipo de Mensagem','E','menu.tipoMensagem',5,NULL,'ListaTipoMensagem.nicbrain',51),(57,1,'Tipo de Classifica√ß√£o','E','menu.tipoOcorrencias',6,NULL,'ListaTipoOcorrencia.nicbrain',51),(58,1,'Tipo de Pessoa','E','menu.tipoPessoa',1,NULL,'ListaTipoPessoa.nicbrain',3),(59,1,'Tipo de Servi√ßo','E','menu.tipoServico',8,NULL,'ListaTipoServico.nicbrain',51),(60,1,'Tipo de Telefone','E','menu.tipoTelefone',9,NULL,'ListaTipoTelefone.nicbrain',51),(61,1,'Gen√™ro','E','menu.genero',19,NULL,'listaGenero.nicbrain',4),(62,1,'Cadastro de Pessoas','E','menu.cadastroPessoas',1,NULL,'ListaPessoa.nicbrain',5),(63,1,'Bloqueio de Pessoas','E','menu.bloqueioPessoas',2,NULL,'ListaBloqueioPessoas.nicbrain',5),(64,1,'Cadastro de Ve√≠culos','E','menu.cadastroVeiculos',3,NULL,'ListaVeiculo.nicbrain',5),(65,1,'Bloqueio de Ve√≠culos','E','menu.bloqueioVeiculos',4,NULL,'ListaBloqueioVeiculos.nicbrain',5),(66,1,'Liberar Acesso','E','menu.liberarAcesso',5,NULL,'LiberarAcesso.nicbrain',5),(67,1,'Cadastro de Ocorr√™ncia','E','menu.cadastroOcorrencia',1,NULL,'ListaCadastroOcor.nicbrain',6),(68,1,'Opera√ß√£o de Ocorr√™ncias em lista ','E','menu.listaOcorrencia',2,NULL,'ListaOcorrencia.nicbrain',6),(69,1,'Visualizar Ocorr√™ncias no Mapa ','E','menu.visualizarOcorrencias',3,NULL,'MapaLocalPorOcorrencia.nicbrain',6),(70,1,'Opera√ß√£o de Checklist em Lista','E','menu.listaChecklist',1,NULL,'ListaEventoPorChecklist.nicbrain',7),(71,1,'Visualizar Checklists no Mapa','E','menu.visualizarChecklist',2,NULL,'MapaLocalPorChecklist.nicbrain',7),(72,1,'C√¢meras ao Vivo','E','menu.cameraAoVivo',1,NULL,'cameraao vivo.nicbrain',8),(73,1,'Visualizar Lista de C√¢meras','E','menu.listacamera',1,NULL,'ListaCamera.nicbrain',72),(74,1,'Visualizar C√¢meras em Mapa','E','menu.mapacamera',1,NULL,'MapaCamera.nicbrain',72),(75,1,'Recuperar Imagem Gravada','E','menu.recuperarImagem',2,NULL,'RecuperarImagem.nicbrain',8),(76,1,'Cadastro de Pessoas para Rastreamento','E','menu.cadastroPessoasRastrear',1,NULL,'ListaDoCadastroDePessoaParaRastreamento.nicbrain',9),(77,1,'Cadastro de Ve√≠culos para Rastreamento','E','menu.cadastroVeiculosRastrear',2,NULL,'ListaCadastroVeiculosRastrear.nicbrain',9),(78,1,'Tra√ßar Rota para Rastreamento','E','menu.tracarRota',3,NULL,'ListaRota.nicbrain',9),(79,1,'Rastreamento','E','menu.rastreamento',2,NULL,'VisualizarMapaRastreamento.nicbrain',9),(80,1,'Rastreamento Aleat√≥rio','E','menu.rastramentoAleat',1,NULL,'ListaDeRastreamentosAtivos.nicbrain',79),(81,1,'Rastreamento por Rota','E','menu.rastreamentoRota',2,NULL,'ListaRastreamentoPorRota.nicbrain',79),(82,1,'Rastreamento de Checklist','E','menu.rastreamentochecklist',2,NULL,'ListaDeEventosDoRastreamentoDoChecklist.nicbrain',79),(83,1,'Relat√≥rio de CheckLists','E','menu.checklists',1,NULL,'ConsultaChecklist.nicbrain ',10),(84,1,'Dashboard Checklist','E','menu.dashboard',2,NULL,'DashboardChecklist.nicbrain',10),(85,1,'Dashboard Ocorr√™ncia','E','menu.dashboardocorrencia',4,NULL,'DashboardOcorrencia.nicbrain',10),(86,1,'Relat√≥rio de Ocorr√™ncias','E','menu.consultaOcorrencia',3,NULL,'ConsultaOcorrencia.nicbrain',10),(87,1,'Ordem de Servi√ßo','E','menu.orderServico',5,NULL,'ListaOS.nicbrain',10),(88,1,'OS de Seguran√ßa','E','menu.osSeguranca',1,NULL,'ListaOSSeguran√ßa.nicbrain',87),(89,1,'OS de Servi√ßo','E','menu.osServico',2,NULL,'ListaOSServico.nicbrain',87),(90,1,'OS de Limpeza','E','menu.osLimpeza',3,NULL,'ListaOSLimpeza.nicbrain',87),(91,1,'OS com Respostas Semelhantes','E','menu.osRespostasSemelh',4,NULL,'ListaOSRespSemelhante.nicbrain',87),(92,1,'Telefones √öteis','E','menu.telefonesUteis',1,NULL,'TelefoneUtilPagina.nicbrain',11),(93,1,'Regras para Perfil de Acesso','E','menu.regra',2,NULL,'ListaRegra.nicbrain',2),(94,1,'Cadastro de Checklist Padr„o','E','menu.checklistPadrao',1,NULL,'ListaChecklistPadrao.nicbrain',21);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_equipamento`
--

DROP TABLE IF EXISTS `modelo_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_equipamento` (
  `id_modelo_equipamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `homologado` tinyint(1) NOT NULL,
  `nome_modelo_equipamento` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `id_fornecedor` bigint(20) NOT NULL,
  `id_tipo_equipamento` bigint(20) NOT NULL,
  PRIMARY KEY (`id_modelo_equipamento`),
  KEY `FK_hmvl72qui9wd6hvvgbpvg7qcc` (`id_fornecedor`),
  KEY `FK_2cedshhxudx02csgudgrfdvxo` (`id_tipo_equipamento`),
  CONSTRAINT `FK_2cedshhxudx02csgudgrfdvxo` FOREIGN KEY (`id_tipo_equipamento`) REFERENCES `tipo_equipamento` (`id_tipo_equipamento`),
  CONSTRAINT `FK_hmvl72qui9wd6hvvgbpvg7qcc` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_equipamento`
--

LOCK TABLES `modelo_equipamento` WRITE;
/*!40000 ALTER TABLE `modelo_equipamento` DISABLE KEYS */;
INSERT INTO `modelo_equipamento` VALUES (1,1,'C√¢mera de Vigil√¢ncia Speed Dome',NULL,1,1),(2,1,'C√¢mera IP',NULL,1,1),(3,1,'Central de Alarme com discadora linha fixa',NULL,1,2),(4,1,'Central de Alarme com discadora linha m√≥vel',NULL,1,2);
/*!40000 ALTER TABLE `modelo_equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `id_contratante` bigint(20) NOT NULL,
  `id_menu` bigint(20) NOT NULL,
  PRIMARY KEY (`id_contratante`,`id_menu`),
  KEY `FK_shqaudx283sj76onxeyjajthd` (`id_menu`),
  KEY `FK_ejcjhlp37wqpqgc1yvu97mm` (`id_contratante`),
  CONSTRAINT `FK_ejcjhlp37wqpqgc1yvu97mm` FOREIGN KEY (`id_contratante`) REFERENCES `contratante` (`id_contratante`),
  CONSTRAINT `FK_shqaudx283sj76onxeyjajthd` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6),(1,7),(2,7),(1,8),(2,8),(1,9),(2,9),(1,10),(2,10),(1,11),(2,11);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `id_municipio` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_municipio` varchar(255) NOT NULL,
  `id_estado` bigint(20) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `FK_k3q18jdw66p1q3go0qlpqltro` (`id_estado`),
  CONSTRAINT `FK_k3q18jdw66p1q3go0qlpqltro` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5564 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'S√ÉO PAULO',1),(2,'SANTO ANDR√â',1),(3,'RIO DE JANEIRO',2),(4,'BELO HORIZONTE',3),(5,'MANAUS',7),(6,'BRASILIA',10),(7,'CUIAB√Å',15),(8,'CURITIBA',1),(9,'FORTALEZA',9),(10,'NATAL',22),(11,'PORTO ALEGRE',23),(12,'RECIFE',20),(13,'SALVADOR',8),(14,'ACRELANDIA',4),(15,'ASSIS BRASIL',4),(16,'BRASILEIA',4),(17,'BUJARI',4),(18,'CAPIXABA',4),(19,'CRUZEIRO DO SUL',4),(20,'EPITACIOLANDIA',4),(21,'FEIJO',4),(22,'JORDAO',4),(23,'MANCIO LIMA',4),(24,'MANOEL URBANO',4),(25,'MARECHAL TAUMATURGO',4),(26,'PLACIDO DE CASTRO',4),(27,'PORTO ACRE',4),(28,'PORTO WALTER',4),(29,'RIO BRANCO',4),(30,'RODRIGUES ALVES',4),(31,'SANTA ROSA DO PURUS',4),(32,'SENA MADUREIRA',4),(33,'SENADOR GUIOMARD',4),(34,'TARAUACA',4),(35,'XAPURI',4),(36,'AGUA BRANCA',5),(37,'ANADIA',5),(38,'ARAPIRACA',5),(39,'ATALAIA',5),(40,'BARRA DE SANTO ANTONIO',5),(41,'BARRA DE SAO MIGUEL',5),(42,'BATALHA',5),(43,'BELEM',5),(44,'BELO MONTE',5),(45,'BOCA DA MATA',5),(46,'BRANQUINHA',5),(47,'CACIMBINHAS',5),(48,'CAJUEIRO',5),(49,'CAMPESTRE',5),(50,'CAMPO ALEGRE',5),(51,'CAMPO GRANDE',5),(52,'CANAPI',5),(53,'CAPELA',5),(54,'CARNEIROS',5),(55,'CHA PRETA',5),(56,'COITE DO NOIA',5),(57,'COLONIA LEOPOLDINA',5),(58,'COQUEIRO SECO',5),(59,'CORURIPE',5),(60,'CRAIBAS',5),(61,'DELMIRO GOUVEIA',5),(62,'DOIS RIACHOS',5),(63,'ESTRELA DE ALAGOAS',5),(64,'FEIRA GRANDE',5),(65,'FELIZ DESERTO',5),(66,'FLEXEIRAS',5),(67,'GIRAU DO PONCIANO',5),(68,'IBATEGUARA',5),(69,'IGACI',5),(70,'IGREJA NOVA',5),(71,'INHAPI',5),(72,'JACARE DOS HOMENS',5),(73,'JACUIPE',5),(74,'JAPARATINGA',5),(75,'JARAMATAIA',5),(76,'JEQUIA DA PRAIA',5),(77,'JOAQUIM GOMES',5),(78,'JUNDIA',5),(79,'JUNQUEIRO',5),(80,'LAGOA DA CANOA',5),(81,'LIMOEIRO DE ANADIA',5),(82,'MACEIO',5),(83,'MAJOR ISIDORO',5),(84,'MAR VERMELHO',5),(85,'MARAGOGI',5),(86,'MARAVILHA',5),(87,'MARECHAL DEODORO',5),(88,'MARIBONDO',5),(89,'MATA GRANDE',5),(90,'MATRIZ DE CAMARAGIBE',5),(91,'MESSIAS',5),(92,'MINADOR DO NEGRAO',5),(93,'MONTEIROPOLIS',5),(94,'MURICI',5),(95,'NOVO LINO',5),(96,'OLHO DAGUA DAS FLORES',5),(97,'OLHO DAGUA DO CASADO',5),(98,'OLHO DAGUA GRANDE',5),(99,'OLIVENCA',5),(100,'OURO BRANCO',5),(101,'PALESTINA',5),(102,'PALMEIRA DOS INDIOS',5),(103,'PAO DE ACUCAR',5),(104,'PARICONHA',5),(105,'PARIPUEIRA',5),(106,'PASSO DE CAMARAGIBE',5),(107,'PAULO JACINTO',5),(108,'PENEDO',5),(109,'PIACABUCU',5),(110,'PILAR',5),(111,'PINDOBA',5),(112,'PIRANHAS',5),(113,'POCO DAS TRINCHEIRAS',5),(114,'PORTO CALVO',5),(115,'PORTO DE PEDRAS',5),(116,'PORTO REAL DO COLEGIO',5),(117,'QUEBRANGULO',5),(118,'RIO LARGO',5),(119,'ROTEIRO',5),(120,'SANTA LUZIA DO NORTE',5),(121,'SANTANA DO IPANEMA',5),(122,'SANTANA DO MUNDAU',5),(123,'SAO BRAS',5),(124,'SAO JOSE DA LAJE',5),(125,'SAO JOSE DA TAPERA',5),(126,'SAO LUIS DO QUITUNDE',5),(127,'SAO MIGUEL DOS CAMPOS',5),(128,'SAO MIGUEL DOS MILAGRES',5),(129,'SAO SEBASTIAO',5),(130,'SATUBA',5),(131,'SENADOR RUI PALMEIRA',5),(132,'TANQUE DARCA',5),(133,'TAQUARANA',5),(134,'TEOTONIO VILELA',5),(135,'TRAIPU',5),(136,'UNIAO DOS PALMARES',5),(137,'VICOSA',5),(138,'ALVARAES',7),(139,'AMATURA',7),(140,'ANAMA',7),(141,'ANORI',7),(142,'APUI',7),(143,'ATALAIA DO NORTE',7),(144,'AUTAZES',7),(145,'BARCELOS',7),(146,'BARREIRINHA',7),(147,'BENJAMIN CONSTANT',7),(148,'BERURI',7),(149,'BOA VISTA DO RAMOS',7),(150,'BOCA DO ACRE',7),(151,'BORBA',7),(152,'CAAPIRANGA',7),(153,'CANUTAMA',7),(154,'CARAUARI',7),(155,'CAREIRO',7),(156,'CAREIRO DA VARZEA',7),(157,'COARI',7),(158,'CODAJAS',7),(159,'EIRUNEPE',7),(160,'ENVIRA',7),(161,'FONTE BOA',7),(162,'GUAJARA',7),(163,'HUMAITA',7),(164,'IPIXUNA',7),(165,'IRANDUBA',7),(166,'ITACOATIARA',7),(167,'ITAMARATI',7),(168,'ITAPIRANGA',7),(169,'JAPURA',7),(170,'JURUA',7),(171,'JUTAI',7),(172,'LABREA',7),(173,'MANACAPURU',7),(174,'MANAQUIRI',7),(175,'MANICORE',7),(176,'MARAA',7),(177,'MAUES',7),(178,'NHAMUNDA',7),(179,'NOVA OLINDA DO NORTE',7),(180,'NOVO AIRAO',7),(181,'NOVO ARIPUANA',7),(182,'PARINTINS',7),(183,'PAUINI',7),(184,'PRESIDENTE FIGUEIREDO',7),(185,'RIO PRETO DA EVA',7),(186,'SANTA ISABEL DO RIO NEGRO',7),(187,'SANTO ANTONIO DO ICA',7),(188,'SAO GABRIEL DA CACHOEIRA',7),(189,'SAO PAULO DE OLIVENCA',7),(190,'SAO SEBASTIAO DO UATUMA',7),(191,'SILVES',7),(192,'TABATINGA',7),(193,'TAPAUA',7),(194,'TEFE',7),(195,'TONANTINS',7),(196,'UARINI',7),(197,'URUCARA',7),(198,'URUCURITUBA',7),(199,'AMAPA(MUNICIPIO)',6),(200,'CALCOENE',6),(201,'CUTIAS',6),(202,'FERREIRA GOMES',6),(203,'ITAUBAL',6),(204,'LARANJAL DO JARI',6),(205,'MACAPA',6),(206,'MAZAGAO',6),(207,'OIAPOQUE',6),(208,'PEDRA BRANCA DO AMAPARI',6),(209,'PORTO GRANDE',6),(210,'PRACUUBA',6),(211,'SANTANA',6),(212,'SERRA DO NAVIO',6),(213,'TARTARUGALZINHO',6),(214,'VITORIA DO JARI',6),(215,'ABAIRA',8),(216,'ABARE',8),(217,'ACAJUTIBA',8),(218,'ADUSTINA',8),(219,'AGUA FRIA',8),(220,'AIQUARA',8),(221,'ALAGOINHAS',8),(222,'ALCOBACA',8),(223,'ALMADINA',8),(224,'AMARGOSA',8),(225,'AMELIA RODRIGUES',8),(226,'AMERICA DOURADA',8),(227,'ANAGE',8),(228,'ANDARAI',8),(229,'ANDORINHA',8),(230,'ANGICAL',8),(231,'ANGUERA',8),(232,'ANTAS',8),(233,'ANTONIO CARDOSO',8),(234,'ANTONIO GONCALVES',8),(235,'APORA',8),(236,'APUAREMA',8),(237,'ARACAS',8),(238,'ARACATU',8),(239,'ARACI',8),(240,'ARAMARI',8),(241,'ARATACA',8),(242,'ARATUIPE',8),(243,'AURELINO LEAL',8),(244,'BAIANOPOLIS',8),(245,'BAIXA GRANDE',8),(246,'BANZAE',8),(247,'BARRA',8),(248,'BARRA DA ESTIVA',8),(249,'BARRA DO CHOCA',8),(250,'BARRA DO MENDES',8),(251,'BARRA DO ROCHA',8),(252,'BARREIRAS',8),(253,'BARRO ALTO',8),(254,'BARROCAS',8),(255,'BELMONTE',8),(256,'BELO CAMPO',8),(257,'BIRITINGA',8),(258,'BOA NOVA',8),(259,'BOA VISTA DO TUPIM',8),(260,'BOM JESUS DA LAPA',8),(261,'BOM JESUS DA SERRA',8),(262,'BONINAL',8),(263,'BONITO',8),(264,'BOQUIRA',8),(265,'BOTUPORA',8),(266,'BREJOES',8),(267,'BREJOLANDIA',8),(268,'BROTAS DE MACAUBAS',8),(269,'BRUMADO',8),(270,'BUERAREMA',8),(271,'BURITIRAMA',8),(272,'CAATIBA',8),(273,'CABACEIRAS DO PARAGUACU',8),(274,'CACHOEIRA',8),(275,'CACULE',8),(276,'CAEM',8),(277,'CAETANOS',8),(278,'CAETITE',8),(279,'CAFARNAUM',8),(280,'CAIRU',8),(281,'CALDEIRAO GRANDE',8),(282,'CAMACAN',8),(283,'CAMACARI',8),(284,'CAMAMU',8),(285,'CAMPO ALEGRE DE LOURDES',8),(286,'CAMPO FORMOSO',8),(287,'CANAPOLIS',8),(288,'CANARANA',8),(289,'CANAVIEIRAS',8),(290,'CANDEAL',8),(291,'CANDEIAS',8),(292,'CANDIBA',8),(293,'CANDIDO SALES',8),(294,'CANSANCAO',8),(295,'CANUDOS',8),(296,'CAPELA DO ALTO ALEGRE',8),(297,'CAPIM GROSSO',8),(298,'CARAIBAS',8),(299,'CARAVELAS',8),(300,'CARDEAL DA SILVA',8),(301,'CARINHANHA',8),(302,'CASA NOVA',8),(303,'CASTRO ALVES',8),(304,'CATOLANDIA',8),(305,'CATU',8),(306,'CATURAMA',8),(307,'CENTRAL',8),(308,'CHORROCHO',8),(309,'CICERO DANTAS',8),(310,'CIPO',8),(311,'COARACI',8),(312,'COCOS',8),(313,'CONCEICAO DA FEIRA',8),(314,'CONCEICAO DO ALMEIDA',8),(315,'CONCEICAO DO COITE',8),(316,'CONCEICAO DO JACUIPE',8),(317,'CONDE',8),(318,'CONDEUBA',8),(319,'CONTENDAS DO SINCORA',8),(320,'CORACAO DE MARIA',8),(321,'CORDEIROS',8),(322,'CORIBE',8),(323,'CORONEL JOAO SA',8),(324,'CORRENTINA',8),(325,'COTEGIPE',8),(326,'CRAVOLANDIA',8),(327,'CRISOPOLIS',8),(328,'CRISTOPOLIS',8),(329,'CRUZ DAS ALMAS',8),(330,'CURACA',8),(331,'DARIO MEIRA',8),(332,'DIAS DAVILA',8),(333,'DOM BASILIO',8),(334,'DOM MACEDO COSTA',8),(335,'ELISIO MEDRADO',8),(336,'ENCRUZILHADA',8),(337,'ENTRE RIOS',8),(338,'ERICO CARDOSO',8),(339,'ESPLANADA',8),(340,'EUCLIDES DA CUNHA',8),(341,'EUNAPOLIS',8),(342,'FATIMA',8),(343,'FEIRA DA MATA',8),(344,'FEIRA DE SANTANA',8),(345,'FILADELFIA',8),(346,'FIRMINO ALVES',8),(347,'FLORESTA AZUL',8),(348,'FORMOSA DO RIO PRETO',8),(349,'GANDU',8),(350,'GAVIAO',8),(351,'GENTIO DO OURO',8),(352,'GLORIA',8),(353,'GONGOGI',8),(354,'GOVERNADOR LOMANTO JUNIOR',8),(355,'GOVERNADOR MANGABEIRA',8),(356,'GUAJERU',8),(357,'GUANAMBI',8),(358,'GUARATINGA',8),(359,'HELIOPOLIS',8),(360,'IACU',8),(361,'IBIASSUCE',8),(362,'IBICARAI',8),(363,'IBICOARA',8),(364,'IBICUI',8),(365,'IBIPEBA',8),(366,'IBIPITANGA',8),(367,'IBIQUERA',8),(368,'IBIRAPITANGA',8),(369,'IBIRAPUA',8),(370,'IBIRATAIA',8),(371,'IBITIARA',8),(372,'IBITITA',8),(373,'IBOTIRAMA',8),(374,'ICHU',8),(375,'IGAPORA',8),(376,'IGRAPIUNA',8),(377,'IGUAI',8),(378,'ILHEUS',8),(379,'INHAMBUPE',8),(380,'IPECAETA',8),(381,'IPIAU',8),(382,'IPIRA',8),(383,'IPUPIARA',8),(384,'IRAJUBA',8),(385,'IRAMAIA',8),(386,'IRAQUARA',8),(387,'IRARA',8),(388,'IRECE',8),(389,'ITABELA',8),(390,'ITABERABA',8),(391,'ITABUNA',8),(392,'ITACARE',8),(393,'ITAETE',8),(394,'ITAGI',8),(395,'ITAGIBA',8),(396,'ITAGIMIRIM',8),(397,'ITAGUACU DA BAHIA',8),(398,'ITAJU DO COLONIA',8),(399,'ITAJUIPE',8),(400,'ITAMARAJU',8),(401,'ITAMARI',8),(402,'ITAMBE',8),(403,'ITANAGRA',8),(404,'ITANHEM',8),(405,'ITAPARICA',8),(406,'ITAPE',8),(407,'ITAPEBI',8),(408,'ITAPETINGA',8),(409,'ITAPICURU',8),(410,'ITAPITANGA',8),(411,'ITAQUARA',8),(412,'ITARANTIM',8),(413,'ITATIM',8),(414,'ITIRUCU',8),(415,'ITIUBA',8),(416,'ITORORO',8),(417,'ITUACU',8),(418,'ITUBERA',8),(419,'IUIU',8),(420,'JABORANDI',8),(421,'JACARACI',8),(422,'JACOBINA',8),(423,'JAGUAQUARA',8),(424,'JAGUARARI',8),(425,'JAGUARIPE',8),(426,'JANDAIRA',8),(427,'JEQUIE',8),(428,'JEREMOABO',8),(429,'JIQUIRICA',8),(430,'JITAUNA',8),(431,'JOAO DOURADO',8),(432,'JUAZEIRO',8),(433,'JUCURUCU',8),(434,'JUSSARA',8),(435,'JUSSARI',8),(436,'JUSSIAPE',8),(437,'LAFAIETE COUTINHO',8),(438,'LAGOA REAL',8),(439,'LAJE',8),(440,'LAJEDAO',8),(441,'LAJEDINHO',8),(442,'LAJEDO DO TABOCAL',8),(443,'LAMARAO',8),(444,'LAPAO',8),(445,'LAURO DE FREITAS',8),(446,'LENCOIS',8),(447,'LICINIO DE ALMEIDA',8),(448,'LIVRAMENTO DE NOSSA SENHORA',8),(449,'LUIS EDUARDO MAGALHAES',8),(450,'MACAJUBA',8),(451,'MACARANI',8),(452,'MACAUBAS',8),(453,'MACURURE',8),(454,'MADRE DE DEUS',8),(455,'MAETINGA',8),(456,'MAIQUINIQUE',8),(457,'MAIRI',8),(458,'MALHADA',8),(459,'MALHADA DE PEDRAS',8),(460,'MANOEL VITORINO',8),(461,'MANSIDAO',8),(462,'MARACAS',8),(463,'MARAGOGIPE',8),(464,'MARAU',8),(465,'MARCIONILIO SOUZA',8),(466,'MASCOTE',8),(467,'MATA DE SAO JOAO',8),(468,'MATINA',8),(469,'MEDEIROS NETO',8),(470,'MIGUEL CALMON',8),(471,'MILAGRES',8),(472,'MIRANGABA',8),(473,'MIRANTE',8),(474,'MONTE SANTO',8),(475,'MORPARA',8),(476,'MORRO DO CHAPEU',8),(477,'MORTUGABA',8),(478,'MUCUGE',8),(479,'MUCURI',8),(480,'MULUNGU DO MORRO',8),(481,'MUNDO NOVO',8),(482,'MUNIZ FERREIRA',8),(483,'MUQUEM DO SAO FRANCISCO',8),(484,'MURITIBA',8),(485,'MUTUIPE',8),(486,'NAZARE',8),(487,'NILO PECANHA',8),(488,'NORDESTINA',8),(489,'NOVA CANAA',8),(490,'NOVA FATIMA',8),(491,'NOVA IBIA',8),(492,'NOVA ITARANA',8),(493,'NOVA REDENCAO',8),(494,'NOVA SOURE',8),(495,'NOVA VICOSA',8),(496,'NOVO HORIZONTE',8),(497,'NOVO TRIUNFO',8),(498,'OLINDINA',8),(499,'OLIVEIRA DOS BREJINHOS',8),(500,'OURICANGAS',8),(501,'OUROLANDIA',8),(502,'PALMAS DE MONTE ALTO',8),(503,'PALMEIRAS',8),(504,'PARAMIRIM',8),(505,'PARATINGA',8),(506,'PARIPIRANGA',8),(507,'PAU BRASIL',8),(508,'PAULO AFONSO',8),(509,'PE DE SERRA',8),(510,'PEDRAO',8),(511,'PEDRO ALEXANDRE',8),(512,'PIATA',8),(513,'PILAO ARCADO',8),(514,'PINDAI',8),(515,'PINDOBACU',8),(516,'PINTADAS',8),(517,'PIRAI DO NORTE',8),(518,'PIRIPA',8),(519,'PIRITIBA',8),(520,'PLANALTINO',8),(521,'PLANALTO',8),(522,'POCOES',8),(523,'POJUCA',8),(524,'PONTO NOVO',8),(525,'PORTO SEGURO',8),(526,'POTIRAGUA',8),(527,'PRADO',8),(528,'PRESIDENTE DUTRA',8),(529,'PRESIDENTE JANIO QUADROS',8),(530,'PRESIDENTE TANCREDO NEVES',8),(531,'QUEIMADAS',8),(532,'QUIJINGUE',8),(533,'QUIXABEIRA',8),(534,'RAFAEL JAMBEIRO',8),(535,'REMANSO',8),(536,'RETIROLANDIA',8),(537,'RIACHAO DAS NEVES',8),(538,'RIACHAO DO JACUIPE',8),(539,'RIACHO DE SANTANA',8),(540,'RIBEIRA DO AMPARO',8),(541,'RIBEIRA DO POMBAL',8),(542,'RIBEIRAO DO LARGO',8),(543,'RIO DE CONTAS',8),(544,'RIO DO ANTONIO',8),(545,'RIO DO PIRES',8),(546,'RIO REAL',8),(547,'RODELAS',8),(548,'RUY BARBOSA',8),(549,'SALINAS DA MARGARIDA',8),(550,'SANTA BARBARA',8),(551,'SANTA BRIGIDA',8),(552,'SANTA CRUZ CABRALIA',8),(553,'SANTA CRUZ DA VITORIA',8),(554,'SANTA INES',8),(555,'SANTA LUZIA',8),(556,'SANTA MARIA DA VITORIA',8),(557,'SANTA RITA DE CASSIA',8),(558,'SANTA TERESINHA',8),(559,'SANTALUZ',8),(560,'SANTANA',8),(561,'SANTANOPOLIS',8),(562,'SANTO AMARO',8),(563,'SANTO ANTONIO DE JESUS',8),(564,'SANTO ESTEVAO',8),(565,'SAO DESIDERIO',8),(566,'SAO DOMINGOS',8),(567,'SAO FELIPE',8),(568,'SAO FELIX',8),(569,'SAO FELIX DO CORIBE',8),(570,'SAO FRANCISCO DO CONDE',8),(571,'SAO GABRIEL',8),(572,'SAO GONCALO DOS CAMPOS',8),(573,'SAO JOSE DA VITORIA',8),(574,'SAO JOSE DO JACUIPE',8),(575,'SAO MIGUEL DAS MATAS',8),(576,'SAO SEBASTIAO DO PASSE',8),(577,'SAPEACU',8),(578,'SATIRO DIAS',8),(579,'SAUBARA',8),(580,'SAUDE',8),(581,'SEABRA',8),(582,'SEBASTIAO LARANJEIRAS',8),(583,'SENHOR DO BONFIM',8),(584,'SENTO SE',8),(585,'SERRA DO RAMALHO',8),(586,'SERRA DOURADA',8),(587,'SERRA PRETA',8),(588,'SERRINHA',8),(589,'SERROLANDIA',8),(590,'SIMOES FILHO',8),(591,'SITIO DO MATO',8),(592,'SITIO DO QUINTO',8),(593,'SOBRADINHO',8),(594,'SOUTO SOARES',8),(595,'TABOCAS DO BREJO VELHO',8),(596,'TANHACU',8),(597,'TANQUE NOVO',8),(598,'TANQUINHO',8),(599,'TAPEROA',8),(600,'TAPIRAMUTA',8),(601,'TEIXEIRA DE FREITAS',8),(602,'TEODORO SAMPAIO',8),(603,'TEOFILANDIA',8),(604,'TEOLANDIA',8),(605,'TERRA NOVA',8),(606,'TREMEDAL',8),(607,'TUCANO',8),(608,'UAUA',8),(609,'UBAIRA',8),(610,'UBAITABA',8),(611,'UBATA',8),(612,'UIBAI',8),(613,'UMBURANAS',8),(614,'UNA',8),(615,'URANDI',8),(616,'URUCUCA',8),(617,'UTINGA',8),(618,'VALENCA',8),(619,'VALENTE',8),(620,'VARZEA DA ROCA',8),(621,'VARZEA DO POCO',8),(622,'VARZEA NOVA',8),(623,'VARZEDO',8),(624,'VERA CRUZ',8),(625,'VEREDA',8),(626,'VITORIA DA CONQUISTA',8),(627,'WAGNER',8),(628,'WANDERLEY',8),(629,'WENCESLAU GUIMARAES',8),(630,'XIQUE-XIQUE',8),(631,'ABAIARA',9),(632,'ACARAPE',9),(633,'ACARAU',9),(634,'ACOPIARA',9),(635,'AIUABA',9),(636,'ALCANTARAS',9),(637,'ALTANEIRA',9),(638,'ALTO SANTO',9),(639,'AMONTADA',9),(640,'ANTONINA DO NORTE',9),(641,'APUIARES',9),(642,'AQUIRAZ',9),(643,'ARACATI',9),(644,'ARACOIABA',9),(645,'ARARENDA',9),(646,'ARARIPE',9),(647,'ARATUBA',9),(648,'ARNEIROZ',9),(649,'ASSARE',9),(650,'AURORA',9),(651,'BAIXIO',9),(652,'BANABUIU',9),(653,'BARBALHA',9),(654,'BARREIRA',9),(655,'BARRO',9),(656,'BARROQUINHA',9),(657,'BATURITE',9),(658,'BEBERIBE',9),(659,'BELA CRUZ',9),(660,'BOA VIAGEM',9),(661,'BREJO SANTO',9),(662,'CAMOCIM',9),(663,'CAMPOS SALES',9),(664,'CANINDE',9),(665,'CAPISTRANO',9),(666,'CARIDADE',9),(667,'CARIRE',9),(668,'CARIRIACU',9),(669,'CARIUS',9),(670,'CARNAUBAL',9),(671,'CASCAVEL',9),(672,'CATARINA',9),(673,'CATUNDA',9),(674,'CAUCAIA',9),(675,'CEDRO',9),(676,'CHAVAL',9),(677,'CHORO',9),(678,'CHOROZINHO',9),(679,'COREAU',9),(680,'CRATEUS',9),(681,'CRATO',9),(682,'CROATA',9),(683,'CRUZ',9),(684,'DEPUTADO IRAPUAN PINHEIRO',9),(685,'ERERE',9),(686,'EUSEBIO',9),(687,'FARIAS BRITO',9),(688,'FORQUILHA',9),(689,'FORTIM',9),(690,'FRECHEIRINHA',9),(691,'GENERAL SAMPAIO',9),(692,'GRACA',9),(693,'GRANJA',9),(694,'GRANJEIRO',9),(695,'GROAIRAS',9),(696,'GUAIUBA',9),(697,'GUARACIABA DO NORTE',9),(698,'GUARAMIRANGA',9),(699,'HIDROLANDIA',9),(700,'HORIZONTE',9),(701,'IBARETAMA',9),(702,'IBIAPINA',9),(703,'IBICUITINGA',9),(704,'ICAPUI',9),(705,'ICO',9),(706,'IGUATU',9),(707,'INDEPENDENCIA',9),(708,'IPAPORANGA',9),(709,'IPAUMIRIM',9),(710,'IPU',9),(711,'IPUEIRAS',9),(712,'IRACEMA',9),(713,'IRAUCUBA',9),(714,'ITAICABA',9),(715,'ITAITINGA',9),(716,'ITAPAGE',9),(717,'ITAPIPOCA',9),(718,'ITAPIUNA',9),(719,'ITAREMA',9),(720,'ITATIRA',9),(721,'JAGUARETAMA',9),(722,'JAGUARIBARA',9),(723,'JAGUARIBE',9),(724,'JAGUARUANA',9),(725,'JARDIM',9),(726,'JATI',9),(727,'JIJOCA DE JERICOACOARA',9),(728,'JUAZEIRO DO NORTE',9),(729,'JUCAS',9),(730,'LAVRAS DA MANGABEIRA',9),(731,'LIMOEIRO DO NORTE',9),(732,'MADALENA',9),(733,'MARACANAU',9),(734,'MARANGUAPE',9),(735,'MARCO',9),(736,'MARTINOPOLE',9),(737,'MASSAPE',9),(738,'MAURITI',9),(739,'MERUOCA',9),(740,'MILAGRES',9),(741,'MILHA',9),(742,'MIRAIMA',9),(743,'MISSAO VELHA',9),(744,'MOMBACA',9),(745,'MONSENHOR TABOSA',9),(746,'MORADA NOVA',9),(747,'MORAUJO',9),(748,'MORRINHOS',9),(749,'MUCAMBO',9),(750,'MULUNGU',9),(751,'NOVA OLINDA',9),(752,'NOVA RUSSAS',9),(753,'NOVO ORIENTE',9),(754,'OCARA',9),(755,'OROS',9),(756,'PACAJUS',9),(757,'PACATUBA',9),(758,'PACOTI',9),(759,'PACUJA',9),(760,'PALHANO',9),(761,'PALMACIA',9),(762,'PARACURU',9),(763,'PARAIPABA',9),(764,'PARAMBU',9),(765,'PARAMOTI',9),(766,'PEDRA BRANCA',9),(767,'PENAFORTE',9),(768,'PENTECOSTE',9),(769,'PEREIRO',9),(770,'PINDORETAMA',9),(771,'PIQUET CARNEIRO',9),(772,'PIRES FERREIRA',9),(773,'PORANGA',9),(774,'PORTEIRAS',9),(775,'POTENGI',9),(776,'POTIRETAMA',9),(777,'QUITERIANOPOLIS',9),(778,'QUIXADA',9),(779,'QUIXELO',9),(780,'QUIXERAMOBIM',9),(781,'QUIXERE',9),(782,'REDENCAO',9),(783,'RERIUTABA',9),(784,'RUSSAS',9),(785,'SABOEIRO',9),(786,'SALITRE',9),(787,'SANTA QUITERIA',9),(788,'SANTANA DO ACARAU',9),(789,'SANTANA DO CARIRI',9),(790,'SAO BENEDITO',9),(791,'SAO GONCALO DO AMARANTE',9),(792,'SAO JOAO DO JAGUARIBE',9),(793,'SAO LUIS DO CURU',9),(794,'SENADOR POMPEU',9),(795,'SENADOR SA',9),(796,'SOBRAL',9),(797,'SOLONOPOLE',9),(798,'TABULEIRO DO NORTE',9),(799,'TAMBORIL',9),(800,'TARRAFAS',9),(801,'TAUA',9),(802,'TEJUCUOCA',9),(803,'TIANGUA',9),(804,'TRAIRI',9),(805,'TURURU',9),(806,'UBAJARA',9),(807,'UMARI',9),(808,'UMIRIM',9),(809,'URUBURETAMA',9),(810,'URUOCA',9),(811,'VARJOTA',9),(812,'VARZEA ALEGRE',9),(813,'VICOSA DO CEARA',9),(814,'AFONSO CLAUDIO',11),(815,'AGUA DOCE DO NORTE',11),(816,'AGUIA BRANCA',11),(817,'ALEGRE',11),(818,'ALFREDO CHAVES',11),(819,'ALTO RIO NOVO',11),(820,'ANCHIETA',11),(821,'APIACA',11),(822,'ARACRUZ',11),(823,'ATILIO VIVACQUA',11),(824,'BAIXO GUANDU',11),(825,'BARRA DE SAO FRANCISCO',11),(826,'BOA ESPERANCA',11),(827,'BOM JESUS DO NORTE',11),(828,'BREJETUBA',11),(829,'CACHOEIRO DE ITAPEMIRIM',11),(830,'CARIACICA',11),(831,'CASTELO',11),(832,'COLATINA',11),(833,'CONCEICAO DA BARRA',11),(834,'CONCEICAO DO CASTELO',11),(835,'DIVINO DE SAO LOURENCO',11),(836,'DOMINGOS MARTINS',11),(837,'DORES DO RIO PRETO',11),(838,'ECOPORANGA',11),(839,'FUNDAO',11),(840,'GOVERNADOR LINDENBERG',11),(841,'GUACUI',11),(842,'GUARAPARI',11),(843,'IBATIBA',11),(844,'IBIRACU',11),(845,'IBITIRAMA',11),(846,'ICONHA',11),(847,'IRUPI',11),(848,'ITAGUACU',11),(849,'ITAPEMIRIM',11),(850,'ITARANA',11),(851,'IUNA',11),(852,'JAGUARE',11),(853,'JERONIMO MONTEIRO',11),(854,'JOAO NEIVA',11),(855,'LARANJA DA TERRA',11),(856,'LINHARES',11),(857,'MANTENOPOLIS',11),(858,'MARATAIZES',11),(859,'MARECHAL FLORIANO',11),(860,'MARILANDIA',11),(861,'MIMOSO DO SUL',11),(862,'MONTANHA',11),(863,'MUCURICI',11),(864,'MUNIZ FREIRE',11),(865,'MUQUI',11),(866,'NOVA VENECIA',11),(867,'PANCAS',11),(868,'PEDRO CANARIO',11),(869,'PINHEIROS',11),(870,'PIUMA',11),(871,'PONTO BELO',11),(872,'PRESIDENTE KENNEDY',11),(873,'RIO BANANAL',11),(874,'RIO NOVO DO SUL',11),(875,'SANTA LEOPOLDINA',11),(876,'SANTA MARIA DE JETIBA',11),(877,'SANTA TERESA',11),(878,'SAO DOMINGOS DO NORTE',11),(879,'SAO GABRIEL DA PALHA',11),(880,'SAO JOSE DO CALCADO',11),(881,'SAO MATEUS',11),(882,'SAO ROQUE DO CANAA',11),(883,'SERRA',11),(884,'SOORETAMA',11),(885,'VARGEM ALTA',11),(886,'VENDA NOVA DO IMIGRANTE',11),(887,'VIANA',11),(888,'VILA PAVAO',11),(889,'VILA VALERIO',11),(890,'VILA VELHA',11),(891,'VITORIA',11),(892,'ABADIA DE GOIAS',12),(893,'ABADIANIA',12),(894,'ACREUNA',12),(895,'ADELANDIA',12),(896,'AGUA FRIA DE GOIAS',12),(897,'AGUA LIMPA',12),(898,'AGUAS LINDAS DE GOIAS',12),(899,'ALEXANIA',12),(900,'ALOANDIA',12),(901,'ALTO HORIZONTE',12),(902,'ALTO PARAISO DE GOIAS',12),(903,'ALVORADA DO NORTE',12),(904,'AMARALINA',12),(905,'AMERICANO DO BRASIL',12),(906,'AMORINOPOLIS',12),(907,'ANAPOLIS',12),(908,'ANHANGUERA',12),(909,'ANICUNS',12),(910,'APARECIDA DE GOIANIA',12),(911,'APARECIDA DO RIO DOCE',12),(912,'APORE',12),(913,'ARACU',12),(914,'ARAGARCAS',12),(915,'ARAGOIANIA',12),(916,'ARAGUAPAZ',12),(917,'ARENOPOLIS',12),(918,'ARUANA',12),(919,'AURILANDIA',12),(920,'AVELINOPOLIS',12),(921,'BALIZA',12),(922,'BARRO ALTO',12),(923,'BELA VISTA DE GOIAS',12),(924,'BOM JARDIM DE GOIAS',12),(925,'BOM JESUS DE GOIAS',12),(926,'BONFINOPOLIS',12),(927,'BONOPOLIS',12),(928,'BRAZABRANTES',12),(929,'BRITANIA',12),(930,'BURITI ALEGRE',12),(931,'BURITI DE GOIAS',12),(932,'BURITINOPOLIS',12),(933,'CABECEIRAS',12),(934,'CACHOEIRA ALTA',12),(935,'CACHOEIRA DE GOIAS',12),(936,'CACHOEIRA DOURADA',12),(937,'CACU',12),(938,'CAIAPONIA',12),(939,'CALDAS NOVAS',12),(940,'CALDAZINHA',12),(941,'CAMPESTRE DE GOIAS',12),(942,'CAMPINACU',12),(943,'CAMPINORTE',12),(944,'CAMPO ALEGRE DE GOIAS',12),(945,'CAMPO LIMPO DE GOIAS',12),(946,'CAMPOS BELOS',12),(947,'CAMPOS VERDES',12),(948,'CARMO DO RIO VERDE',12),(949,'CASTELANDIA',12),(950,'CATALAO',12),(951,'CATURAI',12),(952,'CAVALCANTE',12),(953,'CERES',12),(954,'CEZARINA',12),(955,'CHAPADAO DO CEU',12),(956,'CIDADE OCIDENTAL',12),(957,'COCALZINHO DE GOIAS',12),(958,'COLINAS DO SUL',12),(959,'CORREGO DO OURO',12),(960,'CORUMBA DE GOIAS',12),(961,'CORUMBAIBA',12),(962,'CRISTALINA',12),(963,'CRISTIANOPOLIS',12),(964,'CRIXAS',12),(965,'CROMINIA',12),(966,'CUMARI',12),(967,'DAMIANOPOLIS',12),(968,'DAMOLANDIA',12),(969,'DAVINOPOLIS',12),(970,'DIORAMA',12),(971,'DIVINOPOLIS DE GOIAS',12),(972,'DOVERLANDIA',12),(973,'EDEALINA',12),(974,'EDEIA',12),(975,'ESTRELA DO NORTE',12),(976,'FAINA',12),(977,'FAZENDA NOVA',12),(978,'FIRMINOPOLIS',12),(979,'FLORES DE GOIAS',12),(980,'FORMOSA',12),(981,'FORMOSO',12),(982,'GAMELEIRA DE GOIAS',12),(983,'GOIANAPOLIS',12),(984,'GOIANDIRA',12),(985,'GOIANESIA',12),(986,'GOIANIA',12),(987,'GOIANIRA',12),(988,'GOIAS',12),(989,'GOIATUBA',12),(990,'GOUVELANDIA',12),(991,'GUAPO',12),(992,'GUARAITA',12),(993,'GUARANI DE GOIAS',12),(994,'GUARINOS',12),(995,'HEITORAI',12),(996,'HIDROLANDIA',12),(997,'HIDROLINA',12),(998,'IACIARA',12),(999,'INACIOLANDIA',12),(1000,'INDIARA',12),(1001,'INHUMAS',12),(1002,'IPAMERI',12),(1003,'IPIRANGA DE GOIAS',12),(1004,'IPORA',12),(1005,'ISRAELANDIA',12),(1006,'ITABERAI',12),(1007,'ITAGUARI',12),(1008,'ITAGUARU',12),(1009,'ITAJA',12),(1010,'ITAPACI',12),(1011,'ITAPIRAPUA',12),(1012,'ITAPURANGA',12),(1013,'ITARUMA',12),(1014,'ITAUCU',12),(1015,'ITUMBIARA',12),(1016,'IVOLANDIA',12),(1017,'JANDAIA',12),(1018,'JARAGUA',12),(1019,'JATAI',12),(1020,'JAUPACI',12),(1021,'JESUPOLIS',12),(1022,'JOVIANIA',12),(1023,'JUSSARA',12),(1024,'LAGOA SANTA',12),(1025,'LEOPOLDO DE BULHOES',12),(1026,'LUZIANIA',12),(1027,'MAIRIPOTABA',12),(1028,'MAMBAI',12),(1029,'MARA ROSA',12),(1030,'MARZAGAO',12),(1031,'MATRINCHA',12),(1032,'MAURILANDIA',12),(1033,'MIMOSO DE GOIAS',12),(1034,'MINACU',12),(1035,'MINEIROS',12),(1036,'MOIPORA',12),(1037,'MONTE ALEGRE DE GOIAS',12),(1038,'MONTES CLAROS DE GOIAS',12),(1039,'MONTIVIDIU',12),(1040,'MONTIVIDIU DO NORTE',12),(1041,'MORRINHOS',12),(1042,'MORRO AGUDO DE GOIAS',12),(1043,'MOSSAMEDES',12),(1044,'MOZARLANDIA',12),(1045,'MUNDO NOVO',12),(1046,'MUTUNOPOLIS',12),(1047,'NAZARIO',12),(1048,'NEROPOLIS',12),(1049,'NIQUELANDIA',12),(1050,'NOVA AMERICA',12),(1051,'NOVA AURORA',12),(1052,'NOVA CRIXAS',12),(1053,'NOVA GLORIA',12),(1054,'NOVA IGUACU DE GOIAS',12),(1055,'NOVA ROMA',12),(1056,'NOVA VENEZA',12),(1057,'NOVO BRASIL',12),(1058,'NOVO GAMA',12),(1059,'NOVO PLANALTO',12),(1060,'ORIZONA',12),(1061,'OURO VERDE DE GOIAS',12),(1062,'OUVIDOR',12),(1063,'PADRE BERNARDO',12),(1064,'PALESTINA DE GOIAS',12),(1065,'PALMEIRAS DE GOIAS',12),(1066,'PALMELO',12),(1067,'PALMINOPOLIS',12),(1068,'PANAMA',12),(1069,'PARANAIGUARA',12),(1070,'PARAUNA',12),(1071,'PEROLANDIA',12),(1072,'PETROLINA DE GOIAS',12),(1073,'PILAR DE GOIAS',12),(1074,'PIRACANJUBA',12),(1075,'PIRANHAS',12),(1076,'PIRENOPOLIS',12),(1077,'PIRES DO RIO',12),(1078,'PLANALTINA',12),(1079,'PONTALINA',12),(1080,'PORANGATU',12),(1081,'PORTEIRAO',12),(1082,'PORTELANDIA',12),(1083,'POSSE',12),(1084,'PROFESSOR JAMIL',12),(1085,'QUIRINOPOLIS',12),(1086,'RIALMA',12),(1087,'RIANAPOLIS',12),(1088,'RIO QUENTE',12),(1089,'RIO VERDE',12),(1090,'RUBIATABA',12),(1091,'SANCLERLANDIA',12),(1092,'SANTA BARBARA DE GOIAS',12),(1093,'SANTA CRUZ DE GOIAS',12),(1094,'SANTA FE DE GOIAS',12),(1095,'SANTA HELENA DE GOIAS',12),(1096,'SANTA ISABEL',12),(1097,'SANTA RITA DO ARAGUAIA',12),(1098,'SANTA RITA DO NOVO DESTINO',12),(1099,'SANTA ROSA DE GOIAS',12),(1100,'SANTA TEREZA DE GOIAS',12),(1101,'SANTA TEREZINHA DE GOIAS',12),(1102,'SANTO ANTONIO DA BARRA',12),(1103,'SANTO ANTONIO DE GOIAS',12),(1104,'SANTO ANTONIO DO DESCOBERTO',12),(1105,'SAO DOMINGOS',12),(1106,'SAO FRANCISCO DE GOIAS',12),(1107,'SAO JOAO DA PARAUNA',12),(1108,'SAO JOAO DALIANCA',12),(1109,'SAO LUIS DE MONTES BELOS',12),(1110,'SAO LUIZ DO NORTE',12),(1111,'SAO MIGUEL DO ARAGUAIA',12),(1112,'SAO MIGUEL DO PASSA QUATRO',12),(1113,'SAO PATRICIO',12),(1114,'SAO SIMAO',12),(1115,'SENADOR CANEDO',12),(1116,'SERRANOPOLIS',12),(1117,'SILVANIA',12),(1118,'SIMOLANDIA',12),(1119,'SITIO DABADIA',12),(1120,'TAQUARAL DE GOIAS',12),(1121,'TERESINA DE GOIAS',12),(1122,'TEREZOPOLIS DE GOIAS',12),(1123,'TRES RANCHOS',12),(1124,'TRINDADE',12),(1125,'TROMBAS',12),(1126,'TURVANIA',12),(1127,'TURVELANDIA',12),(1128,'UIRAPURU',12),(1129,'URUACU',12),(1130,'URUANA',12),(1131,'URUTAI',12),(1132,'VALPARAISO DE GOIAS',12),(1133,'VARJAO',12),(1134,'VIANOPOLIS',12),(1135,'VICENTINOPOLIS',12),(1136,'VILA BOA',12),(1137,'VILA PROPICIO',12),(1138,'ACAILANDIA',14),(1139,'AFONSO CUNHA',14),(1140,'AGUA DOCE DO MARANHAO',14),(1141,'ALCANTARA',14),(1142,'ALDEIAS ALTAS',14),(1143,'ALTAMIRA DO MARANHAO',14),(1144,'ALTO ALEGRE DO MARANHAO',14),(1145,'ALTO ALEGRE DO PINDARE',14),(1146,'ALTO PARNAIBA',14),(1147,'AMAPA DO MARANHAO',14),(1148,'AMARANTE DO MARANHAO',14),(1149,'ANAJATUBA',14),(1150,'ANAPURUS',14),(1151,'APICUM-ACU',14),(1152,'ARAGUANA',14),(1153,'ARAIOSES',14),(1154,'ARAME',14),(1155,'ARARI',14),(1156,'AXIXA',14),(1157,'BACABAL',14),(1158,'BACABEIRA',14),(1159,'BACURI',14),(1160,'BACURITUBA',14),(1161,'BALSAS',14),(1162,'BARAO DE GRAJAU',14),(1163,'BARRA DO CORDA',14),(1164,'BARREIRINHAS',14),(1165,'BELA VISTA DO MARANHAO',14),(1166,'BELAGUA',14),(1167,'BENEDITO LEITE',14),(1168,'BEQUIMAO',14),(1169,'BERNARDO DO MEARIM',14),(1170,'BOA VISTA DO GURUPI',14),(1171,'BOM JARDIM',14),(1172,'BOM JESUS DAS SELVAS',14),(1173,'BOM LUGAR',14),(1174,'BREJO',14),(1175,'BREJO DE AREIA',14),(1176,'BURITI',14),(1177,'BURITI BRAVO',14),(1178,'BURITICUPU',14),(1179,'BURITIRANA',14),(1180,'CACHOEIRA GRANDE',14),(1181,'CAJAPIO',14),(1182,'CAJARI',14),(1183,'CAMPESTRE DO MARANHAO',14),(1184,'CANDIDO MENDES',14),(1185,'CANTANHEDE',14),(1186,'CAPINZAL DO NORTE',14),(1187,'CAROLINA',14),(1188,'CARUTAPERA',14),(1189,'CAXIAS',14),(1190,'CEDRAL',14),(1191,'CENTRAL DO MARANHAO',14),(1192,'CENTRO DO GUILHERME',14),(1193,'CENTRO NOVO DO MARANHAO',14),(1194,'CHAPADINHA',14),(1195,'CIDELANDIA',14),(1196,'CODO',14),(1197,'COELHO NETO',14),(1198,'COLINAS',14),(1199,'CONCEICAO DO LAGO-ACU',14),(1200,'COROATA',14),(1201,'CURURUPU',14),(1202,'DAVINOPOLIS',14),(1203,'DOM PEDRO',14),(1204,'DUQUE BACELAR',14),(1205,'ESPERANTINOPOLIS',14),(1206,'ESTREITO',14),(1207,'FEIRA NOVA DO MARANHAO',14),(1208,'FERNANDO FALCAO',14),(1209,'FORMOSA DA SERRA NEGRA',14),(1210,'FORTALEZA DOS NOGUEIRAS',14),(1211,'FORTUNA',14),(1212,'GODOFREDO VIANA',14),(1213,'GONCALVES DIAS',14),(1214,'GOVERNADOR ARCHER',14),(1215,'GOVERNADOR EDISON LOBAO',14),(1216,'GOVERNADOR EUGENIO BARROS',14),(1217,'GOVERNADOR LUIZ ROCHA',14),(1218,'GOVERNADOR NEWTON BELLO',14),(1219,'GOVERNADOR NUNES FREIRE',14),(1220,'GRACA ARANHA',14),(1221,'GRAJAU',14),(1222,'GUIMARAES',14),(1223,'HUMBERTO DE CAMPOS',14),(1224,'ICATU',14),(1225,'IGARAPE DO MEIO',14),(1226,'IGARAPE GRANDE',14),(1227,'IMPERATRIZ',14),(1228,'ITAIPAVA DO GRAJAU',14),(1229,'ITAPECURU MIRIM',14),(1230,'ITINGA DO MARANHAO',14),(1231,'JATOBA',14),(1232,'JENIPAPO DOS VIEIRAS',14),(1233,'JOAO LISBOA',14),(1234,'JOSELANDIA',14),(1235,'JUNCO DO MARANHAO',14),(1236,'LAGO DA PEDRA',14),(1237,'LAGO DO JUNCO',14),(1238,'LAGO DOS RODRIGUES',14),(1239,'LAGO VERDE',14),(1240,'LAGOA DO MATO',14),(1241,'LAGOA GRANDE DO MARANHAO',14),(1242,'LAJEADO NOVO',14),(1243,'LIMA CAMPOS',14),(1244,'LORETO',14),(1245,'LUIS DOMINGUES',14),(1246,'MAGALHAES DE ALMEIDA',14),(1247,'MARACACUME',14),(1248,'MARAJA DO SENA',14),(1249,'MARANHAOZINHO',14),(1250,'MATA ROMA',14),(1251,'MATINHA',14),(1252,'MATOES',14),(1253,'MATOES DO NORTE',14),(1254,'MILAGRES DO MARANHAO',14),(1255,'MIRADOR',14),(1256,'MIRANDA DO NORTE',14),(1257,'MIRINZAL',14),(1258,'MONCAO',14),(1259,'MONTES ALTOS',14),(1260,'MORROS',14),(1261,'NINA RODRIGUES',14),(1262,'NOVA COLINAS',14),(1263,'NOVA IORQUE',14),(1264,'NOVA OLINDA DO MARANHAO',14),(1265,'OLHO DAGUA DAS CUNHAS',14),(1266,'OLINDA NOVA DO MARANHAO',14),(1267,'PACO DO LUMIAR',14),(1268,'PALMEIRANDIA',14),(1269,'PARAIBANO',14),(1270,'PARNARAMA',14),(1271,'PASSAGEM FRANCA',14),(1272,'PASTOS BONS',14),(1273,'PAULINO NEVES',14),(1274,'PAULO RAMOS',14),(1275,'PEDREIRAS',14),(1276,'PEDRO DO ROSARIO',14),(1277,'PENALVA',14),(1278,'PERI MIRIM',14),(1279,'PERITORO',14),(1280,'PINDARE MIRIM',14),(1281,'PINHEIRO',14),(1282,'PIO XII',14),(1283,'PIRAPEMAS',14),(1284,'POCAO DE PEDRAS',14),(1285,'PORTO FRANCO',14),(1286,'PORTO RICO DO MARANHAO',14),(1287,'PRESIDENTE DUTRA',14),(1288,'PRESIDENTE JUSCELINO',14),(1289,'PRESIDENTE MEDICI',14),(1290,'PRESIDENTE SARNEY',14),(1291,'PRESIDENTE VARGAS',14),(1292,'PRIMEIRA CRUZ',14),(1293,'RAPOSA',14),(1294,'RIACHAO',14),(1295,'RIBAMAR FIQUENE',14),(1296,'ROSARIO',14),(1297,'SAMBAIBA',14),(1298,'SANTA FILOMENA DO MARANHAO',14),(1299,'SANTA HELENA',14),(1300,'SANTA INES',14),(1301,'SANTA LUZIA',14),(1302,'SANTA LUZIA DO PARUA',14),(1303,'SANTA QUITERIA DO MARANHAO',14),(1304,'SANTA RITA',14),(1305,'SANTANA DO MARANHAO',14),(1306,'SANTO AMARO DO MARANHAO',14),(1307,'SANTO ANTONIO DOS LOPES',14),(1308,'SAO BENEDITO DO RIO PRETO',14),(1309,'SAO BENTO',14),(1310,'SAO BERNARDO',14),(1311,'SAO DOMINGOS DO AZEITAO',14),(1312,'SAO DOMINGOS DO MARANHAO',14),(1313,'SAO FELIX DE BALSAS',14),(1314,'SAO FRANCISCO DO BREJAO',14),(1315,'SAO FRANCISCO DO MARANHAO',14),(1316,'SAO JOAO BATISTA',14),(1317,'SAO JOAO DO CARU',14),(1318,'SAO JOAO DO PARAISO',14),(1319,'SAO JOAO DO SOTER',14),(1320,'SAO JOAO DOS PATOS',14),(1321,'SAO JOSE DE RIBAMAR',14),(1322,'SAO JOSE DOS BASILIOS',14),(1323,'SAO LUIS',14),(1324,'SAO LUIS GONZAGA DO MARANHAO',14),(1325,'SAO MATEUS DO MARANHAO',14),(1326,'SAO PEDRO DA AGUA BRANCA',14),(1327,'SAO PEDRO DOS CRENTES',14),(1328,'SAO RAIMUNDO DAS MANGABEIRAS',14),(1329,'SAO RAIMUNDO DO DOCA BEZERRA',14),(1330,'SAO ROBERTO',14),(1331,'SAO VICENTE FERRER',14),(1332,'SATUBINHA',14),(1333,'SENADOR ALEXANDRE COSTA',14),(1334,'SENADOR LA ROCQUE',14),(1335,'SERRANO DO MARANHAO',14),(1336,'SITIO NOVO',14),(1337,'SUCUPIRA DO NORTE',14),(1338,'SUCUPIRA DO RIACHAO',14),(1339,'TASSO FRAGOSO',14),(1340,'TIMBIRAS',14),(1341,'TIMON',14),(1342,'TRIZIDELA DO VALE',14),(1343,'TUFILANDIA',14),(1344,'TUNTUM',14),(1345,'TURIACU',14),(1346,'TURILANDIA',14),(1347,'TUTOIA',14),(1348,'URBANO SANTOS',14),(1349,'VARGEM GRANDE',14),(1350,'VIANA',14),(1351,'VILA NOVA DOS MARTIRIOS',14),(1352,'VITORIA DO MEARIM',14),(1353,'VITORINO FREIRE',14),(1354,'ZE DOCA',14),(1355,'ABADIA DOS DOURADOS',3),(1356,'ABAETE',3),(1357,'ABRE CAMPO',3),(1358,'ACAIACA',3),(1359,'ACUCENA',3),(1360,'AGUA BOA',3),(1361,'AGUA COMPRIDA',3),(1362,'AGUANIL',3),(1363,'AGUAS FORMOSAS',3),(1364,'AGUAS VERMELHAS',3),(1365,'AIMORES',3),(1366,'AIURUOCA',3),(1367,'ALAGOA',3),(1368,'ALBERTINA',3),(1369,'ALEM PARAIBA',3),(1370,'ALFENAS',3),(1371,'ALFREDO VASCONCELOS',3),(1372,'ALMENARA',3),(1373,'ALPERCATA',3),(1374,'ALPINOPOLIS',3),(1375,'ALTEROSA',3),(1376,'ALTO CAPARAO',3),(1377,'ALTO JEQUITIBA',3),(1378,'ALTO RIO DOCE',3),(1379,'ALVARENGA',3),(1380,'ALVINOPOLIS',3),(1381,'ALVORADA DE MINAS',3),(1382,'AMPARO DO SERRA',3),(1383,'ANDRADAS',3),(1384,'ANDRELANDIA',3),(1385,'ANGELANDIA',3),(1386,'ANTONIO CARLOS',3),(1387,'ANTONIO DIAS',3),(1388,'ANTONIO PRADO DE MINAS',3),(1389,'ARACAI',3),(1390,'ARACITABA',3),(1391,'ARACUAI',3),(1392,'ARAGUARI',3),(1393,'ARANTINA',3),(1394,'ARAPONGA',3),(1395,'ARAPORA',3),(1396,'ARAPUA',3),(1397,'ARAUJOS',3),(1398,'ARAXA',3),(1399,'ARCEBURGO',3),(1400,'ARCOS',3),(1401,'AREADO',3),(1402,'ARGIRITA',3),(1403,'ARICANDUVA',3),(1404,'ARINOS',3),(1405,'ASTOLFO DUTRA',3),(1406,'ATALEIA',3),(1407,'AUGUSTO DE LIMA',3),(1408,'BAEPENDI',3),(1409,'BALDIM',3),(1410,'BAMBUI',3),(1411,'BANDEIRA',3),(1412,'BANDEIRA DO SUL',3),(1413,'BARAO DE COCAIS',3),(1414,'BARAO DE MONTE ALTO',3),(1415,'BARBACENA',3),(1416,'BARRA LONGA',3),(1417,'BARROSO',3),(1418,'BELA VISTA DE MINAS',3),(1419,'BELMIRO BRAGA',3),(1420,'BELO ORIENTE',3),(1421,'BELO VALE',3),(1422,'BERILO',3),(1423,'BERIZAL',3),(1424,'BERTOPOLIS',3),(1425,'BETIM',3),(1426,'BIAS FORTES',3),(1427,'BICAS',3),(1428,'BIQUINHAS',3),(1429,'BOA ESPERANCA',3),(1430,'BOCAINA DE MINAS',3),(1431,'BOCAIUVA',3),(1432,'BOM DESPACHO',3),(1433,'BOM JARDIM DE MINAS',3),(1434,'BOM JESUS DA PENHA',3),(1435,'BOM JESUS DO AMPARO',3),(1436,'BOM JESUS DO GALHO',3),(1437,'BOM REPOUSO',3),(1438,'BOM SUCESSO',3),(1439,'BONFIM',3),(1440,'BONFINOPOLIS DE MINAS',3),(1441,'BONITO DE MINAS',3),(1442,'BORDA DA MATA',3),(1443,'BOTELHOS',3),(1444,'BOTUMIRIM',3),(1445,'BRAS PIRES',3),(1446,'BRASILANDIA DE MINAS',3),(1447,'BRASILIA DE MINAS',3),(1448,'BRASOPOLIS',3),(1449,'BRAUNAS',3),(1450,'BRUMADINHO',3),(1451,'BUENO BRANDAO',3),(1452,'BUENOPOLIS',3),(1453,'BUGRE',3),(1454,'BURITIS',3),(1455,'BURITIZEIRO',3),(1456,'CABECEIRA GRANDE',3),(1457,'CABO VERDE',3),(1458,'CACHOEIRA DA PRATA',3),(1459,'CACHOEIRA DE MINAS',3),(1460,'CACHOEIRA DE PAJEU',3),(1461,'CACHOEIRA DOURADA',3),(1462,'CAETANOPOLIS',3),(1463,'CAETE',3),(1464,'CAIANA',3),(1465,'CAJURI',3),(1466,'CALDAS',3),(1467,'CAMACHO',3),(1468,'CAMANDUCAIA',3),(1469,'CAMBUI',3),(1470,'CAMBUQUIRA',3),(1471,'CAMPANARIO',3),(1472,'CAMPANHA',3),(1473,'CAMPESTRE',3),(1474,'CAMPINA VERDE',3),(1475,'CAMPO AZUL',3),(1476,'CAMPO BELO',3),(1477,'CAMPO DO MEIO',3),(1478,'CAMPO FLORIDO',3),(1479,'CAMPOS ALTOS',3),(1480,'CAMPOS GERAIS',3),(1481,'CANA VERDE',3),(1482,'CANAA',3),(1483,'CANAPOLIS',3),(1484,'CANDEIAS',3),(1485,'CANTAGALO',3),(1486,'CAPARAO',3),(1487,'CAPELA NOVA',3),(1488,'CAPELINHA',3),(1489,'CAPETINGA',3),(1490,'CAPIM BRANCO',3),(1491,'CAPINOPOLIS',3),(1492,'CAPITAO ANDRADE',3),(1493,'CAPITAO ENEAS',3),(1494,'CAPITOLIO',3),(1495,'CAPUTIRA',3),(1496,'CARAI',3),(1497,'CARANAIBA',3),(1498,'CARANDAI',3),(1499,'CARANGOLA',3),(1500,'CARATINGA',3),(1501,'CARBONITA',3),(1502,'CAREACU',3),(1503,'CARLOS CHAGAS',3),(1504,'CARMESIA',3),(1505,'CARMO DA CACHOEIRA',3),(1506,'CARMO DA MATA',3),(1507,'CARMO DE MINAS',3),(1508,'CARMO DO CAJURU',3),(1509,'CARMO DO PARANAIBA',3),(1510,'CARMO DO RIO CLARO',3),(1511,'CARMOPOLIS DE MINAS',3),(1512,'CARNEIRINHO',3),(1513,'CARRANCAS',3),(1514,'CARVALHOPOLIS',3),(1515,'CARVALHOS',3),(1516,'CASA GRANDE',3),(1517,'CASCALHO RICO',3),(1518,'CASSIA',3),(1519,'CATAGUASES',3),(1520,'CATAS ALTAS',3),(1521,'CATAS ALTAS DA NORUEGA',3),(1522,'CATUJI',3),(1523,'CATUTI',3),(1524,'CAXAMBU',3),(1525,'CEDRO DO ABAETE',3),(1526,'CENTRAL DE MINAS',3),(1527,'CENTRALINA',3),(1528,'CHACARA',3),(1529,'CHALE',3),(1530,'CHAPADA DO NORTE',3),(1531,'CHAPADA GAUCHA',3),(1532,'CHIADOR',3),(1533,'CIPOTANEA',3),(1534,'CLARAVAL',3),(1535,'CLARO DOS POCOES',3),(1536,'CLAUDIO',3),(1537,'COIMBRA',3),(1538,'COLUNA',3),(1539,'COMENDADOR GOMES',3),(1540,'COMERCINHO',3),(1541,'CONCEICAO DA APARECIDA',3),(1542,'CONCEICAO DA BARRA DE MINAS',3),(1543,'CONCEICAO DAS ALAGOAS',3),(1544,'CONCEICAO DAS PEDRAS',3),(1545,'CONCEICAO DE IPANEMA',3),(1546,'CONCEICAO DO MATO DENTRO',3),(1547,'CONCEICAO DO PARA',3),(1548,'CONCEICAO DO RIO VERDE',3),(1549,'CONCEICAO DOS OUROS',3),(1550,'CONEGO MARINHO',3),(1551,'CONFINS',3),(1552,'CONGONHAL',3),(1553,'CONGONHAS',3),(1554,'CONGONHAS DO NORTE',3),(1555,'CONQUISTA',3),(1556,'CONSELHEIRO LAFAIETE',3),(1557,'CONSELHEIRO PENA',3),(1558,'CONSOLACAO',3),(1559,'CONTAGEM',3),(1560,'COQUEIRAL',3),(1561,'CORACAO DE JESUS',3),(1562,'CORDISBURGO',3),(1563,'CORDISLANDIA',3),(1564,'CORINTO',3),(1565,'COROACI',3),(1566,'COROMANDEL',3),(1567,'CORONEL FABRICIANO',3),(1568,'CORONEL MURTA',3),(1569,'CORONEL PACHECO',3),(1570,'CORONEL XAVIER CHAVES',3),(1571,'CORREGO DANTA',3),(1572,'CORREGO DO BOM JESUS',3),(1573,'CORREGO FUNDO',3),(1574,'CORREGO NOVO',3),(1575,'COUTO DE MAGALHAES DE MINAS',3),(1576,'CRISOLITA',3),(1577,'CRISTAIS',3),(1578,'CRISTALIA',3),(1579,'CRISTIANO OTONI',3),(1580,'CRISTINA',3),(1581,'CRUCILANDIA',3),(1582,'CRUZEIRO DA FORTALEZA',3),(1583,'CRUZILIA',3),(1584,'CUPARAQUE',3),(1585,'CURRAL DE DENTRO',3),(1586,'CURVELO',3),(1587,'DATAS',3),(1588,'DELFIM MOREIRA',3),(1589,'DELFINOPOLIS',3),(1590,'DELTA',3),(1591,'DESCOBERTO',3),(1592,'DESTERRO DE ENTRE RIOS',3),(1593,'DESTERRO DO MELO',3),(1594,'DIAMANTINA',3),(1595,'DIOGO DE VASCONCELOS',3),(1596,'DIONISIO',3),(1597,'DIVINESIA',3),(1598,'DIVINO',3),(1599,'DIVINO DAS LARANJEIRAS',3),(1600,'DIVINOLANDIA DE MINAS',3),(1601,'DIVINOPOLIS',3),(1602,'DIVISA ALEGRE',3),(1603,'DIVISA NOVA',3),(1604,'DIVISOPOLIS',3),(1605,'DOM BOSCO',3),(1606,'DOM CAVATI',3),(1607,'DOM JOAQUIM',3),(1608,'DOM SILVERIO',3),(1609,'DOM VICOSO',3),(1610,'DONA EUZEBIA',3),(1611,'DORES DE CAMPOS',3),(1612,'DORES DE GUANHAES',3),(1613,'DORES DO INDAIA',3),(1614,'DORES DO TURVO',3),(1615,'DORESOPOLIS',3),(1616,'DOURADOQUARA',3),(1617,'DURANDE',3),(1618,'ELOI MENDES',3),(1619,'ENGENHEIRO CALDAS',3),(1620,'ENGENHEIRO NAVARRO',3),(1621,'ENTRE FOLHAS',3),(1622,'ENTRE RIOS DE MINAS',3),(1623,'ERVALIA',3),(1624,'ESMERALDAS',3),(1625,'ESPERA FELIZ',3),(1626,'ESPINOSA',3),(1627,'ESPIRITO SANTO DO DOURADO',3),(1628,'ESTIVA',3),(1629,'ESTRELA DALVA',3),(1630,'ESTRELA DO INDAIA',3),(1631,'ESTRELA DO SUL',3),(1632,'EUGENOPOLIS',3),(1633,'EWBANK DA CAMARA',3),(1634,'EXTREMA',3),(1635,'FAMA',3),(1636,'FARIA LEMOS',3),(1637,'FELICIO DOS SANTOS',3),(1638,'FELISBURGO',3),(1639,'FELIXLANDIA',3),(1640,'FERNANDES TOURINHO',3),(1641,'FERROS',3),(1642,'FERVEDOURO',3),(1643,'FLORESTAL',3),(1644,'FORMIGA',3),(1645,'FORMOSO',3),(1646,'FORTALEZA DE MINAS',3),(1647,'FORTUNA DE MINAS',3),(1648,'FRANCISCO BADARO',3),(1649,'FRANCISCO DUMONT',3),(1650,'FRANCISCO SA',3),(1651,'FRANCISCOPOLIS',3),(1652,'FREI GASPAR',3),(1653,'FREI INOCENCIO',3),(1654,'FREI LAGONEGRO',3),(1655,'FRONTEIRA',3),(1656,'FRONTEIRA DOS VALES',3),(1657,'FRUTA DE LEITE',3),(1658,'FRUTAL',3),(1659,'FUNILANDIA',3),(1660,'GALILEIA',3),(1661,'GAMELEIRAS',3),(1662,'GLAUCILANDIA',3),(1663,'GOIABEIRA',3),(1664,'GOIANA',3),(1665,'GONCALVES',3),(1666,'GONZAGA',3),(1667,'GOUVEA',3),(1668,'GOVERNADOR VALADARES',3),(1669,'GRAO MOGOL',3),(1670,'GRUPIARA',3),(1671,'GUANHAES',3),(1672,'GUAPE',3),(1673,'GUARACIABA',3),(1674,'GUARACIAMA',3),(1675,'GUARANESIA',3),(1676,'GUARANI',3),(1677,'GUARARA',3),(1678,'GUARDA-MOR',3),(1679,'GUAXUPE',3),(1680,'GUIDOVAL',3),(1681,'GUIMARANIA',3),(1682,'GUIRICEMA',3),(1683,'GURINHATA',3),(1684,'HELIODORA',3),(1685,'IAPU',3),(1686,'IBERTIOGA',3),(1687,'IBIA',3),(1688,'IBIAI',3),(1689,'IBIRACATU',3),(1690,'IBIRACI',3),(1691,'IBIRITE',3),(1692,'IBITIURA DE MINAS',3),(1693,'IBITURUNA',3),(1694,'ICARAI DE MINAS',3),(1695,'IGARAPE',3),(1696,'IGARATINGA',3),(1697,'IGUATAMA',3),(1698,'IJACI',3),(1699,'ILICINEA',3),(1700,'IMBE DE MINAS',3),(1701,'INCONFIDENTES',3),(1702,'INDAIABIRA',3),(1703,'INDIANOPOLIS',3),(1704,'INGAI',3),(1705,'INHAPIM',3),(1706,'INHAUMA',3),(1707,'INIMUTABA',3),(1708,'IPABA',3),(1709,'IPANEMA',3),(1710,'IPATINGA',3),(1711,'IPIACU',3),(1712,'IPUIUNA',3),(1713,'IRAI DE MINAS',3),(1714,'ITABIRA',3),(1715,'ITABIRINHA DE MANTENA',3),(1716,'ITABIRITO',3),(1717,'ITACAMBIRA',3),(1718,'ITACARAMBI',3),(1719,'ITAGUARA',3),(1720,'ITAIPE',3),(1721,'ITAJUBA',3),(1722,'ITAMARANDIBA',3),(1723,'ITAMARATI DE MINAS',3),(1724,'ITAMBACURI',3),(1725,'ITAMBE DO MATO DENTRO',3),(1726,'ITAMOGI',3),(1727,'ITAMONTE',3),(1728,'ITANHANDU',3),(1729,'ITANHOMI',3),(1730,'ITAOBIM',3),(1731,'ITAPAGIPE',3),(1732,'ITAPECERICA',3),(1733,'ITAPEVA',3),(1734,'ITATIAIUCU',3),(1735,'ITAU DE MINAS',3),(1736,'ITAUNA',3),(1737,'ITAVERAVA',3),(1738,'ITINGA',3),(1739,'ITUETA',3),(1740,'ITUIUTABA',3),(1741,'ITUMIRIM',3),(1742,'ITURAMA',3),(1743,'ITUTINGA',3),(1744,'JABOTICATUBAS',3),(1745,'JACINTO',3),(1746,'JACUI',3),(1747,'JACUTINGA',3),(1748,'JAGUARACU',3),(1749,'JAIBA',3),(1750,'JAMPRUCA',3),(1751,'JANAUBA',3),(1752,'JANUARIA',3),(1753,'JAPARAIBA',3),(1754,'JAPONVAR',3),(1755,'JECEABA',3),(1756,'JENIPAPO DE MINAS',3),(1757,'JEQUERI',3),(1758,'JEQUITAI',3),(1759,'JEQUITIBA',3),(1760,'JEQUITINHONHA',3),(1761,'JESUANIA',3),(1762,'JOAIMA',3),(1763,'JOANESIA',3),(1764,'JOAO MONLEVADE',3),(1765,'JOAO PINHEIRO',3),(1766,'JOAQUIM FELICIO',3),(1767,'JORDANIA',3),(1768,'JOSE GONCALVES DE MINAS',3),(1769,'JOSE RAYDAN',3),(1770,'JOSENOPOLIS',3),(1771,'JUATUBA',3),(1772,'JUIZ DE FORA',3),(1773,'JURAMENTO',3),(1774,'JURUAIA',3),(1775,'JUVENILIA',3),(1776,'LADAINHA',3),(1777,'LAGAMAR',3),(1778,'LAGOA DA PRATA',3),(1779,'LAGOA DOS PATOS',3),(1780,'LAGOA DOURADA',3),(1781,'LAGOA FORMOSA',3),(1782,'LAGOA GRANDE',3),(1783,'LAGOA SANTA',3),(1784,'LAJINHA',3),(1785,'LAMBARI',3),(1786,'LAMIM',3),(1787,'LARANJAL',3),(1788,'LASSANCE',3),(1789,'LAVRAS',3),(1790,'LEANDRO FERREIRA',3),(1791,'LEME DO PRADO',3),(1792,'LEOPOLDINA',3),(1793,'LIBERDADE',3),(1794,'LIMA DUARTE',3),(1795,'LIMEIRA D OESTE',3),(1796,'LONTRA',3),(1797,'LUISBURGO',3),(1798,'LUISLANDIA',3),(1799,'LUMINARIAS',3),(1800,'LUZ',3),(1801,'MACHACALIS',3),(1802,'MACHADO',3),(1803,'MADRE DE DEUS DE MINAS',3),(1804,'MALACACHETA',3),(1805,'MAMONAS',3),(1806,'MANGA',3),(1807,'MANHUACU',3),(1808,'MANHUMIRIM',3),(1809,'MANTENA',3),(1810,'MAR DE ESPANHA',3),(1811,'MARAVILHAS',3),(1812,'MARIA DA FE',3),(1813,'MARIANA',3),(1814,'MARILAC',3),(1815,'MARIO CAMPOS',3),(1816,'MARIPA DE MINAS',3),(1817,'MARLIERIA',3),(1818,'MARMELOPOLIS',3),(1819,'MARTINHO CAMPOS',3),(1820,'MARTINS SOARES',3),(1821,'MATA VERDE',3),(1822,'MATERLANDIA',3),(1823,'MATEUS LEME',3),(1824,'MATHIAS LOBATO',3),(1825,'MATIAS BARBOSA',3),(1826,'MATIAS CARDOSO',3),(1827,'MATIPO',3),(1828,'MATO VERDE',3),(1829,'MATOZINHOS',3),(1830,'MATUTINA',3),(1831,'MEDEIROS',3),(1832,'MEDINA',3),(1833,'MENDES PIMENTEL',3),(1834,'MERCES',3),(1835,'MESQUITA',3),(1836,'MINAS NOVAS',3),(1837,'MINDURI',3),(1838,'MIRABELA',3),(1839,'MIRADOURO',3),(1840,'MIRAI',3),(1841,'MIRAVANIA',3),(1842,'MOEDA',3),(1843,'MOEMA',3),(1844,'MONJOLOS',3),(1845,'MONSENHOR PAULO',3),(1846,'MONTALVANIA',3),(1847,'MONTE ALEGRE DE MINAS',3),(1848,'MONTE AZUL',3),(1849,'MONTE BELO',3),(1850,'MONTE CARMELO',3),(1851,'MONTE FORMOSO',3),(1852,'MONTE SANTO DE MINAS',3),(1853,'MONTE SIAO',3),(1854,'MONTES CLAROS',3),(1855,'MONTEZUMA',3),(1856,'MORADA NOVA DE MINAS',3),(1857,'MORRO DA GARCA',3),(1858,'MORRO DO PILAR',3),(1859,'MUNHOZ',3),(1860,'MURIAE',3),(1861,'MUTUM',3),(1862,'MUZAMBINHO',3),(1863,'NACIP RAYDAN',3),(1864,'NANUQUE',3),(1865,'NAQUE',3),(1866,'NATALANDIA',3),(1867,'NATERCIA',3),(1868,'NAZARENO',3),(1869,'NEPOMUCENO',3),(1870,'NINHEIRA',3),(1871,'NOVA BELEM',3),(1872,'NOVA ERA',3),(1873,'NOVA LIMA',3),(1874,'NOVA MODICA',3),(1875,'NOVA PONTE',3),(1876,'NOVA PORTEIRINHA',3),(1877,'NOVA RESENDE',3),(1878,'NOVA SERRANA',3),(1879,'NOVA UNIAO',3),(1880,'NOVO CRUZEIRO',3),(1881,'NOVO ORIENTE DE MINAS',3),(1882,'NOVORIZONTE',3),(1883,'OLARIA',3),(1884,'OLHOS-DAGUA',3),(1885,'OLIMPIO NORONHA',3),(1886,'OLIVEIRA',3),(1887,'OLIVEIRA FORTES',3),(1888,'ONCA DE PITANGUI',3),(1889,'ORATORIOS',3),(1890,'ORIZANIA',3),(1891,'OURO BRANCO',3),(1892,'OURO FINO',3),(1893,'OURO PRETO',3),(1894,'OURO VERDE DE MINAS',3),(1895,'PADRE CARVALHO',3),(1896,'PADRE PARAISO',3),(1897,'PAI PEDRO',3),(1898,'PAINEIRAS',3),(1899,'PAINS',3),(1900,'PAIVA',3),(1901,'PALMA',3),(1902,'PALMOPOLIS',3),(1903,'PAPAGAIOS',3),(1904,'PARA DE MINAS',3),(1905,'PARACATU',3),(1906,'PARAGUACU',3),(1907,'PARAISOPOLIS',3),(1908,'PARAOPEBA',3),(1909,'PASSA QUATRO',3),(1910,'PASSA TEMPO',3),(1911,'PASSABEM',3),(1912,'PASSA-VINTE',3),(1913,'PASSOS',3),(1914,'PATIS',3),(1915,'PATOS DE MINAS',3),(1916,'PATROCINIO',3),(1917,'PATROCINIO DO MURIAE',3),(1918,'PAULA CANDIDO',3),(1919,'PAULISTAS',3),(1920,'PAVAO',3),(1921,'PECANHA',3),(1922,'PEDRA AZUL',3),(1923,'PEDRA BONITA',3),(1924,'PEDRA DO ANTA',3),(1925,'PEDRA DO INDAIA',3),(1926,'PEDRA DOURADA',3),(1927,'PEDRALVA',3),(1928,'PEDRAS DE MARIA DA CRUZ',3),(1929,'PEDRINOPOLIS',3),(1930,'PEDRO LEOPOLDO',3),(1931,'PEDRO TEIXEIRA',3),(1932,'PEQUERI',3),(1933,'PEQUI',3),(1934,'PERDIGAO',3),(1935,'PERDIZES',3),(1936,'PERDOES',3),(1937,'PERIQUITO',3),(1938,'PESCADOR',3),(1939,'PIAU',3),(1940,'PIEDADE DE CARATINGA',3),(1941,'PIEDADE DE PONTE NOVA',3),(1942,'PIEDADE DO RIO GRANDE',3),(1943,'PIEDADE DOS GERAIS',3),(1944,'PIMENTA',3),(1945,'PINGO DAGUA',3),(1946,'PINTOPOLIS',3),(1947,'PIRACEMA',3),(1948,'PIRAJUBA',3),(1949,'PIRANGA',3),(1950,'PIRANGUCU',3),(1951,'PIRANGUINHO',3),(1952,'PIRAPETINGA',3),(1953,'PIRAPORA',3),(1954,'PIRAUBA',3),(1955,'PITANGUI',3),(1956,'PIUMHI',3),(1957,'PLANURA',3),(1958,'POCO FUNDO',3),(1959,'POCOS DE CALDAS',3),(1960,'POCRANE',3),(1961,'POMPEU',3),(1962,'PONTE NOVA',3),(1963,'PONTO CHIQUE',3),(1964,'PONTO DOS VOLANTES',3),(1965,'PORTEIRINHA',3),(1966,'PORTO FIRME',3),(1967,'POTE',3),(1968,'POUSO ALEGRE',3),(1969,'POUSO ALTO',3),(1970,'PRADOS',3),(1971,'PRATA',3),(1972,'PRATAPOLIS',3),(1973,'PRATINHA',3),(1974,'PRESIDENTE BERNARDES',3),(1975,'PRESIDENTE JUSCELINO',3),(1976,'PRESIDENTE KUBITSCHEK',3),(1977,'PRESIDENTE OLEGARIO',3),(1978,'PRUDENTE DE MORAIS',3),(1979,'QUARTEL GERAL',3),(1980,'QUELUZITA',3),(1981,'RAPOSOS',3),(1982,'RAUL SOARES',3),(1983,'RECREIO',3),(1984,'REDUTO',3),(1985,'RESENDE COSTA',3),(1986,'RESPLENDOR',3),(1987,'RESSAQUINHA',3),(1988,'RIACHINHO',3),(1989,'RIACHO DOS MACHADOS',3),(1990,'RIBEIRAO DAS NEVES',3),(1991,'RIBEIRAO VERMELHO',3),(1992,'RIO ACIMA',3),(1993,'RIO CASCA',3),(1994,'RIO DO PRADO',3),(1995,'RIO DOCE',3),(1996,'RIO ESPERA',3),(1997,'RIO MANSO',3),(1998,'RIO NOVO',3),(1999,'RIO PARANAIBA',3),(2000,'RIO PARDO DE MINAS',3),(2001,'RIO PIRACICABA',3),(2002,'RIO POMBA',3),(2003,'RIO PRETO',3),(2004,'RIO VERMELHO',3),(2005,'RITAPOLIS',3),(2006,'ROCHEDO DE MINAS',3),(2007,'RODEIRO',3),(2008,'ROMARIA',3),(2009,'ROSARIO DA LIMEIRA',3),(2010,'RUBELITA',3),(2011,'RUBIM',3),(2012,'SABARA',3),(2013,'SABINOPOLIS',3),(2014,'SACRAMENTO',3),(2015,'SALINAS',3),(2016,'SALTO DA DIVISA',3),(2017,'SANTA BARBARA',3),(2018,'SANTA BARBARA DO LESTE',3),(2019,'SANTA BARBARA DO MONTE VERDE',3),(2020,'SANTA BARBARA DO TUGURIO',3),(2021,'SANTA CRUZ DE MINAS',3),(2022,'SANTA CRUZ DE SALINAS',3),(2023,'SANTA CRUZ DO ESCALVADO',3),(2024,'SANTA EFIGENIA DE MINAS',3),(2025,'SANTA FE DE MINAS',3),(2026,'SANTA HELENA DE MINAS',3),(2027,'SANTA JULIANA',3),(2028,'SANTA LUZIA',3),(2029,'SANTA MARGARIDA',3),(2030,'SANTA MARIA DE ITABIRA',3),(2031,'SANTA MARIA DO SALTO',3),(2032,'SANTA MARIA DO SUACUI',3),(2033,'SANTA RITA DE CALDAS',3),(2034,'SANTA RITA DE JACUTINGA',3),(2035,'SANTA RITA DE MINAS',3),(2036,'SANTA RITA DO IBITIPOCA ',3),(2037,'SANTA RITA DO ITUETO',3),(2038,'SANTA RITA DO SAPUCAI',3),(2039,'SANTA ROSA DA SERRA',3),(2040,'SANTA VITORIA',3),(2041,'SANTANA DA VARGEM',3),(2042,'SANTANA DE CATAGUASES',3),(2043,'SANTANA DE PIRAPAMA',3),(2044,'SANTANA DO DESERTO',3),(2045,'SANTANA DO GARAMBEU',3),(2046,'SANTANA DO JACARE',3),(2047,'SANTANA DO MANHUACU',3),(2048,'SANTANA DO PARAISO',3),(2049,'SANTANA DO RIACHO',3),(2050,'SANTANA DOS MONTES',3),(2051,'SANTO ANTONIO DO AMPARO',3),(2052,'SANTO ANTONIO DO AVENTUREIRO',3),(2053,'SANTO ANTONIO DO GRAMA',3),(2054,'SANTO ANTONIO DO ITAMBE',3),(2055,'SANTO ANTONIO DO JACINTO',3),(2056,'SANTO ANTONIO DO MONTE',3),(2057,'SANTO ANTONIO DO RETIRO',3),(2058,'SANTO ANTONIO DO RIO ABAIXO',3),(2059,'SANTO HIPOLITO',3),(2060,'SANTOS DUMONT',3),(2061,'SAO BENTO ABADE',3),(2062,'SAO BRAS DO SUACUI',3),(2063,'SAO DOMINGOS DAS DORES',3),(2064,'SAO DOMINGOS DO PRATA',3),(2065,'SAO FELIX DE MINAS',3),(2066,'SAO FRANCISCO',3),(2067,'SAO FRANCISCO DE PAULA',3),(2068,'SAO FRANCISCO DE SALES',3),(2069,'SAO FRANCISCO DO GLORIA',3),(2070,'SAO GERALDO',3),(2071,'SAO GERALDO DA PIEDADE',3),(2072,'SAO GERALDO DO BAIXIO',3),(2073,'SAO GONCALO DO ABAETE',3),(2074,'SAO GONCALO DO PARA',3),(2075,'SAO GONCALO DO RIO ABAIXO',3),(2076,'SAO GONCALO DO RIO PRETO',3),(2077,'SAO GONCALO DO SAPUCAI',3),(2078,'SAO GOTARDO',3),(2079,'SAO JOAO BATISTA DO GLORIA',3),(2080,'SAO JOAO DA LAGOA',3),(2081,'SAO JOAO DA MATA',3),(2082,'SAO JOAO DA PONTE',3),(2083,'SAO JOAO DAS MISSOES',3),(2084,'SAO JOAO DEL REI',3),(2085,'SAO JOAO DO MANHUACU',3),(2086,'SAO JOAO DO MANTENINHA',3),(2087,'SAO JOAO DO ORIENTE',3),(2088,'SAO JOAO DO PACUI',3),(2089,'SAO JOAO DO PARAISO',3),(2090,'SAO JOAO EVANGELISTA',3),(2091,'SAO JOAO NEPOMUCENO',3),(2092,'SAO JOAQUIM DE BICAS',3),(2093,'SAO JOSE DA BARRA',3),(2094,'SAO JOSE DA LAPA',3),(2095,'SAO JOSE DA SAFIRA',3),(2096,'SAO JOSE DA VARGINHA',3),(2097,'SAO JOSE DO ALEGRE',3),(2098,'SAO JOSE DO DIVINO',3),(2099,'SAO JOSE DO GOIABAL',3),(2100,'SAO JOSE DO JACURI',3),(2101,'SAO JOSE DO MANTIMENTO',3),(2102,'SAO LOURENCO',3),(2103,'SAO MIGUEL DO ANTA',3),(2104,'SAO PEDRO DA UNIAO',3),(2105,'SAO PEDRO DO SUACUI',3),(2106,'SAO PEDRO DOS FERROS',3),(2107,'SAO ROMAO',3),(2108,'SAO ROQUE DE MINAS',3),(2109,'SAO SEBASTIAO DA BELA VISTA',3),(2110,'SAO SEBASTIAO DA VARGEM ALEGRE',3),(2111,'SAO SEBASTIAO DO ANTA',3),(2112,'SAO SEBASTIAO DO MARANHAO',3),(2113,'SAO SEBASTIAO DO OESTE',3),(2114,'SAO SEBASTIAO DO PARAISO',3),(2115,'SAO SEBASTIAO DO RIO PRETO',3),(2116,'SAO SEBASTIAO DO RIO VERDE',3),(2117,'SAO THOME DAS LETRAS',3),(2118,'SAO TIAGO',3),(2119,'SAO TOMAS DE AQUINO',3),(2120,'SAO VICENTE DE MINAS',3),(2121,'SAPUCAI-MIRIM',3),(2122,'SARDOA',3),(2123,'SARZEDO',3),(2124,'SEM-PEIXE',3),(2125,'SENADOR AMARAL',3),(2126,'SENADOR CORTES',3),(2127,'SENADOR FIRMINO',3),(2128,'SENADOR JOSE BENTO',3),(2129,'SENADOR MODESTINO GONCALVES',3),(2130,'SENHORA DE OLIVEIRA',3),(2131,'SENHORA DO PORTO',3),(2132,'SENHORA DOS REMEDIOS',3),(2133,'SERICITA',3),(2134,'SERITINGA',3),(2135,'SERRA AZUL DE MINAS',3),(2136,'SERRA DA SAUDADE',3),(2137,'SERRA DO SALITRE',3),(2138,'SERRA DOS AIMORES',3),(2139,'SERRANIA',3),(2140,'SERRANOPOLIS DE MINAS',3),(2141,'SERRANOS',3),(2142,'SERRO',3),(2143,'SETE LAGOAS',3),(2144,'SETUBINHA',3),(2145,'SILVEIRANIA',3),(2146,'SILVIANOPOLIS',3),(2147,'SIMAO PEREIRA',3),(2148,'SIMONESIA',3),(2149,'SOBRALIA',3),(2150,'SOLEDADE DE MINAS',3),(2151,'TABULEIRO',3),(2152,'TAIOBEIRAS',3),(2153,'TAPARUBA',3),(2154,'TAPIRA',3),(2155,'TAPIRAI',3),(2156,'TAQUARACU DE MINAS',3),(2157,'TARUMIRIM',3),(2158,'TEIXEIRAS',3),(2159,'TEOFILO OTONI',3),(2160,'TIMOTEO',3),(2161,'TIRADENTES',3),(2162,'TIROS',3),(2163,'TOCANTINS',3),(2164,'TOCOS DO MOGI',3),(2165,'TOLEDO',3),(2166,'TOMBOS',3),(2167,'TRES CORACOES',3),(2168,'TRES MARIAS',3),(2169,'TRES PONTAS',3),(2170,'TUMIRITINGA',3),(2171,'TUPACIGUARA',3),(2172,'TURMALINA',3),(2173,'TURVOLANDIA',3),(2174,'UBA',3),(2175,'UBAI',3),(2176,'UBAPORANGA',3),(2177,'UBERABA',3),(2178,'UBERLANDIA',3),(2179,'UMBURATIBA',3),(2180,'UNAI',3),(2181,'UNIAO DE MINAS',3),(2182,'URUANA DE MINAS',3),(2183,'URUCANIA',3),(2184,'URUCUIA',3),(2185,'VARGEM ALEGRE',3),(2186,'VARGEM BONITA',3),(2187,'VARGEM GRANDE DO RIO PARDO',3),(2188,'VARGINHA',3),(2189,'VARJAO DE MINAS',3),(2190,'VARZEA DA PALMA',3),(2191,'VARZELANDIA',3),(2192,'VAZANTE',3),(2193,'VERDELANDIA',3),(2194,'VEREDINHA',3),(2195,'VERISSIMO',3),(2196,'VERMELHO NOVO',3),(2197,'VESPASIANO',3),(2198,'VICOSA',3),(2199,'VIEIRAS',3),(2200,'VIRGEM DA LAPA',3),(2201,'VIRGINIA',3),(2202,'VIRGINOPOLIS',3),(2203,'VIRGOLANDIA',3),(2204,'VISCONDE DO RIO BRANCO',3),(2205,'VOLTA GRANDE',3),(2206,'WENCESLAU BRAZ',3),(2207,'AGUA CLARA',16),(2208,'ALCINOPOLIS',16),(2209,'AMAMBAI',16),(2210,'ANASTACIO',16),(2211,'ANAURILANDIA',16),(2212,'ANGELICA',16),(2213,'ANTONIO JOAO',16),(2214,'APARECIDA DO TABOADO',16),(2215,'AQUIDAUANA',16),(2216,'ARAL MOREIRA',16),(2217,'BANDEIRANTES',16),(2218,'BATAGUASSU',16),(2219,'BATAIPORA',16),(2220,'BELA VISTA',16),(2221,'BODOQUENA',16),(2222,'BONITO',16),(2223,'BRASILANDIA',16),(2224,'CAARAPO',16),(2225,'CAMAPUA',16),(2226,'CAMPO GRANDE',16),(2227,'CARACOL',16),(2228,'CASSILANDIA',16),(2229,'CHAPADAO DO SUL',16),(2230,'CORGUINHO',16),(2231,'CORONEL SAPUCAIA',16),(2232,'CORUMBA',16),(2233,'COSTA RICA',16),(2234,'COXIM',16),(2235,'DEODAPOLIS',16),(2236,'DOIS IRMAOS DO BURITI',16),(2237,'DOURADINA',16),(2238,'DOURADOS',16),(2239,'ELDORADO',16),(2240,'FATIMA DO SUL',16),(2241,'FIGUEIR√ÉO',16),(2242,'GLORIA DE DOURADOS',16),(2243,'GUIA LOPES DA LAGUNA',16),(2244,'IGUATEMI',16),(2245,'INOCENCIA',16),(2246,'ITAPORA',16),(2247,'ITAQUIRAI',16),(2248,'IVINHEMA',16),(2249,'JAPORA',16),(2250,'JARAGUARI',16),(2251,'JARDIM',16),(2252,'JATEI',16),(2253,'JUTI',16),(2254,'LADARIO',16),(2255,'LAGUNA CARAPA',16),(2256,'MARACAJU',16),(2257,'MIRANDA',16),(2258,'MUNDO NOVO',16),(2259,'NAVIRAI',16),(2260,'NIOAQUE',16),(2261,'NOVA ALVORADA DO SUL',16),(2262,'NOVA ANDRADINA',16),(2263,'NOVO HORIZONTE DO SUL',16),(2264,'PARANAIBA',16),(2265,'PARANHOS',16),(2266,'PEDRO GOMES',16),(2267,'PONTA PORA',16),(2268,'PORTO MURTINHO',16),(2269,'RIBAS DO RIO PARDO',16),(2270,'RIO BRILHANTE',16),(2271,'RIO NEGRO',16),(2272,'RIO VERDE DE MATO GROSSO',16),(2273,'ROCHEDO',16),(2274,'SANTA RITA DO PARDO',16),(2275,'SAO GABRIEL DO OESTE',16),(2276,'SELVIRIA',16),(2277,'SETE QUEDAS',16),(2278,'SIDROLANDIA',16),(2279,'SONORA',16),(2280,'TACURU',16),(2281,'TAQUARUSSU',16),(2282,'TERENOS',16),(2283,'TRES LAGOAS',16),(2284,'VICENTINA',16),(2285,'ACORIZAL',15),(2286,'AGUA BOA',15),(2287,'ALTA FLORESTA',15),(2288,'ALTO ARAGUAIA',15),(2289,'ALTO BOA VISTA',15),(2290,'ALTO GARCAS',15),(2291,'ALTO PARAGUAI',15),(2292,'ALTO TAQUARI',15),(2293,'APIACAS',15),(2294,'ARAGUAIANA',15),(2295,'ARAGUAINHA',15),(2296,'ARAPUTANGA',15),(2297,'ARENAPOLIS',15),(2298,'ARIPUANA',15),(2299,'BARAO DE MELGACO',15),(2300,'BARRA DO BUGRES',15),(2301,'BARRA DO GARCAS',15),(2302,'BOM JESUS DO ARAGUAIA',15),(2303,'BRASNORTE',15),(2304,'CACERES',15),(2305,'CAMPINAPOLIS',15),(2306,'CAMPO NOVO DO PARECIS',15),(2307,'CAMPO VERDE',15),(2308,'CAMPOS DE JULIO',15),(2309,'CANA BRAVA DO NORTE',15),(2310,'CANARANA',15),(2311,'CARLINDA',15),(2312,'CASTANHEIRA',15),(2313,'CHAPADA DOS GUIMARAES',15),(2314,'CLAUDIA',15),(2315,'COCALINHO',15),(2316,'COLIDER',15),(2317,'COLNIZA',15),(2318,'COMODORO',15),(2319,'CONFRESA',15),(2320,'CONQUISTA DOESTE',15),(2321,'COTRIGUACU',15),(2322,'CURVELANDIA',15),(2323,'DENISE',15),(2324,'DIAMANTINO',15),(2325,'DOM AQUINO',15),(2326,'FELIZ NATAL',15),(2327,'FIGUEIROPOLIS DOESTE',15),(2328,'GAUCHA DO NORTE',15),(2329,'GENERAL CARNEIRO',15),(2330,'GLORIA DOESTE',15),(2331,'GUARANTA DO NORTE',15),(2332,'GUIRATINGA',15),(2333,'INDIAVAI',15),(2334,'IPIRANGA DO NORTE',15),(2335,'ITANHANG√Å',15),(2336,'ITAUBA',15),(2337,'ITIQUIRA',15),(2338,'JACIARA',15),(2339,'JANGADA',15),(2340,'JAURU',15),(2341,'JUARA',15),(2342,'JUINA',15),(2343,'JURUENA',15),(2344,'JUSCIMEIRA',15),(2345,'LAMBARI DOESTE',15),(2346,'LUCAS DO RIO VERDE',15),(2347,'LUCIARA',15),(2348,'MARCELANDIA',15),(2349,'MATUPA',15),(2350,'MIRASSOL DOESTE',15),(2351,'NOBRES',15),(2352,'NORTELANDIA',15),(2353,'NOSSA SENHORA DO LIVRAMENTO',15),(2354,'NOVA BANDEIRANTES',15),(2355,'NOVA BRASILANDIA',15),(2356,'NOVA CANAA DO NORTE',15),(2357,'NOVA GUARITA',15),(2358,'NOVA LACERDA',15),(2359,'NOVA MARILANDIA',15),(2360,'NOVA MARINGA',15),(2361,'NOVA MONTE VERDE',15),(2362,'NOVA MUTUM',15),(2363,'NOVA NAZARE',15),(2364,'NOVA OLIMPIA',15),(2365,'NOVA SANTA HELENA',15),(2366,'NOVA UBIRATA',15),(2367,'NOVA XAVANTINA',15),(2368,'NOVO HORIZONTE DO NORTE',15),(2369,'NOVO MUNDO',15),(2370,'NOVO SANTO ANTONIO',15),(2371,'NOVO SAO JOAQUIM',15),(2372,'PARANAITA',15),(2373,'PARANATINGA',15),(2374,'PEDRA PRETA',15),(2375,'PEIXOTO DE AZEVEDO',15),(2376,'PLANALTO DA SERRA',15),(2377,'POCONE',15),(2378,'PONTAL DO ARAGUAIA',15),(2379,'PONTE BRANCA',15),(2380,'PONTES E LACERDA',15),(2381,'PORTO ALEGRE DO NORTE',15),(2382,'PORTO DOS GAUCHOS',15),(2383,'PORTO ESPERIDIAO',15),(2384,'PORTO ESTRELA',15),(2385,'POXOREO',15),(2386,'PRIMAVERA DO LESTE',15),(2387,'QUERENCIA',15),(2388,'RESERVA DO CABACAL',15),(2389,'RIBEIRAO CASCALHEIRA',15),(2390,'RIBEIRAOZINHO',15),(2391,'RIO BRANCO',15),(2392,'RONDOLANDIA',15),(2393,'RONDONOPOLIS',15),(2394,'ROSARIO OESTE',15),(2395,'SALTO DO CEU',15),(2396,'SANTA CARMEN',15),(2397,'SANTA CRUZ DO XINGU',15),(2398,'SANTA RITA DO TRIVELATO',15),(2399,'SANTA TEREZINHA',15),(2400,'SANTO AFONSO',15),(2401,'SANTO ANTONIO DO LESTE',15),(2402,'SANTO ANTONIO DO LEVERGER',15),(2403,'SAO FELIX DO ARAGUAIA',15),(2404,'SAO JOSE DO POVO',15),(2405,'SAO JOSE DO RIO CLARO',15),(2406,'SAO JOSE DO XINGU',15),(2407,'SAO JOSE DOS QUATRO MARCOS',15),(2408,'SAO PEDRO DA CIPA',15),(2409,'SAPEZAL',15),(2410,'SERRA NOVA DOURADA',15),(2411,'SINOP',15),(2412,'SORRISO',15),(2413,'TABAPORA',15),(2414,'TANGARA DA SERRA',15),(2415,'TAPURAH',15),(2416,'TERRA NOVA DO NORTE',15),(2417,'TESOURO',15),(2418,'TORIXOREU',15),(2419,'UNIAO DO SUL',15),(2420,'VALE DE SAO DOMINGOS',15),(2421,'VARZEA GRANDE',15),(2422,'VERA',15),(2423,'VILA BELA SANTISSIMA TRINDADE',15),(2424,'VILA RICA',15),(2425,'ABAETETUBA',17),(2426,'ABEL FIGUEIREDO',17),(2427,'ACARA',17),(2428,'AFUA',17),(2429,'AGUA AZUL DO NORTE',17),(2430,'ALENQUER',17),(2431,'ALMEIRIM',17),(2432,'ALTAMIRA',17),(2433,'ANAJAS',17),(2434,'ANANINDEUA',17),(2435,'ANAPU',17),(2436,'AUGUSTO CORREA',17),(2437,'AURORA DO PARA',17),(2438,'AVEIRO',17),(2439,'BAGRE',17),(2440,'BAIAO',17),(2441,'BANNACH',17),(2442,'BARCARENA',17),(2443,'BELEM',17),(2444,'BELTERRA',17),(2445,'BENEVIDES',17),(2446,'BOM JESUS DO TOCANTINS',17),(2447,'BONITO',17),(2448,'BRAGANCA',17),(2449,'BRASIL NOVO',17),(2450,'BREJO GRANDE DO ARAGUAIA',17),(2451,'BREU BRANCO',17),(2452,'BREVES',17),(2453,'BUJARU',17),(2454,'CACHOEIRA DO ARARI',17),(2455,'CACHOEIRA DO PIRIA',17),(2456,'CAMETA',17),(2457,'CANAA DOS CARAJAS',17),(2458,'CAPANEMA',17),(2459,'CAPITAO POCO',17),(2460,'CASTANHAL',17),(2461,'CHAVES',17),(2462,'COLARES',17),(2463,'CONCEICAO DO ARAGUAIA',17),(2464,'CONCORDIA DO PARA',17),(2465,'CUMARU DO NORTE',17),(2466,'CURIONOPOLIS',17),(2467,'CURRALINHO',17),(2468,'CURUA',17),(2469,'CURUCA',17),(2470,'DOM ELISEU',17),(2471,'ELDORADO DOS CARAJAS',17),(2472,'FARO',17),(2473,'FLORESTA DO ARAGUAIA',17),(2474,'GARRAFAO DO NORTE',17),(2475,'GOIANESIA DO PARA',17),(2476,'GURUPA',17),(2477,'IGARAPE-ACU',17),(2478,'IGARAPE-MIRI',17),(2479,'INHANGAPI',17),(2480,'IPIXUNA DO PARA',17),(2481,'IRITUIA',17),(2482,'ITAITUBA',17),(2483,'ITUPIRANGA',17),(2484,'JACAREACANGA',17),(2485,'JACUNDA',17),(2486,'JURUTI',17),(2487,'LIMOEIRO DO AJURU',17),(2488,'MAE DO RIO',17),(2489,'MAGALHAES BARATA',17),(2490,'MARABA',17),(2491,'MARACANA',17),(2492,'MARAPANIM',17),(2493,'MARITUBA',17),(2494,'MEDICILANDIA',17),(2495,'MELGACO',17),(2496,'MOCAJUBA',17),(2497,'MOJU',17),(2498,'MONTE ALEGRE',17),(2499,'MUANA',17),(2500,'NOVA ESPERANCA DO PIRIA',17),(2501,'NOVA IPIXUNA',17),(2502,'NOVA TIMBOTEUA',17),(2503,'NOVO PROGRESSO',17),(2504,'NOVO REPARTIMENTO',17),(2505,'OBIDOS',17),(2506,'OEIRAS DO PARA',17),(2507,'ORIXIMINA',17),(2508,'OUREM',17),(2509,'OURILANDIA DO NORTE',17),(2510,'PACAJA',17),(2511,'PALESTINA DO PARA',17),(2512,'PARAGOMINAS',17),(2513,'PARAUAPEBAS',17),(2514,'PAU DARCO',17),(2515,'PEIXE BOI',17),(2516,'PICARRA',17),(2517,'PLACAS',17),(2518,'PONTA DE PEDRAS',17),(2519,'PORTEL',17),(2520,'PORTO DE MOZ',17),(2521,'PRAINHA',17),(2522,'PRIMAVERA',17),(2523,'QUATIPURU',17),(2524,'REDENCAO',17),(2525,'RIO MARIA',17),(2526,'RONDON DO PARA',17),(2527,'RUROPOLIS',17),(2528,'SALINOPOLIS',17),(2529,'SALVATERRA',17),(2530,'SANTA BARBARA DO PARA',17),(2531,'SANTA CRUZ DO ARARI',17),(2532,'SANTA ISABEL DO PARA',17),(2533,'SANTA LUZIA DO PARA',17),(2534,'SANTA MARIA DAS BARREIRAS',17),(2535,'SANTA MARIA DO PARA',17),(2536,'SANTANA DO ARAGUAIA',17),(2537,'SANTAREM',17),(2538,'SANTAREM NOVO',17),(2539,'SANTO ANTONIO DO TAUA',17),(2540,'SAO CAETANO DE ODIVELAS',17),(2541,'SAO DOMINGOS DO ARAGUAIA',17),(2542,'SAO DOMINGOS DO CAPIM',17),(2543,'SAO FELIX DO XINGU',17),(2544,'SAO FRANCISCO DO PARA',17),(2545,'SAO GERALDO DO ARAGUAIA',17),(2546,'SAO JOAO DA PONTA',17),(2547,'SAO JOAO DE PIRABAS',17),(2548,'SAO JOAO DO ARAGUAIA',17),(2549,'SAO MIGUEL DO GUAMA',17),(2550,'SAO SEBASTIAO DA BOA VISTA',17),(2551,'SAPUCAIA',17),(2552,'SENADOR JOSE PORFIRIO',17),(2553,'SOURE',17),(2554,'TAILANDIA',17),(2555,'TERRA ALTA',17),(2556,'TERRA SANTA',17),(2557,'TOME-ACU',17),(2558,'TRACUATEUA',17),(2559,'TRAIRAO',17),(2560,'TUCUMA',17),(2561,'TUCURUI',17),(2562,'ULIANOPOLIS',17),(2563,'URUARA',17),(2564,'VIGIA',17),(2565,'VISEU',17),(2566,'VITORIA DO XINGU',17),(2567,'XINGUARA',17),(2568,'AGUA BRANCA',18),(2569,'AGUIAR',18),(2570,'ALAGOA GRANDE',18),(2571,'ALAGOA NOVA',18),(2572,'ALAGOINHA',18),(2573,'ALCANTIL',18),(2574,'ALGODAO DE JANDAIRA',18),(2575,'ALHANDRA',18),(2576,'AMPARO',18),(2577,'APARECIDA',18),(2578,'ARACAGI',18),(2579,'ARARA',18),(2580,'ARARUNA',18),(2581,'AREIA',18),(2582,'AREIA DE BARAUNAS',18),(2583,'AREIAL',18),(2584,'AROEIRAS',18),(2585,'ASSUNCAO',18),(2586,'BAIA DA TRAICAO',18),(2587,'BANANEIRAS',18),(2588,'BARAUNA',18),(2589,'BARRA DE SANTA ROSA',18),(2590,'BARRA DE SANTANA',18),(2591,'BARRA DE SAO MIGUEL',18),(2592,'BAYEUX',18),(2593,'BELEM',18),(2594,'BELEM DO BREJO DO CRUZ',18),(2595,'BERNARDINO BATISTA',18),(2596,'BOA VENTURA',18),(2597,'BOA VISTA',18),(2598,'BOM JESUS',18),(2599,'BOM SUCESSO',18),(2600,'BONITO DE SANTA FE',18),(2601,'BOQUEIRAO',18),(2602,'BORBOREMA',18),(2603,'BREJO DO CRUZ',18),(2604,'BREJO DOS SANTOS',18),(2605,'CAAPORA',18),(2606,'CABACEIRAS',18),(2607,'CABEDELO',18),(2608,'CACHOEIRA DOS INDIOS',18),(2609,'CACIMBA DE AREIA',18),(2610,'CACIMBA DE DENTRO',18),(2611,'CACIMBAS',18),(2612,'CAICARA',18),(2613,'CAJAZEIRAS',18),(2614,'CAJAZEIRINHAS',18),(2615,'CALDAS BRANDAO',18),(2616,'CAMALAU',18),(2617,'CAMPINA GRANDE',18),(2618,'CAMPO DE SANTANA',18),(2619,'CAPIM',18),(2620,'CARAUBAS',18),(2621,'CARRAPATEIRA',18),(2622,'CASSERENGUE',18),(2623,'CATINGUEIRA',18),(2624,'CATOLE DO ROCHA',18),(2625,'CATURITE',18),(2626,'CONCEICAO',18),(2627,'CONDADO',18),(2628,'CONDE',18),(2629,'CONGO',18),(2630,'COREMAS',18),(2631,'COXIXOLA',18),(2632,'CRUZ DO ESPIRITO SANTO',18),(2633,'CUBATI',18),(2634,'CUITE',18),(2635,'CUITE DE MAMANGUAPE',18),(2636,'CUITEGI',18),(2637,'CURRAL DE CIMA',18),(2638,'CURRAL VELHO',18),(2639,'DAMIAO',18),(2640,'DESTERRO',18),(2641,'DIAMANTE',18),(2642,'DONA INES',18),(2643,'DUAS ESTRADAS',18),(2644,'EMAS',18),(2645,'ESPERANCA',18),(2646,'FAGUNDES',18),(2647,'FREI MARTINHO',18),(2648,'GADO BRAVO',18),(2649,'GUARABIRA',18),(2650,'GURINHEM',18),(2651,'GURJAO',18),(2652,'IBIARA',18),(2653,'IGARACY',18),(2654,'IMACULADA',18),(2655,'INGA',18),(2656,'ITABAIANA',18),(2657,'ITAPORANGA',18),(2658,'ITAPOROROCA',18),(2659,'ITATUBA',18),(2660,'JACARAU',18),(2661,'JERICO',18),(2662,'JOAO PESSOA',18),(2663,'JUAREZ TAVORA',18),(2664,'JUAZEIRINHO',18),(2665,'JUNCO DO SERIDO',18),(2666,'JURIPIRANGA',18),(2667,'JURU',18),(2668,'LAGOA',18),(2669,'LAGOA DE DENTRO',18),(2670,'LAGOA SECA',18),(2671,'LASTRO',18),(2672,'LIVRAMENTO',18),(2673,'LOGRADOURO',18),(2674,'LUCENA',18),(2675,'MAE DAGUA',18),(2676,'MALTA',18),(2677,'MAMANGUAPE',18),(2678,'MANAIRA',18),(2679,'MARCACAO',18),(2680,'MARI',18),(2681,'MARIZOPOLIS',18),(2682,'MASSARANDUBA',18),(2683,'MATARACA',18),(2684,'MATINHAS',18),(2685,'MATO GROSSO',18),(2686,'MATUREIA',18),(2687,'MOGEIRO',18),(2688,'MONTADAS',18),(2689,'MONTE HOREBE',18),(2690,'MONTEIRO',18),(2691,'MULUNGU',18),(2692,'NATUBA',18),(2693,'NAZAREZINHO',18),(2694,'NOVA FLORESTA',18),(2695,'NOVA OLINDA',18),(2696,'NOVA PALMEIRA',18),(2697,'OLHO DAGUA',18),(2698,'OLIVEDOS',18),(2699,'OURO VELHO',18),(2700,'PARARI',18),(2701,'PASSAGEM',18),(2702,'PATOS',18),(2703,'PAULISTA',18),(2704,'PEDRA BRANCA',18),(2705,'PEDRA LAVRADA',18),(2706,'PEDRAS DE FOGO',18),(2707,'PEDRO REGIS',18),(2708,'PIANCO',18),(2709,'PICUI',18),(2710,'PILAR',18),(2711,'PILOES',18),(2712,'PILOEZINHOS',18),(2713,'PIRPIRITUBA',18),(2714,'PITIMBU',18),(2715,'POCINHOS',18),(2716,'POCO DANTAS',18),(2717,'POCO DE JOSE DE MOURA',18),(2718,'POMBAL',18),(2719,'PRATA',18),(2720,'PRINCESA ISABEL',18),(2721,'PUXINANA',18),(2722,'QUEIMADAS',18),(2723,'QUIXABA',18),(2724,'REMIGIO',18),(2725,'RIACHAO',18),(2726,'RIACHAO DO BACAMARTE',18),(2727,'RIACHAO DO POCO',18),(2728,'RIACHO DE SANTO ANTONIO',18),(2729,'RIACHO DOS CAVALOS',18),(2730,'RIO TINTO',18),(2731,'SALGADINHO',18),(2732,'SALGADO DE SAO FELIX',18),(2733,'SANTA CECILIA',18),(2734,'SANTA CRUZ',18),(2735,'SANTA HELENA',18),(2736,'SANTA INES',18),(2737,'SANTA LUZIA',18),(2738,'SANTA RITA',18),(2739,'SANTA TERESINHA',18),(2740,'SANTANA DE MANGUEIRA',18),(2741,'SANTANA DOS GARROTES',18),(2742,'SANTAREM',18),(2743,'SANTO ANDRE',18),(2744,'S√ÉO BENTINHO',18),(2745,'SAO BENTO',18),(2746,'SAO DOMINGOS DE POMBAL',18),(2747,'SAO DOMINGOS DO CARIRI',18),(2748,'SAO FRANCISCO',18),(2749,'SAO JOAO DO CARIRI',18),(2750,'SAO JOAO DO RIO DO PEIXE',18),(2751,'SAO JOAO DO TIGRE',18),(2752,'SAO JOSE DA LAGOA TAPADA',18),(2753,'SAO JOSE DE CAIANA',18),(2754,'SAO JOSE DE ESPINHARAS',18),(2755,'SAO JOSE DE PIRANHAS',18),(2756,'SAO JOSE DE PRINCESA',18),(2757,'SAO JOSE DO BONFIM',18),(2758,'SAO JOSE DO BREJO DO CRUZ',18),(2759,'SAO JOSE DO SABUGI',18),(2760,'SAO JOSE DOS CORDEIROS',18),(2761,'SAO JOSE DOS RAMOS',18),(2762,'SAO MAMEDE',18),(2763,'SAO MIGUEL DE TAIPU',18),(2764,'SAO SEBASTIAO DE LAGOA DE ROCA',18),(2765,'SAO SEBASTIAO DO UMBUZEIRO',18),(2766,'SAPE',18),(2767,'SERIDO',18),(2768,'SERRA BRANCA',18),(2769,'SERRA DA RAIZ',18),(2770,'SERRA GRANDE',18),(2771,'SERRA REDONDA',18),(2772,'SERRARIA',18),(2773,'SERTAOZINHO',18),(2774,'SOBRADO',18),(2775,'SOLANEA',18),(2776,'SOLEDADE',18),(2777,'SOSSEGO',18),(2778,'SOUSA',18),(2779,'SUME',18),(2780,'TAPEROA',18),(2781,'TAVARES',18),(2782,'TEIXEIRA',18),(2783,'TENORIO',18),(2784,'TRIUNFO',18),(2785,'UIRAUNA',18),(2786,'UMBUZEIRO',18),(2787,'VARZEA',18),(2788,'VIEIROPOLIS',18),(2789,'VISTA SERRANA',18),(2790,'ZABELE',18),(2791,'ABREU E LIMA',20),(2792,'AFOGADOS DA INGAZEIRA',20),(2793,'AFRANIO',20),(2794,'AGRESTINA',20),(2795,'AGUA PRETA',20),(2796,'AGUAS BELAS',20),(2797,'ALAGOINHA',20),(2798,'ALIANCA',20),(2799,'ALTINHO',20),(2800,'AMARAJI',20),(2801,'ANGELIM',20),(2802,'ARACOIABA',20),(2803,'ARARIPINA',20),(2804,'ARCOVERDE',20),(2805,'BARRA DE GUABIRABA',20),(2806,'BARREIROS',20),(2807,'BELEM DE MARIA',20),(2808,'BELEM DE SAO FRANCISCO',20),(2809,'BELO JARDIM',20),(2810,'BETANIA',20),(2811,'BEZERROS',20),(2812,'BODOCO',20),(2813,'BOM CONSELHO',20),(2814,'BOM JARDIM',20),(2815,'BONITO',20),(2816,'BREJAO',20),(2817,'BREJINHO',20),(2818,'BREJO DA MADRE DE DEUS',20),(2819,'BUENOS AIRES',20),(2820,'BUIQUE',20),(2821,'CABO DE SANTO AGOSTINHO',20),(2822,'CABROBO',20),(2823,'CACHOEIRINHA',20),(2824,'CAETES',20),(2825,'CALCADO',20),(2826,'CALUMBI',20),(2827,'CAMARAGIBE',20),(2828,'CAMOCIM DE SAO FELIX',20),(2829,'CAMUTANGA',20),(2830,'CANHOTINHO',20),(2831,'CAPOEIRAS',20),(2832,'CARNAIBA',20),(2833,'CARNAUBEIRAS DA PENHA',20),(2834,'CARPINA',20),(2835,'CARUARU',20),(2836,'CASINHAS',20),(2837,'CATENDE',20),(2838,'CEDRO',20),(2839,'CHA DE ALEGRIA',20),(2840,'CHA GRANDE',20),(2841,'CONDADO',20),(2842,'CORRENTES',20),(2843,'CORTES',20),(2844,'CUMARU',20),(2845,'CUPIRA',20),(2846,'CUSTODIA',20),(2847,'DORMENTES',20),(2848,'ESCADA',20),(2849,'EXU',20),(2850,'FEIRA NOVA',20),(2851,'FERREIROS',20),(2852,'FLORES',20),(2853,'FLORESTA',20),(2854,'FREI MIGUELINHO',20),(2855,'GAMELEIRA',20),(2856,'GARANHUNS',20),(2857,'GLORIA DO GOITA',20),(2858,'GOIANA',20),(2859,'GRANITO',20),(2860,'GRAVATA',20),(2861,'IATI',20),(2862,'IBIMIRIM',20),(2863,'IBIRAJUBA',20),(2864,'IGARASSU',20),(2865,'IGUARACI',20),(2866,'ILHA DE ITAMARACA',20),(2867,'INAJA',20),(2868,'INGAZEIRA',20),(2869,'IPOJUCA',20),(2870,'IPUBI',20),(2871,'ITACURUBA',20),(2872,'ITAIBA',20),(2873,'ITAMBE',20),(2874,'ITAPETIM',20),(2875,'ITAPISSUMA',20),(2876,'ITAQUITINGA',20),(2877,'JABOATAO DOS GUARARAPES',20),(2878,'JAQUEIRA',20),(2879,'JATAUBA',20),(2880,'JATOBA',20),(2881,'JOAO ALFREDO',20),(2882,'JOAQUIM NABUCO',20),(2883,'JUCATI',20),(2884,'JUPI',20),(2885,'JUREMA',20),(2886,'LAGOA DO CARRO',20),(2887,'LAGOA DO ITAENGA',20),(2888,'LAGOA DO OURO',20),(2889,'LAGOA DOS GATOS',20),(2890,'LAGOA GRANDE',20),(2891,'LAJEDO',20),(2892,'LIMOEIRO',20),(2893,'MACAPARANA',20),(2894,'MACHADOS',20),(2895,'MANARI',20),(2896,'MARAIAL',20),(2897,'MIRANDIBA',20),(2898,'MOREILANDIA',20),(2899,'MORENO',20),(2900,'NAZARE DA MATA',20),(2901,'OLINDA',20),(2902,'OROBO',20),(2903,'OROCO',20),(2904,'OURICURI',20),(2905,'PALMARES',20),(2906,'PALMEIRINA',20),(2907,'PANELAS',20),(2908,'PARANATAMA',20),(2909,'PARNAMIRIM',20),(2910,'PASSIRA',20),(2911,'PAUDALHO',20),(2912,'PAULISTA',20),(2913,'PEDRA',20),(2914,'PESQUEIRA',20),(2915,'PETROLANDIA',20),(2916,'PETROLINA',20),(2917,'POCAO',20),(2918,'POMBOS',20),(2919,'PRIMAVERA',20),(2920,'QUIPAPA',20),(2921,'QUIXABA',20),(2922,'RIACHO DAS ALMAS',20),(2923,'RIBEIRAO',20),(2924,'RIO FORMOSO',20),(2925,'SAIRE',20),(2926,'SALGADINHO',20),(2927,'SALGUEIRO',20),(2928,'SALOA',20),(2929,'SANHARO',20),(2930,'SANTA CRUZ',20),(2931,'SANTA CRUZ DA BAIXA VERDE',20),(2932,'SANTA CRUZ DO CAPIBARIBE',20),(2933,'SANTA FILOMENA',20),(2934,'SANTA MARIA DA BOA VISTA',20),(2935,'SANTA MARIA DO CAMBUCA',20),(2936,'SANTA TEREZINHA',20),(2937,'SAO BENEDITO DO SUL',20),(2938,'SAO BENTO DO UNA',20),(2939,'SAO CAITANO',20),(2940,'SAO JOAO',20),(2941,'SAO JOAQUIM DO MONTE',20),(2942,'SAO JOSE DA COROA GRANDE',20),(2943,'SAO JOSE DO BELMONTE',20),(2944,'SAO JOSE DO EGITO',20),(2945,'SAO LOURENCO DA MATA',20),(2946,'SAO VICENTE FERRER',20),(2947,'SERRA TALHADA',20),(2948,'SERRITA',20),(2949,'SERTANIA',20),(2950,'SIRINHAEM',20),(2951,'SOLIDAO',20),(2952,'SURUBIM',20),(2953,'TABIRA',20),(2954,'TACAIMBO',20),(2955,'TACARATU',20),(2956,'TAMANDARE',20),(2957,'TAQUARITINGA DO NORTE',20),(2958,'TEREZINHA',20),(2959,'TERRA NOVA',20),(2960,'TIMBAUBA',20),(2961,'TORITAMA',20),(2962,'TRACUNHAEM',20),(2963,'TRINDADE',20),(2964,'TRIUNFO',20),(2965,'TUPANATINGA',20),(2966,'TUPARETAMA',20),(2967,'VENTUROSA',20),(2968,'VERDEJANTE',20),(2969,'VERTENTE DO LERIO',20),(2970,'VERTENTES',20),(2971,'VICENCIA',20),(2972,'VITORIA DE SANTO ANTAO',20),(2973,'XEXEU',20),(2974,'ACAUA',21),(2975,'AGRICOLANDIA',21),(2976,'AGUA BRANCA',21),(2977,'ALAGOINHA DO PIAUI',21),(2978,'ALEGRETE DO PIAUI',21),(2979,'ALTO LONGA',21),(2980,'ALTOS',21),(2981,'ALVORADA DO GURGUEIA',21),(2982,'AMARANTE',21),(2983,'ANGICAL DO PIAUI',21),(2984,'ANISIO DE ABREU',21),(2985,'ANTONIO ALMEIDA',21),(2986,'AROAZES',21),(2987,'AROEIRAS DO ITAIM',21),(2988,'ARRAIAL',21),(2989,'ASSUNCAO DO PIAUI',21),(2990,'AVELINO LOPES',21),(2991,'BAIXA GRANDE DO RIBEIRO',21),(2992,'BARRA DALCANTARA',21),(2993,'BARRAS',21),(2994,'BARREIRAS DO PIAUI',21),(2995,'BARRO DURO',21),(2996,'BATALHA',21),(2997,'BELA VISTA DO PIAUI',21),(2998,'BELEM DO PIAUI',21),(2999,'BENEDITINOS',21),(3000,'BERTOLINIA',21),(3001,'BETANIA DO PIAUI',21),(3002,'BOA HORA',21),(3003,'BOCAINA',21),(3004,'BOM JESUS',21),(3005,'BOM PRINCIPIO DO PIAUI',21),(3006,'BONFIM DO PIAUI',21),(3007,'BOQUEIRAO DO PIAUI',21),(3008,'BRASILEIRA',21),(3009,'BREJO DO PIAUI',21),(3010,'BURITI DOS LOPES',21),(3011,'BURITI DOS MONTES',21),(3012,'CABECEIRAS DO PIAUI',21),(3013,'CAJAZEIRAS DO PIAUI',21),(3014,'CAJUEIRO DA PRAIA',21),(3015,'CALDEIRAO GRANDE DO PIAUI',21),(3016,'CAMPINAS DO PIAUI',21),(3017,'CAMPO ALEGRE DO FIDALGO',21),(3018,'CAMPO GRANDE DO PIAUI',21),(3019,'CAMPO LARGO DO PIAUI',21),(3020,'CAMPO MAIOR',21),(3021,'CANAVIEIRA',21),(3022,'CANTO DO BURITI',21),(3023,'CAPITAO DE CAMPOS',21),(3024,'CAPITAO GERVASIO OLIVEIRA',21),(3025,'CARACOL',21),(3026,'CARAUBAS DO PIAUI',21),(3027,'CARIDADE DO PIAUI',21),(3028,'CASTELO DO PIAUI',21),(3029,'CAXINGO',21),(3030,'COCAL',21),(3031,'COCAL DE TELHA',21),(3032,'COCAL DOS ALVES',21),(3033,'COIVARAS',21),(3034,'COLONIA DO GURGUEIA',21),(3035,'COLONIA DO PIAUI',21),(3036,'CONCEICAO DO CANINDE',21),(3037,'CORONEL JOSE DIAS',21),(3038,'CORRENTE',21),(3039,'CRISTALANDIA DO PIAUI',21),(3040,'CRISTINO CASTRO',21),(3041,'CURIMATA',21),(3042,'CURRAIS',21),(3043,'CURRAL NOVO DO PIAUI',21),(3044,'CURRALINHOS',21),(3045,'DEMERVAL LOBAO',21),(3046,'DIRCEU ARCOVERDE',21),(3047,'DOM EXPEDITO LOPES',21),(3048,'DOM INOCENCIO',21),(3049,'DOMINGOS MOURAO',21),(3050,'ELESBAO VELOSO',21),(3051,'ELISEU MARTINS',21),(3052,'ESPERANTINA',21),(3053,'FARTURA DO PIAUI',21),(3054,'FLORES DO PIAUI',21),(3055,'FLORESTA DO PIAUI',21),(3056,'FLORIANO',21),(3057,'FRANCINOPOLIS',21),(3058,'FRANCISCO AYRES',21),(3059,'FRANCISCO MACEDO',21),(3060,'FRANCISCO SANTOS',21),(3061,'FRONTEIRAS',21),(3062,'GEMINIANO',21),(3063,'GILBUES',21),(3064,'GUADALUPE',21),(3065,'GUARIBAS',21),(3066,'HUGO NAPOLEAO',21),(3067,'ILHA GRANDE',21),(3068,'INHUMA',21),(3069,'IPIRANGA DO PIAUI',21),(3070,'ISAIAS COELHO',21),(3071,'ITAINOPOLIS',21),(3072,'ITAUEIRA',21),(3073,'JACOBINA DO PIAUI',21),(3074,'JAICOS',21),(3075,'JARDIM DO MULATO',21),(3076,'JATOBA DO PIAUI',21),(3077,'JERUMENHA',21),(3078,'JOAO COSTA',21),(3079,'JOAQUIM PIRES',21),(3080,'JOCA MARQUES',21),(3081,'JOSE DE FREITAS',21),(3082,'JUAZEIRO DO PIAUI',21),(3083,'JULIO BORGES',21),(3084,'JUREMA',21),(3085,'LAGOA ALEGRE',21),(3086,'LAGOA DE SAO FRANCISCO',21),(3087,'LAGOA DO BARRO DO PIAUI',21),(3088,'LAGOA DO PIAUI',21),(3089,'LAGOA DO SITIO',21),(3090,'LAGOINHA DO PIAUI',21),(3091,'LANDRI SALES',21),(3092,'LUIS CORREIA',21),(3093,'LUZILANDIA',21),(3094,'MADEIRO',21),(3095,'MANOEL EMIDIO',21),(3096,'MARCOLANDIA',21),(3097,'MARCOS PARENTE',21),(3098,'MASSAPE DO PIAUI',21),(3099,'MATIAS OLIMPIO',21),(3100,'MIGUEL ALVES',21),(3101,'MIGUEL LEAO',21),(3102,'MILTON BRANDAO',21),(3103,'MONSENHOR GIL',21),(3104,'MONSENHOR HIPOLITO',21),(3105,'MONTE ALEGRE DO PIAUI',21),(3106,'MORRO CABECA NO TEMPO',21),(3107,'MORRO DO CHAPEU DO PIAUI',21),(3108,'MURICI DOS PORTELAS',21),(3109,'NAZARE DO PIAUI',21),(3110,'NOSSA SENHORA DE NAZARE',21),(3111,'NOSSA SENHORA DOS REMEDIOS',21),(3112,'NOVA SANTA RITA',21),(3113,'NOVO ORIENTE DO PIAUI',21),(3114,'NOVO SANTO ANTONIO',21),(3115,'OEIRAS',21),(3116,'OLHO DAGUA DO PIAUI',21),(3117,'PADRE MARCOS',21),(3118,'PAES LANDIM',21),(3119,'PAJEU DO PIAUI',21),(3120,'PALMEIRA DO PIAUI',21),(3121,'PALMEIRAIS',21),(3122,'PAQUETA',21),(3123,'PARNAGUA',21),(3124,'PARNAIBA',21),(3125,'PASSAGEM FRANCA DO PIAUI',21),(3126,'PATOS DO PIAUI',21),(3127,'PAU DARCO DO PIAUI',21),(3128,'PAULISTANA',21),(3129,'PAVUSSU',21),(3130,'PEDRO II',21),(3131,'PEDRO LAURENTINO',21),(3132,'PICOS',21),(3133,'PIMENTEIRAS',21),(3134,'PIO IX',21),(3135,'PIRACURUCA',21),(3136,'PIRIPIRI',21),(3137,'PORTO',21),(3138,'PORTO ALEGRE DO PIAUI',21),(3139,'PRATA DO PIAUI',21),(3140,'QUEIMADA NOVA',21),(3141,'REDENCAO DO GURGUEIA',21),(3142,'REGENERACAO',21),(3143,'RIACHO FRIO',21),(3144,'RIBEIRA DO PIAUI',21),(3145,'RIBEIRO GONCALVES',21),(3146,'RIO GRANDE DO PIAUI',21),(3147,'SANTA CRUZ DO PIAUI',21),(3148,'SANTA CRUZ DOS MILAGRES',21),(3149,'SANTA FILOMENA',21),(3150,'SANTA LUZ',21),(3151,'SANTA ROSA DO PIAUI',21),(3152,'SANTANA DO PIAUI',21),(3153,'SANTO ANTONIO DE LISBOA',21),(3154,'SANTO ANTONIO DOS MILAGRES',21),(3155,'SANTO INACIO DO PIAUI',21),(3156,'SAO BRAZ DO PIAUI',21),(3157,'SAO FELIX DO PIAUI',21),(3158,'SAO FRANCISCO DE ASSIS DO PIAUI',21),(3159,'SAO FRANCISCO DO PIAUI',21),(3160,'SAO GONCALO DO GURGUEIA',21),(3161,'SAO GONCALO DO PIAUI',21),(3162,'SAO JOAO DA CANABRAVA',21),(3163,'SAO JOAO DA FRONTEIRA',21),(3164,'SAO JOAO DA SERRA',21),(3165,'SAO JOAO DA VARJOTA',21),(3166,'SAO JOAO DO ARRAIAL',21),(3167,'SAO JOAO DO PIAUI',21),(3168,'SAO JOSE DO DIVINO',21),(3169,'SAO JOSE DO PEIXE',21),(3170,'SAO JOSE DO PIAUI',21),(3171,'SAO JULIAO',21),(3172,'SAO LOURENCO DO PIAUI',21),(3173,'SAO LUIS DO PIAUI',21),(3174,'SAO MIGUEL DA BAIXA GRANDE',21),(3175,'SAO MIGUEL DO FIDALGO',21),(3176,'SAO MIGUEL DO TAPUIO',21),(3177,'SAO PEDRO DO PIAUI',21),(3178,'SAO RAIMUNDO NONATO',21),(3179,'SEBASTIAO BARROS',21),(3180,'SEBASTIAO LEAL',21),(3181,'SIGEFREDO PACHECO',21),(3182,'SIMOES',21),(3183,'SIMPLICIO MENDES',21),(3184,'SOCORRO DO PIAUI',21),(3185,'SUSSUAPARA',21),(3186,'TAMBORIL DO PIAUI',21),(3187,'TANQUE DO PIAUI',21),(3188,'TERESINA',21),(3189,'UNIAO',21),(3190,'URUCUI',21),(3191,'VALENCA DO PIAUI',21),(3192,'VARZEA BRANCA',21),(3193,'VARZEA GRANDE',21),(3194,'VERA MENDES',21),(3195,'VILA NOVA DO PIAUI',21),(3196,'WALL FERRAZ',21),(3197,'ABATIA',19),(3198,'ADRIANOPOLIS',19),(3199,'AGUDOS DO SUL',19),(3200,'ALMIRANTE TAMANDARE',19),(3201,'ALTAMIRA DO PARANA',19),(3202,'ALTO PARANA',19),(3203,'ALTO PIQUIRI',19),(3204,'ALTONIA',19),(3205,'ALVORADA DO SUL',19),(3206,'AMAPORA',19),(3207,'AMPERE',19),(3208,'ANAHY',19),(3209,'ANDIRA',19),(3210,'ANGULO',19),(3211,'ANTONINA',19),(3212,'ANTONIO OLINTO',19),(3213,'APUCARANA',19),(3214,'ARAPONGAS',19),(3215,'ARAPOTI',19),(3216,'ARAPUA',19),(3217,'ARARUNA',19),(3218,'ARAUCARIA',19),(3219,'ARIRANHA DO IVAI',19),(3220,'ASSAI',19),(3221,'ASSIS CHATEAUBRIAND',19),(3222,'ASTORGA',19),(3223,'ATALAIA',19),(3224,'BALSA NOVA',19),(3225,'BANDEIRANTES',19),(3226,'BARBOSA FERRAZ',19),(3227,'BARRA DO JACARE',19),(3228,'BARRACAO',19),(3229,'BELA VISTA DO CAROBA',19),(3230,'BELA VISTA DO PARAISO',19),(3231,'BITURUNA',19),(3232,'BOA ESPERANCA',19),(3233,'BOA ESPERANCA DO IGUACU',19),(3234,'BOA VENTURA DE SAO ROQUE',19),(3235,'BOA VISTA DA APARECIDA',19),(3236,'BOCAIUVA DO SUL',19),(3237,'BOM JESUS DO SUL',19),(3238,'BOM SUCESSO',19),(3239,'BOM SUCESSO DO SUL',19),(3240,'BORRAZOPOLIS',19),(3241,'BRAGANEY',19),(3242,'BRASILANDIA DO SUL',19),(3243,'CAFEARA',19),(3244,'CAFELANDIA',19),(3245,'CAFEZAL DO SUL',19),(3246,'CALIFORNIA',19),(3247,'CAMBARA',19),(3248,'CAMBE',19),(3249,'CAMBIRA',19),(3250,'CAMPINA DA LAGOA',19),(3251,'CAMPINA DO SIMAO',19),(3252,'CAMPINA GRANDE DO SUL',19),(3253,'CAMPO BONITO',19),(3254,'CAMPO DO TENENTE',19),(3255,'CAMPO LARGO',19),(3256,'CAMPO MAGRO',19),(3257,'CAMPO MOURAO',19),(3258,'CANDIDO DE ABREU',19),(3259,'CANDOI',19),(3260,'CANTAGALO',19),(3261,'CAPANEMA',19),(3262,'CAPITAO LEONIDAS MARQUES',19),(3263,'CARAMBEI',19),(3264,'CARLOPOLIS',19),(3265,'CASCAVEL',19),(3266,'CASTRO',19),(3267,'CATANDUVAS',19),(3268,'CENTENARIO DO SUL',19),(3269,'CERRO AZUL',19),(3270,'CEU AZUL',19),(3271,'CHOPINZINHO',19),(3272,'CIANORTE',19),(3273,'CIDADE GAUCHA',19),(3274,'CLEVELANDIA',19),(3275,'COLOMBO',19),(3276,'COLORADO',19),(3277,'CONGONHINHAS',19),(3278,'CONSELHEIRO MAIRINCK',19),(3279,'CONTENDA',19),(3280,'CORBELIA',19),(3281,'CORNELIO PROCOPIO',19),(3282,'CORONEL DOMINGOS SOARES',19),(3283,'CORONEL VIVIDA',19),(3284,'CORUMBATAI DO SUL',19),(3285,'CRUZ MACHADO',19),(3286,'CRUZEIRO DO IGUACU',19),(3287,'CRUZEIRO DO OESTE',19),(3288,'CRUZEIRO DO SUL',19),(3289,'CRUZMALTINA',19),(3290,'CURIUVA',19),(3291,'DIAMANTE DO NORTE',19),(3292,'DIAMANTE DO SUL',19),(3293,'DIAMANTE DOESTE',19),(3294,'DOIS VIZINHOS',19),(3295,'DOURADINA',19),(3296,'DOUTOR CAMARGO',19),(3297,'DOUTOR ULYSSES',19),(3298,'ENEAS MARQUES',19),(3299,'ENGENHEIRO BELTRAO',19),(3300,'ENTRE RIOS DO OESTE',19),(3301,'ESPERANCA NOVA',19),(3302,'ESPIGAO ALTO DO IGUACU',19),(3303,'FAROL',19),(3304,'FAXINAL',19),(3305,'FAZENDA RIO GRANDE',19),(3306,'FENIX',19),(3307,'FERNANDES PINHEIRO',19),(3308,'FIGUEIRA',19),(3309,'FLOR DA SERRA DO SUL',19),(3310,'FLORAI',19),(3311,'FLORESTA',19),(3312,'FLORESTOPOLIS',19),(3313,'FLORIDA',19),(3314,'FORMOSA DO OESTE',19),(3315,'FOZ DO IGUACU',19),(3316,'FOZ DO JORDAO',19),(3317,'FRANCISCO ALVES',19),(3318,'FRANCISCO BELTRAO',19),(3319,'GENERAL CARNEIRO',19),(3320,'GODOY MOREIRA',19),(3321,'GOIOERE',19),(3322,'GOIOXIM',19),(3323,'GRANDES RIOS',19),(3324,'GUAIRA',19),(3325,'GUAIRACA',19),(3326,'GUAMIRANGA',19),(3327,'GUAPIRAMA',19),(3328,'GUAPOREMA',19),(3329,'GUARACI',19),(3330,'GUARANIACU',19),(3331,'GUARAPUAVA',19),(3332,'GUARAQUECABA',19),(3333,'GUARATUBA',19),(3334,'HONORIO SERPA',19),(3335,'IBAITI',19),(3336,'IBEMA',19),(3337,'IBIPORA',19),(3338,'ICARAIMA',19),(3339,'IGUARACU',19),(3340,'IGUATU',19),(3341,'IMBAU',19),(3342,'IMBITUVA',19),(3343,'INACIO MARTINS',19),(3344,'INAJA',19),(3345,'INDIANOPOLIS',19),(3346,'IPIRANGA',19),(3347,'IPORA',19),(3348,'IRACEMA DO OESTE',19),(3349,'IRATI',19),(3350,'IRETAMA',19),(3351,'ITAGUAJE',19),(3352,'ITAIPULANDIA',19),(3353,'ITAMBARACA',19),(3354,'ITAMBE',19),(3355,'ITAPEJARA DOESTE',19),(3356,'ITAPERUCU',19),(3357,'ITAUNA DO SUL',19),(3358,'IVAI',19),(3359,'IVAIPORA',19),(3360,'IVATE',19),(3361,'IVATUBA',19),(3362,'JABOTI',19),(3363,'JACAREZINHO',19),(3364,'JAGUAPITA',19),(3365,'JAGUARIAIVA',19),(3366,'JANDAIA DO SUL',19),(3367,'JANIOPOLIS',19),(3368,'JAPIRA',19),(3369,'JAPURA',19),(3370,'JARDIM ALEGRE',19),(3371,'JARDIM OLINDA',19),(3372,'JATAIZINHO',19),(3373,'JESUITAS',19),(3374,'JOAQUIM TAVORA',19),(3375,'JUNDIAI DO SUL',19),(3376,'JURANDA',19),(3377,'JUSSARA',19),(3378,'KALORE',19),(3379,'LAPA',19),(3380,'LARANJAL',19),(3381,'LARANJEIRAS DO SUL',19),(3382,'LEOPOLIS',19),(3383,'LIDIANOPOLIS',19),(3384,'LINDOESTE',19),(3385,'LOANDA',19),(3386,'LOBATO',19),(3387,'LONDRINA',19),(3388,'LUIZIANA',19),(3389,'LUNARDELLI',19),(3390,'LUPIONOPOLIS',19),(3391,'MALLET',19),(3392,'MAMBORE',19),(3393,'MANDAGUACU',19),(3394,'MANDAGUARI',19),(3395,'MANDIRITUBA',19),(3396,'MANFRINOPOLIS',19),(3397,'MANGUEIRINHA',19),(3398,'MANOEL RIBAS',19),(3399,'MARECHAL CANDIDO RONDON',19),(3400,'MARIA HELENA',19),(3401,'MARIALVA',19),(3402,'MARILANDIA DO SUL',19),(3403,'MARILENA',19),(3404,'MARILUZ',19),(3405,'MARINGA',19),(3406,'MARIOPOLIS',19),(3407,'MARIPA',19),(3408,'MARMELEIRO',19),(3409,'MARQUINHO',19),(3410,'MARUMBI',19),(3411,'MATELANDIA',19),(3412,'MATINHOS',19),(3413,'MATO RICO',19),(3414,'MAUA DA SERRA',19),(3415,'MEDIANEIRA',19),(3416,'MERCEDES',19),(3417,'MIRADOR',19),(3418,'MIRASELVA',19),(3419,'MISSAL',19),(3420,'MOREIRA SALES',19),(3421,'MORRETES',19),(3422,'MUNHOZ DE MELO',19),(3423,'NOSSA SENHORA DAS GRACAS',19),(3424,'NOVA ALIANCA DO IVAI',19),(3425,'NOVA AMERICA DA COLINA',19),(3426,'NOVA AURORA',19),(3427,'NOVA CANTU',19),(3428,'NOVA ESPERANCA',19),(3429,'NOVA ESPERANCA DO SUDOESTE',19),(3430,'NOVA FATIMA',19),(3431,'NOVA LARANJEIRAS',19),(3432,'NOVA LONDRINA',19),(3433,'NOVA OLIMPIA',19),(3434,'NOVA PRATA DO IGUACU',19),(3435,'NOVA SANTA BARBARA',19),(3436,'NOVA SANTA ROSA',19),(3437,'NOVA TEBAS',19),(3438,'NOVO ITACOLOMI',19),(3439,'ORTIGUEIRA',19),(3440,'OURIZONA',19),(3441,'OURO VERDE DO OESTE',19),(3442,'PAICANDU',19),(3443,'PALMAS',19),(3444,'PALMEIRA',19),(3445,'PALMITAL',19),(3446,'PALOTINA',19),(3447,'PARAISO DO NORTE',19),(3448,'PARANACITY',19),(3449,'PARANAGUA',19),(3450,'PARANAPOEMA',19),(3451,'PARANAVAI',19),(3452,'PATO BRAGADO',19),(3453,'PATO BRANCO',19),(3454,'PAULA FREITAS',19),(3455,'PAULO FRONTIN',19),(3456,'PEABIRU',19),(3457,'PEROBAL',19),(3458,'PEROLA',19),(3459,'PEROLA DOESTE',19),(3460,'PIEN',19),(3461,'PINHAIS',19),(3462,'PINHAL DE SAO BENTO',19),(3463,'PINHALAO',19),(3464,'PINHAO',19),(3465,'PIRAI DO SUL',19),(3466,'PIRAQUARA',19),(3467,'PITANGA',19),(3468,'PITANGUEIRAS',19),(3469,'PLANALTINA DO PARANA',19),(3470,'PLANALTO',19),(3471,'PONTA GROSSA',19),(3472,'PONTAL DO PARANA',19),(3473,'PORECATU',19),(3474,'PORTO AMAZONAS',19),(3475,'PORTO BARREIRO',19),(3476,'PORTO RICO',19),(3477,'PORTO VITORIA',19),(3478,'PRADO FERREIRA',19),(3479,'PRANCHITA',19),(3480,'PRESIDENTE CASTELO BRANCO',19),(3481,'PRIMEIRO DE MAIO',19),(3482,'PRUDENTOPOLIS',19),(3483,'QUARTO CENTENARIO',19),(3484,'QUATIGUA',19),(3485,'QUATRO BARRAS',19),(3486,'QUATRO PONTES',19),(3487,'QUEDAS DO IGUACU',19),(3488,'QUERENCIA DO NORTE',19),(3489,'QUINTA DO SOL',19),(3490,'QUITANDINHA',19),(3491,'RAMILANDIA',19),(3492,'RANCHO ALEGRE',19),(3493,'RANCHO ALEGRE D OESTE',19),(3494,'REALEZA',19),(3495,'REBOUCAS',19),(3496,'RENASCENCA',19),(3497,'RESERVA',19),(3498,'RESERVA DO IGUACU',19),(3499,'RIBEIRAO CLARO',19),(3500,'RIBEIRAO DO PINHAL',19),(3501,'RIO AZUL',19),(3502,'RIO BOM',19),(3503,'RIO BONITO DO IGUACU',19),(3504,'RIO BRANCO DO IVAI',19),(3505,'RIO BRANCO DO SUL',19),(3506,'RIO NEGRO',19),(3507,'ROLANDIA',19),(3508,'RONCADOR',19),(3509,'RONDON',19),(3510,'ROSARIO DO IVAI',19),(3511,'SABAUDIA',19),(3512,'SALGADO FILHO',19),(3513,'SALTO DO ITARARE',19),(3514,'SALTO DO LONTRA',19),(3515,'SANTA AMELIA',19),(3516,'SANTA CECILIA DO PAVAO',19),(3517,'SANTA CRUZ DO MONTE CASTELO',19),(3518,'SANTA FE',19),(3519,'SANTA HELENA',19),(3520,'SANTA INES',19),(3521,'SANTA ISABEL DO IVAI',19),(3522,'SANTA IZABEL DO OESTE',19),(3523,'SANTA LUCIA',19),(3524,'SANTA MARIA DO OESTE',19),(3525,'SANTA MARIANA',19),(3526,'SANTA MONICA',19),(3527,'SANTA TEREZA DO OESTE',19),(3528,'SANTA TEREZINHA DE ITAIPU',19),(3529,'SANTANA DO ITARARE',19),(3530,'SANTO ANTONIO DA PLATINA',19),(3531,'SANTO ANTONIO DO CAIUA',19),(3532,'SANTO ANTONIO DO PARAISO',19),(3533,'SANTO ANTONIO DO SUDOESTE',19),(3534,'SANTO INACIO',19),(3535,'SAO CARLOS DO IVAI',19),(3536,'SAO JERONIMO DA SERRA',19),(3537,'SAO JOAO',19),(3538,'SAO JOAO DO CAIUA',19),(3539,'SAO JOAO DO IVAI',19),(3540,'SAO JOAO DO TRIUNFO',19),(3541,'SAO JORGE DO IVAI',19),(3542,'SAO JORGE DO PATROCINIO',19),(3543,'SAO JORGE DOESTE',19),(3544,'SAO JOSE DA BOA VISTA',19),(3545,'SAO JOSE DAS PALMEIRAS',19),(3546,'SAO JOSE DOS PINHAIS',19),(3547,'SAO MANOEL DO PARANA',19),(3548,'SAO MATEUS DO SUL',19),(3549,'SAO MIGUEL DO IGUACU',19),(3550,'SAO PEDRO DO IGUACU',19),(3551,'SAO PEDRO DO IVAI',19),(3552,'SAO PEDRO DO PARANA',19),(3553,'SAO SEBASTIAO DA AMOREIRA',19),(3554,'SAO TOME',19),(3555,'SAPOPEMA',19),(3556,'SARANDI',19),(3557,'SAUDADE DO IGUACU',19),(3558,'SENGES',19),(3559,'SERRANOPOLIS DO IGUACU',19),(3560,'SERTANEJA',19),(3561,'SERTANOPOLIS',19),(3562,'SIQUEIRA CAMPOS',19),(3563,'SULINA',19),(3564,'TAMARANA',19),(3565,'TAMBOARA',19),(3566,'TAPEJARA',19),(3567,'TAPIRA',19),(3568,'TEIXEIRA SOARES',19),(3569,'TELEMACO BORBA',19),(3570,'TERRA BOA',19),(3571,'TERRA RICA',19),(3572,'TERRA ROXA',19),(3573,'TIBAGI',19),(3574,'TIJUCAS DO SUL',19),(3575,'TOLEDO',19),(3576,'TOMAZINA',19),(3577,'TRES BARRAS DO PARANA',19),(3578,'TUNAS DO PARAN√Å',19),(3579,'TUNEIRAS DO OESTE',19),(3580,'TUPASSI',19),(3581,'TURVO',19),(3582,'UBIRATA',19),(3583,'UMUARAMA',19),(3584,'UNIAO DA VITORIA',19),(3585,'UNIFLOR',19),(3586,'URAI',19),(3587,'VENTANIA',19),(3588,'VERA CRUZ DO OESTE',19),(3589,'VERE',19),(3590,'VILA ALTA',19),(3591,'VIRMOND',19),(3592,'VITORINO',19),(3593,'WENCESLAU BRAZ',19),(3594,'XAMBRE',19),(3595,'ANGRA DOS REIS',2),(3596,'APERIBE',2),(3597,'ARARUAMA',2),(3598,'AREAL',2),(3599,'ARMACAO DE BUZIOS',2),(3600,'ARRAIAL DO CABO',2),(3601,'BARRA DO PIRAI',2),(3602,'BARRA MANSA',2),(3603,'BELFORD ROXO',2),(3604,'BOM JARDIM',2),(3605,'BOM JESUS DO ITABAPOANA',2),(3606,'CABO FRIO',2),(3607,'CACHOEIRAS DE MACACU',2),(3608,'CAMBUCI',2),(3609,'CAMPOS DOS GOYTACAZES',2),(3610,'CANTAGALO',2),(3611,'CARAPEBUS',2),(3612,'CARDOSO MOREIRA',2),(3613,'CARMO',2),(3614,'CASIMIRO DE ABREU',2),(3615,'COMENDADOR LEVY GASPARIAN',2),(3616,'CONCEICAO DE MACABU',2),(3617,'CORDEIRO',2),(3618,'DUAS BARRAS',2),(3619,'DUQUE DE CAXIAS',2),(3620,'ENGENHEIRO PAULO DE FRONTIN',2),(3621,'GUAPIMIRIM',2),(3622,'IGUABA GRANDE',2),(3623,'ITABORAI',2),(3624,'ITAGUAI',2),(3625,'ITALVA',2),(3626,'ITAOCARA',2),(3627,'ITAPERUNA',2),(3628,'ITATIAIA',2),(3629,'JAPERI',2),(3630,'LAJE DO MURIAE',2),(3631,'MACAE',2),(3632,'MACUCO',2),(3633,'MAGE',2),(3634,'MANGARATIBA',2),(3635,'MARICA',2),(3636,'MENDES',2),(3637,'MESQUITA',2),(3638,'MIGUEL PEREIRA',2),(3639,'MIRACEMA',2),(3640,'NATIVIDADE',2),(3641,'NILOPOLIS',2),(3642,'NITEROI',2),(3643,'NOVA FRIBURGO',2),(3644,'NOVA IGUACU',2),(3645,'PARACAMBI',2),(3646,'PARAIBA DO SUL',2),(3647,'PARATI',2),(3648,'PATY DO ALFERES',2),(3649,'PETROPOLIS',2),(3650,'PINHEIRAL',2),(3651,'PIRAI',2),(3652,'PORCIUNCULA',2),(3653,'PORTO REAL',2),(3654,'QUATIS',2),(3655,'QUEIMADOS',2),(3656,'QUISSAMA',2),(3657,'RESENDE',2),(3658,'RIO BONITO',2),(3659,'RIO CLARO',2),(3660,'RIO DAS FLORES',2),(3661,'RIO DAS OSTRAS',2),(3662,'SANTA MARIA MADALENA',2),(3663,'SANTO ANTONIO DE PADUA',2),(3664,'SAO FIDELIS',2),(3665,'SAO FRANCISCO DE ITABAPOANA',2),(3666,'SAO GONCALO',2),(3667,'SAO JOAO DA BARRA',2),(3668,'SAO JOAO DE MERITI',2),(3669,'SAO JOSE DE UBA',2),(3670,'SAO JOSE DO VALE DO RIO PRETO',2),(3671,'SAO PEDRO DA ALDEIA',2),(3672,'SAO SEBASTIAO DO ALTO',2),(3673,'SAPUCAIA',2),(3674,'SAQUAREMA',2),(3675,'SEROPEDICA',2),(3676,'SILVA JARDIM',2),(3677,'SUMIDOURO',2),(3678,'TANGUA',2),(3679,'TERESOPOLIS',2),(3680,'TRAJANO DE MORAIS',2),(3681,'TRES RIOS',2),(3682,'VALENCA',2),(3683,'VARRE E SAI',2),(3684,'VASSOURAS',2),(3685,'VOLTA REDONDA',2),(3686,'ACARI',22),(3687,'ACU',22),(3688,'AFONSO BEZERRA',22),(3689,'AGUA NOVA',22),(3690,'ALEXANDRIA',22),(3691,'ALMINO AFONSO',22),(3692,'ALTO DO RODRIGUES',22),(3693,'ANGICOS',22),(3694,'ANTONIO MARTINS',22),(3695,'APODI',22),(3696,'AREIA BRANCA',22),(3697,'ARES',22),(3698,'AUGUSTO SEVERO',22),(3699,'BAIA FORMOSA',22),(3700,'BARAUNA',22),(3701,'BARCELONA',22),(3702,'BENTO FERNANDES',22),(3703,'BODO',22),(3704,'BOM JESUS',22),(3705,'BREJINHO',22),(3706,'CAICARA DO NORTE',22),(3707,'CAICARA DO RIO DO VENTO',22),(3708,'CAICO',22),(3709,'CAMPO REDONDO',22),(3710,'CANGUARETAMA',22),(3711,'CARAUBAS',22),(3712,'CARNAUBA DOS DANTAS',22),(3713,'CARNAUBAIS',22),(3714,'CEARA-MIRIM',22),(3715,'CERRO CORA',22),(3716,'CORONEL EZEQUIEL',22),(3717,'CORONEL JOAO PESSOA',22),(3718,'CRUZETA',22),(3719,'CURRAIS NOVOS',22),(3720,'DOUTOR SEVERIANO',22),(3721,'ENCANTO',22),(3722,'EQUADOR',22),(3723,'ESPIRITO SANTO',22),(3724,'EXTREMOZ',22),(3725,'FELIPE GUERRA',22),(3726,'FERNANDO PEDROZA',22),(3727,'FLORANIA',22),(3728,'FRANCISCO DANTAS',22),(3729,'FRUTUOSO GOMES',22),(3730,'GALINHOS',22),(3731,'GOIANINHA',22),(3732,'GOVERNADOR DIX-SEPT ROSADO',22),(3733,'GROSSOS',22),(3734,'GUAMARE',22),(3735,'IELMO MARINHO',22),(3736,'IPANGUACU',22),(3737,'IPUEIRA',22),(3738,'ITAJA',22),(3739,'ITAU',22),(3740,'JACANA',22),(3741,'JANDAIRA',22),(3742,'JANDUIS',22),(3743,'JANUARIO CICCO',22),(3744,'JAPI',22),(3745,'JARDIM DE ANGICOS',22),(3746,'JARDIM DE PIRANHAS',22),(3747,'JARDIM DO SERIDO',22),(3748,'JOAO CAMARA',22),(3749,'JOAO DIAS',22),(3750,'JOSE DA PENHA',22),(3751,'JUCURUTU',22),(3752,'JUNDIA',22),(3753,'LAGOA DANTA',22),(3754,'LAGOA DE PEDRAS',22),(3755,'LAGOA DE VELHOS',22),(3756,'LAGOA NOVA',22),(3757,'LAGOA SALGADA',22),(3758,'LAJES',22),(3759,'LAJES PINTADAS',22),(3760,'LUCRECIA',22),(3761,'LUIS GOMES',22),(3762,'MACAIBA',22),(3763,'MACAU',22),(3764,'MAJOR SALES',22),(3765,'MARCELINO VIEIRA',22),(3766,'MARTINS',22),(3767,'MAXARANGUAPE',22),(3768,'MESSIAS TARGINO',22),(3769,'MONTANHAS',22),(3770,'MONTE ALEGRE',22),(3771,'MONTE DAS GAMELEIRAS',22),(3772,'MOSSORO',22),(3773,'NISIA FLORESTA',22),(3774,'NOVA CRUZ',22),(3775,'OLHO DAGUA DO BORGES',22),(3776,'OURO BRANCO',22),(3777,'PARANA',22),(3778,'PARAU',22),(3779,'PARAZINHO',22),(3780,'PARELHAS',22),(3781,'PARNAMIRIM',22),(3782,'PASSA E FICA',22),(3783,'PASSAGEM',22),(3784,'PATU',22),(3785,'PAU DOS FERROS',22),(3786,'PEDRA GRANDE',22),(3787,'PEDRA PRETA',22),(3788,'PEDRO AVELINO',22),(3789,'PEDRO VELHO',22),(3790,'PENDENCIAS',22),(3791,'PILOES',22),(3792,'POCO BRANCO',22),(3793,'PORTALEGRE',22),(3794,'PORTO DO MANGUE',22),(3795,'PRESIDENTE JUSCELINO',22),(3796,'PUREZA',22),(3797,'RAFAEL FERNANDES',22),(3798,'RAFAEL GODEIRO',22),(3799,'RIACHO DA CRUZ',22),(3800,'RIACHO DE SANTANA',22),(3801,'RIACHUELO',22),(3802,'RIO DO FOGO',22),(3803,'RODOLFO FERNANDES',22),(3804,'RUY BARBOSA',22),(3805,'SANTA CRUZ',22),(3806,'SANTA MARIA',22),(3807,'SANTANA DO MATOS',22),(3808,'SANTANA DO SERIDO',22),(3809,'SANTO ANTONIO',22),(3810,'SAO BENTO DO NORTE',22),(3811,'SAO BENTO DO TRAIRI',22),(3812,'SAO FERNANDO',22),(3813,'SAO FRANCISCO DO OESTE',22),(3814,'SAO GONCALO DO AMARANTE',22),(3815,'SAO JOAO DO SABUGI',22),(3816,'SAO JOSE DE MIPIBU',22),(3817,'SAO JOSE DO CAMPESTRE',22),(3818,'SAO JOSE DO SERIDO',22),(3819,'SAO MIGUEL',22),(3820,'SAO MIGUEL DE TOUROS',22),(3821,'SAO PAULO DO POTENGI',22),(3822,'SAO PEDRO',22),(3823,'SAO RAFAEL',22),(3824,'SAO TOME',22),(3825,'SAO VICENTE',22),(3826,'SENADOR ELOI DE SOUZA',22),(3827,'SENADOR GEORGINO AVELINO',22),(3828,'SERRA DE SAO BENTO',22),(3829,'SERRA DO MEL',22),(3830,'SERRA NEGRA DO NORTE',22),(3831,'SERRINHA',22),(3832,'SERRINHA DOS PINTOS',22),(3833,'SEVERIANO MELO',22),(3834,'SITIO NOVO',22),(3835,'TABOLEIRO GRANDE',22),(3836,'TAIPU',22),(3837,'TANGARA',22),(3838,'TENENTE ANANIAS',22),(3839,'TENENTE LAURENTINO CRUZ',22),(3840,'TIBAU',22),(3841,'TIBAU DO SUL',22),(3842,'TIMBAUBA DOS BATISTAS',22),(3843,'TOUROS',22),(3844,'TRIUNFO POTIGUAR',22),(3845,'UMARIZAL',22),(3846,'UPANEMA',22),(3847,'VARZEA',22),(3848,'VENHA-VER',22),(3849,'VERA CRUZ',22),(3850,'VICOSA',22),(3851,'VILA FLOR',22),(3852,'ALTA FLORESTA DOESTE',24),(3853,'ALTO ALEGRE DOS PARECIS',24),(3854,'ALTO PARAISO',24),(3855,'ALVORADA DOESTE',24),(3856,'ARIQUEMES',24),(3857,'BURITIS',24),(3858,'CABIXI',24),(3859,'CACAULANDIA',24),(3860,'CACOAL',24),(3861,'CAMPO NOVO DE RONDONIA',24),(3862,'CANDEIAS DO JAMARI',24),(3863,'CASTANHEIRAS',24),(3864,'CEREJEIRAS',24),(3865,'CHUPINGUAIA',24),(3866,'COLORADO DO OESTE',24),(3867,'CORUMBIARA',24),(3868,'COSTA MARQUES',24),(3869,'CUJUBIM',24),(3870,'ESPIGAO DOESTE',24),(3871,'GOVERNADOR JORGE TEIXEIRA',24),(3872,'GUAJARA-MIRIM',24),(3873,'ITAPUA DO OESTE',24),(3874,'JARU',24),(3875,'JI-PARANA',24),(3876,'MACHADINHO DOESTE',24),(3877,'MINISTRO ANDREAZZA',24),(3878,'MIRANTE DA SERRA',24),(3879,'MONTE NEGRO',24),(3880,'NOVA BRASILANDIA DOESTE',24),(3881,'NOVA MAMORE',24),(3882,'NOVA UNIAO',24),(3883,'NOVO HORIZONTE DO OESTE',24),(3884,'OURO PRETO DO OESTE',24),(3885,'PARECIS',24),(3886,'PIMENTA BUENO',24),(3887,'PIMENTEIRAS DO OESTE',24),(3888,'PORTO VELHO',24),(3889,'PRESIDENTE MEDICI',24),(3890,'PRIMAVERA DE RONDONIA',24),(3891,'RIO CRESPO',24),(3892,'ROLIM DE MOURA',24),(3893,'SANTA LUZIA DOESTE',24),(3894,'SAO FELIPE DOESTE',24),(3895,'SAO FRANCISCO DO GUAPORE',24),(3896,'SAO MIGUEL DO GUAPORE',24),(3897,'SERINGUEIRAS',24),(3898,'TEIXEIROPOLIS',24),(3899,'THEOBROMA',24),(3900,'URUPA',24),(3901,'VALE DO ANARI',24),(3902,'VALE DO PARAISO',24),(3903,'VILHENA',24),(3904,'ALTO ALEGRE',25),(3905,'AMAJARI',25),(3906,'BOA VISTA',25),(3907,'BONFIM',25),(3908,'CANTA',25),(3909,'CARACARAI',25),(3910,'CAROEBE',25),(3911,'IRACEMA',25),(3912,'MUCAJAI',25),(3913,'NORMANDIA',25),(3914,'PACARAIMA',25),(3915,'RORAINOPOLIS',25),(3916,'SAO JOAO DA BALIZA',25),(3917,'SAO LUIZ',25),(3918,'UIRAMUTA',25),(3919,'ACEGUA',23),(3920,'AGUA SANTA',23),(3921,'AGUDO',23),(3922,'AJURICABA',23),(3923,'ALECRIM',23),(3924,'ALEGRETE',23),(3925,'ALEGRIA',23),(3926,'ALMIRANTE TAMANDARE DO SUL',23),(3927,'ALPESTRE',23),(3928,'ALTO ALEGRE',23),(3929,'ALTO FELIZ',23),(3930,'ALVORADA',23),(3931,'AMARAL FERRADOR',23),(3932,'AMETISTA DO SUL',23),(3933,'ANDRE DA ROCHA',23),(3934,'ANTA GORDA',23),(3935,'ANTONIO PRADO',23),(3936,'ARAMBARE',23),(3937,'ARARICA',23),(3938,'ARATIBA',23),(3939,'ARROIO DO MEIO',23),(3940,'ARROIO DO PADRE',23),(3941,'ARROIO DO SAL',23),(3942,'ARROIO DO TIGRE',23),(3943,'ARROIO DOS RATOS',23),(3944,'ARROIO GRANDE',23),(3945,'ARVOREZINHA',23),(3946,'AUGUSTO PESTANA',23),(3947,'AUREA',23),(3948,'BAGE',23),(3949,'BALNEARIO PINHAL',23),(3950,'BARAO',23),(3951,'BARAO DE COTEGIPE',23),(3952,'BARAO DO TRIUNFO',23),(3953,'BARRA DO GUARITA',23),(3954,'BARRA DO QUARAI',23),(3955,'BARRA DO RIBEIRO',23),(3956,'BARRA DO RIO AZUL',23),(3957,'BARRA FUNDA',23),(3958,'BARRACAO',23),(3959,'BARROS CASSAL',23),(3960,'BENJAMIN CONSTANT DO SUL',23),(3961,'BENTO GONCALVES',23),(3962,'BOA VISTA DAS MISSOES',23),(3963,'BOA VISTA DO BURICA',23),(3964,'BOA VISTA DO CADEADO',23),(3965,'BOA VISTA DO INCRA',23),(3966,'BOA VISTA DO SUL',23),(3967,'BOM JESUS',23),(3968,'BOM PRINCIPIO',23),(3969,'BOM PROGRESSO',23),(3970,'BOM RETIRO DO SUL',23),(3971,'BOQUEIRAO DO LEAO',23),(3972,'BOSSOROCA',23),(3973,'BOZANO',23),(3974,'BRAGA',23),(3975,'BROCHIER',23),(3976,'BUTIA',23),(3977,'CACAPAVA DO SUL',23),(3978,'CACEQUI',23),(3979,'CACHOEIRA DO SUL',23),(3980,'CACHOEIRINHA',23),(3981,'CACIQUE DOBLE',23),(3982,'CAIBATE',23),(3983,'CAICARA',23),(3984,'CAMAQUA',23),(3985,'CAMARGO',23),(3986,'CAMBARA DO SUL',23),(3987,'CAMPESTRE DA SERRA',23),(3988,'CAMPINA DAS MISSOES',23),(3989,'CAMPINAS DO SUL',23),(3990,'CAMPO BOM',23),(3991,'CAMPO NOVO',23),(3992,'CAMPOS BORGES',23),(3993,'CANDELARIA',23),(3994,'CANDIDO GODOI',23),(3995,'CANDIOTA',23),(3996,'CANELA',23),(3997,'CANGUCU',23),(3998,'CANOAS',23),(3999,'CANUDOS DO VALE',23),(4000,'CAPAO BONITO DO SUL',23),(4001,'CAPAO DA CANOA',23),(4002,'CAPAO DO CIPO',23),(4003,'CAPAO DO LEAO',23),(4004,'CAPELA DE SANTANA',23),(4005,'CAPITAO',23),(4006,'CAPIVARI DO SUL',23),(4007,'CARAA',23),(4008,'CARAZINHO',23),(4009,'CARLOS BARBOSA',23),(4010,'CARLOS GOMES',23),(4011,'CASCA',23),(4012,'CASEIROS',23),(4013,'CATUIPE',23),(4014,'CAXIAS DO SUL',23),(4015,'CENTENARIO',23),(4016,'CERRITO',23),(4017,'CERRO BRANCO',23),(4018,'CERRO GRANDE',23),(4019,'CERRO GRANDE DO SUL',23),(4020,'CERRO LARGO',23),(4021,'CHAPADA',23),(4022,'CHARQUEADAS',23),(4023,'CHARRUA',23),(4024,'CHIAPETTA',23),(4025,'CHUI',23),(4026,'CHUVISCA',23),(4027,'CIDREIRA',23),(4028,'CIRIACO',23),(4029,'COLINAS',23),(4030,'COLORADO',23),(4031,'CONDOR',23),(4032,'CONSTANTINA',23),(4033,'COQUEIRO BAIXO',23),(4034,'COQUEIROS DO SUL',23),(4035,'CORONEL BARROS',23),(4036,'CORONEL BICACO',23),(4037,'CORONEL PILAR',23),(4038,'COTIPORA',23),(4039,'COXILHA',23),(4040,'CRISSIUMAL',23),(4041,'CRISTAL',23),(4042,'CRISTAL DO SUL',23),(4043,'CRUZ ALTA',23),(4044,'CRUZALTENSE',23),(4045,'CRUZEIRO DO SUL',23),(4046,'DAVID CANABARRO',23),(4047,'DERRUBADAS',23),(4048,'DEZESSEIS DE NOVEMBRO',23),(4049,'DILERMANDO DE AGUIAR',23),(4050,'DOIS IRMAOS',23),(4051,'DOIS IRMAOS DAS MISSOES',23),(4052,'DOIS LAJEADOS',23),(4053,'DOM FELICIANO',23),(4054,'DOM PEDRITO',23),(4055,'DOM PEDRO DE ALCANTARA',23),(4056,'DONA FRANCISCA',23),(4057,'DOUTOR MAURICIO CARDOSO',23),(4058,'DOUTOR RICARDO',23),(4059,'ELDORADO DO SUL',23),(4060,'ENCANTADO',23),(4061,'ENCRUZILHADA DO SUL',23),(4062,'ENGENHO VELHO',23),(4063,'ENTRE RIOS DO SUL',23),(4064,'ENTRE-IJUIS',23),(4065,'EREBANGO',23),(4066,'ERECHIM',23),(4067,'ERNESTINA',23),(4068,'ERVAL GRANDE',23),(4069,'ERVAL SECO',23),(4070,'ESMERALDA',23),(4071,'ESPERANCA DO SUL',23),(4072,'ESPUMOSO',23),(4073,'ESTACAO',23),(4074,'ESTANCIA VELHA',23),(4075,'ESTEIO',23),(4076,'ESTRELA',23),(4077,'ESTRELA VELHA',23),(4078,'EUGENIO DE CASTRO',23),(4079,'FAGUNDES VARELA',23),(4080,'FARROUPILHA',23),(4081,'FAXINAL DO SOTURNO',23),(4082,'FAXINALZINHO',23),(4083,'FAZENDA VILANOVA',23),(4084,'FELIZ',23),(4085,'FLORES DA CUNHA',23),(4086,'FLORIANO PEIXOTO',23),(4087,'FONTOURA XAVIER',23),(4088,'FORMIGUEIRO',23),(4089,'FORQUETINHA',23),(4090,'FORTALEZA DOS VALOS',23),(4091,'FREDERICO WESTPHALEN',23),(4092,'GARIBALDI',23),(4093,'GARRUCHOS',23),(4094,'GAURAMA',23),(4095,'GENERAL CAMARA',23),(4096,'GENTIL',23),(4097,'GETULIO VARGAS',23),(4098,'GIRUA',23),(4099,'GLORINHA',23),(4100,'GRAMADO',23),(4101,'GRAMADO DOS LOUREIROS',23),(4102,'GRAMADO XAVIER',23),(4103,'GRAVATAI',23),(4104,'GUABIJU',23),(4105,'GUAIBA',23),(4106,'GUAPORE',23),(4107,'GUARANI DAS MISSOES',23),(4108,'HARMONIA',23),(4109,'HERVAL',23),(4110,'HERVEIRAS',23),(4111,'HORIZONTINA',23),(4112,'HULHA NEGRA',23),(4113,'HUMAITA',23),(4114,'IBARAMA',23),(4115,'IBIACA',23),(4116,'IBIRAIARAS',23),(4117,'IBIRAPUITA',23),(4118,'IBIRUBA',23),(4119,'IGREJINHA',23),(4120,'IJUI',23),(4121,'ILOPOLIS',23),(4122,'IMBE',23),(4123,'IMIGRANTE',23),(4124,'INDEPENDENCIA',23),(4125,'INHACORA',23),(4126,'IPE',23),(4127,'IPIRANGA DO SUL',23),(4128,'IRAI',23),(4129,'ITAARA',23),(4130,'ITACURUBI',23),(4131,'ITAPUCA',23),(4132,'ITAQUI',23),(4133,'ITATI',23),(4134,'ITATIBA DO SUL',23),(4135,'IVORA',23),(4136,'IVOTI',23),(4137,'JABOTICABA',23),(4138,'JACUIZINHO',23),(4139,'JACUTINGA',23),(4140,'JAGUARAO',23),(4141,'JAGUARI',23),(4142,'JAQUIRANA',23),(4143,'JARI',23),(4144,'JOIA',23),(4145,'JULIO DE CASTILHOS',23),(4146,'LAGOA BONITA DO SUL',23),(4147,'LAGOA DOS TRES CANTOS',23),(4148,'LAGOA VERMELHA',23),(4149,'LAGOAO',23),(4150,'LAJEADO',23),(4151,'LAJEADO DO BUGRE',23),(4152,'LAVRAS DO SUL',23),(4153,'LIBERATO SALZANO',23),(4154,'LINDOLFO COLLOR',23),(4155,'LINHA NOVA',23),(4156,'MACAMBARA',23),(4157,'MACHADINHO',23),(4158,'MAMPITUBA',23),(4159,'MANOEL VIANA',23),(4160,'MAQUINE',23),(4161,'MARATA',23),(4162,'MARAU',23),(4163,'MARCELINO RAMOS',23),(4164,'MARIANA PIMENTEL',23),(4165,'MARIANO MORO',23),(4166,'MARQUES DE SOUZA',23),(4167,'MATA',23),(4168,'MATO CASTELHANO',23),(4169,'MATO LEITAO',23),(4170,'MATO QUEIMADO',23),(4171,'MAXIMILIANO DE ALMEIDA',23),(4172,'MINAS DO LEAO',23),(4173,'MIRAGUAI',23),(4174,'MONTAURI',23),(4175,'MONTE ALEGRE DOS CAMPOS',23),(4176,'MONTE BELO DO SUL',23),(4177,'MONTENEGRO',23),(4178,'MORMACO',23),(4179,'MORRINHOS DO SUL',23),(4180,'MORRO REDONDO',23),(4181,'MORRO REUTER',23),(4182,'MOSTARDAS',23),(4183,'MUCUM',23),(4184,'MUITOS CAPOES',23),(4185,'MULITERNO',23),(4186,'NAO-ME-TOQUE',23),(4187,'NICOLAU VERGUEIRO',23),(4188,'NONOAI',23),(4189,'NOVA ALVORADA',23),(4190,'NOVA ARACA',23),(4191,'NOVA BASSANO',23),(4192,'NOVA BOA VISTA',23),(4193,'NOVA BRESCIA',23),(4194,'NOVA CANDELARIA',23),(4195,'NOVA ESPERANCA DO SUL',23),(4196,'NOVA HARTZ',23),(4197,'NOVA PADUA',23),(4198,'NOVA PALMA',23),(4199,'NOVA PETROPOLIS',23),(4200,'NOVA PRATA',23),(4201,'NOVA RAMADA',23),(4202,'NOVA ROMA DO SUL',23),(4203,'NOVA SANTA RITA',23),(4204,'NOVO BARREIRO',23),(4205,'NOVO CABRAIS',23),(4206,'NOVO HAMBURGO',23),(4207,'NOVO MACHADO',23),(4208,'NOVO TIRADENTES',23),(4209,'NOVO XINGU',23),(4210,'OSORIO',23),(4211,'PAIM FILHO',23),(4212,'PALMARES DO SUL',23),(4213,'PALMEIRA DAS MISSOES',23),(4214,'PALMITINHO',23),(4215,'PANAMBI',23),(4216,'PANTANO GRANDE',23),(4217,'PARAI',23),(4218,'PARAISO DO SUL',23),(4219,'PARECI NOVO',23),(4220,'PAROBE',23),(4221,'PASSA SETE',23),(4222,'PASSO DO SOBRADO',23),(4223,'PASSO FUNDO',23),(4224,'PAULO BENTO',23),(4225,'PAVERAMA',23),(4226,'PEDRAS ALTAS',23),(4227,'PEDRO OSORIO',23),(4228,'PEJUCARA',23),(4229,'PELOTAS',23),(4230,'PICADA CAFE',23),(4231,'PINHAL',23),(4232,'PINHAL DA SERRA',23),(4233,'PINHAL GRANDE',23),(4234,'PINHEIRINHO DO VALE',23),(4235,'PINHEIRO MACHADO',23),(4236,'PIRAPO',23),(4237,'PIRATINI',23),(4238,'PLANALTO',23),(4239,'POCO DAS ANTAS',23),(4240,'PONTAO',23),(4241,'PONTE PRETA',23),(4242,'PORTAO',23),(4243,'PORTO LUCENA',23),(4244,'PORTO MAUA',23),(4245,'PORTO VERA CRUZ',23),(4246,'PORTO XAVIER',23),(4247,'POUSO NOVO',23),(4248,'PRESIDENTE LUCENA',23),(4249,'PROGRESSO',23),(4250,'PROTASIO ALVES',23),(4251,'PUTINGA',23),(4252,'QUARAI',23),(4253,'QUATRO IRMAOS',23),(4254,'QUEVEDOS',23),(4255,'QUINZE DE NOVEMBRO',23),(4256,'REDENTORA',23),(4257,'RELVADO',23),(4258,'RESTINGA SECA',23),(4259,'RIO DOS INDIOS',23),(4260,'RIO GRANDE',23),(4261,'RIO PARDO',23),(4262,'RIOZINHO',23),(4263,'ROCA SALES',23),(4264,'RODEIO BONITO',23),(4265,'ROLADOR',23),(4266,'ROLANTE',23),(4267,'RONDA ALTA',23),(4268,'RONDINHA',23),(4269,'ROQUE GONZALES',23),(4270,'ROSARIO DO SUL',23),(4271,'SAGRADA FAMILIA',23),(4272,'SALDANHA MARINHO',23),(4273,'SALTO DO JACUI',23),(4274,'SALVADOR DAS MISSOES',23),(4275,'SALVADOR DO SUL',23),(4276,'SANANDUVA',23),(4277,'SANTA BARBARA DO SUL',23),(4278,'SANTA CECILIA DO SUL',23),(4279,'SANTA CLARA DO SUL',23),(4280,'SANTA CRUZ DO SUL',23),(4281,'SANTA MARGARIDA DO SUL',23),(4282,'SANTA MARIA',23),(4283,'SANTA MARIA DO HERVAL',23),(4284,'SANTA ROSA',23),(4285,'SANTA TEREZA',23),(4286,'SANTA VITORIA DO PALMAR',23),(4287,'SANTANA DA BOA VISTA',23),(4288,'SANTANA DO LIVRAMENTO',23),(4289,'SANTIAGO',23),(4290,'SANTO ANGELO',23),(4291,'SANTO ANTONIO DA PATRULHA',23),(4292,'SANTO ANTONIO DAS MISSOES',23),(4293,'SANTO ANTONIO DO PALMA',23),(4294,'SANTO ANTONIO DO PLANALTO',23),(4295,'SANTO AUGUSTO',23),(4296,'SANTO CRISTO',23),(4297,'SANTO EXPEDITO DO SUL',23),(4298,'SAO BORJA',23),(4299,'SAO DOMINGOS DO SUL',23),(4300,'SAO FRANCISCO DE ASSIS',23),(4301,'SAO FRANCISCO DE PAULA',23),(4302,'SAO GABRIEL',23),(4303,'SAO JERONIMO',23),(4304,'SAO JOAO DA URTIGA',23),(4305,'SAO JOAO DO POLESINE',23),(4306,'SAO JORGE',23),(4307,'SAO JOSE DAS MISSOES',23),(4308,'SAO JOSE DO HERVAL',23),(4309,'SAO JOSE DO HORTENCIO',23),(4310,'SAO JOSE DO INHACORA',23),(4311,'SAO JOSE DO NORTE',23),(4312,'SAO JOSE DO OURO',23),(4313,'SAO JOSE DO SUL',23),(4314,'SAO JOSE DOS AUSENTES',23),(4315,'SAO LEOPOLDO',23),(4316,'SAO LOURENCO DO SUL',23),(4317,'SAO LUIZ GONZAGA',23),(4318,'SAO MARCOS',23),(4319,'SAO MARTINHO',23),(4320,'SAO MARTINHO DA SERRA',23),(4321,'SAO MIGUEL DAS MISSOES',23),(4322,'SAO NICOLAU',23),(4323,'SAO PAULO DAS MISSOES',23),(4324,'SAO PEDRO DA SERRA',23),(4325,'SAO PEDRO DAS MISSOES',23),(4326,'SAO PEDRO DO BUTIA',23),(4327,'SAO PEDRO DO SUL',23),(4328,'SAO SEBASTIAO DO CAI',23),(4329,'SAO SEPE',23),(4330,'SAO VALENTIM',23),(4331,'SAO VALENTIM DO SUL',23),(4332,'SAO VALERIO DO SUL',23),(4333,'SAO VENDELINO',23),(4334,'SAO VICENTE DO SUL',23),(4335,'SAPIRANGA',23),(4336,'SAPUCAIA DO SUL',23),(4337,'SARANDI',23),(4338,'SEBERI',23),(4339,'SEDE NOVA',23),(4340,'SEGREDO',23),(4341,'SELBACH',23),(4342,'SENADOR SALGADO FILHO',23),(4343,'SENTINELA DO SUL',23),(4344,'SERAFINA CORREA',23),(4345,'SERIO',23),(4346,'SERTAO',23),(4347,'SERTAO SANTANA',23),(4348,'SETE DE SETEMBRO',23),(4349,'SEVERIANO DE ALMEIDA',23),(4350,'SILVEIRA MARTINS',23),(4351,'SINIMBU',23),(4352,'SOBRADINHO',23),(4353,'SOLEDADE',23),(4354,'TABAI',23),(4355,'TAPEJARA',23),(4356,'TAPERA',23),(4357,'TAPES',23),(4358,'TAQUARA',23),(4359,'TAQUARI',23),(4360,'TAQUARUCU DO SUL',23),(4361,'TAVARES',23),(4362,'TENENTE PORTELA',23),(4363,'TERRA DE AREIA',23),(4364,'TEUTONIA',23),(4365,'TIO HUGO',23),(4366,'TIRADENTES DO SUL',23),(4367,'TOROPI',23),(4368,'TORRES',23),(4369,'TRAMANDAI',23),(4370,'TRAVESSEIRO',23),(4371,'TRES ARROIOS',23),(4372,'TRES CACHOEIRAS',23),(4373,'TRES COROAS',23),(4374,'TRES DE MAIO',23),(4375,'TRES FORQUILHAS',23),(4376,'TRES PALMEIRAS',23),(4377,'TRES PASSOS',23),(4378,'TRINDADE DO SUL',23),(4379,'TRIUNFO',23),(4380,'TUCUNDUVA',23),(4381,'TUNAS',23),(4382,'TUPANCI DO SUL',23),(4383,'TUPANCIRETA',23),(4384,'TUPANDI',23),(4385,'TUPARENDI',23),(4386,'TURUCU',23),(4387,'UBIRETAMA',23),(4388,'UNIAO DA SERRA',23),(4389,'UNISTALDA',23),(4390,'URUGUAIANA',23),(4391,'VACARIA',23),(4392,'VALE DO SOL',23),(4393,'VALE REAL',23),(4394,'VALE VERDE',23),(4395,'VANINI',23),(4396,'VENANCIO AIRES',23),(4397,'VERA CRUZ',23),(4398,'VERANOPOLIS',23),(4399,'VESPASIANO CORREA',23),(4400,'VIADUTOS',23),(4401,'VIAMAO',23),(4402,'VICENTE DUTRA',23),(4403,'VICTOR GRAEFF',23),(4404,'VILA FLORES',23),(4405,'VILA LANGARO',23),(4406,'VILA MARIA',23),(4407,'VILA NOVA DO SUL',23),(4408,'VISTA ALEGRE',23),(4409,'VISTA ALEGRE DO PRATA',23),(4410,'VISTA GAUCHA',23),(4411,'VITORIA DAS MISSOES',23),(4412,'WESTFALIA',23),(4413,'XANGRI-LA',23),(4414,'ABDON BATISTA',26),(4415,'ABELARDO LUZ',26),(4416,'AGROLANDIA',26),(4417,'AGRONOMICA',26),(4418,'AGUA DOCE',26),(4419,'AGUAS DE CHAPECO',26),(4420,'AGUAS FRIAS',26),(4421,'AGUAS MORNAS',26),(4422,'ALFREDO WAGNER',26),(4423,'ALTO BELA VISTA',26),(4424,'ANCHIETA',26),(4425,'ANGELINA',26),(4426,'ANITA GARIBALDI',26),(4427,'ANITAPOLIS',26),(4428,'ANTONIO CARLOS',26),(4429,'APIUNA',26),(4430,'ARABUTA',26),(4431,'ARAQUARI',26),(4432,'ARARANGUA',26),(4433,'ARMAZEM',26),(4434,'ARROIO TRINTA',26),(4435,'ARVOREDO',26),(4436,'ASCURRA',26),(4437,'ATALANTA',26),(4438,'AURORA',26),(4439,'BALNEARIO ARROIO DO SILVA',26),(4440,'BALNEARIO BARRA DO SUL (SC)',26),(4441,'BALNEARIO CAMBORIU',26),(4442,'BALNEARIO GAIVOTA',26),(4443,'BANDEIRANTE',26),(4444,'BARRA BONITA',26),(4445,'BARRA VELHA',26),(4446,'BELA VISTA DO TOLDO',26),(4447,'BELMONTE',26),(4448,'BENEDITO NOVO',26),(4449,'BIGUACU',26),(4450,'BLUMENAU',26),(4451,'BOCAINA DO SUL',26),(4452,'BOM JARDIM DA SERRA',26),(4453,'BOM JESUS',26),(4454,'BOM JESUS DO OESTE',26),(4455,'BOM RETIRO',26),(4456,'BOMBINHAS',26),(4457,'BOTUVERA',26),(4458,'BRACO DO NORTE',26),(4459,'BRACO DO TROMBUDO',26),(4460,'BRUNOPOLIS',26),(4461,'BRUSQUE',26),(4462,'CACADOR',26),(4463,'CAIBI',26),(4464,'CALMON',26),(4465,'CAMBORIU',26),(4466,'CAMPO ALEGRE',26),(4467,'CAMPO BELO DO SUL',26),(4468,'CAMPO ERE',26),(4469,'CAMPOS NOVOS',26),(4470,'CANELINHA',26),(4471,'CANOINHAS',26),(4472,'CAPAO ALTO',26),(4473,'CAPINZAL',26),(4474,'CAPIVARI DE BAIXO',26),(4475,'CATANDUVAS',26),(4476,'CAXAMBU DO SUL',26),(4477,'CELSO RAMOS',26),(4478,'CERRO NEGRO',26),(4479,'CHAPADAO DO LAGEADO',26),(4480,'CHAPECO',26),(4481,'COCAL DO SUL',26),(4482,'CONCORDIA',26),(4483,'CORDILHEIRA ALTA',26),(4484,'CORONEL FREITAS',26),(4485,'CORONEL MARTINS',26),(4486,'CORREIA PINTO',26),(4487,'CORUPA',26),(4488,'CRICIUMA',26),(4489,'CUNHA PORA',26),(4490,'CUNHATAI',26),(4491,'CURITIBANOS',26),(4492,'DESCANSO',26),(4493,'DIONISIO CERQUEIRA',26),(4494,'DONA EMMA',26),(4495,'DOUTOR PEDRINHO',26),(4496,'ENTRE RIOS',26),(4497,'ERMO',26),(4498,'ERVAL VELHO',26),(4499,'FAXINAL DOS GUEDES',26),(4500,'FLOR DO SERTAO',26),(4501,'FLORIANOPOLIS',26),(4502,'FORMOSA DO SUL',26),(4503,'FORQUILHINHA',26),(4504,'FRAIBURGO',26),(4505,'FREI ROGERIO',26),(4506,'GALVAO',26),(4507,'GAROPABA',26),(4508,'GARUVA',26),(4509,'GASPAR',26),(4510,'GOVERNADOR CELSO RAMOS',26),(4511,'GRAO PARA',26),(4512,'GRAVATAL',26),(4513,'GUABIRUBA',26),(4514,'GUARACIABA',26),(4515,'GUARAMIRIM',26),(4516,'GUARUJA DO SUL',26),(4517,'GUATAMBU',26),(4518,'HERVAL DOESTE',26),(4519,'IBIAM',26),(4520,'IBICARE',26),(4521,'IBIRAMA',26),(4522,'ICARA',26),(4523,'ILHOTA',26),(4524,'IMARUI',26),(4525,'IMBITUBA',26),(4526,'IMBUIA',26),(4527,'INDAIAL',26),(4528,'IOMERE',26),(4529,'IPIRA',26),(4530,'IPORA DO OESTE',26),(4531,'IPUACU',26),(4532,'IPUMIRIM',26),(4533,'IRACEMINHA',26),(4534,'IRANI',26),(4535,'IRATI',26),(4536,'IRINEOPOLIS',26),(4537,'ITA',26),(4538,'ITAIOPOLIS',26),(4539,'ITAJAI',26),(4540,'ITAPEMA',26),(4541,'ITAPIRANGA',26),(4542,'ITAPOA',26),(4543,'ITUPORANGA',26),(4544,'JABORA',26),(4545,'JACINTO MACHADO',26),(4546,'JAGUARUNA',26),(4547,'JARAGUA DO SUL',26),(4548,'JARDINOPOLIS',26),(4549,'JOACABA',26),(4550,'JOINVILLE',26),(4551,'JOSE BOITEUX',26),(4552,'JUPIA',26),(4553,'LACERDOPOLIS',26),(4554,'LAGES',26),(4555,'LAGUNA',26),(4556,'LAJEADO GRANDE',26),(4557,'LAURENTINO',26),(4558,'LAURO MULLER',26),(4559,'LEBON REGIS',26),(4560,'LEOBERTO LEAL',26),(4561,'LINDOIA DO SUL',26),(4562,'LONTRAS',26),(4563,'LUIZ ALVES',26),(4564,'LUZERNA',26),(4565,'MACIEIRA',26),(4566,'MAFRA',26),(4567,'MAJOR GERCINO',26),(4568,'MAJOR VIEIRA',26),(4569,'MARACAJA',26),(4570,'MARAVILHA',26),(4571,'MAREMA',26),(4572,'MASSARANDUBA',26),(4573,'MATOS COSTA',26),(4574,'MELEIRO',26),(4575,'MIRIM DOCE',26),(4576,'MODELO',26),(4577,'MONDAI',26),(4578,'MONTE CARLO',26),(4579,'MONTE CASTELO',26),(4580,'MORRO DA FUMACA',26),(4581,'MORRO GRANDE',26),(4582,'NAVEGANTES',26),(4583,'NOVA ERECHIM',26),(4584,'NOVA ITABERABA',26),(4585,'NOVA TRENTO',26),(4586,'NOVA VENEZA',26),(4587,'NOVO HORIZONTE',26),(4588,'ORLEANS',26),(4589,'OTACILIO COSTA',26),(4590,'OURO',26),(4591,'OURO VERDE',26),(4592,'PAIAL',26),(4593,'PAINEL',26),(4594,'PALHOCA',26),(4595,'PALMA SOLA',26),(4596,'PALMEIRA',26),(4597,'PALMITOS',26),(4598,'PAPANDUVA',26),(4599,'PARAISO',26),(4600,'PASSO DE TORRES',26),(4601,'PASSOS MAIA',26),(4602,'PAULO LOPES',26),(4603,'PEDRAS GRANDES',26),(4604,'PENHA',26),(4605,'PERITIBA',26),(4606,'PETROLANDIA',26),(4607,'PICARRAS',26),(4608,'PINHALZINHO',26),(4609,'PINHEIRO PRETO',26),(4610,'PIRATUBA',26),(4611,'PLANALTO ALEGRE',26),(4612,'POMERODE',26),(4613,'PONTE ALTA',26),(4614,'PONTE ALTA DO NORTE',26),(4615,'PONTE SERRADA',26),(4616,'PORTO BELO',26),(4617,'PORTO UNIAO',26),(4618,'POUSO REDONDO',26),(4619,'PRAIA GRANDE',26),(4620,'PRESIDENTE CASTELO BRANCO',26),(4621,'PRESIDENTE GETULIO',26),(4622,'PRESIDENTE NEREU',26),(4623,'PRINCESA',26),(4624,'QUILOMBO',26),(4625,'RANCHO QUEIMADO',26),(4626,'RIO DAS ANTAS',26),(4627,'RIO DO CAMPO',26),(4628,'RIO DO OESTE',26),(4629,'RIO DO SUL',26),(4630,'RIO DOS CEDROS',26),(4631,'RIO FORTUNA',26),(4632,'RIO NEGRINHO',26),(4633,'RIO RUFINO',26),(4634,'RIQUEZA',26),(4635,'RODEIO',26),(4636,'ROMELANDIA',26),(4637,'SALETE',26),(4638,'SALTINHO',26),(4639,'SALTO VELOSO',26),(4640,'SANGAO',26),(4641,'SANTA CECILIA',26),(4642,'SANTA HELENA',26),(4643,'SANTA ROSA DE LIMA',26),(4644,'SANTA ROSA DO SUL',26),(4645,'SANTA TEREZINHA',26),(4646,'SANTA TEREZINHA DO PROGRESSO',26),(4647,'SANTIAGO DO SUL',26),(4648,'SANTO AMARO DA IMPERATRIZ',26),(4649,'SAO BENTO DO SUL',26),(4650,'SAO BERNARDINO',26),(4651,'SAO BONIFACIO',26),(4652,'SAO CARLOS',26),(4653,'SAO CRISTOVAO DO SUL',26),(4654,'SAO DOMINGOS',26),(4655,'SAO FRANCISCO DO SUL',26),(4656,'SAO JOAO BATISTA',26),(4657,'SAO JOAO DO ITAPERIU',26),(4658,'SAO JOAO DO OESTE',26),(4659,'SAO JOAO DO SUL',26),(4660,'SAO JOAQUIM',26),(4661,'SAO JOSE',26),(4662,'SAO JOSE DO CEDRO',26),(4663,'SAO JOSE DO CERRITO',26),(4664,'SAO LOURENCO DO OESTE',26),(4665,'SAO LUDGERO',26),(4666,'SAO MARTINHO',26),(4667,'SAO MIGUEL DA BOA VISTA',26),(4668,'SAO MIGUEL DOESTE',26),(4669,'SAO PEDRO DE ALCANTARA',26),(4670,'SAUDADES',26),(4671,'SCHROEDER',26),(4672,'SEARA',26),(4673,'SERRA ALTA',26),(4674,'SIDEROPOLIS',26),(4675,'SOMBRIO',26),(4676,'SUL BRASIL',26),(4677,'TAIO',26),(4678,'TANGARA',26),(4679,'TIGRINHOS',26),(4680,'TIJUCAS',26),(4681,'TIMBE DO SUL',26),(4682,'TIMBO',26),(4683,'TIMBO GRANDE',26),(4684,'TRES BARRAS',26),(4685,'TREVISO',26),(4686,'TREZE DE MAIO',26),(4687,'TREZE TILIAS',26),(4688,'TROMBUDO CENTRAL',26),(4689,'TUBARAO',26),(4690,'TUNAPOLIS',26),(4691,'TURVO',26),(4692,'UNIAO DO OESTE',26),(4693,'URUBICI',26),(4694,'URUPEMA',26),(4695,'URUSSANGA',26),(4696,'VARGEAO',26),(4697,'VARGEM',26),(4698,'VARGEM BONITA',26),(4699,'VIDAL RAMOS',26),(4700,'VIDEIRA',26),(4701,'VITOR MEIRELES',26),(4702,'WITMARSUM',26),(4703,'XANXERE',26),(4704,'XAVANTINA',26),(4705,'XAXIM',26),(4706,'ZORTEA',26),(4707,'AMPARO DE SAO FRANCISCO',27),(4708,'AQUIDABA',27),(4709,'ARACAJU',27),(4710,'ARAUA',27),(4711,'AREIA BRANCA',27),(4712,'BARRA DOS COQUEIROS',27),(4713,'BOQUIM',27),(4714,'BREJO GRANDE',27),(4715,'CAMPO DO BRITO',27),(4716,'CANHOBA',27),(4717,'CANINDE DE SAO FRANCISCO',27),(4718,'CAPELA',27),(4719,'CARIRA',27),(4720,'CARMOPOLIS',27),(4721,'CEDRO DE SAO JOAO',27),(4722,'CRISTINAPOLIS',27),(4723,'CUMBE',27),(4724,'DIVINA PASTORA',27),(4725,'ESTANCIA',27),(4726,'FEIRA NOVA',27),(4727,'FREI PAULO',27),(4728,'GARARU',27),(4729,'GENERAL MAYNARD',27),(4730,'GRACCHO CARDOSO',27),(4731,'ILHA DAS FLORES',27),(4732,'INDIAROBA',27),(4733,'ITABAIANA',27),(4734,'ITABAIANINHA',27),(4735,'ITABI',27),(4736,'ITAPORANGA DAJUDA',27),(4737,'JAPARATUBA',27),(4738,'JAPOATA',27),(4739,'LAGARTO',27),(4740,'LARANJEIRAS',27),(4741,'MACAMBIRA',27),(4742,'MALHADA DOS BOIS',27),(4743,'MALHADOR',27),(4744,'MARUIM',27),(4745,'MOITA BONITA',27),(4746,'MONTE ALEGRE DE SERGIPE',27),(4747,'MURIBECA',27),(4748,'NEOPOLIS',27),(4749,'NOSSA SENHORA APARECIDA',27),(4750,'NOSSA SENHORA DA GLORIA',27),(4751,'NOSSA SENHORA DAS DORES',27),(4752,'NOSSA SENHORA DE LOURDES',27),(4753,'NOSSA SENHORA DO SOCORRO',27),(4754,'PACATUBA',27),(4755,'PEDRA MOLE',27),(4756,'PEDRINHAS',27),(4757,'PINHAO',27),(4758,'PIRAMBU',27),(4759,'POCO REDONDO',27),(4760,'POCO VERDE',27),(4761,'PORTO DA FOLHA',27),(4762,'PROPRIA',27),(4763,'RIACHAO DO DANTAS',27),(4764,'RIACHUELO',27),(4765,'RIBEIROPOLIS',27),(4766,'ROSARIO DO CATETE',27),(4767,'SALGADO',27),(4768,'SANTA LUZIA DO ITANHY',27),(4769,'SANTA ROSA DE LIMA',27),(4770,'SANTANA DE SAO FRANCISCO',27),(4771,'SANTO AMARO DAS BROTAS',27),(4772,'SAO CRISTOVAO',27),(4773,'SAO DOMINGOS',27),(4774,'SAO FRANCISCO',27),(4775,'SAO MIGUEL DO ALEIXO',27),(4776,'SIMAO DIAS',27),(4777,'SIRIRI',27),(4778,'TELHA',27),(4779,'TOBIAS BARRETO',27),(4780,'TOMAR DO GERU',27),(4781,'UMBAUBA',27),(4782,'ADAMANTINA',1),(4783,'ADOLFO',1),(4784,'AGUAI',1),(4785,'AGUAS DA PRATA',1),(4786,'AGUAS DE LINDOIA',1),(4787,'AGUAS DE SANTA BARBARA',1),(4788,'AGUAS DE SAO PEDRO',1),(4789,'AGUDOS',1),(4790,'ALAMBARI',1),(4791,'ALFREDO MARCONDES',1),(4792,'ALTAIR',1),(4793,'ALTINOPOLIS',1),(4794,'ALTO ALEGRE',1),(4795,'ALUMINIO',1),(4796,'ALVARES FLORENCE',1),(4797,'ALVARES MACHADO',1),(4798,'ALVARO DE CARVALHO',1),(4799,'ALVINLANDIA',1),(4800,'AMERICANA',1),(4801,'AMERICO BRASILIENSE',1),(4802,'AMERICO DE CAMPOS',1),(4803,'AMPARO',1),(4804,'ANALANDIA',1),(4805,'ANDRADINA',1),(4806,'ANGATUBA',1),(4807,'ANHEMBI',1),(4808,'ANHUMAS',1),(4809,'APARECIDA',1),(4810,'APARECIDA DOESTE',1),(4811,'APIAI',1),(4812,'ARACARIGUAMA',1),(4813,'ARACATUBA',1),(4814,'ARACOIABA DA SERRA',1),(4815,'ARAMINA',1),(4816,'ARANDU',1),(4817,'ARAPEI',1),(4818,'ARARAQUARA',1),(4819,'ARARAS',1),(4820,'ARCO-IRIS',1),(4821,'AREALVA',1),(4822,'AREIAS',1),(4823,'AREIOPOLIS',1),(4824,'ARIRANHA',1),(4825,'ARTUR NOGUEIRA',1),(4826,'ARUJA',1),(4827,'ASPASIA',1),(4828,'ASSIS',1),(4829,'ATIBAIA',1),(4830,'AURIFLAMA',1),(4831,'AVAI',1),(4832,'AVANHANDAVA',1),(4833,'AVARE',1),(4834,'BADY BASSITT',1),(4835,'BALBINOS',1),(4836,'BALSAMO',1),(4837,'BANANAL',1),(4838,'BARAO DE ANTONINA',1),(4839,'BARBOSA',1),(4840,'BARIRI',1),(4841,'BARRA BONITA',1),(4842,'BARRA DO CHAPEU',1),(4843,'BARRA DO TURVO',1),(4844,'BARRETOS',1),(4845,'BARRINHA',1),(4846,'BARUERI',1),(4847,'BASTOS',1),(4848,'BATATAIS',1),(4849,'BAURU',1),(4850,'BEBEDOURO',1),(4851,'BENTO DE ABREU',1),(4852,'BERNARDINO DE CAMPOS',1),(4853,'BERTIOGA',1),(4854,'BILAC',1),(4855,'BIRIGUI',1),(4856,'BIRITIBA-MIRIM',1),(4857,'BOA ESPERANCA DO SUL',1),(4858,'BOCAINA',1),(4859,'BOFETE',1),(4860,'BOITUVA',1),(4861,'BOM JESUS DOS PERDOES',1),(4862,'BOM SUCESSO DE ITARARE',1),(4863,'BORA',1),(4864,'BORACEIA',1),(4865,'BORBOREMA',1),(4866,'BOREBI',1),(4867,'BOTUCATU',1),(4868,'BRAGANCA PAULISTA',1),(4869,'BRAUNA',1),(4870,'BREJO ALEGRE',1),(4871,'BRODOSQUI',1),(4872,'BROTAS',1),(4873,'BURI',1),(4874,'BURITAMA',1),(4875,'BURITIZAL',1),(4876,'CABRALIA PAULISTA',1),(4877,'CABREUVA',1),(4878,'CACAPAVA',1),(4879,'CACHOEIRA PAULISTA',1),(4880,'CACONDE',1),(4881,'CAFELANDIA',1),(4882,'CAIABU',1),(4883,'CAIEIRAS',1),(4884,'CAIUA',1),(4885,'CAJAMAR',1),(4886,'CAJATI',1),(4887,'CAJOBI',1),(4888,'CAJURU',1),(4889,'CAMPINA DO MONTE ALEGRE',1),(4890,'CAMPINAS',1),(4891,'CAMPO LIMPO PAULISTA',1),(4892,'CAMPOS DO JORDAO',1),(4893,'CAMPOS NOVOS PAULISTA',1),(4894,'CANANEIA',1),(4895,'CANAS',1),(4896,'CANDIDO MOTA',1),(4897,'CANDIDO RODRIGUES',1),(4898,'CANITAR',1),(4899,'CAPAO BONITO',1),(4900,'CAPELA DO ALTO',1),(4901,'CAPIVARI',1),(4902,'CARAGUATATUBA',1),(4903,'CARAPICUIBA',1),(4904,'CARDOSO',1),(4905,'CASA BRANCA',1),(4906,'CASSIA DOS COQUEIROS',1),(4907,'CASTILHO',1),(4908,'CATANDUVA',1),(4909,'CATIGUA',1),(4910,'CEDRAL',1),(4911,'CERQUEIRA CESAR',1),(4912,'CERQUILHO',1),(4913,'CESARIO LANGE',1),(4914,'CHARQUEADA',1),(4915,'CHAVANTES',1),(4916,'CLEMENTINA',1),(4917,'COLINA',1),(4918,'COLOMBIA',1),(4919,'CONCHAL',1),(4920,'CONCHAS',1),(4921,'CORDEIROPOLIS',1),(4922,'COROADOS',1),(4923,'CORONEL MACEDO',1),(4924,'CORUMBATAI',1),(4925,'COSMOPOLIS',1),(4926,'COSMORAMA',1),(4927,'COTIA',1),(4928,'CRAVINHOS',1),(4929,'CRISTAIS PAULISTA',1),(4930,'CRUZALIA',1),(4931,'CRUZEIRO',1),(4932,'CUBATAO',1),(4933,'CUNHA',1),(4934,'DESCALVADO',1),(4935,'DIADEMA',1),(4936,'DIRCE REIS',1),(4937,'DIVINOLANDIA',1),(4938,'DOBRADA',1),(4939,'DOIS CORREGOS',1),(4940,'DOLCINOPOLIS',1),(4941,'DOURADO',1),(4942,'DRACENA',1),(4943,'DUARTINA',1),(4944,'DUMONT',1),(4945,'ECHAPORA',1),(4946,'ELDORADO',1),(4947,'ELIAS FAUSTO',1),(4948,'ELISIARIO',1),(4949,'EMBAUBA',1),(4950,'EMBU',1),(4951,'EMBU-GUACU',1),(4952,'EMILIANOPOLIS',1),(4953,'ENGENHEIRO COELHO',1),(4954,'ESPIRITO SANTO DO PINHAL',1),(4955,'ESPIRITO SANTO DO TURVO',1),(4956,'ESTIVA GERBI',1),(4957,'ESTRELA DO NORTE',1),(4958,'ESTRELA DOESTE',1),(4959,'EUCLIDES DA CUNHA PAULISTA',1),(4960,'FARTURA',1),(4961,'FERNANDO PRESTES',1),(4962,'FERNANDOPOLIS',1),(4963,'FERNAO',1),(4964,'FERRAZ DE VASCONCELOS',1),(4965,'FLORA RICA',1),(4966,'FLOREAL',1),(4967,'FLORIDA PAULISTA',1),(4968,'FLORINEA',1),(4969,'FRANCA',1),(4970,'FRANCISCO MORATO',1),(4971,'FRANCO DA ROCHA',1),(4972,'GABRIEL MONTEIRO',1),(4973,'GALIA',1),(4974,'GARCA',1),(4975,'GASTAO VIDIGAL',1),(4976,'GAVIAO PEIXOTO',1),(4977,'GENERAL SALGADO',1),(4978,'GETULINA',1),(4979,'GLICERIO',1),(4980,'GUAICARA',1),(4981,'GUAIMBE',1),(4982,'GUAIRA',1),(4983,'GUAPIACU',1),(4984,'GUAPIARA',1),(4985,'GUARA',1),(4986,'GUARACAI',1),(4987,'GUARACI',1),(4988,'GUARANI DOESTE',1),(4989,'GUARANTA',1),(4990,'GUARARAPES',1),(4991,'GUARAREMA',1),(4992,'GUARATINGUETA',1),(4993,'GUAREI',1),(4994,'GUARIBA',1),(4995,'GUARUJA',1),(4996,'GUARULHOS',1),(4997,'GUATAPARA',1),(4998,'GUZOLANDIA',1),(4999,'HERCULANDIA',1),(5000,'HOLAMBRA',1),(5001,'HORTOLANDIA',1),(5002,'IACANGA',1),(5003,'IACRI',1),(5004,'IARAS',1),(5005,'IBATE',1),(5006,'IBIRA',1),(5007,'IBIRAREMA',1),(5008,'IBITINGA',1),(5009,'IBIUNA',1),(5010,'ICEM',1),(5011,'IEPE',1),(5012,'IGARACU DO TIETE',1),(5013,'IGARAPAVA',1),(5014,'IGARATA',1),(5015,'IGUAPE',1),(5016,'ILHA COMPRIDA',1),(5017,'ILHA SOLTEIRA',1),(5018,'ILHABELA',1),(5019,'INDAIATUBA',1),(5020,'INDIANA',1),(5021,'INDIAPORA',1),(5022,'INUBIA PAULISTA',1),(5023,'IPAUSSU',1),(5024,'IPERO',1),(5025,'IPEUNA',1),(5026,'IPIGUA',1),(5027,'IPORANGA',1),(5028,'IPUA',1),(5029,'IRACEMAPOLIS',1),(5030,'IRAPUA',1),(5031,'IRAPURU',1),(5032,'ITABERA',1),(5033,'ITAI',1),(5034,'ITAJOBI',1),(5035,'ITAJU',1),(5036,'ITANHAEM',1),(5037,'ITAOCA',1),(5038,'ITAPECERICA DA SERRA',1),(5039,'ITAPETININGA',1),(5040,'ITAPEVA',1),(5041,'ITAPEVI',1),(5042,'ITAPIRA',1),(5043,'ITAPIRAPUA PAULISTA',1),(5044,'ITAPOLIS',1),(5045,'ITAPORANGA',1),(5046,'ITAPUI',1),(5047,'ITAPURA',1),(5048,'ITAQUAQUECETUBA',1),(5049,'ITARARE',1),(5050,'ITARIRI',1),(5051,'ITATIBA',1),(5052,'ITATINGA',1),(5053,'ITIRAPINA',1),(5054,'ITIRAPUA',1),(5055,'ITOBI',1),(5056,'ITU',1),(5057,'ITUPEVA',1),(5058,'ITUVERAVA',1),(5059,'JABORANDI',1),(5060,'JABOTICABAL',1),(5061,'JACAREI',1),(5062,'JACI',1),(5063,'JACUPIRANGA',1),(5064,'JAGUARIUNA',1),(5065,'JALES',1),(5066,'JAMBEIRO',1),(5067,'JANDIRA',1),(5068,'JARDINOPOLIS',1),(5069,'JARINU',1),(5070,'JAU',1),(5071,'JERIQUARA',1),(5072,'JOANOPOLIS',1),(5073,'JOAO RAMALHO',1),(5074,'JOSE BONIFACIO',1),(5075,'JULIO MESQUITA',1),(5076,'JUMIRIM',1),(5077,'JUNDIAI',1),(5078,'JUNQUEIROPOLIS',1),(5079,'JUQUIA',1),(5080,'JUQUITIBA',1),(5081,'LAGOINHA',1),(5082,'LARANJAL PAULISTA',1),(5083,'LAVINIA',1),(5084,'LAVRINHAS',1),(5085,'LEME',1),(5086,'LENCOIS PAULISTA',1),(5087,'LIMEIRA',1),(5088,'LINDOIA',1),(5089,'LINS',1),(5090,'LORENA',1),(5091,'LOURDES',1),(5092,'LOUVEIRA',1),(5093,'LUCELIA',1),(5094,'LUCIANOPOLIS',1),(5095,'LUIS ANTONIO',1),(5096,'LUIZIANIA',1),(5097,'LUPERCIO',1),(5098,'LUTECIA',1),(5099,'MACATUBA',1),(5100,'MACAUBAL',1),(5101,'MACEDONIA',1),(5102,'MAGDA',1),(5103,'MAIRINQUE',1),(5104,'MAIRIPORA',1),(5105,'MANDURI',1),(5106,'MARABA PAULISTA',1),(5107,'MARACAI',1),(5108,'MARAPOAMA',1),(5109,'MARIAPOLIS',1),(5110,'MARILIA',1),(5111,'MARINOPOLIS',1),(5112,'MARTINOPOLIS',1),(5113,'MATAO',1),(5114,'MAUA',1),(5115,'MENDONCA',1),(5116,'MERIDIANO',1),(5117,'MESOPOLIS',1),(5118,'MIGUELOPOLIS',1),(5119,'MINEIROS DO TIETE',1),(5120,'MIRA ESTRELA',1),(5121,'MIRACATU',1),(5122,'MIRANDOPOLIS',1),(5123,'MIRANTE DO PARANAPANEMA',1),(5124,'MIRASSOL',1),(5125,'MIRASSOLANDIA',1),(5126,'MOCOCA',1),(5127,'MOGI GUACU',1),(5128,'MOJI DAS CRUZES',1),(5129,'MOJI-MIRIM',1),(5130,'MOMBUCA',1),(5131,'MONCOES',1),(5132,'MONGAGUA',1),(5133,'MONTE ALEGRE DO SUL',1),(5134,'MONTE ALTO',1),(5135,'MONTE APRAZIVEL',1),(5136,'MONTE AZUL PAULISTA',1),(5137,'MONTE CASTELO',1),(5138,'MONTE MOR',1),(5139,'MONTEIRO LOBATO',1),(5140,'MORRO AGUDO',1),(5141,'MORUNGABA',1),(5142,'MOTUCA',1),(5143,'MURUTINGA DO SUL',1),(5144,'NANTES',1),(5145,'NARANDIBA',1),(5146,'NATIVIDADE DA SERRA',1),(5147,'NAZARE PAULISTA',1),(5148,'NEVES PAULISTA',1),(5149,'NHANDEARA',1),(5150,'NIPOA',1),(5151,'NOVA ALIANCA',1),(5152,'NOVA CAMPINA',1),(5153,'NOVA CANAA PAULISTA',1),(5154,'NOVA CASTILHO',1),(5155,'NOVA EUROPA',1),(5156,'NOVA GRANADA',1),(5157,'NOVA GUATAPORANGA',1),(5158,'NOVA INDEPENDENCIA',1),(5159,'NOVA LUZITANIA',1),(5160,'NOVA ODESSA',1),(5161,'NOVAIS',1),(5162,'NOVO HORIZONTE',1),(5163,'NUPORANGA',1),(5164,'OCAUCU',1),(5165,'OLEO',1),(5166,'OLIMPIA',1),(5167,'ONDA VERDE',1),(5168,'ORIENTE',1),(5169,'ORINDIUVA',1),(5170,'ORLANDIA',1),(5171,'OSASCO',1),(5172,'OSCAR BRESSANE',1),(5173,'OSVALDO CRUZ',1),(5174,'OURINHOS',1),(5175,'OURO VERDE',1),(5176,'OUROESTE',1),(5177,'PACAEMBU',1),(5178,'PALESTINA',1),(5179,'PALMARES PAULISTA',1),(5180,'PALMEIRA DOESTE',1),(5181,'PALMITAL',1),(5182,'PANORAMA',1),(5183,'PARAGUACU PAULISTA',1),(5184,'PARAIBUNA',1),(5185,'PARAISO',1),(5186,'PARANAPANEMA',1),(5187,'PARANAPUA',1),(5188,'PARAPUA',1),(5189,'PARDINHO',1),(5190,'PARIQUERA-ACU',1),(5191,'PARISI',1),(5192,'PATROCINIO PAULISTA',1),(5193,'PAULICEIA',1),(5194,'PAULINIA',1),(5195,'PAULISTANIA',1),(5196,'PAULO DE FARIA',1),(5197,'PEDERNEIRAS',1),(5198,'PEDRA BELA',1),(5199,'PEDRANOPOLIS',1),(5200,'PEDREGULHO',1),(5201,'PEDREIRA',1),(5202,'PEDRINHAS PAULISTAS',1),(5203,'PEDRO DE TOLEDO',1),(5204,'PENAPOLIS',1),(5205,'PEREIRA BARRETO',1),(5206,'PEREIRAS',1),(5207,'PERUIBE',1),(5208,'PIACATU',1),(5209,'PIEDADE',1),(5210,'PILAR DO SUL',1),(5211,'PINDAMONHANGABA',1),(5212,'PINDORAMA',1),(5213,'PINHALZINHO',1),(5214,'PIQUEROBI',1),(5215,'PIQUETE',1),(5216,'PIRACAIA',1),(5217,'PIRACICABA',1),(5218,'PIRAJU',1),(5219,'PIRAJUI',1),(5220,'PIRANGI',1),(5221,'PIRAPORA DO BOM JESUS',1),(5222,'PIRAPOZINHO',1),(5223,'PIRASSUNUNGA',1),(5224,'PIRATININGA',1),(5225,'PITANGUEIRAS',1),(5226,'PLANALTO',1),(5227,'PLATINA',1),(5228,'POA',1),(5229,'POLONI',1),(5230,'POMPEIA',1),(5231,'PONGAI',1),(5232,'PONTAL',1),(5233,'PONTALINDA',1),(5234,'PONTES GESTAL',1),(5235,'POPULINA',1),(5236,'PORANGABA',1),(5237,'PORTO FELIZ',1),(5238,'PORTO FERREIRA',1),(5239,'POTIM',1),(5240,'POTIRENDABA',1),(5241,'PRACINHA',1),(5242,'PRADOPOLIS',1),(5243,'PRAIA GRANDE',1),(5244,'PRATANIA',1),(5245,'PRESIDENTE ALVES',1),(5246,'PRESIDENTE BERNARDES',1),(5247,'PRESIDENTE EPITACIO',1),(5248,'PRESIDENTE PRUDENTE',1),(5249,'PRESIDENTE VENCESLAU',1),(5250,'PROMISSAO',1),(5251,'QUADRA',1),(5252,'QUATA',1),(5253,'QUEIROZ',1),(5254,'QUELUZ',1),(5255,'QUINTANA',1),(5256,'RAFARD',1),(5257,'RANCHARIA',1),(5258,'REDENCAO DA SERRA',1),(5259,'REGENTE FEIJO',1),(5260,'REGINOPOLIS',1),(5261,'REGISTRO',1),(5262,'RESTINGA',1),(5263,'RIBEIRA',1),(5264,'RIBEIRAO BONITO',1),(5265,'RIBEIRAO BRANCO',1),(5266,'RIBEIRAO CORRENTE',1),(5267,'RIBEIRAO DO SUL',1),(5268,'RIBEIRAO DOS INDIOS',1),(5269,'RIBEIRAO GRANDE',1),(5270,'RIBEIRAO PIRES',1),(5271,'RIBEIRAO PRETO',1),(5272,'RIFAINA',1),(5273,'RINCAO',1),(5274,'RINOPOLIS',1),(5275,'RIO CLARO',1),(5276,'RIO DAS PEDRAS',1),(5277,'RIO GRANDE DA SERRA',1),(5278,'RIOLANDIA',1),(5279,'RIVERSUL',1),(5280,'ROSANA',1),(5281,'ROSEIRA',1),(5282,'RUBIACEA',1),(5283,'RUBINEIA',1),(5284,'SABINO',1),(5285,'SAGRES',1),(5286,'SALES',1),(5287,'SALES OLIVEIRA',1),(5288,'SALESOPOLIS',1),(5289,'SALMORAO',1),(5290,'SALTINHO',1),(5291,'SALTO',1),(5292,'SALTO DE PIRAPORA',1),(5293,'SALTO GRANDE',1),(5294,'SANDOVALINA',1),(5295,'SANTA ADELIA',1),(5296,'SANTA ALBERTINA',1),(5297,'SANTA BARBARA DOESTE',1),(5298,'SANTA BRANCA',1),(5299,'SANTA CLARA DOESTE',1),(5300,'SANTA CRUZ DA CONCEICAO',1),(5301,'SANTA CRUZ DA ESPERANCA',1),(5302,'SANTA CRUZ DAS PALMEIRAS',1),(5303,'SANTA CRUZ DO RIO PARDO',1),(5304,'SANTA ERNESTINA',1),(5305,'SANTA FE DO SUL',1),(5306,'SANTA GERTRUDES',1),(5307,'SANTA ISABEL',1),(5308,'SANTA LUCIA',1),(5309,'SANTA MARIA DA SERRA',1),(5310,'SANTA MERCEDES',1),(5311,'SANTA RITA DO PASSA QUATRO',1),(5312,'SANTA RITA DOESTE',1),(5313,'SANTA ROSA DE VITERBO',1),(5314,'SANTA SALETE',1),(5315,'SANTANA DA PONTE PENSA',1),(5316,'SANTANA DE PARNAIBA',1),(5317,'SANTO ANASTACIO',1),(5318,'SANTO ANTONIO DA ALEGRIA',1),(5319,'SANTO ANTONIO DE POSSE',1),(5320,'SANTO ANTONIO DO ARACANGUA',1),(5321,'SANTO ANTONIO DO JARDIM',1),(5322,'SANTO ANTONIO DO PINHAL',1),(5323,'SANTO EXPEDITO',1),(5324,'SANTOPOLIS DO AGUAPEI',1),(5325,'SANTOS',1),(5326,'SAO BENTO DO SAPUCAI',1),(5327,'SAO BERNARDO DO CAMPO',1),(5328,'SAO CAETANO DO SUL',1),(5329,'SAO CARLOS',1),(5330,'SAO FRANCISCO',1),(5331,'SAO JOAO DA BOA VISTA',1),(5332,'SAO JOAO DAS DUAS PONTES',1),(5333,'SAO JOAO DE IRACEMA',1),(5334,'SAO JOAO DO PAU DALHO',1),(5335,'SAO JOAQUIM DA BARRA',1),(5336,'SAO JOSE DA BELA VISTA',1),(5337,'SAO JOSE DO BARREIRO',1),(5338,'SAO JOSE DO RIO PARDO',1),(5339,'SAO JOSE DO RIO PRETO',1),(5340,'SAO JOSE DOS CAMPOS',1),(5341,'SAO LOURENCO DA SERRA',1),(5342,'SAO LUIS DO PARAITINGA',1),(5343,'SAO MANUEL',1),(5344,'SAO MIGUEL ARCANJO',1),(5345,'SAO PEDRO',1),(5346,'SAO PEDRO DO TURVO',1),(5347,'SAO ROQUE',1),(5348,'SAO SEBASTIAO',1),(5349,'SAO SEBASTIAO DA GRAMA',1),(5350,'SAO SIMAO',1),(5351,'SAO VICENTE',1),(5352,'SARAPUI',1),(5353,'SARUTAIA',1),(5354,'SEBASTIANOPOLIS DO SUL',1),(5355,'SERRA AZUL',1),(5356,'SERRA NEGRA',1),(5357,'SERRANA',1),(5358,'SERTAOZINHO',1),(5359,'SETE BARRAS',1),(5360,'SEVERINIA',1),(5361,'SILVEIRAS',1),(5362,'SOCORRO',1),(5363,'SOROCABA',1),(5364,'SUD MENUCCI',1),(5365,'SUMARE',1),(5366,'SUZANAPOLIS',1),(5367,'SUZANO',1),(5368,'TABAPUA',1),(5369,'TABATINGA',1),(5370,'TABOAO DA SERRA',1),(5371,'TACIBA',1),(5372,'TAGUAI',1),(5373,'TAIACU',1),(5374,'TAIUVA',1),(5375,'TAMBAU',1),(5376,'TANABI',1),(5377,'TAPIRAI',1),(5378,'TAPIRATIBA',1),(5379,'TAQUARAL',1),(5380,'TAQUARITINGA',1),(5381,'TAQUARITUBA',1),(5382,'TAQUARIVAI',1),(5383,'TARABAI',1),(5384,'TARUMA',1),(5385,'TATUI',1),(5386,'TAUBATE',1),(5387,'TEJUPA',1),(5388,'TEODORO SAMPAIO',1),(5389,'TERRA ROXA',1),(5390,'TIETE',1),(5391,'TIMBURI',1),(5392,'TORRE DE PEDRA',1),(5393,'TORRINHA',1),(5394,'TRABIJU',1),(5395,'TREMEMBE',1),(5396,'TRES FRONTEIRAS',1),(5397,'TUIUTI',1),(5398,'TUPA',1),(5399,'TUPI PAULISTA',1),(5400,'TURIUBA',1),(5401,'TURMALINA',1),(5402,'UBARANA',1),(5403,'UBATUBA',1),(5404,'UBIRAJARA',1),(5405,'UCHOA',1),(5406,'UNIAO PAULISTA',1),(5407,'URANIA',1),(5408,'URU',1),(5409,'URUPES',1),(5410,'VALENTIM GENTIL',1),(5411,'VALINHOS',1),(5412,'VALPARAISO',1),(5413,'VARGEM',1),(5414,'VARGEM GRANDE DO SUL',1),(5415,'VARGEM GRANDE PAULISTA',1),(5416,'VARZEA PAULISTA',1),(5417,'VERA CRUZ',1),(5418,'VINHEDO',1),(5419,'VIRADOURO',1),(5420,'VISTA ALEGRE DO ALTO',1),(5421,'VITORIA BRASIL',1),(5422,'VOTORANTIM',1),(5423,'VOTUPORANGA',1),(5424,'ZACARIAS',1),(5425,'ABREULANDIA',13),(5426,'AGUIARNOPOLIS',13),(5427,'ALIANCA DO TOCANTINS',13),(5428,'ALMAS',13),(5429,'ALVORADA',13),(5430,'ANANAS',13),(5431,'ANGICO',13),(5432,'APARECIDA DO RIO NEGRO',13),(5433,'ARAGOMINAS',13),(5434,'ARAGUACEMA',13),(5435,'ARAGUACU',13),(5436,'ARAGUAINA',13),(5437,'ARAGUANA',13),(5438,'ARAGUATINS',13),(5439,'ARAPOEMA',13),(5440,'ARRAIAS',13),(5441,'AUGUSTINOPOLIS',13),(5442,'AURORA DO TOCANTINS',13),(5443,'AXIXA DO TOCANTINS',13),(5444,'BABACULANDIA',13),(5445,'BANDEIRANTES DO TOCANTINS',13),(5446,'BARRA DO OURO',13),(5447,'BARROLANDIA',13),(5448,'BERNARDO SAYAO',13),(5449,'BOM JESUS DO TOCANTINS',13),(5450,'BRASILANDIA DO TOCANTINS',13),(5451,'BREJINHO DE NAZARE',13),(5452,'BURITI DO TOCANTINS',13),(5453,'CACHOEIRINHA',13),(5454,'CAMPOS LINDOS',13),(5455,'CARIRI DO TOCANTINS',13),(5456,'CARMOLANDIA',13),(5457,'CARRASCO BONITO',13),(5458,'CASEARA',13),(5459,'CENTENARIO',13),(5460,'CHAPADA DA NATIVIDADE',13),(5461,'CHAPADA DE AREIA',13),(5462,'COLINAS DO TOCANTINS',13),(5463,'COLMEIA',13),(5464,'COMBINADO',13),(5465,'CONCEICAO DO TOCANTINS',13),(5466,'COUTO DE MAGALHAES',13),(5467,'CRISTALANDIA',13),(5468,'CRIXAS DO TOCANTINS',13),(5469,'DARCINOPOLIS',13),(5470,'DIANOPOLIS',13),(5471,'DIVINOPOLIS DO TOCANTINS',13),(5472,'DOIS IRMAOS DO TOCANTINS',13),(5473,'DUERE',13),(5474,'ESPERANTINA',13),(5475,'FATIMA',13),(5476,'FIGUEIROPOLIS',13),(5477,'FILADELFIA',13),(5478,'FORMOSO DO ARAGUAIA',13),(5479,'FORTALEZA DO TABOCAO',13),(5480,'GOIANORTE',13),(5481,'GOIATINS',13),(5482,'GUARAI',13),(5483,'GURUPI',13),(5484,'IPUEIRAS',13),(5485,'ITACAJA',13),(5486,'ITAGUATINS',13),(5487,'ITAPIRATINS',13),(5488,'ITAPORA DO TOCANTINS',13),(5489,'JAU DO TOCANTINS',13),(5490,'JUARINA',13),(5491,'LAGOA DA CONFUSAO',13),(5492,'LAGOA DO TOCANTINS',13),(5493,'LAJEADO',13),(5494,'LAVANDEIRA',13),(5495,'LIZARDA',13),(5496,'LUZINOPOLIS',13),(5497,'MARIANOPOLIS DO TOCANTINS',13),(5498,'MATEIROS',13),(5499,'MAURILANDIA DO TOCANTINS',13),(5500,'MIRACEMA DO TOCANTINS',13),(5501,'MIRANORTE',13),(5502,'MONTE DO CARMO',13),(5503,'MONTE SANTO DO TOCANTINS',13),(5504,'MURICILANDIA',13),(5505,'NATIVIDADE',13),(5506,'NAZARE',13),(5507,'NOVA OLINDA',13),(5508,'NOVA ROSALANDIA',13),(5509,'NOVO ACORDO',13),(5510,'NOVO ALEGRE',13),(5511,'NOVO JARDIM',13),(5512,'OLIVEIRA DE FATIMA',13),(5513,'PALMAS',13),(5514,'PALMEIRANTE',13),(5515,'PALMEIRAS DO TOCANTINS',13),(5516,'PALMEIROPOLIS',13),(5517,'PARAISO DO TOCANTINS',13),(5518,'PARANA',13),(5519,'PAU DARCO',13),(5520,'PEDRO AFONSO',13),(5521,'PEIXE',13),(5522,'PEQUIZEIRO',13),(5523,'PINDORAMA DO TOCANTINS',13),(5524,'PIRAQUE',13),(5525,'PIUM',13),(5526,'PONTE ALTA DO BOM JESUS',13),(5527,'PONTE ALTA DO TOCANTINS',13),(5528,'PORTO ALEGRE DO TOCANTINS',13),(5529,'PORTO NACIONAL',13),(5530,'PRAIA NORTE',13),(5531,'PRESIDENTE KENNEDY',13),(5532,'PUGMIL',13),(5533,'RECURSOLANDIA',13),(5534,'RIACHINHO',13),(5535,'RIO DA CONCEICAO',13),(5536,'RIO DOS BOIS',13),(5537,'RIO SONO',13),(5538,'SAMPAIO',13),(5539,'SANDOLANDIA',13),(5540,'SANTA FE DO ARAGUAIA',13),(5541,'SANTA MARIA DO TOCANTINS',13),(5542,'SANTA RITA DO TOCANTINS',13),(5543,'SANTA ROSA DO TOCANTINS',13),(5544,'SANTA TEREZA DO TOCANTINS',13),(5545,'SANTA TEREZINHA DO TOCANTINS',13),(5546,'SAO BENTO DO TOCANTINS',13),(5547,'SAO FELIX DO TOCANTINS',13),(5548,'SAO MIGUEL DO TOCANTINS',13),(5549,'SAO SALVADOR DO TOCANTINS',13),(5550,'SAO SEBASTIAO DO TOCANTINS',13),(5551,'SAO VALERIO DA NATIVIDADE',13),(5552,'SILVANOPOLIS',13),(5553,'SITIO NOVO DO TOCANTINS',13),(5554,'SUCUPIRA',13),(5555,'TAGUATINGA',13),(5556,'TAIPAS DO TOCANTINS',13),(5557,'TALISMA',13),(5558,'TOCANTINIA',13),(5559,'TOCANTINOPOLIS',13),(5560,'TUPIRAMA',13),(5561,'TUPIRATINS',13),(5562,'WANDERLANDIA',13),(5563,'XAMBIOA',13);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencia`
--

DROP TABLE IF EXISTS `ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocorrencia` (
  `id_ocorrencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_fim_ocorrencia` datetime DEFAULT NULL,
  `data_inicio_ocorrencia` datetime NOT NULL,
  `descricao_ocorrencia` varchar(255) DEFAULT NULL,
  `foto` longblob,
  `url_ocorrencia` varchar(255) DEFAULT NULL,
  `id_atividade` bigint(20) DEFAULT NULL,
  `id_classificacao_ocorrencia` bigint(20) NOT NULL,
  `id_evento` bigint(20) NOT NULL,
  `id_gravidade_ocorrencia` bigint(20) NOT NULL,
  `id_setor` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) NOT NULL,
  `id_tipo_classificacao` bigint(20) NOT NULL,
  `id_usuario_responsavel` bigint(20) NOT NULL,
  PRIMARY KEY (`id_ocorrencia`),
  KEY `FK_7krj0a0ke3cnu0756ru2ehrpq` (`id_atividade`),
  KEY `FK_sn2ddqu1a4h9srrlmvc0reiqn` (`id_classificacao_ocorrencia`),
  KEY `FK_lt9s0k80hsqr1qvyne7u0ho5v` (`id_evento`),
  KEY `FK_htmrmqu9eo007fvhoxbstym97` (`id_gravidade_ocorrencia`),
  KEY `FK_l5eawvm1rujyxpt43c8mw63yj` (`id_setor`),
  KEY `FK_afoup07ws4hgbm8eh610yqmli` (`id_status`),
  KEY `FK_jr0mgqfr26li5f4wbqgtb7asi` (`id_tipo_classificacao`),
  KEY `FK_bna3v87c1cue0w0hg0uo1u4tl` (`id_usuario_responsavel`),
  CONSTRAINT `FK_bna3v87c1cue0w0hg0uo1u4tl` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_7krj0a0ke3cnu0756ru2ehrpq` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`),
  CONSTRAINT `FK_afoup07ws4hgbm8eh610yqmli` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_htmrmqu9eo007fvhoxbstym97` FOREIGN KEY (`id_gravidade_ocorrencia`) REFERENCES `gravidade_ocorrencia` (`id_gravidade_ocorrencia`),
  CONSTRAINT `FK_jr0mgqfr26li5f4wbqgtb7asi` FOREIGN KEY (`id_tipo_classificacao`) REFERENCES `tipo_classificacao` (`id_tipo_classificacao`),
  CONSTRAINT `FK_l5eawvm1rujyxpt43c8mw63yj` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id_setor`),
  CONSTRAINT `FK_lt9s0k80hsqr1qvyne7u0ho5v` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `FK_sn2ddqu1a4h9srrlmvc0reiqn` FOREIGN KEY (`id_classificacao_ocorrencia`) REFERENCES `classificacao_ocorrencia` (`id_classificacao_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencia`
--

LOCK TABLES `ocorrencia` WRITE;
/*!40000 ALTER TABLE `ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_atividade`
--

DROP TABLE IF EXISTS `operacao_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_atividade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_hora_status` datetime NOT NULL,
  `justificativa` varchar(255) DEFAULT NULL,
  `id_atividade` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h4x093910bghw2dnd24hq2nh0` (`id_atividade`),
  KEY `FK_83tjjt63qe04qam6ce4asmcap` (`id_status`),
  KEY `FK_pbn34ta8geffq2pcdm9qjq6ln` (`id_usuario`),
  CONSTRAINT `FK_pbn34ta8geffq2pcdm9qjq6ln` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_83tjjt63qe04qam6ce4asmcap` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_h4x093910bghw2dnd24hq2nh0` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_atividade`
--

LOCK TABLES `operacao_atividade` WRITE;
/*!40000 ALTER TABLE `operacao_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacao_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_atividade_ocorrencia`
--

DROP TABLE IF EXISTS `operacao_atividade_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_atividade_ocorrencia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_hora_status` datetime NOT NULL,
  `justificativa` varchar(255) DEFAULT NULL,
  `id_atividade` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rviqqelsdb4gwp5itdgqxat3q` (`id_atividade`),
  KEY `FK_6p7a3tkdh6p35a9obpmn1qd4l` (`id_status`),
  KEY `FK_al9g3j83sprdqdyglgk4bbuon` (`id_usuario`),
  CONSTRAINT `FK_al9g3j83sprdqdyglgk4bbuon` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_6p7a3tkdh6p35a9obpmn1qd4l` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_rviqqelsdb4gwp5itdgqxat3q` FOREIGN KEY (`id_atividade`) REFERENCES `atividade_ocorrencia` (`id_atividade_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_atividade_ocorrencia`
--

LOCK TABLES `operacao_atividade_ocorrencia` WRITE;
/*!40000 ALTER TABLE `operacao_atividade_ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacao_atividade_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_checklist`
--

DROP TABLE IF EXISTS `operacao_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_checklist` (
  `id_operacao_checklist` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `data_hora_status` datetime NOT NULL,
  `justificativa` varchar(255) DEFAULT NULL,
  `id_checklist` bigint(20) DEFAULT NULL,
  `id_status` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_operacao_checklist`),
  KEY `FK_mlw052u3uw84lfdr1uu6x4hce` (`id_checklist`),
  KEY `FK_529k3wgfope86qdnm0fl0sevn` (`id_status`),
  KEY `FK_p1pxwis1o9q7h288pmtcps12e` (`id_usuario`),
  CONSTRAINT `FK_p1pxwis1o9q7h288pmtcps12e` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_529k3wgfope86qdnm0fl0sevn` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FK_mlw052u3uw84lfdr1uu6x4hce` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id_checklist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_checklist`
--

LOCK TABLES `operacao_checklist` WRITE;
/*!40000 ALTER TABLE `operacao_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacao_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id_pais` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_pais` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Brasil');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id_perfil` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao_perfil` varchar(255) DEFAULT NULL,
  `nome_perfil` varchar(255) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administra o sistema','Administrador'),(2,'Gerencia o processo','Gerente'),(3,'Opera o sistema','Operador Padr√£o'),(4,'Verifica o processo','Supervisor'),(5,'Acesso executivo somente para consultas','Diretor'),(6,'Opera em lugar do Operador Padr√£o','Operador Master');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pergunta` (
  `id_pergunta` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `descricao_pergunta` varchar(255) NOT NULL,
  `quantidade_vezes` int(11) NOT NULL,
  `resposta_multipla` tinyint(1) NOT NULL,
  `resposta_obrigatoria` tinyint(1) NOT NULL,
  `tipo_pergunta` varchar(255) NOT NULL,
  `tipo_pontuacao` tinyint(1) NOT NULL,
  `id_topico` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_pergunta`),
  KEY `FK_t62evfder183ls9cn5ebumlgn` (`id_topico`),
  CONSTRAINT `FK_t62evfder183ls9cn5ebumlgn` FOREIGN KEY (`id_topico`) REFERENCES `topico` (`id_topico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta`
--

LOCK TABLES `pergunta` WRITE;
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id_pessoa` bigint(20) NOT NULL AUTO_INCREMENT,
  `apelido` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `cpf_pessoa` varchar(255) NOT NULL,
  `data_nascimento` datetime NOT NULL,
  `data_ultima_alteracao` datetime NOT NULL,
  `foto` longblob,
  `nome_pessoa` varchar(255) NOT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `nome_pai` varchar(255) DEFAULT NULL,
  `rg_pessoa` varchar(255) NOT NULL,
  `string_face` longblob,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_genero` bigint(20) DEFAULT NULL,
  `id_tipo_pessoa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `UK_3lb6wel3tya8r05sylumm478y` (`cpf_pessoa`),
  KEY `FK_q864jsfso3uxmxgebw5a9ccrq` (`id_cliente`),
  KEY `FK_1374ht7uo7fmwt6u4ydyyq6op` (`id_genero`),
  KEY `FK_ovdiscw3uf8495i4nb1hvlgse` (`id_tipo_pessoa`),
  CONSTRAINT `FK_ovdiscw3uf8495i4nb1hvlgse` FOREIGN KEY (`id_tipo_pessoa`) REFERENCES `tipo_pessoa` (`id_tipo_pessoa`),
  CONSTRAINT `FK_1374ht7uo7fmwt6u4ydyyq6op` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `FK_q864jsfso3uxmxgebw5a9ccrq` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Administrador',1,'111.111.111-11','1900-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Administrador','Administrador','Administrador','11.111.111-1',NULL,NULL,NULL,1),(2,'Sidney',1,'596.278.919-91','1968-08-25 00:00:00','2014-12-17 09:52:08',NULL,'Sidney Samitsu da Silva','M√£e','Pai','18.740.470-7',NULL,NULL,NULL,1),(3,'Apelido',1,'111.222.333-44','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Marcus Sandin','M√£e','Pai','11.222.333-4',NULL,NULL,NULL,1),(4,'Apelido',1,'163.527.038-36','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Ederson Juliano','M√£e','Pai','11.222.333-4',NULL,NULL,NULL,1),(5,'Apelido',1,'281.038.128-38','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Alexandre Takashi','M√£e','Pai','11.222.333-4',NULL,NULL,NULL,1),(6,'Apelido',1,'305.898.098-14','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Eduardo de Abreu','M√£e','Pai','44.444.444-4',NULL,NULL,NULL,1),(7,'Apelido',1,'111.111.111-22','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Operador Padr√£o','M√£e','Pai','11.111.111-2',NULL,NULL,NULL,1),(8,'Apelido',1,'222.222.222-22','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Operador Master','M√£e','Pai','22.222.222-2',NULL,NULL,NULL,1),(9,'Apelido',1,'442.614.378-05','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Leonardo Cohen','M√£e','Pai','66.666.666-6',NULL,NULL,NULL,1),(10,'Apelido',1,'999.999.999-99','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Luiz Fernando Amorim','M√£e','Pai','99.999.999-9',NULL,NULL,NULL,1),(11,'Apelido',1,'999.999.999-98','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Wesley de Carvalho Xavier','M√£e','Pai','99.999.999-8',NULL,NULL,NULL,1),(12,'Apelido',1,'999.999.999-97','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Operador Belfort','M√£e','Pai','99.999.999-7',NULL,NULL,NULL,1),(13,'Apelido',1,'354.911.648-95','2000-01-01 00:00:00','2014-12-17 09:52:08',NULL,'Anderson Torres','M√£e','Pai','66.666.666-6',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto_servico`
--

DROP TABLE IF EXISTS `posto_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posto_servico` (
  `id_posto_servico` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `celular_responsavel` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `email_responsavel` varchar(255) DEFAULT NULL,
  `nome_posto_servico` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `responsavel_setor` varchar(255) DEFAULT NULL,
  `telefone_posto_servico` varchar(255) DEFAULT NULL,
  `telefone_responsavel` varchar(255) DEFAULT NULL,
  `id_setor` bigint(20) NOT NULL,
  `id_tipo_servico` bigint(20) NOT NULL,
  PRIMARY KEY (`id_posto_servico`),
  KEY `FK_n283ta845c8fiaau89la651j0` (`id_setor`),
  KEY `FK_anitgin9d2nk1jnmlt2968jf9` (`id_tipo_servico`),
  CONSTRAINT `FK_anitgin9d2nk1jnmlt2968jf9` FOREIGN KEY (`id_tipo_servico`) REFERENCES `tipo_servico` (`id_tipo_servico`),
  CONSTRAINT `FK_n283ta845c8fiaau89la651j0` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto_servico`
--

LOCK TABLES `posto_servico` WRITE;
/*!40000 ALTER TABLE `posto_servico` DISABLE KEYS */;
INSERT INTO `posto_servico` VALUES (1,1,'(21) 92014-2014','-22.913885','-43.2304856','kobel@kobel.com.br','Ambul√¢ncia',NULL,'Jos√© Jo√£o da Silva','(11) 2014-2014','(11) 2014-2014',3,1),(2,1,'(21) 92014-2014','-22.911724','-43.231047','kobel@kobel.com.br','Bombeiro',NULL,'Jos√© Jo√£o da Silva','(11) 2014-2014','(11) 2014-2014',3,4),(3,1,'(21) 92014-2014','-22.913303','-43.228855','kobel@kobel.com.br','Policia Militar',NULL,'Jos√© Jo√£o da Silva','(11) 2014-2014','(11) 2014-2014',3,2);
/*!40000 ALTER TABLE `posto_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimento`
--

DROP TABLE IF EXISTS `procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimento` (
  `id_procedimento` bigint(20) NOT NULL AUTO_INCREMENT,
  `campo_check` tinyint(1) NOT NULL,
  `descricao_procedimento` varchar(255) DEFAULT NULL,
  `mandatorio` tinyint(1) NOT NULL,
  `nome_procedimento` varchar(255) NOT NULL,
  `tempo_exec_estimado` int(11) NOT NULL,
  `tempo_toler_antecipado` int(11) DEFAULT NULL,
  `tempo_toler_fim` int(11) NOT NULL,
  `tempo_toler_inicio` int(11) NOT NULL,
  `id_formulario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_procedimento`),
  KEY `FK_68yjbxv7doohh0dbtr0m9evq4` (`id_formulario`),
  CONSTRAINT `FK_68yjbxv7doohh0dbtr0m9evq4` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id_formulario`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimento`
--

LOCK TABLES `procedimento` WRITE;
/*!40000 ALTER TABLE `procedimento` DISABLE KEYS */;
INSERT INTO `procedimento` VALUES (1,0,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',0,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada (detalhamento e recomenda√ß√µes gerais)',10,5,5,5,NULL),(2,0,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',0,'Revista do turno de 12:00hs dos agentes de seguran√ßa privada (Stewards).  Biometria da DPF',60,5,5,5,NULL),(3,0,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',0,'In√≠cio do turno dos Agentes de Seguran√ßa Privada no posto previsto no MD (12 horas)',720,5,5,5,NULL),(4,0,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',0,'In√≠cio das atividades de seguran√ßa p√∫blica e Defesa (Conforme planejamento pr√≥prio das institui√ß√µes)',10,5,5,5,NULL),(5,0,'Varredura antibombas (VVIP)',0,'Varredura antibombas (VVIP)',120,5,5,5,NULL),(6,0,'T√©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)',0,'T√©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,5,NULL),(7,0,'In√≠cio das atividades dos Postos de Verifica√ß√£o Veicular - PVVs (AF Transportes)',0,'In√≠cio das atividades dos Postos de Verifica√ß√£o Veicular - PVVs (AF Transportes)',15,5,5,5,NULL),(8,0,'Ativa√ß√£o das Zonas de Credenciamento (Zonas 1 a 9)',0,'Ativa√ß√£o das Zonas de Credenciamento (Zonas 1 a 9)',15,5,5,5,NULL),(9,0,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada do turno de 08 horas',0,'Reuni√£o da GSS com os Coordenadores e Supervisores da empresa de seguran√ßa privada do turno de 08 horas',10,5,5,5,NULL),(10,0,'Revista do turno de 08:00h de seguran√ßa privada (Stewards). Biometria da DPF',0,'Revista do turno de 08:00h de seguran√ßa privada (Stewards). Biometria da DPF',60,5,5,5,NULL),(11,1,' Posto de ronda 1',0,'Posto de ronda 1',30,5,5,5,NULL),(12,1,' Posto de ronda 2',0,'Posto de ronda 2',30,5,5,5,NULL),(13,1,' Posto de ronda 3',0,'Posto de ronda 3',30,5,5,5,NULL),(14,1,' Posto de ronda 4',0,'Posto de ronda 4',30,5,5,5,NULL),(15,0,'Procedimento 1',0,'Procedimento 1',0,0,0,0,NULL),(16,0,'Procedimento 2',0,'Procedimento 2',0,0,0,0,NULL),(17,0,'Procedimento 3',0,'Procedimento 3',0,0,0,0,NULL),(18,0,'Liberar area ap√≥s servi√ßo prestado',0,'Liberar area ap√≥s servi√ßo prestado',0,0,0,0,NULL),(19,0,'Acionar Bombeiros e Ambul√¢ncia pessoalmente',0,'Acionar Bombeiros e Ambul√¢ncia pessoalmente',0,0,0,0,NULL),(20,0,'Acionar Bombeiros e Ambul√¢ncia por r√°dio',0,'Acionar Bombeiros e Ambul√¢ncia por r√°dio',0,0,0,0,NULL),(21,0,'Anotar dados dos envolvidos manualmente',0,'Anotar dados dos envolvidos manualmente',0,0,0,0,NULL),(22,0,'Cadastrar envolvidos na Blacklist do Sistema',0,'Cadastrar envolvidos na Blacklist do Sistema',0,0,0,0,NULL),(23,0,'Liberar a area ap√≥s a deten√ß√£o',0,'Liberar a area ap√≥s a deten√ß√£o',0,0,0,0,NULL),(24,0,'Entregar detentos a pol√≠cia',0,'Entregar detentos a pol√≠cia',0,0,0,0,NULL),(25,0,'Chamar a pol√≠cia para ajudar a deter os envolvidos na briga',0,'Chamar a pol√≠cia para ajudar a deter os envolvidos na briga',0,0,0,0,NULL),(26,0,'Deter os envolvidos na briga',0,'Deter os envolvidos na briga',0,0,0,0,NULL),(27,0,'Chamar refor√ßos para retirar as pessoas do local',0,'Chamar refor√ßos para retirar as pessoas do local',0,0,0,0,NULL),(28,0,'Retirar as pessoas do local',0,'Retirar as pessoas do local',0,0,0,0,NULL),(29,0,'Chamar refor√ßos para isolar a area',0,'Chamar refor√ßos para isolar a area',0,0,0,0,NULL),(30,0,'Isolar a area',0,'Isolar a area',0,0,0,0,NULL),(31,0,'Acionar pol√≠cia local pessoalmente',0,'Acionar pol√≠cia local pessoalmente',0,0,0,0,NULL),(32,0,'Acionar pol√≠cia local por r√°dio',0,'Acionar pol√≠cia local por r√°dio',0,0,0,0,NULL);
/*!40000 ALTER TABLE `procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimento_mensagem`
--

DROP TABLE IF EXISTS `procedimento_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimento_mensagem` (
  `id_prc_mgs` bigint(20) NOT NULL AUTO_INCREMENT,
  `tempo_escala` int(11) NOT NULL,
  `id_mensagem` bigint(20) DEFAULT NULL,
  `id_procedimento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_prc_mgs`),
  KEY `FK_t147hpftolmyptwkpssp5csak` (`id_mensagem`),
  KEY `FK_cshxoavutrhcobrqw2q249rmo` (`id_procedimento`),
  CONSTRAINT `FK_cshxoavutrhcobrqw2q249rmo` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`),
  CONSTRAINT `FK_t147hpftolmyptwkpssp5csak` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimento_mensagem`
--

LOCK TABLES `procedimento_mensagem` WRITE;
/*!40000 ALTER TABLE `procedimento_mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedimento_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamento`
--

DROP TABLE IF EXISTS `rastreamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastreamento` (
  `id_rastreamento` int(11) NOT NULL AUTO_INCREMENT,
  `Ativo` tinyint(1) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `data_fim_rastreamento` datetime DEFAULT NULL,
  `data_inicio_rastreamento` datetime DEFAULT NULL,
  `Rastreamento_por_Rota` tinyint(1) DEFAULT NULL,
  `TempoRastreamento` datetime DEFAULT NULL,
  `id_pessoa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_rastreamento`),
  KEY `FK_94f7egbovaoa6fufv6n1g6yhm` (`id_pessoa`),
  CONSTRAINT `FK_94f7egbovaoa6fufv6n1g6yhm` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamento`
--

LOCK TABLES `rastreamento` WRITE;
/*!40000 ALTER TABLE `rastreamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamento_usuario`
--

DROP TABLE IF EXISTS `rastreamento_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastreamento_usuario` (
  `id_rastreamento_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `data_hora_rastreamento` datetime NOT NULL,
  `id_agnd_rast_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_rastreamento_usuario`),
  KEY `FK_h4unqoqxl28p1qpy1ldobej8p` (`id_agnd_rast_usuario`),
  CONSTRAINT `FK_h4unqoqxl28p1qpy1ldobej8p` FOREIGN KEY (`id_agnd_rast_usuario`) REFERENCES `agendamento_rastreamento_usuario` (`id_agn_rast_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamento_usuario`
--

LOCK TABLES `rastreamento_usuario` WRITE;
/*!40000 ALTER TABLE `rastreamento_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreamento_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamento_veiculo`
--

DROP TABLE IF EXISTS `rastreamento_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastreamento_veiculo` (
  `id_rastreamento_veiculo` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `data_hora_rastreamento` datetime NOT NULL,
  `id_agnd_rast_veiculo` bigint(20) NOT NULL,
  PRIMARY KEY (`id_rastreamento_veiculo`),
  KEY `FK_mjkdvcf4558t7its6nwu2ayf9` (`id_agnd_rast_veiculo`),
  CONSTRAINT `FK_mjkdvcf4558t7its6nwu2ayf9` FOREIGN KEY (`id_agnd_rast_veiculo`) REFERENCES `agendamento_rastreamento_veiculo` (`id_agn_rast_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamento_veiculo`
--

LOCK TABLES `rastreamento_veiculo` WRITE;
/*!40000 ALTER TABLE `rastreamento_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreamento_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastrear_online`
--

DROP TABLE IF EXISTS `rastrear_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastrear_online` (
  `IdRastrearOnLine` int(11) NOT NULL AUTO_INCREMENT,
  `DtHrOnLine` datetime NOT NULL,
  `Latitude` varchar(255) DEFAULT NULL,
  `Longitude` varchar(255) DEFAULT NULL,
  `IdPessoa` bigint(20) DEFAULT NULL,
  `IdRastreamento` int(11) NOT NULL,
  PRIMARY KEY (`IdRastrearOnLine`),
  KEY `FK_49eg7nunb9w2pckky395a02ou` (`IdPessoa`),
  KEY `FK_nd974qfhqjqm6toduub2enq56` (`IdRastreamento`),
  CONSTRAINT `FK_nd974qfhqjqm6toduub2enq56` FOREIGN KEY (`IdRastreamento`) REFERENCES `rastreamento` (`id_rastreamento`),
  CONSTRAINT `FK_49eg7nunb9w2pckky395a02ou` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastrear_online`
--

LOCK TABLES `rastrear_online` WRITE;
/*!40000 ALTER TABLE `rastrear_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastrear_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regeracao_senha`
--

DROP TABLE IF EXISTS `regeracao_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regeracao_senha` (
  `id_regeracao_senha` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_encerramento` datetime DEFAULT NULL,
  `data_solicitacao` datetime NOT NULL,
  `data_tentativa` datetime DEFAULT NULL,
  `expirado` tinyint(1) NOT NULL,
  `hash_validacao` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_regeracao_senha`),
  KEY `FK_6btpjbtyin4cu71hubow70ff4` (`id_usuario`),
  CONSTRAINT `FK_6btpjbtyin4cu71hubow70ff4` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regeracao_senha`
--

LOCK TABLES `regeracao_senha` WRITE;
/*!40000 ALTER TABLE `regeracao_senha` DISABLE KEYS */;
/*!40000 ALTER TABLE `regeracao_senha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regra`
--

DROP TABLE IF EXISTS `regra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regra` (
  `id_regra` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `nome_regra` varchar(255) NOT NULL,
  PRIMARY KEY (`id_regra`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra`
--

LOCK TABLES `regra` WRITE;
/*!40000 ALTER TABLE `regra` DISABLE KEYS */;
INSERT INTO `regra` VALUES (1,1,'incluir_contratante'),(2,1,'alterar_contratante'),(3,1,'excluir_contratante'),(4,1,'consulta_contratante'),(5,1,'incluir_cliente'),(6,1,'alterar_cliente'),(7,1,'excluir_cliente'),(8,1,'consulta_cliente'),(9,1,'incluir_local'),(10,1,'alterar_local'),(11,1,'excluir_local'),(12,1,'consulta_local'),(13,1,'incluir_evento'),(14,1,'alterar_evento'),(15,1,'excluir_evento'),(16,1,'consulta_evento'),(17,1,'incluir_funcionario'),(18,1,'alterar_funcionario'),(19,1,'excluir_funcionario'),(20,1,'consulta_funcionario'),(21,1,'config_checklist'),(22,1,'incluir_equipamento'),(23,1,'alterar_equipamento'),(24,1,'excluir_equipamento'),(25,1,'consulta_equipamento'),(26,1,'incluir_posto'),(27,1,'alterar_posto'),(28,1,'excluir_posto'),(29,1,'consulta_posto'),(30,1,'incluir_setor'),(31,1,'alterar_setor'),(32,1,'excluir_setor'),(33,1,'consulta_setor'),(34,1,'incluir_perfil'),(35,1,'alterar_perfil'),(36,1,'excluir_perfil'),(37,1,'consulta_perfil'),(38,1,'incluir_usuario'),(39,1,'alterar_usuario'),(40,1,'excluir_usuario'),(41,1,'consulta_usuario'),(42,1,'trocar_senha'),(43,1,'incluir_cargo'),(44,1,'alterar_cargo'),(45,1,'excluir_cargo'),(46,1,'consulta_cargo'),(47,1,'checklist_procedimento'),(48,1,'incluir_checklistp'),(49,1,'alterar_checklistp'),(50,1,'excluir_checklistp'),(51,1,'consulta_checklistp'),(52,1,'incluir_classificacao'),(53,1,'alterar_classificacao'),(54,1,'excluir_classificacao'),(55,1,'consulta_classificacao'),(56,1,'incluir_procedimento'),(57,1,'alterar_procedimento'),(58,1,'excluir_procedimento'),(59,1,'consulta_procedimento'),(60,1,'incluir_departamento'),(61,1,'alterar_departamento'),(62,1,'excluir_departamento'),(63,1,'consulta_departamento'),(64,1,'incluir_estado'),(65,1,'alterar_estado'),(66,1,'excluir_estado'),(67,1,'consulta_estado'),(68,1,'formulario'),(69,1,'incluir_formulario'),(70,1,'alterar_formulario'),(71,1,'excluir_formulario'),(72,1,'consulta_formulario'),(73,1,'incluir_pergunta'),(74,1,'alterar_pergunta'),(75,1,'excluir_pergunta'),(76,1,'consulta_pergunta'),(77,1,'incluir_topico'),(78,1,'alterar_topico'),(79,1,'excluir_topico'),(80,1,'consulta_topico'),(81,1,'incluir_fornecedor'),(82,1,'alterar_fornecedor'),(83,1,'excluir_fornecedor'),(84,1,'consulta_fornecedor'),(85,1,'incluir_gravidade'),(86,1,'alterar_gravidade'),(87,1,'excluir_gravidade'),(88,1,'consulta_gravidade'),(89,1,'incluir_grupo'),(90,1,'alterar_grupo'),(91,1,'excluir_grupo'),(92,1,'consulta_grupo'),(93,1,'incluir_mensagem'),(94,1,'alterar_mensagem'),(95,1,'excluir_mensagem'),(96,1,'consulta_mensagem'),(97,1,'incluir_menu'),(98,1,'alterar_menu'),(99,1,'excluir_menu'),(100,1,'consulta_menu'),(101,1,'incluir_modeloequipamento'),(102,1,'alterar_modeloequipamento'),(103,1,'excluir_modeloequipamento'),(104,1,'consulta_modeloequipamento'),(105,1,'incluir_municipio'),(106,1,'alterar_municipio'),(107,1,'excluir_municipio'),(108,1,'consulta_municipio'),(109,1,'incluir_pais'),(110,1,'alterar_pais'),(111,1,'excluir_pais'),(112,1,'consulta_pais'),(113,1,'incluir_status'),(114,1,'alterar_status'),(115,1,'excluir_status'),(116,1,'consulta_status'),(117,1,'incluir_telefones'),(118,1,'alterar_telefones'),(119,1,'excluir_telefones'),(120,1,'consulta_telefones'),(121,1,'incluir_turno'),(122,1,'alterar_turno'),(123,1,'excluir_turno'),(124,1,'consulta_turno'),(125,1,'outras_tabelas'),(126,1,'incluir_tpendereco'),(127,1,'alterar_tpendereco'),(128,1,'excluir_tpendereco'),(129,1,'consulta_tpendereco'),(130,1,'incluir_tpenvio'),(131,1,'alterar_tpenvio'),(132,1,'excluir_tpenvio'),(133,1,'consulta_tpenvio'),(134,1,'incluir_tpequipamento'),(135,1,'alterar_tpequipamento'),(136,1,'excluir_tpequipamento'),(137,1,'consulta_tpequipamento'),(138,1,'incluir_tpusuario'),(139,1,'alterar_tpusuario'),(140,1,'excluir_tpusuario'),(141,1,'consulta_tpusuario'),(142,1,'incluir_tpmensagem'),(143,1,'alterar_tpmensagem'),(144,1,'excluir_tpmensagem'),(145,1,'consulta_tpmensagem'),(146,1,'incluir_tpclassificacao'),(147,1,'alterar_tpclassificacao'),(148,1,'excluir_tpclassificacao'),(149,1,'consulta_tpclassificacao'),(150,1,'incluir_tppessoa'),(151,1,'alterar_tppessoa'),(152,1,'excluir_tppessoa'),(153,1,'consulta_tppessoa'),(154,1,'incluir_tpservico'),(155,1,'alterar_tpservico'),(156,1,'excluir_tpservico'),(157,1,'consulta_tpservico'),(158,1,'incluir_tptelefone'),(159,1,'alterar_tptelefone'),(160,1,'excluir_tptelefone'),(161,1,'consulta_tptelefone'),(162,1,'incluir_genero'),(163,1,'alterar_genero'),(164,1,'excluir_genero'),(165,1,'consulta_genero'),(166,1,'incluir_pessoa'),(167,1,'alterar_pessoa'),(168,1,'excluir_pessoa'),(169,1,'consulta_pessoa'),(170,1,'incluir_bloqueiopessoa'),(171,1,'alterar_bloqueiopessoa'),(172,1,'excluir_bloqueiopessoa'),(173,1,'consulta_bloqueiopessoa'),(174,1,'incluir_veiculo'),(175,1,'alterar_veiculo'),(176,1,'excluir_veiculo'),(177,1,'consulta_veiculo'),(178,1,'incluir_bloqueioveiculo'),(179,1,'alterar_bloqueioveiculo'),(180,1,'excluir_bloqueioveiculo'),(181,1,'consulta_bloqueioveiculo'),(182,1,'liberar_acesso'),(183,1,'cadastro_ocorrencia'),(184,1,'operacao_ocorrencia'),(185,1,'visualizar_ocorr_mapa'),(186,1,'operacao_checklist'),(187,1,'visualizar_check_mapa'),(188,1,'cameras'),(189,1,'lista_cameras'),(190,1,'cameras_mapa'),(191,1,'recuperar_imagem'),(192,1,'incluir_cad_pessoa_rastreamento'),(193,1,'alterar_cad_pessoa_rastreamento'),(194,1,'excluir_cad_pessoa_rastreamento'),(195,1,'consulta_cad_pessoa_rastreamento'),(196,1,'incluir_cad_veiculo_rastreamento'),(197,1,'alterar_cad_veiculo_rastreamento'),(198,1,'excluir_cad_veiculo_rastreamento'),(199,1,'consulta_cad_veiculo_rastreamento'),(200,1,'incluir_cad_rota_rastreamento'),(201,1,'alterar_cad_rota_rastreamento'),(202,1,'excluir_cad_rota_rastreamento'),(203,1,'consulta_cad_rota_rastreamento'),(204,1,'rastreamento'),(205,1,'rastreamento_aleatorio'),(206,1,'rastreamento_rota'),(207,1,'rastreamento_checklist'),(208,1,'relatorio_checklist'),(209,1,'dashboard_checklist'),(210,1,'dashboard_ocorrencia'),(211,1,'relatorio_ocorrencia'),(212,1,'ordem_servico'),(213,1,'os_seguranca'),(214,1,'os_servico'),(215,1,'os_limpeza'),(216,1,'os_resposta_semelhante'),(217,1,'telefones_uteis'),(218,1,'incluir_perfil'),(219,1,'alterar_perfil'),(220,1,'excluir_perfil'),(221,1,'consulta_perfil'),(222,1,'incluir_tpusuario'),(223,1,'alterar_tpusuario'),(224,1,'excluir_tpusuario'),(225,1,'consulta_tpusuario');
/*!40000 ALTER TABLE `regra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regra_menu`
--

DROP TABLE IF EXISTS `regra_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regra_menu` (
  `id_regra` bigint(20) NOT NULL,
  `id_menu` bigint(20) NOT NULL,
  PRIMARY KEY (`id_regra`,`id_menu`),
  KEY `FK_68hntjj767vc2kcq5q3lr6961` (`id_menu`),
  KEY `FK_ej4a539ysaa9jt0pmvi3sdyii` (`id_regra`),
  CONSTRAINT `FK_ej4a539ysaa9jt0pmvi3sdyii` FOREIGN KEY (`id_regra`) REFERENCES `regra` (`id_regra`),
  CONSTRAINT `FK_68hntjj767vc2kcq5q3lr6961` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_menu`
--

LOCK TABLES `regra_menu` WRITE;
/*!40000 ALTER TABLE `regra_menu` DISABLE KEYS */;
INSERT INTO `regra_menu` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,2),(34,2),(35,2),(36,2),(37,2),(218,2),(219,2),(220,2),(221,2),(17,3),(18,3),(19,3),(20,3),(38,3),(39,3),(40,3),(41,3),(42,3),(166,3),(167,3),(168,3),(169,3),(43,4),(44,4),(45,4),(46,4),(47,4),(48,4),(49,4),(50,4),(51,4),(52,4),(53,4),(54,4),(55,4),(56,4),(57,4),(58,4),(59,4),(60,4),(61,4),(62,4),(63,4),(64,4),(65,4),(66,4),(67,4),(68,4),(69,4),(70,4),(71,4),(72,4),(73,4),(74,4),(75,4),(76,4),(77,4),(78,4),(79,4),(80,4),(81,4),(82,4),(83,4),(84,4),(85,4),(86,4),(87,4),(88,4),(89,4),(90,4),(91,4),(92,4),(93,4),(94,4),(95,4),(96,4),(97,4),(98,4),(99,4),(100,4),(101,4),(102,4),(103,4),(104,4),(105,4),(106,4),(107,4),(108,4),(109,4),(110,4),(111,4),(112,4),(113,4),(114,4),(115,4),(116,4),(117,4),(118,4),(119,4),(120,4),(121,4),(122,4),(123,4),(124,4),(125,4),(126,4),(127,4),(128,4),(129,4),(130,4),(131,4),(132,4),(133,4),(134,4),(135,4),(136,4),(137,4),(138,4),(139,4),(140,4),(141,4),(142,4),(143,4),(144,4),(145,4),(146,4),(147,4),(148,4),(149,4),(150,4),(151,4),(152,4),(153,4),(154,4),(155,4),(156,4),(157,4),(158,4),(159,4),(160,4),(161,4),(162,4),(163,4),(164,4),(165,4),(222,4),(223,4),(224,4),(225,4),(170,5),(171,5),(172,5),(173,5),(174,5),(175,5),(176,5),(177,5),(178,5),(179,5),(180,5),(181,5),(182,5),(183,6),(184,6),(185,6),(186,7),(187,7),(188,8),(189,8),(190,8),(191,8),(192,9),(193,9),(194,9),(195,9),(196,9),(197,9),(198,9),(199,9),(200,9),(201,9),(202,9),(203,9),(204,9),(205,9),(206,9),(207,9),(208,10),(209,10),(210,10),(211,10),(212,10),(213,10),(214,10),(215,10),(216,10),(217,11),(1,16),(2,16),(3,16),(4,16),(5,17),(6,17),(7,17),(8,17),(9,18),(10,18),(11,18),(12,18),(13,19),(14,19),(15,19),(16,19),(17,20),(18,20),(19,20),(20,20),(21,21),(22,22),(23,22),(24,22),(25,22),(26,23),(27,23),(28,23),(29,23),(30,24),(31,24),(32,24),(33,24),(34,25),(35,25),(36,25),(37,25),(38,26),(39,26),(40,26),(41,26),(42,27),(43,28),(44,28),(45,28),(46,28),(47,29),(48,29),(49,29),(50,29),(51,29),(52,29),(53,29),(54,29),(55,29),(56,29),(57,29),(58,29),(59,29),(48,30),(49,30),(50,30),(51,30),(52,31),(53,31),(54,31),(55,31),(56,32),(57,32),(58,32),(59,32),(60,33),(61,33),(62,33),(63,33),(64,34),(65,34),(66,34),(67,34),(68,35),(69,35),(70,35),(71,35),(72,35),(73,35),(74,35),(75,35),(76,35),(77,35),(78,35),(79,35),(80,35),(69,36),(70,36),(71,36),(72,36),(73,37),(74,37),(75,37),(76,37),(77,38),(78,38),(79,38),(80,38),(81,39),(82,39),(83,39),(84,39),(85,40),(86,40),(87,40),(88,40),(89,41),(90,41),(91,41),(92,41),(93,42),(94,42),(95,42),(96,42),(97,43),(98,43),(99,43),(100,43),(101,44),(102,44),(103,44),(104,44),(105,45),(106,45),(107,45),(108,45),(109,46),(110,46),(111,46),(112,46),(113,48),(114,48),(115,48),(116,48),(117,49),(118,49),(119,49),(120,49),(121,50),(122,50),(123,50),(124,50),(125,51),(126,51),(127,51),(128,51),(129,51),(130,51),(131,51),(132,51),(133,51),(134,51),(135,51),(136,51),(137,51),(138,51),(139,51),(140,51),(141,51),(142,51),(143,51),(144,51),(145,51),(146,51),(147,51),(148,51),(149,51),(150,51),(151,51),(152,51),(153,51),(154,51),(155,51),(156,51),(157,51),(158,51),(159,51),(160,51),(161,51),(126,52),(127,52),(128,52),(129,52),(130,53),(131,53),(132,53),(133,53),(134,54),(135,54),(136,54),(137,54),(138,55),(139,55),(140,55),(141,55),(142,56),(143,56),(144,56),(145,56),(146,57),(147,57),(148,57),(149,57),(150,58),(151,58),(152,58),(153,58),(154,59),(155,59),(156,59),(157,59),(158,60),(159,60),(160,60),(161,60),(162,61),(163,61),(164,61),(165,61),(166,62),(167,62),(168,62),(169,62),(170,63),(171,63),(172,63),(173,63),(174,64),(175,64),(176,64),(177,64),(178,65),(179,65),(180,65),(181,65),(182,66),(183,67),(184,68),(185,69),(186,70),(187,71),(188,72),(189,72),(190,72),(189,73),(190,74),(191,75),(192,76),(193,76),(194,76),(195,76),(196,77),(197,77),(198,77),(199,77),(200,78),(201,78),(202,78),(203,78),(204,79),(205,79),(206,79),(207,79),(205,80),(206,81),(207,82),(208,83),(209,84),(210,85),(211,86),(212,87),(213,87),(214,87),(215,87),(216,87),(213,88),(214,89),(215,90),(216,91),(217,92),(218,93),(219,93),(220,93),(221,93);
/*!40000 ALTER TABLE `regra_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta_pergunta`
--

DROP TABLE IF EXISTS `resposta_pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resposta_pergunta` (
  `id_resposta` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao_resposta` varchar(255) DEFAULT NULL,
  `pontuacao` varchar(255) DEFAULT NULL,
  `id_pergunta` bigint(20) NOT NULL,
  PRIMARY KEY (`id_resposta`),
  KEY `FK_mxl98rlt37109o0bri5w1xrtt` (`id_pergunta`),
  CONSTRAINT `FK_mxl98rlt37109o0bri5w1xrtt` FOREIGN KEY (`id_pergunta`) REFERENCES `pergunta` (`id_pergunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta_pergunta`
--

LOCK TABLES `resposta_pergunta` WRITE;
/*!40000 ALTER TABLE `resposta_pergunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta_pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmento`
--

DROP TABLE IF EXISTS `segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmento` (
  `id_segmento` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao_segmento` varchar(255) NOT NULL,
  `nome_segmento` varchar(255) NOT NULL,
  `url_background` varchar(255) DEFAULT NULL,
  `url_logotipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_segmento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmento`
--

LOCK TABLES `segmento` WRITE;
/*!40000 ALTER TABLE `segmento` DISABLE KEYS */;
INSERT INTO `segmento` VALUES (1,'Empresas de Seguran√ßa Patrimonial','Seguran√ßa','../images/background/logo_security.png','../images/cabecalho/logo-nicsecurity.png'),(2,'Realiza√ß√£o de Eventos','Evento','../images/background/logo-nicevent.png','../images/cabecalho/logo-nicevent.png'),(3,'Condominios Residenciais e Empresariais','Condominio','../images/background/logo-niccondo.png','../images/cabecalho/logo-niccondo.png'),(4,'Institui√ß√£o de Ensino','Ensino','../images/background/logo-nicschool.png','../images/cabecalho/logo-nicschool.png');
/*!40000 ALTER TABLE `segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setor` (
  `id_setor` bigint(20) NOT NULL AUTO_INCREMENT,
  `celular_responsavel` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `distancia_limite` int(11) DEFAULT NULL,
  `email_responsavel` varchar(255) DEFAULT NULL,
  `mapa_setor` longblob,
  `nome_setor` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `responsavel_setor` varchar(255) DEFAULT NULL,
  `telefone_responsavel` varchar(255) DEFAULT NULL,
  `telefone_setor` varchar(255) DEFAULT NULL,
  `id_local` bigint(20) NOT NULL,
  `id_usuario_responsavel` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_setor`),
  KEY `FK_sg7qgj4v1odw67uknbdj7viwt` (`id_local`),
  KEY `FK_dwmhvuxuy86p379trtp4vxcng` (`id_usuario_responsavel`),
  CONSTRAINT `FK_dwmhvuxuy86p379trtp4vxcng` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_sg7qgj4v1odw67uknbdj7viwt` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (1,'(11) 99171-7827',NULL,NULL,10,'sidney@kobel.com.br',NULL,'Escrit√≥rio Kobel',NULL,'Sidney Samitsu da Silva','(11) 4427-7554','(11) 4427-7554',1,2),(2,'(21) 92014-2014',NULL,NULL,10,'kobel@kobel.com.br',NULL,'Setor Maracan√£ ‚Äì L0',NULL,'Jos√© Jo√£o da Silva','(21) 2014-2014','(11) 2014-2014',4,7),(3,'(21) 92014-2014',NULL,NULL,10,'kobel@kobel.com.br',NULL,'Setor Arena S√£o Paulo',NULL,'Jos√© Jo√£o da Silva','(21) 2014-2014','(11) 2014-2014',5,7),(4,'(21) 92014-2014',NULL,NULL,10,'kobel@kobel.com.br',NULL,'Setor Mineir√£o',NULL,'Jos√© Jo√£o da Silva','(21) 2014-2014','(11) 2014-2014',6,7),(5,'(21) 92014-2014',NULL,NULL,10,'kobel@kobel.com.br',NULL,'Setor Rio Centro',NULL,'Jos√© Jo√£o da Silva','(21) 2014-2014','(11) 2014-2014',3,7),(6,'(21) 92014-2014',NULL,NULL,10,'kobel@kobel.com.br',NULL,'Setor Maracan√£ ‚Äì L1',NULL,'Jos√© Jo√£o da Silva','(21) 2014-2014','(11) 2014-2014',4,7),(7,'(11) 98448-5577',NULL,NULL,10,'marcus@belfort.com.br',NULL,'Escrit√≥rio Belfort',NULL,'Marcus Sandim','(11) 3723-2020','(11) 3723-2020',2,3);
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id_status` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Agendada'),(2,'Em Andamento'),(3,'Aguardando Atendimento'),(4,'Pausada'),(5,'Cancelada'),(6,'Finalizada'),(7,'Finalizada com ressalva');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_pessoa`
--

DROP TABLE IF EXISTS `telefone_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone_pessoa` (
  `id_telefone_pessoa` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefone_atual` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `nr_telefone_util` varchar(255) NOT NULL,
  `id_pessoa` bigint(20) DEFAULT NULL,
  `id_tipo_telefone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_telefone_pessoa`),
  KEY `FK_oa9rwuc5gulm2rnfqclm70893` (`id_pessoa`),
  KEY `FK_hp6er7hxohw7aex28tuo3tvfr` (`id_tipo_telefone`),
  CONSTRAINT `FK_hp6er7hxohw7aex28tuo3tvfr` FOREIGN KEY (`id_tipo_telefone`) REFERENCES `tipo_telefone` (`id_tipo_telefone`),
  CONSTRAINT `FK_oa9rwuc5gulm2rnfqclm70893` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_pessoa`
--

LOCK TABLES `telefone_pessoa` WRITE;
/*!40000 ALTER TABLE `telefone_pessoa` DISABLE KEYS */;
INSERT INTO `telefone_pessoa` VALUES (1,1,'2014-12-17 09:52:08','(11) 99999-9999',1,3),(2,1,'2014-12-17 09:52:08','(11) 99171-7827',2,3),(3,1,'2014-12-17 09:52:08','(11) 98380-5892',3,3),(4,1,'2014-12-17 09:52:08','(11) 99153-0624',4,3),(5,1,'2014-12-17 09:52:08','(11) 98400-2667',5,3),(6,1,'2014-12-17 09:52:08','(11) 97351-6007',6,3),(7,1,'2014-12-17 09:52:08','(11) 99171-7827',7,3),(8,1,'2014-12-17 09:52:08','(11) 99171-7827',8,3),(9,1,'2014-12-17 09:52:08','(11) 98372-7140',9,3),(10,1,'2014-12-17 09:52:08','(11) 99999-9999',10,3),(11,1,'2014-12-17 09:52:08','(11) 99999-9999',11,3),(12,1,'2014-12-17 09:52:08','(11) 99999-9999',12,3),(13,1,'2014-12-17 09:52:08','(11) 97243-8887',13,3);
/*!40000 ALTER TABLE `telefone_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_util`
--

DROP TABLE IF EXISTS `telefone_util`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone_util` (
  `id_telefone_util` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_telefone_util` varchar(255) NOT NULL,
  `nr_telefone_util` varchar(255) NOT NULL,
  PRIMARY KEY (`id_telefone_util`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_util`
--

LOCK TABLES `telefone_util` WRITE;
/*!40000 ALTER TABLE `telefone_util` DISABLE KEYS */;
INSERT INTO `telefone_util` VALUES (1,'BOMBEIROS','193'),(2,'DEFESA CIVIL','199'),(3,'POLICIA CIVIL','147'),(4,'POLICIA MILITAR','190'),(5,'PRONTO SOCORRO','192'),(6,'DISQUE DEN√öNCIA','181'),(7,'POLICIA FEDERAL','194');
/*!40000 ALTER TABLE `telefone_util` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_classificacao`
--

DROP TABLE IF EXISTS `tipo_classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_classificacao` (
  `id_tipo_classificacao` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_classificacao` varchar(255) NOT NULL,
  `id_classificacao_ocorrencia` bigint(20) DEFAULT NULL,
  `id_gravidade_ocorrencia` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_classificacao`),
  KEY `FK_ho6iv9kkyeb1kvm3uhmsbcajq` (`id_classificacao_ocorrencia`),
  KEY `FK_dg3mh0rcy0mfkyv0geici54xo` (`id_gravidade_ocorrencia`),
  CONSTRAINT `FK_dg3mh0rcy0mfkyv0geici54xo` FOREIGN KEY (`id_gravidade_ocorrencia`) REFERENCES `gravidade_ocorrencia` (`id_gravidade_ocorrencia`),
  CONSTRAINT `FK_ho6iv9kkyeb1kvm3uhmsbcajq` FOREIGN KEY (`id_classificacao_ocorrencia`) REFERENCES `classificacao_ocorrencia` (`id_classificacao_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_classificacao`
--

LOCK TABLES `tipo_classificacao` WRITE;
/*!40000 ALTER TABLE `tipo_classificacao` DISABLE KEYS */;
INSERT INTO `tipo_classificacao` VALUES (1,'Acidente com V√≠tima',7,2),(2,'Acidente sem V√≠tima',7,3),(3,'Inunda√ß√£o',6,2),(4,'Vazamento',6,3),(5,'L√¢mpada Queimada',9,1),(6,'Torneira com vazamenteo',9,2),(7,'Falta de Energia El√©trica',9,3);
/*!40000 ALTER TABLE `tipo_classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_endereco`
--

DROP TABLE IF EXISTS `tipo_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_endereco` (
  `id_tipo_endereco` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_endereco`
--

LOCK TABLES `tipo_endereco` WRITE;
/*!40000 ALTER TABLE `tipo_endereco` DISABLE KEYS */;
INSERT INTO `tipo_endereco` VALUES (1,'Residencial'),(2,'Comercial');
/*!40000 ALTER TABLE `tipo_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_envio`
--

DROP TABLE IF EXISTS `tipo_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_envio` (
  `id_tipo_envio` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_envio` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_envio`
--

LOCK TABLES `tipo_envio` WRITE;
/*!40000 ALTER TABLE `tipo_envio` DISABLE KEYS */;
INSERT INTO `tipo_envio` VALUES (1,'E-Mail'),(2,'Push'),(3,'SMS');
/*!40000 ALTER TABLE `tipo_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_equipamento`
--

DROP TABLE IF EXISTS `tipo_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_equipamento` (
  `id_tipo_equipamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `icone` longblob,
  `nome_tipo_equipamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_equipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_equipamento`
--

LOCK TABLES `tipo_equipamento` WRITE;
/*!40000 ALTER TABLE `tipo_equipamento` DISABLE KEYS */;
INSERT INTO `tipo_equipamento` VALUES (1,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0}Jb\0\0.iCCPAdobe RGB (1998)\0\0xúc``2ptqre``»Õ+)\nrwRààåR`ø¿¿¡¿Õ Ã`Ã`ùò\\\\‡‡√\0y˘y©‡€5F}Yd¶<^¿ï\\PT§ˇ\0±QJjq2£êù]^R\0gúdã$eÉŸ@Ï¢ê g ˚êÕóa_±ì Ï\' v–@ˆê˙t0õâlÑ-bó§VÄÏepŒ/®, Lœ(Q0200PpL…OJUÆ,.IÕ-VÃKŒ/*»/J,IM™Ö∏!\nA!¶ahii°I¢ø	P<@Xü¡·À(v!Ü\0…•EeP&#ì1a>¬å9˛KX˛ ƒLzË00OEà©20Ë30Ïõ\0√ØPobÙ;©\0\0\0	pHYs\0\0\0\0“›~¸\0\0RIDATxúÖW	tTÂ˛ﬁõˆ5ì…:…$!≤MÑD+Bã(‘™Uäß–„i©r<∂O[ãV∞≠“”¢ui+‚V≠V≠q!®\rK¬NI&ì…2[f__Ôˇ,≠ˆÙùÛŒÀººwˇ˚˜˚æ{ì$	¸¯Ó≠ﬂÀΩ∞˚œ\"„?¶UUHñj3ögŒîÿ“%◊vTõ◊?à?>¸ÿûΩÔµ¥Õoì~Ú»/Q`+„1næeÌqè{0›±ÔìYl’™’“X É ã`ÕÍõ$vˆÃI$¬i,)Ç`ÛÊ/¬·ÓHz#\\3ÊHråíí“πÆ∆∆ÉgŒúÄR©¢S	ÁÙztvÓ´fÆF◊}÷<”ˆû¸‚∑[–˘‚K8x:Ñ≥gN£…’‘œ˙NÙ=6wÓ‹ÌŸÄ˜~ˇq|Ω&Àr6|§Û#èBﬁYww∑pÌ5ã{]çy.˜¯(¥≠NLè≈ª^y˘˘6v	ãää •ã/{€79&ÏÓZ466÷≈ÔÀÿ≤U“i’ÿ˚˛[–h4pîóÔ‡ß[Ò»÷ü\nÏñ[÷:¥EÖv‹ps^ˇ¸√Ë¯¯X|Ì\'ù,õIU1√›øâΩ€\r•W@4êA:?\rsëπçe≥YàÇÄÁˇ¯{N4ZS∞8îNA£’Ç9ÎÆÄ€=àÛÏŸqÃ≤Ñ”ß√j+{dÎ·˙ûR^ûÄ··4&£p÷T õM·w;∂Ú.ﬁmW‡ï)..Å(*0ÕY˛¢ºÕK8√h4ñm¯¡}√	BÙ…£˚}ê§ú\\ì—Ñ“≤\n˙[ù›ı¸≥∂D2ºåcLπÈﬁ-)WC^}˘–•vR…4í©§lòÇM¬;6 É)ZÁœlÿ#Ï‹˘∏¿DQ÷≠[üzø˝uÑBA€Q›Ï¿˙µ∑£œ◊Éø>∫:&‚Ë†\Z±\\	4°Û0L8“”çﬂ\\≈IªÙƒƒ∏Èt\ZzΩ)Ì$•ZÇ›O>ÑÚ‚x‚âø‚¡{~m¢yÈ¨fF˝((,°Ã`gŒù˝Ÿí%À^qèS IÑ‹Y<˜ö%¥˜)œõh£ìÍ$·∫Jî„:’qZÚëN%a„eËu˘Ú∑57_µ¸‘©„∞àV(∆F )t®VÎ·à\'¡\\Th±Kp‰ï\"Ù°—’åææc;dﬂyÁÕT*ïvÂä’±x,ÇL&£¡ì…Çò( ï@<ÜàwNg¶◊7a˚£?sπúƒ.ï0ïJ≈A0 EQ0cmm›fB¸FÉ—dNß2˜à˚ıﬁ„GÔ9r$Aœ§•ˇ‘ˇ<‡áB°P-X∏Ëw”™jæùÀeMÒhS·`–„Ò¸•∑Ô¯Ω|’œ?œ>ˇc˘\r´^€|ˇœø5tÒNü:äd2¡B≠÷XùNÁ¶´Ê-ÿtı¬E;;ˆ}¥ÒKæøq”XeeUa˚;Ø û¢≤¶d⁄rá ÆpF‹òøpÒÜ[øªÓö›/¸©˛rÄ+÷ºO÷R¯ÒáÔ—À!<Éæ¡PYîPîy\' ˜Ô˚\0ÕÕ-uÛ[<›u†Ûn¶QkÃwØøgI«\'ÌÚÀ••ƒí1î_ôáŸ≈VºŸ~EE9LãÉ0ÅNß√ë#á®\Zıwë6∞∂∂ÖªÜáŒ#J`qäNEC¯—ΩÎQVSÇ˝ßˇÜj))hC÷\0k÷èH$,gû\nÄ<Ô7Ãb…[:2rë$@•T√ŸZﬂT#gêËÜ(Â„‹πQîXä!E¥Pò2*≈‰‰ekøï%‚1U&ìÖR•B\"ëÑZ91uc}√X∫‚«pÕÚc«c€°∞<ÖVYﬁS¥i«¬4Z›•˙#N“Ìw√”„G–Ø ∆ùGéÓô4ZTöµ»˙çR *´¸éJ•ëòJ≠âhu:C&ìñëˆ≥zD„$Ï”;a—ÍaRy%¬Ü\"⁄R@.Øñ/õÀç≤°°¡?54\\qOÈ[≠V#‘{°lÚî&TÁ£@Ã@ü—\"ÌN„D•àRuπú~\rŸ⁄·C›è±ˆ˝pnÎ’˜ó©§îEí¶¨\Zπ)ò	!ãÉ\rZ·0ÚÚl¢™]ë◊Ç„ΩGü`ú€3f4ﬂﬂ2gﬁ£Ω}=ÑlRƒBﬂ‰8lV2&Fë/ÍëoØDˇi|}ŸJºÒ⁄ã7˝z˚Cü1Òÿ±#€¥-lÆ(Ø˙é{dê\0e®ÆÆìç$éOÄ⁄W$¬≤Âkàç˛˙‹˘≥Ø~Aù˚˜›\\f/{iŒÏñø´©E\"Sò†V∆Ω ?ø\0Õ≥ÊÅ\0«üü˚C€Ë®ßÎKb\"/P—•c‰≠7åÖÖKjÎ\ZÓ≥Ÿ\nk\n•‰¯Nº∞ÎÈmììì¸E=´&H~•¸˜·¨ôæfvKÎÊR{˘Q…x ÚÅ˜éD\".oè<é \'\" –ıïèNù:Ò+2£˛W|ˆU7©Éµ\\ˇçïªãKÀjn\\y<Ó8∏ˇYo‹.≥Y~fÂEπUì/™†Ç)ôí,Q…E+îññ_Î∫b÷µ˜?^<ËΩˆ∑n	Éˇ3≥ŸRµzÕ≠ü¨]∑—å„„Ωo…ﬁƒwè«/+Ü∫£º_ò‹%xR\\iER&:◊,Ôs˝ÁHrz‘7Ãºj›˚W≠¸ˆßÌÌo/â\'‚¡/$–ÿÿ¥~›û dR8|‡C˚8\"ÑÔòõ¢ù⁄≤Ao\"6˘ÀDa0ã(∞0àäº!Ú∫Hé‘óE**A≠UqîìÕRâ∏p˛ıiÚ,VgˆÍ’ﬂÒïïï_ÁvÔïp:ko[¥hÈSS!Nû8Jôád∏yÄBj†ﬁMUMv|≠njk1?é\rùC◊ã}“‰e‘*$\r°cÕCö!Ì9K®Ñ…/í$æ|NRŸ’y\\*çÿ2Á™=≈E≈W3[æÕµ`·◊~ãN—xsÅËë…≈wÕ}3\Zç¡Ê¥‚˙÷Î∞tÒ7êe∑\"Ö·ÓE˙Ñ¶Lc1d©A\ZM˘t’\"28@Ûà*Ωí êÁíÇÇby#IjË^B”(‘’’Ô`ıı\r[sôlIò`‚Ÿe©û‘£Â\ZÛ·Fì/aÓ¨J‘Ã¥·ÙË«<~\'ª{±pÓtT€ö`û”å√D‘axiáÈ‰8\nÃEH¯&†\n,§¢TÜêÏ2‹8?®≥Å\rÜ&ﬁ\r8£y›xcêeDfàÈz]∫>B˜˚†»HƒÅ*(–©Å|‹~ÁÌhiõáéˆ=x˙∑;h8» Aˆn∑ò†‘*\ZÑVÕ4ó«<ìÀòU£Q3ÊÛ˚?ò6≠ÊNSàl‹+CœèAï…–Dë`*∑¿a0kàI8ﬁÔÖ◊C„˙ø>%Â‰!óLÀSπîK°T√`iÓMãàÍ\nqëë?%b$K≥‹GhÙÅ@Í—å4_•ì¨∑˜ÿeÂï≠éRGcà £íõãûæ&$)ﬂ0ö(@Bi√àwEZ*âÜ?í¥õ©D\Z\Zﬁ\niéØ∂Â”¬‰~â®Ä…ÚLƒ¸ÑÇÜ‡Ø†9%â©P\0%•vË(˛Ä˜\\\'ã≈„>2û;*™j‘ªÆT$ì)¯U Gƒ)ÇèFI1‚Å*ÁÜƒ\n“ı√»r∞ÁÎQ†b–dE(„‘~Ç9§…&K4pó®êå≈°Sk·pLì£°—jµ°jZ\"4ÇtÌÔ∏Kñ°◊;zò¸{ˆç+÷t’÷5ÈF‹·uÀnWD2‰Ã&IA(MVÙdF)ræÄäÆ$¡8µÍåBîÌ8óâÅe®•Âr≠É!?5/\\Æô()´¢V7Êyıï]sHqûÀF4>1~îtojù◊ˆ‹¥jÁÌN™ëo“K\nO\0 ºÄ⁄∏N&(ÔóirGÓ|AﬁhÇÁçô˛Ø°˘ÅöèÖΩ)rC˛ÌwÂ¨VﬁËjœC››]>˜ÏŒ/[qñoX´dÏ.ó´ÈaGπ„«ÖÖ≈\"Òdùd$~§â‹†¯◊OÏ3+ñdÔáÉ2xƒ+8k°—ÈãF‚{˜ºΩ•Á»ßø¸ˇÕ(˝Yã€ÃO˙84T8*n´pTﬁi∑óœ$&+Tª 7!Ö‹x\"L˘ôw˚D∂‰®«›˝Ó?ﬁxÚ¸˘≥Øe∏ü„·ØZÍÀ	Ï⁄µKxÊôg,£ô~ÍZZZ‘tÌâ\'c«\"#·ç09ÖB‘ì¶≠*• ,àÇ:óÕ¶}>_xphhäzEä*¿µÃÁ“1Æ!ÊΩ?Jâém€∂Õ≥i”¶‹•ı˛\rŸûÕ®÷•at\0\0\0\0IENDÆB`Ç','C√¢mera de Seguran√ßa'),(2,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0z\0\0\0z\0\0\0pYG‰\0\0\0	pHYs\0\0a\0\0a®?ßi\0\0\nOiCCPPhotoshop ICC profile\0\0x⁄ùSgTSÈ=˜ﬁÙBKàÄîKoR RBãÄë&*!	Jà!°ŸQ¡EE»†àééÄåQ,ä\nÿ‰!¢éÉ£àä ˚·{£k÷º˜ÊÕ˛µ◊>Á¨Ûù≥œ¿ñH3Q5Ä©B‡É«ƒ∆·‰.@Å\n$p\0≥d!s˝#\0¯~<<+\"¿æ\0x”\0¿Mõ¿0áˇÍBô\\ÄÑ¿të8KÄ\0@zéB¶\0@FÄùò&S\0†\0`Àcb„\0P-\0`\'Ê”\0Äù¯ô{\0[î!†ë\0 eàD\0h;\0¨œVäE\0X0\0fKƒ9\0ÿ-\00IWfH\0∞∑\0¿Œ≤\0\00QàÖ)\0{\0`»##x\0Ñô\0FÚW<Ò+ÆÁ*\0\0xô≤<π$9EÅ[-qWW.(ŒI+6aaö@.¬yô2Å4‡ÛÃ\0\0†ë‡ÉÛ˝xŒÆŒŒ6é∂_-Íøˇ\"bb„˛Âœ´p@\0\0·t~—˛,/≥\ZÄ;Äm˛¢%Óh^†u˜ãf≤@µ\0†È⁄WÛp¯~<<E°êπŸŸÂ‰‰ÿJƒB[a W}˛g¬_¿W˝l˘~<¸˜ı‡æ‚$Å2]ÅG¯‡¬ÃÙL•œí	Ñb‹ÊèG¸∑ˇ¸”\"ƒIbπX*„QqéDöåÛ2•\"âBí)≈%“ˇd‚ﬂ,˚>ﬂ5\0∞j>{ë-®]cˆK\'Xt¿‚˜\0\0Úªo¡‘(ÄhÉ·œwˇÔ?˝G†%\0ÄfIíq\0\0^D$.T ≥?«\0\0D†Å*∞AÙ¡,¿¡‹¡¸`6ÑB$ƒ¬BB\ndÄr`)¨ÇB(ÜÕ∞*`/‘@4¿QhÜìp.¬U∏=p˙aû¡(ºÅ	A»a!⁄àbäX#éôÖ¯!¡Hã$ …àQ\"Kë5H1RäT UHÚ=r9á\\F∫ë;»\02Ç¸ÜºG1îÅ≤Q=‘µCπ®7\ZÑF¢–dt1öè†õ–r¥\Z=å6°Á–´h⁄è>C«0¿Ë3ƒl0.∆√B±8,	ìcÀ±\"¨´∆\Z∞V¨ªâıcœ±wÅE¿	6wB aAHXLXNÿH® $4⁄	7	ÑQ¬\'\"ì®K¥&∫˘ƒb21áXH,#÷è/{àCƒ7$âC2\'πêI±§T““F“nR#È,©õ4H\Z#ì…⁄dk≤9î, +»Ö‰ù‰√‰3‰‰!Ú[\nùb@q§¯S‚(R jJÂÂ4Âeò2AU£öR›®°T5èZB≠°∂RØQá®4uö9ÕÉIK•≠¢ï”\Zhh˜iØËt∫›ïNó–W“ÀÈGËóËÙw\rÜÉ«àg(õgwØòL¶”ã«T071ÎòÁôôoUX*∂*|ë \nïJï&ï*/T©™¶™ﬁ™UÛUÀTè©^S}ÆFU3S„©	‘ñ´U™ùPÎSSg©;®á™g®oT?§~Y˝âY√L√OC§Q†±_„º∆ c≥x,!k\r´ÜuÅ5ƒ&±ÕŸ|v*ªò˝ªã=™©°9C3J3W≥RÛîf?„òq¯útN	Á(ßóÛ~äﬁÔ)‚)¶4Lπ1e\\k™ñóñX´H´Q´GÎΩ6ÆÌßù¶ΩEªY˚ÅA«J\'\\\'GgèŒùÁSŸS›ß\nßM=:ıÆ.™k•°ªDwønßÓòûæ^ÄûLoßﬁyΩÁ˙}/˝T˝m˙ßıGX≥$€Œ<≈5qo</«€ÒQC]√@C•aïaó·Ñëπ—<£’FçFåi∆\\„$„m∆m∆£&&!&KMÍMÓöRMπ¶)¶;L;L«ÕÃÕ¢Õ÷ô5õ=1◊2ÁõÁõ◊õﬂ∑`ZxZ,∂®∂∏eI≤‰Z¶YÓ∂ºnÖZ9Y•XUZ]≥F≠ù≠%÷ª≠ªßßπNìN´û÷g√∞Ò∂…∂©∑∞Âÿ€Æ∂m∂}agbg∑≈Æ√ÓìΩì}∫}ç˝=\ráŸ´Z~s¥r:V:ﬁöŒúÓ?}≈ÙñÈ/gXœœÿ3„∂À)ƒiùSõ”GggπsÉÛàãâKÇÀ.ó>.õ∆›»Ω‰Jtıq]·z“ıùõ≥õ¬Ì®€ØÓ6ÓiÓá‹üÃ4ü)ûY3s–√»C‡QÂ—?üï0kﬂ¨~OCOÅgµÁ#/c/ëW≠◊∞∑•w™˜aÔ>ˆ>rü„>„<7ﬁ2ﬁY_Ã7¿∑»∑ÀO√oû_ÖﬂC#ˇdˇzˇ—\0ßÄ%gâÅAÅ[˚¯z|!øé?:€eˆ≤ŸÌAå†πAAèÇ≠ÇÂ¡≠!h»Ïê≠!˜ÁòŒëŒiÖP~Ë÷–aÊaã√~\'ÖáÖWÜ?épàX\Z—1ó5w—‹CsﬂD˙DñDﬁõg1O9Ø-J5*>™.j<⁄7∫4∫?∆.fYÃ’XùXIlK9.*Æ6nlæﬂ¸ÌÛá‚ù‚„{ò/»]py°Œ¬ÙÖß©.,:ñ@LàN8îA*®å%Úw%é\ny¬¬g\"/—6—àÿC\\*NÚH*MzíÏëº5y$≈3•,ÂπÑ\'©êºL\rL›õ:ûöv m2=:Ω1ÉíëêqB™!Mì∂gÍgÊfvÀ¨eÖ≤˛≈nã∑/ï…k≥ê¨Y-\n∂B¶ËTZ(◊*≤geWføÕâ 9ñ´û+ÕÌÃ≥ €ê7úÔüˇÌ¬·í∂•ÜKW-XÊΩ¨j9≤<qy€\n„+ÜV¨<∏ä∂*m’O´ÌWóÆ~Ω&zMkÅ^¡ Ç¡µkÎU\nÂÖ}Î‹◊Ì]OX/Yﬂµa˙Üù>âäÆ€óÿ(‹xÂáo øô‹î¥©´ƒπdœf“fÈÊﬁ-û[ñ™óÊón\rŸ⁄¥\rﬂV¥ÌıˆE€/óÕ(€ªÉ∂Cπ£ø<∏ºeß…ŒÕ;?T§TÙT˙T6Ó“›µa◊¯n—Ó{ºˆ4Ï’€[º˜˝>…æ€UUM’f’e˚I˚≥˜?Æâ™È¯ñ˚m]≠NmqÌ«“˝#∂◊π‘’“=TRè÷+ÎG«æ˛ùÔw-\r6\rUçú∆‚#pDy‰È˜	ﬂ˜\r:⁄vå{¨·”vg/jBöÚöFõSö˚[b[∫OÃ>—÷Íﬁz¸G€ú4<YyJÛT…i⁄ÈÇ”ìgÚœåùïù}~.˘‹`€¢∂{ÁcŒﬂjoÔ∫t·“EˇãÁ;º;Œ\\Ú∏tÚ≤€ÂW∏WöØ:_mÍtÍ<˛ì”O«ªúªöÆπ\\kπÓzΩµ{f˜Èû7Œ›ÙΩyÒˇ÷’û9=›ΩÛzo˜≈˜ıﬂ›~r\'˝ŒÀªŸw\'Ó≠ºOº_Ù@ÌAŸC›á’?[˛‹ÿÔ‹j¿w†Û—‹G˜ÖÉœ˛ëıèCèôèÀÜ\rÜÎû8>99‚?r˝È¸ßCœdœ&û˛¢˛ÀÆ/~¯’Î◊Œ—ò—°óÚóìøm|•˝Í¿ÎØ€∆¬∆æ…x31^ÙV˚Ì¡w‹wÔ£ﬂO‰| (ˇh˘±ıS–ß˚ìììˇòÛ¸c3-€\0\0\0 cHRM\0\0z%\0\0ÄÉ\0\0˘ˇ\0\0ÄÈ\0\0u0\0\0Í`\0\0:ò\0\0oí_≈F\0\0IDATx⁄Ïùyp’ô¿”skf4∫%Àí|ü”¯‡076	!êbÅ$êŸÏ¬f+ªŸJ≤©§í‘nÌ&©Mj∑(Rdì\"ÏRÑdπÑ#@ÃcìÜ8>dYñe›\ZI#iÓ£{ˇò∆á‘›£c∫gdÎ´öí-iÙﬁº_Ô}ﬂ˜æ˜=õ¢(ÃÀŸ/∂≥ÂÉHí¥8X,V_ı@5P¯˜Ñ∑%Å0˝@á˙j>E±ctÒ†Vó[‘óLjnêÄw‘◊QáÁAõw#	‡`3 ©+2\nÇ(ä˚ÊAœÓZ‡Û¿gÄ•%⁄Õv‡I‡1Qˇ2zÍpΩ¿ù¿}¿•slÜ‹¸xB≈¯<hm¿u¿¿˝@Õ∑}B¿OÅáDQòù\\|¯\n‡9Àºö #QCÁ$hIí|*‡Øæ≥‹çç?VÅGœ	–í$ŸÄªÅçÁX‹¢¯∏(ä YZí§Â¿√¿VŒmŸ|Y≈∂≥\n¥™≈_˛Ì,\\ág≥~¯O+¥€f‰Ö¿£¿∂y∂öÚ:pØ(ä›s¥$I€Ä\'Œw…\nwÏNQ_üS†’©˙õ¿øRºPÂ\\¯63¶rõ	ê]¿#™e=/”ó«Å/ä¢ò*Y–í$U\0/ê€YöóôÀ‡¢(ÜK¥$Iµ™€∞nûSAd?p≠(äÉ%Zí§&‡\r`˘<üÇJpç(ä]E-IR=∞ì\\f«º^éóâ¢ÿ?õ?\"ÃrçÍŒC6OñØ´cm=huﬂ¯π˘5ŸY<ßéπu†%IÄ«»ÂkÕã5≤xL˚iãcÜç~∏≠‰#©J:ãúŒ†dePî‹W¿& ÄÕ. 8ÿ\\ß£‘≥ËnS«˛;¶cí$}Rù≤KJ≤â4±éA‚ù!‚=√§∆P2PPlÍW˘‰˜&~ﬂ&∏ÍÇxökÒ.i†le#Ç◊]ä¿oEÒy”@Kí¥¯P^*p«˜2v†õx˜0»Úi‡ŒÑ:–»æx’∏p9~qBY…@.E±Ω‡†%Ir\0oS	{â˛1FﬁÔ`ºµ%ì’Z\0–ß˝æÕ.‡[øÑä´÷„nÆ+ÿªÄ+EQÃzç˛n±!«˚F	Ì>J¥#t\nÑE¢d≤Dˆ!≤∑ï≤UMT›xÓ≈\r≈éKU&ﬂ)òFKí$íKZw„•«ÏlcºµˇîÜÂ’‹¬jÙôÔ…}œw·r™oπGU†X∞3¿fQ•YÉVßÏ›¿FÀ?Ü√v⁄›éú ú9ïñ\0hõÀI’Õóº˙∞≈dﬂ\\ío\nüäOˆ@1 ß#Ié?ˇ;⁄ê”ŸÇ¸Mõ√éΩÃç›Á∆Ê¥ÊYL•zÊmz|ñL8R–UF3◊h5Ïv®∞≤Á—Ó0›Ø$KM––©i¥≥‹ã∑π\ZœÇ\n\\’~\\U~ÔdçS2cq“°1R°QùÉƒ€{…èOY£OªﬂK›nƒª≤…jÿa`ÖQÓx>–ë;9a]èı”˚V»Y\r†˙†]U~ÇÁ-$∞∫g∞lv≥…8—è1æ∑ïTﬂîAà©π„j[,èˇT≈¶\rZMÕ=ÿ≠ÍiË˝.˜W◊JyJ†+Í©⁄ºOC–î>%O~C\"Ú¡—ìk∏Ëè§Ú¶K®º·\"K√\n¿jΩb#+˙€VBxØì!iÍ€ÆÅı‘lYÅ´ ‹CÓÊZÍ?UõzÈ]¢“—)Ωo‰≈›(©4UüºÃ™!¥´ÃÓù≤FKí¥8åEëﬂ°{ÿs¸îñh¥+Ë°˛Í’¯U≈üâÏdË©∑HÜß‰«W}Ír*∂n∞–Oaï(äG¶™—ˇ`‰—£CÙø◊9•∆Çk©øj%¬-fEVê„)≤…4r2\rY˘‰ÊÜM∞Â64‹Nè°Ãù€Ë»#ekZ~„Ø=ı„ª‰˝˝·ﬂÓ¿Ù·ﬂ¥ ä·¥©ÏÓœ´—jÓW\'ú®àá¢tºx\0%ì=Ss\'h¥M∞—pÕ*Ç´ÛG¢2„	∆vm —5î€ÿê5.É,´>≥\Zó’€mxõj([’Ñ√r¡¸KBdœ!˝î<ÓüÕaßÒ´∑„^ToIÑhôòk¶•—_¥r6ï•k{J÷x˙\\önZGY£±áÎ\Zaxo;—ˆ¡ì0m≤<≠gºΩóx[C/Ó¶lE[EºÀÍæ«—jU˙~ˆr\"e¯∑˚yâ¶oﬁe≈nòGe¯C]çVÔè`AjP◊õÌå:µE®°—v∑ÉE∑\\ÄªZ_ªí°˝o&÷5¨j¨r&Ë”æg§—\'ˇ£ŸD˝}œí‘‹~%ÆÖ˙ô<©û!z|Ülƒ∏»Å√JÍæpÉZ}Tı´Ω»ÿµV@Ô3÷a\\ÿGp⁄iπ˘|]»JVf‡ù£˚Õ^b=aÛÊ¡£›t˝Ë	Üû›ë€)”Wc5\r{Ç€e<’øﬂJÙÉ£VÄ^¶≤‘\rÅﬁev‰åLÔªùyL\nM7¨≈SßΩYêO–Ò¨ƒ∞‘eÕñ¨0∫˝}z~Ú$ô°1m7¨•é˙/›Ç±YzÚMîT⁄\nÿwiÇñ$…	‹jzP‰œ}db∆¥Ó¢E¯ö*µ5l0¬±g> ö~\\Yp9pîó·(/Cp;g<†˚?~C≤Sª,âwU3U7Ô‰fG£åº∫◊\n–∑™L\'c◊ïf∂úâß>h\\ª≈ﬂ\\IıÖ⁄±‚Xﬂ8\'^>Ä<Eç6U„[Vã∑©WçªÁÃ©UéßH\réoÔ#z®ìd{o~#2ßÁøûf¡˝∑‡Y6π`C≈∂M$⁄∫â8ÆÔRæ!ºr=ˆrSÉ=ï*”\'N›7öÆÕê3≤·∫º‡JÌ√…ë\'~9ìﬂï©‹∞ò•}-Õw_F’%+Ò6UMÇ x]xZj©º˙|ö˛Ê&˝ÛØXáÕiºÌÆ§“Ù=¸<©û!MO∂ÊŒ≠ÜÎµíJ˛√˚VhıçZkÙ«Muß“YFZçÛ‘nj¡·õ<@ŸdÜŒW[ÛnWñ◊≥ÙWPwÌ⁄ml8*‘‹r)-ﬂºﬂ∆ıÎ‰DäæáüGé%&ˇù\n?ï7]llêÓ‹èOô\r˙„gÄV70ñò\Zk1‘fWÖó µ⁄ëû«HGSZ,∞‡˙u4ﬁ,‚Ã>‡®”pÔ«®Ω{õ°vgF∆xÏµ\\‡qÇî_uŒ:}ﬂ_N¶ﬂs–l–KT∂\'5˙\n≥[92d¯Ûöı±iX¨·∂!∆OåÍæœÓq≤Ë”	ÆYP>6Ø¢ÒÔ?ç›Ø@\"∂ˇò&0õ Pq˝fc≠ﬁeIE…+NmÍyÊD8A\"ú–◊ÊÄõÚÂ5\ZSvñ˛}]V¥ùñOâxÍÕÀ>v/™g¡ﬂ›ä‡—_sáªCs\n˜o^Ö£Zøo©Óêˆ:_Xπ¸t–õŸ“XÁ®·œ+V’ijÛ–¡≤	ùT(,º·<‹5˛)˜C… (ôlÓïï5ß\\Õqa\rı˜›§õñçƒ›˛\'M≠.ﬂrû·ﬂéJ¶W†∫¿!IíXmfKëûq√üó◊NºTñ·C˙g¿k.l—ıµœ»cÑ˜%vt\0%ìV√úY» 6Ôíz*∂¨°lïq˙èwU3◊o\"¸˚˜¥mê∑? ∏u√§X∂ÛjÜ∑K˜°äË†Ú„¶ÍŸjIí‹∞≤È,Ò·òÓœÀ\Z85,Ì—c#∫V∂+Ë°fcã±œM“ıÙ{t=µáh˚\0ä∆áíïâµv”Û»ÔÈ˝≈Àd«c∆éÈ\r·¨’6∞‰xä»{á5-yœ2˝çëdÁÄ·ÜHƒ¨ÄÛÃl%äNë˛Ö⁄)@·ˆ7l6ª˛ﬁq*„¯ØvÌòzUàÿ·.∫~Ú4È–®±è~”%˙∆ïé]∂∆‡°TS‘ÃRŒÃv´‚√∆;:æ∆…∆J:ö&>§≠]ÆrÂÀjıgêDöœÏ#IL?r7\Z•Á°Á4\r´ìÊÜ∫Zù<ﬁOfdÚ2Â]Ÿlÿn™ÀÙJœKLù\'ı5ƒ.‡≠ôåˆÎ«±É´Ís_˙ﬂn%=ûòq3#BOΩez≥∏xç˛É›:ŸKp∑‘csËØéXﬁK†ŸÃR}–Órè¶%–ØtX¨ü+ñEkÌüuü#{[IuÎGÒ|ËÔ‰&⁄4*=\n6√‡â—rQ i0π|c:¢ø·\njG±íc⁄á£ÃÖªB?x>P∏µŒ(ò·l®“›êHıiÔ≥;ÎÙ=Ω≠œJç\0‘öŸB&•$»–N´IÈÄˆT«Ø£\'\nwKë—ÓÄªI[?“˝⁄F§” píç&Ã]+êª¯À<1∞∏á∂ÂúMeßı`|‰*•Fw_I:÷Õ(pTu‹,Ìá‘fY≥ y¬/\0Aä$ˆit≥$Í ﬁÈ®Q&à›?ΩÕì|iF&K∞®ïwmˆi¶é¸∫ëU;„˛ÓKOØÔ6Gqãµu9-OO…RÉáÄ›Î,XﬂÏ~Ø!h%;ΩDNeŒa–:k†MgÛ M\Z˛Ω≤Ö[Ö¥“Ñ&˙€ö}◊9Ì°$Sg7h¡`  ƒµ◊@ßœ©|16∂ WÓ$Ñ≥Ò>O∫_€¬◊+së”è£€\\K@õÍ≠;¶S=7 •c]\'ácÜY*Å%5Ü…˛SWc5æÛıSâîTÜTWH«_÷å§¬˙cÙõÕyT w≤i‚ÚÈÉNéj˚èﬁ\ZÌ†à\"+Dª√èçÜkVkÓmO›@®π„Z√¸Ïÿ°NÕ›0\0˜\"Ìt®‘¿àÅ´fzŸ∂à\0öŸÇ;®ÔÜdb)ÕÈ€W´Øïcm∆	ÜﬁÜ ı◊¨ô!e5∑_âgâÒaæ»ﬁ√”Z€≥c1≤£˙a]WCïŸ†r7¥ò&ûJc3÷;9¸WVÁ”ı±«;Ü»Dç\rõäuiºYDò∆⁄\'∏ù4‹sÂóÆ56¬¬bj´ºn<\ZáÚ‚Gå¯ùÎ*êÑ‡Ñô-î’\ZØôëû1\rÀ’F†%®;}ÓÎÃ€n`E=ãÔπÇ¿ ¸IÉ˛Û”¸O∑„[üˇäÍ+{Néù4≠_™πO?|bV~‰Ñ\03uç∏t≠hÄHgEûÏW≠–ﬂ•\nÍ#1òﬂ¥pñ{©ÿ∞8ÿhÀZ˘\r¢‰â∆ﬁ—ﬂÏ(ø¸|\r[&∂_ødß£2†ªø]@9f:h\0_Ω˛ fi¢›£\ZYôÊ^unÙ†g˚°¬á=çÇ5©4Éˇ˚™n\\⁄Ω∏A≥dd¸P\'Ÿq}∑–¢RU«¿Ù‰b£q	≈p´vÜE›Ö˙”nr$∆‡ÓcñÅznßÓ$@’\'µk‘ÁÀ›ˆÆYdE˜ˇ\"\0»ï.2MÀ\r\'c«áIçMvµ|\rÕ˙—Æ_zt◊ÀÇjs6À¯N}`æıKÒÆò¨ôÈ¡0—è\ZJúS≤f)Y‡Ä äbí\\=1Û¢2ÅÚÉuHÅ!I˚ŒÜã[tã”(≤í∑4FA@g≤∫±m¡Ì¢˙ˆ´¥ƒW˜\Z\'F^∏<ÔÅæ»!Qì©Ÿªf∑Vπ¬ÿWm$929LËÙπh‹¢=Ωπ´}.ÛK°	nóÆTsÁµ8*\'/M©æa\"{åıGÀx3AﬁÖS±Óf∑VVÎ3tµY°oßˆö[æ§äöŒtAÏnÆ±§§\0µwmC(;3&P˘±Õ¯7Æ‘ú°BøyC7z‡Y≤¿™zﬂ;‡‘A¯?Z—bÕ∫zNlèOFm ∏rrÖ˚∫çMT,´&ä\"∏ÏxÎÿ›÷ïw∑‘—ÚΩ{àÈFI•q7◊·¨◊ŒﬂsP;IÙ†Œıõ¨Í˙Oj¥Z?“t6–ƒõ\'Ä“∑£]7%»U·•|y\r˛ñJK!ü˘Ú≠_ä”*]»ÈÅ0°ˇ{”¯°Y‹@Ÿ∫%Vt˘ÿGµAO7Ö_≤¢Â˙M∆~£ú…“˝Í!√]™R%ï°ˇëóÚ£©˛ÙVuÈ$””AølEÀeµ>ÇÀåÎx&Ü¢Ùºv–“;3f-≤Bˇ£ØÊÉ.ZÉg…´zı≤ËWÅ+Zoÿ‹Ñ›c<ıéw—˚fÎú·<¯ƒà˝Ÿ¯v\"ªﬂKïu⁄<¢2=¥(äi‡Y+z`w;hºlqﬁﬂÏ#ºøß‰!èÌ¯3„ªÛÄ≠Ω{vü«™n=´2ù§—\0ø≤™ÅÊ\n™ŒÀü˙3¸¡âí≠u~¢Ø≠2¿4YNΩù\\IK§~S3e\r∆q‘h¢‰Aßáå≥±<ÀRı©À≠Ï“Qï•6hµHËœ≠ÍçM∞—ºuÆ†˛y*WÖ∑‰A;k*ÙVWI√ónûR- œO/¯™•—\0èê´˘lâÿ››∏ß_;!∞zCK…ÉÆ∏N˚∂(GeÄ_π’Í;-*CA´Ωi©F¯\\,∫˘< \ZÉg<\0ıó/üR1v#…∆ÛóìÃ∆í≥≥7.YKımW\"xOªÒÆh¢Ò´∑O)°°¿ÚÀâEŸ°DÓ‘8#ËêïQ≤Jn«jÜ≠«{G?‘C§≠èt8äM-NÉú=£XçMŒ™ı∫≥8Ée¯V7„ﬂ∞œLc–äÇúLc≥€vÅ⁄t{ÄŒù\ZF◊!=\n‹√íH«°=Ì$z√ßÄ Úî@€d≤πˇ{VSy„EV[…ÖêˇEÒ^M{»\0¥Â˜^ÕÿÍç$È}Û±ŒP\\6;+–6ır5ÔÍjÔ⁄™π\rYÇbxÔïÆ)®æ·g%Ø≈ù#{J\"⁄U¯†^¸P\']ˇ˛+b˚èÕ–?”ÉlZïÔíª˜∞$e‰\0\'^;L÷ƒìär<Iﬂˇé±ù˚KrXe≈å@´óZ~Ø$?ŸëΩÔtLπÃ„ÏLÖ–Ø∑[U§u&Ú=£Hß¢—\0ëª£∏d$⁄7NÔÆNÀ€\r˝˙çº…¯Eê}*#fZΩÄ˙>r∑è]2â]<éRÑ-LEñxÙ√<m´á∏/ﬂ%·S’h‘´ÂP\nü¨ooôDÒûπl$Œ–”oï\nË®l(hUæÏ*∂6è/æmŸ◊Z\nZΩKeBAA´”√gÅ±¢Åé•KEì»Ñ«ãŸ¸Ÿ©LŸ3—hDQl>W¨O\'8Öí]‰rRüSYLYfMñ$È_»]JmΩ&≈”dìY’S∞)ê+\n¶~=˘e‚˜&~õﬁœNæWã∞\rªœcˆùUFÚØ¢(~g∫oöiŒÏwÅ5¿mVJá◊iXÂ,óßÛF\n™—™V{Å◊Å-ÃãÚ∞M≈∏•†Uÿ5¿¿∫y¶ ~‡ö|—/”@´∞ÎÅùXpÒ9*GÅÀDQúU!ÚYõ±jÆ⁄Êô\\⁄Ä´gπ †Uÿ]ÍZΩûMAßÎ-ÍÿR†UÿÉ‰Æ«€1œh÷≤∏B+˜´Ë†Uÿa`+¯<´À„¿Vu,)I–*ÏπËŸ∑\0yû€îEV«ÏsÍTLÕÚî$i&_–rH∏S≈◊Õj¿‘‡±⁄që\\`e^¥Âı‹Pâ¶éëÈª¢(v◊ˇàÖ\'@ÊÄ$‘1π^#S≈“}5Ö¯a’`;óe;e£¨Õ9ß—¥ª\r∏N5÷zŒA¿=Ígﬂf%dÀ5zÇv˚ÄØ_|g9‡(c‡G¢(Fã—[±G@›˘:¿sñN\0™ÄC≈Ïà≠TFDí§:‡‡˛≥¿?Eq†:d+µR˜πÔ$ób|Èº¯ƒL˜çœ–†Ø>|XZ¢›lûE±dèrÿÊä™Hí¥¯p∞ô‚]Œ&ÔØ\0/à¢∏o.åﬂú=zp9π≠—-‰¢ofùm$r©<Ô\0;DQûkc6\'AÎ¿_úO.”e±˙™™Å*r◊\'O,&í$wÔ◊00ÙÍ´¯P≈é≥a|˛\0Cû\rË(Éø\0\0\0\0IENDÆB`Ç','Central de Alarme'),(3,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0z\0\0\0z\0\0\0pYG‰\0\0\0tEXtSoftware\0Adobe ImageReadyq…e<\0\0hiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"Ôªø\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:04801174072068118083E355EC8371AC\" xmpMM:DocumentID=\"xmp.did:CE7679FA968311E397AD98FE325931F0\" xmpMM:InstanceID=\"xmp.iid:CE7679F9968311E397AD98FE325931F0\" xmp:CreatorTool=\"Adobe Photoshop CS6 (Macintosh)\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:0F31BE8F112068118083E355EC8371AC\" stRef:documentID=\"xmp.did:04801174072068118083E355EC8371AC\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>y¡ìÆ\0\0pIDATx⁄Ïù	pU’«øó=êçêÖ∞fA@˙$ÇQ	ÇïM™6j@PGj[•*µvƒ)ÌhßcÌT¥åå0¶#Re	!@B$¿≤av≥ë}\'˚{˝æóöº‰Ω‹‰-˜û˚Ó«¸9/…}sÔ9ø{ˆÔú£“Èt†ò¸M%óàh4ö`ÓAÖ¢ÇôQcôF£\\\ræ÷éjA’0U†\nôÚQ◊’ju°Z<®æ,@E2©QûV∫]›ïÃîÑk–÷ÉÅ¡\n‘2‘\\îÉHè¢E•¢N†é ÙÀ\nhÛ·ÜcÉzö…R4*‚†ˆ\"Ù¥p∏ÓD£^FÕÁ¨ÑLAÌB≈\"ÙVÙ‡Ä0ÿåz\rÂ«y€ß\ZıjØT@˜\0&®Ô†~çrìYØ¶\rı)Í#^mó†h¯M÷ıë≥QÓcº≈.@#`∫ÁÛi‘x;∑(CmEÌC‡:ŸÇF»S1ÿâZˆmßQõvÆ¨@≥\\¸;‘_eXõSøã˙ƒπ[e»0ÿÉZ¢∞‘N°^Dÿ•‹ÇF»7V›%[t«¢ˆ)Æ@≥¢ö\Z€Aº°JﬁåÜVﬂC}hç¢\\e».|…Z÷‚¶úNÖ%êUR\0Eïep´Æ\ZÍZö°µ´Gï\n\\ù\\¿{¥˘˙Ah‡ò5%&˚è√Duxa?j#¬Óê,hÑÏÉ¡ËôYÕÍö‡\\z*\\∏yÍ[öÄ¶‹	:˝”‚göÉÔÍˇ∆>xèÅÖ≥\" J=<›EÎﬁ\'°V Ïz…ÅF»˛¨€0K¨‘inª\r«S %[]››} \n›∫8;√s\"·óëã¡?ã`È‘\rEÿUíçê\'bêÄö*‰ÀπÈﬂ‰°aÑ8|–=◊Í¿ﬂkl^æÓ	%j‘œ^Ñ∞KDçê…ã„<*LåîË÷v√w)?BJ÷’AÅôöæ´¬˙<˙·(Ã›ãƒ®øÛP!Ï\n—@≥	â±äÎŒÆNÿ˜-‹,Àˇ?L+ÄÓµ®{Á¬´À÷ÄÉ Êâtñ≥G<1‚`dö7>$d …ª„æÅú≤õ›3ÓZ*|z¸†˛%∞±Q\Zbin;–xC˙ﬁ^ËÒ◊≈æM<yÂE6øo¬çÀp‡¸i1¢LiΩó•ΩÕrÙ®µbAæê}4˘‚yÌƒ&∆¡µ¬1nΩñ•ΩıA„µíç‡àb5çuÿÖ:\rb€?è~∑i‡≈ˆˆc`Ω∆ﬁÄÙÆ¢ºƒJ‡ΩÒ ´8è5öXCtÇ\Zc∆@p‡DÌâuºjöÍ!ª¥n’’jå⁄ π`√cOäëç®˚∞qñoq–Ÿ	És ¢√^aE1Ï:±øê°AS8ˇÓ˚ J	„∆>∑í_Qä]¥HÕÕ\ZhG¯|”[‡Ô=Få‰ GƒGvó•ãÓ˜AdØÃƒÙ√∫ﬁ{îlY≥b≠4\nôå∆π∑¨~ﬁX˘∏π∏£ÂØÖCó≈Jé˘åâÂÍhÃÕ¥b´òêk±òÕ)\\RÅØßºΩˆeö$¯;Lá?=Û∏ª∏\n˛N¸ç4Ë¿˛ºH∂ï±14+≤…WŸIL–ÈÖYÇØuvrÇWóGÉè«õSÒ≈xsU¥‡Î€::ÙEæH¶g√ôù£…◊:BÏVnvâÓÃ/Ó_Aæ˛#æó:d\ZD›;Oıór≤ƒLö∆h‰†ŸÁ6±!wtu@yÕ-aı2∂®ù=œÏ{>ª`	8;\n+ƒ2~Œ;â∂1V#Œ—‘9˜;Â5˙∞†·£ªÁ`kÿ—Ï{Rl˛ÙŸ¬˙ˆMç˙!YÕg®ÅπôÊÂ6Å¨∂©Nµ≥¶L≥ÿ}Á›5Sµù]›b\'”&∆lÿ9öFø•\0∫°•QXÀã⁄ÒæÅªÔ¥Ò¬[Ï]⁄.±ì…LåX:…Õwa∞$bmùÌÇÆã]*ö;∂îçıÙ<ˇ¨’Jbãêuåù‡˝Hh••–˙œ’Ÿ≈¢˜•ó∆›UXüZÑ©ÀAô±\Z4Û˝⁄\02OwA◊çÒ∞¸|gWpf√!sÙFêÿ≤ôª&ÛR\nü<Õ‚ê;ªπÌ∆\ZÕÔ_ë⁄ìaÎﬁ–pì◊LÙS-ÎÏR”‹\0ú⁄+å•—M´√§¯‰+xfNô>Ëﬂ&˘¡∆®g¿¡¡≤æ\\eºÇÉ´ÜC?œIı…ùùú·WèÆÜºiÖêQÙ‘77bC…\r¶MÖŸ!wÉÉ Úm«¨í\"‡ÿàe¸\0–ò’…K}ç‰_’†`Ω¨m4/ùú}ùg–kêÈ´jµ∫”∞Ë^J\rWPLoór2°∂πëÁ(åaL‘—ÀºlCßÖÿƒìrà Ú¡@?° Ó±√ó°§¶RQy¢h6¢ H/ ÉÿsqrâNHÔDGoé~XAê[^ˇ~üæËñë=‹Ù{á|Ω0˛r`7¥v¥À-j˙vØ∞W¿4qÎ‰oí‚†K´ïcılù∞ßÈôˆπ≤°vù¸2äÛA∆\'Ã ∆î£…ç¬—û\07‹nÜóœ√IM\ntàÔbm#∂3	t∏Ω\0.´≠Ç¯k!)Û\n¥wuÅù\'Ó$˜nUCK\\ÕœÇ‰¨kPPYrgôéùYà,A\\MA\\ŒÕÑ‹≤¢;ãÌÏÿÙ†\'…!&¥wÿ’¸∏íõ9z∏ΩãÂ#∆öÎÌiO±”◊í!-Á¥uvËãeÓ\0Û#–˛<>yB=yÂúœLÉNm7(Á¥ô4Ì¡€S‹˙$’/dW\02ÌÕ”_∫y_åÉÓÓnüpÛv‚ÚÖA´‰‚a7[,W5T√ÒKßbr}\"Ì¥‹¶–∫PÿË µ·År-y/ı¨‚üRÊYÅnñ˙SWï*®Ã≥f]%ıß¨¨ØVPôŸñ%–íO≈˙ñïyVM†ã•¸Ñ˙ù¸¥Jk€‹⁄èLÏ¶9KÎ∑|=ºaî´;¥vt@Mc=4µµ⁄C‘$⁄‹π®—nÓ‡t5DL\rá)˛AV\\V‘◊¬ïºl8u˝\"î÷TÀ\ZtÜ\\cGõ mYΩAøÍ“ò˙¯¬ÚàHX6g>úIø{œá¶VŸÂÚzΩ3Q≤ú!(Ø≠ÇCO*høíE≥#‡oÎ_á‡Ä 9%±ÕtP´’‰±û-◊\\}6=bœ\\¯y˘¿—Ø`1?N.IêMå{+¨ãrnâúKOÉØœá=\nã˙?¨]nÓràæûm/Ë$9ƒàv\rÚ\r0í≥”`ˇô·ÂÏòÖ≤XIú‘t\"Ô±°:ˆ©»«aÛì1&`ß¬æ·∞œæ_ﬂX„‹ÔÄfG–s›üû>1∆`Ÿ√mºæ¬8Ï3{o¬QA∞È(Ö•jÆó•0∂˝¶)èÛ£æ{åÏﬂ¨X„ç¡æë\n_ù˚˛0Æó•›a⁄Ù<«h≤ˇ¯~?{∏èÇﬂÆ4;aÔâ?<§3√$ˇ\0pqrÊ5Y~4m⁄Q«kåºF\rtf%ÿo¨Zo\"gß¡ŒM¬¶M_}=ºxLí:∆¥?h∂M—wºÇ¶s43=Ï’Î1«>B[L}˛Éiÿéé<&…wΩ[OÊh≤Øy›⁄n|ßOÑΩeÕz	ú`ˆ5Ñ˝≠QÿÕ|âˆciöŒÃ„1VC9\'∏ª∏a1æŒ(ÏÛY◊`«ÒÅ∞i-5â3Àc,çYùö°_:ß¨p»kˆñ’{¢qÿ«ÙÉùÒ3óΩŒ/K£9öÏKTo1”‰g\nZ\ZK∞øfÑév¬˛Wÿg3ÆÚñmå!òço˘êÌÊ-vı-ç†…6„J∞ﬂZmvfÏ¬ rH˜L´ëÿn∆Ü —dˇ\0óæm∑è¢9Í∑±Åfvb¶˛∏ˇﬂ¿Ÿ\"\\cÇ@„A«∆}≈h⁄È`ˇôCÇw7–√~ 8l˜˚ä±°9öl;pËêp£&¸Á‹Q¡∞iJrÎ⁄a∆ƒ`‡‹∫3h6æì«_»÷¿gG˜aΩ›$ˆ;OΩ·ìCyΩ≥wc∏9öåŒ\'ÆÁ1÷7K‡œ±;‡hÍhjΩm∫ô⁄ŸÅuÚ(≠©‚r=qñ¥…ı—¯ÜTk4öm¯ÒcO\0è•ûÖ„iâ05h≤^˛>æ‡Í‰Ìùù˙r KÙ˚Ä∂„µØªﬁF¨FöŸTH‡h·ë\Z-\0».)Ä¨í¸;˚åı\r9ﬂöÍ2cd“Ü≠«7Ö~z’äIÕÙl#Û@3ÿ\Z>T“Urˆ!cÕåŒ\'NQ“V2ñCú=\"–¨xx’®§±ËF^Rdè$GÏ|÷0≥ô©§sË≠ÈÑTŸ‘9!Ü±\0´Äf∞ÉâãÉV©lùà#2gGõÌ‰µù1\0´ÇfFùÛÉ∂äY»∏…íÜL^ßÆ.6q <8‘¿àEA„•eEx≤-b˜P∏¥}´WŒ[`ã*&ôŸZõÅf∞…ëj*›˙9z\n‹2Síê\'˘¿ πV?Mä“xKs∞)hõÜ›ñÄ\r¸ÃVÕ_3&Mï‰…~Å˛≥/Å´≥UãmJ€%C\rq›®µÄi4\Zö–M@Yï\rT¶d¶Í˜Ániª≠∫§—K-∞PˇÛ¿·Õ;ù—!P√ﬂı\\´t˜`GGX6ÁAx˛ë•‡Ó‚jm»râ˘Ω¬¶}ø…Ûpñµsç]7‹nÇÊ÷ËÏÓÍÒaˇÈ˙º∫>/H/±˛øÎ˝Ã˛¶3|±˙o·Oæ„‘ÚÛÚ∂≈Í\r*ÆÊ$*h€É#†úågÆ—R◊ŸbSƒÌ†≤{µ_a5b£¥{Ãíê-ö¡Ó`]Øw©îU∏	ØëXö≈∞4¥®YµÛáE9µ»cÅÛZl`‘¢éF¿V€ê‹ÍΩ|ÑMk`ˆ∞nòb-µ![ug[´\"≥,EΩ	Æ\0±¢µ±4â≤6dõ‰hÉ‹M˝lÚ,]lÁê©∫…î◊&w9⁄ wÁ≤\"ú\Zkevò‚ºzF∫rmyc—&{1wè∆‡m‘‘hônA}å˙∑àÒ\0¢œÍ#p?¸uîõÎ·O`Qwîïå˚ßçF6£^ìAwå†~Ü⁄ÅÄ+•@íÛ”A‡¥/c4Ù∏œÁ09ÏÌ¢±s¶Ì¥Ùp÷p{\Z%’ÖQ‰ªu\0µ·JvKl/Y°”Jë®e®π ﬁô]4Tôä:Å:Çp/Ûê~‹Ä6ÄNt“Y$ì\ZÂi•€—íLríOfJB∏µº•ó†ç¿∆`6*Ãà\Zã¢Évú3Ù†ïÓ¥ÂÅ´AU†\nô®HæéPÂê>ˇ`\0ˆ>øë\róCÜ\0\0\0\0IENDÆB`Ç','Catraca de Acesso');
/*!40000 ALTER TABLE `tipo_equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_local`
--

DROP TABLE IF EXISTS `tipo_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_local` (
  `id_tipo_local` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_local` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_local`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_local`
--

LOCK TABLES `tipo_local` WRITE;
/*!40000 ALTER TABLE `tipo_local` DISABLE KEYS */;
INSERT INTO `tipo_local` VALUES (1,'Est√°dio'),(2,'Empresa'),(3,'Condom√≠nio'),(4,'Escola');
/*!40000 ALTER TABLE `tipo_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_mensagem`
--

DROP TABLE IF EXISTS `tipo_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_mensagem` (
  `id_tipo_mensagem` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_mensagem` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mensagem`
--

LOCK TABLES `tipo_mensagem` WRITE;
/*!40000 ALTER TABLE `tipo_mensagem` DISABLE KEYS */;
INSERT INTO `tipo_mensagem` VALUES (1,'Aviso'),(2,'Alerta');
/*!40000 ALTER TABLE `tipo_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pessoa`
--

DROP TABLE IF EXISTS `tipo_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pessoa` (
  `id_tipo_pessoa` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_pessoa` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pessoa`
--

LOCK TABLES `tipo_pessoa` WRITE;
/*!40000 ALTER TABLE `tipo_pessoa` DISABLE KEYS */;
INSERT INTO `tipo_pessoa` VALUES (1,'Pessoa F√≠sica'),(2,'Pessoa Jur√≠dica');
/*!40000 ALTER TABLE `tipo_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servico`
--

DROP TABLE IF EXISTS `tipo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servico` (
  `id_tipo_servico` bigint(20) NOT NULL AUTO_INCREMENT,
  `icone_tipo_servico` longblob,
  `nome_tipo_servico` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servico`
--

LOCK TABLES `tipo_servico` WRITE;
/*!40000 ALTER TABLE `tipo_servico` DISABLE KEYS */;
INSERT INTO `tipo_servico` VALUES (1,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0}Jb\0\0\n7iCCPsRGB IEC61966-2.1\0\0xúùñwTSŸáœΩ7ΩPíäî–khRH\rΩHë.*1	J¿ê\0\"6DTpDQë¶2(‡Ä£Cë±\"äÖQ±ÎD‘qpñId≠ﬂºyÔÕõﬂ˜~küΩœ›gÔ}÷∫\0ê¸É¬LX	Ä°X·Á≈àçãg`\0l\0‡p≥≥B¯Fô|ÿålô¯Ω∫ ˘˚*”?å¡\0ˇüîπY\"1\0PòåÁÚ¯Ÿ\\…8=Wú%∑O…ò∂4MŒ0JŒ\"YÇ2VìsÚ,[|ˆôe9Û2Ñ<ÀsŒ‚e‰‹\'„ç9æåë`Á¯π2æ&cÉtIÜ@∆o‰±|N6\0(í‹.ÊsSdl-cí(2Ç-„y\0‡H…_“/XÃœÀ≈ŒÃZ.$ßà&\\SÜçìã·œœMÁã≈Ã07ç#‚1ÿôY·r\0fœ¸Yym≤\";ÿ8980m-mæ(‘]¸õí˜vñ^ÑÓD¯√ˆW~ô\r\0∞¶eµŸ˙ámi\0]ÎPª˝áÕ`/\0ä≤æu}q∫|^Rƒ‚,g+´‹‹\\Kük)/ËÔ˙üC_|œRæ›ÔÂaxÛì8ít1C^7nfz¶Dƒ»Œ‚p˘Êüá¯˛u¸$æà/îEDÀ¶L Lñµ[»àôBÜ@¯üö¯√˛§Ÿπñâ⁄¯–ñX•!\Z@~\0(* 	{d+–Ô}∆G˘Õã—ôòù˚œÇ˛}W∏L˛»$écGD2∏QŒÏö¸Z4 \0E@Í@Ë¿∂¿∏\0‡A(àq`1‡ÇêD Äµ†îÇ≠`\'®u†4É6ptÅc‡48.ÅÀ`‹R0ûÄ)\nÃ@ÑÖ»Rát C»≤ÖXê‰CPî%CBH@Î†R®™ÜÍ°fË[Ë(t\Z∫\0\rC∑†Qh˙z#0	¶¡Z∞l≥`O8éÑ¡…28.Ç∑¿ïp|ÓÑO√ó‡X\n?ÅßÄ:¢ã0¬FBëx$	!´ê§i@⁄ê§πäHëß»[EE1PLî Ö‚¢ñ°V°6£™QPù®>‘U‘(j\nıMFk¢Õ—ŒË\0t,:ùã.FW†õ–Ë≥ËÙ8˙É°cå1éL&≥≥≥”é9Ö∆åa¶±X¨:÷Îä\r≈r∞bl1∂\n{{{;é}É#‚tp∂8_\\<Nà+ƒU‡Zp\'pWp∏ºﬁÔå≈ÛÀÒe¯F|~?éü!(å	ÆÑHB*a-°í–F8K∏KxA$ıàNƒp¢Ä∏ÜXI<D<O%æ%QHf$6)Å$!m!Ì\'ù\"›\"Ω ì…Fdr<YLﬁBn&ü!ﬂ\'øQ†*X*(V+‘(t*\\Qx¶àW4TÙT\\¨òØX°xDqHÒ©^…Hâ≠ƒQZ•T£tTÈÜ“¥2UŸF9T9Cy≥rãÚÂG,≈à‚C·Qä(˚(g(cTÑ™OeSπ‘u‘FÍYÍ8\rC3¶–Ri•¥ohÉ¥)ääùJ¥JûJç q)°—ËÈÙ2˙a˙u˙;U-UOUæÍ&’6’+™Ø’Ê®y®Ò’J‘⁄’F‘ﬁ©3‘}‘”‘∑©w©ﬂ”@iòiÑk‰jÏ—8´ÒtméÀÓúí9áÁ‹÷Ñ5Õ4#4WhÓ”–ú÷“÷Ú” “™“:£ıTõÆÌ°ù™ΩC˚Ñˆ§U«MG†≥CÁ§ŒcÜ\n√ìëŒ®dÙ1¶t5u˝u%∫ı∫É∫3z∆zQzÖzÌz˜Ù	˙,˝$˝˙Ω˙S:!≠∑\rÒÜ,√√]Ü˝ÜØçåçbå6u=2V30Œ7n5ækB6q7Yf“`rÕc 2M3›mzŸ6≥7K1´12áÕÃÊªÕá-–NBããL”ìô√leéZ“-É--ª,üYX≈[m≥Í∑˙hmoùn›h}«ÜbhSh”cÛ´≠ô-◊∂∆ˆ⁄\\Ú\\ﬂπ´Ávœ}ngn«∑€cw”ûjbø¡æ◊˛ÉÉ£É»°Õa“—¿1—±÷Òã∆\ncmfùwB;y9≠v:ÊÙ÷Ÿ¡YÏ|ÿ˘¶KöKãÀ£y∆Û¯Û\ZÁçπÍπr\\Î]•n∑D∑ΩnRw]wé{É˚}ûGì«Ñß©g™ÁAœg^÷^\"ØØ◊lgˆJˆ)oƒ€œªƒ{–á‚ÂSÌsﬂWœ7Ÿ∑’w œﬁoÖﬂ)¥êˇ6ˇZ‹ÄÊÄ©@«¿ïÅ}A§†A’AÇÕÇE¡=!pH`»ˆêªÛ\rÁÁwÖÇ–Ä–Ì°˜¬å√ñÖ}é	Ø	aQ—øÄ∫`…ÇñØ\"Ω\"À\"ÔDôDI¢z££¢õ£_«x«î«Hc≠bW∆^ä”àƒu«c„£„õ‚ß˙,‹πp<¡>°8·˙\"„Eyã.,÷Xúæ¯¯≈%ú%G—â1â-âÔ9°úŒÙ“Ä•µKß∏lÓ.ÓûooíÔ /ÁO$π&ï\'=JvMﬁû<ô‚ûRëÚT¿Tûß˙ß÷•æNM€üˆ)=&Ω=óëòqTH¶	˚2µ3Û2á≥Ã≥ä≥§ÀúóÌ\\6%\n5eCŸã≤ª≈4Ÿœ‘ÄƒD≤^2ö„ñSìÛ&7:˜Hûrû0o`πŸÚMÀ\'Ú}Ûø^ÅZ¡]—[†[∞∂`t•Á ˙U–™•´zWÎØ.Z=æ∆oÕÅµÑµik(¥.,/|π.f]OëV—ö¢±ı~Î[ãäE≈76∏l®€à⁄(ÿ8∏iÓ¶™MKx%K≠K+JﬂoÊnæ¯ïÕWï_}⁄í¥e∞Ã°lœVÃV·÷Î€‹∑(W.œ/€≤ΩscG…éó;óÏºPaWQ∑ã∞K≤KZ\\Ÿ]ePµµÍ}uJıHçWM{≠fÌ¶⁄◊ªyªØÏÒÿ”VßUWZ˜nØ`ÔÕzø˙Œ£Üä}ò}9˚6F7ˆÕ˙∫πI£©¥È√~·~ÈÅà}ÕéÕÕ-ö-e≠p´§uÚ`¬¡Àﬂx”›∆l´oß∑óá$áõ¯Ìı√Aá{è∞é¥}g¯]mµ£§Í\\ﬁ9’ï“%ÌéÎ>\Zx¥∑«•ß„{ÀÔ˜”=Vs\\ÂxŸ	¬â¢üNÊüú>ïuÍÈÈ‰”cΩKzÔúâ=s≠/ºol–ŸÛÁ|œùÈ˜Ï?yﬁı¸±Œé^d]Ï∫‰p©s¿~†„˚:;áá∫/;]Óû7|‚ä˚ï”WΩØûªpÌ“»¸ë·ÎQ◊oﬁH∏!Ω…ª˘ËV˙≠Á∑snœ‹Ys}∑‰û“Ωä˚ö˜~4˝±]Í =>Í=:`¡É;c‹±\'?eˇÙ~ºË!˘a≈ÑŒDÛ#€G«&}\'/?^¯x¸I÷ìôß≈?+ˇ\\˚Ã‰Ÿwøx¸20;5˛\\Ù¸”Øõ_®øÿˇ“ÓeÔtÿÙ˝WØf^óºQs‡-Îmˇªòw3πÔ±Ô+?ò~Ë˘ÙÒÓßåOü~˜ÑÛ˚èpf*\0\0\0	pHYs\0\0C“\0\0C“¢P`\0\0≠IDATxúµW	L‘Ÿ3ÛÄ)Çé2Ç¬ñC‰≤eD[$AÕ≤≈µÄ/<÷U4PèÉV7iTTDIîı>0ä±)Üz¡F[4⁄1Í\nÆ\\ÉBf∏úô˛ﬁﬂôÈú.M⁄_Úœˇ]ﬂ˜æ˜ΩÔzT´’ÜU´V]æq„∆FJt∏Q\\¸a<Ô÷∏QOKABı¢’Úÿ\0ÒˆˆÆÁÛ˘Íññ)7˚£B1ôË»>.W(>”3ßiii9ßE¢6∂\">>æê„Ò·√yã-íë≤≤p¢R	âùùäƒ«ˇ≥∂∂÷è¶¶¶<˛¸π]Õ §8yÚ‰>Æ\'óªíÄÄz“ﬂÔI&Oñì∆∆`nO°P®açÄòò˚çJ•óû⁄ÀÀÎy[[€™◊≈ï+WŒú9ìÆV´˘ªvÌ MJJ*7c˜Ó›ﬂ:t(o√§I?q´ìíoﬁº9˜¬ÖªË¥i”ö{zz¸∏â‰‰JÓ·ÿ‰¨Y≥d¥££√ﬂ‚∫˛”ûgÍ‡‡¿Ñdﬂ¸òSßN§«èˇ:C.s#}Ü#ﬂRSÑs´LH››Ïw‰»ë˝t2&´´´É#\"\"^2·ÿÑJ•‚„ÍfµÙ¿˙ıÎ———ﬂøzı*‘ŸŸŸî+–€€ÎÏÁÁW˜‚≈ã0ù8úûFGGÎ◊Ø?}ÛÊÕ-]]]Å‹jW◊VòÅAÛƒ≈•sJ_ﬂL0Òa›Öñ=~¸xÁÂÂÂ•1b24‰h –ö›=ÎÕ3‚≠[∑¶ˆˆˆ*√ûur\Z∞¶NJÂÃ1‰ù={6õÆY≥Ê$ì¬ŒŒNkìÿ\n≈/hQQQ¶ããKõÇùWßeùﬁ\Zªt–A˙˙<çÃô3GFuúº†Éœ°@…Œù;Ør≥˜Ó}N>|∞3¨¶t\\ﬂ‹ªwo∆‚≈ãˇ—ﬁﬁl‰+VîÎ€∞‹¥SßNmìJ•5∏∂÷¶¶&ü˙˙˙_eeeÂÓÿ±„ Åé¯jÕ¥=88Ë∞rÂ ÀçççÅ∞ÊÃÛaÅsÁŒ}v˝˙ıTÿÆ⁄x=5Ó∞ªEêπyÁŒù5÷î…˛PUUYVV∂ŒÇLˆ}øÑÎ®TDàﬂòP˘eÛª±±±Snnnoªªªi`ˆΩÅò°∑WhpN=‰rú§v£Öèz«≈≈]ª{˜ÓZ⁄◊◊ÁÕXŸì®®®ßp*Jó.]ZÇs˝é ò¿)Ñ‹ä·aG*664ÙÅkÖ£{ˆÏ˘.11±ê*ïJ7XU%%——2õ€˙˘u⁄ïïë–xuMMÕ\\\Z^Õ\rZâú6°[;{ˆÏó,h&Lh‰-}ˆÏŸ|ÆgÏ?›Z[Ö~¥ÒààZ}∞#Ôﬂ;©¥”Ñ®¶∆ãH$\\[,Ê˛çVót˚ˆÌE»5ı¡\'ÊêHîÃÙ]¯ ⁄íííØËÙÈ”{333èÄA¯Ñè\0\\Ωzuuzz˙5Œõõõ√\ZÎDAÃ\n1°ãıMc≥7¯#|öììÛ-§ÇDEΩ4ﬂ,¢ßõΩâ7644,ê#ãÃü?øf*ÑˇK£—ÿMπ∫∫*JKKWmÿ∞·Ø∆4Ò¿)˘˘˘YX«KHH¯æøÖÑÑ4Mô2e»|-≤§s]]]îèÀ˘=é™ÑÁ¨[∑ÆÃjmECÇR	‚Àﬂ!@Ê∂m€ä>)•H’Kñ,y >t≥ŸíùGLLLÈõ7o|`-ÀCCCõm\n\0√ÙD\n≠¬Ü˘8çè≈]]ìàØoÒ¥ò”C(îìññ@$rŒ‰UÂè=J`ÌMõ6}‡AúL&˚-¨Oa\"@nnnÍ±c«2!iÄX,∂PØ¨ú±≠VÒ¨;Â≈ã≥¿?œ◊◊˜ÂπsÁ∂§§§‹·8q‚ƒ˙Kó.maY±NmïöÅœüX‹¯ƒ:ü˜ùùù˛‚Zpc¥≤≤Ú◊áﬁ]QQgÿ\\&AD/%ÊâZ≠Ê°úÒ…Õ˚˚ßìD ∞¢§$ëÃõWá<>Ñ|æWrûUó·.µ¡¡¡?\Zéé⁄ì∑oΩ-ò4\ZJ⁄€?≥:7:Í†o\"ØWK$ín\nuHìììÔ˝◊˝Ä2øùUπ?¿0¨K¸Fkk´EP˝z„∆çÖ(>f˙˚˚wp3¨rqëÛ+@T#n»\'õ\\y<5qvÓÜ!ZF8J«ÙÕ\'OûH°˝466∂z˚ˆÌ\'PZ˝!3Z hId‰sÛBéCw∑y¥—§Ë3áH‘EööàõõMWF‹wXΩzıµÉÓ—øDN#¿Ob‘pëNNNñ˘åA≠∂}Ú	Æ{˜ÓùoÉö˝˚˜ÔEU€àÿSh˘ÚÂwÒ6ë„uëa®RÕ°—∞“∆∫Äˇô∑äÏÏÏoPîoG$\\Ä`ƒÆÿ4£¬˘Ôçi(ïc°Ö.dÆKà¬ÉÂ„›πª°“˜≥ππ∞Ö+>Z^^˛≈≠[∑í¡/œxﬁj2Ç=<¿ÁéöÕöŸâ∫’””≥ù›\n¡\nD±6ktûè‰„É¥˚Eqqq\n™Nî„˘ÖÖÖÈ˙g´9¨\n†áH$R°@8 >˝ÿ˝˚˜†æﬂÅtãáE˘Ë)„H.œó-[vÒ˝÷æ}˚\nÿ˜s⁄a¯7áºr]ZK\r}\0\0\0\0IENDÆB`Ç','Ambul√¢ncia'),(2,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0\0\0w≈ç¥\0\0\n7iCCPsRGB IEC61966-2.1\0\0xúùñwTSŸáœΩ7ΩPíäî–khRH\rΩHë.*1	J¿ê\0\"6DTpDQë¶2(‡Ä£Cë±\"äÖQ±ÎD‘qpñId≠ﬂºyÔÕõﬂ˜~küΩœ›gÔ}÷∫\0ê¸É¬LX	Ä°X·Á≈àçãg`\0l\0‡p≥≥B¯Fô|ÿålô¯Ω∫ ˘˚*”?å¡\0ˇüîπY\"1\0PòåÁÚ¯Ÿ\\…8=Wú%∑O…ò∂4MŒ0JŒ\"YÇ2VìsÚ,[|ˆôe9Û2Ñ<ÀsŒ‚e‰‹\'„ç9æåë`Á¯π2æ&cÉtIÜ@∆o‰±|N6\0(í‹.ÊsSdl-cí(2Ç-„y\0‡H…_“/XÃœÀ≈ŒÃZ.$ßà&\\SÜçìã·œœMÁã≈Ã07ç#‚1ÿôY·r\0fœ¸Yym≤\";ÿ8980m-mæ(‘]¸õí˜vñ^ÑÓD¯√ˆW~ô\r\0∞¶eµŸ˙ámi\0]ÎPª˝áÕ`/\0ä≤æu}q∫|^Rƒ‚,g+´‹‹\\Kük)/ËÔ˙üC_|œRæ›ÔÂaxÛì8ít1C^7nfz¶Dƒ»Œ‚p˘Êüá¯˛u¸$æà/îEDÀ¶L Lñµ[»àôBÜ@¯üö¯√˛§Ÿπñâ⁄¯–ñX•!\Z@~\0(* 	{d+–Ô}∆G˘Õã—ôòù˚œÇ˛}W∏L˛»$écGD2∏QŒÏö¸Z4 \0E@Í@Ë¿∂¿∏\0‡A(àq`1‡ÇêD Äµ†îÇ≠`\'®u†4É6ptÅc‡48.ÅÀ`‹R0ûÄ)\nÃ@ÑÖ»Rát C»≤ÖXê‰CPî%CBH@Î†R®™ÜÍ°fË[Ë(t\Z∫\0\rC∑†Qh˙z#0	¶¡Z∞l≥`O8éÑ¡…28.Ç∑¿ïp|ÓÑO√ó‡X\n?ÅßÄ:¢ã0¬FBëx$	!´ê§i@⁄ê§πäHëß»[EE1PLî Ö‚¢ñ°V°6£™QPù®>‘U‘(j\nıMFk¢Õ—ŒË\0t,:ùã.FW†õ–Ë≥ËÙ8˙É°cå1éL&≥≥≥”é9Ö∆åa¶±X¨:÷Îä\r≈r∞bl1∂\n{{{;é}É#‚tp∂8_\\<Nà+ƒU‡Zp\'pWp∏ºﬁÔå≈ÛÀÒe¯F|~?éü!(å	ÆÑHB*a-°í–F8K∏KxA$ıàNƒp¢Ä∏ÜXI<D<O%æ%QHf$6)Å$!m!Ì\'ù\"›\"Ω ì…Fdr<YLﬁBn&ü!ﬂ\'øQ†*X*(V+‘(t*\\Qx¶àW4TÙT\\¨òØX°xDqHÒ©^…Hâ≠ƒQZ•T£tTÈÜ“¥2UŸF9T9Cy≥rãÚÂG,≈à‚C·Qä(˚(g(cTÑ™OeSπ‘u‘FÍYÍ8\rC3¶–Ri•¥ohÉ¥)ääùJ¥JûJç q)°—ËÈÙ2˙a˙u˙;U-UOUæÍ&’6’+™Ø’Ê®y®Ò’J‘⁄’F‘ﬁ©3‘}‘”‘∑©w©ﬂ”@iòiÑk‰jÏ—8´ÒtméÀÓúí9áÁ‹÷Ñ5Õ4#4WhÓ”–ú÷“÷Ú” “™“:£ıTõÆÌ°ù™ΩC˚Ñˆ§U«MG†≥CÁ§ŒcÜ\n√ìëŒ®dÙ1¶t5u˝u%∫ı∫É∫3z∆zQzÖzÌz˜Ù	˙,˝$˝˙Ω˙S:!≠∑\rÒÜ,√√]Ü˝ÜØçåçbå6u=2V30Œ7n5ækB6q7Yf“`rÕc 2M3›mzŸ6≥7K1´12áÕÃÊªÕá-–NBããL”ìô√leéZ“-É--ª,üYX≈[m≥Í∑˙hmoùn›h}«ÜbhSh”cÛ´≠ô-◊∂∆ˆ⁄\\Ú\\ﬂπ´Ávœ}ngn«∑€cw”ûjbø¡æ◊˛ÉÉ£É»°Õa“—¿1—±÷Òã∆\ncmfùwB;y9≠v:ÊÙ÷Ÿ¡YÏ|ÿ˘¶KöKãÀ£y∆Û¯Û\ZÁçπÍπr\\Î]•n∑D∑ΩnRw]wé{É˚}ûGì«Ñß©g™ÁAœg^÷^\"ØØ◊lgˆJˆ)oƒ€œªƒ{–á‚ÂSÌsﬂWœ7Ÿ∑’w œﬁoÖﬂ)¥êˇ6ˇZ‹ÄÊÄ©@«¿ïÅ}A§†A’AÇÕÇE¡=!pH`»ˆêªÛ\rÁÁwÖÇ–Ä–Ì°˜¬å√ñÖ}é	Ø	aQ—øÄ∫`…ÇñØ\"Ω\"À\"ÔDôDI¢z££¢õ£_«x«î«Hc≠bW∆^ä”àƒu«c„£„õ‚ß˙,‹πp<¡>°8·˙\"„Eyã.,÷Xúæ¯¯≈%ú%G—â1â-âÔ9°úŒÙ“Ä•µKß∏lÓ.ÓûooíÔ /ÁO$π&ï\'=JvMﬁû<ô‚ûRëÚT¿Tûß˙ß÷•æNM€üˆ)=&Ω=óëòqTH¶	˚2µ3Û2á≥Ã≥ä≥§ÀúóÌ\\6%\n5eCŸã≤ª≈4Ÿœ‘ÄƒD≤^2ö„ñSìÛ&7:˜Hûrû0o`πŸÚMÀ\'Ú}Ûø^ÅZ¡]—[†[∞∂`t•Á ˙U–™•´zWÎØ.Z=æ∆oÕÅµÑµik(¥.,/|π.f]OëV—ö¢±ı~Î[ãäE≈76∏l®€à⁄(ÿ8∏iÓ¶™MKx%K≠K+JﬂoÊnæ¯ïÕWï_}⁄í¥e∞Ã°lœVÃV·÷Î€‹∑(W.œ/€≤ΩscG…éó;óÏºPaWQ∑ã∞K≤KZ\\Ÿ]ePµµÍ}uJıHçWM{≠fÌ¶⁄◊ªyªØÏÒÿ”VßUWZ˜nØ`ÔÕzø˙Œ£Üä}ò}9˚6F7ˆÕ˙∫πI£©¥È√~·~ÈÅà}ÕéÕÕ-ö-e≠p´§uÚ`¬¡Àﬂx”›∆l´oß∑óá$áõ¯Ìı√Aá{è∞é¥}g¯]mµ£§Í\\ﬁ9’ï“%ÌéÎ>\Zx¥∑«•ß„{ÀÔ˜”=Vs\\ÂxŸ	¬â¢üNÊüú>ïuÍÈÈ‰”cΩKzÔúâ=s≠/ºol–ŸÛÁ|œùÈ˜Ï?yﬁı¸±Œé^d]Ï∫‰p©s¿~†„˚:;áá∫/;]Óû7|‚ä˚ï”WΩØûªpÌ“»¸ë·ÎQ◊oﬁH∏!Ω…ª˘ËV˙≠Á∑snœ‹Ys}∑‰û“Ωä˚ö˜~4˝±]Í =>Í=:`¡É;c‹±\'?eˇÙ~ºË!˘a≈ÑŒDÛ#€G«&}\'/?^¯x¸I÷ìôß≈?+ˇ\\˚Ã‰Ÿwøx¸20;5˛\\Ù¸”Øõ_®øÿˇ“ÓeÔtÿÙ˝WØf^óºQs‡-Îmˇªòw3πÔ±Ô+?ò~Ë˘ÙÒÓßåOü~˜ÑÛ˚èpf*\0\0\0	pHYs\0\0\0\0“›~¸\0\0	IDATxúÖV	tT’˛ﬁÃõ%≥ÑHVñÄƒò 6U¿}A‰hiR{Í¡Ç«c•D{j¨j™jEm’Zh≠k]†«ñEà\n\"A@Ÿb÷…$ôd∂Ã˙fÊÕ[˚øóôqp˙üsÁﬁy˜øˇÚ˝ÀΩ,\0ÜT\"mfµÖø£E}˚^˙ÜU∞⁄◊Ø?}ˆ*|_`\"bb÷]Ã®è©õ=ö\'ù„Ûw)«˜l√Ω/√¿Æ∫≥fÉÁõã~{ıv„œØ.ü tYYÈú]›;◊Áeﬁv≠:©ÓF˚r+¢ﬁÉπSÚ WUñÕ	WÕS∞ÔÂ5ò≤ÁHw~ÜæÔ`Ã+]wáus√•3n≈\'/æ\r◊å%‰ﬁø–≤¢¯õsµ–›SÃ÷~ﬁoÆT&\\0+yÙ≥˚ÌÓ#ˇEƒ€ïéÙ°hı˚‰Ü∆∞‰q”}xΩ⁄Ÿˆ>\"˛nÑ}(zË#òÚ>ycæ\'÷y≈UT∏™ ∆cXøXÊ÷Ωó)“EñöÑCÄ4ÅÅlÔ˙ZWo—l“·ˇ‡π…hZ¯\'¥Ô˚ƒ¥Ûn≤‚ËÓø7Ú¶µ∆ddÿ’sê9ò^ÈÄ=ïQS\Zy$_ZarˇÊ-Ê¬XBàÊ\\º–≈,ﬁ¯‰¸˛˙Ó{?ﬁ+øú˚nd”cãÿÅá∑äU∫MM”äLË9ãà≠¨	_/6<ª\0ﬁŒn‹vΩÛ•øÆe^J%Ä4çôï∏∂yõ4°Y≥†Tk[iæ˚ë°v$G¬pyıYêN\Zê)∫\0ã2¸Å–»Ã¬˙ÂŒ5√Ì_Ω.ÏÖ—»¬d¬^ySº≠&pÒ2pÖ≠—jgmﬂ@¬ÕÊB¸èñô«›«[ëåxëå˙as^ÄHØÑ‡æC(.1@‰-HÜìpñ^ekøgS‹íÀquŸÉµè.3n=wí≤Ë €∑b˚´´0±q9\Z\'Õ\"°q$¬Ap!7]€ê∂·´{6˘Ê1ÖdÅ¸â˛ßÂ«Ÿ‰{M≠q0WÙsÍÁŸ˝<5ˇsÙ>[5+rLg ⁄≥ënAE13eıùÁ¨¶sø,àµ˘·[¶|Y?[.ø˚âÅYâî\ZÀÌ5ï3˜ã6Êƒ±~u7õ’ÊÆ«\\πÎ256%+™¶€=\'ûÖß}‚!6?*Fﬂ˘ÖqDM	8Klh˘‘£ºê« ‰ñÕŒ|˛Ú•K ÃˆIvÏE\"2å47.¢¯´îpÇá¸©G}(>[Nª\'º}aIÌﬁÆÑ∫ô`æôîÑLí:\rQ≈âB‡O…ƒ›tÈı°¡ì§πúø´)°ÿóÇÀåÄ\'NŒœÒÎ‰˛€ò“o˜Ø/Î;˛‹ª∂£¢∞π.kv\0ù€a¥©ÑCΩº±~∫•âéŒU£≤w7]”:‹{ÑÃ\r¡Y7Åæ‰˜0•¥≤lGWoí\\‡!	¿ +Àˆ¨ÍˆÎaÃÅQwnuÉ∞Èx|b/¢(=Aî4£c ¶°wîëü”d63í(éÊÅ’ÃÿwlûèT<@®á :ˆ≥(≠U(ˇîπ  gÇ$âjÅ\\ÅA¡‘j«yù=¬…ú…]Ø÷ì…!\\çW>Ç©≥¬Ñ…\\äT4\rW]7|=m0[ªË‰zOâ¬ Êˆ∆\'Ób2\"¨_}ÿÇÔ˚„ ·˛Ê\0j\Z.Aiu-∏@J*°¸˝n‡32äÄüzú¶\"mÌ*aÍ∫aSµ◊hæáEnıcEOP=§ÌﬂœåRæ∆V\ZQ«Êo’kµÖŸ»ÿy¥ÅûÅ˘¶öãF±ÕPO)¡≥Œ\'P∂‡Û¶‚÷Æ0v¯£Í@°ú3ù”®ƒn¨å&eﬁÄBE‘ûU·Ó∑÷:ü≤Nôÿµ¸ß’[æ>i\rÑR√P¶|\\≥gÿ/{£yˆ‚Ûg◊7ﬁπ\\Ø3!¡Œ?œÑg –Ω|˚—úzf∑/Ñ^QÇ`7°¥ é93«cŸ‰qò{I^söôÊÑ†˙Ú1»ı\" π‰ﬁAıi˙ÙÙuSŸÁü|jŒkÔõ÷ZFç‹´”EG,–´◊j“◊áL:!ßëÄÕ,OøºAY;w÷JËI/“¯ŒçùèÓ++™\\à,ã1îÉpß[ZÛ»mï\rwØõ∑Äu‘Ä1—•LäC˝îÔAd¯?¸	‘4ïSô!íÆPÃ*◊åêiVTÙøyK\nïˇø$“©‹ÂdúÂıàE¬à;¡Eá©\"#‰uúPìÈŒ`ûËá‚˜CÂ©WP∆ bV9\r9kàµòÏ7¬p¶\\:\rÅ›±–ˆ@À≥ÎÆπ—˜Ì~Ú6Uå¡,˜”IÇ¡\0{E,5Áë“JyUÙçáˆ“µ1√2Æò–\ZÅ¬´’wÕg^!±∑^=y∆ﬁG∑\\_∫Íôı˜˝~$¢XÇµHpT¥OîƒtÌ⁄K‡(ùÅÒÈ˜ 2¸\rÑË\0§yNíxQ@‹Ç,2ÑÑù3,˝ı≠ï‚Üw¸?ÀÈ;≠ük58Êø∂a…ÜêoXÔmÖI&RCè¶‚∞+\nÃ*Ö%CWñ∑M2¨∂rÙ«zŒ†*Ÿ0h9@kûx&¸ùw›‹xÙç˜é=wZj \rcÿÙ»yèÒ…ìàçd”‡5Â≠”Ù‡®ƒ¿—(∆93(õ1æ!3§– JŒ∫ÇÑ÷˜y†ÕZ˜÷˙ßëﬁìqz_ÃªX}†™≤x©úV¨ëxôh)ıQcéË^ôQœ≈åL¯C“jÜˆÄ·ÉH‚h∂˜S≤;`7äLO}Û®bV¥¶Åú\ZrZMívÙ&Ñ ©¸‘JfÒì+∏]ébÀƒtí#aº^VKÓ∆ë$èÏË?æìêr	m[ˇÇ´ó=@âÁAÁÅV‘˛`\ZØ*AYÕ4ºÛ¯Ì†\'ûnDu˘Ò.&Û∑ΩÒ•}ÉR˜)eòkùŸP¥”“•˝üV¡ú_7	s\'ó·bﬂ=”Ë`QGÔJ[ÜÍj€ã\\≥˘¯π5˙l$ë±Å£∞ÿ!Ifts6\Zà¢≠Àè]C8,àä∏bLŸüíÖÜd˜O∫É8Iü_[¶mÃ‹ã*±Ê‹,L`?E„È>;$Er<c˚À/£BŒFcj¸√i¯ÿ≠ﬁ<ñÁlMÌlÙ?ª~÷–9M3,\0\0\0\0IENDÆB`Ç','Pol√≠cia Militar'),(3,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0z\0\0\0z\0\0\0pYG‰\0\0\0	pHYs\0\0a\0\0a®?ßi\0\0\nOiCCPPhotoshop ICC profile\0\0x⁄ùSgTSÈ=˜ﬁÙBKàÄîKoR RBãÄë&*!	Jà!°ŸQ¡EE»†àééÄåQ,ä\nÿ‰!¢éÉ£àä ˚·{£k÷º˜ÊÕ˛µ◊>Á¨Ûù≥œ¿ñH3Q5Ä©B‡É«ƒ∆·‰.@Å\n$p\0≥d!s˝#\0¯~<<+\"¿æ\0x”\0¿Mõ¿0áˇÍBô\\ÄÑ¿të8KÄ\0@zéB¶\0@FÄùò&S\0†\0`Àcb„\0P-\0`\'Ê”\0Äù¯ô{\0[î!†ë\0 eàD\0h;\0¨œVäE\0X0\0fKƒ9\0ÿ-\00IWfH\0∞∑\0¿Œ≤\0\00QàÖ)\0{\0`»##x\0Ñô\0FÚW<Ò+ÆÁ*\0\0xô≤<π$9EÅ[-qWW.(ŒI+6aaö@.¬yô2Å4‡ÛÃ\0\0†ë‡ÉÛ˝xŒÆŒŒ6é∂_-Íøˇ\"bb„˛Âœ´p@\0\0·t~—˛,/≥\ZÄ;Äm˛¢%Óh^†u˜ãf≤@µ\0†È⁄WÛp¯~<<E°êπŸŸÂ‰‰ÿJƒB[a W}˛g¬_¿W˝l˘~<¸˜ı‡æ‚$Å2]ÅG¯‡¬ÃÙL•œí	Ñb‹ÊèG¸∑ˇ¸”\"ƒIbπX*„QqéDöåÛ2•\"âBí)≈%“ˇd‚ﬂ,˚>ﬂ5\0∞j>{ë-®]cˆK\'Xt¿‚˜\0\0Úªo¡‘(ÄhÉ·œwˇÔ?˝G†%\0ÄfIíq\0\0^D$.T ≥?«\0\0D†Å*∞AÙ¡,¿¡‹¡¸`6ÑB$ƒ¬BB\ndÄr`)¨ÇB(ÜÕ∞*`/‘@4¿QhÜìp.¬U∏=p˙aû¡(ºÅ	A»a!⁄àbäX#éôÖ¯!¡Hã$ …àQ\"Kë5H1RäT UHÚ=r9á\\F∫ë;»\02Ç¸ÜºG1îÅ≤Q=‘µCπ®7\ZÑF¢–dt1öè†õ–r¥\Z=å6°Á–´h⁄è>C«0¿Ë3ƒl0.∆√B±8,	ìcÀ±\"¨´∆\Z∞V¨ªâıcœ±wÅE¿	6wB aAHXLXNÿH® $4⁄	7	ÑQ¬\'\"ì®K¥&∫˘ƒb21áXH,#÷è/{àCƒ7$âC2\'πêI±§T““F“nR#È,©õ4H\Z#ì…⁄dk≤9î, +»Ö‰ù‰√‰3‰‰!Ú[\nùb@q§¯S‚(R jJÂÂ4Âeò2AU£öR›®°T5èZB≠°∂RØQá®4uö9ÕÉIK•≠¢ï”\Zhh˜iØËt∫›ïNó–W“ÀÈGËóËÙw\rÜÉ«àg(õgwØòL¶”ã«T071ÎòÁôôoUX*∂*|ë \nïJï&ï*/T©™¶™ﬁ™UÛUÀTè©^S}ÆFU3S„©	‘ñ´U™ùPÎSSg©;®á™g®oT?§~Y˝âY√L√OC§Q†±_„º∆ c≥x,!k\r´ÜuÅ5ƒ&±ÕŸ|v*ªò˝ªã=™©°9C3J3W≥RÛîf?„òq¯útN	Á(ßóÛ~äﬁÔ)‚)¶4Lπ1e\\k™ñóñX´H´Q´GÎΩ6ÆÌßù¶ΩEªY˚ÅA«J\'\\\'GgèŒùÁSŸS›ß\nßM=:ıÆ.™k•°ªDwønßÓòûæ^ÄûLoßﬁyΩÁ˙}/˝T˝m˙ßıGX≥$€Œ<≈5qo</«€ÒQC]√@C•aïaó·Ñëπ—<£’FçFåi∆\\„$„m∆m∆£&&!&KMÍMÓöRMπ¶)¶;L;L«ÕÃÕ¢Õ÷ô5õ=1◊2ÁõÁõ◊õﬂ∑`ZxZ,∂®∂∏eI≤‰Z¶YÓ∂ºnÖZ9Y•XUZ]≥F≠ù≠%÷ª≠ªßßπNìN´û÷g√∞Ò∂…∂©∑∞Âÿ€Æ∂m∂}agbg∑≈Æ√ÓìΩì}∫}ç˝=\ráŸ´Z~s¥r:V:ﬁöŒúÓ?}≈ÙñÈ/gXœœÿ3„∂À)ƒiùSõ”GggπsÉÛàãâKÇÀ.ó>.õ∆›»Ω‰Jtıq]·z“ıùõ≥õ¬Ì®€ØÓ6ÓiÓá‹üÃ4ü)ûY3s–√»C‡QÂ—?üï0kﬂ¨~OCOÅgµÁ#/c/ëW≠◊∞∑•w™˜aÔ>ˆ>rü„>„<7ﬁ2ﬁY_Ã7¿∑»∑ÀO√oû_ÖﬂC#ˇdˇzˇ—\0ßÄ%gâÅAÅ[˚¯z|!øé?:€eˆ≤ŸÌAå†πAAèÇ≠ÇÂ¡≠!h»Ïê≠!˜ÁòŒëŒiÖP~Ë÷–aÊaã√~\'ÖáÖWÜ?épàX\Z—1ó5w—‹CsﬂD˙DñDﬁõg1O9Ø-J5*>™.j<⁄7∫4∫?∆.fYÃ’XùXIlK9.*Æ6nlæﬂ¸ÌÛá‚ù‚„{ò/»]py°Œ¬ÙÖß©.,:ñ@LàN8îA*®å%Úw%é\ny¬¬g\"/—6—àÿC\\*NÚH*MzíÏëº5y$≈3•,ÂπÑ\'©êºL\rL›õ:ûöv m2=:Ω1ÉíëêqB™!Mì∂gÍgÊfvÀ¨eÖ≤˛≈nã∑/ï…k≥ê¨Y-\n∂B¶ËTZ(◊*≤geWføÕâ 9ñ´û+ÕÌÃ≥ €ê7úÔüˇÌ¬·í∂•ÜKW-XÊΩ¨j9≤<qy€\n„+ÜV¨<∏ä∂*m’O´ÌWóÆ~Ω&zMkÅ^¡ Ç¡µkÎU\nÂÖ}Î‹◊Ì]OX/Yﬂµa˙Üù>âäÆ€óÿ(‹xÂáo øô‹î¥©´ƒπdœf“fÈÊﬁ-û[ñ™óÊón\rŸ⁄¥\rﬂV¥ÌıˆE€/óÕ(€ªÉ∂Cπ£ø<∏ºeß…ŒÕ;?T§TÙT˙T6Ó“›µa◊¯n—Ó{ºˆ4Ï’€[º˜˝>…æ€UUM’f’e˚I˚≥˜?Æâ™È¯ñ˚m]≠NmqÌ«“˝#∂◊π‘’“=TRè÷+ÎG«æ˛ùÔw-\r6\rUçú∆‚#pDy‰È˜	ﬂ˜\r:⁄vå{¨·”vg/jBöÚöFõSö˚[b[∫OÃ>—÷Íﬁz¸G€ú4<YyJÛT…i⁄ÈÇ”ìgÚœåùïù}~.˘‹`€¢∂{ÁcŒﬂjoÔ∫t·“EˇãÁ;º;Œ\\Ú∏tÚ≤€ÂW∏WöØ:_mÍtÍ<˛ì”O«ªúªöÆπ\\kπÓzΩµ{f˜Èû7Œ›ÙΩyÒˇ÷’û9=›ΩÛzo˜≈˜ıﬂ›~r\'˝ŒÀªŸw\'Ó≠ºOº_Ù@ÌAŸC›á’?[˛‹ÿÔ‹j¿w†Û—‹G˜ÖÉœ˛ëıèCèôèÀÜ\rÜÎû8>99‚?r˝È¸ßCœdœ&û˛¢˛ÀÆ/~¯’Î◊Œ—ò—°óÚóìøm|•˝Í¿ÎØ€∆¬∆æ…x31^ÙV˚Ì¡w‹wÔ£ﬂO‰| (ˇh˘±ıS–ß˚ìììˇòÛ¸c3-€\0\0\0 cHRM\0\0z%\0\0ÄÉ\0\0˘ˇ\0\0ÄÈ\0\0u0\0\0Í`\0\0:ò\0\0oí_≈F\0\0üIDATx⁄Ïù{p\\’}«?˜ÓS^Ω%[k˘m.„◊\Z^!fplÍuUöNm:©„J¿)–4éÅî\Z\'Ñ©·èN\'Æ«•aáœÿS€0ÄI!p¡&Æ?¿∆“ ñ¥íe=Vª⁄€?Ó^i•ï¥{Ôﬁ{W˚ù9ˇÏJ˜q>˚;Áw~ÁwŒQ(iö6X,\0Ê…2\r®ë•˚∑phìÂp\Z8Bú-Ñ˙Q\\\nµ∏∏∏h\0*,∫]\'pxxG—Ym‹%¿=¿7õe\0xÿÏB)ÇŒÓU¿Z`\r∞–°èyÿ\rÏBú,Ç?\\∞\ZX‹Ê≤Ú\0\nö\"^=zøªÿÃpπÔsÿºÏî˛\\q\0‡2‡‡a*ª‘	º\0</ÑËöî†eΩÿ,á?Ö¨6`¢]M∫b‰;Åm¿5L.ù\06	!ﬁ(h–ö¶’?ÓcrÎU`£\"Rp†5Mk^™(\n \nlBÏ*–“õ~	h,≤QªÄoYÌù´C^Ü>¥≤û§Ê√mÃ⁄≥í≤”øvËF‡#YWÓ≠i⁄˝Ò·yNÄ\\˚˛sîûŸãöË•˙£Ìîù~›I∞Ááeùπ£È÷4MëCâ«QÖrË‹Å¥Ø⁄¢k˛›Nk ∑õÖ∫cAköÊ˛#6Ìh»áΩx@—Ô8–ö¶M~	‹Ó»áΩX%ÑËqhÈYˇ\n∏’mê˚-‡3<r≈$KﬁÎf».Ä}GÆñ≠‰Ÿ¸∑£öÎﬂ>GË‹¡¨/—.¢kﬁ]Nl∆Ô •œVrÄ¨»¡æsØDËãÉ9_™}È\'¬ﬁ\r4fÎç{s∏ÒGA÷˛ôPÛ!˝ÌÍ? ¿ËÜêÙNAMm´?˝)®\n]s˛ƒI†◊\0gÄ\'Ú0ë˚«ùR5üæDi‰äGRb”ñ—yMc⁄Á©•Ì∫«(´O˚ºÊw?•‰‚N≥Í«≥\r™®Y@^Ïp“€Oi=lXrJÈõ∫åñÂˇàÓ\r¶}óZ%µDæÚ,â≤˙¥ÔÇéÃ˚€ëM∏Tù ‰\n‡@âìﬁº˝⁄ı‡UØ@Æ]FK√”ËûÄÒÜ@$ÇµDÆÜDÈÿ…@àÀı∑;t	…¬2ã~	\'ƒÆá©ªÓk\\\\ÙxT˙jñ—≤Ï)Úóo©å^dóû‘YæïD®û§?DK√?Õƒ°ö\'YòÔå…˘d«N5v◊}ù§øúæäEËÍ0»ûÒ\r.ÅZ\"\r?ƒ”%Vv5W£¶iøÔ|∂:N»aå§G´∑Í∫°êêôönEIÉÌ»ÉzQ≤1≠Èﬁé[3C%£◊ÌrUI6πÉñâ|ÓÕÒ\ZÀs=kÓìå≤-Sr∑π∫\Z%≥3V⁄&Yem—p{JÆRçd¥!+–r≈f◊W¡ù1k≥d6aã~ÑBXA°*cL\nD5íŸ¯AÀ®À√ÖˆäBfØª†XÛh≥—,z=≤‡MW<c8cj!Å\\ë:6hÈΩm,î7Ô\r	¸ï#6€±)à˚ßS`⁄8í>Rt5Ó_ü¸•‚æ0üœŸ¡$“…p˜XM˜:ärª÷ç4¯Hm∂Ø~oıSx{Z®˛p;(⁄ñob X]∞5^“|ò cˇAﬂ¥¢ãæ	Jﬁ|Ç´S˜T~◊µñCæ‹D¯–&JZ>†$Ú¬áæçß∑µ !áŒ`⁄·ßÒGOP~¸?©}ˇ9–ì˘∫˝⁄LM˜\ZÀ!øıù!`Ω›∆g @¨† /j‘~,ËWr˘BÁ‰ˆöAÀ}ºÊÚ†.]Ωzh¢ÄuÉ-YÒ∫Âwä’,¶7¸ït+œÏÖíiö◊Ω“»V\'Õ˚;NR~‚ÁîDﬁCç_…ˆL˙ÀËû˘u∫ÆZIºl∂˘?)’À≈ûdÍ{ﬂß§˘Ω4ÿ\0≠◊ˇΩ’}ˆJ‡»¶{EAA÷ìT}≤ÉÈˇÛwÑŒ@ÌÔ¢ÏÙÎ‘Ô_O≈±ùñX˘ ÏﬁÈ7ÿeŸ+Üx›2l÷Ü…€.⁄g…:SÛC¶|ÒÊ∏ˇ£k¡›¥ãá,y\Z%ô—≤∫g›f•e\05BàŒ¡¶˚f”!w7~˚Q<˝miì}µK—ΩJœÓõ†Ö¯ÈûqÎòïR~‚ÁÇPvÍubµKÈû˘µ1ﬁ´ô`€ƒ”Ä{Ío –Ò®˝C◊ÀÖö¬o°uπ%∞=íÌÉ†o1Ú·GÒ$⁄¿õ>kÏ8íuŒtº¥û˛ —ß»’˛KT€ô’µ´>˛WzÍoFWGœô¨{Ô1ºΩr®úÙ˙EÅ¶–*µˆ-©†o2Î™æû&¬ˇ˚ûx<Ê7Gj2Û0,Ù≈A˙F¨–1˛âvJ\"áÈ©ˇÍËÔ◊ﬂj…{ïFﬁD˘D·‚“Ôò\r˚¶TØ[ò“È	¬ÔOº›∫πﬁ1.å5í˘≥ˇ∂ú¥ïsÿ°ñ7—†uë©sJ¿´i⁄LöíT=xÌOËgæ∂/÷åíh__ÛfoÌvË¬õfÉÆ–4méXlöãÁ-£Øf¡éOÏ‚l4ŸæÏa(û§≠†£,Ÿòh±„\nì (¥,}í∫Oøo›µ1Íy†§\n˙>œ˙Úâ)a€@GÁ~ÉK≥Óµ‚“T`æπAÇ\0-ãû§ØziÊ\\≠,K“WñÒ˛± k\r´Œ≤ƒ*éq˝ÖñºWt˛tŒ˙3´~CÛΩ¿\\Û#BZÆ˝¬«@R∫e˜ï/°mˆ7\'úÅ©´‚¡˙åsy⁄mT5ˇWVë.]ı”=ı´ˇ&≤hææ¶	_ﬂ€ﬂ∆‘ìˇÇ:êæIt÷˝t÷Ø∂≤GòÎÍ,âM©\"øG¯˜[v\rÖÏ>JyÎ>ZÁ<àŸŸyâ@]·îµÓõˇvÜÔ&È	ç˘cËü2w¬ê´O=áJoZ”ùy?·?≈b’©Äe≥˛∫\Z rıf˙*ñ\ZcœîR÷æü⁄sØ`Eåπ}Ê_/ù\r>u‹%VÒtLˇs”ü≈o#|ÚI|âiuùıç|@®V±8w[WD<A_≈í¥~©,∫è⁄ÛÊ√N™AöÁ?m¨äGø‹[yëyﬂCW|ÊC>ıæDKzü<c-u˜í\'’(ö¶ıë~¬õ˘Œr2F¯Ï3ªè¶}◊UΩÇ÷Ècz3ÆËîwÓ£ºc/æxK⁄˜qˇ:™V“U~´È˜ˆ∆€ˆæ˛Ù˚FÎ˛íé⁄U‰Q1o> iŸ≥øK¯¸3îÙ|:4HëhB—¶[îÆxË¨ºÉŒ ?∆ﬂˇYT=FR)!òK‹WèU¸ûÅºt°≈∂Om§£:Øêä¶iz>Ô®Ë1¬MœR“k¿Ó-YD§˛1t%@°)–wíÈM?@Mˆ\Zêk˛Çé™U∂<KﬁA∞„T\\⁄kx∫Âwòn…Ní/ﬁDY◊Ab¡kËûrΩmœaË¢Ú/„h›¢\n[1/∆˘…ÆÌ ïd%—ãbAÓïÆxI˙J@Ò∏Ùe/FÆXç˚\0\'®÷~BÈôΩ÷éºA¢ã◊—µ‡n7ÉnSÅv7>yµˆ¢ÂêîD’⁄OM0ÕajWÅ7Zs> ß™ÚËøπtã\n|Ê∆~9´-RÂÌnr3ËœT‡¥Î[∑kDË⁄ëËi8U}ºN©¿—b=ºé™Bàœ1N./™0’)Ñ¯|0/V+÷G¡JÉ+´)ﬂ-÷G¡Í›T–oÎ£`ıv*Ëw0ñXUX\Zêl\r–ÚÏCw5ﬂä\r≈ÖÕˆ‡πñ©ãîˆπ≤íˇ‚>}…4Ùû¢EúEÔI-Ñ8wÕ+®J˛ãªt\\2M≥h∂d—¢]m—˜›Y¥ËÇ±Ëù£Çñ{GpÖA}±L:ê∫(åºçÛ+¿mÆ∞Ë¢F”+√?	Ùk¿yúæg∑R=äŒKÜdÍ£BƒÁÈhˆZ¥\r≈⁄.f-ı2Nü∫,v“#©S≤c\\†eÿÏÖ¢EªŒ¢_yé◊¢û«»˘.Z¥;,∫M2cB†Ö]¿«Kä=\\[$3&j—`ú}¢h—é∑ËåqæwF–“{€TÏ£o—õFÚ¥\'b—!ﬁ\0^-Z¥c-˙U…àú@Km¢Eãvú¢åÛ‘¡q=æ\"¬ÁÁﬂ†ïºjÉdÉYçb∞À9=ÈgØvI&ò\nZÍ[¿«±&Ô|Ù…K@À®ÀΩ@o—¢mS/pÔh0≥,\Z!ƒ«¿ÉEã∂MJX\nZ¬˛∞’V ì”¢∑ ∫\'/†•6cSéôÆ®6X¥ÌfΩ[÷9y-Ñ–ÅÄ˝y≠˙óÁ’ö{*ñ€	y?Ä¨sÚm—!˙ÅU¿[˘n∫[g¸≠åXYoÕær⁄Íˇ⁄.»o´d]Á‰“‰,y‰·ØÄ[ÛY¡ûcT]ÿM∞Áòl“}(zÓ-Ü‚C—„ËäüÓÚ?$:≠ëÑo™]êÔô®ámh	{\nK‡ˆ¸◊GEOR€ºÉ“ŒC9_ÌRıù¥O[k˜•˚•%˜ò2\Z5Î©‰›eèÉ¶¢+^PAQïúäb7‰›¿]fA6tJü›hÎ–À˝cÊ≠@cÆ}ÚpyÕ~JÈ>°i⁄1`Pí?»&çwÌô¿Ëï¡êüYqqÀ&ﬂ‰ﬂH>c„Óùw>‹hdKAKÿ\r‰k÷À¨\\≤¸≤ﬁ4d÷¥≈ÎáWﬁàë◊Te’=|Ò&<πß£x´â{Î¨Æí(∆|ÚÆ|Ÿ\0yÑ]¸∏è…≠WÅç„M\ZpË‡w€Äk&‡â|o‰˚∆∂dB…]|\'/0OmÚ]€Ÿ6ãf›e¿#¿√òt`πÉ4∏¥È˘L…ıìt\n\n`=FV„ó>è±\"ıe3‚‘:∏X\r¨√\rÚáÍ\0∆\"Ù◊∆J®üÙ†áAø\nX¨:Ù1ècƒ¶wﬂN¢:;ËKÄï¿\n‡&¿Æ3ä0vY‹ÏI›‚……rÂ˛≤?ø∏#Ã⁄`°#◊	|∆ÿ@ıßÙªz¯≥Å%¿`û,”0ŒÙ™JI?»-Üq¿[õ,0ì9çq≈!ƒŸB®üˇ\0ò≠œKCë”A\0\0\0\0IENDÆB`Ç','Seguran√ßa Privada'),(4,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\"\0\0\0 \0\0\0àö_\0\0\n7iCCPsRGB IEC61966-2.1\0\0xúùñwTSŸáœΩ7ΩPíäî–khRH\rΩHë.*1	J¿ê\0\"6DTpDQë¶2(‡Ä£Cë±\"äÖQ±ÎD‘qpñId≠ﬂºyÔÕõﬂ˜~küΩœ›gÔ}÷∫\0ê¸É¬LX	Ä°X·Á≈àçãg`\0l\0‡p≥≥B¯Fô|ÿålô¯Ω∫ ˘˚*”?å¡\0ˇüîπY\"1\0PòåÁÚ¯Ÿ\\…8=Wú%∑O…ò∂4MŒ0JŒ\"YÇ2VìsÚ,[|ˆôe9Û2Ñ<ÀsŒ‚e‰‹\'„ç9æåë`Á¯π2æ&cÉtIÜ@∆o‰±|N6\0(í‹.ÊsSdl-cí(2Ç-„y\0‡H…_“/XÃœÀ≈ŒÃZ.$ßà&\\SÜçìã·œœMÁã≈Ã07ç#‚1ÿôY·r\0fœ¸Yym≤\";ÿ8980m-mæ(‘]¸õí˜vñ^ÑÓD¯√ˆW~ô\r\0∞¶eµŸ˙ámi\0]ÎPª˝áÕ`/\0ä≤æu}q∫|^Rƒ‚,g+´‹‹\\Kük)/ËÔ˙üC_|œRæ›ÔÂaxÛì8ít1C^7nfz¶Dƒ»Œ‚p˘Êüá¯˛u¸$æà/îEDÀ¶L Lñµ[»àôBÜ@¯üö¯√˛§Ÿπñâ⁄¯–ñX•!\Z@~\0(* 	{d+–Ô}∆G˘Õã—ôòù˚œÇ˛}W∏L˛»$écGD2∏QŒÏö¸Z4 \0E@Í@Ë¿∂¿∏\0‡A(àq`1‡ÇêD Äµ†îÇ≠`\'®u†4É6ptÅc‡48.ÅÀ`‹R0ûÄ)\nÃ@ÑÖ»Rát C»≤ÖXê‰CPî%CBH@Î†R®™ÜÍ°fË[Ë(t\Z∫\0\rC∑†Qh˙z#0	¶¡Z∞l≥`O8éÑ¡…28.Ç∑¿ïp|ÓÑO√ó‡X\n?ÅßÄ:¢ã0¬FBëx$	!´ê§i@⁄ê§πäHëß»[EE1PLî Ö‚¢ñ°V°6£™QPù®>‘U‘(j\nıMFk¢Õ—ŒË\0t,:ùã.FW†õ–Ë≥ËÙ8˙É°cå1éL&≥≥≥”é9Ö∆åa¶±X¨:÷Îä\r≈r∞bl1∂\n{{{;é}É#‚tp∂8_\\<Nà+ƒU‡Zp\'pWp∏ºﬁÔå≈ÛÀÒe¯F|~?éü!(å	ÆÑHB*a-°í–F8K∏KxA$ıàNƒp¢Ä∏ÜXI<D<O%æ%QHf$6)Å$!m!Ì\'ù\"›\"Ω ì…Fdr<YLﬁBn&ü!ﬂ\'øQ†*X*(V+‘(t*\\Qx¶àW4TÙT\\¨òØX°xDqHÒ©^…Hâ≠ƒQZ•T£tTÈÜ“¥2UŸF9T9Cy≥rãÚÂG,≈à‚C·Qä(˚(g(cTÑ™OeSπ‘u‘FÍYÍ8\rC3¶–Ri•¥ohÉ¥)ääùJ¥JûJç q)°—ËÈÙ2˙a˙u˙;U-UOUæÍ&’6’+™Ø’Ê®y®Ò’J‘⁄’F‘ﬁ©3‘}‘”‘∑©w©ﬂ”@iòiÑk‰jÏ—8´ÒtméÀÓúí9áÁ‹÷Ñ5Õ4#4WhÓ”–ú÷“÷Ú” “™“:£ıTõÆÌ°ù™ΩC˚Ñˆ§U«MG†≥CÁ§ŒcÜ\n√ìëŒ®dÙ1¶t5u˝u%∫ı∫É∫3z∆zQzÖzÌz˜Ù	˙,˝$˝˙Ω˙S:!≠∑\rÒÜ,√√]Ü˝ÜØçåçbå6u=2V30Œ7n5ækB6q7Yf“`rÕc 2M3›mzŸ6≥7K1´12áÕÃÊªÕá-–NBããL”ìô√leéZ“-É--ª,üYX≈[m≥Í∑˙hmoùn›h}«ÜbhSh”cÛ´≠ô-◊∂∆ˆ⁄\\Ú\\ﬂπ´Ávœ}ngn«∑€cw”ûjbø¡æ◊˛ÉÉ£É»°Õa“—¿1—±÷Òã∆\ncmfùwB;y9≠v:ÊÙ÷Ÿ¡YÏ|ÿ˘¶KöKãÀ£y∆Û¯Û\ZÁçπÍπr\\Î]•n∑D∑ΩnRw]wé{É˚}ûGì«Ñß©g™ÁAœg^÷^\"ØØ◊lgˆJˆ)oƒ€œªƒ{–á‚ÂSÌsﬂWœ7Ÿ∑’w œﬁoÖﬂ)¥êˇ6ˇZ‹ÄÊÄ©@«¿ïÅ}A§†A’AÇÕÇE¡=!pH`»ˆêªÛ\rÁÁwÖÇ–Ä–Ì°˜¬å√ñÖ}é	Ø	aQ—øÄ∫`…ÇñØ\"Ω\"À\"ÔDôDI¢z££¢õ£_«x«î«Hc≠bW∆^ä”àƒu«c„£„õ‚ß˙,‹πp<¡>°8·˙\"„Eyã.,÷Xúæ¯¯≈%ú%G—â1â-âÔ9°úŒÙ“Ä•µKß∏lÓ.ÓûooíÔ /ÁO$π&ï\'=JvMﬁû<ô‚ûRëÚT¿Tûß˙ß÷•æNM€üˆ)=&Ω=óëòqTH¶	˚2µ3Û2á≥Ã≥ä≥§ÀúóÌ\\6%\n5eCŸã≤ª≈4Ÿœ‘ÄƒD≤^2ö„ñSìÛ&7:˜Hûrû0o`πŸÚMÀ\'Ú}Ûø^ÅZ¡]—[†[∞∂`t•Á ˙U–™•´zWÎØ.Z=æ∆oÕÅµÑµik(¥.,/|π.f]OëV—ö¢±ı~Î[ãäE≈76∏l®€à⁄(ÿ8∏iÓ¶™MKx%K≠K+JﬂoÊnæ¯ïÕWï_}⁄í¥e∞Ã°lœVÃV·÷Î€‹∑(W.œ/€≤ΩscG…éó;óÏºPaWQ∑ã∞K≤KZ\\Ÿ]ePµµÍ}uJıHçWM{≠fÌ¶⁄◊ªyªØÏÒÿ”VßUWZ˜nØ`ÔÕzø˙Œ£Üä}ò}9˚6F7ˆÕ˙∫πI£©¥È√~·~ÈÅà}ÕéÕÕ-ö-e≠p´§uÚ`¬¡Àﬂx”›∆l´oß∑óá$áõ¯Ìı√Aá{è∞é¥}g¯]mµ£§Í\\ﬁ9’ï“%ÌéÎ>\Zx¥∑«•ß„{ÀÔ˜”=Vs\\ÂxŸ	¬â¢üNÊüú>ïuÍÈÈ‰”cΩKzÔúâ=s≠/ºol–ŸÛÁ|œùÈ˜Ï?yﬁı¸±Œé^d]Ï∫‰p©s¿~†„˚:;áá∫/;]Óû7|‚ä˚ï”WΩØûªpÌ“»¸ë·ÎQ◊oﬁH∏!Ω…ª˘ËV˙≠Á∑snœ‹Ys}∑‰û“Ωä˚ö˜~4˝±]Í =>Í=:`¡É;c‹±\'?eˇÙ~ºË!˘a≈ÑŒDÛ#€G«&}\'/?^¯x¸I÷ìôß≈?+ˇ\\˚Ã‰Ÿwøx¸20;5˛\\Ù¸”Øõ_®øÿˇ“ÓeÔtÿÙ˝WØf^óºQs‡-Îmˇªòw3πÔ±Ô+?ò~Ë˘ÙÒÓßåOü~˜ÑÛ˚èpf*\0\0\0	pHYs\0\0\0\0 &Û?\0\0ÛIDATxúÖWTÁ˛fvvÈMä®t$ƒ∆≥ÄkÙ	Ç‚#àbÖ£…”XÚé%ì[D%œÇÿbD£QP4ää\"R¢(eiKŸ›˘ﬂù%xL¬;Ôû3;≥ˇ?ˇÌ˜ªw∆$“ˆq]8}áè*iA4S∞ìÈ—xÊÛœÚÃÀ/[6E&¨ñ+0¯˘Ü«m±ìÑ5Î7äª∑≤Ω^ûËªØ®~…	œ„·aÒ3\nM3 ∏e$àºŸ‹º€⁄!ÕdËOvã\Z^Õjh”” ÆΩ1H°áÜ¡û¿â£–Ò‡\r\r\Zˇ©m®©AÎùõ–WÄõ3‹˘‡i\'8è6Zc$ªæ^nà%w~ÜΩRÉ˝s±˚0s∫Ùò<ÎˆØ¢µ1\"3RÒESl1lW>^•ÿB‰8Ç\0ù≈¸õ&Æyv@√•“ÑÛù¨[Cãzòu^?”\nùæ2∑∑≥~ÒûSâqEπ—•±œO=Î\'≠Î∏¿€ã’öÈ9˜†—h·˚ºx∫ËÂ¡¨_+ÕÑ-K\"Æ&˘S?BÍSb`∏¢Vã7^√ÍÖ5\'áA°\0W´¬∂	´&,@æâQ~≥∞?5Ç§±DèV 1ı\'g8∏iQ¸\\J£-ÅÔ—bu5*éô Á¡/®˛¸Sú)*F£K?FJîr∞6f„e\"Z„eÔ>XÈÂû6yÉ+Ù‘2y{{£⁄x¯(xã\"Xw[ÊfJ§]∑xÎáN [∂‰ÈÄ≥	n‚ÑI‡<áe/\0˜>@Uπ!‹’Àx„ ˙âùgÑŒ≠ü„—ØÆñÚ£\r∏xÏÁÛ∏Ô$áì£	∫mØ‰òLKµ⁄ñÕb˘yE\\ì!˝˜ºL.«Sr¡ÀV5¬’\"äLÙ–b’\Z6çb¸∫7¥bΩå√î´Èp‚Xs3¯ûÊL¯˜∆\r\'÷?+&)rJ{Nd^÷¨y∏y!ÈãG‡à“&UØ¡˘MD·ŸTÏö\0≈/HuµÓåÿﬁ!)3ÛÿF&ãøõ• &Åﬁ√Q7Ï≤ÛÌyƒgêÎÎ„ó®(∞£Ì¯\\=¶igtfÈàRE»Ω|%5ÓÛeÁèö)–ƒdˆ∂≠ÿP¢¡ú˙hpN∂∞<‹°ãïH–”ØQÎxîŒ]x]Áì†®=”Õì∫)\r¯\ZQYá‰öJ¿¬úÉ5*{⁄A%–oƒ@ä≥âb3ôMôNÁıÓoïΩØÊmtîïµt„§Õa£Gı=‰‚x‡˝€7áˆ¨,ó£≤új¡B]Ó5,kyCÀ‚î??ïŒ‰tÜ¯œy\"Q‡á”C\"M7∏>y‰,´ØóâÜF⁄J7˜ämr˝Ô¢O≈Ô˚Û˚¬ª˛Ó39 ≠≤$1N“ß¶\ZÁÊYk´Ã˛Nñ„û∆∫Ωp∂›ªlÙ§à=«~<&;>˝$6Ì·›P≤ú™,Ì\"∏„GPh™Ö{=157&˙ÄŸŸc˜èá˜_µµÒü∞u«î∑Lf¯˚-J Hek◊ÉÌ‹Ja”@äTæ1óï›Qï“õ‹&∞§ÑâCác‹Èìæ;T-_≠å˛œW:&gÁƒàÉÜ\0âÒîDZ¬çÑçŒ®\r;dlFìx¶¥Æ´w™LŒw:Vû:≤Qq¸D§¯Ø}T„P*¡Q∆∂ê?,ÎTW¯˛n	.’(1)˘∂»eà“í´èXS#ÿ%™-B¥√A≥£Ö5\nŸßê≤è¢‘F5M¯óBÜ!jSßkêÍ‡ã¶rì&√F^Æ∫’é∂∞ Fd3û‰áve•÷ùŒ’√√Ä∏OZ\ræw_.õÇ†0Ü§É2Ñ8f‡íÖ#‚{ª√2-ÖÃ‚; §Ùπ±@&pùLŸk-\rΩ\"TË}Ö°ﬂ¶z∏yè√O…_·<ÌøSB{±Ë-ÉéC\"Ñ◊vˆu=YuÆô(‰∏jµ˘e\'ÒÙ–8hCB∞îJ†}d<n¶éÑØÒ†∂ˆ-m/ªfaØ¬–&Q\\\rû◊9∂ .›ßNƒÂ˝.pﬂ9Ì™Ë[YÅãÏÜæ7ˆ¢4Ò‹˝¿ÑéK˜|R¯ˆT‹⁄olLWã≠≠‰me«è°U≠EØ©”PıŸß∞J˛	¬≤Ëm˘ïióPùí∑ﬂaÄW∑#(Â¸Åµµ≥/áF~ìp|É‘|í‚†5¬Å](ºvE‘JMéûBﬂ¿pö0B‹ëé\\!≠/,Z∫]π}ßVß”ÊòC”ÕÕ«åèâ«®}\0Ñ∑n„á£b”VÙ_∑\nËe‹œÓ`@	˘€Ïêå©€wÆ˙CÌ|∞Ì˚ÒÎîı_~}·Ã∑b≥\n‹G¡‡Ôec¢ï%∞r-I÷ÇEGÈ≤˘‰¸U¡;wmÔ≤äøéâ›ƒnﬁ≥8t}X∆µÂÜO-Ÿçé∞îµª∫Ω9˚Q»ŒŸ˚bæ˛3tÖ\'ÔíYØû÷·ì&-˝XŒÖ∫Êﬁ∑G9\r$‰P∏∏Aî\n’—	h®ßL’öö¿Q&sî¨®ßÀ∆µÉáV«ôw;±„◊õ;ü=Ã{Òø‰]-rÜ¬ö‡Ÿõ\"k™V◊ã*^Lß—˚=∞i˛∫†∞≥ß¡ı@Bõt>¶¡CóÏËÔ©≈◊U‡§Èáµx]eıqŒΩœ>yU˙Fy‚‰0Ô√üƒ\',SV˛÷¸?·∑aQh‘o9ªH“ÃÄÕ_Æ±¨‡ò…Éí–ﬂ*…#yÜ‘Çå†9ﬂáõYêIÈñJ õòˆéÄ≥ƒ7Ø…7JÕ”ÉÂ⁄ÖW≠H\n8|4HU]£˛É\"6ÆŒΩK?^úÈx$∆Zúª†√\"}öƒŒ%Ø^Í,ïäK\"È∑≠ï·Eò\0óëÊ–≥”GÉa;*R’∞/Ê@ˆP˝(\0©éä\ni‰{Sk$\0\nÅXÚ>±{g6åﬂ8aÚ§±WS/ﬂ÷)“„ΩﬁÓè∆çŒ∂>r¿Xtu◊ﬁ&¶±Åd:% ¥\"¢Tj(—ëS˚ç∞Nê#∆0C∆Å!vı0ª<º¯+UTÙö9nûûÄ1\nCπ#“\\\nÀô£3dÈWÙÆûÈ„;yå¿ô\Z$œ\rﬁoùx X40‘πú—%!ùH\n|Ÿﬂ∑≥–Hçˇ\"1∑§Î#¬Ê ”“u`â{=yLˆ÷¬ºHê–©î;≠¬Á≠\Zåh”@9“€Û†ˇ‰1D\n≥‰]¶G‰ù,~ﬂá≥bÑ¿¿è˛9Æ¨t(ìÜ+BíNíÏÊ‘jLµ¥¿\Zö‹2Ø\\¡}ˆ(®¥hPË-‚V_€wÚ∞4\n©E^¬&¥ccÅ⁄±^‰±G’ä‚àtuÖˆ˛-ö√Ñé˚ùDJ*á˜‹Ö—nnﬁÜπ\n©˝ÖH1ÔkóqN—Ü¶…<ÏØjh™·cdà£l8Úøπ^¶¡ÀáøB•2áUèÓH ßê4)±ÀÄaWõ\Z+Fs0,}\0õ3IâøÄÖîwııº†º¸^õâÈx#ë…∫Bë¥lS–óâªÕPjPÉÙÎûË≠Áä~nÆêeﬁ@‡©,îGÔ¬¡ú\\X⁄€„Qs	b«‹É_3»6¡¶âz∑^ÜÍ\\O„ñëë(=ù∞mŒLˇ…„Ôfyu	mm≠h‹¥h§u¯x\Z{hÒèçc—=˜%å5Ìxı›6<•…’cA(ŒX&£8;ØÊG@](ÍãkP\Z˝âa>ü>¯?ÑEÁ¬ö™ãu’õÜ>ûÉ?π?…7SˇÁü‰LB»ﬂIÍÉönñ(:œg!ï\n»á&DÛ/æEèúGx∏ ˝‚˝`öôØKë˝§&Yp˜˚;Te‚È¸¿«–<\rk¶Tâù˝RG2øﬂó≠e|Ñnµ ˚~vˇ°^£n˘\\7NN‘i¬’yç,ê—–Æ7f<÷oÑÔ†¡h°zrP÷¢Òa\rÛ=Q[\\ÄVzWmMc…ÀW0{VıÇEh\"$›–†;Øô6fT¬‚ªJ–œˇm†fëùÀáO∆]ªìÁÓ]πô©y\\¯≤”Áßãoﬁ‹uløonn˜6ù∫ë{ıËŸ{˘\nî,I¬≈k◊†7o1<ãÉ˜˜—°§µÑ¿&A-ïiÁ˜Ç‘\"§ŒYº0¸“Ñ‘+3ÀÆ«µHÀÄxu}’0¸,‚,Ü.9k˙LHuO_Œ∫^\"UñÉµÊ9ê—|lë}û¥ÔI¯√é»XÇç˚ÄzŒ\0˙â’5¡N4ñ@í≥¥¬£g%gﬁœçäÆ+{GvóMØÆº≤én“≥Á®ë÷y^;≠§hÜêõcÄä2∞®m`‰z¯\rAB⁄¡åå	5©ü®T¿›€‡[®ßIò·ﬁ∑)€cP‚ÊÚ ≠gíœÙ#ûπ]»ÏRëw)˚ff›Êt˛Ô9oäôc«çˆË?e®\\6FV˙¸=46\Zqz˙‘ıûô¸íP¯Ùb‹ç7ÚÆ^”Íå°ÎÃˇëÛ_ÚÍéÖ\r‘tó\0\0\0\0IENDÆB`Ç','Bombeiro');
/*!40000 ALTER TABLE `tipo_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefone` (
  `id_tipo_telefone` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_telefone` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

LOCK TABLES `tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tipo_telefone` DISABLE KEYS */;
INSERT INTO `tipo_telefone` VALUES (1,'Residencial'),(2,'Comercial'),(3,'Celular'),(4,'Recado');
/*!40000 ALTER TABLE `tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_tipo_usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Funcion√°rio'),(2,'Cond√¥mino'),(3,'Usu√°rio P√∫blico');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topico`
--

DROP TABLE IF EXISTS `topico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topico` (
  `id_topico` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_topico` varchar(255) NOT NULL,
  `ordem_topico` int(11) NOT NULL,
  `id_formulario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_topico`),
  KEY `FK_92ofmt6339gh163rhje2ybopp` (`id_formulario`),
  CONSTRAINT `FK_92ofmt6339gh163rhje2ybopp` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id_formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topico`
--

LOCK TABLES `topico` WRITE;
/*!40000 ALTER TABLE `topico` DISABLE KEYS */;
/*!40000 ALTER TABLE `topico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turno` (
  `id_turno` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `descricao_turno` varchar(255) DEFAULT NULL,
  `duracao_turno` int(11) NOT NULL,
  `hr_fim` time DEFAULT NULL,
  `hr_inicio` time NOT NULL,
  `nome_turno` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `usuario_bloqueado` tinyint(1) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `data_primeiro_acesso` datetime DEFAULT NULL,
  `data_ultimo_login` datetime DEFAULT NULL,
  `data_validade_conta` datetime DEFAULT NULL,
  `data_validade_senha` datetime DEFAULT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `reset_senha` tinyint(1) DEFAULT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `nr_tentativa_login` int(11) DEFAULT NULL,
  `ultimo_ip` varchar(255) DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_perfil` bigint(20) NOT NULL,
  `id_pessoa` bigint(20) DEFAULT NULL,
  `id_tipo_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UK_isxwoo508iq2mrksqgheuh3r3` (`email_usuario`),
  KEY `FK_bmgpa0hcorf0m7fweft0r69pv` (`id_cliente`),
  KEY `FK_1hksstut7mfuakydcov0ogp92` (`id_perfil`),
  KEY `FK_9wnw55sajbeqbpd8fsjbna1ie` (`id_pessoa`),
  KEY `FK_net3dwv3ye5ge04k6c9oh0569` (`id_tipo_usuario`),
  CONSTRAINT `FK_net3dwv3ye5ge04k6c9oh0569` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `FK_1hksstut7mfuakydcov0ogp92` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`),
  CONSTRAINT `FK_9wnw55sajbeqbpd8fsjbna1ie` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`),
  CONSTRAINT `FK_bmgpa0hcorf0m7fweft0r69pv` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','administrador@kobel.com.br','administrador',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,1,1,1),(2,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','sidney@kobel.com.br','ssamitsu',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,1,1,1),(3,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','marcus@belfort.com.br','msandin',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,2,5,1,1),(4,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','ederson@kolss.com.br','ejuliano',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,5,1,1),(5,1,0,'2014-12-17 09:52:08','2015-01-29 15:48:35','2015-01-29 15:48:27','2020-01-01 00:00:00','2015-01-01 00:00:00','alexandre@kolss.com.br','atakashi',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,'127.0.0.1',1,1,1,1),(6,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','eduardo@kolss.com.br','eabreu',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,1,1,1),(7,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','sidney@kolss.com.br','opepadrao',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,3,1,1),(8,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','opemaster@kolss.com.br','opemaster',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,6,1,1),(9,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','leonardo@kolss.com.br','lcohen',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,1,1,1),(10,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','lamorim@belfort.com.br','lamorim',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,2,4,1,1),(11,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','wxavier@belfort.com.br','wxavier',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,2,4,1,1),(12,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','operadorbelfort@belfort.com.br','opebelfort',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,2,6,1,1),(13,1,0,'2014-12-17 09:52:08',NULL,NULL,'2020-01-01 00:00:00','2015-01-01 00:00:00','anderson@kolss.com.br','atorres',0,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,NULL,1,1,1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_regra`
--

DROP TABLE IF EXISTS `usuario_regra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_regra` (
  `id_usuario` bigint(20) NOT NULL,
  `id_regra` bigint(20) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_regra`),
  KEY `FK_ult0kp6sms8om9wnyyltdmil` (`id_regra`),
  KEY `FK_9h0ym3mspw42r3bb1qt5yxbr6` (`id_usuario`),
  CONSTRAINT `FK_9h0ym3mspw42r3bb1qt5yxbr6` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_ult0kp6sms8om9wnyyltdmil` FOREIGN KEY (`id_regra`) REFERENCES `regra` (`id_regra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_regra`
--

LOCK TABLES `usuario_regra` WRITE;
/*!40000 ALTER TABLE `usuario_regra` DISABLE KEYS */;
INSERT INTO `usuario_regra` VALUES (1,1),(2,1),(5,1),(6,1),(8,1),(9,1),(13,1),(1,2),(2,2),(5,2),(6,2),(8,2),(9,2),(13,2),(1,3),(2,3),(5,3),(6,3),(8,3),(9,3),(13,3),(1,4),(2,4),(5,4),(6,4),(8,4),(9,4),(13,4),(1,5),(2,5),(5,5),(6,5),(8,5),(9,5),(13,5),(1,6),(2,6),(5,6),(6,6),(8,6),(9,6),(13,6),(1,7),(2,7),(5,7),(6,7),(8,7),(9,7),(13,7),(1,8),(2,8),(5,8),(6,8),(8,8),(9,8),(13,8),(1,9),(2,9),(5,9),(6,9),(8,9),(9,9),(13,9),(1,10),(2,10),(5,10),(6,10),(8,10),(9,10),(13,10),(1,11),(2,11),(5,11),(6,11),(8,11),(9,11),(13,11),(1,12),(2,12),(5,12),(6,12),(8,12),(9,12),(13,12),(1,13),(2,13),(5,13),(6,13),(8,13),(9,13),(13,13),(1,14),(2,14),(5,14),(6,14),(8,14),(9,14),(13,14),(1,15),(2,15),(5,15),(6,15),(8,15),(9,15),(13,15),(1,16),(2,16),(5,16),(6,16),(8,16),(9,16),(13,16),(1,17),(2,17),(5,17),(6,17),(8,17),(9,17),(13,17),(1,18),(2,18),(5,18),(6,18),(8,18),(9,18),(13,18),(1,19),(2,19),(5,19),(6,19),(8,19),(9,19),(13,19),(1,20),(2,20),(5,20),(6,20),(8,20),(9,20),(13,20),(1,21),(2,21),(5,21),(6,21),(8,21),(9,21),(13,21),(1,22),(2,22),(5,22),(6,22),(8,22),(9,22),(13,22),(1,23),(2,23),(5,23),(6,23),(8,23),(9,23),(13,23),(1,24),(2,24),(5,24),(6,24),(8,24),(9,24),(13,24),(1,25),(2,25),(5,25),(6,25),(8,25),(9,25),(13,25),(1,26),(2,26),(5,26),(6,26),(8,26),(9,26),(13,26),(1,27),(2,27),(5,27),(6,27),(8,27),(9,27),(13,27),(1,28),(2,28),(5,28),(6,28),(8,28),(9,28),(13,28),(1,29),(2,29),(5,29),(6,29),(8,29),(9,29),(13,29),(1,30),(2,30),(5,30),(6,30),(8,30),(9,30),(13,30),(1,31),(2,31),(5,31),(6,31),(8,31),(9,31),(13,31),(1,32),(2,32),(5,32),(6,32),(8,32),(9,32),(13,32),(1,33),(2,33),(5,33),(6,33),(8,33),(9,33),(13,33),(1,34),(2,34),(5,34),(6,34),(8,34),(9,34),(13,34),(1,35),(2,35),(5,35),(6,35),(8,35),(9,35),(13,35),(1,36),(2,36),(5,36),(6,36),(8,36),(9,36),(13,36),(1,37),(2,37),(5,37),(6,37),(8,37),(9,37),(13,37),(1,38),(2,38),(5,38),(6,38),(8,38),(9,38),(13,38),(1,39),(2,39),(5,39),(6,39),(8,39),(9,39),(13,39),(1,40),(2,40),(5,40),(6,40),(8,40),(9,40),(13,40),(1,41),(2,41),(5,41),(6,41),(8,41),(9,41),(13,41),(1,42),(2,42),(3,42),(5,42),(6,42),(7,42),(8,42),(9,42),(10,42),(11,42),(12,42),(13,42),(1,43),(2,43),(5,43),(6,43),(8,43),(9,43),(13,43),(1,44),(2,44),(5,44),(6,44),(8,44),(9,44),(13,44),(1,45),(2,45),(5,45),(6,45),(8,45),(9,45),(13,45),(1,46),(2,46),(5,46),(6,46),(8,46),(9,46),(13,46),(1,47),(2,47),(5,47),(6,47),(8,47),(9,47),(13,47),(1,48),(2,48),(5,48),(6,48),(8,48),(9,48),(13,48),(1,49),(2,49),(5,49),(6,49),(8,49),(9,49),(13,49),(1,50),(2,50),(5,50),(6,50),(8,50),(9,50),(13,50),(1,51),(2,51),(5,51),(6,51),(8,51),(9,51),(13,51),(1,52),(2,52),(5,52),(6,52),(8,52),(9,52),(13,52),(1,53),(2,53),(5,53),(6,53),(8,53),(9,53),(13,53),(1,54),(2,54),(5,54),(6,54),(8,54),(9,54),(13,54),(1,55),(2,55),(5,55),(6,55),(8,55),(9,55),(13,55),(1,56),(2,56),(5,56),(6,56),(8,56),(9,56),(13,56),(1,57),(2,57),(5,57),(6,57),(8,57),(9,57),(13,57),(1,58),(2,58),(5,58),(6,58),(8,58),(9,58),(13,58),(1,59),(2,59),(5,59),(6,59),(8,59),(9,59),(13,59),(1,60),(2,60),(5,60),(6,60),(8,60),(9,60),(13,60),(1,61),(2,61),(5,61),(6,61),(8,61),(9,61),(13,61),(1,62),(2,62),(5,62),(6,62),(8,62),(9,62),(13,62),(1,63),(2,63),(5,63),(6,63),(8,63),(9,63),(13,63),(1,64),(2,64),(5,64),(6,64),(8,64),(9,64),(13,64),(1,65),(2,65),(5,65),(6,65),(8,65),(9,65),(13,65),(1,66),(2,66),(5,66),(6,66),(8,66),(9,66),(13,66),(1,67),(2,67),(5,67),(6,67),(8,67),(9,67),(13,67),(1,68),(2,68),(5,68),(6,68),(8,68),(9,68),(13,68),(1,69),(2,69),(5,69),(6,69),(8,69),(9,69),(13,69),(1,70),(2,70),(5,70),(6,70),(8,70),(9,70),(13,70),(1,71),(2,71),(5,71),(6,71),(8,71),(9,71),(13,71),(1,72),(2,72),(5,72),(6,72),(8,72),(9,72),(13,72),(1,73),(2,73),(5,73),(6,73),(8,73),(9,73),(13,73),(1,74),(2,74),(5,74),(6,74),(8,74),(9,74),(13,74),(1,75),(2,75),(5,75),(6,75),(8,75),(9,75),(13,75),(1,76),(2,76),(5,76),(6,76),(8,76),(9,76),(13,76),(1,77),(2,77),(5,77),(6,77),(8,77),(9,77),(13,77),(1,78),(2,78),(5,78),(6,78),(8,78),(9,78),(13,78),(1,79),(2,79),(5,79),(6,79),(8,79),(9,79),(13,79),(1,80),(2,80),(5,80),(6,80),(8,80),(9,80),(13,80),(1,81),(2,81),(5,81),(6,81),(8,81),(9,81),(13,81),(1,82),(2,82),(5,82),(6,82),(8,82),(9,82),(13,82),(1,83),(2,83),(5,83),(6,83),(8,83),(9,83),(13,83),(1,84),(2,84),(5,84),(6,84),(8,84),(9,84),(13,84),(1,85),(2,85),(5,85),(6,85),(8,85),(9,85),(13,85),(1,86),(2,86),(5,86),(6,86),(8,86),(9,86),(13,86),(1,87),(2,87),(5,87),(6,87),(8,87),(9,87),(13,87),(1,88),(2,88),(5,88),(6,88),(8,88),(9,88),(13,88),(1,89),(2,89),(5,89),(6,89),(8,89),(9,89),(13,89),(1,90),(2,90),(5,90),(6,90),(8,90),(9,90),(13,90),(1,91),(2,91),(5,91),(6,91),(8,91),(9,91),(13,91),(1,92),(2,92),(5,92),(6,92),(8,92),(9,92),(13,92),(1,93),(2,93),(5,93),(6,93),(8,93),(9,93),(13,93),(1,94),(2,94),(5,94),(6,94),(8,94),(9,94),(13,94),(1,95),(2,95),(5,95),(6,95),(8,95),(9,95),(13,95),(1,96),(2,96),(5,96),(6,96),(8,96),(9,96),(13,96),(1,97),(2,97),(5,97),(6,97),(8,97),(9,97),(13,97),(1,98),(2,98),(5,98),(6,98),(8,98),(9,98),(13,98),(1,99),(2,99),(5,99),(6,99),(8,99),(9,99),(13,99),(1,100),(2,100),(5,100),(6,100),(8,100),(9,100),(13,100),(1,101),(2,101),(5,101),(6,101),(8,101),(9,101),(13,101),(1,102),(2,102),(5,102),(6,102),(8,102),(9,102),(13,102),(1,103),(2,103),(5,103),(6,103),(8,103),(9,103),(13,103),(1,104),(2,104),(5,104),(6,104),(8,104),(9,104),(13,104),(1,105),(2,105),(5,105),(6,105),(8,105),(9,105),(13,105),(1,106),(2,106),(5,106),(6,106),(8,106),(9,106),(13,106),(1,107),(2,107),(5,107),(6,107),(8,107),(9,107),(13,107),(1,108),(2,108),(5,108),(6,108),(8,108),(9,108),(13,108),(1,109),(2,109),(5,109),(6,109),(8,109),(9,109),(13,109),(1,110),(2,110),(5,110),(6,110),(8,110),(9,110),(13,110),(1,111),(2,111),(5,111),(6,111),(8,111),(9,111),(13,111),(1,112),(2,112),(5,112),(6,112),(8,112),(9,112),(13,112),(1,113),(2,113),(5,113),(6,113),(8,113),(9,113),(13,113),(1,114),(2,114),(5,114),(6,114),(8,114),(9,114),(13,114),(1,115),(2,115),(5,115),(6,115),(8,115),(9,115),(13,115),(1,116),(2,116),(5,116),(6,116),(8,116),(9,116),(13,116),(1,117),(2,117),(5,117),(6,117),(8,117),(9,117),(13,117),(1,118),(2,118),(5,118),(6,118),(8,118),(9,118),(13,118),(1,119),(2,119),(5,119),(6,119),(8,119),(9,119),(13,119),(1,120),(2,120),(5,120),(6,120),(8,120),(9,120),(13,120),(1,121),(2,121),(5,121),(6,121),(8,121),(9,121),(13,121),(1,122),(2,122),(5,122),(6,122),(8,122),(9,122),(13,122),(1,123),(2,123),(5,123),(6,123),(8,123),(9,123),(13,123),(1,124),(2,124),(5,124),(6,124),(8,124),(9,124),(13,124),(1,125),(2,125),(5,125),(6,125),(8,125),(9,125),(13,125),(1,126),(2,126),(5,126),(6,126),(8,126),(9,126),(13,126),(1,127),(2,127),(5,127),(6,127),(8,127),(9,127),(13,127),(1,128),(2,128),(5,128),(6,128),(8,128),(9,128),(13,128),(1,129),(2,129),(5,129),(6,129),(8,129),(9,129),(13,129),(1,130),(2,130),(5,130),(6,130),(8,130),(9,130),(13,130),(1,131),(2,131),(5,131),(6,131),(8,131),(9,131),(13,131),(1,132),(2,132),(5,132),(6,132),(8,132),(9,132),(13,132),(1,133),(2,133),(5,133),(6,133),(8,133),(9,133),(13,133),(1,134),(2,134),(5,134),(6,134),(8,134),(9,134),(13,134),(1,135),(2,135),(5,135),(6,135),(8,135),(9,135),(13,135),(1,136),(2,136),(5,136),(6,136),(8,136),(9,136),(13,136),(1,137),(2,137),(5,137),(6,137),(8,137),(9,137),(13,137),(1,138),(2,138),(5,138),(6,138),(8,138),(9,138),(13,138),(1,139),(2,139),(5,139),(6,139),(8,139),(9,139),(13,139),(1,140),(2,140),(5,140),(6,140),(8,140),(9,140),(13,140),(1,141),(2,141),(5,141),(6,141),(8,141),(9,141),(13,141),(1,142),(2,142),(5,142),(6,142),(8,142),(9,142),(13,142),(1,143),(2,143),(5,143),(6,143),(8,143),(9,143),(13,143),(1,144),(2,144),(5,144),(6,144),(8,144),(9,144),(13,144),(1,145),(2,145),(5,145),(6,145),(8,145),(9,145),(13,145),(1,146),(2,146),(5,146),(6,146),(8,146),(9,146),(13,146),(1,147),(2,147),(5,147),(6,147),(8,147),(9,147),(13,147),(1,148),(2,148),(5,148),(6,148),(8,148),(9,148),(13,148),(1,149),(2,149),(5,149),(6,149),(8,149),(9,149),(13,149),(1,150),(2,150),(5,150),(6,150),(8,150),(9,150),(13,150),(1,151),(2,151),(5,151),(6,151),(8,151),(9,151),(13,151),(1,152),(2,152),(5,152),(6,152),(8,152),(9,152),(13,152),(1,153),(2,153),(5,153),(6,153),(8,153),(9,153),(13,153),(1,154),(2,154),(5,154),(6,154),(8,154),(9,154),(13,154),(1,155),(2,155),(5,155),(6,155),(8,155),(9,155),(13,155),(1,156),(2,156),(5,156),(6,156),(8,156),(9,156),(13,156),(1,157),(2,157),(5,157),(6,157),(8,157),(9,157),(13,157),(1,158),(2,158),(5,158),(6,158),(8,158),(9,158),(13,158),(1,159),(2,159),(5,159),(6,159),(8,159),(9,159),(13,159),(1,160),(2,160),(5,160),(6,160),(8,160),(9,160),(13,160),(1,161),(2,161),(5,161),(6,161),(8,161),(9,161),(13,161),(1,162),(2,162),(5,162),(6,162),(8,162),(9,162),(13,162),(1,163),(2,163),(5,163),(6,163),(8,163),(9,163),(13,163),(1,164),(2,164),(5,164),(6,164),(8,164),(9,164),(13,164),(1,165),(2,165),(5,165),(6,165),(8,165),(9,165),(13,165),(1,166),(2,166),(5,166),(6,166),(8,166),(9,166),(13,166),(1,167),(2,167),(5,167),(6,167),(8,167),(9,167),(13,167),(1,168),(2,168),(5,168),(6,168),(8,168),(9,168),(13,168),(1,169),(2,169),(5,169),(6,169),(8,169),(9,169),(13,169),(1,170),(2,170),(5,170),(6,170),(8,170),(9,170),(13,170),(1,171),(2,171),(5,171),(6,171),(8,171),(9,171),(13,171),(1,172),(2,172),(5,172),(6,172),(8,172),(9,172),(13,172),(1,173),(2,173),(5,173),(6,173),(8,173),(9,173),(13,173),(1,174),(2,174),(5,174),(6,174),(8,174),(9,174),(13,174),(1,175),(2,175),(5,175),(6,175),(8,175),(9,175),(13,175),(1,176),(2,176),(5,176),(6,176),(8,176),(9,176),(13,176),(1,177),(2,177),(5,177),(6,177),(8,177),(9,177),(13,177),(1,178),(2,178),(5,178),(6,178),(8,178),(9,178),(13,178),(1,179),(2,179),(5,179),(6,179),(8,179),(9,179),(13,179),(1,180),(2,180),(5,180),(6,180),(8,180),(9,180),(13,180),(1,181),(2,181),(5,181),(6,181),(8,181),(9,181),(13,181),(1,182),(2,182),(5,182),(6,182),(8,182),(9,182),(13,182),(1,183),(2,183),(5,183),(6,183),(8,183),(9,183),(13,183),(1,184),(2,184),(3,184),(5,184),(6,184),(7,184),(8,184),(9,184),(10,184),(11,184),(12,184),(13,184),(1,185),(2,185),(3,185),(5,185),(6,185),(7,185),(8,185),(9,185),(10,185),(11,185),(12,185),(13,185),(1,186),(2,186),(3,186),(5,186),(6,186),(7,186),(8,186),(9,186),(10,186),(11,186),(12,186),(13,186),(1,187),(2,187),(3,187),(5,187),(6,187),(7,187),(8,187),(9,187),(10,187),(11,187),(12,187),(13,187),(1,188),(2,188),(3,188),(4,188),(5,188),(6,188),(7,188),(8,188),(9,188),(10,188),(11,188),(12,188),(13,188),(1,189),(2,189),(3,189),(4,189),(5,189),(6,189),(7,189),(8,189),(9,189),(10,189),(11,189),(12,189),(13,189),(1,190),(2,190),(3,190),(4,190),(5,190),(6,190),(7,190),(8,190),(9,190),(10,190),(11,190),(12,190),(13,190),(1,191),(2,191),(5,191),(6,191),(8,191),(9,191),(13,191),(1,192),(2,192),(3,192),(4,192),(5,192),(6,192),(7,192),(8,192),(9,192),(10,192),(11,192),(12,192),(13,192),(1,193),(2,193),(3,193),(4,193),(5,193),(6,193),(7,193),(8,193),(9,193),(10,193),(11,193),(12,193),(13,193),(1,194),(2,194),(3,194),(4,194),(5,194),(6,194),(7,194),(8,194),(9,194),(10,194),(11,194),(12,194),(13,194),(1,195),(2,195),(3,195),(4,195),(5,195),(6,195),(7,195),(8,195),(9,195),(10,195),(11,195),(12,195),(13,195),(1,196),(2,196),(5,196),(6,196),(8,196),(9,196),(13,196),(1,197),(2,197),(5,197),(6,197),(8,197),(9,197),(13,197),(1,198),(2,198),(5,198),(6,198),(8,198),(9,198),(13,198),(1,199),(2,199),(5,199),(6,199),(8,199),(9,199),(13,199),(1,200),(2,200),(5,200),(6,200),(8,200),(9,200),(13,200),(1,201),(2,201),(5,201),(6,201),(8,201),(9,201),(13,201),(1,202),(2,202),(5,202),(6,202),(8,202),(9,202),(13,202),(1,203),(2,203),(5,203),(6,203),(8,203),(9,203),(13,203),(1,204),(2,204),(3,204),(4,204),(5,204),(6,204),(7,204),(8,204),(9,204),(10,204),(11,204),(12,204),(13,204),(1,205),(2,205),(3,205),(4,205),(5,205),(6,205),(7,205),(8,205),(9,205),(10,205),(11,205),(12,205),(13,205),(1,206),(2,206),(5,206),(6,206),(8,206),(9,206),(13,206),(1,207),(2,207),(3,207),(4,207),(5,207),(6,207),(7,207),(8,207),(9,207),(10,207),(11,207),(12,207),(13,207),(1,208),(2,208),(3,208),(4,208),(5,208),(6,208),(7,208),(8,208),(9,208),(10,208),(11,208),(12,208),(13,208),(1,209),(2,209),(3,209),(4,209),(5,209),(6,209),(7,209),(8,209),(9,209),(10,209),(11,209),(12,209),(13,209),(1,210),(2,210),(3,210),(4,210),(5,210),(6,210),(7,210),(8,210),(9,210),(10,210),(11,210),(12,210),(13,210),(1,211),(2,211),(3,211),(4,211),(5,211),(6,211),(7,211),(8,211),(9,211),(10,211),(11,211),(12,211),(13,211),(1,212),(2,212),(3,212),(4,212),(5,212),(6,212),(7,212),(8,212),(9,212),(10,212),(11,212),(12,212),(13,212),(1,213),(2,213),(3,213),(4,213),(5,213),(6,213),(7,213),(8,213),(9,213),(10,213),(11,213),(12,213),(13,213),(1,214),(2,214),(3,214),(4,214),(5,214),(6,214),(7,214),(8,214),(9,214),(10,214),(11,214),(12,214),(13,214),(1,215),(2,215),(3,215),(4,215),(5,215),(6,215),(7,215),(8,215),(9,215),(10,215),(11,215),(12,215),(13,215),(1,216),(2,216),(3,216),(4,216),(5,216),(6,216),(7,216),(8,216),(9,216),(10,216),(11,216),(12,216),(13,216),(1,217),(2,217),(3,217),(4,217),(5,217),(6,217),(7,217),(8,217),(9,217),(10,217),(11,217),(12,217),(13,217),(1,218),(2,218),(5,218),(6,218),(8,218),(9,218),(13,218),(1,219),(2,219),(5,219),(6,219),(8,219),(9,219),(13,219),(1,220),(2,220),(5,220),(6,220),(8,220),(9,220),(13,220),(1,221),(2,221),(5,221),(6,221),(8,221),(9,221),(13,221),(1,222),(2,222),(5,222),(6,222),(8,222),(9,222),(13,222),(1,223),(2,223),(5,223),(6,223),(8,223),(9,223),(13,223),(1,224),(2,224),(5,224),(6,224),(8,224),(9,224),(13,224),(1,225),(2,225),(5,225),(6,225),(8,225),(9,225),(13,225);
/*!40000 ALTER TABLE `usuario_regra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `id_veiculo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ano_fabricacao` int(11) NOT NULL,
  `ano_modelo` int(11) NOT NULL,
  `veiculo_atual` tinyint(1) NOT NULL,
  `cor_veiculo` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `marca_veiculo` varchar(255) NOT NULL,
  `modelo_veiculo` varchar(255) NOT NULL,
  `placa_veiculo` varchar(255) NOT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  KEY `FK_cwb6cj3nu7re5a6msdqyaik5f` (`id_pessoa`),
  CONSTRAINT `FK_cwb6cj3nu7re5a6msdqyaik5f` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo_aleatorio`
--

DROP TABLE IF EXISTS `veiculo_aleatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo_aleatorio` (
  `id_veiculo_aleatorio` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_registro` datetime DEFAULT NULL,
  `foto_veiculo` longblob,
  `placa_veiculo` varchar(255) DEFAULT NULL,
  `id_equipamento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_veiculo_aleatorio`),
  KEY `FK_eumwdus5qmovbaysbemvuc27p` (`id_equipamento`),
  CONSTRAINT `FK_eumwdus5qmovbaysbemvuc27p` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id_equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo_aleatorio`
--

LOCK TABLES `veiculo_aleatorio` WRITE;
/*!40000 ALTER TABLE `veiculo_aleatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo_aleatorio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-29 16:34:02


ALTER TABLE `contratante` ADD COLUMN `ativo` TINYINT(1) NOT NULL AFTER `id_contratante`;
