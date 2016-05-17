CREATE DATABASE  IF NOT EXISTS `nicbraindesenvv11` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nicbraindesenvv11`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: nicbraindesenvv11
-- ------------------------------------------------------
-- Server version	5.5.33

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
-- Table structure for table `anexo`
--

DROP TABLE IF EXISTS `anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anexo` (
  `IdAnexo` int(11) NOT NULL AUTO_INCREMENT,
  `NomeAnexo` varchar(50) NOT NULL,
  `DocAnexo` mediumblob NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  PRIMARY KEY (`IdAnexo`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_196` (`IdLocal`,`IdCliente`,`IdContratante`),
  CONSTRAINT `R_196` FOREIGN KEY (`IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `local` (`IdLocal`, `IdCliente`, `IdContratante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anexo`
--

LOCK TABLES `anexo` WRITE;
/*!40000 ALTER TABLE `anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `IdContratante` int(11) NOT NULL,
  `IdAtividade` int(11) NOT NULL AUTO_INCREMENT,
  `IdStatus` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `IdProcedimentoAuxiliar` int(11) DEFAULT NULL,
  `NrItem` int(11) NOT NULL,
  `NomeAtividade` varchar(300) DEFAULT NULL,
  `DescricaoAtividade` varchar(300) DEFAULT NULL,
  `TempoExecEstimado` int(11) NOT NULL,
  `TempoTolerInicio` int(11) NOT NULL,
  `TempoTolerFim` int(11) NOT NULL,
  `DtHrInicioPrevisto` datetime DEFAULT NULL,
  `DtHrFImPrevisto` datetime DEFAULT NULL,
  `DtHrInicioRealizado` datetime DEFAULT NULL,
  `DtHrFimRealizado` datetime DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdFuncionarioResponsavel` int(11) DEFAULT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `observacao` varchar(300) DEFAULT NULL,
  `CampoCheck` tinyint(4) DEFAULT NULL,
  `IdFormulario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAtividade`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdProcedimento`,`NrItem`),
  KEY `R_73` (`IdStatus`),
  KEY `R_210` (`IdProcedimento`),
  KEY `R_211` (`IdFuncionarioResponsavel`,`IdContratante`),
  KEY `R_212` (`IdProcedimentoAuxiliar`),
  KEY `R_227` (`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_256` (`IdFormulario`),
  CONSTRAINT `R_210` FOREIGN KEY (`IdProcedimento`) REFERENCES `procedimento` (`IdProcedimento`),
  CONSTRAINT `R_211` FOREIGN KEY (`IdFuncionarioResponsavel`, `IdContratante`) REFERENCES `funcionario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_212` FOREIGN KEY (`IdProcedimentoAuxiliar`) REFERENCES `procedimento` (`IdProcedimento`),
  CONSTRAINT `R_227` FOREIGN KEY (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `checklist` (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`),
  CONSTRAINT `R_256` FOREIGN KEY (`IdFormulario`) REFERENCES `formulario` (`IdFormulario`),
  CONSTRAINT `R_73` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
INSERT INTO `atividade` VALUES (3,1,5,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\n(detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-12 09:00:00','2014-08-12 09:10:00','2014-08-21 16:53:24','2014-08-21 16:55:50',NULL,NULL,1,7,1,1,5,4,'cancelamento',0,NULL),(3,2,5,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria \n\nda DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-12 09:00:00','2014-08-12 10:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,3,5,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-12 10:00:00','2014-08-12 22:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,4,5,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento próprio \n\ndas instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-12 11:00:00','2014-08-12 11:10:00',NULL,'2014-08-21 16:58:52',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,5,5,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)','Varredura \n\nantibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-12 11:00:00','2014-08-12 13:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,6,5,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-12 11:00:00','2014-08-12 11:30:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,7,5,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-12 11:00:00','2014-08-12 11:15:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,8,5,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-12 11:00:00','2014-08-12 11:15:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,9,5,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\ndo turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-12 12:00:00','2014-08-12 12:10:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,10,5,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-12 12:00:00','2014-08-12 13:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,11,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-13 05:00:00','2014-08-13 05:10:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,12,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-13 05:00:00','2014-08-13 06:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,13,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-13 06:00:00','2014-08-13 18:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,14,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-13 07:00:00','2014-08-13 07:10:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,15,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-13 07:00:00','2014-08-13 09:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,16,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-13 07:00:00','2014-08-13 07:30:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,17,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-13 07:00:00','2014-08-13 07:15:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,18,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-13 07:00:00','2014-08-13 07:15:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,19,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-13 08:00:00','2014-08-13 08:10:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,20,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-13 08:00:00','2014-08-13 09:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,21,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-13 08:00:00','2014-08-13 08:10:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,22,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-13 08:00:00','2014-08-13 09:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,23,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-13 09:00:00','2014-08-13 21:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,24,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-13 10:00:00','2014-08-13 10:10:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,25,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-13 10:00:00','2014-08-13 12:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,26,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-13 10:00:00','2014-08-13 10:30:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,27,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-13 10:00:00','2014-08-13 10:15:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,28,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-13 10:00:00','2014-08-13 10:15:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,29,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-13 11:00:00','2014-08-13 11:10:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,30,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-13 11:00:00','2014-08-13 12:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,31,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\n(detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-13 11:00:00','2014-08-13 11:10:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,32,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-13 11:00:00','2014-08-13 12:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,33,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-13 12:00:00','2014-08-14 00:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,34,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento próprio \n\ndas instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-13 13:00:00','2014-08-13 13:10:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,35,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-13 13:00:00','2014-08-13 15:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,36,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-13 13:00:00','2014-08-13 13:30:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,37,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-13 13:00:00','2014-08-13 13:15:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,38,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-13 13:00:00','2014-08-13 13:15:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,39,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\ndo turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-13 14:00:00','2014-08-13 14:10:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,40,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-13 14:00:00','2014-08-13 15:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,41,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\n(detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-14 05:00:00','2014-08-14 05:10:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,42,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 05:00:00','2014-08-14 06:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,43,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 06:00:00','2014-08-14 18:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,44,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento próprio \n\ndas instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-14 07:00:00','2014-08-14 07:10:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,45,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-14 07:00:00','2014-08-14 09:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,46,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 07:00:00','2014-08-14 07:30:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,47,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 07:00:00','2014-08-14 07:15:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,48,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 07:00:00','2014-08-14 07:15:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,49,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\ndo turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-14 08:00:00','2014-08-14 08:10:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,50,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 08:00:00','2014-08-14 09:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,51,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-14 08:00:00','2014-08-14 08:10:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,52,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 08:00:00','2014-08-14 09:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,53,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 09:00:00','2014-08-14 21:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,54,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-14 10:00:00','2014-08-14 10:10:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,55,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-14 10:00:00','2014-08-14 12:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,56,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 10:00:00','2014-08-14 10:30:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,57,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 10:00:00','2014-08-14 10:15:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,58,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 10:00:00','2014-08-14 10:15:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,59,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-14 11:00:00','2014-08-14 11:10:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,60,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 11:00:00','2014-08-14 12:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,61,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\n(detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-14 11:00:00','2014-08-14 11:10:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,62,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 11:00:00','2014-08-14 12:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,63,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 12:00:00','2014-08-15 00:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,64,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento próprio \n\ndas instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-14 13:00:00','2014-08-14 13:10:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,65,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-14 13:00:00','2014-08-14 15:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,66,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 13:00:00','2014-08-14 13:30:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,67,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 13:00:00','2014-08-14 13:15:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,68,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 13:00:00','2014-08-14 13:15:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,69,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\ndo turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-14 14:00:00','2014-08-14 14:10:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,70,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 14:00:00','2014-08-14 15:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,71,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-14 14:00:00','2014-08-14 14:10:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,72,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 14:00:00','2014-08-14 15:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,73,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 15:00:00','2014-08-15 03:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,74,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-14 16:00:00','2014-08-14 16:10:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,75,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-14 16:00:00','2014-08-14 18:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,76,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 16:00:00','2014-08-14 16:30:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,77,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 16:00:00','2014-08-14 16:15:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,78,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 16:00:00','2014-08-14 16:15:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,79,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-14 17:00:00','2014-08-14 17:10:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,80,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 17:00:00','2014-08-14 18:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,81,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\n(detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-15 05:00:00','2014-08-15 05:10:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,82,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-15 05:00:00','2014-08-15 06:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,83,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-15 06:00:00','2014-08-15 18:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,84,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento próprio \n\ndas instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-15 07:00:00','2014-08-15 07:10:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,85,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-15 07:00:00','2014-08-15 09:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,86,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-15 07:00:00','2014-08-15 07:30:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,87,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-15 07:00:00','2014-08-15 07:15:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,88,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-15 07:00:00','2014-08-15 07:15:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,89,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada \n\ndo turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-15 08:00:00','2014-08-15 08:10:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,90,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-15 08:00:00','2014-08-15 09:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,91,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-15 08:00:00','2014-08-15 08:10:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,92,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-15 08:00:00','2014-08-15 09:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,93,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-15 09:00:00','2014-08-15 21:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,94,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-15 10:00:00','2014-08-15 10:10:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,95,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-15 10:00:00','2014-08-15 12:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,96,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-15 10:00:00','2014-08-15 10:30:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,97,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-15 10:00:00','2014-08-15 10:15:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,98,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-15 10:00:00','2014-08-15 10:15:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,99,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-15 11:00:00','2014-08-15 11:10:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,100,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-15 11:00:00','2014-08-15 12:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,101,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-15 11:00:00','2014-08-15 11:10:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,102,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-15 11:00:00','2014-08-15 12:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,103,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-15 12:00:00','2014-08-16 00:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,104,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-15 13:00:00','2014-08-15 13:10:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,105,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-15 13:00:00','2014-08-15 15:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,106,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-15 13:00:00','2014-08-15 13:30:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,107,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-15 13:00:00','2014-08-15 13:15:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,108,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-15 13:00:00','2014-08-15 13:15:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,109,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-15 14:00:00','2014-08-15 14:10:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,110,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-15 14:00:00','2014-08-15 15:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,111,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-16 05:00:00','2014-08-16 05:10:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,112,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-16 05:00:00','2014-08-16 06:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,113,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-16 06:00:00','2014-08-16 18:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,114,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-16 07:00:00','2014-08-16 07:10:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,115,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-16 07:00:00','2014-08-16 09:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,116,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-16 07:00:00','2014-08-16 07:30:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,117,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-16 07:00:00','2014-08-16 07:15:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,118,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-16 07:00:00','2014-08-16 07:15:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,119,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-16 08:00:00','2014-08-16 08:10:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,120,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-16 08:00:00','2014-08-16 09:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,121,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-16 08:00:00','2014-08-16 08:10:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,122,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-16 08:00:00','2014-08-16 09:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,123,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-16 09:00:00','2014-08-16 21:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,124,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-16 10:00:00','2014-08-16 10:10:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,125,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-16 10:00:00','2014-08-16 12:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,126,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-16 10:00:00','2014-08-16 10:30:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,127,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-16 10:00:00','2014-08-16 10:15:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,128,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-16 10:00:00','2014-08-16 10:15:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,129,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-16 11:00:00','2014-08-16 11:10:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,130,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-16 11:00:00','2014-08-16 12:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,131,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-16 11:00:00','2014-08-16 11:10:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,132,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-16 11:00:00','2014-08-16 12:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,133,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-16 12:00:00','2014-08-17 00:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,134,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-16 13:00:00','2014-08-16 13:10:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,135,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-16 13:00:00','2014-08-16 15:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,136,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-16 13:00:00','2014-08-16 13:30:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,137,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-16 13:00:00','2014-08-16 13:15:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,138,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-16 13:00:00','2014-08-16 13:15:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,139,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-16 14:00:00','2014-08-16 14:10:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,140,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-16 14:00:00','2014-08-16 15:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,141,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-17 05:00:00','2014-08-17 05:10:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,142,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-17 05:00:00','2014-08-17 06:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,143,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-17 06:00:00','2014-08-17 18:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,144,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-17 07:00:00','2014-08-17 07:10:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,145,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-17 07:00:00','2014-08-17 09:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,146,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-17 07:00:00','2014-08-17 07:30:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,147,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-17 07:00:00','2014-08-17 07:15:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,148,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-17 07:00:00','2014-08-17 07:15:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,149,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-17 08:00:00','2014-08-17 08:10:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,150,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-17 08:00:00','2014-08-17 09:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,151,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-17 08:00:00','2014-08-17 08:10:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,152,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-17 08:00:00','2014-08-17 09:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,153,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-17 09:00:00','2014-08-17 21:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,154,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-17 10:00:00','2014-08-17 10:10:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,155,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-17 10:00:00','2014-08-17 12:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,156,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-17 10:00:00','2014-08-17 10:30:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,157,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-17 10:00:00','2014-08-17 10:15:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,158,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-17 10:00:00','2014-08-17 10:15:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,159,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-17 11:00:00','2014-08-17 11:10:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,160,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-17 11:00:00','2014-08-17 12:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,161,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-17 11:00:00','2014-08-17 11:10:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,162,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-17 11:00:00','2014-08-17 12:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,163,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-17 12:00:00','2014-08-18 00:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,164,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-17 13:00:00','2014-08-17 13:10:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,165,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-17 13:00:00','2014-08-17 15:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,166,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-17 13:00:00','2014-08-17 13:30:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,167,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-17 13:00:00','2014-08-17 13:15:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,168,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-17 13:00:00','2014-08-17 13:15:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,169,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-17 14:00:00','2014-08-17 14:10:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,170,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-17 14:00:00','2014-08-17 15:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,171,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-18 05:00:00','2014-08-18 05:10:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,172,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-18 05:00:00','2014-08-18 06:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,173,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-18 06:00:00','2014-08-18 18:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,174,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-18 07:00:00','2014-08-18 07:10:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,175,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-18 07:00:00','2014-08-18 09:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,176,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-18 07:00:00','2014-08-18 07:30:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,177,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-18 07:00:00','2014-08-18 07:15:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,178,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-18 07:00:00','2014-08-18 07:15:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,179,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-18 08:00:00','2014-08-18 08:10:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,180,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-18 08:00:00','2014-08-18 09:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,181,1,1,NULL,1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações \n\ngerais)',10,5,5,'2014-08-18 11:00:00','2014-08-18 11:10:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,182,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-18 11:00:00','2014-08-18 12:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,183,1,3,NULL,3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 \n\nhoras)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-18 12:00:00','2014-08-19 00:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,184,1,4,NULL,4,'Início das atividades de segurança pública e Defesa (Conforme planejamento \n\npróprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',10,5,5,'2014-08-18 13:00:00','2014-08-18 13:10:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,185,1,5,NULL,5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e \n\ncampo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',120,5,5,'2014-08-18 13:00:00','2014-08-18 15:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,186,1,6,NULL,6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-18 13:00:00','2014-08-18 13:30:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,187,1,7,NULL,7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF \n\nTransportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-18 13:00:00','2014-08-18 13:15:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,188,1,8,NULL,8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-18 13:00:00','2014-08-18 13:15:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,189,1,9,NULL,9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança \n\nprivada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',10,5,5,'2014-08-18 14:00:00','2014-08-18 14:10:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,190,1,10,NULL,10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',60,5,5,'2014-08-18 14:00:00','2014-08-18 15:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL);
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_comentario`
--

DROP TABLE IF EXISTS `atividade_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_comentario` (
  `IdContratante` int(11) NOT NULL,
  `IdAtividade` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItemAtividade` int(11) NOT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdComentario` int(11) NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(1000) NOT NULL,
  `DtHrComentario` datetime NOT NULL,
  `IdPessoa` int(11) NOT NULL,
  PRIMARY KEY (`IdComentario`,`IdAtividade`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdProcedimento`,`NrItemAtividade`),
  KEY `R_230` (`IdAtividade`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdProcedimento`,`NrItemAtividade`),
  KEY `R_231` (`IdPessoa`),
  CONSTRAINT `R_230` FOREIGN KEY (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItemAtividade`) REFERENCES `atividade` (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItem`),
  CONSTRAINT `R_231` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_comentario`
--

LOCK TABLES `atividade_comentario` WRITE;
/*!40000 ALTER TABLE `atividade_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_form_resp`
--

DROP TABLE IF EXISTS `atividade_form_resp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_form_resp` (
  `IdAtividade` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItemAtividade` int(11) NOT NULL,
  `IdFormulario` int(11) NOT NULL,
  `IdTopico` int(11) NOT NULL,
  `IdPergunta` int(11) NOT NULL,
  `DescricaoResposta` varchar(300) DEFAULT NULL,
  `Pontuacao` varchar(2) DEFAULT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  PRIMARY KEY (`IdAtividade`,`IdProcedimento`,`NrItemAtividade`,`IdFormulario`,`IdTopico`,`IdPergunta`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_203` (`IdAtividade`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdProcedimento`,`NrItemAtividade`),
  KEY `R_215` (`IdPergunta`,`IdFormulario`,`IdTopico`),
  CONSTRAINT `R_203` FOREIGN KEY (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItemAtividade`) REFERENCES `atividade` (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItem`),
  CONSTRAINT `R_215` FOREIGN KEY (`IdPergunta`, `IdFormulario`, `IdTopico`) REFERENCES `pergunta` (`IdPergunta`, `IdFormulario`, `IdTopico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_form_resp`
--

LOCK TABLES `atividade_form_resp` WRITE;
/*!40000 ALTER TABLE `atividade_form_resp` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade_form_resp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_mensagem`
--

DROP TABLE IF EXISTS `atividade_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_mensagem` (
  `IdAtividade` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItemAtividade` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdMensagem` int(11) NOT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `DtHrEnvioMsg` datetime DEFAULT NULL,
  PRIMARY KEY (`IdAtividade`,`IdProcedimento`,`NrItemAtividade`,`IdMensagem`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_202` (`IdAtividade`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdProcedimento`,`NrItemAtividade`),
  KEY `R_213` (`IdMensagem`),
  CONSTRAINT `R_202` FOREIGN KEY (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItemAtividade`) REFERENCES `atividade` (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItem`),
  CONSTRAINT `R_213` FOREIGN KEY (`IdMensagem`) REFERENCES `mensagem` (`IdMensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_mensagem`
--

LOCK TABLES `atividade_mensagem` WRITE;
/*!40000 ALTER TABLE `atividade_mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_ocorrencia`
--

DROP TABLE IF EXISTS `atividade_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade_ocorrencia` (
  `IdOcorrencia` int(11) NOT NULL,
  `DtInicioAtividade` datetime NOT NULL,
  `DtFimExecucaoAtividade` datetime DEFAULT NULL,
  `Observacao` varchar(200) DEFAULT NULL,
  `IdStatus` int(11) DEFAULT NULL,
  `IdAtividadeOcorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `IdClassificacaoOcorrencia` int(11) NOT NULL,
  `IdCheckListOcorrencia` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItem` int(11) NOT NULL,
  `Realizado` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdAtividadeOcorrencia`,`IdOcorrencia`,`IdCheckListOcorrencia`,`IdClassificacaoOcorrencia`,`IdProcedimento`,`NrItem`),
  KEY `R_143` (`IdOcorrencia`),
  KEY `R_146` (`IdStatus`),
  KEY `R_157` (`IdCheckListOcorrencia`,`IdClassificacaoOcorrencia`,`IdProcedimento`,`NrItem`),
  CONSTRAINT `R_143` FOREIGN KEY (`IdOcorrencia`) REFERENCES `ocorrencia` (`IdOcorrencia`),
  CONSTRAINT `R_146` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`),
  CONSTRAINT `R_157` FOREIGN KEY (`IdCheckListOcorrencia`, `IdClassificacaoOcorrencia`, `IdProcedimento`, `NrItem`) REFERENCES `checklist_procedimento_ocorrencia` (`IdCheckListOcorrencia`, `IdClassificacaoOcorrencia`, `IdProcedimento`, `NrItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `IdCargo` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCargo` varchar(50) NOT NULL,
  `DescricaoCargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Gerente','Gerente'),(2,'Arquiteto de Soluções','Responsavel por desenhar o sistema'),(3,'Diretor','Diretor'),(4,'Supervisor','Supervisor'),(5,'Operador','Operador'),(6,'VP','Vice-Presidente'),(7,'Presidente','Presidente'),(8,'Operador','Operador'),(9,'Coordenador','Coordenador');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist` (
  `IdCheckList` int(11) NOT NULL AUTO_INCREMENT,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `NomeCheckList` varchar(50) NOT NULL,
  `DescricaoCheckList` varchar(50) DEFAULT NULL,
  `Recorrente` int(11) NOT NULL,
  `TempoExecEstimado` int(11) NOT NULL,
  `TempoTolerInicio` int(11) NOT NULL,
  `TempoTolerFim` int(11) NOT NULL,
  `DtHrInicioPrevisto` datetime DEFAULT NULL,
  `DtHrFimPrevisto` datetime DEFAULT NULL,
  `DtHrInicioRealizado` datetime DEFAULT NULL,
  `DtHrFimRealizado` datetime DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `Ativo` int(11) NOT NULL,
  `IdStatus` int(11) DEFAULT NULL,
  `IdFuncionarioResp` int(11) DEFAULT NULL,
  `IdCheckListPadrao` int(11) DEFAULT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_204` (`IdEvento`,`IdContratante`,`IdCliente`,`IdLocal`),
  KEY `R_205` (`IdStatus`),
  KEY `R_206` (`IdFuncionarioResp`,`IdContratante`),
  KEY `R_208` (`IdCheckListPadrao`),
  CONSTRAINT `R_204` FOREIGN KEY (`IdEvento`, `IdContratante`, `IdCliente`, `IdLocal`) REFERENCES `evento` (`IdEvento`, `IdContratante`, `IdCliente`, `IdLocal`),
  CONSTRAINT `R_205` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`),
  CONSTRAINT `R_206` FOREIGN KEY (`IdFuncionarioResp`, `IdContratante`) REFERENCES `funcionario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_208` FOREIGN KEY (`IdCheckListPadrao`) REFERENCES `checklist_padrao` (`IdCheckListPadrao`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (1,1,5,4,3,'Match Day','Brasil x Croácia',0,880,5,5,'2014-08-12 09:00:00','2014-08-12 23:40:00','2014-08-21 16:53:38','2014-08-21 16:58:21',NULL,NULL,1,5,7,1,'cancelando checklist'),(2,2,11,4,3,'Match Day','México x Camarões',0,880,5,5,'2014-08-13 05:00:00','2014-08-13 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(3,3,13,4,3,'Match Day','Espanha x Holanda',0,880,5,5,'2014-08-13 08:00:00','2014-08-13 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(4,4,8,4,3,'Match Day','Chile x Austrália',0,880,5,5,'2014-08-13 11:00:00','2014-08-14 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(5,5,6,4,3,'Match Day','Colombia x Grécia',0,880,5,5,'2014-08-14 05:00:00','2014-08-14 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(6,6,10,4,3,'Match Day','Uruguai x Costa Rica',0,880,5,5,'2014-08-14 08:00:00','2014-08-14 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(7,7,7,4,3,'Match Day','Inglaterra x Itália',0,880,5,5,'2014-08-14 11:00:00','2014-08-15 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(8,8,12,4,3,'Match Day','Costa do Marfim x Japão',0,880,5,5,'2014-08-14 14:00:00','2014-08-15 04:30:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(9,9,9,4,3,'Match Day','Suíça x Equador',0,880,5,5,'2014-08-15 05:00:00','2014-08-15 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(10,10,15,4,3,'Match Day','França x Honduras',0,880,5,5,'2014-08-15 08:00:00','2014-08-15 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(11,11,4,4,3,'Match Day','Argentina x Bósnia',0,880,5,5,'2014-08-15 11:00:00','2014-08-16 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(12,12,13,4,3,'Match Day','Alemanha x Portugal',0,880,5,5,'2014-08-16 05:00:00','2014-08-16 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(13,13,14,4,3,'Match Day','Irã x Nigéria',0,880,5,5,'2014-08-16 08:00:00','2014-08-16 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(14,14,11,4,3,'Match Day','Gana x Estados Unidos',0,880,5,5,'2014-08-16 11:00:00','2014-08-17 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(15,15,6,4,3,'Match Day','Bélgica x Argélia',0,880,5,5,'2014-08-17 05:00:00','2014-08-17 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(16,16,10,4,3,'Match Day','Brasil x México',0,880,5,5,'2014-08-17 08:00:00','2014-08-17 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(17,17,8,4,3,'Match Day','Rússia x Coréia do Sul',0,880,5,5,'2014-08-17 11:00:00','2014-08-18 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(18,18,15,4,3,'Match Day','Holanda x Austrália',0,880,5,5,'2014-08-18 05:00:00','2014-08-18 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(19,19,7,4,3,'Match Day','Croácia x Camarões',0,880,5,5,'2014-08-18 11:00:00','2014-08-19 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_comentario`
--

DROP TABLE IF EXISTS `checklist_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_comentario` (
  `IdComentario` int(11) NOT NULL AUTO_INCREMENT,
  `DtHrComentario` datetime DEFAULT NULL,
  `Comentario` varchar(1000) DEFAULT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `IdPessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdComentario`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_243` (`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_244` (`IdPessoa`),
  CONSTRAINT `R_243` FOREIGN KEY (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `checklist` (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`),
  CONSTRAINT `R_244` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `Ativo` int(11) NOT NULL,
  `IdMensagem` int(11) NOT NULL,
  `DtHrEnvioMsg` datetime DEFAULT NULL,
  PRIMARY KEY (`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdMensagem`),
  KEY `R_209` (`IdMensagem`),
  CONSTRAINT `R_201` FOREIGN KEY (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `checklist` (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`),
  CONSTRAINT `R_209` FOREIGN KEY (`IdMensagem`) REFERENCES `mensagem` (`IdMensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_mensagem`
--

LOCK TABLES `checklist_mensagem` WRITE;
/*!40000 ALTER TABLE `checklist_mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_ocorrencia`
--

DROP TABLE IF EXISTS `checklist_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_ocorrencia` (
  `IdClassificacaoOcorrencia` int(11) NOT NULL,
  `NomeCheckListOcorrencia` varchar(50) NOT NULL,
  `DescricaoChecklistOcorrencia` varchar(50) DEFAULT NULL,
  `IdCheckListOcorrencia` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdCheckListOcorrencia`,`IdClassificacaoOcorrencia`),
  KEY `R_142` (`IdClassificacaoOcorrencia`),
  CONSTRAINT `R_142` FOREIGN KEY (`IdClassificacaoOcorrencia`) REFERENCES `classificacao_ocorrencia` (`IdClassificacaoOcorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_ocorrencia`
--

LOCK TABLES `checklist_ocorrencia` WRITE;
/*!40000 ALTER TABLE `checklist_ocorrencia` DISABLE KEYS */;
INSERT INTO `checklist_ocorrencia` VALUES (1,'Briga','Checklist Briga',1),(2,'Alarme','Checklist Alarme',2),(3,'Fogo','Checklist Fogo',3),(4,'Tumulto','Checklist Tumulto',4),(5,'Roubo','Checklist Roubo',5),(6,'Água','Checklist Água',6),(7,'Ferido','Checklist Ferido',7);
/*!40000 ALTER TABLE `checklist_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_padrao`
--

DROP TABLE IF EXISTS `checklist_padrao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_padrao` (
  `IdCheckListPadrao` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCheckList` varchar(50) NOT NULL,
  `DescricaoCheckList` varchar(50) DEFAULT NULL,
  `Recorrente` tinyint(4) NOT NULL,
  `TempoExecEstimado` int(11) NOT NULL,
  `TempoTolerInicio` int(11) NOT NULL,
  `TempoTolerFim` int(11) NOT NULL,
  PRIMARY KEY (`IdCheckListPadrao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_padrao`
--

LOCK TABLES `checklist_padrao` WRITE;
/*!40000 ALTER TABLE `checklist_padrao` DISABLE KEYS */;
INSERT INTO `checklist_padrao` VALUES (1,'Match Day','Match Day',0,880,5,5);
/*!40000 ALTER TABLE `checklist_padrao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_procedimento`
--

DROP TABLE IF EXISTS `checklist_procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_procedimento` (
  `IdCheckListPadrao` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItem` int(11) NOT NULL,
  PRIMARY KEY (`IdCheckListPadrao`,`IdProcedimento`,`NrItem`),
  KEY `R_148` (`IdProcedimento`),
  CONSTRAINT `R_147` FOREIGN KEY (`IdCheckListPadrao`) REFERENCES `checklist_padrao` (`IdCheckListPadrao`),
  CONSTRAINT `R_148` FOREIGN KEY (`IdProcedimento`) REFERENCES `procedimento` (`IdProcedimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_procedimento`
--

LOCK TABLES `checklist_procedimento` WRITE;
/*!40000 ALTER TABLE `checklist_procedimento` DISABLE KEYS */;
INSERT INTO `checklist_procedimento` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10);
/*!40000 ALTER TABLE `checklist_procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_procedimento_ocorrencia`
--

DROP TABLE IF EXISTS `checklist_procedimento_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_procedimento_ocorrencia` (
  `IdClassificacaoOcorrencia` int(11) NOT NULL,
  `IdCheckListOcorrencia` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItem` int(11) NOT NULL,
  PRIMARY KEY (`IdCheckListOcorrencia`,`IdClassificacaoOcorrencia`,`IdProcedimento`,`NrItem`),
  KEY `R_156` (`IdProcedimento`),
  CONSTRAINT `R_154` FOREIGN KEY (`IdCheckListOcorrencia`, `IdClassificacaoOcorrencia`) REFERENCES `checklist_ocorrencia` (`IdCheckListOcorrencia`, `IdClassificacaoOcorrencia`),
  CONSTRAINT `R_156` FOREIGN KEY (`IdProcedimento`) REFERENCES `procedimento` (`IdProcedimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_procedimento_ocorrencia`
--

LOCK TABLES `checklist_procedimento_ocorrencia` WRITE;
/*!40000 ALTER TABLE `checklist_procedimento_ocorrencia` DISABLE KEYS */;
INSERT INTO `checklist_procedimento_ocorrencia` VALUES (1,1,130,1),(1,1,132,2),(7,7,132,1),(1,1,134,3),(7,7,134,2),(1,1,136,4),(1,1,138,5),(1,1,139,6),(1,1,140,7),(1,1,142,8),(7,7,144,3),(2,2,145,1),(3,3,145,1),(4,4,145,1),(5,5,145,1),(6,6,145,1),(2,2,147,2),(3,3,147,2),(4,4,147,2),(5,5,147,2),(6,6,147,2),(2,2,149,3),(3,3,149,3),(4,4,149,3),(5,5,149,3),(6,6,149,3);
/*!40000 ALTER TABLE `checklist_procedimento_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_segmento`
--

DROP TABLE IF EXISTS `checklist_segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_segmento` (
  `IdSegmento` int(11) NOT NULL,
  `IdCheckListPadrao` int(11) NOT NULL,
  PRIMARY KEY (`IdCheckListPadrao`,`IdSegmento`),
  KEY `R_149` (`IdSegmento`),
  CONSTRAINT `R_149` FOREIGN KEY (`IdSegmento`) REFERENCES `segmento` (`IdSegmento`),
  CONSTRAINT `R_150` FOREIGN KEY (`IdCheckListPadrao`) REFERENCES `checklist_padrao` (`IdCheckListPadrao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_segmento`
--

LOCK TABLES `checklist_segmento` WRITE;
/*!40000 ALTER TABLE `checklist_segmento` DISABLE KEYS */;
INSERT INTO `checklist_segmento` VALUES (2,1);
/*!40000 ALTER TABLE `checklist_segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_segmento_ocorrencia`
--

DROP TABLE IF EXISTS `checklist_segmento_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_segmento_ocorrencia` (
  `IdSegmento` int(11) NOT NULL,
  `IdClassificacaoOcorrencia` int(11) NOT NULL,
  `IdCheckListOcorrencia` int(11) NOT NULL,
  PRIMARY KEY (`IdSegmento`,`IdCheckListOcorrencia`,`IdClassificacaoOcorrencia`),
  KEY `R_153` (`IdCheckListOcorrencia`,`IdClassificacaoOcorrencia`),
  CONSTRAINT `R_152` FOREIGN KEY (`IdSegmento`) REFERENCES `segmento` (`IdSegmento`),
  CONSTRAINT `R_153` FOREIGN KEY (`IdCheckListOcorrencia`, `IdClassificacaoOcorrencia`) REFERENCES `checklist_ocorrencia` (`IdCheckListOcorrencia`, `IdClassificacaoOcorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_segmento_ocorrencia`
--

LOCK TABLES `checklist_segmento_ocorrencia` WRITE;
/*!40000 ALTER TABLE `checklist_segmento_ocorrencia` DISABLE KEYS */;
INSERT INTO `checklist_segmento_ocorrencia` VALUES (1,1,1),(2,1,1),(5,1,1),(1,2,2),(2,2,2),(5,2,2),(1,3,3),(2,3,3),(5,3,3),(1,4,4),(2,4,4),(5,4,4),(1,5,5),(2,5,5),(5,5,5),(1,6,6),(2,6,6),(5,6,6),(1,7,7),(2,7,7),(5,7,7);
/*!40000 ALTER TABLE `checklist_segmento_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_ocorrencia`
--

DROP TABLE IF EXISTS `classificacao_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificacao_ocorrencia` (
  `IdClassificacaoOcorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `NomeClassificacaoOcorrencia` varchar(50) NOT NULL,
  `IconeClassificacao` blob,
  PRIMARY KEY (`IdClassificacaoOcorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_ocorrencia`
--

LOCK TABLES `classificacao_ocorrencia` WRITE;
/*!40000 ALTER TABLE `classificacao_ocorrencia` DISABLE KEYS */;
INSERT INTO `classificacao_ocorrencia` VALUES (1,'BRIGA',NULL),(2,'ALARME',NULL),(3,'FOGO',NULL),(4,'TUMULTO',NULL),(5,'ROUBO',NULL),(6,'AGUA',NULL),(7,'FERIDO',NULL);
/*!40000 ALTER TABLE `classificacao_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFantasia` varchar(100) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `RazaoSocial` varchar(100) DEFAULT NULL,
  `CNPJCliente` varchar(50) DEFAULT NULL,
  `Site` varchar(50) DEFAULT NULL,
  `Logo` mediumblob,
  `TelefoneCliente` varchar(20) DEFAULT NULL,
  `ResponsavelCliente` varchar(50) DEFAULT NULL,
  `TelefoneResponsavel` varchar(20) NOT NULL,
  `CelularResponsavel` varchar(20) DEFAULT NULL,
  `EmailResponsavel` varchar(50) DEFAULT NULL,
  `IECliente` varchar(20) DEFAULT NULL,
  `IdEndereco` int(11) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`,`IdContratante`),
  KEY `R_95` (`IdContratante`),
  KEY `R_224` (`IdEndereco`),
  CONSTRAINT `R_224` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`IdEndereco`),
  CONSTRAINT `R_95` FOREIGN KEY (`IdContratante`) REFERENCES `contratante` (`IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Kolss',1,1,'Kolss','10.837.432/0001-05','www.kolss.com.br',NULL,'(11) 4427-7554','Ederson Juliano','(11) 4427-7554','(11) 99153-0624','ederson@kolss.com.br','ISENTO',1,'-23.658226','-46.533063'),(2,'Belfort',2,1,'Belfort','11.222.333/0001-44','www.belfort.com.br',NULL,'(11) 3723-2020','Marcus Sandin','(11) 3723-2020','(11) 98448-5577','marcus@belfort.com.br','ISENTO',3,'-23.584511','-46.729257'),(3,'Kobel',3,1,'Kobel','19.335.987/0001-23','www.kobel.com.br',NULL,'(11) 4427-7554','Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br','ISENTO',1,'-23.658226','-46.533063'),(4,'Copa do Mundo de 2014',3,1,'Copa do Mundo de 2014','22.333.444/0001-55','www.brasil2014.com.br',NULL,'(11) 4427-7554','Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br','ISENTO',4,'-22.978049','-43.411488');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_mensagem`
--

DROP TABLE IF EXISTS `cliente_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_mensagem` (
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `IdMensagem` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdCliente`,`IdContratante`,`IdMensagem`),
  KEY `R_182` (`IdMensagem`),
  CONSTRAINT `R_181` FOREIGN KEY (`IdCliente`, `IdContratante`) REFERENCES `cliente` (`IdCliente`, `IdContratante`),
  CONSTRAINT `R_182` FOREIGN KEY (`IdMensagem`) REFERENCES `mensagem` (`IdMensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_mensagem`
--

LOCK TABLES `cliente_mensagem` WRITE;
/*!40000 ALTER TABLE `cliente_mensagem` DISABLE KEYS */;
INSERT INTO `cliente_mensagem` VALUES (1,1,12,1),(1,1,13,1),(1,1,15,1),(1,1,17,1),(1,1,19,1),(1,1,32,1),(1,1,33,1),(1,1,34,1),(2,2,12,1),(2,2,13,1),(2,2,15,1),(2,2,17,1),(2,2,19,1),(2,2,32,1),(2,2,33,1),(2,2,34,1),(4,3,12,1),(4,3,13,1),(4,3,15,1),(4,3,17,1),(4,3,19,1),(4,3,32,1),(4,3,33,1),(4,3,34,1);
/*!40000 ALTER TABLE `cliente_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contexto`
--

DROP TABLE IF EXISTS `contexto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contexto` (
  `IdPessoa` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdPessoa`,`IdEvento`,`IdContratante`,`IdCliente`,`IdLocal`),
  KEY `R_174` (`IdPessoa`,`IdContratante`),
  KEY `R_175` (`IdEvento`,`IdContratante`,`IdCliente`,`IdLocal`),
  CONSTRAINT `R_174` FOREIGN KEY (`IdPessoa`, `IdContratante`) REFERENCES `usuario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_175` FOREIGN KEY (`IdEvento`, `IdContratante`, `IdCliente`, `IdLocal`) REFERENCES `evento` (`IdEvento`, `IdContratante`, `IdCliente`, `IdLocal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contexto`
--

LOCK TABLES `contexto` WRITE;
/*!40000 ALTER TABLE `contexto` DISABLE KEYS */;
INSERT INTO `contexto` VALUES (1,1,5,4,3,1),(1,2,11,4,3,1),(1,3,13,4,3,1),(1,4,8,4,3,1),(1,5,6,4,3,1),(1,6,10,4,3,1),(1,7,7,4,3,1),(1,8,12,4,3,1),(1,9,9,4,3,1),(1,10,15,4,3,1),(1,11,4,4,3,1),(1,12,13,4,3,1),(1,13,14,4,3,1),(1,14,11,4,3,1),(1,15,6,4,3,1),(1,16,10,4,3,1),(1,17,8,4,3,1),(1,18,15,4,3,1),(1,19,7,4,3,1),(1,20,4,4,3,1),(2,1,5,4,3,1),(2,2,11,4,3,1),(2,3,13,4,3,1),(2,4,8,4,3,1),(2,5,6,4,3,1),(2,6,10,4,3,1),(2,7,7,4,3,1),(2,8,12,4,3,1),(2,9,9,4,3,1),(2,10,15,4,3,1),(2,11,4,4,3,1),(2,12,13,4,3,1),(2,13,14,4,3,1),(2,14,11,4,3,1),(2,15,6,4,3,1),(2,16,10,4,3,1),(2,17,8,4,3,1),(2,18,15,4,3,1),(2,19,7,4,3,1),(2,20,4,4,3,1),(3,1,5,4,3,1),(3,2,11,4,3,1),(3,3,13,4,3,1),(3,4,8,4,3,1),(3,5,6,4,3,1),(3,6,10,4,3,1),(3,7,7,4,3,1),(3,8,12,4,3,1),(3,9,9,4,3,1),(3,10,15,4,3,1),(3,11,4,4,3,1),(3,12,13,4,3,1),(3,13,14,4,3,1),(3,14,11,4,3,1),(3,15,6,4,3,1),(3,16,10,4,3,1),(3,17,8,4,3,1),(3,18,15,4,3,1),(3,19,7,4,3,1),(3,20,4,4,3,1),(4,1,5,4,3,1),(4,2,11,4,3,1),(4,3,13,4,3,1),(4,4,8,4,3,1),(4,5,6,4,3,1),(4,6,10,4,3,1),(4,7,7,4,3,1),(4,8,12,4,3,1),(4,9,9,4,3,1),(4,10,15,4,3,1),(4,11,4,4,3,1),(4,12,13,4,3,1),(4,13,14,4,3,1),(4,14,11,4,3,1),(4,15,6,4,3,1),(4,16,10,4,3,1),(4,17,8,4,3,1),(4,18,15,4,3,1),(4,19,7,4,3,1),(4,20,4,4,3,1),(5,1,5,4,3,1),(5,2,11,4,3,1),(5,3,13,4,3,1),(5,4,8,4,3,1),(5,5,6,4,3,1),(5,6,10,4,3,1),(5,7,7,4,3,1),(5,8,12,4,3,1),(5,9,9,4,3,1),(5,10,15,4,3,1),(5,11,4,4,3,1),(5,12,13,4,3,1),(5,13,14,4,3,1),(5,14,11,4,3,1),(5,15,6,4,3,1),(5,16,10,4,3,1),(5,17,8,4,3,1),(5,18,15,4,3,1),(5,19,7,4,3,1),(5,20,4,4,3,1),(6,1,5,4,3,1),(6,2,11,4,3,1),(6,3,13,4,3,1),(6,4,8,4,3,1),(6,5,6,4,3,1),(6,6,10,4,3,1),(6,7,7,4,3,1),(6,8,12,4,3,1),(6,9,9,4,3,1),(6,10,15,4,3,1),(6,11,4,4,3,1),(6,12,13,4,3,1),(6,13,14,4,3,1),(6,14,11,4,3,1),(6,15,6,4,3,1),(6,16,10,4,3,1),(6,17,8,4,3,1),(6,18,15,4,3,1),(6,19,7,4,3,1),(6,20,4,4,3,1),(7,1,5,4,3,1),(7,2,11,4,3,1),(7,3,13,4,3,1),(7,4,8,4,3,1),(7,5,6,4,3,1),(7,6,10,4,3,1),(7,7,7,4,3,1),(7,8,12,4,3,1),(7,9,9,4,3,1),(7,10,15,4,3,1),(7,11,4,4,3,1),(7,12,13,4,3,1),(7,13,14,4,3,1),(7,14,11,4,3,1),(7,15,6,4,3,1),(7,16,10,4,3,1),(7,17,8,4,3,1),(7,18,15,4,3,1),(7,19,7,4,3,1),(7,20,4,4,3,1),(8,1,5,4,3,1),(8,2,11,4,3,1),(8,3,13,4,3,1),(8,4,8,4,3,1),(8,5,6,4,3,1),(8,6,10,4,3,1),(8,7,7,4,3,1),(8,8,12,4,3,1),(8,9,9,4,3,1),(8,10,15,4,3,1),(8,11,4,4,3,1),(8,12,13,4,3,1),(8,13,14,4,3,1),(8,14,11,4,3,1),(8,15,6,4,3,1),(8,16,10,4,3,1),(8,17,8,4,3,1),(8,18,15,4,3,1),(8,19,7,4,3,1),(8,20,4,4,3,1),(9,1,5,4,3,1),(9,2,11,4,3,1),(9,3,13,4,3,1),(9,4,8,4,3,1),(9,5,6,4,3,1),(9,6,10,4,3,1),(9,7,7,4,3,1),(9,8,12,4,3,1),(9,9,9,4,3,1),(9,10,15,4,3,1),(9,11,4,4,3,1),(9,12,13,4,3,1),(9,13,14,4,3,1),(9,14,11,4,3,1),(9,15,6,4,3,1),(9,16,10,4,3,1),(9,17,8,4,3,1),(9,18,15,4,3,1),(9,19,7,4,3,1),(9,20,4,4,3,1);
/*!40000 ALTER TABLE `contexto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratante`
--

DROP TABLE IF EXISTS `contratante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratante` (
  `IdContratante` int(11) NOT NULL AUTO_INCREMENT,
  `IdSegmento` int(11) NOT NULL,
  `NomeFantasia` varchar(100) NOT NULL,
  `CNPJContratante` varchar(20) NOT NULL,
  `IEContratante` varchar(20) DEFAULT NULL,
  `TelefoneContratante` varchar(20) NOT NULL,
  `Observacao` varchar(200) DEFAULT NULL,
  `RazaoSocial` varchar(100) NOT NULL,
  `Site` varchar(80) DEFAULT NULL,
  `Logo` mediumblob,
  `ResponsavelContratante` varchar(50) NOT NULL,
  `TelefoneResponsavel` varchar(20) NOT NULL,
  `CelularResponsavel` varchar(20) DEFAULT NULL,
  `EmailResponsavel` varchar(80) DEFAULT NULL,
  `IdEndereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdContratante`),
  KEY `R_1` (`IdSegmento`),
  KEY `R_223` (`IdEndereco`),
  CONSTRAINT `R_1` FOREIGN KEY (`IdSegmento`) REFERENCES `segmento` (`IdSegmento`),
  CONSTRAINT `R_223` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`IdEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratante`
--

LOCK TABLES `contratante` WRITE;
/*!40000 ALTER TABLE `contratante` DISABLE KEYS */;
INSERT INTO `contratante` VALUES (1,2,'Kolss','10.837.432/0001-05','ISENTO','(11) 4427-7554','Kolss Gestão Empresarial','Kolss Gestão Empresarial','www.kolss.com.br',NULL,'Ederson Juliano','(11) 99153-0624',NULL,'ederson@kolss.com.br',7),(2,2,'Belfort','11.222.333/0001-44','ISENTO','(11) 3723-2020','Belfort','Belfort','www.belfort.com.br',NULL,'Marcus Sandin','(11) 98448-5577',NULL,'marcus@belfort.com.br',3),(3,2,'Kobel','19.335.987/0001-23','ISENTO','(11) 4427-7554','Empresa especializada em sistemas de segurança','Kobel Software Ltda','www.kobel.com.br',NULL,'Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br',1);
/*!40000 ALTER TABLE `contratante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `IdDevice` int(11) NOT NULL AUTO_INCREMENT,
  `IdRegistro` varchar(255) DEFAULT NULL,
  `IdProjeto` varchar(50) DEFAULT NULL,
  `DtUltimoLogin` datetime DEFAULT NULL,
  `IdPessoa` int(11) NOT NULL,
  PRIMARY KEY (`IdDevice`),
  KEY `R_229` (`IdPessoa`),
  CONSTRAINT `R_229` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_pessoa`
--

DROP TABLE IF EXISTS `email_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_pessoa` (
  `IdPessoa` int(11) NOT NULL,
  `IdEmail` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(80) NOT NULL,
  `DtCadastro` datetime NOT NULL,
  PRIMARY KEY (`IdEmail`,`IdPessoa`),
  KEY `R_80` (`IdPessoa`),
  CONSTRAINT `R_80` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_pessoa`
--

LOCK TABLES `email_pessoa` WRITE;
/*!40000 ALTER TABLE `email_pessoa` DISABLE KEYS */;
INSERT INTO `email_pessoa` VALUES (1,1,'administrador@kobel.com.br','2014-07-21 10:06:21'),(2,2,'sidney@kobel.com.br','2014-07-21 10:06:21'),(3,3,'marcus@belfort.com.br','2014-07-21 10:06:21'),(4,4,'ederson@kolss.com.br','2014-07-21 10:06:21'),(5,5,'alexandre@kolss.com.br','2014-07-21 10:06:21'),(6,6,'eduardo@kolss.com.br','2014-07-21 10:06:21'),(7,7,'opepadrao@kolss.com.br','2014-07-21 10:06:21'),(8,8,'opemaster@kolss.com.br','2014-07-21 10:06:21'),(9,9,'leonardo@kolss.com.br','2014-07-21 10:06:21');
/*!40000 ALTER TABLE `email_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailconfig_contratante`
--

DROP TABLE IF EXISTS `emailconfig_contratante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailconfig_contratante` (
  `IdContratante` int(11) NOT NULL,
  `HostName` varchar(80) NOT NULL,
  `SmtpPort` int(11) NOT NULL,
  `UserId` varchar(80) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `FromSender` varchar(80) NOT NULL,
  `FromName` varchar(50) NOT NULL,
  `SSLOnConnect` tinyint(1) NOT NULL,
  `StartTlsEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdContratante`),
  CONSTRAINT `R_113` FOREIGN KEY (`IdContratante`) REFERENCES `contratante` (`IdContratante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfig_contratante`
--

LOCK TABLES `emailconfig_contratante` WRITE;
/*!40000 ALTER TABLE `emailconfig_contratante` DISABLE KEYS */;
INSERT INTO `emailconfig_contratante` VALUES (1,'smtp.abc.terra.com.br',587,'nicbrain@kobel.com.br','nickobel','nicbrain@kobel.com.br','NicBrain',0,0),(2,'smtp.abc.terra.com.br',587,'nicbrain@kobel.com.br','nickobel','nicbrain@kobel.com.br','NicBrain',0,0),(3,'smtp.abc.terra.com.br',587,'nicbrain@kobel.com.br','nickobel','nicbrain@kobel.com.br','NicBrain',0,0);
/*!40000 ALTER TABLE `emailconfig_contratante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `Nome` varchar(100) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Complemento` varchar(30) DEFAULT NULL,
  `Bairro` varchar(60) NOT NULL,
  `IdTipoLogradouro` int(11) NOT NULL,
  `Cep` varchar(20) DEFAULT NULL,
  `IdPais` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdMunicipio` int(11) NOT NULL,
  `DtCadastro` datetime NOT NULL,
  `IdEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `IdTipoEndereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEndereco`),
  KEY `R_83` (`IdTipoLogradouro`),
  KEY `R_86` (`IdMunicipio`,`IdPais`,`IdEstado`),
  KEY `R_258` (`IdTipoEndereco`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`IdTipoEndereco`) REFERENCES `tipo_endereco` (`IdTipoEndereco`),
  CONSTRAINT `R_83` FOREIGN KEY (`IdTipoLogradouro`) REFERENCES `tipo_logradouro` (`IdTipoLogradouro`),
  CONSTRAINT `R_86` FOREIGN KEY (`IdMunicipio`, `IdPais`, `IdEstado`) REFERENCES `municipio` (`IdMunicipio`, `IdPais`, `IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES ('José Caballero',65,'Sala 12',' Vila Bastos',2,'09040-210',1,1,2,'2014-07-21 10:04:33',1,'-23.658226','-46.533063',2),('Santa Albina',430,NULL,' Jd. Trussardi',1,'05518-000',1,1,1,'2014-07-21 10:04:33',3,'-23.584511','-46.729257',2),('Salvador Allende',6555,'Rio Centro-Portão B','Barra da Tijuca',2,'22783-127',1,2,3,'2014-07-21 10:04:33',4,'-22.978049','-43.411488',2),('Professor Eurico Rabelo',20271,NULL,'Maracanã',1,'20271-150',1,2,3,'2014-07-21 10:04:33',5,'-22.913931','-43.230989',2),('Doutor Luís Aires',0,NULL,'Itaquera',1,'08295-005',1,1,1,'2014-07-21 10:04:33',6,'-23.543503','-46.476490',2),('Antônio Abrahão Caram',1001,NULL,'São Luís',2,'31275-000',1,3,4,'2014-07-21 10:04:33',7,'-19.865015','-43.970914',2),('Complexo Poliesportivo Ayrton Senna',0,NULL,'Asa Norte',2,'70077-000',1,10,6,'2014-07-21 10:04:33',8,'-15.783839','-47.897319',2),('Agrícola Paes de Barros',0,NULL,'Verdão',2,'78030-210',1,15,7,'2014-07-21 10:04:33',9,'-15.60379','-56.121605',2),('Buenos Aires',0,NULL,'Água Verde',1,'80250-070',1,19,8,'2014-07-21 10:04:33',10,'-25.447873','-49.275899',2),('Alberto Craveiro',2901,NULL,'Castelão',2,'60861-211',1,9,9,'2014-07-21 10:04:33',11,'-3.807231','-38.522434',2),('Constantino Nery',0,NULL,'Flores',2,'69058-795',1,7,5,'2014-07-21 10:04:33',12,'-3.0838035','-60.026296',2),('Presidente Prudente de Morais',5121,NULL,'Lagoa Nova',2,'59056-200',1,22,10,'2014-07-21 10:04:33',13,'-5.8269481','-35.2134785',2),('Padre Cacique',891,NULL,'Praia de Belas',2,'90810-240',1,23,11,'2014-07-21 10:04:33',14,'-30.0650812','-51.2352245',2),('Deus é Fiel',1,NULL,'Jardim Tenedo',1,'54710-010',1,20,12,'2014-07-21 10:04:33',15,'-8.041675','-35.00782',2),('Presidente Costa e Silva',0,NULL,'Nazaré',2,'40050-360',1,20,12,'2014-07-21 10:04:33',16,'-12.978644','-38.504044',2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipamento` (
  `NrSerieEquipamento` varchar(20) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `ipEquipamento` varchar(512) DEFAULT NULL,
  `UsuarioAcesso` varchar(20) DEFAULT NULL,
  `SenhaAcesso` varchar(20) DEFAULT NULL,
  `IdModeloEquipamento` int(11) NOT NULL,
  `IdSetor` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `NomeEquipamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdEquipamento`),
  KEY `R_240` (`IdModeloEquipamento`),
  KEY `R_241` (`IdSetor`,`IdLocal`,`IdCliente`,`IdContratante`),
  CONSTRAINT `R_240` FOREIGN KEY (`IdModeloEquipamento`) REFERENCES `modelo_equipamento` (`IdModeloEquipamento`),
  CONSTRAINT `R_241` FOREIGN KEY (`IdSetor`, `IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `setor` (`IdSetor`, `IdLocal`, `IdCliente`, `IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES ('123456',1,1,'http://192.168.0.16:81/videostream.cgi?user=admin&pwd=123&resolution=32&rate=30','usuario','senha',1,1,3,3,3,NULL,NULL,'Câmera 1'),('123456',1,2,'mms://201.87.159.148/VO_KM_41.990_270','usuario','senha',1,2,4,4,3,'-22.910840','-43.231059','Câmera 1a'),('123456',1,3,'rtsp://live240.impek.com/soleiltv/video','usuario','senha',1,2,4,4,3,'-22.911095','-43.229671','Câmera 2a'),('123456',1,4,'rtsp://plazacam.studentaffairs.duke.edu:554/axis-media/media.amp?videocodec=h264','usuario','senha',1,6,4,4,3,'-22.912650','-43.230963','Câmera 1b'),('123456',1,5,'mms://201.87.159.148/VO_KM_13.000_280','usuario','senha',1,6,4,4,3,'-22.911055','-43.228306','Câmera 2b'),('123456',1,6,'http://radar.g1.globo.com/FinxiPlayer.swf','usuario','senha',1,6,4,4,3,'-22.913','-43.23','Câmera 2c');
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `IdPais` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `SiglaEstado` varchar(20) NOT NULL,
  `NomeEstado` varchar(80) NOT NULL,
  PRIMARY KEY (`IdEstado`,`IdPais`),
  KEY `R_12` (`IdPais`),
  CONSTRAINT `R_12` FOREIGN KEY (`IdPais`) REFERENCES `pais` (`IdPais`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,1,'SP','São Paulo'),(1,2,'RJ','Rio de Janeiro'),(1,3,'MG','Minas Gerais'),(1,4,'AC','Acre'),(1,5,'AL','Alagoas'),(1,6,'AP','Amapá'),(1,7,'AM','Amazonas'),(1,8,'BA','Bahia'),(1,9,'CE','Ceará'),(1,10,'DF','Distrito Federal'),(1,11,'ES','Espírito Santo'),(1,12,'GO','Goiás'),(1,13,'TO','Tocantins'),(1,14,'MA','Maranhão'),(1,15,'MT','Mato Grosso'),(1,16,'MS','Mato Grosso do Sul'),(1,17,'PA','Pará'),(1,18,'PB','Paraíba'),(1,19,'PR','Paraná'),(1,20,'PE','Pernambuco'),(1,21,'PI','Piauí'),(1,22,'RN','Rio Grande do Norte'),(1,23,'RS','Rio Grande do Sul'),(1,24,'RO','Rondônia'),(1,25,'RR','Roraima'),(1,26,'SC','Santa Catarina'),(1,27,'SE','Sergipe');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `IdEvento` int(11) NOT NULL AUTO_INCREMENT,
  `NomeEvento` varchar(80) NOT NULL,
  `DtHrInicioEvento` datetime NOT NULL,
  `DtHrFimEvento` datetime NOT NULL,
  `Ativo` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `Observacao` varchar(200) DEFAULT NULL,
  `ResponsavelEvento` varchar(50) DEFAULT NULL,
  `TelefoneResponsavel` varchar(20) DEFAULT NULL,
  `CelularResponsavel` varchar(20) DEFAULT NULL,
  `EmailResponsavel` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`IdEvento`,`IdContratante`,`IdCliente`,`IdLocal`),
  KEY `R_99` (`IdLocal`,`IdCliente`,`IdContratante`),
  CONSTRAINT `R_99` FOREIGN KEY (`IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `local` (`IdLocal`, `IdCliente`, `IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Brasil x Croácia','2014-08-12 17:00:00','2014-08-12 19:00:00',1,5,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(2,'México x Camarões','2014-08-13 13:00:00','2014-08-13 15:00:00',1,11,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(3,'Espanha x Holanda','2014-08-13 16:00:00','2014-08-13 18:00:00',1,13,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(4,'Chile x Austrália','2014-08-13 19:00:00','2014-08-13 21:00:00',1,8,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(5,'Colombia x Grécia','2014-08-14 13:00:00','2014-08-14 15:00:00',1,6,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(6,'Uruguai x Costa Rica','2014-08-14 16:00:00','2014-08-14 18:00:00',1,10,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(7,'Inglaterra x Itália','2014-08-14 19:00:00','2014-08-14 21:00:00',1,7,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(8,'Costa do Marfim x Japão','2014-08-14 22:00:00','2014-08-15 00:00:00',1,12,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(9,'Suíça x Equador','2014-08-15 13:00:00','2014-08-15 15:00:00',1,9,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(10,'França x Honduras','2014-08-15 16:00:00','2014-08-15 18:00:00',1,15,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(11,'Argentina x Bósnia','2014-08-15 19:00:00','2014-08-15 21:00:00',1,4,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(12,'Alemanha x Portugal','2014-08-16 13:00:00','2014-08-16 15:00:00',1,13,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(13,'Irã x Nigéria','2014-08-16 16:00:00','2014-08-16 18:00:00',1,14,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(14,'Gana x Estados Unidos','2014-08-16 19:00:00','2014-08-16 21:00:00',1,11,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(15,'Bélgica x Argélia','2014-08-17 13:00:00','2014-08-17 15:00:00',1,6,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(16,'Brasil x México','2014-08-17 16:00:00','2014-08-17 18:00:00',1,10,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(17,'Rússia x Coréia do Sul','2014-08-17 19:00:00','2014-08-17 21:00:00',1,8,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(18,'Holanda x Austrália','2014-08-18 13:00:00','2014-08-18 15:00:00',1,15,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(19,'Croácia x Camarões','2014-08-18 19:00:00','2014-08-18 21:00:00',1,7,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(20,'Espanha x Chile','2014-08-18 16:00:00','2014-08-18 18:00:00',1,4,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulario` (
  `IdFormulario` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFormulario` varchar(50) NOT NULL,
  `DescricaoFormulario` varchar(100) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdFormulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `IdFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(100) NOT NULL,
  `NomeFantasia` varchar(100) DEFAULT NULL,
  `CNPJFornecedor` varchar(20) NOT NULL,
  `Site` varchar(80) DEFAULT NULL,
  `Logo` mediumblob,
  `NomeContato` varchar(50) NOT NULL,
  `TelefoneContato` varchar(20) NOT NULL,
  `EmailContato` varchar(80) DEFAULT NULL,
  `CelularContato` varchar(20) DEFAULT NULL,
  `IEFornecedor` varchar(20) DEFAULT NULL,
  `IdSegmento` int(11) DEFAULT NULL,
  `IdEndereco` int(11) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdFornecedor`),
  KEY `R_189` (`IdSegmento`),
  KEY `R_222` (`IdEndereco`),
  CONSTRAINT `R_189` FOREIGN KEY (`IdSegmento`) REFERENCES `segmento` (`IdSegmento`),
  CONSTRAINT `R_222` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`IdEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Fornecedor Geral','Geral','222.222.222/0001-22',NULL,NULL,'José João','(11) 2222-2222','geral@geral.com.br','(21) 92014-2014',NULL,1,1,1);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `IdPessoa` int(11) NOT NULL,
  `IdFuncionarioSuperior` int(11) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `IdCargo` int(11) DEFAULT NULL,
  `NrMatricula` int(11) NOT NULL,
  `IdContratanteSuperior` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPessoa`,`IdContratante`),
  KEY `R_173` (`IdFuncionarioSuperior`,`IdContratanteSuperior`),
  KEY `R_217` (`IdContratante`),
  KEY `R_218` (`IdCargo`),
  CONSTRAINT `R_170` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`),
  CONSTRAINT `R_173` FOREIGN KEY (`IdFuncionarioSuperior`, `IdContratanteSuperior`) REFERENCES `funcionario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_217` FOREIGN KEY (`IdContratante`) REFERENCES `contratante` (`IdContratante`),
  CONSTRAINT `R_218` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,2,1,3,2,1,3),(2,4,1,3,1,2,3),(3,NULL,1,3,3,3,NULL),(4,NULL,1,3,3,4,NULL),(5,2,1,3,2,9,3),(6,2,1,3,2,6,3),(7,2,1,3,5,7,3),(8,2,1,3,5,8,3),(9,2,1,3,2,9,3);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `IdGenero` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoGenero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
  `IdGravidadeOcorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `NomeGravidadeOcorrencia` varchar(50) NOT NULL,
  `DescricaoGravidadeOcorrencia` varchar(200) DEFAULT NULL,
  `ScoreMinimo` int(11) NOT NULL,
  `ScoreMaximo` int(11) NOT NULL,
  PRIMARY KEY (`IdGravidadeOcorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravidade_ocorrencia`
--

LOCK TABLES `gravidade_ocorrencia` WRITE;
/*!40000 ALTER TABLE `gravidade_ocorrencia` DISABLE KEYS */;
INSERT INTO `gravidade_ocorrencia` VALUES (1,'Maxima','Maxima Gravidade',91,100),(2,'Alta+','Gravidade Muito Alta',71,90),(3,'Alta','Alta Gravidade',61,70),(4,'Média++','Média/Alta Gravidade',51,60),(5,'Média+','Média/Média Gravidade',41,50),(6,'Média','Gravidade Média',31,40),(7,'Baixa++','Baixa/Média Gravidade',21,30),(8,'Baixa+','Baixa/Baixa Gravidade',11,20),(9,'Baixa','Baixa Gravidade',0,10);
/*!40000 ALTER TABLE `gravidade_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `IdGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `NomeGrupo` varchar(50) NOT NULL,
  `DescricaoGrupo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Superior Imediato','Superior Imediato'),(2,'Gerentes','Gerentes'),(3,'Diretores','Diretores'),(4,'Responsável','Responsável'),(5,'Superintendete','Superintendentes'),(6,'Vice-Presidente','Vice-Presidentes'),(7,'Presidente','Presidente'),(8,'Supervisores','Supervisores'),(9,'Operadores','Operadores');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_funcionario`
--

DROP TABLE IF EXISTS `grupo_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_funcionario` (
  `IdGrupo` int(11) NOT NULL,
  `IdPessoa` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  PRIMARY KEY (`IdPessoa`,`IdGrupo`,`IdContratante`),
  KEY `R_187` (`IdGrupo`),
  KEY `R_188` (`IdPessoa`,`IdContratante`),
  CONSTRAINT `R_187` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`IdGrupo`),
  CONSTRAINT `R_188` FOREIGN KEY (`IdPessoa`, `IdContratante`) REFERENCES `funcionario` (`IdPessoa`, `IdContratante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_funcionario`
--

LOCK TABLES `grupo_funcionario` WRITE;
/*!40000 ALTER TABLE `grupo_funcionario` DISABLE KEYS */;
INSERT INTO `grupo_funcionario` VALUES (4,1,1,3),(2,2,1,3),(2,3,1,3),(2,4,1,3),(4,5,1,3),(4,6,1,3),(4,7,1,3),(4,8,1,3),(4,9,1,3);
/*!40000 ALTER TABLE `grupo_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_mensagem`
--

DROP TABLE IF EXISTS `grupo_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_mensagem` (
  `Ativo` tinyint(4) NOT NULL,
  `IdGrupo` int(11) NOT NULL,
  `IdMensagem` int(11) NOT NULL,
  `IdTipoEnvio` int(11) NOT NULL,
  PRIMARY KEY (`IdGrupo`,`IdMensagem`,`IdTipoEnvio`),
  KEY `R_185` (`IdMensagem`),
  KEY `R_228` (`IdTipoEnvio`),
  CONSTRAINT `R_184` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`IdGrupo`),
  CONSTRAINT `R_185` FOREIGN KEY (`IdMensagem`) REFERENCES `mensagem` (`IdMensagem`),
  CONSTRAINT `R_228` FOREIGN KEY (`IdTipoEnvio`) REFERENCES `tipo_envio` (`IdTipoEnvio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_mensagem`
--

LOCK TABLES `grupo_mensagem` WRITE;
/*!40000 ALTER TABLE `grupo_mensagem` DISABLE KEYS */;
INSERT INTO `grupo_mensagem` VALUES (1,2,12,1),(1,2,12,2),(1,2,13,1),(1,2,13,2),(1,2,15,1),(1,2,15,2),(1,2,17,1),(1,2,17,2),(1,2,19,1),(1,2,19,2),(1,2,32,1),(1,2,32,2),(1,2,33,1),(1,2,33,2),(1,2,34,1),(1,2,34,2);
/*!40000 ALTER TABLE `grupo_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local` (
  `IdLocal` int(11) NOT NULL AUTO_INCREMENT,
  `NomeLocal` varchar(80) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `Site` varchar(80) DEFAULT NULL,
  `Logo` mediumblob,
  `TelefoneLocal` varchar(20) DEFAULT NULL,
  `ResponsavelLocal` varchar(50) DEFAULT NULL,
  `TelefoneResponsavel` varchar(20) DEFAULT NULL,
  `CelularResponsavel` varchar(20) DEFAULT NULL,
  `EmailResponsavel` varchar(80) DEFAULT NULL,
  `MapaLocal` mediumblob,
  `Observacao` varchar(200) DEFAULT NULL,
  `DistanciaLimite` int(11) DEFAULT NULL,
  `IdEndereco` int(11) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `IconeLocal` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_96` (`IdCliente`,`IdContratante`),
  KEY `R_225` (`IdEndereco`),
  CONSTRAINT `R_225` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`IdEndereco`),
  CONSTRAINT `R_96` FOREIGN KEY (`IdCliente`, `IdContratante`) REFERENCES `cliente` (`IdCliente`, `IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'Escritório da Kolss',1,1,'www.kolss.com.br',NULL,'(11) 4427-7554','Ederson Juliano','(11) 4427-7554','(11) 99153-0624','ederson@kolss.com.br',NULL,'Escritório Kolss - Santo André',30,1,'-23.658226','-46.533063',NULL),(2,'Escritório da Belfort',2,2,'www.belfort.com.br',NULL,'(11) 3723-2020','Marcus Sandin','(11) 3723-2020','(11) 98448-5577','marcus@belfort.com.br',NULL,'Escritório Belfort – São Paulo',30,1,'-23.584511','-46.729257',NULL),(3,'Escritório da Kobel',3,3,'www.kobel.com.br',NULL,'(11) 4427-7554','Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br',NULL,'Escritório Kobel - Santo André',30,1,'-23.658226','-46.533063',NULL),(4,'Estádio do Maracanã',4,3,NULL,NULL,'(21) 2014-2014','GSS Maracanã','(21) 2014-2014','(21) 2014-2014','gss@brasil2014.com.br',NULL,'Estádio Mário Filho',50,5,NULL,NULL,NULL),(5,'Arena de São Paulo',4,3,NULL,NULL,'(21) 2014-2014','GSS São Paulo','(11) 2014-2014','(11) 2014-2014','gss@brasil2014.com.br',NULL,'Arena Corinthians',50,6,NULL,NULL,NULL),(6,'Estádio Mineirão',4,3,NULL,NULL,'(21) 2014-2014','GSS Minerão','(21) 2014-2014','(31) 2014-2014','gss@brasil2014.com.br',NULL,'Estádio Governador Magalhães Pinto',50,7,NULL,NULL,NULL),(7,'Arena da Amazônia',4,3,NULL,NULL,'(21) 2014-2014','GSS Amazônia','(21) 2014-2014','(92) 2014-2014','gss@brasil2014.com.br',NULL,'Arena da Amazônia - Manaus',50,12,NULL,NULL,NULL),(8,'Arena Pantanal',4,3,NULL,NULL,'(21) 2014-2014','GSS Pantanal','(21) 2014-2014','(65) 2014-2014','gss@brasil2014.com.br',NULL,'Arena Pantanal - Cuiabá',50,9,NULL,NULL,NULL),(9,'Estádio Nacional',4,3,NULL,NULL,'(21) 2014-2014','GSS Nacional','(21) 2014-2014','(61) 2014-2014','gss@brasil2014.com.br',NULL,'Mané Garrincha - Brasília',50,8,NULL,NULL,NULL),(10,'Estádio Castelão',4,3,NULL,NULL,'(21) 2014-2014','GSS Castelão','(21) 2014-2014','(85) 2014-2014','gss@brasil2014.com.br',NULL,'Castelão - Fortaleza',50,11,NULL,NULL,NULL),(11,'Estádio das Dunas',4,3,NULL,NULL,'(21) 2014-2014','GSS Dunas','(21) 2014-2014','(84) 2014-2014','gss@brasil2014.com.br',NULL,'Arena das Dunas - Natal',50,13,NULL,NULL,NULL),(12,'Arena Pernambuco',4,3,NULL,NULL,'(21) 2014-2014','GSS Pernambuco','(21) 2014-2014','(81) 2014-2014','gss@brasil2014.com.br',NULL,'Arena Pernambuco - Recife',50,15,NULL,NULL,NULL),(13,'Arena Fonte Nova',4,3,NULL,NULL,'(21) 2014-2014','GSS Fonte Nova','(21) 2014-2014','(71) 2014-2014','gss@brasil2014.com.br',NULL,'Fonte Nova - Salvador',50,16,NULL,NULL,NULL),(14,'Arena da Baixada',4,3,NULL,NULL,'(21) 2014-2014','GSS Baixada','(21) 2014-2014','(41) 2014-2014','gss@brasil2014.com.br',NULL,'Arena da Baixada - Curitiba',50,10,NULL,NULL,NULL),(15,'Estádio Beira Rio',4,3,NULL,NULL,'(21) 2014-2014','GSS Beira Rio','(21) 2014-2014','(51) 2014-2014','gss@brasil2014.com.br',NULL,'Beira Rio – Porto Alegre',50,14,NULL,NULL,NULL),(17,'COL - Rio Centro',4,3,NULL,NULL,'(21) 2014-2014','GSS COL','(21) 2014-2014',NULL,'gss@brasil2014.com.br',NULL,'Rio Centro – Rio de Janeiro',50,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagem` (
  `IdMensagem` int(11) NOT NULL AUTO_INCREMENT,
  `TextoMensagem` varchar(140) NOT NULL,
  `DescricaoMensagem` varchar(300) DEFAULT NULL,
  `Checklist` tinyint(4) NOT NULL,
  `Atividade` tinyint(4) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdTipoMsg` int(11) DEFAULT NULL,
  `Ocorrencia` tinyint(4) NOT NULL,
  `AtividadeOcorrencia` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdMensagem`),
  KEY `R_180` (`IdTipoMsg`),
  CONSTRAINT `R_180` FOREIGN KEY (`IdTipoMsg`) REFERENCES `tipo_mensagem` (`IdTipoMsg`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,'Início na data e hora prevista','Sempre que um checklist ou uma atividade é iniciado na data e hora prevista',1,1,1,1,1,1),(2,'Início dentro do periodo de tolerância','Sempre que um checklist ou uma atividade é iniciado dentro do periodo de tolerância',1,1,1,1,1,1),(3,'25% do tempo percorrido','Sempre que um checklist ou uma atividade atingir 25% do seu tempo de execução',1,1,1,1,1,1),(4,'50% do tempo percorrido','Sempre que um checklist ou uma atividade atingir 50% do seu tempo de execução',1,1,1,1,1,1),(5,'75% do tempo percorrido','Sempre que um checklist ou uma atividade atingir 75% do seu tempo de execução',1,1,1,1,1,1),(6,'Parabéns, atividade concluída com êxito','Sempre que uma atividade for finalizada com êxito na data e hora prevista',0,1,1,1,1,1),(7,'Atividade concluída dentro do período de tolerância com êxito','Sempre que uma atividade for finalizada com êxito dentro do período de tolerância',0,1,1,1,1,1),(8,'Parabéns, checklist concluído com êxito','Sempre que um checklist for finalizado com êxito na data e hora prevista',1,0,1,1,1,1),(9,'Checklist concluído com êxito dentro do período de tolerância com êxito','Sempre que um checklist for finalizado com êxito dentro do período de tolerância',1,1,1,1,1,1),(10,'Produtividade da atividade','Ao encerrar um checklist, enviar aviso com o % de produtividade de cada atividade do checklist',1,0,1,1,1,1),(11,'Produtividade do checklist','Ao encerrar um checklist, enviar aviso com o % de produtividade do checklist  e de cada atividade do checklist',1,0,1,1,1,1),(12,'Início não realizado na data e hora prevista','Sempre que um checklist ou atividade não for iniciado na data/hora prevista',1,1,1,2,1,1),(13,'Início com atraso','Sempre que um checklist ou atividade for iniciado após a data/hora prevista',1,1,1,2,1,1),(14,'Estouro do tempo de tolerância para início','Sempre que estourar o tempo de tolerância de início de um checklist ou atividade e esta não ter sido iniciada',1,1,1,2,1,1),(15,'Estouro do tempo previsto para finalização','Sempre que um checklist ou atividade não for finalizado na data/hora prevista',1,1,1,2,1,1),(16,'Estouro do período previsto para finalização','Sempre que estourar o tempo previsto de execução de um checklist ou atividade que possui apenas período de execução e não data/hora prevista de termino',1,1,1,2,1,1),(17,'Finalizado com atraso','Sempre que um checklist ou uma atividade for concluído depois do horário de término previsto',1,1,1,2,1,1),(18,'Checklist ou atividade Pausada','Sempre que um checklist ou uma atividade é pausado',1,1,1,2,1,1),(19,'Checklist Cancelado','Sempre que um checklist é cancelado',1,1,1,2,1,1),(20,'Checklist e atividades pendentes','Sempre duas (2) horas após o final do tempo previsto de término do checklist. Caso não exista término previsto, considerar duas (2) horas após o término do turno.',1,0,1,2,1,1),(21,'Clientes não visitados na semana','Todas as segundas-feiras reportando se na semana anterior não houve agendamento de checklist para o cliente',1,0,1,2,1,1),(22,'Atividade por período não iniciada - mais a msg específica de TI, T2 e T3','Deverá verificar qual o período da atividade e calcular e comparar se o tempo restante para o término do checklist é suficiente para a execução',0,1,1,2,1,1),(23,'Realização fora do local designado','Ao iniciar um checklist ou atividade, comparar a lat/long capturada pelo aplicativo mobile no check de início com a lat/long do cadastro do local do cliente/checklist. Se a distancia exceder uma distância previamente cadastrada no local, enviar alerta',1,1,1,2,1,1),(24,'Alerta manual','Permitir escrever mensagem para envio',0,0,1,2,1,1),(25,'Alerta de equipamento com defeito:','Verificação automática se equipamentos estão em funcionamento',0,0,1,2,1,1),(26,'Item Normas e procedimentos / treinamento avaliado como Ruim - vide relatório de OSs','Quando o campo 3. Normas e procedimento / treinamentos do tópico B do formulário de OS (Segurança, Serviços e Limpeza) for preenchido com ruim',1,0,1,2,1,1),(27,'Itens SARCC RQO e Nextel / Celular avaliado como Ruim - vide relatório de OSs','Quando os campos SARCC RQO e Nextel / Celular do tópico C do formulário de OS (Segurança, Serviços e Limpeza) for preenchido com ruim',1,0,1,2,1,1),(28,'Item Normas e procedimentos / treinamento avaliado como Ruim menos de 10 vezes no mês','Quando o campo 3. Normas e procedimento / treinamentos do tópico B do formulário de OS (Segurança, Serviços e Limpeza) for preenchido com ruim menos de 10 vezes no mês anterior. Calcular todo dia 01 do mês',0,0,1,2,1,1),(29,'Respostas semelhantes nas OSs do dia - vide relatório de OSs','Comparar para um mesmo usuário responsável pelas atividades de um dia de preenchimento de OSs (Segurança, Serviços e Limpeza), se para cada resposta preenchida em campos de pontuação, obtiver preenchimento das OSs semelhantes mediante a um índice de 95% de respostas idênticas',0,0,1,2,1,1),(30,'Respostas pontuadas como RUIM nas OSs - vide relatório de OSs','Analisar as OS após o preenchimento e enviar os campos que contenham a pontuação como Ruim',1,0,1,2,1,1),(31,' Alerta Mensal de Desempenho (tirar dúvida sobre este alerta)','Enviar todo dia 01 do mês',0,0,1,2,1,1),(32,'Você possui checklist e atividades agendadas. Consulte o sistema.','Você possui checklist e atividades agendadas. Consulte o sistema.',0,0,1,1,1,1),(33,'Alerta de Ocorrência enviado. ',' Alerta de Ocorrência enviado.',1,1,1,2,1,1),(34,'Atividade Cancelada','Sempre que uma atividade é cancelada',1,1,1,2,1,1);
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `IdMenu` int(11) NOT NULL AUTO_INCREMENT,
  `IdMenuSuperior` int(11) DEFAULT NULL,
  `NomeMenu` varchar(50) NOT NULL,
  `DescricaoMenu` varchar(200) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `UrlMenu` varchar(200) DEFAULT NULL,
  `LadoMenu` varchar(1) NOT NULL,
  `NrItemMenu` int(11) NOT NULL,
  `UrlIcone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdMenu`),
  KEY `R_226` (`IdMenuSuperior`),
  CONSTRAINT `R_226` FOREIGN KEY (`IdMenuSuperior`) REFERENCES `menu` (`IdMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,'menu.contratante','Contratante',1,NULL,'E',1,'/images/iconesNovos/contratante.png'),(2,NULL,'menu.perfiAcesso','Perfil de Acesso',1,NULL,'E',2,'/images/iconesNovos/perfil-acesso.png'),(3,NULL,'menu.usuario','Usuário',1,NULL,'E',3,'/images/iconesNovos/usuario.png'),(4,NULL,'menu.dadosMestres','Dados Mestres',1,NULL,'E',4,'/images/iconesNovos/dados-mestre.png'),(5,NULL,'menu.controleDeAcesso','Controle de Acesso',1,NULL,'E',5,'/images/iconesNovos/controle-acesso.png'),(6,NULL,'menu.ocorrencia','Ocorrência',1,NULL,'E',6,'/images/iconesNovos/ocorrencias.png'),(7,NULL,'menu.checklist','CheckList',1,NULL,'E',7,'/images/iconesNovos/check-list.png'),(8,NULL,'menu.monitorar','Monitorar',1,NULL,'E',8,'/images/iconesNovos/monitorar.png'),(9,NULL,'menu.rastrear','Rastrear',1,NULL,'E',9,'/images/iconesNovos/rastrear.png'),(10,NULL,'menu.relatorio','Relatórios',1,NULL,'E',10,'/images/iconesNovos/relatorios.png'),(11,NULL,'menu.telefonesUteis','Telefones Uteis',1,'TelefonesUteis.nicbrain','E',11,'/images/iconesNovos/tel-uteis.png'),(16,1,'menu.cadastroContratante','Cadastro Contratante',1,'ListaContratante.nicbrain','E',1,NULL),(17,1,'menu.consultaContrantane','Consulta Contratante',1,'ConsultaContratante.nicbrain','E',2,NULL),(18,1,'menu.cliente','Cliente',1,'ListaCliente.nicbrain','E',3,NULL),(19,1,'menu.local','Local',1,'ListaLocal.nicbrain','E',4,NULL),(20,1,'menu.evento','Evento',1,'ListaEvento.nicbrain','E',5,NULL),(21,1,'menu.funcionario','Funcionário',1,'ListaFuncionario.nicbrain','E',6,NULL),(22,1,'menu.confChecklist','Configuração de CheckList e Atividades',1,'ListaConfiguracaoChecklist.nicbrain','E',7,NULL),(23,4,'menu.segmento','Segmento',1,'ListaSegmento.nicbrain','E',14,NULL),(24,4,'menu.checklistProcedimento','CheckList e Procedimentos',1,'layout.nicbrain','E',2,NULL),(25,26,'menu.tipoMensagem','Tipo de Mensagem',1,'ListaTipoMensagem.nicbrain','E',5,NULL),(26,4,'menu.outrasTabelas','Outras Tabelas',1,'layout.nicbrain','E',18,NULL),(27,4,'menu.status','Status',1,'ListaStatus.nicbrain','E',15,NULL),(28,4,'menu.pais','País',1,'ListaPais.nicbrain','E',13,NULL),(29,4,'menu.estado','Estado',1,'ListaEstado.nicbrain','E',4,NULL),(30,4,'menu.municipio','Município',1,'ListaMunicipio.nicbrain','E',12,NULL),(31,5,'menu.cadastroPessoas','Cadastro de Pessoas',1,'ListaPessoa.nicbrain','E',1,NULL),(32,5,'menu.bloqueioPessoas','Bloqueio de Pessoas',1,'ListaBloqueioPessoas.nicbrain','E',2,NULL),(33,5,'menu.cadastroVeiculos','Cadastro de Veículos',1,'ListaVeiculo.nicbrain','E',3,NULL),(34,5,'menu.bloqueioVeiculos','Bloqueio de Veículos',1,'ListaBloqueioVeiculos.nicbrain','E',4,NULL),(35,5,'menu.liberarAcesso','Liberar Acesso',1,'LiberarAcesso.nicbrain','E',5,NULL),(36,6,'menu.cadastroOcorrencia','Cadastro de Ocorrência',1,'ListaCadastroOcor.nicbrain','E',1,NULL),(37,6,'menu.listaOcorrencia','Operação de Ocorrências em lista ',1,'ListaOcorrencia.nicbrain','E',2,NULL),(38,8,'menu.cameraAoVivo','Câmeras ao Vivo',1,'ListaCamera.nicbrain','E',1,NULL),(39,8,'menu.recuperarImagem','Recuperar Imagem Gravada',1,'RecuperarImagem.nicbrain','E',2,NULL),(40,9,'menu.cadastroPessoasRastrear','Cadastro de Pessoas para Rastreamento',1,'ListaCadastroPessoaRastrear.nicbrain','E',1,NULL),(41,9,'menu.cadastroVeiculosRastrear','Cadastro de Veículos para Rastreamento',1,'ListaCadastroVeiculosRastrear.nicbrain','E',2,NULL),(42,82,'menu.osSeguranca','OS de Segurança',1,'ListaOSSegurança.nicbrain','E',1,NULL),(43,82,'menu.osServico','OS de Serviço',1,'ListaOSServico.nicbrain','E',2,NULL),(44,82,'menu.osLimpeza','OS de Limpeza',1,'ListaOSLimpeza.nicbrain','E',3,NULL),(45,82,'menu.osRespostasSemelh','OS com Respostas Semelhantes',1,'ListaOSRespSemelhante.nicbrain','E',4,NULL),(46,10,'menu.checklists','Relatório de CheckLists',1,'ConsultaChecklist.nicbrain ','E',1,NULL),(47,10,'menu.consultaOcorrencia','Relatório de Ocorrências',1,'ConsultaOcorrencia.nicbrain','E',3,NULL),(48,2,'menu.perfilAcesso','Perfil de Acesso',1,'ListaPerfil.nicbrain','E',1,NULL),(49,3,'menu.usuarios','Usuários',1,'ListaUsuarioFuncionario.nicbrain','E',1,NULL),(50,4,'menu.cargo','Cargo',1,'ListaCargo.nicbrain','E',1,NULL),(51,4,'menu.classificacaoOcorrencia','Classificação Ocorrência',1,'ListaClassificacaoOcorrencia.nicbrain','E',3,NULL),(52,4,'menu.turno','Turno',1,'ListaTurno.nicbrain','E',17,NULL),(53,4,'menu.formulario','Formulário',1,'layout.nicbrain','E',5,NULL),(54,4,'menu.gravidadeOcorrencia','Gravidade Ocorrência',1,'ListaGravidadeOcorrencia.nicbrain','E',7,NULL),(55,4,'menu.grupo','Grupo',1,'ListaGrupo.nicbrain','E',8,NULL),(56,4,'menu.menu','Menu',1,'ListaMenu.nicbrain','E',10,NULL),(57,11,'menu.telefonesUteis','Telefones Úteis',1,'TelefoneUtilPagina.nicbrain','E',1,NULL),(58,4,'menu.telefonesUteis','Telefones Uteis',1,'ListaTelefoneUtil.nicbrain','E',16,NULL),(59,26,'menu.tipoEnvio','Tipo de Envio',1,'ListaTipoEnvio.nicbrain','E',2,NULL),(60,26,'menu.tipoEquipamento','Tipo de Equipamento',1,'ListaTipoEquipamento.nicbrain','E',3,NULL),(61,26,'menu.tipoLogradouro','Tipo de Logradouro',1,'ListaTipoLogradouro.nicbrain','E',4,NULL),(62,26,'menu.tipoOcorrencias','Tipo de Ocorrências',1,'ListaTipoOcorrencia.nicbrain','E',6,NULL),(63,26,'menu.tipoPessoa','Tipo de Pessoa',1,'ListaTipoPessoa.nicbrain','E',7,NULL),(64,26,'menu.tipoTelefone','Tipo de Telefone',1,'ListaTipoTelefone.nicbrain','E',9,NULL),(66,6,'menu.visualizarOcorrencias','Visualizar Ocorrências no Mapa ',1,'MapaLocalPorOcorrencia.nicbrain','E',3,NULL),(67,7,'menu.listaChecklist','Operação de Checklist em Lista',1,'ListaEventoPorChecklist.nicbrain','E',1,NULL),(68,7,'menu.visualizarChecklist','Visualizar Checklists no Mapa',1,'MapaLocalPorChecklist.nicbrain','E',2,NULL),(69,26,'menu.tipoServico','Tipo de Serviço',1,'ListaTipoServico.nicbrain','E',8,NULL),(70,1,'menu.equipamento','Cadastro de Equipamentos',1,'ListaEquipamento.nicbrain','E',8,NULL),(71,24,'menu.checklistPadrao','CheckList Padrão',1,'ListaChecklistPadrao.nicbrain','E',1,NULL),(72,24,'menu.checklistPadraoOcor',' CheckList Padrão de Ocorrência ',1,'ListaChecklistOcor.nicbrain','E',2,NULL),(73,24,'menu.procedimento','Procedimento',1,'ListaProcedimento.nicbrain','E',3,NULL),(74,4,'menu.fornecedor','Fornecedor',1,'ListaFornecedor.nicbrain','E',6,NULL),(75,4,'menu.mensagem','Mensagem',1,'ListaMensagem.nicbrain','E',9,NULL),(76,4,'menu.modeloequipto','Modelo Equipamento',1,'ListaModeloEquipamento.nicbrain','E',11,NULL),(77,26,'menu.tipoEndereco','Tipo de Endereço',1,'ListaTipoEndereco.nicbrain','E',1,NULL),(78,9,'menu.tracarRota','Traçar Rota para Rastreamento',1,'ListaRota.nicbrain','E',3,NULL),(79,9,'menu.rastreamento','Rastreamento',1,'VisualizarMapaRastreamento.nicbrain','E',2,NULL),(80,79,'menu.rastreamentoRota','Rastreamento por Rota',1,'VisualizaCaminhoMapeado.nicbrain','E',2,NULL),(81,10,'menu.dashboard','Dashboard Checklist',1,'DashboardChecklist.nicbrain','E',2,NULL),(82,10,'menu.orderServico','Ordem de Serviço',1,'ListaOS.nicbrain','E',5,NULL),(83,53,'menu.pergunta','Pergunta',1,' ListaPergunta.nicbrain','E',2,NULL),(84,53,'menu.topico','Tópico',1,'ListaTopico.nicbrain','E',3,NULL),(85,53,'menu.formulario','Formulário',1,'ListaFormulario.nicbrain','E',1,NULL),(86,79,'menu.rastramentoAleat','Rastreamento Aleatório',1,'VisualizarCaminhoAleatorio.nicbrain','E',1,NULL),(87,1,'menu.postoservico','Cadastro de Postos de Serviços',1,'ListaPosto.nicbrain','E',9,NULL),(88,1,'menu.setor','Setor',1,'ListaSetor.nicbrain','E',10,NULL),(89,10,'menu.dashboardocorrencia','Dashboard Ocorrência',1,'DashboardOcorrencia.nicbrain','E',4,NULL),(90,3,'menu.trocasenha','Trocar Senha',1,'TrocarSenha.nicbrain','E',2,NULL),(91,38,'menu.listacamera','Visualizar Lista de Câmeras',1,'ListaCamera.nicbrain','E',1,NULL),(92,38,'menu.mapacamera','Visualizar Câmeras em Mapa',1,'MapaCamera.nicbrain','E',1,NULL),(93,79,'menu.rastreamentochecklist','Rastreamento de Checklist',1,'ListaRastreamentoChecklist.nicbrain','E',2,NULL),(94,4,'menu.genero','Genêro',1,'listaGenero.nicbrain','E',19,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_equipamento`
--

DROP TABLE IF EXISTS `modelo_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_equipamento` (
  `IdModeloEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `NomeModeloEquipamento` varchar(50) NOT NULL,
  `ModeloEquipamento` varchar(50) DEFAULT NULL,
  `Homologado` tinyint(4) NOT NULL,
  `Observacao` varchar(200) DEFAULT NULL,
  `IdTipoEquipamento` int(11) NOT NULL,
  `IdFornecedor` int(11) NOT NULL,
  PRIMARY KEY (`IdModeloEquipamento`),
  KEY `R_238` (`IdTipoEquipamento`),
  KEY `R_239` (`IdFornecedor`),
  CONSTRAINT `R_238` FOREIGN KEY (`IdTipoEquipamento`) REFERENCES `tipo_equipamento` (`IdTipoEquipamento`),
  CONSTRAINT `R_239` FOREIGN KEY (`IdFornecedor`) REFERENCES `fornecedor` (`IdFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_equipamento`
--

LOCK TABLES `modelo_equipamento` WRITE;
/*!40000 ALTER TABLE `modelo_equipamento` DISABLE KEYS */;
INSERT INTO `modelo_equipamento` VALUES (1,'Câmera de Vigilância Speed Dome','Câmera de Vigilância Speed Dome',1,NULL,1,1),(2,'Câmera IP','Câmera IP',1,NULL,1,1),(3,'Central de Alarme com discadora linha fixa','Central de Alarme com discadora linha fixa',1,NULL,2,1),(4,'Central de Alarme com discadora linha móvel','Central de Alarme com discadora linha móvel',1,NULL,2,1);
/*!40000 ALTER TABLE `modelo_equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `IdContratante` int(11) NOT NULL,
  `IdMenu` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdContratante`,`IdMenu`),
  KEY `R_177` (`IdMenu`),
  CONSTRAINT `R_176` FOREIGN KEY (`IdContratante`) REFERENCES `contratante` (`IdContratante`),
  CONSTRAINT `R_177` FOREIGN KEY (`IdMenu`) REFERENCES `menu` (`IdMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(1,9,1),(1,10,1),(1,11,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(2,6,1),(2,7,1),(2,8,1),(2,9,1),(2,10,1),(2,11,1),(3,1,1),(3,2,1),(3,3,1),(3,4,1),(3,5,1),(3,6,1),(3,7,1),(3,8,1),(3,9,1),(3,10,1),(3,11,1);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `IdPais` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdMunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `NomeMunicipio` varchar(80) NOT NULL,
  PRIMARY KEY (`IdMunicipio`,`IdPais`,`IdEstado`),
  KEY `R_13` (`IdEstado`,`IdPais`),
  CONSTRAINT `R_13` FOREIGN KEY (`IdEstado`, `IdPais`) REFERENCES `estado` (`IdEstado`, `IdPais`)
) ENGINE=InnoDB AUTO_INCREMENT=5564 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,1,'SÃO PAULO'),(1,1,2,'SANTO ANDRÉ'),(1,2,3,'RIO DE JANEIRO'),(1,3,4,'BELO HORIZONTE'),(1,7,5,'MANAUS'),(1,10,6,'BRASILIA'),(1,15,7,'CUIABÁ'),(1,19,8,'CURITIBA'),(1,9,9,'FORTALEZA'),(1,22,10,'NATAL'),(1,23,11,'PORTO ALEGRE'),(1,20,12,'RECIFE'),(1,8,13,'SALVADOR'),(1,4,14,'ACRELANDIA'),(1,4,15,'ASSIS BRASIL'),(1,4,16,'BRASILEIA'),(1,4,17,'BUJARI'),(1,4,18,'CAPIXABA'),(1,4,19,'CRUZEIRO DO SUL'),(1,4,20,'EPITACIOLANDIA'),(1,4,21,'FEIJO'),(1,4,22,'JORDAO'),(1,4,23,'MANCIO LIMA'),(1,4,24,'MANOEL URBANO'),(1,4,25,'MARECHAL TAUMATURGO'),(1,4,26,'PLACIDO DE CASTRO'),(1,4,27,'PORTO ACRE'),(1,4,28,'PORTO WALTER'),(1,4,29,'RIO BRANCO'),(1,4,30,'RODRIGUES ALVES'),(1,4,31,'SANTA ROSA DO PURUS'),(1,4,32,'SENA MADUREIRA'),(1,4,33,'SENADOR GUIOMARD'),(1,4,34,'TARAUACA'),(1,4,35,'XAPURI'),(1,5,36,'AGUA BRANCA'),(1,5,37,'ANADIA'),(1,5,38,'ARAPIRACA'),(1,5,39,'ATALAIA'),(1,5,40,'BARRA DE SANTO ANTONIO'),(1,5,41,'BARRA DE SAO MIGUEL'),(1,5,42,'BATALHA'),(1,5,43,'BELEM'),(1,5,44,'BELO MONTE'),(1,5,45,'BOCA DA MATA'),(1,5,46,'BRANQUINHA'),(1,5,47,'CACIMBINHAS'),(1,5,48,'CAJUEIRO'),(1,5,49,'CAMPESTRE'),(1,5,50,'CAMPO ALEGRE'),(1,5,51,'CAMPO GRANDE'),(1,5,52,'CANAPI'),(1,5,53,'CAPELA'),(1,5,54,'CARNEIROS'),(1,5,55,'CHA PRETA'),(1,5,56,'COITE DO NOIA'),(1,5,57,'COLONIA LEOPOLDINA'),(1,5,58,'COQUEIRO SECO'),(1,5,59,'CORURIPE'),(1,5,60,'CRAIBAS'),(1,5,61,'DELMIRO GOUVEIA'),(1,5,62,'DOIS RIACHOS'),(1,5,63,'ESTRELA DE ALAGOAS'),(1,5,64,'FEIRA GRANDE'),(1,5,65,'FELIZ DESERTO'),(1,5,66,'FLEXEIRAS'),(1,5,67,'GIRAU DO PONCIANO'),(1,5,68,'IBATEGUARA'),(1,5,69,'IGACI'),(1,5,70,'IGREJA NOVA'),(1,5,71,'INHAPI'),(1,5,72,'JACARE DOS HOMENS'),(1,5,73,'JACUIPE'),(1,5,74,'JAPARATINGA'),(1,5,75,'JARAMATAIA'),(1,5,76,'JEQUIA DA PRAIA'),(1,5,77,'JOAQUIM GOMES'),(1,5,78,'JUNDIA'),(1,5,79,'JUNQUEIRO'),(1,5,80,'LAGOA DA CANOA'),(1,5,81,'LIMOEIRO DE ANADIA'),(1,5,82,'MACEIO'),(1,5,83,'MAJOR ISIDORO'),(1,5,84,'MAR VERMELHO'),(1,5,85,'MARAGOGI'),(1,5,86,'MARAVILHA'),(1,5,87,'MARECHAL DEODORO'),(1,5,88,'MARIBONDO'),(1,5,89,'MATA GRANDE'),(1,5,90,'MATRIZ DE CAMARAGIBE'),(1,5,91,'MESSIAS'),(1,5,92,'MINADOR DO NEGRAO'),(1,5,93,'MONTEIROPOLIS'),(1,5,94,'MURICI'),(1,5,95,'NOVO LINO'),(1,5,96,'OLHO DAGUA DAS FLORES'),(1,5,97,'OLHO DAGUA DO CASADO'),(1,5,98,'OLHO DAGUA GRANDE'),(1,5,99,'OLIVENCA'),(1,5,100,'OURO BRANCO'),(1,5,101,'PALESTINA'),(1,5,102,'PALMEIRA DOS INDIOS'),(1,5,103,'PAO DE ACUCAR'),(1,5,104,'PARICONHA'),(1,5,105,'PARIPUEIRA'),(1,5,106,'PASSO DE CAMARAGIBE'),(1,5,107,'PAULO JACINTO'),(1,5,108,'PENEDO'),(1,5,109,'PIACABUCU'),(1,5,110,'PILAR'),(1,5,111,'PINDOBA'),(1,5,112,'PIRANHAS'),(1,5,113,'POCO DAS TRINCHEIRAS'),(1,5,114,'PORTO CALVO'),(1,5,115,'PORTO DE PEDRAS'),(1,5,116,'PORTO REAL DO COLEGIO'),(1,5,117,'QUEBRANGULO'),(1,5,118,'RIO LARGO'),(1,5,119,'ROTEIRO'),(1,5,120,'SANTA LUZIA DO NORTE'),(1,5,121,'SANTANA DO IPANEMA'),(1,5,122,'SANTANA DO MUNDAU'),(1,5,123,'SAO BRAS'),(1,5,124,'SAO JOSE DA LAJE'),(1,5,125,'SAO JOSE DA TAPERA'),(1,5,126,'SAO LUIS DO QUITUNDE'),(1,5,127,'SAO MIGUEL DOS CAMPOS'),(1,5,128,'SAO MIGUEL DOS MILAGRES'),(1,5,129,'SAO SEBASTIAO'),(1,5,130,'SATUBA'),(1,5,131,'SENADOR RUI PALMEIRA'),(1,5,132,'TANQUE DARCA'),(1,5,133,'TAQUARANA'),(1,5,134,'TEOTONIO VILELA'),(1,5,135,'TRAIPU'),(1,5,136,'UNIAO DOS PALMARES'),(1,5,137,'VICOSA'),(1,7,138,'ALVARAES'),(1,7,139,'AMATURA'),(1,7,140,'ANAMA'),(1,7,141,'ANORI'),(1,7,142,'APUI'),(1,7,143,'ATALAIA DO NORTE'),(1,7,144,'AUTAZES'),(1,7,145,'BARCELOS'),(1,7,146,'BARREIRINHA'),(1,7,147,'BENJAMIN CONSTANT'),(1,7,148,'BERURI'),(1,7,149,'BOA VISTA DO RAMOS'),(1,7,150,'BOCA DO ACRE'),(1,7,151,'BORBA'),(1,7,152,'CAAPIRANGA'),(1,7,153,'CANUTAMA'),(1,7,154,'CARAUARI'),(1,7,155,'CAREIRO'),(1,7,156,'CAREIRO DA VARZEA'),(1,7,157,'COARI'),(1,7,158,'CODAJAS'),(1,7,159,'EIRUNEPE'),(1,7,160,'ENVIRA'),(1,7,161,'FONTE BOA'),(1,7,162,'GUAJARA'),(1,7,163,'HUMAITA'),(1,7,164,'IPIXUNA'),(1,7,165,'IRANDUBA'),(1,7,166,'ITACOATIARA'),(1,7,167,'ITAMARATI'),(1,7,168,'ITAPIRANGA'),(1,7,169,'JAPURA'),(1,7,170,'JURUA'),(1,7,171,'JUTAI'),(1,7,172,'LABREA'),(1,7,173,'MANACAPURU'),(1,7,174,'MANAQUIRI'),(1,7,175,'MANICORE'),(1,7,176,'MARAA'),(1,7,177,'MAUES'),(1,7,178,'NHAMUNDA'),(1,7,179,'NOVA OLINDA DO NORTE'),(1,7,180,'NOVO AIRAO'),(1,7,181,'NOVO ARIPUANA'),(1,7,182,'PARINTINS'),(1,7,183,'PAUINI'),(1,7,184,'PRESIDENTE FIGUEIREDO'),(1,7,185,'RIO PRETO DA EVA'),(1,7,186,'SANTA ISABEL DO RIO NEGRO'),(1,7,187,'SANTO ANTONIO DO ICA'),(1,7,188,'SAO GABRIEL DA CACHOEIRA'),(1,7,189,'SAO PAULO DE OLIVENCA'),(1,7,190,'SAO SEBASTIAO DO UATUMA'),(1,7,191,'SILVES'),(1,7,192,'TABATINGA'),(1,7,193,'TAPAUA'),(1,7,194,'TEFE'),(1,7,195,'TONANTINS'),(1,7,196,'UARINI'),(1,7,197,'URUCARA'),(1,7,198,'URUCURITUBA'),(1,6,199,'AMAPA(MUNICIPIO)'),(1,6,200,'CALCOENE'),(1,6,201,'CUTIAS'),(1,6,202,'FERREIRA GOMES'),(1,6,203,'ITAUBAL'),(1,6,204,'LARANJAL DO JARI'),(1,6,205,'MACAPA'),(1,6,206,'MAZAGAO'),(1,6,207,'OIAPOQUE'),(1,6,208,'PEDRA BRANCA DO AMAPARI'),(1,6,209,'PORTO GRANDE'),(1,6,210,'PRACUUBA'),(1,6,211,'SANTANA'),(1,6,212,'SERRA DO NAVIO'),(1,6,213,'TARTARUGALZINHO'),(1,6,214,'VITORIA DO JARI'),(1,8,215,'ABAIRA'),(1,8,216,'ABARE'),(1,8,217,'ACAJUTIBA'),(1,8,218,'ADUSTINA'),(1,8,219,'AGUA FRIA'),(1,8,220,'AIQUARA'),(1,8,221,'ALAGOINHAS'),(1,8,222,'ALCOBACA'),(1,8,223,'ALMADINA'),(1,8,224,'AMARGOSA'),(1,8,225,'AMELIA RODRIGUES'),(1,8,226,'AMERICA DOURADA'),(1,8,227,'ANAGE'),(1,8,228,'ANDARAI'),(1,8,229,'ANDORINHA'),(1,8,230,'ANGICAL'),(1,8,231,'ANGUERA'),(1,8,232,'ANTAS'),(1,8,233,'ANTONIO CARDOSO'),(1,8,234,'ANTONIO GONCALVES'),(1,8,235,'APORA'),(1,8,236,'APUAREMA'),(1,8,237,'ARACAS'),(1,8,238,'ARACATU'),(1,8,239,'ARACI'),(1,8,240,'ARAMARI'),(1,8,241,'ARATACA'),(1,8,242,'ARATUIPE'),(1,8,243,'AURELINO LEAL'),(1,8,244,'BAIANOPOLIS'),(1,8,245,'BAIXA GRANDE'),(1,8,246,'BANZAE'),(1,8,247,'BARRA'),(1,8,248,'BARRA DA ESTIVA'),(1,8,249,'BARRA DO CHOCA'),(1,8,250,'BARRA DO MENDES'),(1,8,251,'BARRA DO ROCHA'),(1,8,252,'BARREIRAS'),(1,8,253,'BARRO ALTO'),(1,8,254,'BARROCAS'),(1,8,255,'BELMONTE'),(1,8,256,'BELO CAMPO'),(1,8,257,'BIRITINGA'),(1,8,258,'BOA NOVA'),(1,8,259,'BOA VISTA DO TUPIM'),(1,8,260,'BOM JESUS DA LAPA'),(1,8,261,'BOM JESUS DA SERRA'),(1,8,262,'BONINAL'),(1,8,263,'BONITO'),(1,8,264,'BOQUIRA'),(1,8,265,'BOTUPORA'),(1,8,266,'BREJOES'),(1,8,267,'BREJOLANDIA'),(1,8,268,'BROTAS DE MACAUBAS'),(1,8,269,'BRUMADO'),(1,8,270,'BUERAREMA'),(1,8,271,'BURITIRAMA'),(1,8,272,'CAATIBA'),(1,8,273,'CABACEIRAS DO PARAGUACU'),(1,8,274,'CACHOEIRA'),(1,8,275,'CACULE'),(1,8,276,'CAEM'),(1,8,277,'CAETANOS'),(1,8,278,'CAETITE'),(1,8,279,'CAFARNAUM'),(1,8,280,'CAIRU'),(1,8,281,'CALDEIRAO GRANDE'),(1,8,282,'CAMACAN'),(1,8,283,'CAMACARI'),(1,8,284,'CAMAMU'),(1,8,285,'CAMPO ALEGRE DE LOURDES'),(1,8,286,'CAMPO FORMOSO'),(1,8,287,'CANAPOLIS'),(1,8,288,'CANARANA'),(1,8,289,'CANAVIEIRAS'),(1,8,290,'CANDEAL'),(1,8,291,'CANDEIAS'),(1,8,292,'CANDIBA'),(1,8,293,'CANDIDO SALES'),(1,8,294,'CANSANCAO'),(1,8,295,'CANUDOS'),(1,8,296,'CAPELA DO ALTO ALEGRE'),(1,8,297,'CAPIM GROSSO'),(1,8,298,'CARAIBAS'),(1,8,299,'CARAVELAS'),(1,8,300,'CARDEAL DA SILVA'),(1,8,301,'CARINHANHA'),(1,8,302,'CASA NOVA'),(1,8,303,'CASTRO ALVES'),(1,8,304,'CATOLANDIA'),(1,8,305,'CATU'),(1,8,306,'CATURAMA'),(1,8,307,'CENTRAL'),(1,8,308,'CHORROCHO'),(1,8,309,'CICERO DANTAS'),(1,8,310,'CIPO'),(1,8,311,'COARACI'),(1,8,312,'COCOS'),(1,8,313,'CONCEICAO DA FEIRA'),(1,8,314,'CONCEICAO DO ALMEIDA'),(1,8,315,'CONCEICAO DO COITE'),(1,8,316,'CONCEICAO DO JACUIPE'),(1,8,317,'CONDE'),(1,8,318,'CONDEUBA'),(1,8,319,'CONTENDAS DO SINCORA'),(1,8,320,'CORACAO DE MARIA'),(1,8,321,'CORDEIROS'),(1,8,322,'CORIBE'),(1,8,323,'CORONEL JOAO SA'),(1,8,324,'CORRENTINA'),(1,8,325,'COTEGIPE'),(1,8,326,'CRAVOLANDIA'),(1,8,327,'CRISOPOLIS'),(1,8,328,'CRISTOPOLIS'),(1,8,329,'CRUZ DAS ALMAS'),(1,8,330,'CURACA'),(1,8,331,'DARIO MEIRA'),(1,8,332,'DIAS DAVILA'),(1,8,333,'DOM BASILIO'),(1,8,334,'DOM MACEDO COSTA'),(1,8,335,'ELISIO MEDRADO'),(1,8,336,'ENCRUZILHADA'),(1,8,337,'ENTRE RIOS'),(1,8,338,'ERICO CARDOSO'),(1,8,339,'ESPLANADA'),(1,8,340,'EUCLIDES DA CUNHA'),(1,8,341,'EUNAPOLIS'),(1,8,342,'FATIMA'),(1,8,343,'FEIRA DA MATA'),(1,8,344,'FEIRA DE SANTANA'),(1,8,345,'FILADELFIA'),(1,8,346,'FIRMINO ALVES'),(1,8,347,'FLORESTA AZUL'),(1,8,348,'FORMOSA DO RIO PRETO'),(1,8,349,'GANDU'),(1,8,350,'GAVIAO'),(1,8,351,'GENTIO DO OURO'),(1,8,352,'GLORIA'),(1,8,353,'GONGOGI'),(1,8,354,'GOVERNADOR LOMANTO JUNIOR'),(1,8,355,'GOVERNADOR MANGABEIRA'),(1,8,356,'GUAJERU'),(1,8,357,'GUANAMBI'),(1,8,358,'GUARATINGA'),(1,8,359,'HELIOPOLIS'),(1,8,360,'IACU'),(1,8,361,'IBIASSUCE'),(1,8,362,'IBICARAI'),(1,8,363,'IBICOARA'),(1,8,364,'IBICUI'),(1,8,365,'IBIPEBA'),(1,8,366,'IBIPITANGA'),(1,8,367,'IBIQUERA'),(1,8,368,'IBIRAPITANGA'),(1,8,369,'IBIRAPUA'),(1,8,370,'IBIRATAIA'),(1,8,371,'IBITIARA'),(1,8,372,'IBITITA'),(1,8,373,'IBOTIRAMA'),(1,8,374,'ICHU'),(1,8,375,'IGAPORA'),(1,8,376,'IGRAPIUNA'),(1,8,377,'IGUAI'),(1,8,378,'ILHEUS'),(1,8,379,'INHAMBUPE'),(1,8,380,'IPECAETA'),(1,8,381,'IPIAU'),(1,8,382,'IPIRA'),(1,8,383,'IPUPIARA'),(1,8,384,'IRAJUBA'),(1,8,385,'IRAMAIA'),(1,8,386,'IRAQUARA'),(1,8,387,'IRARA'),(1,8,388,'IRECE'),(1,8,389,'ITABELA'),(1,8,390,'ITABERABA'),(1,8,391,'ITABUNA'),(1,8,392,'ITACARE'),(1,8,393,'ITAETE'),(1,8,394,'ITAGI'),(1,8,395,'ITAGIBA'),(1,8,396,'ITAGIMIRIM'),(1,8,397,'ITAGUACU DA BAHIA'),(1,8,398,'ITAJU DO COLONIA'),(1,8,399,'ITAJUIPE'),(1,8,400,'ITAMARAJU'),(1,8,401,'ITAMARI'),(1,8,402,'ITAMBE'),(1,8,403,'ITANAGRA'),(1,8,404,'ITANHEM'),(1,8,405,'ITAPARICA'),(1,8,406,'ITAPE'),(1,8,407,'ITAPEBI'),(1,8,408,'ITAPETINGA'),(1,8,409,'ITAPICURU'),(1,8,410,'ITAPITANGA'),(1,8,411,'ITAQUARA'),(1,8,412,'ITARANTIM'),(1,8,413,'ITATIM'),(1,8,414,'ITIRUCU'),(1,8,415,'ITIUBA'),(1,8,416,'ITORORO'),(1,8,417,'ITUACU'),(1,8,418,'ITUBERA'),(1,8,419,'IUIU'),(1,8,420,'JABORANDI'),(1,8,421,'JACARACI'),(1,8,422,'JACOBINA'),(1,8,423,'JAGUAQUARA'),(1,8,424,'JAGUARARI'),(1,8,425,'JAGUARIPE'),(1,8,426,'JANDAIRA'),(1,8,427,'JEQUIE'),(1,8,428,'JEREMOABO'),(1,8,429,'JIQUIRICA'),(1,8,430,'JITAUNA'),(1,8,431,'JOAO DOURADO'),(1,8,432,'JUAZEIRO'),(1,8,433,'JUCURUCU'),(1,8,434,'JUSSARA'),(1,8,435,'JUSSARI'),(1,8,436,'JUSSIAPE'),(1,8,437,'LAFAIETE COUTINHO'),(1,8,438,'LAGOA REAL'),(1,8,439,'LAJE'),(1,8,440,'LAJEDAO'),(1,8,441,'LAJEDINHO'),(1,8,442,'LAJEDO DO TABOCAL'),(1,8,443,'LAMARAO'),(1,8,444,'LAPAO'),(1,8,445,'LAURO DE FREITAS'),(1,8,446,'LENCOIS'),(1,8,447,'LICINIO DE ALMEIDA'),(1,8,448,'LIVRAMENTO DE NOSSA SENHORA'),(1,8,449,'LUIS EDUARDO MAGALHAES'),(1,8,450,'MACAJUBA'),(1,8,451,'MACARANI'),(1,8,452,'MACAUBAS'),(1,8,453,'MACURURE'),(1,8,454,'MADRE DE DEUS'),(1,8,455,'MAETINGA'),(1,8,456,'MAIQUINIQUE'),(1,8,457,'MAIRI'),(1,8,458,'MALHADA'),(1,8,459,'MALHADA DE PEDRAS'),(1,8,460,'MANOEL VITORINO'),(1,8,461,'MANSIDAO'),(1,8,462,'MARACAS'),(1,8,463,'MARAGOGIPE'),(1,8,464,'MARAU'),(1,8,465,'MARCIONILIO SOUZA'),(1,8,466,'MASCOTE'),(1,8,467,'MATA DE SAO JOAO'),(1,8,468,'MATINA'),(1,8,469,'MEDEIROS NETO'),(1,8,470,'MIGUEL CALMON'),(1,8,471,'MILAGRES'),(1,8,472,'MIRANGABA'),(1,8,473,'MIRANTE'),(1,8,474,'MONTE SANTO'),(1,8,475,'MORPARA'),(1,8,476,'MORRO DO CHAPEU'),(1,8,477,'MORTUGABA'),(1,8,478,'MUCUGE'),(1,8,479,'MUCURI'),(1,8,480,'MULUNGU DO MORRO'),(1,8,481,'MUNDO NOVO'),(1,8,482,'MUNIZ FERREIRA'),(1,8,483,'MUQUEM DO SAO FRANCISCO'),(1,8,484,'MURITIBA'),(1,8,485,'MUTUIPE'),(1,8,486,'NAZARE'),(1,8,487,'NILO PECANHA'),(1,8,488,'NORDESTINA'),(1,8,489,'NOVA CANAA'),(1,8,490,'NOVA FATIMA'),(1,8,491,'NOVA IBIA'),(1,8,492,'NOVA ITARANA'),(1,8,493,'NOVA REDENCAO'),(1,8,494,'NOVA SOURE'),(1,8,495,'NOVA VICOSA'),(1,8,496,'NOVO HORIZONTE'),(1,8,497,'NOVO TRIUNFO'),(1,8,498,'OLINDINA'),(1,8,499,'OLIVEIRA DOS BREJINHOS'),(1,8,500,'OURICANGAS'),(1,8,501,'OUROLANDIA'),(1,8,502,'PALMAS DE MONTE ALTO'),(1,8,503,'PALMEIRAS'),(1,8,504,'PARAMIRIM'),(1,8,505,'PARATINGA'),(1,8,506,'PARIPIRANGA'),(1,8,507,'PAU BRASIL'),(1,8,508,'PAULO AFONSO'),(1,8,509,'PE DE SERRA'),(1,8,510,'PEDRAO'),(1,8,511,'PEDRO ALEXANDRE'),(1,8,512,'PIATA'),(1,8,513,'PILAO ARCADO'),(1,8,514,'PINDAI'),(1,8,515,'PINDOBACU'),(1,8,516,'PINTADAS'),(1,8,517,'PIRAI DO NORTE'),(1,8,518,'PIRIPA'),(1,8,519,'PIRITIBA'),(1,8,520,'PLANALTINO'),(1,8,521,'PLANALTO'),(1,8,522,'POCOES'),(1,8,523,'POJUCA'),(1,8,524,'PONTO NOVO'),(1,8,525,'PORTO SEGURO'),(1,8,526,'POTIRAGUA'),(1,8,527,'PRADO'),(1,8,528,'PRESIDENTE DUTRA'),(1,8,529,'PRESIDENTE JANIO QUADROS'),(1,8,530,'PRESIDENTE TANCREDO NEVES'),(1,8,531,'QUEIMADAS'),(1,8,532,'QUIJINGUE'),(1,8,533,'QUIXABEIRA'),(1,8,534,'RAFAEL JAMBEIRO'),(1,8,535,'REMANSO'),(1,8,536,'RETIROLANDIA'),(1,8,537,'RIACHAO DAS NEVES'),(1,8,538,'RIACHAO DO JACUIPE'),(1,8,539,'RIACHO DE SANTANA'),(1,8,540,'RIBEIRA DO AMPARO'),(1,8,541,'RIBEIRA DO POMBAL'),(1,8,542,'RIBEIRAO DO LARGO'),(1,8,543,'RIO DE CONTAS'),(1,8,544,'RIO DO ANTONIO'),(1,8,545,'RIO DO PIRES'),(1,8,546,'RIO REAL'),(1,8,547,'RODELAS'),(1,8,548,'RUY BARBOSA'),(1,8,549,'SALINAS DA MARGARIDA'),(1,8,550,'SANTA BARBARA'),(1,8,551,'SANTA BRIGIDA'),(1,8,552,'SANTA CRUZ CABRALIA'),(1,8,553,'SANTA CRUZ DA VITORIA'),(1,8,554,'SANTA INES'),(1,8,555,'SANTA LUZIA'),(1,8,556,'SANTA MARIA DA VITORIA'),(1,8,557,'SANTA RITA DE CASSIA'),(1,8,558,'SANTA TERESINHA'),(1,8,559,'SANTALUZ'),(1,8,560,'SANTANA'),(1,8,561,'SANTANOPOLIS'),(1,8,562,'SANTO AMARO'),(1,8,563,'SANTO ANTONIO DE JESUS'),(1,8,564,'SANTO ESTEVAO'),(1,8,565,'SAO DESIDERIO'),(1,8,566,'SAO DOMINGOS'),(1,8,567,'SAO FELIPE'),(1,8,568,'SAO FELIX'),(1,8,569,'SAO FELIX DO CORIBE'),(1,8,570,'SAO FRANCISCO DO CONDE'),(1,8,571,'SAO GABRIEL'),(1,8,572,'SAO GONCALO DOS CAMPOS'),(1,8,573,'SAO JOSE DA VITORIA'),(1,8,574,'SAO JOSE DO JACUIPE'),(1,8,575,'SAO MIGUEL DAS MATAS'),(1,8,576,'SAO SEBASTIAO DO PASSE'),(1,8,577,'SAPEACU'),(1,8,578,'SATIRO DIAS'),(1,8,579,'SAUBARA'),(1,8,580,'SAUDE'),(1,8,581,'SEABRA'),(1,8,582,'SEBASTIAO LARANJEIRAS'),(1,8,583,'SENHOR DO BONFIM'),(1,8,584,'SENTO SE'),(1,8,585,'SERRA DO RAMALHO'),(1,8,586,'SERRA DOURADA'),(1,8,587,'SERRA PRETA'),(1,8,588,'SERRINHA'),(1,8,589,'SERROLANDIA'),(1,8,590,'SIMOES FILHO'),(1,8,591,'SITIO DO MATO'),(1,8,592,'SITIO DO QUINTO'),(1,8,593,'SOBRADINHO'),(1,8,594,'SOUTO SOARES'),(1,8,595,'TABOCAS DO BREJO VELHO'),(1,8,596,'TANHACU'),(1,8,597,'TANQUE NOVO'),(1,8,598,'TANQUINHO'),(1,8,599,'TAPEROA'),(1,8,600,'TAPIRAMUTA'),(1,8,601,'TEIXEIRA DE FREITAS'),(1,8,602,'TEODORO SAMPAIO'),(1,8,603,'TEOFILANDIA'),(1,8,604,'TEOLANDIA'),(1,8,605,'TERRA NOVA'),(1,8,606,'TREMEDAL'),(1,8,607,'TUCANO'),(1,8,608,'UAUA'),(1,8,609,'UBAIRA'),(1,8,610,'UBAITABA'),(1,8,611,'UBATA'),(1,8,612,'UIBAI'),(1,8,613,'UMBURANAS'),(1,8,614,'UNA'),(1,8,615,'URANDI'),(1,8,616,'URUCUCA'),(1,8,617,'UTINGA'),(1,8,618,'VALENCA'),(1,8,619,'VALENTE'),(1,8,620,'VARZEA DA ROCA'),(1,8,621,'VARZEA DO POCO'),(1,8,622,'VARZEA NOVA'),(1,8,623,'VARZEDO'),(1,8,624,'VERA CRUZ'),(1,8,625,'VEREDA'),(1,8,626,'VITORIA DA CONQUISTA'),(1,8,627,'WAGNER'),(1,8,628,'WANDERLEY'),(1,8,629,'WENCESLAU GUIMARAES'),(1,8,630,'XIQUE-XIQUE'),(1,9,631,'ABAIARA'),(1,9,632,'ACARAPE'),(1,9,633,'ACARAU'),(1,9,634,'ACOPIARA'),(1,9,635,'AIUABA'),(1,9,636,'ALCANTARAS'),(1,9,637,'ALTANEIRA'),(1,9,638,'ALTO SANTO'),(1,9,639,'AMONTADA'),(1,9,640,'ANTONINA DO NORTE'),(1,9,641,'APUIARES'),(1,9,642,'AQUIRAZ'),(1,9,643,'ARACATI'),(1,9,644,'ARACOIABA'),(1,9,645,'ARARENDA'),(1,9,646,'ARARIPE'),(1,9,647,'ARATUBA'),(1,9,648,'ARNEIROZ'),(1,9,649,'ASSARE'),(1,9,650,'AURORA'),(1,9,651,'BAIXIO'),(1,9,652,'BANABUIU'),(1,9,653,'BARBALHA'),(1,9,654,'BARREIRA'),(1,9,655,'BARRO'),(1,9,656,'BARROQUINHA'),(1,9,657,'BATURITE'),(1,9,658,'BEBERIBE'),(1,9,659,'BELA CRUZ'),(1,9,660,'BOA VIAGEM'),(1,9,661,'BREJO SANTO'),(1,9,662,'CAMOCIM'),(1,9,663,'CAMPOS SALES'),(1,9,664,'CANINDE'),(1,9,665,'CAPISTRANO'),(1,9,666,'CARIDADE'),(1,9,667,'CARIRE'),(1,9,668,'CARIRIACU'),(1,9,669,'CARIUS'),(1,9,670,'CARNAUBAL'),(1,9,671,'CASCAVEL'),(1,9,672,'CATARINA'),(1,9,673,'CATUNDA'),(1,9,674,'CAUCAIA'),(1,9,675,'CEDRO'),(1,9,676,'CHAVAL'),(1,9,677,'CHORO'),(1,9,678,'CHOROZINHO'),(1,9,679,'COREAU'),(1,9,680,'CRATEUS'),(1,9,681,'CRATO'),(1,9,682,'CROATA'),(1,9,683,'CRUZ'),(1,9,684,'DEPUTADO IRAPUAN PINHEIRO'),(1,9,685,'ERERE'),(1,9,686,'EUSEBIO'),(1,9,687,'FARIAS BRITO'),(1,9,688,'FORQUILHA'),(1,9,689,'FORTIM'),(1,9,690,'FRECHEIRINHA'),(1,9,691,'GENERAL SAMPAIO'),(1,9,692,'GRACA'),(1,9,693,'GRANJA'),(1,9,694,'GRANJEIRO'),(1,9,695,'GROAIRAS'),(1,9,696,'GUAIUBA'),(1,9,697,'GUARACIABA DO NORTE'),(1,9,698,'GUARAMIRANGA'),(1,9,699,'HIDROLANDIA'),(1,9,700,'HORIZONTE'),(1,9,701,'IBARETAMA'),(1,9,702,'IBIAPINA'),(1,9,703,'IBICUITINGA'),(1,9,704,'ICAPUI'),(1,9,705,'ICO'),(1,9,706,'IGUATU'),(1,9,707,'INDEPENDENCIA'),(1,9,708,'IPAPORANGA'),(1,9,709,'IPAUMIRIM'),(1,9,710,'IPU'),(1,9,711,'IPUEIRAS'),(1,9,712,'IRACEMA'),(1,9,713,'IRAUCUBA'),(1,9,714,'ITAICABA'),(1,9,715,'ITAITINGA'),(1,9,716,'ITAPAGE'),(1,9,717,'ITAPIPOCA'),(1,9,718,'ITAPIUNA'),(1,9,719,'ITAREMA'),(1,9,720,'ITATIRA'),(1,9,721,'JAGUARETAMA'),(1,9,722,'JAGUARIBARA'),(1,9,723,'JAGUARIBE'),(1,9,724,'JAGUARUANA'),(1,9,725,'JARDIM'),(1,9,726,'JATI'),(1,9,727,'JIJOCA DE JERICOACOARA'),(1,9,728,'JUAZEIRO DO NORTE'),(1,9,729,'JUCAS'),(1,9,730,'LAVRAS DA MANGABEIRA'),(1,9,731,'LIMOEIRO DO NORTE'),(1,9,732,'MADALENA'),(1,9,733,'MARACANAU'),(1,9,734,'MARANGUAPE'),(1,9,735,'MARCO'),(1,9,736,'MARTINOPOLE'),(1,9,737,'MASSAPE'),(1,9,738,'MAURITI'),(1,9,739,'MERUOCA'),(1,9,740,'MILAGRES'),(1,9,741,'MILHA'),(1,9,742,'MIRAIMA'),(1,9,743,'MISSAO VELHA'),(1,9,744,'MOMBACA'),(1,9,745,'MONSENHOR TABOSA'),(1,9,746,'MORADA NOVA'),(1,9,747,'MORAUJO'),(1,9,748,'MORRINHOS'),(1,9,749,'MUCAMBO'),(1,9,750,'MULUNGU'),(1,9,751,'NOVA OLINDA'),(1,9,752,'NOVA RUSSAS'),(1,9,753,'NOVO ORIENTE'),(1,9,754,'OCARA'),(1,9,755,'OROS'),(1,9,756,'PACAJUS'),(1,9,757,'PACATUBA'),(1,9,758,'PACOTI'),(1,9,759,'PACUJA'),(1,9,760,'PALHANO'),(1,9,761,'PALMACIA'),(1,9,762,'PARACURU'),(1,9,763,'PARAIPABA'),(1,9,764,'PARAMBU'),(1,9,765,'PARAMOTI'),(1,9,766,'PEDRA BRANCA'),(1,9,767,'PENAFORTE'),(1,9,768,'PENTECOSTE'),(1,9,769,'PEREIRO'),(1,9,770,'PINDORETAMA'),(1,9,771,'PIQUET CARNEIRO'),(1,9,772,'PIRES FERREIRA'),(1,9,773,'PORANGA'),(1,9,774,'PORTEIRAS'),(1,9,775,'POTENGI'),(1,9,776,'POTIRETAMA'),(1,9,777,'QUITERIANOPOLIS'),(1,9,778,'QUIXADA'),(1,9,779,'QUIXELO'),(1,9,780,'QUIXERAMOBIM'),(1,9,781,'QUIXERE'),(1,9,782,'REDENCAO'),(1,9,783,'RERIUTABA'),(1,9,784,'RUSSAS'),(1,9,785,'SABOEIRO'),(1,9,786,'SALITRE'),(1,9,787,'SANTA QUITERIA'),(1,9,788,'SANTANA DO ACARAU'),(1,9,789,'SANTANA DO CARIRI'),(1,9,790,'SAO BENEDITO'),(1,9,791,'SAO GONCALO DO AMARANTE'),(1,9,792,'SAO JOAO DO JAGUARIBE'),(1,9,793,'SAO LUIS DO CURU'),(1,9,794,'SENADOR POMPEU'),(1,9,795,'SENADOR SA'),(1,9,796,'SOBRAL'),(1,9,797,'SOLONOPOLE'),(1,9,798,'TABULEIRO DO NORTE'),(1,9,799,'TAMBORIL'),(1,9,800,'TARRAFAS'),(1,9,801,'TAUA'),(1,9,802,'TEJUCUOCA'),(1,9,803,'TIANGUA'),(1,9,804,'TRAIRI'),(1,9,805,'TURURU'),(1,9,806,'UBAJARA'),(1,9,807,'UMARI'),(1,9,808,'UMIRIM'),(1,9,809,'URUBURETAMA'),(1,9,810,'URUOCA'),(1,9,811,'VARJOTA'),(1,9,812,'VARZEA ALEGRE'),(1,9,813,'VICOSA DO CEARA'),(1,11,814,'AFONSO CLAUDIO'),(1,11,815,'AGUA DOCE DO NORTE'),(1,11,816,'AGUIA BRANCA'),(1,11,817,'ALEGRE'),(1,11,818,'ALFREDO CHAVES'),(1,11,819,'ALTO RIO NOVO'),(1,11,820,'ANCHIETA'),(1,11,821,'APIACA'),(1,11,822,'ARACRUZ'),(1,11,823,'ATILIO VIVACQUA'),(1,11,824,'BAIXO GUANDU'),(1,11,825,'BARRA DE SAO FRANCISCO'),(1,11,826,'BOA ESPERANCA'),(1,11,827,'BOM JESUS DO NORTE'),(1,11,828,'BREJETUBA'),(1,11,829,'CACHOEIRO DE ITAPEMIRIM'),(1,11,830,'CARIACICA'),(1,11,831,'CASTELO'),(1,11,832,'COLATINA'),(1,11,833,'CONCEICAO DA BARRA'),(1,11,834,'CONCEICAO DO CASTELO'),(1,11,835,'DIVINO DE SAO LOURENCO'),(1,11,836,'DOMINGOS MARTINS'),(1,11,837,'DORES DO RIO PRETO'),(1,11,838,'ECOPORANGA'),(1,11,839,'FUNDAO'),(1,11,840,'GOVERNADOR LINDENBERG'),(1,11,841,'GUACUI'),(1,11,842,'GUARAPARI'),(1,11,843,'IBATIBA'),(1,11,844,'IBIRACU'),(1,11,845,'IBITIRAMA'),(1,11,846,'ICONHA'),(1,11,847,'IRUPI'),(1,11,848,'ITAGUACU'),(1,11,849,'ITAPEMIRIM'),(1,11,850,'ITARANA'),(1,11,851,'IUNA'),(1,11,852,'JAGUARE'),(1,11,853,'JERONIMO MONTEIRO'),(1,11,854,'JOAO NEIVA'),(1,11,855,'LARANJA DA TERRA'),(1,11,856,'LINHARES'),(1,11,857,'MANTENOPOLIS'),(1,11,858,'MARATAIZES'),(1,11,859,'MARECHAL FLORIANO'),(1,11,860,'MARILANDIA'),(1,11,861,'MIMOSO DO SUL'),(1,11,862,'MONTANHA'),(1,11,863,'MUCURICI'),(1,11,864,'MUNIZ FREIRE'),(1,11,865,'MUQUI'),(1,11,866,'NOVA VENECIA'),(1,11,867,'PANCAS'),(1,11,868,'PEDRO CANARIO'),(1,11,869,'PINHEIROS'),(1,11,870,'PIUMA'),(1,11,871,'PONTO BELO'),(1,11,872,'PRESIDENTE KENNEDY'),(1,11,873,'RIO BANANAL'),(1,11,874,'RIO NOVO DO SUL'),(1,11,875,'SANTA LEOPOLDINA'),(1,11,876,'SANTA MARIA DE JETIBA'),(1,11,877,'SANTA TERESA'),(1,11,878,'SAO DOMINGOS DO NORTE'),(1,11,879,'SAO GABRIEL DA PALHA'),(1,11,880,'SAO JOSE DO CALCADO'),(1,11,881,'SAO MATEUS'),(1,11,882,'SAO ROQUE DO CANAA'),(1,11,883,'SERRA'),(1,11,884,'SOORETAMA'),(1,11,885,'VARGEM ALTA'),(1,11,886,'VENDA NOVA DO IMIGRANTE'),(1,11,887,'VIANA'),(1,11,888,'VILA PAVAO'),(1,11,889,'VILA VALERIO'),(1,11,890,'VILA VELHA'),(1,11,891,'VITORIA'),(1,12,892,'ABADIA DE GOIAS'),(1,12,893,'ABADIANIA'),(1,12,894,'ACREUNA'),(1,12,895,'ADELANDIA'),(1,12,896,'AGUA FRIA DE GOIAS'),(1,12,897,'AGUA LIMPA'),(1,12,898,'AGUAS LINDAS DE GOIAS'),(1,12,899,'ALEXANIA'),(1,12,900,'ALOANDIA'),(1,12,901,'ALTO HORIZONTE'),(1,12,902,'ALTO PARAISO DE GOIAS'),(1,12,903,'ALVORADA DO NORTE'),(1,12,904,'AMARALINA'),(1,12,905,'AMERICANO DO BRASIL'),(1,12,906,'AMORINOPOLIS'),(1,12,907,'ANAPOLIS'),(1,12,908,'ANHANGUERA'),(1,12,909,'ANICUNS'),(1,12,910,'APARECIDA DE GOIANIA'),(1,12,911,'APARECIDA DO RIO DOCE'),(1,12,912,'APORE'),(1,12,913,'ARACU'),(1,12,914,'ARAGARCAS'),(1,12,915,'ARAGOIANIA'),(1,12,916,'ARAGUAPAZ'),(1,12,917,'ARENOPOLIS'),(1,12,918,'ARUANA'),(1,12,919,'AURILANDIA'),(1,12,920,'AVELINOPOLIS'),(1,12,921,'BALIZA'),(1,12,922,'BARRO ALTO'),(1,12,923,'BELA VISTA DE GOIAS'),(1,12,924,'BOM JARDIM DE GOIAS'),(1,12,925,'BOM JESUS DE GOIAS'),(1,12,926,'BONFINOPOLIS'),(1,12,927,'BONOPOLIS'),(1,12,928,'BRAZABRANTES'),(1,12,929,'BRITANIA'),(1,12,930,'BURITI ALEGRE'),(1,12,931,'BURITI DE GOIAS'),(1,12,932,'BURITINOPOLIS'),(1,12,933,'CABECEIRAS'),(1,12,934,'CACHOEIRA ALTA'),(1,12,935,'CACHOEIRA DE GOIAS'),(1,12,936,'CACHOEIRA DOURADA'),(1,12,937,'CACU'),(1,12,938,'CAIAPONIA'),(1,12,939,'CALDAS NOVAS'),(1,12,940,'CALDAZINHA'),(1,12,941,'CAMPESTRE DE GOIAS'),(1,12,942,'CAMPINACU'),(1,12,943,'CAMPINORTE'),(1,12,944,'CAMPO ALEGRE DE GOIAS'),(1,12,945,'CAMPO LIMPO DE GOIAS'),(1,12,946,'CAMPOS BELOS'),(1,12,947,'CAMPOS VERDES'),(1,12,948,'CARMO DO RIO VERDE'),(1,12,949,'CASTELANDIA'),(1,12,950,'CATALAO'),(1,12,951,'CATURAI'),(1,12,952,'CAVALCANTE'),(1,12,953,'CERES'),(1,12,954,'CEZARINA'),(1,12,955,'CHAPADAO DO CEU'),(1,12,956,'CIDADE OCIDENTAL'),(1,12,957,'COCALZINHO DE GOIAS'),(1,12,958,'COLINAS DO SUL'),(1,12,959,'CORREGO DO OURO'),(1,12,960,'CORUMBA DE GOIAS'),(1,12,961,'CORUMBAIBA'),(1,12,962,'CRISTALINA'),(1,12,963,'CRISTIANOPOLIS'),(1,12,964,'CRIXAS'),(1,12,965,'CROMINIA'),(1,12,966,'CUMARI'),(1,12,967,'DAMIANOPOLIS'),(1,12,968,'DAMOLANDIA'),(1,12,969,'DAVINOPOLIS'),(1,12,970,'DIORAMA'),(1,12,971,'DIVINOPOLIS DE GOIAS'),(1,12,972,'DOVERLANDIA'),(1,12,973,'EDEALINA'),(1,12,974,'EDEIA'),(1,12,975,'ESTRELA DO NORTE'),(1,12,976,'FAINA'),(1,12,977,'FAZENDA NOVA'),(1,12,978,'FIRMINOPOLIS'),(1,12,979,'FLORES DE GOIAS'),(1,12,980,'FORMOSA'),(1,12,981,'FORMOSO'),(1,12,982,'GAMELEIRA DE GOIAS'),(1,12,983,'GOIANAPOLIS'),(1,12,984,'GOIANDIRA'),(1,12,985,'GOIANESIA'),(1,12,986,'GOIANIA'),(1,12,987,'GOIANIRA'),(1,12,988,'GOIAS'),(1,12,989,'GOIATUBA'),(1,12,990,'GOUVELANDIA'),(1,12,991,'GUAPO'),(1,12,992,'GUARAITA'),(1,12,993,'GUARANI DE GOIAS'),(1,12,994,'GUARINOS'),(1,12,995,'HEITORAI'),(1,12,996,'HIDROLANDIA'),(1,12,997,'HIDROLINA'),(1,12,998,'IACIARA'),(1,12,999,'INACIOLANDIA'),(1,12,1000,'INDIARA'),(1,12,1001,'INHUMAS'),(1,12,1002,'IPAMERI'),(1,12,1003,'IPIRANGA DE GOIAS'),(1,12,1004,'IPORA'),(1,12,1005,'ISRAELANDIA'),(1,12,1006,'ITABERAI'),(1,12,1007,'ITAGUARI'),(1,12,1008,'ITAGUARU'),(1,12,1009,'ITAJA'),(1,12,1010,'ITAPACI'),(1,12,1011,'ITAPIRAPUA'),(1,12,1012,'ITAPURANGA'),(1,12,1013,'ITARUMA'),(1,12,1014,'ITAUCU'),(1,12,1015,'ITUMBIARA'),(1,12,1016,'IVOLANDIA'),(1,12,1017,'JANDAIA'),(1,12,1018,'JARAGUA'),(1,12,1019,'JATAI'),(1,12,1020,'JAUPACI'),(1,12,1021,'JESUPOLIS'),(1,12,1022,'JOVIANIA'),(1,12,1023,'JUSSARA'),(1,12,1024,'LAGOA SANTA'),(1,12,1025,'LEOPOLDO DE BULHOES'),(1,12,1026,'LUZIANIA'),(1,12,1027,'MAIRIPOTABA'),(1,12,1028,'MAMBAI'),(1,12,1029,'MARA ROSA'),(1,12,1030,'MARZAGAO'),(1,12,1031,'MATRINCHA'),(1,12,1032,'MAURILANDIA'),(1,12,1033,'MIMOSO DE GOIAS'),(1,12,1034,'MINACU'),(1,12,1035,'MINEIROS'),(1,12,1036,'MOIPORA'),(1,12,1037,'MONTE ALEGRE DE GOIAS'),(1,12,1038,'MONTES CLAROS DE GOIAS'),(1,12,1039,'MONTIVIDIU'),(1,12,1040,'MONTIVIDIU DO NORTE'),(1,12,1041,'MORRINHOS'),(1,12,1042,'MORRO AGUDO DE GOIAS'),(1,12,1043,'MOSSAMEDES'),(1,12,1044,'MOZARLANDIA'),(1,12,1045,'MUNDO NOVO'),(1,12,1046,'MUTUNOPOLIS'),(1,12,1047,'NAZARIO'),(1,12,1048,'NEROPOLIS'),(1,12,1049,'NIQUELANDIA'),(1,12,1050,'NOVA AMERICA'),(1,12,1051,'NOVA AURORA'),(1,12,1052,'NOVA CRIXAS'),(1,12,1053,'NOVA GLORIA'),(1,12,1054,'NOVA IGUACU DE GOIAS'),(1,12,1055,'NOVA ROMA'),(1,12,1056,'NOVA VENEZA'),(1,12,1057,'NOVO BRASIL'),(1,12,1058,'NOVO GAMA'),(1,12,1059,'NOVO PLANALTO'),(1,12,1060,'ORIZONA'),(1,12,1061,'OURO VERDE DE GOIAS'),(1,12,1062,'OUVIDOR'),(1,12,1063,'PADRE BERNARDO'),(1,12,1064,'PALESTINA DE GOIAS'),(1,12,1065,'PALMEIRAS DE GOIAS'),(1,12,1066,'PALMELO'),(1,12,1067,'PALMINOPOLIS'),(1,12,1068,'PANAMA'),(1,12,1069,'PARANAIGUARA'),(1,12,1070,'PARAUNA'),(1,12,1071,'PEROLANDIA'),(1,12,1072,'PETROLINA DE GOIAS'),(1,12,1073,'PILAR DE GOIAS'),(1,12,1074,'PIRACANJUBA'),(1,12,1075,'PIRANHAS'),(1,12,1076,'PIRENOPOLIS'),(1,12,1077,'PIRES DO RIO'),(1,12,1078,'PLANALTINA'),(1,12,1079,'PONTALINA'),(1,12,1080,'PORANGATU'),(1,12,1081,'PORTEIRAO'),(1,12,1082,'PORTELANDIA'),(1,12,1083,'POSSE'),(1,12,1084,'PROFESSOR JAMIL'),(1,12,1085,'QUIRINOPOLIS'),(1,12,1086,'RIALMA'),(1,12,1087,'RIANAPOLIS'),(1,12,1088,'RIO QUENTE'),(1,12,1089,'RIO VERDE'),(1,12,1090,'RUBIATABA'),(1,12,1091,'SANCLERLANDIA'),(1,12,1092,'SANTA BARBARA DE GOIAS'),(1,12,1093,'SANTA CRUZ DE GOIAS'),(1,12,1094,'SANTA FE DE GOIAS'),(1,12,1095,'SANTA HELENA DE GOIAS'),(1,12,1096,'SANTA ISABEL'),(1,12,1097,'SANTA RITA DO ARAGUAIA'),(1,12,1098,'SANTA RITA DO NOVO DESTINO'),(1,12,1099,'SANTA ROSA DE GOIAS'),(1,12,1100,'SANTA TEREZA DE GOIAS'),(1,12,1101,'SANTA TEREZINHA DE GOIAS'),(1,12,1102,'SANTO ANTONIO DA BARRA'),(1,12,1103,'SANTO ANTONIO DE GOIAS'),(1,12,1104,'SANTO ANTONIO DO DESCOBERTO'),(1,12,1105,'SAO DOMINGOS'),(1,12,1106,'SAO FRANCISCO DE GOIAS'),(1,12,1107,'SAO JOAO DA PARAUNA'),(1,12,1108,'SAO JOAO DALIANCA'),(1,12,1109,'SAO LUIS DE MONTES BELOS'),(1,12,1110,'SAO LUIZ DO NORTE'),(1,12,1111,'SAO MIGUEL DO ARAGUAIA'),(1,12,1112,'SAO MIGUEL DO PASSA QUATRO'),(1,12,1113,'SAO PATRICIO'),(1,12,1114,'SAO SIMAO'),(1,12,1115,'SENADOR CANEDO'),(1,12,1116,'SERRANOPOLIS'),(1,12,1117,'SILVANIA'),(1,12,1118,'SIMOLANDIA'),(1,12,1119,'SITIO DABADIA'),(1,12,1120,'TAQUARAL DE GOIAS'),(1,12,1121,'TERESINA DE GOIAS'),(1,12,1122,'TEREZOPOLIS DE GOIAS'),(1,12,1123,'TRES RANCHOS'),(1,12,1124,'TRINDADE'),(1,12,1125,'TROMBAS'),(1,12,1126,'TURVANIA'),(1,12,1127,'TURVELANDIA'),(1,12,1128,'UIRAPURU'),(1,12,1129,'URUACU'),(1,12,1130,'URUANA'),(1,12,1131,'URUTAI'),(1,12,1132,'VALPARAISO DE GOIAS'),(1,12,1133,'VARJAO'),(1,12,1134,'VIANOPOLIS'),(1,12,1135,'VICENTINOPOLIS'),(1,12,1136,'VILA BOA'),(1,12,1137,'VILA PROPICIO'),(1,14,1138,'ACAILANDIA'),(1,14,1139,'AFONSO CUNHA'),(1,14,1140,'AGUA DOCE DO MARANHAO'),(1,14,1141,'ALCANTARA'),(1,14,1142,'ALDEIAS ALTAS'),(1,14,1143,'ALTAMIRA DO MARANHAO'),(1,14,1144,'ALTO ALEGRE DO MARANHAO'),(1,14,1145,'ALTO ALEGRE DO PINDARE'),(1,14,1146,'ALTO PARNAIBA'),(1,14,1147,'AMAPA DO MARANHAO'),(1,14,1148,'AMARANTE DO MARANHAO'),(1,14,1149,'ANAJATUBA'),(1,14,1150,'ANAPURUS'),(1,14,1151,'APICUM-ACU'),(1,14,1152,'ARAGUANA'),(1,14,1153,'ARAIOSES'),(1,14,1154,'ARAME'),(1,14,1155,'ARARI'),(1,14,1156,'AXIXA'),(1,14,1157,'BACABAL'),(1,14,1158,'BACABEIRA'),(1,14,1159,'BACURI'),(1,14,1160,'BACURITUBA'),(1,14,1161,'BALSAS'),(1,14,1162,'BARAO DE GRAJAU'),(1,14,1163,'BARRA DO CORDA'),(1,14,1164,'BARREIRINHAS'),(1,14,1165,'BELA VISTA DO MARANHAO'),(1,14,1166,'BELAGUA'),(1,14,1167,'BENEDITO LEITE'),(1,14,1168,'BEQUIMAO'),(1,14,1169,'BERNARDO DO MEARIM'),(1,14,1170,'BOA VISTA DO GURUPI'),(1,14,1171,'BOM JARDIM'),(1,14,1172,'BOM JESUS DAS SELVAS'),(1,14,1173,'BOM LUGAR'),(1,14,1174,'BREJO'),(1,14,1175,'BREJO DE AREIA'),(1,14,1176,'BURITI'),(1,14,1177,'BURITI BRAVO'),(1,14,1178,'BURITICUPU'),(1,14,1179,'BURITIRANA'),(1,14,1180,'CACHOEIRA GRANDE'),(1,14,1181,'CAJAPIO'),(1,14,1182,'CAJARI'),(1,14,1183,'CAMPESTRE DO MARANHAO'),(1,14,1184,'CANDIDO MENDES'),(1,14,1185,'CANTANHEDE'),(1,14,1186,'CAPINZAL DO NORTE'),(1,14,1187,'CAROLINA'),(1,14,1188,'CARUTAPERA'),(1,14,1189,'CAXIAS'),(1,14,1190,'CEDRAL'),(1,14,1191,'CENTRAL DO MARANHAO'),(1,14,1192,'CENTRO DO GUILHERME'),(1,14,1193,'CENTRO NOVO DO MARANHAO'),(1,14,1194,'CHAPADINHA'),(1,14,1195,'CIDELANDIA'),(1,14,1196,'CODO'),(1,14,1197,'COELHO NETO'),(1,14,1198,'COLINAS'),(1,14,1199,'CONCEICAO DO LAGO-ACU'),(1,14,1200,'COROATA'),(1,14,1201,'CURURUPU'),(1,14,1202,'DAVINOPOLIS'),(1,14,1203,'DOM PEDRO'),(1,14,1204,'DUQUE BACELAR'),(1,14,1205,'ESPERANTINOPOLIS'),(1,14,1206,'ESTREITO'),(1,14,1207,'FEIRA NOVA DO MARANHAO'),(1,14,1208,'FERNANDO FALCAO'),(1,14,1209,'FORMOSA DA SERRA NEGRA'),(1,14,1210,'FORTALEZA DOS NOGUEIRAS'),(1,14,1211,'FORTUNA'),(1,14,1212,'GODOFREDO VIANA'),(1,14,1213,'GONCALVES DIAS'),(1,14,1214,'GOVERNADOR ARCHER'),(1,14,1215,'GOVERNADOR EDISON LOBAO'),(1,14,1216,'GOVERNADOR EUGENIO BARROS'),(1,14,1217,'GOVERNADOR LUIZ ROCHA'),(1,14,1218,'GOVERNADOR NEWTON BELLO'),(1,14,1219,'GOVERNADOR NUNES FREIRE'),(1,14,1220,'GRACA ARANHA'),(1,14,1221,'GRAJAU'),(1,14,1222,'GUIMARAES'),(1,14,1223,'HUMBERTO DE CAMPOS'),(1,14,1224,'ICATU'),(1,14,1225,'IGARAPE DO MEIO'),(1,14,1226,'IGARAPE GRANDE'),(1,14,1227,'IMPERATRIZ'),(1,14,1228,'ITAIPAVA DO GRAJAU'),(1,14,1229,'ITAPECURU MIRIM'),(1,14,1230,'ITINGA DO MARANHAO'),(1,14,1231,'JATOBA'),(1,14,1232,'JENIPAPO DOS VIEIRAS'),(1,14,1233,'JOAO LISBOA'),(1,14,1234,'JOSELANDIA'),(1,14,1235,'JUNCO DO MARANHAO'),(1,14,1236,'LAGO DA PEDRA'),(1,14,1237,'LAGO DO JUNCO'),(1,14,1238,'LAGO DOS RODRIGUES'),(1,14,1239,'LAGO VERDE'),(1,14,1240,'LAGOA DO MATO'),(1,14,1241,'LAGOA GRANDE DO MARANHAO'),(1,14,1242,'LAJEADO NOVO'),(1,14,1243,'LIMA CAMPOS'),(1,14,1244,'LORETO'),(1,14,1245,'LUIS DOMINGUES'),(1,14,1246,'MAGALHAES DE ALMEIDA'),(1,14,1247,'MARACACUME'),(1,14,1248,'MARAJA DO SENA'),(1,14,1249,'MARANHAOZINHO'),(1,14,1250,'MATA ROMA'),(1,14,1251,'MATINHA'),(1,14,1252,'MATOES'),(1,14,1253,'MATOES DO NORTE'),(1,14,1254,'MILAGRES DO MARANHAO'),(1,14,1255,'MIRADOR'),(1,14,1256,'MIRANDA DO NORTE'),(1,14,1257,'MIRINZAL'),(1,14,1258,'MONCAO'),(1,14,1259,'MONTES ALTOS'),(1,14,1260,'MORROS'),(1,14,1261,'NINA RODRIGUES'),(1,14,1262,'NOVA COLINAS'),(1,14,1263,'NOVA IORQUE'),(1,14,1264,'NOVA OLINDA DO MARANHAO'),(1,14,1265,'OLHO DAGUA DAS CUNHAS'),(1,14,1266,'OLINDA NOVA DO MARANHAO'),(1,14,1267,'PACO DO LUMIAR'),(1,14,1268,'PALMEIRANDIA'),(1,14,1269,'PARAIBANO'),(1,14,1270,'PARNARAMA'),(1,14,1271,'PASSAGEM FRANCA'),(1,14,1272,'PASTOS BONS'),(1,14,1273,'PAULINO NEVES'),(1,14,1274,'PAULO RAMOS'),(1,14,1275,'PEDREIRAS'),(1,14,1276,'PEDRO DO ROSARIO'),(1,14,1277,'PENALVA'),(1,14,1278,'PERI MIRIM'),(1,14,1279,'PERITORO'),(1,14,1280,'PINDARE MIRIM'),(1,14,1281,'PINHEIRO'),(1,14,1282,'PIO XII'),(1,14,1283,'PIRAPEMAS'),(1,14,1284,'POCAO DE PEDRAS'),(1,14,1285,'PORTO FRANCO'),(1,14,1286,'PORTO RICO DO MARANHAO'),(1,14,1287,'PRESIDENTE DUTRA'),(1,14,1288,'PRESIDENTE JUSCELINO'),(1,14,1289,'PRESIDENTE MEDICI'),(1,14,1290,'PRESIDENTE SARNEY'),(1,14,1291,'PRESIDENTE VARGAS'),(1,14,1292,'PRIMEIRA CRUZ'),(1,14,1293,'RAPOSA'),(1,14,1294,'RIACHAO'),(1,14,1295,'RIBAMAR FIQUENE'),(1,14,1296,'ROSARIO'),(1,14,1297,'SAMBAIBA'),(1,14,1298,'SANTA FILOMENA DO MARANHAO'),(1,14,1299,'SANTA HELENA'),(1,14,1300,'SANTA INES'),(1,14,1301,'SANTA LUZIA'),(1,14,1302,'SANTA LUZIA DO PARUA'),(1,14,1303,'SANTA QUITERIA DO MARANHAO'),(1,14,1304,'SANTA RITA'),(1,14,1305,'SANTANA DO MARANHAO'),(1,14,1306,'SANTO AMARO DO MARANHAO'),(1,14,1307,'SANTO ANTONIO DOS LOPES'),(1,14,1308,'SAO BENEDITO DO RIO PRETO'),(1,14,1309,'SAO BENTO'),(1,14,1310,'SAO BERNARDO'),(1,14,1311,'SAO DOMINGOS DO AZEITAO'),(1,14,1312,'SAO DOMINGOS DO MARANHAO'),(1,14,1313,'SAO FELIX DE BALSAS'),(1,14,1314,'SAO FRANCISCO DO BREJAO'),(1,14,1315,'SAO FRANCISCO DO MARANHAO'),(1,14,1316,'SAO JOAO BATISTA'),(1,14,1317,'SAO JOAO DO CARU'),(1,14,1318,'SAO JOAO DO PARAISO'),(1,14,1319,'SAO JOAO DO SOTER'),(1,14,1320,'SAO JOAO DOS PATOS'),(1,14,1321,'SAO JOSE DE RIBAMAR'),(1,14,1322,'SAO JOSE DOS BASILIOS'),(1,14,1323,'SAO LUIS'),(1,14,1324,'SAO LUIS GONZAGA DO MARANHAO'),(1,14,1325,'SAO MATEUS DO MARANHAO'),(1,14,1326,'SAO PEDRO DA AGUA BRANCA'),(1,14,1327,'SAO PEDRO DOS CRENTES'),(1,14,1328,'SAO RAIMUNDO DAS MANGABEIRAS'),(1,14,1329,'SAO RAIMUNDO DO DOCA BEZERRA'),(1,14,1330,'SAO ROBERTO'),(1,14,1331,'SAO VICENTE FERRER'),(1,14,1332,'SATUBINHA'),(1,14,1333,'SENADOR ALEXANDRE COSTA'),(1,14,1334,'SENADOR LA ROCQUE'),(1,14,1335,'SERRANO DO MARANHAO'),(1,14,1336,'SITIO NOVO'),(1,14,1337,'SUCUPIRA DO NORTE'),(1,14,1338,'SUCUPIRA DO RIACHAO'),(1,14,1339,'TASSO FRAGOSO'),(1,14,1340,'TIMBIRAS'),(1,14,1341,'TIMON'),(1,14,1342,'TRIZIDELA DO VALE'),(1,14,1343,'TUFILANDIA'),(1,14,1344,'TUNTUM'),(1,14,1345,'TURIACU'),(1,14,1346,'TURILANDIA'),(1,14,1347,'TUTOIA'),(1,14,1348,'URBANO SANTOS'),(1,14,1349,'VARGEM GRANDE'),(1,14,1350,'VIANA'),(1,14,1351,'VILA NOVA DOS MARTIRIOS'),(1,14,1352,'VITORIA DO MEARIM'),(1,14,1353,'VITORINO FREIRE'),(1,14,1354,'ZE DOCA'),(1,3,1355,'ABADIA DOS DOURADOS'),(1,3,1356,'ABAETE'),(1,3,1357,'ABRE CAMPO'),(1,3,1358,'ACAIACA'),(1,3,1359,'ACUCENA'),(1,3,1360,'AGUA BOA'),(1,3,1361,'AGUA COMPRIDA'),(1,3,1362,'AGUANIL'),(1,3,1363,'AGUAS FORMOSAS'),(1,3,1364,'AGUAS VERMELHAS'),(1,3,1365,'AIMORES'),(1,3,1366,'AIURUOCA'),(1,3,1367,'ALAGOA'),(1,3,1368,'ALBERTINA'),(1,3,1369,'ALEM PARAIBA'),(1,3,1370,'ALFENAS'),(1,3,1371,'ALFREDO VASCONCELOS'),(1,3,1372,'ALMENARA'),(1,3,1373,'ALPERCATA'),(1,3,1374,'ALPINOPOLIS'),(1,3,1375,'ALTEROSA'),(1,3,1376,'ALTO CAPARAO'),(1,3,1377,'ALTO JEQUITIBA'),(1,3,1378,'ALTO RIO DOCE'),(1,3,1379,'ALVARENGA'),(1,3,1380,'ALVINOPOLIS'),(1,3,1381,'ALVORADA DE MINAS'),(1,3,1382,'AMPARO DO SERRA'),(1,3,1383,'ANDRADAS'),(1,3,1384,'ANDRELANDIA'),(1,3,1385,'ANGELANDIA'),(1,3,1386,'ANTONIO CARLOS'),(1,3,1387,'ANTONIO DIAS'),(1,3,1388,'ANTONIO PRADO DE MINAS'),(1,3,1389,'ARACAI'),(1,3,1390,'ARACITABA'),(1,3,1391,'ARACUAI'),(1,3,1392,'ARAGUARI'),(1,3,1393,'ARANTINA'),(1,3,1394,'ARAPONGA'),(1,3,1395,'ARAPORA'),(1,3,1396,'ARAPUA'),(1,3,1397,'ARAUJOS'),(1,3,1398,'ARAXA'),(1,3,1399,'ARCEBURGO'),(1,3,1400,'ARCOS'),(1,3,1401,'AREADO'),(1,3,1402,'ARGIRITA'),(1,3,1403,'ARICANDUVA'),(1,3,1404,'ARINOS'),(1,3,1405,'ASTOLFO DUTRA'),(1,3,1406,'ATALEIA'),(1,3,1407,'AUGUSTO DE LIMA'),(1,3,1408,'BAEPENDI'),(1,3,1409,'BALDIM'),(1,3,1410,'BAMBUI'),(1,3,1411,'BANDEIRA'),(1,3,1412,'BANDEIRA DO SUL'),(1,3,1413,'BARAO DE COCAIS'),(1,3,1414,'BARAO DE MONTE ALTO'),(1,3,1415,'BARBACENA'),(1,3,1416,'BARRA LONGA'),(1,3,1417,'BARROSO'),(1,3,1418,'BELA VISTA DE MINAS'),(1,3,1419,'BELMIRO BRAGA'),(1,3,1420,'BELO ORIENTE'),(1,3,1421,'BELO VALE'),(1,3,1422,'BERILO'),(1,3,1423,'BERIZAL'),(1,3,1424,'BERTOPOLIS'),(1,3,1425,'BETIM'),(1,3,1426,'BIAS FORTES'),(1,3,1427,'BICAS'),(1,3,1428,'BIQUINHAS'),(1,3,1429,'BOA ESPERANCA'),(1,3,1430,'BOCAINA DE MINAS'),(1,3,1431,'BOCAIUVA'),(1,3,1432,'BOM DESPACHO'),(1,3,1433,'BOM JARDIM DE MINAS'),(1,3,1434,'BOM JESUS DA PENHA'),(1,3,1435,'BOM JESUS DO AMPARO'),(1,3,1436,'BOM JESUS DO GALHO'),(1,3,1437,'BOM REPOUSO'),(1,3,1438,'BOM SUCESSO'),(1,3,1439,'BONFIM'),(1,3,1440,'BONFINOPOLIS DE MINAS'),(1,3,1441,'BONITO DE MINAS'),(1,3,1442,'BORDA DA MATA'),(1,3,1443,'BOTELHOS'),(1,3,1444,'BOTUMIRIM'),(1,3,1445,'BRAS PIRES'),(1,3,1446,'BRASILANDIA DE MINAS'),(1,3,1447,'BRASILIA DE MINAS'),(1,3,1448,'BRASOPOLIS'),(1,3,1449,'BRAUNAS'),(1,3,1450,'BRUMADINHO'),(1,3,1451,'BUENO BRANDAO'),(1,3,1452,'BUENOPOLIS'),(1,3,1453,'BUGRE'),(1,3,1454,'BURITIS'),(1,3,1455,'BURITIZEIRO'),(1,3,1456,'CABECEIRA GRANDE'),(1,3,1457,'CABO VERDE'),(1,3,1458,'CACHOEIRA DA PRATA'),(1,3,1459,'CACHOEIRA DE MINAS'),(1,3,1460,'CACHOEIRA DE PAJEU'),(1,3,1461,'CACHOEIRA DOURADA'),(1,3,1462,'CAETANOPOLIS'),(1,3,1463,'CAETE'),(1,3,1464,'CAIANA'),(1,3,1465,'CAJURI'),(1,3,1466,'CALDAS'),(1,3,1467,'CAMACHO'),(1,3,1468,'CAMANDUCAIA'),(1,3,1469,'CAMBUI'),(1,3,1470,'CAMBUQUIRA'),(1,3,1471,'CAMPANARIO'),(1,3,1472,'CAMPANHA'),(1,3,1473,'CAMPESTRE'),(1,3,1474,'CAMPINA VERDE'),(1,3,1475,'CAMPO AZUL'),(1,3,1476,'CAMPO BELO'),(1,3,1477,'CAMPO DO MEIO'),(1,3,1478,'CAMPO FLORIDO'),(1,3,1479,'CAMPOS ALTOS'),(1,3,1480,'CAMPOS GERAIS'),(1,3,1481,'CANA VERDE'),(1,3,1482,'CANAA'),(1,3,1483,'CANAPOLIS'),(1,3,1484,'CANDEIAS'),(1,3,1485,'CANTAGALO'),(1,3,1486,'CAPARAO'),(1,3,1487,'CAPELA NOVA'),(1,3,1488,'CAPELINHA'),(1,3,1489,'CAPETINGA'),(1,3,1490,'CAPIM BRANCO'),(1,3,1491,'CAPINOPOLIS'),(1,3,1492,'CAPITAO ANDRADE'),(1,3,1493,'CAPITAO ENEAS'),(1,3,1494,'CAPITOLIO'),(1,3,1495,'CAPUTIRA'),(1,3,1496,'CARAI'),(1,3,1497,'CARANAIBA'),(1,3,1498,'CARANDAI'),(1,3,1499,'CARANGOLA'),(1,3,1500,'CARATINGA'),(1,3,1501,'CARBONITA'),(1,3,1502,'CAREACU'),(1,3,1503,'CARLOS CHAGAS'),(1,3,1504,'CARMESIA'),(1,3,1505,'CARMO DA CACHOEIRA'),(1,3,1506,'CARMO DA MATA'),(1,3,1507,'CARMO DE MINAS'),(1,3,1508,'CARMO DO CAJURU'),(1,3,1509,'CARMO DO PARANAIBA'),(1,3,1510,'CARMO DO RIO CLARO'),(1,3,1511,'CARMOPOLIS DE MINAS'),(1,3,1512,'CARNEIRINHO'),(1,3,1513,'CARRANCAS'),(1,3,1514,'CARVALHOPOLIS'),(1,3,1515,'CARVALHOS'),(1,3,1516,'CASA GRANDE'),(1,3,1517,'CASCALHO RICO'),(1,3,1518,'CASSIA'),(1,3,1519,'CATAGUASES'),(1,3,1520,'CATAS ALTAS'),(1,3,1521,'CATAS ALTAS DA NORUEGA'),(1,3,1522,'CATUJI'),(1,3,1523,'CATUTI'),(1,3,1524,'CAXAMBU'),(1,3,1525,'CEDRO DO ABAETE'),(1,3,1526,'CENTRAL DE MINAS'),(1,3,1527,'CENTRALINA'),(1,3,1528,'CHACARA'),(1,3,1529,'CHALE'),(1,3,1530,'CHAPADA DO NORTE'),(1,3,1531,'CHAPADA GAUCHA'),(1,3,1532,'CHIADOR'),(1,3,1533,'CIPOTANEA'),(1,3,1534,'CLARAVAL'),(1,3,1535,'CLARO DOS POCOES'),(1,3,1536,'CLAUDIO'),(1,3,1537,'COIMBRA'),(1,3,1538,'COLUNA'),(1,3,1539,'COMENDADOR GOMES'),(1,3,1540,'COMERCINHO'),(1,3,1541,'CONCEICAO DA APARECIDA'),(1,3,1542,'CONCEICAO DA BARRA DE MINAS'),(1,3,1543,'CONCEICAO DAS ALAGOAS'),(1,3,1544,'CONCEICAO DAS PEDRAS'),(1,3,1545,'CONCEICAO DE IPANEMA'),(1,3,1546,'CONCEICAO DO MATO DENTRO'),(1,3,1547,'CONCEICAO DO PARA'),(1,3,1548,'CONCEICAO DO RIO VERDE'),(1,3,1549,'CONCEICAO DOS OUROS'),(1,3,1550,'CONEGO MARINHO'),(1,3,1551,'CONFINS'),(1,3,1552,'CONGONHAL'),(1,3,1553,'CONGONHAS'),(1,3,1554,'CONGONHAS DO NORTE'),(1,3,1555,'CONQUISTA'),(1,3,1556,'CONSELHEIRO LAFAIETE'),(1,3,1557,'CONSELHEIRO PENA'),(1,3,1558,'CONSOLACAO'),(1,3,1559,'CONTAGEM'),(1,3,1560,'COQUEIRAL'),(1,3,1561,'CORACAO DE JESUS'),(1,3,1562,'CORDISBURGO'),(1,3,1563,'CORDISLANDIA'),(1,3,1564,'CORINTO'),(1,3,1565,'COROACI'),(1,3,1566,'COROMANDEL'),(1,3,1567,'CORONEL FABRICIANO'),(1,3,1568,'CORONEL MURTA'),(1,3,1569,'CORONEL PACHECO'),(1,3,1570,'CORONEL XAVIER CHAVES'),(1,3,1571,'CORREGO DANTA'),(1,3,1572,'CORREGO DO BOM JESUS'),(1,3,1573,'CORREGO FUNDO'),(1,3,1574,'CORREGO NOVO'),(1,3,1575,'COUTO DE MAGALHAES DE MINAS'),(1,3,1576,'CRISOLITA'),(1,3,1577,'CRISTAIS'),(1,3,1578,'CRISTALIA'),(1,3,1579,'CRISTIANO OTONI'),(1,3,1580,'CRISTINA'),(1,3,1581,'CRUCILANDIA'),(1,3,1582,'CRUZEIRO DA FORTALEZA'),(1,3,1583,'CRUZILIA'),(1,3,1584,'CUPARAQUE'),(1,3,1585,'CURRAL DE DENTRO'),(1,3,1586,'CURVELO'),(1,3,1587,'DATAS'),(1,3,1588,'DELFIM MOREIRA'),(1,3,1589,'DELFINOPOLIS'),(1,3,1590,'DELTA'),(1,3,1591,'DESCOBERTO'),(1,3,1592,'DESTERRO DE ENTRE RIOS'),(1,3,1593,'DESTERRO DO MELO'),(1,3,1594,'DIAMANTINA'),(1,3,1595,'DIOGO DE VASCONCELOS'),(1,3,1596,'DIONISIO'),(1,3,1597,'DIVINESIA'),(1,3,1598,'DIVINO'),(1,3,1599,'DIVINO DAS LARANJEIRAS'),(1,3,1600,'DIVINOLANDIA DE MINAS'),(1,3,1601,'DIVINOPOLIS'),(1,3,1602,'DIVISA ALEGRE'),(1,3,1603,'DIVISA NOVA'),(1,3,1604,'DIVISOPOLIS'),(1,3,1605,'DOM BOSCO'),(1,3,1606,'DOM CAVATI'),(1,3,1607,'DOM JOAQUIM'),(1,3,1608,'DOM SILVERIO'),(1,3,1609,'DOM VICOSO'),(1,3,1610,'DONA EUZEBIA'),(1,3,1611,'DORES DE CAMPOS'),(1,3,1612,'DORES DE GUANHAES'),(1,3,1613,'DORES DO INDAIA'),(1,3,1614,'DORES DO TURVO'),(1,3,1615,'DORESOPOLIS'),(1,3,1616,'DOURADOQUARA'),(1,3,1617,'DURANDE'),(1,3,1618,'ELOI MENDES'),(1,3,1619,'ENGENHEIRO CALDAS'),(1,3,1620,'ENGENHEIRO NAVARRO'),(1,3,1621,'ENTRE FOLHAS'),(1,3,1622,'ENTRE RIOS DE MINAS'),(1,3,1623,'ERVALIA'),(1,3,1624,'ESMERALDAS'),(1,3,1625,'ESPERA FELIZ'),(1,3,1626,'ESPINOSA'),(1,3,1627,'ESPIRITO SANTO DO DOURADO'),(1,3,1628,'ESTIVA'),(1,3,1629,'ESTRELA DALVA'),(1,3,1630,'ESTRELA DO INDAIA'),(1,3,1631,'ESTRELA DO SUL'),(1,3,1632,'EUGENOPOLIS'),(1,3,1633,'EWBANK DA CAMARA'),(1,3,1634,'EXTREMA'),(1,3,1635,'FAMA'),(1,3,1636,'FARIA LEMOS'),(1,3,1637,'FELICIO DOS SANTOS'),(1,3,1638,'FELISBURGO'),(1,3,1639,'FELIXLANDIA'),(1,3,1640,'FERNANDES TOURINHO'),(1,3,1641,'FERROS'),(1,3,1642,'FERVEDOURO'),(1,3,1643,'FLORESTAL'),(1,3,1644,'FORMIGA'),(1,3,1645,'FORMOSO'),(1,3,1646,'FORTALEZA DE MINAS'),(1,3,1647,'FORTUNA DE MINAS'),(1,3,1648,'FRANCISCO BADARO'),(1,3,1649,'FRANCISCO DUMONT'),(1,3,1650,'FRANCISCO SA'),(1,3,1651,'FRANCISCOPOLIS'),(1,3,1652,'FREI GASPAR'),(1,3,1653,'FREI INOCENCIO'),(1,3,1654,'FREI LAGONEGRO'),(1,3,1655,'FRONTEIRA'),(1,3,1656,'FRONTEIRA DOS VALES'),(1,3,1657,'FRUTA DE LEITE'),(1,3,1658,'FRUTAL'),(1,3,1659,'FUNILANDIA'),(1,3,1660,'GALILEIA'),(1,3,1661,'GAMELEIRAS'),(1,3,1662,'GLAUCILANDIA'),(1,3,1663,'GOIABEIRA'),(1,3,1664,'GOIANA'),(1,3,1665,'GONCALVES'),(1,3,1666,'GONZAGA'),(1,3,1667,'GOUVEA'),(1,3,1668,'GOVERNADOR VALADARES'),(1,3,1669,'GRAO MOGOL'),(1,3,1670,'GRUPIARA'),(1,3,1671,'GUANHAES'),(1,3,1672,'GUAPE'),(1,3,1673,'GUARACIABA'),(1,3,1674,'GUARACIAMA'),(1,3,1675,'GUARANESIA'),(1,3,1676,'GUARANI'),(1,3,1677,'GUARARA'),(1,3,1678,'GUARDA-MOR'),(1,3,1679,'GUAXUPE'),(1,3,1680,'GUIDOVAL'),(1,3,1681,'GUIMARANIA'),(1,3,1682,'GUIRICEMA'),(1,3,1683,'GURINHATA'),(1,3,1684,'HELIODORA'),(1,3,1685,'IAPU'),(1,3,1686,'IBERTIOGA'),(1,3,1687,'IBIA'),(1,3,1688,'IBIAI'),(1,3,1689,'IBIRACATU'),(1,3,1690,'IBIRACI'),(1,3,1691,'IBIRITE'),(1,3,1692,'IBITIURA DE MINAS'),(1,3,1693,'IBITURUNA'),(1,3,1694,'ICARAI DE MINAS'),(1,3,1695,'IGARAPE'),(1,3,1696,'IGARATINGA'),(1,3,1697,'IGUATAMA'),(1,3,1698,'IJACI'),(1,3,1699,'ILICINEA'),(1,3,1700,'IMBE DE MINAS'),(1,3,1701,'INCONFIDENTES'),(1,3,1702,'INDAIABIRA'),(1,3,1703,'INDIANOPOLIS'),(1,3,1704,'INGAI'),(1,3,1705,'INHAPIM'),(1,3,1706,'INHAUMA'),(1,3,1707,'INIMUTABA'),(1,3,1708,'IPABA'),(1,3,1709,'IPANEMA'),(1,3,1710,'IPATINGA'),(1,3,1711,'IPIACU'),(1,3,1712,'IPUIUNA'),(1,3,1713,'IRAI DE MINAS'),(1,3,1714,'ITABIRA'),(1,3,1715,'ITABIRINHA DE MANTENA'),(1,3,1716,'ITABIRITO'),(1,3,1717,'ITACAMBIRA'),(1,3,1718,'ITACARAMBI'),(1,3,1719,'ITAGUARA'),(1,3,1720,'ITAIPE'),(1,3,1721,'ITAJUBA'),(1,3,1722,'ITAMARANDIBA'),(1,3,1723,'ITAMARATI DE MINAS'),(1,3,1724,'ITAMBACURI'),(1,3,1725,'ITAMBE DO MATO DENTRO'),(1,3,1726,'ITAMOGI'),(1,3,1727,'ITAMONTE'),(1,3,1728,'ITANHANDU'),(1,3,1729,'ITANHOMI'),(1,3,1730,'ITAOBIM'),(1,3,1731,'ITAPAGIPE'),(1,3,1732,'ITAPECERICA'),(1,3,1733,'ITAPEVA'),(1,3,1734,'ITATIAIUCU'),(1,3,1735,'ITAU DE MINAS'),(1,3,1736,'ITAUNA'),(1,3,1737,'ITAVERAVA'),(1,3,1738,'ITINGA'),(1,3,1739,'ITUETA'),(1,3,1740,'ITUIUTABA'),(1,3,1741,'ITUMIRIM'),(1,3,1742,'ITURAMA'),(1,3,1743,'ITUTINGA'),(1,3,1744,'JABOTICATUBAS'),(1,3,1745,'JACINTO'),(1,3,1746,'JACUI'),(1,3,1747,'JACUTINGA'),(1,3,1748,'JAGUARACU'),(1,3,1749,'JAIBA'),(1,3,1750,'JAMPRUCA'),(1,3,1751,'JANAUBA'),(1,3,1752,'JANUARIA'),(1,3,1753,'JAPARAIBA'),(1,3,1754,'JAPONVAR'),(1,3,1755,'JECEABA'),(1,3,1756,'JENIPAPO DE MINAS'),(1,3,1757,'JEQUERI'),(1,3,1758,'JEQUITAI'),(1,3,1759,'JEQUITIBA'),(1,3,1760,'JEQUITINHONHA'),(1,3,1761,'JESUANIA'),(1,3,1762,'JOAIMA'),(1,3,1763,'JOANESIA'),(1,3,1764,'JOAO MONLEVADE'),(1,3,1765,'JOAO PINHEIRO'),(1,3,1766,'JOAQUIM FELICIO'),(1,3,1767,'JORDANIA'),(1,3,1768,'JOSE GONCALVES DE MINAS'),(1,3,1769,'JOSE RAYDAN'),(1,3,1770,'JOSENOPOLIS'),(1,3,1771,'JUATUBA'),(1,3,1772,'JUIZ DE FORA'),(1,3,1773,'JURAMENTO'),(1,3,1774,'JURUAIA'),(1,3,1775,'JUVENILIA'),(1,3,1776,'LADAINHA'),(1,3,1777,'LAGAMAR'),(1,3,1778,'LAGOA DA PRATA'),(1,3,1779,'LAGOA DOS PATOS'),(1,3,1780,'LAGOA DOURADA'),(1,3,1781,'LAGOA FORMOSA'),(1,3,1782,'LAGOA GRANDE'),(1,3,1783,'LAGOA SANTA'),(1,3,1784,'LAJINHA'),(1,3,1785,'LAMBARI'),(1,3,1786,'LAMIM'),(1,3,1787,'LARANJAL'),(1,3,1788,'LASSANCE'),(1,3,1789,'LAVRAS'),(1,3,1790,'LEANDRO FERREIRA'),(1,3,1791,'LEME DO PRADO'),(1,3,1792,'LEOPOLDINA'),(1,3,1793,'LIBERDADE'),(1,3,1794,'LIMA DUARTE'),(1,3,1795,'LIMEIRA D OESTE'),(1,3,1796,'LONTRA'),(1,3,1797,'LUISBURGO'),(1,3,1798,'LUISLANDIA'),(1,3,1799,'LUMINARIAS'),(1,3,1800,'LUZ'),(1,3,1801,'MACHACALIS'),(1,3,1802,'MACHADO'),(1,3,1803,'MADRE DE DEUS DE MINAS'),(1,3,1804,'MALACACHETA'),(1,3,1805,'MAMONAS'),(1,3,1806,'MANGA'),(1,3,1807,'MANHUACU'),(1,3,1808,'MANHUMIRIM'),(1,3,1809,'MANTENA'),(1,3,1810,'MAR DE ESPANHA'),(1,3,1811,'MARAVILHAS'),(1,3,1812,'MARIA DA FE'),(1,3,1813,'MARIANA'),(1,3,1814,'MARILAC'),(1,3,1815,'MARIO CAMPOS'),(1,3,1816,'MARIPA DE MINAS'),(1,3,1817,'MARLIERIA'),(1,3,1818,'MARMELOPOLIS'),(1,3,1819,'MARTINHO CAMPOS'),(1,3,1820,'MARTINS SOARES'),(1,3,1821,'MATA VERDE'),(1,3,1822,'MATERLANDIA'),(1,3,1823,'MATEUS LEME'),(1,3,1824,'MATHIAS LOBATO'),(1,3,1825,'MATIAS BARBOSA'),(1,3,1826,'MATIAS CARDOSO'),(1,3,1827,'MATIPO'),(1,3,1828,'MATO VERDE'),(1,3,1829,'MATOZINHOS'),(1,3,1830,'MATUTINA'),(1,3,1831,'MEDEIROS'),(1,3,1832,'MEDINA'),(1,3,1833,'MENDES PIMENTEL'),(1,3,1834,'MERCES'),(1,3,1835,'MESQUITA'),(1,3,1836,'MINAS NOVAS'),(1,3,1837,'MINDURI'),(1,3,1838,'MIRABELA'),(1,3,1839,'MIRADOURO'),(1,3,1840,'MIRAI'),(1,3,1841,'MIRAVANIA'),(1,3,1842,'MOEDA'),(1,3,1843,'MOEMA'),(1,3,1844,'MONJOLOS'),(1,3,1845,'MONSENHOR PAULO'),(1,3,1846,'MONTALVANIA'),(1,3,1847,'MONTE ALEGRE DE MINAS'),(1,3,1848,'MONTE AZUL'),(1,3,1849,'MONTE BELO'),(1,3,1850,'MONTE CARMELO'),(1,3,1851,'MONTE FORMOSO'),(1,3,1852,'MONTE SANTO DE MINAS'),(1,3,1853,'MONTE SIAO'),(1,3,1854,'MONTES CLAROS'),(1,3,1855,'MONTEZUMA'),(1,3,1856,'MORADA NOVA DE MINAS'),(1,3,1857,'MORRO DA GARCA'),(1,3,1858,'MORRO DO PILAR'),(1,3,1859,'MUNHOZ'),(1,3,1860,'MURIAE'),(1,3,1861,'MUTUM'),(1,3,1862,'MUZAMBINHO'),(1,3,1863,'NACIP RAYDAN'),(1,3,1864,'NANUQUE'),(1,3,1865,'NAQUE'),(1,3,1866,'NATALANDIA'),(1,3,1867,'NATERCIA'),(1,3,1868,'NAZARENO'),(1,3,1869,'NEPOMUCENO'),(1,3,1870,'NINHEIRA'),(1,3,1871,'NOVA BELEM'),(1,3,1872,'NOVA ERA'),(1,3,1873,'NOVA LIMA'),(1,3,1874,'NOVA MODICA'),(1,3,1875,'NOVA PONTE'),(1,3,1876,'NOVA PORTEIRINHA'),(1,3,1877,'NOVA RESENDE'),(1,3,1878,'NOVA SERRANA'),(1,3,1879,'NOVA UNIAO'),(1,3,1880,'NOVO CRUZEIRO'),(1,3,1881,'NOVO ORIENTE DE MINAS'),(1,3,1882,'NOVORIZONTE'),(1,3,1883,'OLARIA'),(1,3,1884,'OLHOS-DAGUA'),(1,3,1885,'OLIMPIO NORONHA'),(1,3,1886,'OLIVEIRA'),(1,3,1887,'OLIVEIRA FORTES'),(1,3,1888,'ONCA DE PITANGUI'),(1,3,1889,'ORATORIOS'),(1,3,1890,'ORIZANIA'),(1,3,1891,'OURO BRANCO'),(1,3,1892,'OURO FINO'),(1,3,1893,'OURO PRETO'),(1,3,1894,'OURO VERDE DE MINAS'),(1,3,1895,'PADRE CARVALHO'),(1,3,1896,'PADRE PARAISO'),(1,3,1897,'PAI PEDRO'),(1,3,1898,'PAINEIRAS'),(1,3,1899,'PAINS'),(1,3,1900,'PAIVA'),(1,3,1901,'PALMA'),(1,3,1902,'PALMOPOLIS'),(1,3,1903,'PAPAGAIOS'),(1,3,1904,'PARA DE MINAS'),(1,3,1905,'PARACATU'),(1,3,1906,'PARAGUACU'),(1,3,1907,'PARAISOPOLIS'),(1,3,1908,'PARAOPEBA'),(1,3,1909,'PASSA QUATRO'),(1,3,1910,'PASSA TEMPO'),(1,3,1911,'PASSABEM'),(1,3,1912,'PASSA-VINTE'),(1,3,1913,'PASSOS'),(1,3,1914,'PATIS'),(1,3,1915,'PATOS DE MINAS'),(1,3,1916,'PATROCINIO'),(1,3,1917,'PATROCINIO DO MURIAE'),(1,3,1918,'PAULA CANDIDO'),(1,3,1919,'PAULISTAS'),(1,3,1920,'PAVAO'),(1,3,1921,'PECANHA'),(1,3,1922,'PEDRA AZUL'),(1,3,1923,'PEDRA BONITA'),(1,3,1924,'PEDRA DO ANTA'),(1,3,1925,'PEDRA DO INDAIA'),(1,3,1926,'PEDRA DOURADA'),(1,3,1927,'PEDRALVA'),(1,3,1928,'PEDRAS DE MARIA DA CRUZ'),(1,3,1929,'PEDRINOPOLIS'),(1,3,1930,'PEDRO LEOPOLDO'),(1,3,1931,'PEDRO TEIXEIRA'),(1,3,1932,'PEQUERI'),(1,3,1933,'PEQUI'),(1,3,1934,'PERDIGAO'),(1,3,1935,'PERDIZES'),(1,3,1936,'PERDOES'),(1,3,1937,'PERIQUITO'),(1,3,1938,'PESCADOR'),(1,3,1939,'PIAU'),(1,3,1940,'PIEDADE DE CARATINGA'),(1,3,1941,'PIEDADE DE PONTE NOVA'),(1,3,1942,'PIEDADE DO RIO GRANDE'),(1,3,1943,'PIEDADE DOS GERAIS'),(1,3,1944,'PIMENTA'),(1,3,1945,'PINGO DAGUA'),(1,3,1946,'PINTOPOLIS'),(1,3,1947,'PIRACEMA'),(1,3,1948,'PIRAJUBA'),(1,3,1949,'PIRANGA'),(1,3,1950,'PIRANGUCU'),(1,3,1951,'PIRANGUINHO'),(1,3,1952,'PIRAPETINGA'),(1,3,1953,'PIRAPORA'),(1,3,1954,'PIRAUBA'),(1,3,1955,'PITANGUI'),(1,3,1956,'PIUMHI'),(1,3,1957,'PLANURA'),(1,3,1958,'POCO FUNDO'),(1,3,1959,'POCOS DE CALDAS'),(1,3,1960,'POCRANE'),(1,3,1961,'POMPEU'),(1,3,1962,'PONTE NOVA'),(1,3,1963,'PONTO CHIQUE'),(1,3,1964,'PONTO DOS VOLANTES'),(1,3,1965,'PORTEIRINHA'),(1,3,1966,'PORTO FIRME'),(1,3,1967,'POTE'),(1,3,1968,'POUSO ALEGRE'),(1,3,1969,'POUSO ALTO'),(1,3,1970,'PRADOS'),(1,3,1971,'PRATA'),(1,3,1972,'PRATAPOLIS'),(1,3,1973,'PRATINHA'),(1,3,1974,'PRESIDENTE BERNARDES'),(1,3,1975,'PRESIDENTE JUSCELINO'),(1,3,1976,'PRESIDENTE KUBITSCHEK'),(1,3,1977,'PRESIDENTE OLEGARIO'),(1,3,1978,'PRUDENTE DE MORAIS'),(1,3,1979,'QUARTEL GERAL'),(1,3,1980,'QUELUZITA'),(1,3,1981,'RAPOSOS'),(1,3,1982,'RAUL SOARES'),(1,3,1983,'RECREIO'),(1,3,1984,'REDUTO'),(1,3,1985,'RESENDE COSTA'),(1,3,1986,'RESPLENDOR'),(1,3,1987,'RESSAQUINHA'),(1,3,1988,'RIACHINHO'),(1,3,1989,'RIACHO DOS MACHADOS'),(1,3,1990,'RIBEIRAO DAS NEVES'),(1,3,1991,'RIBEIRAO VERMELHO'),(1,3,1992,'RIO ACIMA'),(1,3,1993,'RIO CASCA'),(1,3,1994,'RIO DO PRADO'),(1,3,1995,'RIO DOCE'),(1,3,1996,'RIO ESPERA'),(1,3,1997,'RIO MANSO'),(1,3,1998,'RIO NOVO'),(1,3,1999,'RIO PARANAIBA'),(1,3,2000,'RIO PARDO DE MINAS'),(1,3,2001,'RIO PIRACICABA'),(1,3,2002,'RIO POMBA'),(1,3,2003,'RIO PRETO'),(1,3,2004,'RIO VERMELHO'),(1,3,2005,'RITAPOLIS'),(1,3,2006,'ROCHEDO DE MINAS'),(1,3,2007,'RODEIRO'),(1,3,2008,'ROMARIA'),(1,3,2009,'ROSARIO DA LIMEIRA'),(1,3,2010,'RUBELITA'),(1,3,2011,'RUBIM'),(1,3,2012,'SABARA'),(1,3,2013,'SABINOPOLIS'),(1,3,2014,'SACRAMENTO'),(1,3,2015,'SALINAS'),(1,3,2016,'SALTO DA DIVISA'),(1,3,2017,'SANTA BARBARA'),(1,3,2018,'SANTA BARBARA DO LESTE'),(1,3,2019,'SANTA BARBARA DO MONTE VERDE'),(1,3,2020,'SANTA BARBARA DO TUGURIO'),(1,3,2021,'SANTA CRUZ DE MINAS'),(1,3,2022,'SANTA CRUZ DE SALINAS'),(1,3,2023,'SANTA CRUZ DO ESCALVADO'),(1,3,2024,'SANTA EFIGENIA DE MINAS'),(1,3,2025,'SANTA FE DE MINAS'),(1,3,2026,'SANTA HELENA DE MINAS'),(1,3,2027,'SANTA JULIANA'),(1,3,2028,'SANTA LUZIA'),(1,3,2029,'SANTA MARGARIDA'),(1,3,2030,'SANTA MARIA DE ITABIRA'),(1,3,2031,'SANTA MARIA DO SALTO'),(1,3,2032,'SANTA MARIA DO SUACUI'),(1,3,2033,'SANTA RITA DE CALDAS'),(1,3,2034,'SANTA RITA DE JACUTINGA'),(1,3,2035,'SANTA RITA DE MINAS'),(1,3,2036,'SANTA RITA DO IBITIPOCA '),(1,3,2037,'SANTA RITA DO ITUETO'),(1,3,2038,'SANTA RITA DO SAPUCAI'),(1,3,2039,'SANTA ROSA DA SERRA'),(1,3,2040,'SANTA VITORIA'),(1,3,2041,'SANTANA DA VARGEM'),(1,3,2042,'SANTANA DE CATAGUASES'),(1,3,2043,'SANTANA DE PIRAPAMA'),(1,3,2044,'SANTANA DO DESERTO'),(1,3,2045,'SANTANA DO GARAMBEU'),(1,3,2046,'SANTANA DO JACARE'),(1,3,2047,'SANTANA DO MANHUACU'),(1,3,2048,'SANTANA DO PARAISO'),(1,3,2049,'SANTANA DO RIACHO'),(1,3,2050,'SANTANA DOS MONTES'),(1,3,2051,'SANTO ANTONIO DO AMPARO'),(1,3,2052,'SANTO ANTONIO DO AVENTUREIRO'),(1,3,2053,'SANTO ANTONIO DO GRAMA'),(1,3,2054,'SANTO ANTONIO DO ITAMBE'),(1,3,2055,'SANTO ANTONIO DO JACINTO'),(1,3,2056,'SANTO ANTONIO DO MONTE'),(1,3,2057,'SANTO ANTONIO DO RETIRO'),(1,3,2058,'SANTO ANTONIO DO RIO ABAIXO'),(1,3,2059,'SANTO HIPOLITO'),(1,3,2060,'SANTOS DUMONT'),(1,3,2061,'SAO BENTO ABADE'),(1,3,2062,'SAO BRAS DO SUACUI'),(1,3,2063,'SAO DOMINGOS DAS DORES'),(1,3,2064,'SAO DOMINGOS DO PRATA'),(1,3,2065,'SAO FELIX DE MINAS'),(1,3,2066,'SAO FRANCISCO'),(1,3,2067,'SAO FRANCISCO DE PAULA'),(1,3,2068,'SAO FRANCISCO DE SALES'),(1,3,2069,'SAO FRANCISCO DO GLORIA'),(1,3,2070,'SAO GERALDO'),(1,3,2071,'SAO GERALDO DA PIEDADE'),(1,3,2072,'SAO GERALDO DO BAIXIO'),(1,3,2073,'SAO GONCALO DO ABAETE'),(1,3,2074,'SAO GONCALO DO PARA'),(1,3,2075,'SAO GONCALO DO RIO ABAIXO'),(1,3,2076,'SAO GONCALO DO RIO PRETO'),(1,3,2077,'SAO GONCALO DO SAPUCAI'),(1,3,2078,'SAO GOTARDO'),(1,3,2079,'SAO JOAO BATISTA DO GLORIA'),(1,3,2080,'SAO JOAO DA LAGOA'),(1,3,2081,'SAO JOAO DA MATA'),(1,3,2082,'SAO JOAO DA PONTE'),(1,3,2083,'SAO JOAO DAS MISSOES'),(1,3,2084,'SAO JOAO DEL REI'),(1,3,2085,'SAO JOAO DO MANHUACU'),(1,3,2086,'SAO JOAO DO MANTENINHA'),(1,3,2087,'SAO JOAO DO ORIENTE'),(1,3,2088,'SAO JOAO DO PACUI'),(1,3,2089,'SAO JOAO DO PARAISO'),(1,3,2090,'SAO JOAO EVANGELISTA'),(1,3,2091,'SAO JOAO NEPOMUCENO'),(1,3,2092,'SAO JOAQUIM DE BICAS'),(1,3,2093,'SAO JOSE DA BARRA'),(1,3,2094,'SAO JOSE DA LAPA'),(1,3,2095,'SAO JOSE DA SAFIRA'),(1,3,2096,'SAO JOSE DA VARGINHA'),(1,3,2097,'SAO JOSE DO ALEGRE'),(1,3,2098,'SAO JOSE DO DIVINO'),(1,3,2099,'SAO JOSE DO GOIABAL'),(1,3,2100,'SAO JOSE DO JACURI'),(1,3,2101,'SAO JOSE DO MANTIMENTO'),(1,3,2102,'SAO LOURENCO'),(1,3,2103,'SAO MIGUEL DO ANTA'),(1,3,2104,'SAO PEDRO DA UNIAO'),(1,3,2105,'SAO PEDRO DO SUACUI'),(1,3,2106,'SAO PEDRO DOS FERROS'),(1,3,2107,'SAO ROMAO'),(1,3,2108,'SAO ROQUE DE MINAS'),(1,3,2109,'SAO SEBASTIAO DA BELA VISTA'),(1,3,2110,'SAO SEBASTIAO DA VARGEM ALEGRE'),(1,3,2111,'SAO SEBASTIAO DO ANTA'),(1,3,2112,'SAO SEBASTIAO DO MARANHAO'),(1,3,2113,'SAO SEBASTIAO DO OESTE'),(1,3,2114,'SAO SEBASTIAO DO PARAISO'),(1,3,2115,'SAO SEBASTIAO DO RIO PRETO'),(1,3,2116,'SAO SEBASTIAO DO RIO VERDE'),(1,3,2117,'SAO THOME DAS LETRAS'),(1,3,2118,'SAO TIAGO'),(1,3,2119,'SAO TOMAS DE AQUINO'),(1,3,2120,'SAO VICENTE DE MINAS'),(1,3,2121,'SAPUCAI-MIRIM'),(1,3,2122,'SARDOA'),(1,3,2123,'SARZEDO'),(1,3,2124,'SEM-PEIXE'),(1,3,2125,'SENADOR AMARAL'),(1,3,2126,'SENADOR CORTES'),(1,3,2127,'SENADOR FIRMINO'),(1,3,2128,'SENADOR JOSE BENTO'),(1,3,2129,'SENADOR MODESTINO GONCALVES'),(1,3,2130,'SENHORA DE OLIVEIRA'),(1,3,2131,'SENHORA DO PORTO'),(1,3,2132,'SENHORA DOS REMEDIOS'),(1,3,2133,'SERICITA'),(1,3,2134,'SERITINGA'),(1,3,2135,'SERRA AZUL DE MINAS'),(1,3,2136,'SERRA DA SAUDADE'),(1,3,2137,'SERRA DO SALITRE'),(1,3,2138,'SERRA DOS AIMORES'),(1,3,2139,'SERRANIA'),(1,3,2140,'SERRANOPOLIS DE MINAS'),(1,3,2141,'SERRANOS'),(1,3,2142,'SERRO'),(1,3,2143,'SETE LAGOAS'),(1,3,2144,'SETUBINHA'),(1,3,2145,'SILVEIRANIA'),(1,3,2146,'SILVIANOPOLIS'),(1,3,2147,'SIMAO PEREIRA'),(1,3,2148,'SIMONESIA'),(1,3,2149,'SOBRALIA'),(1,3,2150,'SOLEDADE DE MINAS'),(1,3,2151,'TABULEIRO'),(1,3,2152,'TAIOBEIRAS'),(1,3,2153,'TAPARUBA'),(1,3,2154,'TAPIRA'),(1,3,2155,'TAPIRAI'),(1,3,2156,'TAQUARACU DE MINAS'),(1,3,2157,'TARUMIRIM'),(1,3,2158,'TEIXEIRAS'),(1,3,2159,'TEOFILO OTONI'),(1,3,2160,'TIMOTEO'),(1,3,2161,'TIRADENTES'),(1,3,2162,'TIROS'),(1,3,2163,'TOCANTINS'),(1,3,2164,'TOCOS DO MOGI'),(1,3,2165,'TOLEDO'),(1,3,2166,'TOMBOS'),(1,3,2167,'TRES CORACOES'),(1,3,2168,'TRES MARIAS'),(1,3,2169,'TRES PONTAS'),(1,3,2170,'TUMIRITINGA'),(1,3,2171,'TUPACIGUARA'),(1,3,2172,'TURMALINA'),(1,3,2173,'TURVOLANDIA'),(1,3,2174,'UBA'),(1,3,2175,'UBAI'),(1,3,2176,'UBAPORANGA'),(1,3,2177,'UBERABA'),(1,3,2178,'UBERLANDIA'),(1,3,2179,'UMBURATIBA'),(1,3,2180,'UNAI'),(1,3,2181,'UNIAO DE MINAS'),(1,3,2182,'URUANA DE MINAS'),(1,3,2183,'URUCANIA'),(1,3,2184,'URUCUIA'),(1,3,2185,'VARGEM ALEGRE'),(1,3,2186,'VARGEM BONITA'),(1,3,2187,'VARGEM GRANDE DO RIO PARDO'),(1,3,2188,'VARGINHA'),(1,3,2189,'VARJAO DE MINAS'),(1,3,2190,'VARZEA DA PALMA'),(1,3,2191,'VARZELANDIA'),(1,3,2192,'VAZANTE'),(1,3,2193,'VERDELANDIA'),(1,3,2194,'VEREDINHA'),(1,3,2195,'VERISSIMO'),(1,3,2196,'VERMELHO NOVO'),(1,3,2197,'VESPASIANO'),(1,3,2198,'VICOSA'),(1,3,2199,'VIEIRAS'),(1,3,2200,'VIRGEM DA LAPA'),(1,3,2201,'VIRGINIA'),(1,3,2202,'VIRGINOPOLIS'),(1,3,2203,'VIRGOLANDIA'),(1,3,2204,'VISCONDE DO RIO BRANCO'),(1,3,2205,'VOLTA GRANDE'),(1,3,2206,'WENCESLAU BRAZ'),(1,16,2207,'AGUA CLARA'),(1,16,2208,'ALCINOPOLIS'),(1,16,2209,'AMAMBAI'),(1,16,2210,'ANASTACIO'),(1,16,2211,'ANAURILANDIA'),(1,16,2212,'ANGELICA'),(1,16,2213,'ANTONIO JOAO'),(1,16,2214,'APARECIDA DO TABOADO'),(1,16,2215,'AQUIDAUANA'),(1,16,2216,'ARAL MOREIRA'),(1,16,2217,'BANDEIRANTES'),(1,16,2218,'BATAGUASSU'),(1,16,2219,'BATAIPORA'),(1,16,2220,'BELA VISTA'),(1,16,2221,'BODOQUENA'),(1,16,2222,'BONITO'),(1,16,2223,'BRASILANDIA'),(1,16,2224,'CAARAPO'),(1,16,2225,'CAMAPUA'),(1,16,2226,'CAMPO GRANDE'),(1,16,2227,'CARACOL'),(1,16,2228,'CASSILANDIA'),(1,16,2229,'CHAPADAO DO SUL'),(1,16,2230,'CORGUINHO'),(1,16,2231,'CORONEL SAPUCAIA'),(1,16,2232,'CORUMBA'),(1,16,2233,'COSTA RICA'),(1,16,2234,'COXIM'),(1,16,2235,'DEODAPOLIS'),(1,16,2236,'DOIS IRMAOS DO BURITI'),(1,16,2237,'DOURADINA'),(1,16,2238,'DOURADOS'),(1,16,2239,'ELDORADO'),(1,16,2240,'FATIMA DO SUL'),(1,16,2241,'FIGUEIRÃO'),(1,16,2242,'GLORIA DE DOURADOS'),(1,16,2243,'GUIA LOPES DA LAGUNA'),(1,16,2244,'IGUATEMI'),(1,16,2245,'INOCENCIA'),(1,16,2246,'ITAPORA'),(1,16,2247,'ITAQUIRAI'),(1,16,2248,'IVINHEMA'),(1,16,2249,'JAPORA'),(1,16,2250,'JARAGUARI'),(1,16,2251,'JARDIM'),(1,16,2252,'JATEI'),(1,16,2253,'JUTI'),(1,16,2254,'LADARIO'),(1,16,2255,'LAGUNA CARAPA'),(1,16,2256,'MARACAJU'),(1,16,2257,'MIRANDA'),(1,16,2258,'MUNDO NOVO'),(1,16,2259,'NAVIRAI'),(1,16,2260,'NIOAQUE'),(1,16,2261,'NOVA ALVORADA DO SUL'),(1,16,2262,'NOVA ANDRADINA'),(1,16,2263,'NOVO HORIZONTE DO SUL'),(1,16,2264,'PARANAIBA'),(1,16,2265,'PARANHOS'),(1,16,2266,'PEDRO GOMES'),(1,16,2267,'PONTA PORA'),(1,16,2268,'PORTO MURTINHO'),(1,16,2269,'RIBAS DO RIO PARDO'),(1,16,2270,'RIO BRILHANTE'),(1,16,2271,'RIO NEGRO'),(1,16,2272,'RIO VERDE DE MATO GROSSO'),(1,16,2273,'ROCHEDO'),(1,16,2274,'SANTA RITA DO PARDO'),(1,16,2275,'SAO GABRIEL DO OESTE'),(1,16,2276,'SELVIRIA'),(1,16,2277,'SETE QUEDAS'),(1,16,2278,'SIDROLANDIA'),(1,16,2279,'SONORA'),(1,16,2280,'TACURU'),(1,16,2281,'TAQUARUSSU'),(1,16,2282,'TERENOS'),(1,16,2283,'TRES LAGOAS'),(1,16,2284,'VICENTINA'),(1,15,2285,'ACORIZAL'),(1,15,2286,'AGUA BOA'),(1,15,2287,'ALTA FLORESTA'),(1,15,2288,'ALTO ARAGUAIA'),(1,15,2289,'ALTO BOA VISTA'),(1,15,2290,'ALTO GARCAS'),(1,15,2291,'ALTO PARAGUAI'),(1,15,2292,'ALTO TAQUARI'),(1,15,2293,'APIACAS'),(1,15,2294,'ARAGUAIANA'),(1,15,2295,'ARAGUAINHA'),(1,15,2296,'ARAPUTANGA'),(1,15,2297,'ARENAPOLIS'),(1,15,2298,'ARIPUANA'),(1,15,2299,'BARAO DE MELGACO'),(1,15,2300,'BARRA DO BUGRES'),(1,15,2301,'BARRA DO GARCAS'),(1,15,2302,'BOM JESUS DO ARAGUAIA'),(1,15,2303,'BRASNORTE'),(1,15,2304,'CACERES'),(1,15,2305,'CAMPINAPOLIS'),(1,15,2306,'CAMPO NOVO DO PARECIS'),(1,15,2307,'CAMPO VERDE'),(1,15,2308,'CAMPOS DE JULIO'),(1,15,2309,'CANA BRAVA DO NORTE'),(1,15,2310,'CANARANA'),(1,15,2311,'CARLINDA'),(1,15,2312,'CASTANHEIRA'),(1,15,2313,'CHAPADA DOS GUIMARAES'),(1,15,2314,'CLAUDIA'),(1,15,2315,'COCALINHO'),(1,15,2316,'COLIDER'),(1,15,2317,'COLNIZA'),(1,15,2318,'COMODORO'),(1,15,2319,'CONFRESA'),(1,15,2320,'CONQUISTA DOESTE'),(1,15,2321,'COTRIGUACU'),(1,15,2322,'CURVELANDIA'),(1,15,2323,'DENISE'),(1,15,2324,'DIAMANTINO'),(1,15,2325,'DOM AQUINO'),(1,15,2326,'FELIZ NATAL'),(1,15,2327,'FIGUEIROPOLIS DOESTE'),(1,15,2328,'GAUCHA DO NORTE'),(1,15,2329,'GENERAL CARNEIRO'),(1,15,2330,'GLORIA DOESTE'),(1,15,2331,'GUARANTA DO NORTE'),(1,15,2332,'GUIRATINGA'),(1,15,2333,'INDIAVAI'),(1,15,2334,'IPIRANGA DO NORTE'),(1,15,2335,'ITANHANGÁ'),(1,15,2336,'ITAUBA'),(1,15,2337,'ITIQUIRA'),(1,15,2338,'JACIARA'),(1,15,2339,'JANGADA'),(1,15,2340,'JAURU'),(1,15,2341,'JUARA'),(1,15,2342,'JUINA'),(1,15,2343,'JURUENA'),(1,15,2344,'JUSCIMEIRA'),(1,15,2345,'LAMBARI DOESTE'),(1,15,2346,'LUCAS DO RIO VERDE'),(1,15,2347,'LUCIARA'),(1,15,2348,'MARCELANDIA'),(1,15,2349,'MATUPA'),(1,15,2350,'MIRASSOL DOESTE'),(1,15,2351,'NOBRES'),(1,15,2352,'NORTELANDIA'),(1,15,2353,'NOSSA SENHORA DO LIVRAMENTO'),(1,15,2354,'NOVA BANDEIRANTES'),(1,15,2355,'NOVA BRASILANDIA'),(1,15,2356,'NOVA CANAA DO NORTE'),(1,15,2357,'NOVA GUARITA'),(1,15,2358,'NOVA LACERDA'),(1,15,2359,'NOVA MARILANDIA'),(1,15,2360,'NOVA MARINGA'),(1,15,2361,'NOVA MONTE VERDE'),(1,15,2362,'NOVA MUTUM'),(1,15,2363,'NOVA NAZARE'),(1,15,2364,'NOVA OLIMPIA'),(1,15,2365,'NOVA SANTA HELENA'),(1,15,2366,'NOVA UBIRATA'),(1,15,2367,'NOVA XAVANTINA'),(1,15,2368,'NOVO HORIZONTE DO NORTE'),(1,15,2369,'NOVO MUNDO'),(1,15,2370,'NOVO SANTO ANTONIO'),(1,15,2371,'NOVO SAO JOAQUIM'),(1,15,2372,'PARANAITA'),(1,15,2373,'PARANATINGA'),(1,15,2374,'PEDRA PRETA'),(1,15,2375,'PEIXOTO DE AZEVEDO'),(1,15,2376,'PLANALTO DA SERRA'),(1,15,2377,'POCONE'),(1,15,2378,'PONTAL DO ARAGUAIA'),(1,15,2379,'PONTE BRANCA'),(1,15,2380,'PONTES E LACERDA'),(1,15,2381,'PORTO ALEGRE DO NORTE'),(1,15,2382,'PORTO DOS GAUCHOS'),(1,15,2383,'PORTO ESPERIDIAO'),(1,15,2384,'PORTO ESTRELA'),(1,15,2385,'POXOREO'),(1,15,2386,'PRIMAVERA DO LESTE'),(1,15,2387,'QUERENCIA'),(1,15,2388,'RESERVA DO CABACAL'),(1,15,2389,'RIBEIRAO CASCALHEIRA'),(1,15,2390,'RIBEIRAOZINHO'),(1,15,2391,'RIO BRANCO'),(1,15,2392,'RONDOLANDIA'),(1,15,2393,'RONDONOPOLIS'),(1,15,2394,'ROSARIO OESTE'),(1,15,2395,'SALTO DO CEU'),(1,15,2396,'SANTA CARMEN'),(1,15,2397,'SANTA CRUZ DO XINGU'),(1,15,2398,'SANTA RITA DO TRIVELATO'),(1,15,2399,'SANTA TEREZINHA'),(1,15,2400,'SANTO AFONSO'),(1,15,2401,'SANTO ANTONIO DO LESTE'),(1,15,2402,'SANTO ANTONIO DO LEVERGER'),(1,15,2403,'SAO FELIX DO ARAGUAIA'),(1,15,2404,'SAO JOSE DO POVO'),(1,15,2405,'SAO JOSE DO RIO CLARO'),(1,15,2406,'SAO JOSE DO XINGU'),(1,15,2407,'SAO JOSE DOS QUATRO MARCOS'),(1,15,2408,'SAO PEDRO DA CIPA'),(1,15,2409,'SAPEZAL'),(1,15,2410,'SERRA NOVA DOURADA'),(1,15,2411,'SINOP'),(1,15,2412,'SORRISO'),(1,15,2413,'TABAPORA'),(1,15,2414,'TANGARA DA SERRA'),(1,15,2415,'TAPURAH'),(1,15,2416,'TERRA NOVA DO NORTE'),(1,15,2417,'TESOURO'),(1,15,2418,'TORIXOREU'),(1,15,2419,'UNIAO DO SUL'),(1,15,2420,'VALE DE SAO DOMINGOS'),(1,15,2421,'VARZEA GRANDE'),(1,15,2422,'VERA'),(1,15,2423,'VILA BELA SANTISSIMA TRINDADE'),(1,15,2424,'VILA RICA'),(1,17,2425,'ABAETETUBA'),(1,17,2426,'ABEL FIGUEIREDO'),(1,17,2427,'ACARA'),(1,17,2428,'AFUA'),(1,17,2429,'AGUA AZUL DO NORTE'),(1,17,2430,'ALENQUER'),(1,17,2431,'ALMEIRIM'),(1,17,2432,'ALTAMIRA'),(1,17,2433,'ANAJAS'),(1,17,2434,'ANANINDEUA'),(1,17,2435,'ANAPU'),(1,17,2436,'AUGUSTO CORREA'),(1,17,2437,'AURORA DO PARA'),(1,17,2438,'AVEIRO'),(1,17,2439,'BAGRE'),(1,17,2440,'BAIAO'),(1,17,2441,'BANNACH'),(1,17,2442,'BARCARENA'),(1,17,2443,'BELEM'),(1,17,2444,'BELTERRA'),(1,17,2445,'BENEVIDES'),(1,17,2446,'BOM JESUS DO TOCANTINS'),(1,17,2447,'BONITO'),(1,17,2448,'BRAGANCA'),(1,17,2449,'BRASIL NOVO'),(1,17,2450,'BREJO GRANDE DO ARAGUAIA'),(1,17,2451,'BREU BRANCO'),(1,17,2452,'BREVES'),(1,17,2453,'BUJARU'),(1,17,2454,'CACHOEIRA DO ARARI'),(1,17,2455,'CACHOEIRA DO PIRIA'),(1,17,2456,'CAMETA'),(1,17,2457,'CANAA DOS CARAJAS'),(1,17,2458,'CAPANEMA'),(1,17,2459,'CAPITAO POCO'),(1,17,2460,'CASTANHAL'),(1,17,2461,'CHAVES'),(1,17,2462,'COLARES'),(1,17,2463,'CONCEICAO DO ARAGUAIA'),(1,17,2464,'CONCORDIA DO PARA'),(1,17,2465,'CUMARU DO NORTE'),(1,17,2466,'CURIONOPOLIS'),(1,17,2467,'CURRALINHO'),(1,17,2468,'CURUA'),(1,17,2469,'CURUCA'),(1,17,2470,'DOM ELISEU'),(1,17,2471,'ELDORADO DOS CARAJAS'),(1,17,2472,'FARO'),(1,17,2473,'FLORESTA DO ARAGUAIA'),(1,17,2474,'GARRAFAO DO NORTE'),(1,17,2475,'GOIANESIA DO PARA'),(1,17,2476,'GURUPA'),(1,17,2477,'IGARAPE-ACU'),(1,17,2478,'IGARAPE-MIRI'),(1,17,2479,'INHANGAPI'),(1,17,2480,'IPIXUNA DO PARA'),(1,17,2481,'IRITUIA'),(1,17,2482,'ITAITUBA'),(1,17,2483,'ITUPIRANGA'),(1,17,2484,'JACAREACANGA'),(1,17,2485,'JACUNDA'),(1,17,2486,'JURUTI'),(1,17,2487,'LIMOEIRO DO AJURU'),(1,17,2488,'MAE DO RIO'),(1,17,2489,'MAGALHAES BARATA'),(1,17,2490,'MARABA'),(1,17,2491,'MARACANA'),(1,17,2492,'MARAPANIM'),(1,17,2493,'MARITUBA'),(1,17,2494,'MEDICILANDIA'),(1,17,2495,'MELGACO'),(1,17,2496,'MOCAJUBA'),(1,17,2497,'MOJU'),(1,17,2498,'MONTE ALEGRE'),(1,17,2499,'MUANA'),(1,17,2500,'NOVA ESPERANCA DO PIRIA'),(1,17,2501,'NOVA IPIXUNA'),(1,17,2502,'NOVA TIMBOTEUA'),(1,17,2503,'NOVO PROGRESSO'),(1,17,2504,'NOVO REPARTIMENTO'),(1,17,2505,'OBIDOS'),(1,17,2506,'OEIRAS DO PARA'),(1,17,2507,'ORIXIMINA'),(1,17,2508,'OUREM'),(1,17,2509,'OURILANDIA DO NORTE'),(1,17,2510,'PACAJA'),(1,17,2511,'PALESTINA DO PARA'),(1,17,2512,'PARAGOMINAS'),(1,17,2513,'PARAUAPEBAS'),(1,17,2514,'PAU DARCO'),(1,17,2515,'PEIXE BOI'),(1,17,2516,'PICARRA'),(1,17,2517,'PLACAS'),(1,17,2518,'PONTA DE PEDRAS'),(1,17,2519,'PORTEL'),(1,17,2520,'PORTO DE MOZ'),(1,17,2521,'PRAINHA'),(1,17,2522,'PRIMAVERA'),(1,17,2523,'QUATIPURU'),(1,17,2524,'REDENCAO'),(1,17,2525,'RIO MARIA'),(1,17,2526,'RONDON DO PARA'),(1,17,2527,'RUROPOLIS'),(1,17,2528,'SALINOPOLIS'),(1,17,2529,'SALVATERRA'),(1,17,2530,'SANTA BARBARA DO PARA'),(1,17,2531,'SANTA CRUZ DO ARARI'),(1,17,2532,'SANTA ISABEL DO PARA'),(1,17,2533,'SANTA LUZIA DO PARA'),(1,17,2534,'SANTA MARIA DAS BARREIRAS'),(1,17,2535,'SANTA MARIA DO PARA'),(1,17,2536,'SANTANA DO ARAGUAIA'),(1,17,2537,'SANTAREM'),(1,17,2538,'SANTAREM NOVO'),(1,17,2539,'SANTO ANTONIO DO TAUA'),(1,17,2540,'SAO CAETANO DE ODIVELAS'),(1,17,2541,'SAO DOMINGOS DO ARAGUAIA'),(1,17,2542,'SAO DOMINGOS DO CAPIM'),(1,17,2543,'SAO FELIX DO XINGU'),(1,17,2544,'SAO FRANCISCO DO PARA'),(1,17,2545,'SAO GERALDO DO ARAGUAIA'),(1,17,2546,'SAO JOAO DA PONTA'),(1,17,2547,'SAO JOAO DE PIRABAS'),(1,17,2548,'SAO JOAO DO ARAGUAIA'),(1,17,2549,'SAO MIGUEL DO GUAMA'),(1,17,2550,'SAO SEBASTIAO DA BOA VISTA'),(1,17,2551,'SAPUCAIA'),(1,17,2552,'SENADOR JOSE PORFIRIO'),(1,17,2553,'SOURE'),(1,17,2554,'TAILANDIA'),(1,17,2555,'TERRA ALTA'),(1,17,2556,'TERRA SANTA'),(1,17,2557,'TOME-ACU'),(1,17,2558,'TRACUATEUA'),(1,17,2559,'TRAIRAO'),(1,17,2560,'TUCUMA'),(1,17,2561,'TUCURUI'),(1,17,2562,'ULIANOPOLIS'),(1,17,2563,'URUARA'),(1,17,2564,'VIGIA'),(1,17,2565,'VISEU'),(1,17,2566,'VITORIA DO XINGU'),(1,17,2567,'XINGUARA'),(1,18,2568,'AGUA BRANCA'),(1,18,2569,'AGUIAR'),(1,18,2570,'ALAGOA GRANDE'),(1,18,2571,'ALAGOA NOVA'),(1,18,2572,'ALAGOINHA'),(1,18,2573,'ALCANTIL'),(1,18,2574,'ALGODAO DE JANDAIRA'),(1,18,2575,'ALHANDRA'),(1,18,2576,'AMPARO'),(1,18,2577,'APARECIDA'),(1,18,2578,'ARACAGI'),(1,18,2579,'ARARA'),(1,18,2580,'ARARUNA'),(1,18,2581,'AREIA'),(1,18,2582,'AREIA DE BARAUNAS'),(1,18,2583,'AREIAL'),(1,18,2584,'AROEIRAS'),(1,18,2585,'ASSUNCAO'),(1,18,2586,'BAIA DA TRAICAO'),(1,18,2587,'BANANEIRAS'),(1,18,2588,'BARAUNA'),(1,18,2589,'BARRA DE SANTA ROSA'),(1,18,2590,'BARRA DE SANTANA'),(1,18,2591,'BARRA DE SAO MIGUEL'),(1,18,2592,'BAYEUX'),(1,18,2593,'BELEM'),(1,18,2594,'BELEM DO BREJO DO CRUZ'),(1,18,2595,'BERNARDINO BATISTA'),(1,18,2596,'BOA VENTURA'),(1,18,2597,'BOA VISTA'),(1,18,2598,'BOM JESUS'),(1,18,2599,'BOM SUCESSO'),(1,18,2600,'BONITO DE SANTA FE'),(1,18,2601,'BOQUEIRAO'),(1,18,2602,'BORBOREMA'),(1,18,2603,'BREJO DO CRUZ'),(1,18,2604,'BREJO DOS SANTOS'),(1,18,2605,'CAAPORA'),(1,18,2606,'CABACEIRAS'),(1,18,2607,'CABEDELO'),(1,18,2608,'CACHOEIRA DOS INDIOS'),(1,18,2609,'CACIMBA DE AREIA'),(1,18,2610,'CACIMBA DE DENTRO'),(1,18,2611,'CACIMBAS'),(1,18,2612,'CAICARA'),(1,18,2613,'CAJAZEIRAS'),(1,18,2614,'CAJAZEIRINHAS'),(1,18,2615,'CALDAS BRANDAO'),(1,18,2616,'CAMALAU'),(1,18,2617,'CAMPINA GRANDE'),(1,18,2618,'CAMPO DE SANTANA'),(1,18,2619,'CAPIM'),(1,18,2620,'CARAUBAS'),(1,18,2621,'CARRAPATEIRA'),(1,18,2622,'CASSERENGUE'),(1,18,2623,'CATINGUEIRA'),(1,18,2624,'CATOLE DO ROCHA'),(1,18,2625,'CATURITE'),(1,18,2626,'CONCEICAO'),(1,18,2627,'CONDADO'),(1,18,2628,'CONDE'),(1,18,2629,'CONGO'),(1,18,2630,'COREMAS'),(1,18,2631,'COXIXOLA'),(1,18,2632,'CRUZ DO ESPIRITO SANTO'),(1,18,2633,'CUBATI'),(1,18,2634,'CUITE'),(1,18,2635,'CUITE DE MAMANGUAPE'),(1,18,2636,'CUITEGI'),(1,18,2637,'CURRAL DE CIMA'),(1,18,2638,'CURRAL VELHO'),(1,18,2639,'DAMIAO'),(1,18,2640,'DESTERRO'),(1,18,2641,'DIAMANTE'),(1,18,2642,'DONA INES'),(1,18,2643,'DUAS ESTRADAS'),(1,18,2644,'EMAS'),(1,18,2645,'ESPERANCA'),(1,18,2646,'FAGUNDES'),(1,18,2647,'FREI MARTINHO'),(1,18,2648,'GADO BRAVO'),(1,18,2649,'GUARABIRA'),(1,18,2650,'GURINHEM'),(1,18,2651,'GURJAO'),(1,18,2652,'IBIARA'),(1,18,2653,'IGARACY'),(1,18,2654,'IMACULADA'),(1,18,2655,'INGA'),(1,18,2656,'ITABAIANA'),(1,18,2657,'ITAPORANGA'),(1,18,2658,'ITAPOROROCA'),(1,18,2659,'ITATUBA'),(1,18,2660,'JACARAU'),(1,18,2661,'JERICO'),(1,18,2662,'JOAO PESSOA'),(1,18,2663,'JUAREZ TAVORA'),(1,18,2664,'JUAZEIRINHO'),(1,18,2665,'JUNCO DO SERIDO'),(1,18,2666,'JURIPIRANGA'),(1,18,2667,'JURU'),(1,18,2668,'LAGOA'),(1,18,2669,'LAGOA DE DENTRO'),(1,18,2670,'LAGOA SECA'),(1,18,2671,'LASTRO'),(1,18,2672,'LIVRAMENTO'),(1,18,2673,'LOGRADOURO'),(1,18,2674,'LUCENA'),(1,18,2675,'MAE DAGUA'),(1,18,2676,'MALTA'),(1,18,2677,'MAMANGUAPE'),(1,18,2678,'MANAIRA'),(1,18,2679,'MARCACAO'),(1,18,2680,'MARI'),(1,18,2681,'MARIZOPOLIS'),(1,18,2682,'MASSARANDUBA'),(1,18,2683,'MATARACA'),(1,18,2684,'MATINHAS'),(1,18,2685,'MATO GROSSO'),(1,18,2686,'MATUREIA'),(1,18,2687,'MOGEIRO'),(1,18,2688,'MONTADAS'),(1,18,2689,'MONTE HOREBE'),(1,18,2690,'MONTEIRO'),(1,18,2691,'MULUNGU'),(1,18,2692,'NATUBA'),(1,18,2693,'NAZAREZINHO'),(1,18,2694,'NOVA FLORESTA'),(1,18,2695,'NOVA OLINDA'),(1,18,2696,'NOVA PALMEIRA'),(1,18,2697,'OLHO DAGUA'),(1,18,2698,'OLIVEDOS'),(1,18,2699,'OURO VELHO'),(1,18,2700,'PARARI'),(1,18,2701,'PASSAGEM'),(1,18,2702,'PATOS'),(1,18,2703,'PAULISTA'),(1,18,2704,'PEDRA BRANCA'),(1,18,2705,'PEDRA LAVRADA'),(1,18,2706,'PEDRAS DE FOGO'),(1,18,2707,'PEDRO REGIS'),(1,18,2708,'PIANCO'),(1,18,2709,'PICUI'),(1,18,2710,'PILAR'),(1,18,2711,'PILOES'),(1,18,2712,'PILOEZINHOS'),(1,18,2713,'PIRPIRITUBA'),(1,18,2714,'PITIMBU'),(1,18,2715,'POCINHOS'),(1,18,2716,'POCO DANTAS'),(1,18,2717,'POCO DE JOSE DE MOURA'),(1,18,2718,'POMBAL'),(1,18,2719,'PRATA'),(1,18,2720,'PRINCESA ISABEL'),(1,18,2721,'PUXINANA'),(1,18,2722,'QUEIMADAS'),(1,18,2723,'QUIXABA'),(1,18,2724,'REMIGIO'),(1,18,2725,'RIACHAO'),(1,18,2726,'RIACHAO DO BACAMARTE'),(1,18,2727,'RIACHAO DO POCO'),(1,18,2728,'RIACHO DE SANTO ANTONIO'),(1,18,2729,'RIACHO DOS CAVALOS'),(1,18,2730,'RIO TINTO'),(1,18,2731,'SALGADINHO'),(1,18,2732,'SALGADO DE SAO FELIX'),(1,18,2733,'SANTA CECILIA'),(1,18,2734,'SANTA CRUZ'),(1,18,2735,'SANTA HELENA'),(1,18,2736,'SANTA INES'),(1,18,2737,'SANTA LUZIA'),(1,18,2738,'SANTA RITA'),(1,18,2739,'SANTA TERESINHA'),(1,18,2740,'SANTANA DE MANGUEIRA'),(1,18,2741,'SANTANA DOS GARROTES'),(1,18,2742,'SANTAREM'),(1,18,2743,'SANTO ANDRE'),(1,18,2744,'SÃO BENTINHO'),(1,18,2745,'SAO BENTO'),(1,18,2746,'SAO DOMINGOS DE POMBAL'),(1,18,2747,'SAO DOMINGOS DO CARIRI'),(1,18,2748,'SAO FRANCISCO'),(1,18,2749,'SAO JOAO DO CARIRI'),(1,18,2750,'SAO JOAO DO RIO DO PEIXE'),(1,18,2751,'SAO JOAO DO TIGRE'),(1,18,2752,'SAO JOSE DA LAGOA TAPADA'),(1,18,2753,'SAO JOSE DE CAIANA'),(1,18,2754,'SAO JOSE DE ESPINHARAS'),(1,18,2755,'SAO JOSE DE PIRANHAS'),(1,18,2756,'SAO JOSE DE PRINCESA'),(1,18,2757,'SAO JOSE DO BONFIM'),(1,18,2758,'SAO JOSE DO BREJO DO CRUZ'),(1,18,2759,'SAO JOSE DO SABUGI'),(1,18,2760,'SAO JOSE DOS CORDEIROS'),(1,18,2761,'SAO JOSE DOS RAMOS'),(1,18,2762,'SAO MAMEDE'),(1,18,2763,'SAO MIGUEL DE TAIPU'),(1,18,2764,'SAO SEBASTIAO DE LAGOA DE ROCA'),(1,18,2765,'SAO SEBASTIAO DO UMBUZEIRO'),(1,18,2766,'SAPE'),(1,18,2767,'SERIDO'),(1,18,2768,'SERRA BRANCA'),(1,18,2769,'SERRA DA RAIZ'),(1,18,2770,'SERRA GRANDE'),(1,18,2771,'SERRA REDONDA'),(1,18,2772,'SERRARIA'),(1,18,2773,'SERTAOZINHO'),(1,18,2774,'SOBRADO'),(1,18,2775,'SOLANEA'),(1,18,2776,'SOLEDADE'),(1,18,2777,'SOSSEGO'),(1,18,2778,'SOUSA'),(1,18,2779,'SUME'),(1,18,2780,'TAPEROA'),(1,18,2781,'TAVARES'),(1,18,2782,'TEIXEIRA'),(1,18,2783,'TENORIO'),(1,18,2784,'TRIUNFO'),(1,18,2785,'UIRAUNA'),(1,18,2786,'UMBUZEIRO'),(1,18,2787,'VARZEA'),(1,18,2788,'VIEIROPOLIS'),(1,18,2789,'VISTA SERRANA'),(1,18,2790,'ZABELE'),(1,20,2791,'ABREU E LIMA'),(1,20,2792,'AFOGADOS DA INGAZEIRA'),(1,20,2793,'AFRANIO'),(1,20,2794,'AGRESTINA'),(1,20,2795,'AGUA PRETA'),(1,20,2796,'AGUAS BELAS'),(1,20,2797,'ALAGOINHA'),(1,20,2798,'ALIANCA'),(1,20,2799,'ALTINHO'),(1,20,2800,'AMARAJI'),(1,20,2801,'ANGELIM'),(1,20,2802,'ARACOIABA'),(1,20,2803,'ARARIPINA'),(1,20,2804,'ARCOVERDE'),(1,20,2805,'BARRA DE GUABIRABA'),(1,20,2806,'BARREIROS'),(1,20,2807,'BELEM DE MARIA'),(1,20,2808,'BELEM DE SAO FRANCISCO'),(1,20,2809,'BELO JARDIM'),(1,20,2810,'BETANIA'),(1,20,2811,'BEZERROS'),(1,20,2812,'BODOCO'),(1,20,2813,'BOM CONSELHO'),(1,20,2814,'BOM JARDIM'),(1,20,2815,'BONITO'),(1,20,2816,'BREJAO'),(1,20,2817,'BREJINHO'),(1,20,2818,'BREJO DA MADRE DE DEUS'),(1,20,2819,'BUENOS AIRES'),(1,20,2820,'BUIQUE'),(1,20,2821,'CABO DE SANTO AGOSTINHO'),(1,20,2822,'CABROBO'),(1,20,2823,'CACHOEIRINHA'),(1,20,2824,'CAETES'),(1,20,2825,'CALCADO'),(1,20,2826,'CALUMBI'),(1,20,2827,'CAMARAGIBE'),(1,20,2828,'CAMOCIM DE SAO FELIX'),(1,20,2829,'CAMUTANGA'),(1,20,2830,'CANHOTINHO'),(1,20,2831,'CAPOEIRAS'),(1,20,2832,'CARNAIBA'),(1,20,2833,'CARNAUBEIRAS DA PENHA'),(1,20,2834,'CARPINA'),(1,20,2835,'CARUARU'),(1,20,2836,'CASINHAS'),(1,20,2837,'CATENDE'),(1,20,2838,'CEDRO'),(1,20,2839,'CHA DE ALEGRIA'),(1,20,2840,'CHA GRANDE'),(1,20,2841,'CONDADO'),(1,20,2842,'CORRENTES'),(1,20,2843,'CORTES'),(1,20,2844,'CUMARU'),(1,20,2845,'CUPIRA'),(1,20,2846,'CUSTODIA'),(1,20,2847,'DORMENTES'),(1,20,2848,'ESCADA'),(1,20,2849,'EXU'),(1,20,2850,'FEIRA NOVA'),(1,20,2851,'FERREIROS'),(1,20,2852,'FLORES'),(1,20,2853,'FLORESTA'),(1,20,2854,'FREI MIGUELINHO'),(1,20,2855,'GAMELEIRA'),(1,20,2856,'GARANHUNS'),(1,20,2857,'GLORIA DO GOITA'),(1,20,2858,'GOIANA'),(1,20,2859,'GRANITO'),(1,20,2860,'GRAVATA'),(1,20,2861,'IATI'),(1,20,2862,'IBIMIRIM'),(1,20,2863,'IBIRAJUBA'),(1,20,2864,'IGARASSU'),(1,20,2865,'IGUARACI'),(1,20,2866,'ILHA DE ITAMARACA'),(1,20,2867,'INAJA'),(1,20,2868,'INGAZEIRA'),(1,20,2869,'IPOJUCA'),(1,20,2870,'IPUBI'),(1,20,2871,'ITACURUBA'),(1,20,2872,'ITAIBA'),(1,20,2873,'ITAMBE'),(1,20,2874,'ITAPETIM'),(1,20,2875,'ITAPISSUMA'),(1,20,2876,'ITAQUITINGA'),(1,20,2877,'JABOATAO DOS GUARARAPES'),(1,20,2878,'JAQUEIRA'),(1,20,2879,'JATAUBA'),(1,20,2880,'JATOBA'),(1,20,2881,'JOAO ALFREDO'),(1,20,2882,'JOAQUIM NABUCO'),(1,20,2883,'JUCATI'),(1,20,2884,'JUPI'),(1,20,2885,'JUREMA'),(1,20,2886,'LAGOA DO CARRO'),(1,20,2887,'LAGOA DO ITAENGA'),(1,20,2888,'LAGOA DO OURO'),(1,20,2889,'LAGOA DOS GATOS'),(1,20,2890,'LAGOA GRANDE'),(1,20,2891,'LAJEDO'),(1,20,2892,'LIMOEIRO'),(1,20,2893,'MACAPARANA'),(1,20,2894,'MACHADOS'),(1,20,2895,'MANARI'),(1,20,2896,'MARAIAL'),(1,20,2897,'MIRANDIBA'),(1,20,2898,'MOREILANDIA'),(1,20,2899,'MORENO'),(1,20,2900,'NAZARE DA MATA'),(1,20,2901,'OLINDA'),(1,20,2902,'OROBO'),(1,20,2903,'OROCO'),(1,20,2904,'OURICURI'),(1,20,2905,'PALMARES'),(1,20,2906,'PALMEIRINA'),(1,20,2907,'PANELAS'),(1,20,2908,'PARANATAMA'),(1,20,2909,'PARNAMIRIM'),(1,20,2910,'PASSIRA'),(1,20,2911,'PAUDALHO'),(1,20,2912,'PAULISTA'),(1,20,2913,'PEDRA'),(1,20,2914,'PESQUEIRA'),(1,20,2915,'PETROLANDIA'),(1,20,2916,'PETROLINA'),(1,20,2917,'POCAO'),(1,20,2918,'POMBOS'),(1,20,2919,'PRIMAVERA'),(1,20,2920,'QUIPAPA'),(1,20,2921,'QUIXABA'),(1,20,2922,'RIACHO DAS ALMAS'),(1,20,2923,'RIBEIRAO'),(1,20,2924,'RIO FORMOSO'),(1,20,2925,'SAIRE'),(1,20,2926,'SALGADINHO'),(1,20,2927,'SALGUEIRO'),(1,20,2928,'SALOA'),(1,20,2929,'SANHARO'),(1,20,2930,'SANTA CRUZ'),(1,20,2931,'SANTA CRUZ DA BAIXA VERDE'),(1,20,2932,'SANTA CRUZ DO CAPIBARIBE'),(1,20,2933,'SANTA FILOMENA'),(1,20,2934,'SANTA MARIA DA BOA VISTA'),(1,20,2935,'SANTA MARIA DO CAMBUCA'),(1,20,2936,'SANTA TEREZINHA'),(1,20,2937,'SAO BENEDITO DO SUL'),(1,20,2938,'SAO BENTO DO UNA'),(1,20,2939,'SAO CAITANO'),(1,20,2940,'SAO JOAO'),(1,20,2941,'SAO JOAQUIM DO MONTE'),(1,20,2942,'SAO JOSE DA COROA GRANDE'),(1,20,2943,'SAO JOSE DO BELMONTE'),(1,20,2944,'SAO JOSE DO EGITO'),(1,20,2945,'SAO LOURENCO DA MATA'),(1,20,2946,'SAO VICENTE FERRER'),(1,20,2947,'SERRA TALHADA'),(1,20,2948,'SERRITA'),(1,20,2949,'SERTANIA'),(1,20,2950,'SIRINHAEM'),(1,20,2951,'SOLIDAO'),(1,20,2952,'SURUBIM'),(1,20,2953,'TABIRA'),(1,20,2954,'TACAIMBO'),(1,20,2955,'TACARATU'),(1,20,2956,'TAMANDARE'),(1,20,2957,'TAQUARITINGA DO NORTE'),(1,20,2958,'TEREZINHA'),(1,20,2959,'TERRA NOVA'),(1,20,2960,'TIMBAUBA'),(1,20,2961,'TORITAMA'),(1,20,2962,'TRACUNHAEM'),(1,20,2963,'TRINDADE'),(1,20,2964,'TRIUNFO'),(1,20,2965,'TUPANATINGA'),(1,20,2966,'TUPARETAMA'),(1,20,2967,'VENTUROSA'),(1,20,2968,'VERDEJANTE'),(1,20,2969,'VERTENTE DO LERIO'),(1,20,2970,'VERTENTES'),(1,20,2971,'VICENCIA'),(1,20,2972,'VITORIA DE SANTO ANTAO'),(1,20,2973,'XEXEU'),(1,21,2974,'ACAUA'),(1,21,2975,'AGRICOLANDIA'),(1,21,2976,'AGUA BRANCA'),(1,21,2977,'ALAGOINHA DO PIAUI'),(1,21,2978,'ALEGRETE DO PIAUI'),(1,21,2979,'ALTO LONGA'),(1,21,2980,'ALTOS'),(1,21,2981,'ALVORADA DO GURGUEIA'),(1,21,2982,'AMARANTE'),(1,21,2983,'ANGICAL DO PIAUI'),(1,21,2984,'ANISIO DE ABREU'),(1,21,2985,'ANTONIO ALMEIDA'),(1,21,2986,'AROAZES'),(1,21,2987,'AROEIRAS DO ITAIM'),(1,21,2988,'ARRAIAL'),(1,21,2989,'ASSUNCAO DO PIAUI'),(1,21,2990,'AVELINO LOPES'),(1,21,2991,'BAIXA GRANDE DO RIBEIRO'),(1,21,2992,'BARRA DALCANTARA'),(1,21,2993,'BARRAS'),(1,21,2994,'BARREIRAS DO PIAUI'),(1,21,2995,'BARRO DURO'),(1,21,2996,'BATALHA'),(1,21,2997,'BELA VISTA DO PIAUI'),(1,21,2998,'BELEM DO PIAUI'),(1,21,2999,'BENEDITINOS'),(1,21,3000,'BERTOLINIA'),(1,21,3001,'BETANIA DO PIAUI'),(1,21,3002,'BOA HORA'),(1,21,3003,'BOCAINA'),(1,21,3004,'BOM JESUS'),(1,21,3005,'BOM PRINCIPIO DO PIAUI'),(1,21,3006,'BONFIM DO PIAUI'),(1,21,3007,'BOQUEIRAO DO PIAUI'),(1,21,3008,'BRASILEIRA'),(1,21,3009,'BREJO DO PIAUI'),(1,21,3010,'BURITI DOS LOPES'),(1,21,3011,'BURITI DOS MONTES'),(1,21,3012,'CABECEIRAS DO PIAUI'),(1,21,3013,'CAJAZEIRAS DO PIAUI'),(1,21,3014,'CAJUEIRO DA PRAIA'),(1,21,3015,'CALDEIRAO GRANDE DO PIAUI'),(1,21,3016,'CAMPINAS DO PIAUI'),(1,21,3017,'CAMPO ALEGRE DO FIDALGO'),(1,21,3018,'CAMPO GRANDE DO PIAUI'),(1,21,3019,'CAMPO LARGO DO PIAUI'),(1,21,3020,'CAMPO MAIOR'),(1,21,3021,'CANAVIEIRA'),(1,21,3022,'CANTO DO BURITI'),(1,21,3023,'CAPITAO DE CAMPOS'),(1,21,3024,'CAPITAO GERVASIO OLIVEIRA'),(1,21,3025,'CARACOL'),(1,21,3026,'CARAUBAS DO PIAUI'),(1,21,3027,'CARIDADE DO PIAUI'),(1,21,3028,'CASTELO DO PIAUI'),(1,21,3029,'CAXINGO'),(1,21,3030,'COCAL'),(1,21,3031,'COCAL DE TELHA'),(1,21,3032,'COCAL DOS ALVES'),(1,21,3033,'COIVARAS'),(1,21,3034,'COLONIA DO GURGUEIA'),(1,21,3035,'COLONIA DO PIAUI'),(1,21,3036,'CONCEICAO DO CANINDE'),(1,21,3037,'CORONEL JOSE DIAS'),(1,21,3038,'CORRENTE'),(1,21,3039,'CRISTALANDIA DO PIAUI'),(1,21,3040,'CRISTINO CASTRO'),(1,21,3041,'CURIMATA'),(1,21,3042,'CURRAIS'),(1,21,3043,'CURRAL NOVO DO PIAUI'),(1,21,3044,'CURRALINHOS'),(1,21,3045,'DEMERVAL LOBAO'),(1,21,3046,'DIRCEU ARCOVERDE'),(1,21,3047,'DOM EXPEDITO LOPES'),(1,21,3048,'DOM INOCENCIO'),(1,21,3049,'DOMINGOS MOURAO'),(1,21,3050,'ELESBAO VELOSO'),(1,21,3051,'ELISEU MARTINS'),(1,21,3052,'ESPERANTINA'),(1,21,3053,'FARTURA DO PIAUI'),(1,21,3054,'FLORES DO PIAUI'),(1,21,3055,'FLORESTA DO PIAUI'),(1,21,3056,'FLORIANO'),(1,21,3057,'FRANCINOPOLIS'),(1,21,3058,'FRANCISCO AYRES'),(1,21,3059,'FRANCISCO MACEDO'),(1,21,3060,'FRANCISCO SANTOS'),(1,21,3061,'FRONTEIRAS'),(1,21,3062,'GEMINIANO'),(1,21,3063,'GILBUES'),(1,21,3064,'GUADALUPE'),(1,21,3065,'GUARIBAS'),(1,21,3066,'HUGO NAPOLEAO'),(1,21,3067,'ILHA GRANDE'),(1,21,3068,'INHUMA'),(1,21,3069,'IPIRANGA DO PIAUI'),(1,21,3070,'ISAIAS COELHO'),(1,21,3071,'ITAINOPOLIS'),(1,21,3072,'ITAUEIRA'),(1,21,3073,'JACOBINA DO PIAUI'),(1,21,3074,'JAICOS'),(1,21,3075,'JARDIM DO MULATO'),(1,21,3076,'JATOBA DO PIAUI'),(1,21,3077,'JERUMENHA'),(1,21,3078,'JOAO COSTA'),(1,21,3079,'JOAQUIM PIRES'),(1,21,3080,'JOCA MARQUES'),(1,21,3081,'JOSE DE FREITAS'),(1,21,3082,'JUAZEIRO DO PIAUI'),(1,21,3083,'JULIO BORGES'),(1,21,3084,'JUREMA'),(1,21,3085,'LAGOA ALEGRE'),(1,21,3086,'LAGOA DE SAO FRANCISCO'),(1,21,3087,'LAGOA DO BARRO DO PIAUI'),(1,21,3088,'LAGOA DO PIAUI'),(1,21,3089,'LAGOA DO SITIO'),(1,21,3090,'LAGOINHA DO PIAUI'),(1,21,3091,'LANDRI SALES'),(1,21,3092,'LUIS CORREIA'),(1,21,3093,'LUZILANDIA'),(1,21,3094,'MADEIRO'),(1,21,3095,'MANOEL EMIDIO'),(1,21,3096,'MARCOLANDIA'),(1,21,3097,'MARCOS PARENTE'),(1,21,3098,'MASSAPE DO PIAUI'),(1,21,3099,'MATIAS OLIMPIO'),(1,21,3100,'MIGUEL ALVES'),(1,21,3101,'MIGUEL LEAO'),(1,21,3102,'MILTON BRANDAO'),(1,21,3103,'MONSENHOR GIL'),(1,21,3104,'MONSENHOR HIPOLITO'),(1,21,3105,'MONTE ALEGRE DO PIAUI'),(1,21,3106,'MORRO CABECA NO TEMPO'),(1,21,3107,'MORRO DO CHAPEU DO PIAUI'),(1,21,3108,'MURICI DOS PORTELAS'),(1,21,3109,'NAZARE DO PIAUI'),(1,21,3110,'NOSSA SENHORA DE NAZARE'),(1,21,3111,'NOSSA SENHORA DOS REMEDIOS'),(1,21,3112,'NOVA SANTA RITA'),(1,21,3113,'NOVO ORIENTE DO PIAUI'),(1,21,3114,'NOVO SANTO ANTONIO'),(1,21,3115,'OEIRAS'),(1,21,3116,'OLHO DAGUA DO PIAUI'),(1,21,3117,'PADRE MARCOS'),(1,21,3118,'PAES LANDIM'),(1,21,3119,'PAJEU DO PIAUI'),(1,21,3120,'PALMEIRA DO PIAUI'),(1,21,3121,'PALMEIRAIS'),(1,21,3122,'PAQUETA'),(1,21,3123,'PARNAGUA'),(1,21,3124,'PARNAIBA'),(1,21,3125,'PASSAGEM FRANCA DO PIAUI'),(1,21,3126,'PATOS DO PIAUI'),(1,21,3127,'PAU DARCO DO PIAUI'),(1,21,3128,'PAULISTANA'),(1,21,3129,'PAVUSSU'),(1,21,3130,'PEDRO II'),(1,21,3131,'PEDRO LAURENTINO'),(1,21,3132,'PICOS'),(1,21,3133,'PIMENTEIRAS'),(1,21,3134,'PIO IX'),(1,21,3135,'PIRACURUCA'),(1,21,3136,'PIRIPIRI'),(1,21,3137,'PORTO'),(1,21,3138,'PORTO ALEGRE DO PIAUI'),(1,21,3139,'PRATA DO PIAUI'),(1,21,3140,'QUEIMADA NOVA'),(1,21,3141,'REDENCAO DO GURGUEIA'),(1,21,3142,'REGENERACAO'),(1,21,3143,'RIACHO FRIO'),(1,21,3144,'RIBEIRA DO PIAUI'),(1,21,3145,'RIBEIRO GONCALVES'),(1,21,3146,'RIO GRANDE DO PIAUI'),(1,21,3147,'SANTA CRUZ DO PIAUI'),(1,21,3148,'SANTA CRUZ DOS MILAGRES'),(1,21,3149,'SANTA FILOMENA'),(1,21,3150,'SANTA LUZ'),(1,21,3151,'SANTA ROSA DO PIAUI'),(1,21,3152,'SANTANA DO PIAUI'),(1,21,3153,'SANTO ANTONIO DE LISBOA'),(1,21,3154,'SANTO ANTONIO DOS MILAGRES'),(1,21,3155,'SANTO INACIO DO PIAUI'),(1,21,3156,'SAO BRAZ DO PIAUI'),(1,21,3157,'SAO FELIX DO PIAUI'),(1,21,3158,'SAO FRANCISCO DE ASSIS DO PIAUI'),(1,21,3159,'SAO FRANCISCO DO PIAUI'),(1,21,3160,'SAO GONCALO DO GURGUEIA'),(1,21,3161,'SAO GONCALO DO PIAUI'),(1,21,3162,'SAO JOAO DA CANABRAVA'),(1,21,3163,'SAO JOAO DA FRONTEIRA'),(1,21,3164,'SAO JOAO DA SERRA'),(1,21,3165,'SAO JOAO DA VARJOTA'),(1,21,3166,'SAO JOAO DO ARRAIAL'),(1,21,3167,'SAO JOAO DO PIAUI'),(1,21,3168,'SAO JOSE DO DIVINO'),(1,21,3169,'SAO JOSE DO PEIXE'),(1,21,3170,'SAO JOSE DO PIAUI'),(1,21,3171,'SAO JULIAO'),(1,21,3172,'SAO LOURENCO DO PIAUI'),(1,21,3173,'SAO LUIS DO PIAUI'),(1,21,3174,'SAO MIGUEL DA BAIXA GRANDE'),(1,21,3175,'SAO MIGUEL DO FIDALGO'),(1,21,3176,'SAO MIGUEL DO TAPUIO'),(1,21,3177,'SAO PEDRO DO PIAUI'),(1,21,3178,'SAO RAIMUNDO NONATO'),(1,21,3179,'SEBASTIAO BARROS'),(1,21,3180,'SEBASTIAO LEAL'),(1,21,3181,'SIGEFREDO PACHECO'),(1,21,3182,'SIMOES'),(1,21,3183,'SIMPLICIO MENDES'),(1,21,3184,'SOCORRO DO PIAUI'),(1,21,3185,'SUSSUAPARA'),(1,21,3186,'TAMBORIL DO PIAUI'),(1,21,3187,'TANQUE DO PIAUI'),(1,21,3188,'TERESINA'),(1,21,3189,'UNIAO'),(1,21,3190,'URUCUI'),(1,21,3191,'VALENCA DO PIAUI'),(1,21,3192,'VARZEA BRANCA'),(1,21,3193,'VARZEA GRANDE'),(1,21,3194,'VERA MENDES'),(1,21,3195,'VILA NOVA DO PIAUI'),(1,21,3196,'WALL FERRAZ'),(1,19,3197,'ABATIA'),(1,19,3198,'ADRIANOPOLIS'),(1,19,3199,'AGUDOS DO SUL'),(1,19,3200,'ALMIRANTE TAMANDARE'),(1,19,3201,'ALTAMIRA DO PARANA'),(1,19,3202,'ALTO PARANA'),(1,19,3203,'ALTO PIQUIRI'),(1,19,3204,'ALTONIA'),(1,19,3205,'ALVORADA DO SUL'),(1,19,3206,'AMAPORA'),(1,19,3207,'AMPERE'),(1,19,3208,'ANAHY'),(1,19,3209,'ANDIRA'),(1,19,3210,'ANGULO'),(1,19,3211,'ANTONINA'),(1,19,3212,'ANTONIO OLINTO'),(1,19,3213,'APUCARANA'),(1,19,3214,'ARAPONGAS'),(1,19,3215,'ARAPOTI'),(1,19,3216,'ARAPUA'),(1,19,3217,'ARARUNA'),(1,19,3218,'ARAUCARIA'),(1,19,3219,'ARIRANHA DO IVAI'),(1,19,3220,'ASSAI'),(1,19,3221,'ASSIS CHATEAUBRIAND'),(1,19,3222,'ASTORGA'),(1,19,3223,'ATALAIA'),(1,19,3224,'BALSA NOVA'),(1,19,3225,'BANDEIRANTES'),(1,19,3226,'BARBOSA FERRAZ'),(1,19,3227,'BARRA DO JACARE'),(1,19,3228,'BARRACAO'),(1,19,3229,'BELA VISTA DO CAROBA'),(1,19,3230,'BELA VISTA DO PARAISO'),(1,19,3231,'BITURUNA'),(1,19,3232,'BOA ESPERANCA'),(1,19,3233,'BOA ESPERANCA DO IGUACU'),(1,19,3234,'BOA VENTURA DE SAO ROQUE'),(1,19,3235,'BOA VISTA DA APARECIDA'),(1,19,3236,'BOCAIUVA DO SUL'),(1,19,3237,'BOM JESUS DO SUL'),(1,19,3238,'BOM SUCESSO'),(1,19,3239,'BOM SUCESSO DO SUL'),(1,19,3240,'BORRAZOPOLIS'),(1,19,3241,'BRAGANEY'),(1,19,3242,'BRASILANDIA DO SUL'),(1,19,3243,'CAFEARA'),(1,19,3244,'CAFELANDIA'),(1,19,3245,'CAFEZAL DO SUL'),(1,19,3246,'CALIFORNIA'),(1,19,3247,'CAMBARA'),(1,19,3248,'CAMBE'),(1,19,3249,'CAMBIRA'),(1,19,3250,'CAMPINA DA LAGOA'),(1,19,3251,'CAMPINA DO SIMAO'),(1,19,3252,'CAMPINA GRANDE DO SUL'),(1,19,3253,'CAMPO BONITO'),(1,19,3254,'CAMPO DO TENENTE'),(1,19,3255,'CAMPO LARGO'),(1,19,3256,'CAMPO MAGRO'),(1,19,3257,'CAMPO MOURAO'),(1,19,3258,'CANDIDO DE ABREU'),(1,19,3259,'CANDOI'),(1,19,3260,'CANTAGALO'),(1,19,3261,'CAPANEMA'),(1,19,3262,'CAPITAO LEONIDAS MARQUES'),(1,19,3263,'CARAMBEI'),(1,19,3264,'CARLOPOLIS'),(1,19,3265,'CASCAVEL'),(1,19,3266,'CASTRO'),(1,19,3267,'CATANDUVAS'),(1,19,3268,'CENTENARIO DO SUL'),(1,19,3269,'CERRO AZUL'),(1,19,3270,'CEU AZUL'),(1,19,3271,'CHOPINZINHO'),(1,19,3272,'CIANORTE'),(1,19,3273,'CIDADE GAUCHA'),(1,19,3274,'CLEVELANDIA'),(1,19,3275,'COLOMBO'),(1,19,3276,'COLORADO'),(1,19,3277,'CONGONHINHAS'),(1,19,3278,'CONSELHEIRO MAIRINCK'),(1,19,3279,'CONTENDA'),(1,19,3280,'CORBELIA'),(1,19,3281,'CORNELIO PROCOPIO'),(1,19,3282,'CORONEL DOMINGOS SOARES'),(1,19,3283,'CORONEL VIVIDA'),(1,19,3284,'CORUMBATAI DO SUL'),(1,19,3285,'CRUZ MACHADO'),(1,19,3286,'CRUZEIRO DO IGUACU'),(1,19,3287,'CRUZEIRO DO OESTE'),(1,19,3288,'CRUZEIRO DO SUL'),(1,19,3289,'CRUZMALTINA'),(1,19,3290,'CURIUVA'),(1,19,3291,'DIAMANTE DO NORTE'),(1,19,3292,'DIAMANTE DO SUL'),(1,19,3293,'DIAMANTE DOESTE'),(1,19,3294,'DOIS VIZINHOS'),(1,19,3295,'DOURADINA'),(1,19,3296,'DOUTOR CAMARGO'),(1,19,3297,'DOUTOR ULYSSES'),(1,19,3298,'ENEAS MARQUES'),(1,19,3299,'ENGENHEIRO BELTRAO'),(1,19,3300,'ENTRE RIOS DO OESTE'),(1,19,3301,'ESPERANCA NOVA'),(1,19,3302,'ESPIGAO ALTO DO IGUACU'),(1,19,3303,'FAROL'),(1,19,3304,'FAXINAL'),(1,19,3305,'FAZENDA RIO GRANDE'),(1,19,3306,'FENIX'),(1,19,3307,'FERNANDES PINHEIRO'),(1,19,3308,'FIGUEIRA'),(1,19,3309,'FLOR DA SERRA DO SUL'),(1,19,3310,'FLORAI'),(1,19,3311,'FLORESTA'),(1,19,3312,'FLORESTOPOLIS'),(1,19,3313,'FLORIDA'),(1,19,3314,'FORMOSA DO OESTE'),(1,19,3315,'FOZ DO IGUACU'),(1,19,3316,'FOZ DO JORDAO'),(1,19,3317,'FRANCISCO ALVES'),(1,19,3318,'FRANCISCO BELTRAO'),(1,19,3319,'GENERAL CARNEIRO'),(1,19,3320,'GODOY MOREIRA'),(1,19,3321,'GOIOERE'),(1,19,3322,'GOIOXIM'),(1,19,3323,'GRANDES RIOS'),(1,19,3324,'GUAIRA'),(1,19,3325,'GUAIRACA'),(1,19,3326,'GUAMIRANGA'),(1,19,3327,'GUAPIRAMA'),(1,19,3328,'GUAPOREMA'),(1,19,3329,'GUARACI'),(1,19,3330,'GUARANIACU'),(1,19,3331,'GUARAPUAVA'),(1,19,3332,'GUARAQUECABA'),(1,19,3333,'GUARATUBA'),(1,19,3334,'HONORIO SERPA'),(1,19,3335,'IBAITI'),(1,19,3336,'IBEMA'),(1,19,3337,'IBIPORA'),(1,19,3338,'ICARAIMA'),(1,19,3339,'IGUARACU'),(1,19,3340,'IGUATU'),(1,19,3341,'IMBAU'),(1,19,3342,'IMBITUVA'),(1,19,3343,'INACIO MARTINS'),(1,19,3344,'INAJA'),(1,19,3345,'INDIANOPOLIS'),(1,19,3346,'IPIRANGA'),(1,19,3347,'IPORA'),(1,19,3348,'IRACEMA DO OESTE'),(1,19,3349,'IRATI'),(1,19,3350,'IRETAMA'),(1,19,3351,'ITAGUAJE'),(1,19,3352,'ITAIPULANDIA'),(1,19,3353,'ITAMBARACA'),(1,19,3354,'ITAMBE'),(1,19,3355,'ITAPEJARA DOESTE'),(1,19,3356,'ITAPERUCU'),(1,19,3357,'ITAUNA DO SUL'),(1,19,3358,'IVAI'),(1,19,3359,'IVAIPORA'),(1,19,3360,'IVATE'),(1,19,3361,'IVATUBA'),(1,19,3362,'JABOTI'),(1,19,3363,'JACAREZINHO'),(1,19,3364,'JAGUAPITA'),(1,19,3365,'JAGUARIAIVA'),(1,19,3366,'JANDAIA DO SUL'),(1,19,3367,'JANIOPOLIS'),(1,19,3368,'JAPIRA'),(1,19,3369,'JAPURA'),(1,19,3370,'JARDIM ALEGRE'),(1,19,3371,'JARDIM OLINDA'),(1,19,3372,'JATAIZINHO'),(1,19,3373,'JESUITAS'),(1,19,3374,'JOAQUIM TAVORA'),(1,19,3375,'JUNDIAI DO SUL'),(1,19,3376,'JURANDA'),(1,19,3377,'JUSSARA'),(1,19,3378,'KALORE'),(1,19,3379,'LAPA'),(1,19,3380,'LARANJAL'),(1,19,3381,'LARANJEIRAS DO SUL'),(1,19,3382,'LEOPOLIS'),(1,19,3383,'LIDIANOPOLIS'),(1,19,3384,'LINDOESTE'),(1,19,3385,'LOANDA'),(1,19,3386,'LOBATO'),(1,19,3387,'LONDRINA'),(1,19,3388,'LUIZIANA'),(1,19,3389,'LUNARDELLI'),(1,19,3390,'LUPIONOPOLIS'),(1,19,3391,'MALLET'),(1,19,3392,'MAMBORE'),(1,19,3393,'MANDAGUACU'),(1,19,3394,'MANDAGUARI'),(1,19,3395,'MANDIRITUBA'),(1,19,3396,'MANFRINOPOLIS'),(1,19,3397,'MANGUEIRINHA'),(1,19,3398,'MANOEL RIBAS'),(1,19,3399,'MARECHAL CANDIDO RONDON'),(1,19,3400,'MARIA HELENA'),(1,19,3401,'MARIALVA'),(1,19,3402,'MARILANDIA DO SUL'),(1,19,3403,'MARILENA'),(1,19,3404,'MARILUZ'),(1,19,3405,'MARINGA'),(1,19,3406,'MARIOPOLIS'),(1,19,3407,'MARIPA'),(1,19,3408,'MARMELEIRO'),(1,19,3409,'MARQUINHO'),(1,19,3410,'MARUMBI'),(1,19,3411,'MATELANDIA'),(1,19,3412,'MATINHOS'),(1,19,3413,'MATO RICO'),(1,19,3414,'MAUA DA SERRA'),(1,19,3415,'MEDIANEIRA'),(1,19,3416,'MERCEDES'),(1,19,3417,'MIRADOR'),(1,19,3418,'MIRASELVA'),(1,19,3419,'MISSAL'),(1,19,3420,'MOREIRA SALES'),(1,19,3421,'MORRETES'),(1,19,3422,'MUNHOZ DE MELO'),(1,19,3423,'NOSSA SENHORA DAS GRACAS'),(1,19,3424,'NOVA ALIANCA DO IVAI'),(1,19,3425,'NOVA AMERICA DA COLINA'),(1,19,3426,'NOVA AURORA'),(1,19,3427,'NOVA CANTU'),(1,19,3428,'NOVA ESPERANCA'),(1,19,3429,'NOVA ESPERANCA DO SUDOESTE'),(1,19,3430,'NOVA FATIMA'),(1,19,3431,'NOVA LARANJEIRAS'),(1,19,3432,'NOVA LONDRINA'),(1,19,3433,'NOVA OLIMPIA'),(1,19,3434,'NOVA PRATA DO IGUACU'),(1,19,3435,'NOVA SANTA BARBARA'),(1,19,3436,'NOVA SANTA ROSA'),(1,19,3437,'NOVA TEBAS'),(1,19,3438,'NOVO ITACOLOMI'),(1,19,3439,'ORTIGUEIRA'),(1,19,3440,'OURIZONA'),(1,19,3441,'OURO VERDE DO OESTE'),(1,19,3442,'PAICANDU'),(1,19,3443,'PALMAS'),(1,19,3444,'PALMEIRA'),(1,19,3445,'PALMITAL'),(1,19,3446,'PALOTINA'),(1,19,3447,'PARAISO DO NORTE'),(1,19,3448,'PARANACITY'),(1,19,3449,'PARANAGUA'),(1,19,3450,'PARANAPOEMA'),(1,19,3451,'PARANAVAI'),(1,19,3452,'PATO BRAGADO'),(1,19,3453,'PATO BRANCO'),(1,19,3454,'PAULA FREITAS'),(1,19,3455,'PAULO FRONTIN'),(1,19,3456,'PEABIRU'),(1,19,3457,'PEROBAL'),(1,19,3458,'PEROLA'),(1,19,3459,'PEROLA DOESTE'),(1,19,3460,'PIEN'),(1,19,3461,'PINHAIS'),(1,19,3462,'PINHAL DE SAO BENTO'),(1,19,3463,'PINHALAO'),(1,19,3464,'PINHAO'),(1,19,3465,'PIRAI DO SUL'),(1,19,3466,'PIRAQUARA'),(1,19,3467,'PITANGA'),(1,19,3468,'PITANGUEIRAS'),(1,19,3469,'PLANALTINA DO PARANA'),(1,19,3470,'PLANALTO'),(1,19,3471,'PONTA GROSSA'),(1,19,3472,'PONTAL DO PARANA'),(1,19,3473,'PORECATU'),(1,19,3474,'PORTO AMAZONAS'),(1,19,3475,'PORTO BARREIRO'),(1,19,3476,'PORTO RICO'),(1,19,3477,'PORTO VITORIA'),(1,19,3478,'PRADO FERREIRA'),(1,19,3479,'PRANCHITA'),(1,19,3480,'PRESIDENTE CASTELO BRANCO'),(1,19,3481,'PRIMEIRO DE MAIO'),(1,19,3482,'PRUDENTOPOLIS'),(1,19,3483,'QUARTO CENTENARIO'),(1,19,3484,'QUATIGUA'),(1,19,3485,'QUATRO BARRAS'),(1,19,3486,'QUATRO PONTES'),(1,19,3487,'QUEDAS DO IGUACU'),(1,19,3488,'QUERENCIA DO NORTE'),(1,19,3489,'QUINTA DO SOL'),(1,19,3490,'QUITANDINHA'),(1,19,3491,'RAMILANDIA'),(1,19,3492,'RANCHO ALEGRE'),(1,19,3493,'RANCHO ALEGRE D OESTE'),(1,19,3494,'REALEZA'),(1,19,3495,'REBOUCAS'),(1,19,3496,'RENASCENCA'),(1,19,3497,'RESERVA'),(1,19,3498,'RESERVA DO IGUACU'),(1,19,3499,'RIBEIRAO CLARO'),(1,19,3500,'RIBEIRAO DO PINHAL'),(1,19,3501,'RIO AZUL'),(1,19,3502,'RIO BOM'),(1,19,3503,'RIO BONITO DO IGUACU'),(1,19,3504,'RIO BRANCO DO IVAI'),(1,19,3505,'RIO BRANCO DO SUL'),(1,19,3506,'RIO NEGRO'),(1,19,3507,'ROLANDIA'),(1,19,3508,'RONCADOR'),(1,19,3509,'RONDON'),(1,19,3510,'ROSARIO DO IVAI'),(1,19,3511,'SABAUDIA'),(1,19,3512,'SALGADO FILHO'),(1,19,3513,'SALTO DO ITARARE'),(1,19,3514,'SALTO DO LONTRA'),(1,19,3515,'SANTA AMELIA'),(1,19,3516,'SANTA CECILIA DO PAVAO'),(1,19,3517,'SANTA CRUZ DO MONTE CASTELO'),(1,19,3518,'SANTA FE'),(1,19,3519,'SANTA HELENA'),(1,19,3520,'SANTA INES'),(1,19,3521,'SANTA ISABEL DO IVAI'),(1,19,3522,'SANTA IZABEL DO OESTE'),(1,19,3523,'SANTA LUCIA'),(1,19,3524,'SANTA MARIA DO OESTE'),(1,19,3525,'SANTA MARIANA'),(1,19,3526,'SANTA MONICA'),(1,19,3527,'SANTA TEREZA DO OESTE'),(1,19,3528,'SANTA TEREZINHA DE ITAIPU'),(1,19,3529,'SANTANA DO ITARARE'),(1,19,3530,'SANTO ANTONIO DA PLATINA'),(1,19,3531,'SANTO ANTONIO DO CAIUA'),(1,19,3532,'SANTO ANTONIO DO PARAISO'),(1,19,3533,'SANTO ANTONIO DO SUDOESTE'),(1,19,3534,'SANTO INACIO'),(1,19,3535,'SAO CARLOS DO IVAI'),(1,19,3536,'SAO JERONIMO DA SERRA'),(1,19,3537,'SAO JOAO'),(1,19,3538,'SAO JOAO DO CAIUA'),(1,19,3539,'SAO JOAO DO IVAI'),(1,19,3540,'SAO JOAO DO TRIUNFO'),(1,19,3541,'SAO JORGE DO IVAI'),(1,19,3542,'SAO JORGE DO PATROCINIO'),(1,19,3543,'SAO JORGE DOESTE'),(1,19,3544,'SAO JOSE DA BOA VISTA'),(1,19,3545,'SAO JOSE DAS PALMEIRAS'),(1,19,3546,'SAO JOSE DOS PINHAIS'),(1,19,3547,'SAO MANOEL DO PARANA'),(1,19,3548,'SAO MATEUS DO SUL'),(1,19,3549,'SAO MIGUEL DO IGUACU'),(1,19,3550,'SAO PEDRO DO IGUACU'),(1,19,3551,'SAO PEDRO DO IVAI'),(1,19,3552,'SAO PEDRO DO PARANA'),(1,19,3553,'SAO SEBASTIAO DA AMOREIRA'),(1,19,3554,'SAO TOME'),(1,19,3555,'SAPOPEMA'),(1,19,3556,'SARANDI'),(1,19,3557,'SAUDADE DO IGUACU'),(1,19,3558,'SENGES'),(1,19,3559,'SERRANOPOLIS DO IGUACU'),(1,19,3560,'SERTANEJA'),(1,19,3561,'SERTANOPOLIS'),(1,19,3562,'SIQUEIRA CAMPOS'),(1,19,3563,'SULINA'),(1,19,3564,'TAMARANA'),(1,19,3565,'TAMBOARA'),(1,19,3566,'TAPEJARA'),(1,19,3567,'TAPIRA'),(1,19,3568,'TEIXEIRA SOARES'),(1,19,3569,'TELEMACO BORBA'),(1,19,3570,'TERRA BOA'),(1,19,3571,'TERRA RICA'),(1,19,3572,'TERRA ROXA'),(1,19,3573,'TIBAGI'),(1,19,3574,'TIJUCAS DO SUL'),(1,19,3575,'TOLEDO'),(1,19,3576,'TOMAZINA'),(1,19,3577,'TRES BARRAS DO PARANA'),(1,19,3578,'TUNAS DO PARANÁ'),(1,19,3579,'TUNEIRAS DO OESTE'),(1,19,3580,'TUPASSI'),(1,19,3581,'TURVO'),(1,19,3582,'UBIRATA'),(1,19,3583,'UMUARAMA'),(1,19,3584,'UNIAO DA VITORIA'),(1,19,3585,'UNIFLOR'),(1,19,3586,'URAI'),(1,19,3587,'VENTANIA'),(1,19,3588,'VERA CRUZ DO OESTE'),(1,19,3589,'VERE'),(1,19,3590,'VILA ALTA'),(1,19,3591,'VIRMOND'),(1,19,3592,'VITORINO'),(1,19,3593,'WENCESLAU BRAZ'),(1,19,3594,'XAMBRE'),(1,2,3595,'ANGRA DOS REIS'),(1,2,3596,'APERIBE'),(1,2,3597,'ARARUAMA'),(1,2,3598,'AREAL'),(1,2,3599,'ARMACAO DE BUZIOS'),(1,2,3600,'ARRAIAL DO CABO'),(1,2,3601,'BARRA DO PIRAI'),(1,2,3602,'BARRA MANSA'),(1,2,3603,'BELFORD ROXO'),(1,2,3604,'BOM JARDIM'),(1,2,3605,'BOM JESUS DO ITABAPOANA'),(1,2,3606,'CABO FRIO'),(1,2,3607,'CACHOEIRAS DE MACACU'),(1,2,3608,'CAMBUCI'),(1,2,3609,'CAMPOS DOS GOYTACAZES'),(1,2,3610,'CANTAGALO'),(1,2,3611,'CARAPEBUS'),(1,2,3612,'CARDOSO MOREIRA'),(1,2,3613,'CARMO'),(1,2,3614,'CASIMIRO DE ABREU'),(1,2,3615,'COMENDADOR LEVY GASPARIAN'),(1,2,3616,'CONCEICAO DE MACABU'),(1,2,3617,'CORDEIRO'),(1,2,3618,'DUAS BARRAS'),(1,2,3619,'DUQUE DE CAXIAS'),(1,2,3620,'ENGENHEIRO PAULO DE FRONTIN'),(1,2,3621,'GUAPIMIRIM'),(1,2,3622,'IGUABA GRANDE'),(1,2,3623,'ITABORAI'),(1,2,3624,'ITAGUAI'),(1,2,3625,'ITALVA'),(1,2,3626,'ITAOCARA'),(1,2,3627,'ITAPERUNA'),(1,2,3628,'ITATIAIA'),(1,2,3629,'JAPERI'),(1,2,3630,'LAJE DO MURIAE'),(1,2,3631,'MACAE'),(1,2,3632,'MACUCO'),(1,2,3633,'MAGE'),(1,2,3634,'MANGARATIBA'),(1,2,3635,'MARICA'),(1,2,3636,'MENDES'),(1,2,3637,'MESQUITA'),(1,2,3638,'MIGUEL PEREIRA'),(1,2,3639,'MIRACEMA'),(1,2,3640,'NATIVIDADE'),(1,2,3641,'NILOPOLIS'),(1,2,3642,'NITEROI'),(1,2,3643,'NOVA FRIBURGO'),(1,2,3644,'NOVA IGUACU'),(1,2,3645,'PARACAMBI'),(1,2,3646,'PARAIBA DO SUL'),(1,2,3647,'PARATI'),(1,2,3648,'PATY DO ALFERES'),(1,2,3649,'PETROPOLIS'),(1,2,3650,'PINHEIRAL'),(1,2,3651,'PIRAI'),(1,2,3652,'PORCIUNCULA'),(1,2,3653,'PORTO REAL'),(1,2,3654,'QUATIS'),(1,2,3655,'QUEIMADOS'),(1,2,3656,'QUISSAMA'),(1,2,3657,'RESENDE'),(1,2,3658,'RIO BONITO'),(1,2,3659,'RIO CLARO'),(1,2,3660,'RIO DAS FLORES'),(1,2,3661,'RIO DAS OSTRAS'),(1,2,3662,'SANTA MARIA MADALENA'),(1,2,3663,'SANTO ANTONIO DE PADUA'),(1,2,3664,'SAO FIDELIS'),(1,2,3665,'SAO FRANCISCO DE ITABAPOANA'),(1,2,3666,'SAO GONCALO'),(1,2,3667,'SAO JOAO DA BARRA'),(1,2,3668,'SAO JOAO DE MERITI'),(1,2,3669,'SAO JOSE DE UBA'),(1,2,3670,'SAO JOSE DO VALE DO RIO PRETO'),(1,2,3671,'SAO PEDRO DA ALDEIA'),(1,2,3672,'SAO SEBASTIAO DO ALTO'),(1,2,3673,'SAPUCAIA'),(1,2,3674,'SAQUAREMA'),(1,2,3675,'SEROPEDICA'),(1,2,3676,'SILVA JARDIM'),(1,2,3677,'SUMIDOURO'),(1,2,3678,'TANGUA'),(1,2,3679,'TERESOPOLIS'),(1,2,3680,'TRAJANO DE MORAIS'),(1,2,3681,'TRES RIOS'),(1,2,3682,'VALENCA'),(1,2,3683,'VARRE E SAI'),(1,2,3684,'VASSOURAS'),(1,2,3685,'VOLTA REDONDA'),(1,22,3686,'ACARI'),(1,22,3687,'ACU'),(1,22,3688,'AFONSO BEZERRA'),(1,22,3689,'AGUA NOVA'),(1,22,3690,'ALEXANDRIA'),(1,22,3691,'ALMINO AFONSO'),(1,22,3692,'ALTO DO RODRIGUES'),(1,22,3693,'ANGICOS'),(1,22,3694,'ANTONIO MARTINS'),(1,22,3695,'APODI'),(1,22,3696,'AREIA BRANCA'),(1,22,3697,'ARES'),(1,22,3698,'AUGUSTO SEVERO'),(1,22,3699,'BAIA FORMOSA'),(1,22,3700,'BARAUNA'),(1,22,3701,'BARCELONA'),(1,22,3702,'BENTO FERNANDES'),(1,22,3703,'BODO'),(1,22,3704,'BOM JESUS'),(1,22,3705,'BREJINHO'),(1,22,3706,'CAICARA DO NORTE'),(1,22,3707,'CAICARA DO RIO DO VENTO'),(1,22,3708,'CAICO'),(1,22,3709,'CAMPO REDONDO'),(1,22,3710,'CANGUARETAMA'),(1,22,3711,'CARAUBAS'),(1,22,3712,'CARNAUBA DOS DANTAS'),(1,22,3713,'CARNAUBAIS'),(1,22,3714,'CEARA-MIRIM'),(1,22,3715,'CERRO CORA'),(1,22,3716,'CORONEL EZEQUIEL'),(1,22,3717,'CORONEL JOAO PESSOA'),(1,22,3718,'CRUZETA'),(1,22,3719,'CURRAIS NOVOS'),(1,22,3720,'DOUTOR SEVERIANO'),(1,22,3721,'ENCANTO'),(1,22,3722,'EQUADOR'),(1,22,3723,'ESPIRITO SANTO'),(1,22,3724,'EXTREMOZ'),(1,22,3725,'FELIPE GUERRA'),(1,22,3726,'FERNANDO PEDROZA'),(1,22,3727,'FLORANIA'),(1,22,3728,'FRANCISCO DANTAS'),(1,22,3729,'FRUTUOSO GOMES'),(1,22,3730,'GALINHOS'),(1,22,3731,'GOIANINHA'),(1,22,3732,'GOVERNADOR DIX-SEPT ROSADO'),(1,22,3733,'GROSSOS'),(1,22,3734,'GUAMARE'),(1,22,3735,'IELMO MARINHO'),(1,22,3736,'IPANGUACU'),(1,22,3737,'IPUEIRA'),(1,22,3738,'ITAJA'),(1,22,3739,'ITAU'),(1,22,3740,'JACANA'),(1,22,3741,'JANDAIRA'),(1,22,3742,'JANDUIS'),(1,22,3743,'JANUARIO CICCO'),(1,22,3744,'JAPI'),(1,22,3745,'JARDIM DE ANGICOS'),(1,22,3746,'JARDIM DE PIRANHAS'),(1,22,3747,'JARDIM DO SERIDO'),(1,22,3748,'JOAO CAMARA'),(1,22,3749,'JOAO DIAS'),(1,22,3750,'JOSE DA PENHA'),(1,22,3751,'JUCURUTU'),(1,22,3752,'JUNDIA'),(1,22,3753,'LAGOA DANTA'),(1,22,3754,'LAGOA DE PEDRAS'),(1,22,3755,'LAGOA DE VELHOS'),(1,22,3756,'LAGOA NOVA'),(1,22,3757,'LAGOA SALGADA'),(1,22,3758,'LAJES'),(1,22,3759,'LAJES PINTADAS'),(1,22,3760,'LUCRECIA'),(1,22,3761,'LUIS GOMES'),(1,22,3762,'MACAIBA'),(1,22,3763,'MACAU'),(1,22,3764,'MAJOR SALES'),(1,22,3765,'MARCELINO VIEIRA'),(1,22,3766,'MARTINS'),(1,22,3767,'MAXARANGUAPE'),(1,22,3768,'MESSIAS TARGINO'),(1,22,3769,'MONTANHAS'),(1,22,3770,'MONTE ALEGRE'),(1,22,3771,'MONTE DAS GAMELEIRAS'),(1,22,3772,'MOSSORO'),(1,22,3773,'NISIA FLORESTA'),(1,22,3774,'NOVA CRUZ'),(1,22,3775,'OLHO DAGUA DO BORGES'),(1,22,3776,'OURO BRANCO'),(1,22,3777,'PARANA'),(1,22,3778,'PARAU'),(1,22,3779,'PARAZINHO'),(1,22,3780,'PARELHAS'),(1,22,3781,'PARNAMIRIM'),(1,22,3782,'PASSA E FICA'),(1,22,3783,'PASSAGEM'),(1,22,3784,'PATU'),(1,22,3785,'PAU DOS FERROS'),(1,22,3786,'PEDRA GRANDE'),(1,22,3787,'PEDRA PRETA'),(1,22,3788,'PEDRO AVELINO'),(1,22,3789,'PEDRO VELHO'),(1,22,3790,'PENDENCIAS'),(1,22,3791,'PILOES'),(1,22,3792,'POCO BRANCO'),(1,22,3793,'PORTALEGRE'),(1,22,3794,'PORTO DO MANGUE'),(1,22,3795,'PRESIDENTE JUSCELINO'),(1,22,3796,'PUREZA'),(1,22,3797,'RAFAEL FERNANDES'),(1,22,3798,'RAFAEL GODEIRO'),(1,22,3799,'RIACHO DA CRUZ'),(1,22,3800,'RIACHO DE SANTANA'),(1,22,3801,'RIACHUELO'),(1,22,3802,'RIO DO FOGO'),(1,22,3803,'RODOLFO FERNANDES'),(1,22,3804,'RUY BARBOSA'),(1,22,3805,'SANTA CRUZ'),(1,22,3806,'SANTA MARIA'),(1,22,3807,'SANTANA DO MATOS'),(1,22,3808,'SANTANA DO SERIDO'),(1,22,3809,'SANTO ANTONIO'),(1,22,3810,'SAO BENTO DO NORTE'),(1,22,3811,'SAO BENTO DO TRAIRI'),(1,22,3812,'SAO FERNANDO'),(1,22,3813,'SAO FRANCISCO DO OESTE'),(1,22,3814,'SAO GONCALO DO AMARANTE'),(1,22,3815,'SAO JOAO DO SABUGI'),(1,22,3816,'SAO JOSE DE MIPIBU'),(1,22,3817,'SAO JOSE DO CAMPESTRE'),(1,22,3818,'SAO JOSE DO SERIDO'),(1,22,3819,'SAO MIGUEL'),(1,22,3820,'SAO MIGUEL DE TOUROS'),(1,22,3821,'SAO PAULO DO POTENGI'),(1,22,3822,'SAO PEDRO'),(1,22,3823,'SAO RAFAEL'),(1,22,3824,'SAO TOME'),(1,22,3825,'SAO VICENTE'),(1,22,3826,'SENADOR ELOI DE SOUZA'),(1,22,3827,'SENADOR GEORGINO AVELINO'),(1,22,3828,'SERRA DE SAO BENTO'),(1,22,3829,'SERRA DO MEL'),(1,22,3830,'SERRA NEGRA DO NORTE'),(1,22,3831,'SERRINHA'),(1,22,3832,'SERRINHA DOS PINTOS'),(1,22,3833,'SEVERIANO MELO'),(1,22,3834,'SITIO NOVO'),(1,22,3835,'TABOLEIRO GRANDE'),(1,22,3836,'TAIPU'),(1,22,3837,'TANGARA'),(1,22,3838,'TENENTE ANANIAS'),(1,22,3839,'TENENTE LAURENTINO CRUZ'),(1,22,3840,'TIBAU'),(1,22,3841,'TIBAU DO SUL'),(1,22,3842,'TIMBAUBA DOS BATISTAS'),(1,22,3843,'TOUROS'),(1,22,3844,'TRIUNFO POTIGUAR'),(1,22,3845,'UMARIZAL'),(1,22,3846,'UPANEMA'),(1,22,3847,'VARZEA'),(1,22,3848,'VENHA-VER'),(1,22,3849,'VERA CRUZ'),(1,22,3850,'VICOSA'),(1,22,3851,'VILA FLOR'),(1,24,3852,'ALTA FLORESTA DOESTE'),(1,24,3853,'ALTO ALEGRE DOS PARECIS'),(1,24,3854,'ALTO PARAISO'),(1,24,3855,'ALVORADA DOESTE'),(1,24,3856,'ARIQUEMES'),(1,24,3857,'BURITIS'),(1,24,3858,'CABIXI'),(1,24,3859,'CACAULANDIA'),(1,24,3860,'CACOAL'),(1,24,3861,'CAMPO NOVO DE RONDONIA'),(1,24,3862,'CANDEIAS DO JAMARI'),(1,24,3863,'CASTANHEIRAS'),(1,24,3864,'CEREJEIRAS'),(1,24,3865,'CHUPINGUAIA'),(1,24,3866,'COLORADO DO OESTE'),(1,24,3867,'CORUMBIARA'),(1,24,3868,'COSTA MARQUES'),(1,24,3869,'CUJUBIM'),(1,24,3870,'ESPIGAO DOESTE'),(1,24,3871,'GOVERNADOR JORGE TEIXEIRA'),(1,24,3872,'GUAJARA-MIRIM'),(1,24,3873,'ITAPUA DO OESTE'),(1,24,3874,'JARU'),(1,24,3875,'JI-PARANA'),(1,24,3876,'MACHADINHO DOESTE'),(1,24,3877,'MINISTRO ANDREAZZA'),(1,24,3878,'MIRANTE DA SERRA'),(1,24,3879,'MONTE NEGRO'),(1,24,3880,'NOVA BRASILANDIA DOESTE'),(1,24,3881,'NOVA MAMORE'),(1,24,3882,'NOVA UNIAO'),(1,24,3883,'NOVO HORIZONTE DO OESTE'),(1,24,3884,'OURO PRETO DO OESTE'),(1,24,3885,'PARECIS'),(1,24,3886,'PIMENTA BUENO'),(1,24,3887,'PIMENTEIRAS DO OESTE'),(1,24,3888,'PORTO VELHO'),(1,24,3889,'PRESIDENTE MEDICI'),(1,24,3890,'PRIMAVERA DE RONDONIA'),(1,24,3891,'RIO CRESPO'),(1,24,3892,'ROLIM DE MOURA'),(1,24,3893,'SANTA LUZIA DOESTE'),(1,24,3894,'SAO FELIPE DOESTE'),(1,24,3895,'SAO FRANCISCO DO GUAPORE'),(1,24,3896,'SAO MIGUEL DO GUAPORE'),(1,24,3897,'SERINGUEIRAS'),(1,24,3898,'TEIXEIROPOLIS'),(1,24,3899,'THEOBROMA'),(1,24,3900,'URUPA'),(1,24,3901,'VALE DO ANARI'),(1,24,3902,'VALE DO PARAISO'),(1,24,3903,'VILHENA'),(1,25,3904,'ALTO ALEGRE'),(1,25,3905,'AMAJARI'),(1,25,3906,'BOA VISTA'),(1,25,3907,'BONFIM'),(1,25,3908,'CANTA'),(1,25,3909,'CARACARAI'),(1,25,3910,'CAROEBE'),(1,25,3911,'IRACEMA'),(1,25,3912,'MUCAJAI'),(1,25,3913,'NORMANDIA'),(1,25,3914,'PACARAIMA'),(1,25,3915,'RORAINOPOLIS'),(1,25,3916,'SAO JOAO DA BALIZA'),(1,25,3917,'SAO LUIZ'),(1,25,3918,'UIRAMUTA'),(1,23,3919,'ACEGUA'),(1,23,3920,'AGUA SANTA'),(1,23,3921,'AGUDO'),(1,23,3922,'AJURICABA'),(1,23,3923,'ALECRIM'),(1,23,3924,'ALEGRETE'),(1,23,3925,'ALEGRIA'),(1,23,3926,'ALMIRANTE TAMANDARE DO SUL'),(1,23,3927,'ALPESTRE'),(1,23,3928,'ALTO ALEGRE'),(1,23,3929,'ALTO FELIZ'),(1,23,3930,'ALVORADA'),(1,23,3931,'AMARAL FERRADOR'),(1,23,3932,'AMETISTA DO SUL'),(1,23,3933,'ANDRE DA ROCHA'),(1,23,3934,'ANTA GORDA'),(1,23,3935,'ANTONIO PRADO'),(1,23,3936,'ARAMBARE'),(1,23,3937,'ARARICA'),(1,23,3938,'ARATIBA'),(1,23,3939,'ARROIO DO MEIO'),(1,23,3940,'ARROIO DO PADRE'),(1,23,3941,'ARROIO DO SAL'),(1,23,3942,'ARROIO DO TIGRE'),(1,23,3943,'ARROIO DOS RATOS'),(1,23,3944,'ARROIO GRANDE'),(1,23,3945,'ARVOREZINHA'),(1,23,3946,'AUGUSTO PESTANA'),(1,23,3947,'AUREA'),(1,23,3948,'BAGE'),(1,23,3949,'BALNEARIO PINHAL'),(1,23,3950,'BARAO'),(1,23,3951,'BARAO DE COTEGIPE'),(1,23,3952,'BARAO DO TRIUNFO'),(1,23,3953,'BARRA DO GUARITA'),(1,23,3954,'BARRA DO QUARAI'),(1,23,3955,'BARRA DO RIBEIRO'),(1,23,3956,'BARRA DO RIO AZUL'),(1,23,3957,'BARRA FUNDA'),(1,23,3958,'BARRACAO'),(1,23,3959,'BARROS CASSAL'),(1,23,3960,'BENJAMIN CONSTANT DO SUL'),(1,23,3961,'BENTO GONCALVES'),(1,23,3962,'BOA VISTA DAS MISSOES'),(1,23,3963,'BOA VISTA DO BURICA'),(1,23,3964,'BOA VISTA DO CADEADO'),(1,23,3965,'BOA VISTA DO INCRA'),(1,23,3966,'BOA VISTA DO SUL'),(1,23,3967,'BOM JESUS'),(1,23,3968,'BOM PRINCIPIO'),(1,23,3969,'BOM PROGRESSO'),(1,23,3970,'BOM RETIRO DO SUL'),(1,23,3971,'BOQUEIRAO DO LEAO'),(1,23,3972,'BOSSOROCA'),(1,23,3973,'BOZANO'),(1,23,3974,'BRAGA'),(1,23,3975,'BROCHIER'),(1,23,3976,'BUTIA'),(1,23,3977,'CACAPAVA DO SUL'),(1,23,3978,'CACEQUI'),(1,23,3979,'CACHOEIRA DO SUL'),(1,23,3980,'CACHOEIRINHA'),(1,23,3981,'CACIQUE DOBLE'),(1,23,3982,'CAIBATE'),(1,23,3983,'CAICARA'),(1,23,3984,'CAMAQUA'),(1,23,3985,'CAMARGO'),(1,23,3986,'CAMBARA DO SUL'),(1,23,3987,'CAMPESTRE DA SERRA'),(1,23,3988,'CAMPINA DAS MISSOES'),(1,23,3989,'CAMPINAS DO SUL'),(1,23,3990,'CAMPO BOM'),(1,23,3991,'CAMPO NOVO'),(1,23,3992,'CAMPOS BORGES'),(1,23,3993,'CANDELARIA'),(1,23,3994,'CANDIDO GODOI'),(1,23,3995,'CANDIOTA'),(1,23,3996,'CANELA'),(1,23,3997,'CANGUCU'),(1,23,3998,'CANOAS'),(1,23,3999,'CANUDOS DO VALE'),(1,23,4000,'CAPAO BONITO DO SUL'),(1,23,4001,'CAPAO DA CANOA'),(1,23,4002,'CAPAO DO CIPO'),(1,23,4003,'CAPAO DO LEAO'),(1,23,4004,'CAPELA DE SANTANA'),(1,23,4005,'CAPITAO'),(1,23,4006,'CAPIVARI DO SUL'),(1,23,4007,'CARAA'),(1,23,4008,'CARAZINHO'),(1,23,4009,'CARLOS BARBOSA'),(1,23,4010,'CARLOS GOMES'),(1,23,4011,'CASCA'),(1,23,4012,'CASEIROS'),(1,23,4013,'CATUIPE'),(1,23,4014,'CAXIAS DO SUL'),(1,23,4015,'CENTENARIO'),(1,23,4016,'CERRITO'),(1,23,4017,'CERRO BRANCO'),(1,23,4018,'CERRO GRANDE'),(1,23,4019,'CERRO GRANDE DO SUL'),(1,23,4020,'CERRO LARGO'),(1,23,4021,'CHAPADA'),(1,23,4022,'CHARQUEADAS'),(1,23,4023,'CHARRUA'),(1,23,4024,'CHIAPETTA'),(1,23,4025,'CHUI'),(1,23,4026,'CHUVISCA'),(1,23,4027,'CIDREIRA'),(1,23,4028,'CIRIACO'),(1,23,4029,'COLINAS'),(1,23,4030,'COLORADO'),(1,23,4031,'CONDOR'),(1,23,4032,'CONSTANTINA'),(1,23,4033,'COQUEIRO BAIXO'),(1,23,4034,'COQUEIROS DO SUL'),(1,23,4035,'CORONEL BARROS'),(1,23,4036,'CORONEL BICACO'),(1,23,4037,'CORONEL PILAR'),(1,23,4038,'COTIPORA'),(1,23,4039,'COXILHA'),(1,23,4040,'CRISSIUMAL'),(1,23,4041,'CRISTAL'),(1,23,4042,'CRISTAL DO SUL'),(1,23,4043,'CRUZ ALTA'),(1,23,4044,'CRUZALTENSE'),(1,23,4045,'CRUZEIRO DO SUL'),(1,23,4046,'DAVID CANABARRO'),(1,23,4047,'DERRUBADAS'),(1,23,4048,'DEZESSEIS DE NOVEMBRO'),(1,23,4049,'DILERMANDO DE AGUIAR'),(1,23,4050,'DOIS IRMAOS'),(1,23,4051,'DOIS IRMAOS DAS MISSOES'),(1,23,4052,'DOIS LAJEADOS'),(1,23,4053,'DOM FELICIANO'),(1,23,4054,'DOM PEDRITO'),(1,23,4055,'DOM PEDRO DE ALCANTARA'),(1,23,4056,'DONA FRANCISCA'),(1,23,4057,'DOUTOR MAURICIO CARDOSO'),(1,23,4058,'DOUTOR RICARDO'),(1,23,4059,'ELDORADO DO SUL'),(1,23,4060,'ENCANTADO'),(1,23,4061,'ENCRUZILHADA DO SUL'),(1,23,4062,'ENGENHO VELHO'),(1,23,4063,'ENTRE RIOS DO SUL'),(1,23,4064,'ENTRE-IJUIS'),(1,23,4065,'EREBANGO'),(1,23,4066,'ERECHIM'),(1,23,4067,'ERNESTINA'),(1,23,4068,'ERVAL GRANDE'),(1,23,4069,'ERVAL SECO'),(1,23,4070,'ESMERALDA'),(1,23,4071,'ESPERANCA DO SUL'),(1,23,4072,'ESPUMOSO'),(1,23,4073,'ESTACAO'),(1,23,4074,'ESTANCIA VELHA'),(1,23,4075,'ESTEIO'),(1,23,4076,'ESTRELA'),(1,23,4077,'ESTRELA VELHA'),(1,23,4078,'EUGENIO DE CASTRO'),(1,23,4079,'FAGUNDES VARELA'),(1,23,4080,'FARROUPILHA'),(1,23,4081,'FAXINAL DO SOTURNO'),(1,23,4082,'FAXINALZINHO'),(1,23,4083,'FAZENDA VILANOVA'),(1,23,4084,'FELIZ'),(1,23,4085,'FLORES DA CUNHA'),(1,23,4086,'FLORIANO PEIXOTO'),(1,23,4087,'FONTOURA XAVIER'),(1,23,4088,'FORMIGUEIRO'),(1,23,4089,'FORQUETINHA'),(1,23,4090,'FORTALEZA DOS VALOS'),(1,23,4091,'FREDERICO WESTPHALEN'),(1,23,4092,'GARIBALDI'),(1,23,4093,'GARRUCHOS'),(1,23,4094,'GAURAMA'),(1,23,4095,'GENERAL CAMARA'),(1,23,4096,'GENTIL'),(1,23,4097,'GETULIO VARGAS'),(1,23,4098,'GIRUA'),(1,23,4099,'GLORINHA'),(1,23,4100,'GRAMADO'),(1,23,4101,'GRAMADO DOS LOUREIROS'),(1,23,4102,'GRAMADO XAVIER'),(1,23,4103,'GRAVATAI'),(1,23,4104,'GUABIJU'),(1,23,4105,'GUAIBA'),(1,23,4106,'GUAPORE'),(1,23,4107,'GUARANI DAS MISSOES'),(1,23,4108,'HARMONIA'),(1,23,4109,'HERVAL'),(1,23,4110,'HERVEIRAS'),(1,23,4111,'HORIZONTINA'),(1,23,4112,'HULHA NEGRA'),(1,23,4113,'HUMAITA'),(1,23,4114,'IBARAMA'),(1,23,4115,'IBIACA'),(1,23,4116,'IBIRAIARAS'),(1,23,4117,'IBIRAPUITA'),(1,23,4118,'IBIRUBA'),(1,23,4119,'IGREJINHA'),(1,23,4120,'IJUI'),(1,23,4121,'ILOPOLIS'),(1,23,4122,'IMBE'),(1,23,4123,'IMIGRANTE'),(1,23,4124,'INDEPENDENCIA'),(1,23,4125,'INHACORA'),(1,23,4126,'IPE'),(1,23,4127,'IPIRANGA DO SUL'),(1,23,4128,'IRAI'),(1,23,4129,'ITAARA'),(1,23,4130,'ITACURUBI'),(1,23,4131,'ITAPUCA'),(1,23,4132,'ITAQUI'),(1,23,4133,'ITATI'),(1,23,4134,'ITATIBA DO SUL'),(1,23,4135,'IVORA'),(1,23,4136,'IVOTI'),(1,23,4137,'JABOTICABA'),(1,23,4138,'JACUIZINHO'),(1,23,4139,'JACUTINGA'),(1,23,4140,'JAGUARAO'),(1,23,4141,'JAGUARI'),(1,23,4142,'JAQUIRANA'),(1,23,4143,'JARI'),(1,23,4144,'JOIA'),(1,23,4145,'JULIO DE CASTILHOS'),(1,23,4146,'LAGOA BONITA DO SUL'),(1,23,4147,'LAGOA DOS TRES CANTOS'),(1,23,4148,'LAGOA VERMELHA'),(1,23,4149,'LAGOAO'),(1,23,4150,'LAJEADO'),(1,23,4151,'LAJEADO DO BUGRE'),(1,23,4152,'LAVRAS DO SUL'),(1,23,4153,'LIBERATO SALZANO'),(1,23,4154,'LINDOLFO COLLOR'),(1,23,4155,'LINHA NOVA'),(1,23,4156,'MACAMBARA'),(1,23,4157,'MACHADINHO'),(1,23,4158,'MAMPITUBA'),(1,23,4159,'MANOEL VIANA'),(1,23,4160,'MAQUINE'),(1,23,4161,'MARATA'),(1,23,4162,'MARAU'),(1,23,4163,'MARCELINO RAMOS'),(1,23,4164,'MARIANA PIMENTEL'),(1,23,4165,'MARIANO MORO'),(1,23,4166,'MARQUES DE SOUZA'),(1,23,4167,'MATA'),(1,23,4168,'MATO CASTELHANO'),(1,23,4169,'MATO LEITAO'),(1,23,4170,'MATO QUEIMADO'),(1,23,4171,'MAXIMILIANO DE ALMEIDA'),(1,23,4172,'MINAS DO LEAO'),(1,23,4173,'MIRAGUAI'),(1,23,4174,'MONTAURI'),(1,23,4175,'MONTE ALEGRE DOS CAMPOS'),(1,23,4176,'MONTE BELO DO SUL'),(1,23,4177,'MONTENEGRO'),(1,23,4178,'MORMACO'),(1,23,4179,'MORRINHOS DO SUL'),(1,23,4180,'MORRO REDONDO'),(1,23,4181,'MORRO REUTER'),(1,23,4182,'MOSTARDAS'),(1,23,4183,'MUCUM'),(1,23,4184,'MUITOS CAPOES'),(1,23,4185,'MULITERNO'),(1,23,4186,'NAO-ME-TOQUE'),(1,23,4187,'NICOLAU VERGUEIRO'),(1,23,4188,'NONOAI'),(1,23,4189,'NOVA ALVORADA'),(1,23,4190,'NOVA ARACA'),(1,23,4191,'NOVA BASSANO'),(1,23,4192,'NOVA BOA VISTA'),(1,23,4193,'NOVA BRESCIA'),(1,23,4194,'NOVA CANDELARIA'),(1,23,4195,'NOVA ESPERANCA DO SUL'),(1,23,4196,'NOVA HARTZ'),(1,23,4197,'NOVA PADUA'),(1,23,4198,'NOVA PALMA'),(1,23,4199,'NOVA PETROPOLIS'),(1,23,4200,'NOVA PRATA'),(1,23,4201,'NOVA RAMADA'),(1,23,4202,'NOVA ROMA DO SUL'),(1,23,4203,'NOVA SANTA RITA'),(1,23,4204,'NOVO BARREIRO'),(1,23,4205,'NOVO CABRAIS'),(1,23,4206,'NOVO HAMBURGO'),(1,23,4207,'NOVO MACHADO'),(1,23,4208,'NOVO TIRADENTES'),(1,23,4209,'NOVO XINGU'),(1,23,4210,'OSORIO'),(1,23,4211,'PAIM FILHO'),(1,23,4212,'PALMARES DO SUL'),(1,23,4213,'PALMEIRA DAS MISSOES'),(1,23,4214,'PALMITINHO'),(1,23,4215,'PANAMBI'),(1,23,4216,'PANTANO GRANDE'),(1,23,4217,'PARAI'),(1,23,4218,'PARAISO DO SUL'),(1,23,4219,'PARECI NOVO'),(1,23,4220,'PAROBE'),(1,23,4221,'PASSA SETE'),(1,23,4222,'PASSO DO SOBRADO'),(1,23,4223,'PASSO FUNDO'),(1,23,4224,'PAULO BENTO'),(1,23,4225,'PAVERAMA'),(1,23,4226,'PEDRAS ALTAS'),(1,23,4227,'PEDRO OSORIO'),(1,23,4228,'PEJUCARA'),(1,23,4229,'PELOTAS'),(1,23,4230,'PICADA CAFE'),(1,23,4231,'PINHAL'),(1,23,4232,'PINHAL DA SERRA'),(1,23,4233,'PINHAL GRANDE'),(1,23,4234,'PINHEIRINHO DO VALE'),(1,23,4235,'PINHEIRO MACHADO'),(1,23,4236,'PIRAPO'),(1,23,4237,'PIRATINI'),(1,23,4238,'PLANALTO'),(1,23,4239,'POCO DAS ANTAS'),(1,23,4240,'PONTAO'),(1,23,4241,'PONTE PRETA'),(1,23,4242,'PORTAO'),(1,23,4243,'PORTO LUCENA'),(1,23,4244,'PORTO MAUA'),(1,23,4245,'PORTO VERA CRUZ'),(1,23,4246,'PORTO XAVIER'),(1,23,4247,'POUSO NOVO'),(1,23,4248,'PRESIDENTE LUCENA'),(1,23,4249,'PROGRESSO'),(1,23,4250,'PROTASIO ALVES'),(1,23,4251,'PUTINGA'),(1,23,4252,'QUARAI'),(1,23,4253,'QUATRO IRMAOS'),(1,23,4254,'QUEVEDOS'),(1,23,4255,'QUINZE DE NOVEMBRO'),(1,23,4256,'REDENTORA'),(1,23,4257,'RELVADO'),(1,23,4258,'RESTINGA SECA'),(1,23,4259,'RIO DOS INDIOS'),(1,23,4260,'RIO GRANDE'),(1,23,4261,'RIO PARDO'),(1,23,4262,'RIOZINHO'),(1,23,4263,'ROCA SALES'),(1,23,4264,'RODEIO BONITO'),(1,23,4265,'ROLADOR'),(1,23,4266,'ROLANTE'),(1,23,4267,'RONDA ALTA'),(1,23,4268,'RONDINHA'),(1,23,4269,'ROQUE GONZALES'),(1,23,4270,'ROSARIO DO SUL'),(1,23,4271,'SAGRADA FAMILIA'),(1,23,4272,'SALDANHA MARINHO'),(1,23,4273,'SALTO DO JACUI'),(1,23,4274,'SALVADOR DAS MISSOES'),(1,23,4275,'SALVADOR DO SUL'),(1,23,4276,'SANANDUVA'),(1,23,4277,'SANTA BARBARA DO SUL'),(1,23,4278,'SANTA CECILIA DO SUL'),(1,23,4279,'SANTA CLARA DO SUL'),(1,23,4280,'SANTA CRUZ DO SUL'),(1,23,4281,'SANTA MARGARIDA DO SUL'),(1,23,4282,'SANTA MARIA'),(1,23,4283,'SANTA MARIA DO HERVAL'),(1,23,4284,'SANTA ROSA'),(1,23,4285,'SANTA TEREZA'),(1,23,4286,'SANTA VITORIA DO PALMAR'),(1,23,4287,'SANTANA DA BOA VISTA'),(1,23,4288,'SANTANA DO LIVRAMENTO'),(1,23,4289,'SANTIAGO'),(1,23,4290,'SANTO ANGELO'),(1,23,4291,'SANTO ANTONIO DA PATRULHA'),(1,23,4292,'SANTO ANTONIO DAS MISSOES'),(1,23,4293,'SANTO ANTONIO DO PALMA'),(1,23,4294,'SANTO ANTONIO DO PLANALTO'),(1,23,4295,'SANTO AUGUSTO'),(1,23,4296,'SANTO CRISTO'),(1,23,4297,'SANTO EXPEDITO DO SUL'),(1,23,4298,'SAO BORJA'),(1,23,4299,'SAO DOMINGOS DO SUL'),(1,23,4300,'SAO FRANCISCO DE ASSIS'),(1,23,4301,'SAO FRANCISCO DE PAULA'),(1,23,4302,'SAO GABRIEL'),(1,23,4303,'SAO JERONIMO'),(1,23,4304,'SAO JOAO DA URTIGA'),(1,23,4305,'SAO JOAO DO POLESINE'),(1,23,4306,'SAO JORGE'),(1,23,4307,'SAO JOSE DAS MISSOES'),(1,23,4308,'SAO JOSE DO HERVAL'),(1,23,4309,'SAO JOSE DO HORTENCIO'),(1,23,4310,'SAO JOSE DO INHACORA'),(1,23,4311,'SAO JOSE DO NORTE'),(1,23,4312,'SAO JOSE DO OURO'),(1,23,4313,'SAO JOSE DO SUL'),(1,23,4314,'SAO JOSE DOS AUSENTES'),(1,23,4315,'SAO LEOPOLDO'),(1,23,4316,'SAO LOURENCO DO SUL'),(1,23,4317,'SAO LUIZ GONZAGA'),(1,23,4318,'SAO MARCOS'),(1,23,4319,'SAO MARTINHO'),(1,23,4320,'SAO MARTINHO DA SERRA'),(1,23,4321,'SAO MIGUEL DAS MISSOES'),(1,23,4322,'SAO NICOLAU'),(1,23,4323,'SAO PAULO DAS MISSOES'),(1,23,4324,'SAO PEDRO DA SERRA'),(1,23,4325,'SAO PEDRO DAS MISSOES'),(1,23,4326,'SAO PEDRO DO BUTIA'),(1,23,4327,'SAO PEDRO DO SUL'),(1,23,4328,'SAO SEBASTIAO DO CAI'),(1,23,4329,'SAO SEPE'),(1,23,4330,'SAO VALENTIM'),(1,23,4331,'SAO VALENTIM DO SUL'),(1,23,4332,'SAO VALERIO DO SUL'),(1,23,4333,'SAO VENDELINO'),(1,23,4334,'SAO VICENTE DO SUL'),(1,23,4335,'SAPIRANGA'),(1,23,4336,'SAPUCAIA DO SUL'),(1,23,4337,'SARANDI'),(1,23,4338,'SEBERI'),(1,23,4339,'SEDE NOVA'),(1,23,4340,'SEGREDO'),(1,23,4341,'SELBACH'),(1,23,4342,'SENADOR SALGADO FILHO'),(1,23,4343,'SENTINELA DO SUL'),(1,23,4344,'SERAFINA CORREA'),(1,23,4345,'SERIO'),(1,23,4346,'SERTAO'),(1,23,4347,'SERTAO SANTANA'),(1,23,4348,'SETE DE SETEMBRO'),(1,23,4349,'SEVERIANO DE ALMEIDA'),(1,23,4350,'SILVEIRA MARTINS'),(1,23,4351,'SINIMBU'),(1,23,4352,'SOBRADINHO'),(1,23,4353,'SOLEDADE'),(1,23,4354,'TABAI'),(1,23,4355,'TAPEJARA'),(1,23,4356,'TAPERA'),(1,23,4357,'TAPES'),(1,23,4358,'TAQUARA'),(1,23,4359,'TAQUARI'),(1,23,4360,'TAQUARUCU DO SUL'),(1,23,4361,'TAVARES'),(1,23,4362,'TENENTE PORTELA'),(1,23,4363,'TERRA DE AREIA'),(1,23,4364,'TEUTONIA'),(1,23,4365,'TIO HUGO'),(1,23,4366,'TIRADENTES DO SUL'),(1,23,4367,'TOROPI'),(1,23,4368,'TORRES'),(1,23,4369,'TRAMANDAI'),(1,23,4370,'TRAVESSEIRO'),(1,23,4371,'TRES ARROIOS'),(1,23,4372,'TRES CACHOEIRAS'),(1,23,4373,'TRES COROAS'),(1,23,4374,'TRES DE MAIO'),(1,23,4375,'TRES FORQUILHAS'),(1,23,4376,'TRES PALMEIRAS'),(1,23,4377,'TRES PASSOS'),(1,23,4378,'TRINDADE DO SUL'),(1,23,4379,'TRIUNFO'),(1,23,4380,'TUCUNDUVA'),(1,23,4381,'TUNAS'),(1,23,4382,'TUPANCI DO SUL'),(1,23,4383,'TUPANCIRETA'),(1,23,4384,'TUPANDI'),(1,23,4385,'TUPARENDI'),(1,23,4386,'TURUCU'),(1,23,4387,'UBIRETAMA'),(1,23,4388,'UNIAO DA SERRA'),(1,23,4389,'UNISTALDA'),(1,23,4390,'URUGUAIANA'),(1,23,4391,'VACARIA'),(1,23,4392,'VALE DO SOL'),(1,23,4393,'VALE REAL'),(1,23,4394,'VALE VERDE'),(1,23,4395,'VANINI'),(1,23,4396,'VENANCIO AIRES'),(1,23,4397,'VERA CRUZ'),(1,23,4398,'VERANOPOLIS'),(1,23,4399,'VESPASIANO CORREA'),(1,23,4400,'VIADUTOS'),(1,23,4401,'VIAMAO'),(1,23,4402,'VICENTE DUTRA'),(1,23,4403,'VICTOR GRAEFF'),(1,23,4404,'VILA FLORES'),(1,23,4405,'VILA LANGARO'),(1,23,4406,'VILA MARIA'),(1,23,4407,'VILA NOVA DO SUL'),(1,23,4408,'VISTA ALEGRE'),(1,23,4409,'VISTA ALEGRE DO PRATA'),(1,23,4410,'VISTA GAUCHA'),(1,23,4411,'VITORIA DAS MISSOES'),(1,23,4412,'WESTFALIA'),(1,23,4413,'XANGRI-LA'),(1,26,4414,'ABDON BATISTA'),(1,26,4415,'ABELARDO LUZ'),(1,26,4416,'AGROLANDIA'),(1,26,4417,'AGRONOMICA'),(1,26,4418,'AGUA DOCE'),(1,26,4419,'AGUAS DE CHAPECO'),(1,26,4420,'AGUAS FRIAS'),(1,26,4421,'AGUAS MORNAS'),(1,26,4422,'ALFREDO WAGNER'),(1,26,4423,'ALTO BELA VISTA'),(1,26,4424,'ANCHIETA'),(1,26,4425,'ANGELINA'),(1,26,4426,'ANITA GARIBALDI'),(1,26,4427,'ANITAPOLIS'),(1,26,4428,'ANTONIO CARLOS'),(1,26,4429,'APIUNA'),(1,26,4430,'ARABUTA'),(1,26,4431,'ARAQUARI'),(1,26,4432,'ARARANGUA'),(1,26,4433,'ARMAZEM'),(1,26,4434,'ARROIO TRINTA'),(1,26,4435,'ARVOREDO'),(1,26,4436,'ASCURRA'),(1,26,4437,'ATALANTA'),(1,26,4438,'AURORA'),(1,26,4439,'BALNEARIO ARROIO DO SILVA'),(1,26,4440,'BALNEARIO BARRA DO SUL (SC)'),(1,26,4441,'BALNEARIO CAMBORIU'),(1,26,4442,'BALNEARIO GAIVOTA'),(1,26,4443,'BANDEIRANTE'),(1,26,4444,'BARRA BONITA'),(1,26,4445,'BARRA VELHA'),(1,26,4446,'BELA VISTA DO TOLDO'),(1,26,4447,'BELMONTE'),(1,26,4448,'BENEDITO NOVO'),(1,26,4449,'BIGUACU'),(1,26,4450,'BLUMENAU'),(1,26,4451,'BOCAINA DO SUL'),(1,26,4452,'BOM JARDIM DA SERRA'),(1,26,4453,'BOM JESUS'),(1,26,4454,'BOM JESUS DO OESTE'),(1,26,4455,'BOM RETIRO'),(1,26,4456,'BOMBINHAS'),(1,26,4457,'BOTUVERA'),(1,26,4458,'BRACO DO NORTE'),(1,26,4459,'BRACO DO TROMBUDO'),(1,26,4460,'BRUNOPOLIS'),(1,26,4461,'BRUSQUE'),(1,26,4462,'CACADOR'),(1,26,4463,'CAIBI'),(1,26,4464,'CALMON'),(1,26,4465,'CAMBORIU'),(1,26,4466,'CAMPO ALEGRE'),(1,26,4467,'CAMPO BELO DO SUL'),(1,26,4468,'CAMPO ERE'),(1,26,4469,'CAMPOS NOVOS'),(1,26,4470,'CANELINHA'),(1,26,4471,'CANOINHAS'),(1,26,4472,'CAPAO ALTO'),(1,26,4473,'CAPINZAL'),(1,26,4474,'CAPIVARI DE BAIXO'),(1,26,4475,'CATANDUVAS'),(1,26,4476,'CAXAMBU DO SUL'),(1,26,4477,'CELSO RAMOS'),(1,26,4478,'CERRO NEGRO'),(1,26,4479,'CHAPADAO DO LAGEADO'),(1,26,4480,'CHAPECO'),(1,26,4481,'COCAL DO SUL'),(1,26,4482,'CONCORDIA'),(1,26,4483,'CORDILHEIRA ALTA'),(1,26,4484,'CORONEL FREITAS'),(1,26,4485,'CORONEL MARTINS'),(1,26,4486,'CORREIA PINTO'),(1,26,4487,'CORUPA'),(1,26,4488,'CRICIUMA'),(1,26,4489,'CUNHA PORA'),(1,26,4490,'CUNHATAI'),(1,26,4491,'CURITIBANOS'),(1,26,4492,'DESCANSO'),(1,26,4493,'DIONISIO CERQUEIRA'),(1,26,4494,'DONA EMMA'),(1,26,4495,'DOUTOR PEDRINHO'),(1,26,4496,'ENTRE RIOS'),(1,26,4497,'ERMO'),(1,26,4498,'ERVAL VELHO'),(1,26,4499,'FAXINAL DOS GUEDES'),(1,26,4500,'FLOR DO SERTAO'),(1,26,4501,'FLORIANOPOLIS'),(1,26,4502,'FORMOSA DO SUL'),(1,26,4503,'FORQUILHINHA'),(1,26,4504,'FRAIBURGO'),(1,26,4505,'FREI ROGERIO'),(1,26,4506,'GALVAO'),(1,26,4507,'GAROPABA'),(1,26,4508,'GARUVA'),(1,26,4509,'GASPAR'),(1,26,4510,'GOVERNADOR CELSO RAMOS'),(1,26,4511,'GRAO PARA'),(1,26,4512,'GRAVATAL'),(1,26,4513,'GUABIRUBA'),(1,26,4514,'GUARACIABA'),(1,26,4515,'GUARAMIRIM'),(1,26,4516,'GUARUJA DO SUL'),(1,26,4517,'GUATAMBU'),(1,26,4518,'HERVAL DOESTE'),(1,26,4519,'IBIAM'),(1,26,4520,'IBICARE'),(1,26,4521,'IBIRAMA'),(1,26,4522,'ICARA'),(1,26,4523,'ILHOTA'),(1,26,4524,'IMARUI'),(1,26,4525,'IMBITUBA'),(1,26,4526,'IMBUIA'),(1,26,4527,'INDAIAL'),(1,26,4528,'IOMERE'),(1,26,4529,'IPIRA'),(1,26,4530,'IPORA DO OESTE'),(1,26,4531,'IPUACU'),(1,26,4532,'IPUMIRIM'),(1,26,4533,'IRACEMINHA'),(1,26,4534,'IRANI'),(1,26,4535,'IRATI'),(1,26,4536,'IRINEOPOLIS'),(1,26,4537,'ITA'),(1,26,4538,'ITAIOPOLIS'),(1,26,4539,'ITAJAI'),(1,26,4540,'ITAPEMA'),(1,26,4541,'ITAPIRANGA'),(1,26,4542,'ITAPOA'),(1,26,4543,'ITUPORANGA'),(1,26,4544,'JABORA'),(1,26,4545,'JACINTO MACHADO'),(1,26,4546,'JAGUARUNA'),(1,26,4547,'JARAGUA DO SUL'),(1,26,4548,'JARDINOPOLIS'),(1,26,4549,'JOACABA'),(1,26,4550,'JOINVILLE'),(1,26,4551,'JOSE BOITEUX'),(1,26,4552,'JUPIA'),(1,26,4553,'LACERDOPOLIS'),(1,26,4554,'LAGES'),(1,26,4555,'LAGUNA'),(1,26,4556,'LAJEADO GRANDE'),(1,26,4557,'LAURENTINO'),(1,26,4558,'LAURO MULLER'),(1,26,4559,'LEBON REGIS'),(1,26,4560,'LEOBERTO LEAL'),(1,26,4561,'LINDOIA DO SUL'),(1,26,4562,'LONTRAS'),(1,26,4563,'LUIZ ALVES'),(1,26,4564,'LUZERNA'),(1,26,4565,'MACIEIRA'),(1,26,4566,'MAFRA'),(1,26,4567,'MAJOR GERCINO'),(1,26,4568,'MAJOR VIEIRA'),(1,26,4569,'MARACAJA'),(1,26,4570,'MARAVILHA'),(1,26,4571,'MAREMA'),(1,26,4572,'MASSARANDUBA'),(1,26,4573,'MATOS COSTA'),(1,26,4574,'MELEIRO'),(1,26,4575,'MIRIM DOCE'),(1,26,4576,'MODELO'),(1,26,4577,'MONDAI'),(1,26,4578,'MONTE CARLO'),(1,26,4579,'MONTE CASTELO'),(1,26,4580,'MORRO DA FUMACA'),(1,26,4581,'MORRO GRANDE'),(1,26,4582,'NAVEGANTES'),(1,26,4583,'NOVA ERECHIM'),(1,26,4584,'NOVA ITABERABA'),(1,26,4585,'NOVA TRENTO'),(1,26,4586,'NOVA VENEZA'),(1,26,4587,'NOVO HORIZONTE'),(1,26,4588,'ORLEANS'),(1,26,4589,'OTACILIO COSTA'),(1,26,4590,'OURO'),(1,26,4591,'OURO VERDE'),(1,26,4592,'PAIAL'),(1,26,4593,'PAINEL'),(1,26,4594,'PALHOCA'),(1,26,4595,'PALMA SOLA'),(1,26,4596,'PALMEIRA'),(1,26,4597,'PALMITOS'),(1,26,4598,'PAPANDUVA'),(1,26,4599,'PARAISO'),(1,26,4600,'PASSO DE TORRES'),(1,26,4601,'PASSOS MAIA'),(1,26,4602,'PAULO LOPES'),(1,26,4603,'PEDRAS GRANDES'),(1,26,4604,'PENHA'),(1,26,4605,'PERITIBA'),(1,26,4606,'PETROLANDIA'),(1,26,4607,'PICARRAS'),(1,26,4608,'PINHALZINHO'),(1,26,4609,'PINHEIRO PRETO'),(1,26,4610,'PIRATUBA'),(1,26,4611,'PLANALTO ALEGRE'),(1,26,4612,'POMERODE'),(1,26,4613,'PONTE ALTA'),(1,26,4614,'PONTE ALTA DO NORTE'),(1,26,4615,'PONTE SERRADA'),(1,26,4616,'PORTO BELO'),(1,26,4617,'PORTO UNIAO'),(1,26,4618,'POUSO REDONDO'),(1,26,4619,'PRAIA GRANDE'),(1,26,4620,'PRESIDENTE CASTELO BRANCO'),(1,26,4621,'PRESIDENTE GETULIO'),(1,26,4622,'PRESIDENTE NEREU'),(1,26,4623,'PRINCESA'),(1,26,4624,'QUILOMBO'),(1,26,4625,'RANCHO QUEIMADO'),(1,26,4626,'RIO DAS ANTAS'),(1,26,4627,'RIO DO CAMPO'),(1,26,4628,'RIO DO OESTE'),(1,26,4629,'RIO DO SUL'),(1,26,4630,'RIO DOS CEDROS'),(1,26,4631,'RIO FORTUNA'),(1,26,4632,'RIO NEGRINHO'),(1,26,4633,'RIO RUFINO'),(1,26,4634,'RIQUEZA'),(1,26,4635,'RODEIO'),(1,26,4636,'ROMELANDIA'),(1,26,4637,'SALETE'),(1,26,4638,'SALTINHO'),(1,26,4639,'SALTO VELOSO'),(1,26,4640,'SANGAO'),(1,26,4641,'SANTA CECILIA'),(1,26,4642,'SANTA HELENA'),(1,26,4643,'SANTA ROSA DE LIMA'),(1,26,4644,'SANTA ROSA DO SUL'),(1,26,4645,'SANTA TEREZINHA'),(1,26,4646,'SANTA TEREZINHA DO PROGRESSO'),(1,26,4647,'SANTIAGO DO SUL'),(1,26,4648,'SANTO AMARO DA IMPERATRIZ'),(1,26,4649,'SAO BENTO DO SUL'),(1,26,4650,'SAO BERNARDINO'),(1,26,4651,'SAO BONIFACIO'),(1,26,4652,'SAO CARLOS'),(1,26,4653,'SAO CRISTOVAO DO SUL'),(1,26,4654,'SAO DOMINGOS'),(1,26,4655,'SAO FRANCISCO DO SUL'),(1,26,4656,'SAO JOAO BATISTA'),(1,26,4657,'SAO JOAO DO ITAPERIU'),(1,26,4658,'SAO JOAO DO OESTE'),(1,26,4659,'SAO JOAO DO SUL'),(1,26,4660,'SAO JOAQUIM'),(1,26,4661,'SAO JOSE'),(1,26,4662,'SAO JOSE DO CEDRO'),(1,26,4663,'SAO JOSE DO CERRITO'),(1,26,4664,'SAO LOURENCO DO OESTE'),(1,26,4665,'SAO LUDGERO'),(1,26,4666,'SAO MARTINHO'),(1,26,4667,'SAO MIGUEL DA BOA VISTA'),(1,26,4668,'SAO MIGUEL DOESTE'),(1,26,4669,'SAO PEDRO DE ALCANTARA'),(1,26,4670,'SAUDADES'),(1,26,4671,'SCHROEDER'),(1,26,4672,'SEARA'),(1,26,4673,'SERRA ALTA'),(1,26,4674,'SIDEROPOLIS'),(1,26,4675,'SOMBRIO'),(1,26,4676,'SUL BRASIL'),(1,26,4677,'TAIO'),(1,26,4678,'TANGARA'),(1,26,4679,'TIGRINHOS'),(1,26,4680,'TIJUCAS'),(1,26,4681,'TIMBE DO SUL'),(1,26,4682,'TIMBO'),(1,26,4683,'TIMBO GRANDE'),(1,26,4684,'TRES BARRAS'),(1,26,4685,'TREVISO'),(1,26,4686,'TREZE DE MAIO'),(1,26,4687,'TREZE TILIAS'),(1,26,4688,'TROMBUDO CENTRAL'),(1,26,4689,'TUBARAO'),(1,26,4690,'TUNAPOLIS'),(1,26,4691,'TURVO'),(1,26,4692,'UNIAO DO OESTE'),(1,26,4693,'URUBICI'),(1,26,4694,'URUPEMA'),(1,26,4695,'URUSSANGA'),(1,26,4696,'VARGEAO'),(1,26,4697,'VARGEM'),(1,26,4698,'VARGEM BONITA'),(1,26,4699,'VIDAL RAMOS'),(1,26,4700,'VIDEIRA'),(1,26,4701,'VITOR MEIRELES'),(1,26,4702,'WITMARSUM'),(1,26,4703,'XANXERE'),(1,26,4704,'XAVANTINA'),(1,26,4705,'XAXIM'),(1,26,4706,'ZORTEA'),(1,27,4707,'AMPARO DE SAO FRANCISCO'),(1,27,4708,'AQUIDABA'),(1,27,4709,'ARACAJU'),(1,27,4710,'ARAUA'),(1,27,4711,'AREIA BRANCA'),(1,27,4712,'BARRA DOS COQUEIROS'),(1,27,4713,'BOQUIM'),(1,27,4714,'BREJO GRANDE'),(1,27,4715,'CAMPO DO BRITO'),(1,27,4716,'CANHOBA'),(1,27,4717,'CANINDE DE SAO FRANCISCO'),(1,27,4718,'CAPELA'),(1,27,4719,'CARIRA'),(1,27,4720,'CARMOPOLIS'),(1,27,4721,'CEDRO DE SAO JOAO'),(1,27,4722,'CRISTINAPOLIS'),(1,27,4723,'CUMBE'),(1,27,4724,'DIVINA PASTORA'),(1,27,4725,'ESTANCIA'),(1,27,4726,'FEIRA NOVA'),(1,27,4727,'FREI PAULO'),(1,27,4728,'GARARU'),(1,27,4729,'GENERAL MAYNARD'),(1,27,4730,'GRACCHO CARDOSO'),(1,27,4731,'ILHA DAS FLORES'),(1,27,4732,'INDIAROBA'),(1,27,4733,'ITABAIANA'),(1,27,4734,'ITABAIANINHA'),(1,27,4735,'ITABI'),(1,27,4736,'ITAPORANGA DAJUDA'),(1,27,4737,'JAPARATUBA'),(1,27,4738,'JAPOATA'),(1,27,4739,'LAGARTO'),(1,27,4740,'LARANJEIRAS'),(1,27,4741,'MACAMBIRA'),(1,27,4742,'MALHADA DOS BOIS'),(1,27,4743,'MALHADOR'),(1,27,4744,'MARUIM'),(1,27,4745,'MOITA BONITA'),(1,27,4746,'MONTE ALEGRE DE SERGIPE'),(1,27,4747,'MURIBECA'),(1,27,4748,'NEOPOLIS'),(1,27,4749,'NOSSA SENHORA APARECIDA'),(1,27,4750,'NOSSA SENHORA DA GLORIA'),(1,27,4751,'NOSSA SENHORA DAS DORES'),(1,27,4752,'NOSSA SENHORA DE LOURDES'),(1,27,4753,'NOSSA SENHORA DO SOCORRO'),(1,27,4754,'PACATUBA'),(1,27,4755,'PEDRA MOLE'),(1,27,4756,'PEDRINHAS'),(1,27,4757,'PINHAO'),(1,27,4758,'PIRAMBU'),(1,27,4759,'POCO REDONDO'),(1,27,4760,'POCO VERDE'),(1,27,4761,'PORTO DA FOLHA'),(1,27,4762,'PROPRIA'),(1,27,4763,'RIACHAO DO DANTAS'),(1,27,4764,'RIACHUELO'),(1,27,4765,'RIBEIROPOLIS'),(1,27,4766,'ROSARIO DO CATETE'),(1,27,4767,'SALGADO'),(1,27,4768,'SANTA LUZIA DO ITANHY'),(1,27,4769,'SANTA ROSA DE LIMA'),(1,27,4770,'SANTANA DE SAO FRANCISCO'),(1,27,4771,'SANTO AMARO DAS BROTAS'),(1,27,4772,'SAO CRISTOVAO'),(1,27,4773,'SAO DOMINGOS'),(1,27,4774,'SAO FRANCISCO'),(1,27,4775,'SAO MIGUEL DO ALEIXO'),(1,27,4776,'SIMAO DIAS'),(1,27,4777,'SIRIRI'),(1,27,4778,'TELHA'),(1,27,4779,'TOBIAS BARRETO'),(1,27,4780,'TOMAR DO GERU'),(1,27,4781,'UMBAUBA'),(1,1,4782,'ADAMANTINA'),(1,1,4783,'ADOLFO'),(1,1,4784,'AGUAI'),(1,1,4785,'AGUAS DA PRATA'),(1,1,4786,'AGUAS DE LINDOIA'),(1,1,4787,'AGUAS DE SANTA BARBARA'),(1,1,4788,'AGUAS DE SAO PEDRO'),(1,1,4789,'AGUDOS'),(1,1,4790,'ALAMBARI'),(1,1,4791,'ALFREDO MARCONDES'),(1,1,4792,'ALTAIR'),(1,1,4793,'ALTINOPOLIS'),(1,1,4794,'ALTO ALEGRE'),(1,1,4795,'ALUMINIO'),(1,1,4796,'ALVARES FLORENCE'),(1,1,4797,'ALVARES MACHADO'),(1,1,4798,'ALVARO DE CARVALHO'),(1,1,4799,'ALVINLANDIA'),(1,1,4800,'AMERICANA'),(1,1,4801,'AMERICO BRASILIENSE'),(1,1,4802,'AMERICO DE CAMPOS'),(1,1,4803,'AMPARO'),(1,1,4804,'ANALANDIA'),(1,1,4805,'ANDRADINA'),(1,1,4806,'ANGATUBA'),(1,1,4807,'ANHEMBI'),(1,1,4808,'ANHUMAS'),(1,1,4809,'APARECIDA'),(1,1,4810,'APARECIDA DOESTE'),(1,1,4811,'APIAI'),(1,1,4812,'ARACARIGUAMA'),(1,1,4813,'ARACATUBA'),(1,1,4814,'ARACOIABA DA SERRA'),(1,1,4815,'ARAMINA'),(1,1,4816,'ARANDU'),(1,1,4817,'ARAPEI'),(1,1,4818,'ARARAQUARA'),(1,1,4819,'ARARAS'),(1,1,4820,'ARCO-IRIS'),(1,1,4821,'AREALVA'),(1,1,4822,'AREIAS'),(1,1,4823,'AREIOPOLIS'),(1,1,4824,'ARIRANHA'),(1,1,4825,'ARTUR NOGUEIRA'),(1,1,4826,'ARUJA'),(1,1,4827,'ASPASIA'),(1,1,4828,'ASSIS'),(1,1,4829,'ATIBAIA'),(1,1,4830,'AURIFLAMA'),(1,1,4831,'AVAI'),(1,1,4832,'AVANHANDAVA'),(1,1,4833,'AVARE'),(1,1,4834,'BADY BASSITT'),(1,1,4835,'BALBINOS'),(1,1,4836,'BALSAMO'),(1,1,4837,'BANANAL'),(1,1,4838,'BARAO DE ANTONINA'),(1,1,4839,'BARBOSA'),(1,1,4840,'BARIRI'),(1,1,4841,'BARRA BONITA'),(1,1,4842,'BARRA DO CHAPEU'),(1,1,4843,'BARRA DO TURVO'),(1,1,4844,'BARRETOS'),(1,1,4845,'BARRINHA'),(1,1,4846,'BARUERI'),(1,1,4847,'BASTOS'),(1,1,4848,'BATATAIS'),(1,1,4849,'BAURU'),(1,1,4850,'BEBEDOURO'),(1,1,4851,'BENTO DE ABREU'),(1,1,4852,'BERNARDINO DE CAMPOS'),(1,1,4853,'BERTIOGA'),(1,1,4854,'BILAC'),(1,1,4855,'BIRIGUI'),(1,1,4856,'BIRITIBA-MIRIM'),(1,1,4857,'BOA ESPERANCA DO SUL'),(1,1,4858,'BOCAINA'),(1,1,4859,'BOFETE'),(1,1,4860,'BOITUVA'),(1,1,4861,'BOM JESUS DOS PERDOES'),(1,1,4862,'BOM SUCESSO DE ITARARE'),(1,1,4863,'BORA'),(1,1,4864,'BORACEIA'),(1,1,4865,'BORBOREMA'),(1,1,4866,'BOREBI'),(1,1,4867,'BOTUCATU'),(1,1,4868,'BRAGANCA PAULISTA'),(1,1,4869,'BRAUNA'),(1,1,4870,'BREJO ALEGRE'),(1,1,4871,'BRODOSQUI'),(1,1,4872,'BROTAS'),(1,1,4873,'BURI'),(1,1,4874,'BURITAMA'),(1,1,4875,'BURITIZAL'),(1,1,4876,'CABRALIA PAULISTA'),(1,1,4877,'CABREUVA'),(1,1,4878,'CACAPAVA'),(1,1,4879,'CACHOEIRA PAULISTA'),(1,1,4880,'CACONDE'),(1,1,4881,'CAFELANDIA'),(1,1,4882,'CAIABU'),(1,1,4883,'CAIEIRAS'),(1,1,4884,'CAIUA'),(1,1,4885,'CAJAMAR'),(1,1,4886,'CAJATI'),(1,1,4887,'CAJOBI'),(1,1,4888,'CAJURU'),(1,1,4889,'CAMPINA DO MONTE ALEGRE'),(1,1,4890,'CAMPINAS'),(1,1,4891,'CAMPO LIMPO PAULISTA'),(1,1,4892,'CAMPOS DO JORDAO'),(1,1,4893,'CAMPOS NOVOS PAULISTA'),(1,1,4894,'CANANEIA'),(1,1,4895,'CANAS'),(1,1,4896,'CANDIDO MOTA'),(1,1,4897,'CANDIDO RODRIGUES'),(1,1,4898,'CANITAR'),(1,1,4899,'CAPAO BONITO'),(1,1,4900,'CAPELA DO ALTO'),(1,1,4901,'CAPIVARI'),(1,1,4902,'CARAGUATATUBA'),(1,1,4903,'CARAPICUIBA'),(1,1,4904,'CARDOSO'),(1,1,4905,'CASA BRANCA'),(1,1,4906,'CASSIA DOS COQUEIROS'),(1,1,4907,'CASTILHO'),(1,1,4908,'CATANDUVA'),(1,1,4909,'CATIGUA'),(1,1,4910,'CEDRAL'),(1,1,4911,'CERQUEIRA CESAR'),(1,1,4912,'CERQUILHO'),(1,1,4913,'CESARIO LANGE'),(1,1,4914,'CHARQUEADA'),(1,1,4915,'CHAVANTES'),(1,1,4916,'CLEMENTINA'),(1,1,4917,'COLINA'),(1,1,4918,'COLOMBIA'),(1,1,4919,'CONCHAL'),(1,1,4920,'CONCHAS'),(1,1,4921,'CORDEIROPOLIS'),(1,1,4922,'COROADOS'),(1,1,4923,'CORONEL MACEDO'),(1,1,4924,'CORUMBATAI'),(1,1,4925,'COSMOPOLIS'),(1,1,4926,'COSMORAMA'),(1,1,4927,'COTIA'),(1,1,4928,'CRAVINHOS'),(1,1,4929,'CRISTAIS PAULISTA'),(1,1,4930,'CRUZALIA'),(1,1,4931,'CRUZEIRO'),(1,1,4932,'CUBATAO'),(1,1,4933,'CUNHA'),(1,1,4934,'DESCALVADO'),(1,1,4935,'DIADEMA'),(1,1,4936,'DIRCE REIS'),(1,1,4937,'DIVINOLANDIA'),(1,1,4938,'DOBRADA'),(1,1,4939,'DOIS CORREGOS'),(1,1,4940,'DOLCINOPOLIS'),(1,1,4941,'DOURADO'),(1,1,4942,'DRACENA'),(1,1,4943,'DUARTINA'),(1,1,4944,'DUMONT'),(1,1,4945,'ECHAPORA'),(1,1,4946,'ELDORADO'),(1,1,4947,'ELIAS FAUSTO'),(1,1,4948,'ELISIARIO'),(1,1,4949,'EMBAUBA'),(1,1,4950,'EMBU'),(1,1,4951,'EMBU-GUACU'),(1,1,4952,'EMILIANOPOLIS'),(1,1,4953,'ENGENHEIRO COELHO'),(1,1,4954,'ESPIRITO SANTO DO PINHAL'),(1,1,4955,'ESPIRITO SANTO DO TURVO'),(1,1,4956,'ESTIVA GERBI'),(1,1,4957,'ESTRELA DO NORTE'),(1,1,4958,'ESTRELA DOESTE'),(1,1,4959,'EUCLIDES DA CUNHA PAULISTA'),(1,1,4960,'FARTURA'),(1,1,4961,'FERNANDO PRESTES'),(1,1,4962,'FERNANDOPOLIS'),(1,1,4963,'FERNAO'),(1,1,4964,'FERRAZ DE VASCONCELOS'),(1,1,4965,'FLORA RICA'),(1,1,4966,'FLOREAL'),(1,1,4967,'FLORIDA PAULISTA'),(1,1,4968,'FLORINEA'),(1,1,4969,'FRANCA'),(1,1,4970,'FRANCISCO MORATO'),(1,1,4971,'FRANCO DA ROCHA'),(1,1,4972,'GABRIEL MONTEIRO'),(1,1,4973,'GALIA'),(1,1,4974,'GARCA'),(1,1,4975,'GASTAO VIDIGAL'),(1,1,4976,'GAVIAO PEIXOTO'),(1,1,4977,'GENERAL SALGADO'),(1,1,4978,'GETULINA'),(1,1,4979,'GLICERIO'),(1,1,4980,'GUAICARA'),(1,1,4981,'GUAIMBE'),(1,1,4982,'GUAIRA'),(1,1,4983,'GUAPIACU'),(1,1,4984,'GUAPIARA'),(1,1,4985,'GUARA'),(1,1,4986,'GUARACAI'),(1,1,4987,'GUARACI'),(1,1,4988,'GUARANI DOESTE'),(1,1,4989,'GUARANTA'),(1,1,4990,'GUARARAPES'),(1,1,4991,'GUARAREMA'),(1,1,4992,'GUARATINGUETA'),(1,1,4993,'GUAREI'),(1,1,4994,'GUARIBA'),(1,1,4995,'GUARUJA'),(1,1,4996,'GUARULHOS'),(1,1,4997,'GUATAPARA'),(1,1,4998,'GUZOLANDIA'),(1,1,4999,'HERCULANDIA'),(1,1,5000,'HOLAMBRA'),(1,1,5001,'HORTOLANDIA'),(1,1,5002,'IACANGA'),(1,1,5003,'IACRI'),(1,1,5004,'IARAS'),(1,1,5005,'IBATE'),(1,1,5006,'IBIRA'),(1,1,5007,'IBIRAREMA'),(1,1,5008,'IBITINGA'),(1,1,5009,'IBIUNA'),(1,1,5010,'ICEM'),(1,1,5011,'IEPE'),(1,1,5012,'IGARACU DO TIETE'),(1,1,5013,'IGARAPAVA'),(1,1,5014,'IGARATA'),(1,1,5015,'IGUAPE'),(1,1,5016,'ILHA COMPRIDA'),(1,1,5017,'ILHA SOLTEIRA'),(1,1,5018,'ILHABELA'),(1,1,5019,'INDAIATUBA'),(1,1,5020,'INDIANA'),(1,1,5021,'INDIAPORA'),(1,1,5022,'INUBIA PAULISTA'),(1,1,5023,'IPAUSSU'),(1,1,5024,'IPERO'),(1,1,5025,'IPEUNA'),(1,1,5026,'IPIGUA'),(1,1,5027,'IPORANGA'),(1,1,5028,'IPUA'),(1,1,5029,'IRACEMAPOLIS'),(1,1,5030,'IRAPUA'),(1,1,5031,'IRAPURU'),(1,1,5032,'ITABERA'),(1,1,5033,'ITAI'),(1,1,5034,'ITAJOBI'),(1,1,5035,'ITAJU'),(1,1,5036,'ITANHAEM'),(1,1,5037,'ITAOCA'),(1,1,5038,'ITAPECERICA DA SERRA'),(1,1,5039,'ITAPETININGA'),(1,1,5040,'ITAPEVA'),(1,1,5041,'ITAPEVI'),(1,1,5042,'ITAPIRA'),(1,1,5043,'ITAPIRAPUA PAULISTA'),(1,1,5044,'ITAPOLIS'),(1,1,5045,'ITAPORANGA'),(1,1,5046,'ITAPUI'),(1,1,5047,'ITAPURA'),(1,1,5048,'ITAQUAQUECETUBA'),(1,1,5049,'ITARARE'),(1,1,5050,'ITARIRI'),(1,1,5051,'ITATIBA'),(1,1,5052,'ITATINGA'),(1,1,5053,'ITIRAPINA'),(1,1,5054,'ITIRAPUA'),(1,1,5055,'ITOBI'),(1,1,5056,'ITU'),(1,1,5057,'ITUPEVA'),(1,1,5058,'ITUVERAVA'),(1,1,5059,'JABORANDI'),(1,1,5060,'JABOTICABAL'),(1,1,5061,'JACAREI'),(1,1,5062,'JACI'),(1,1,5063,'JACUPIRANGA'),(1,1,5064,'JAGUARIUNA'),(1,1,5065,'JALES'),(1,1,5066,'JAMBEIRO'),(1,1,5067,'JANDIRA'),(1,1,5068,'JARDINOPOLIS'),(1,1,5069,'JARINU'),(1,1,5070,'JAU'),(1,1,5071,'JERIQUARA'),(1,1,5072,'JOANOPOLIS'),(1,1,5073,'JOAO RAMALHO'),(1,1,5074,'JOSE BONIFACIO'),(1,1,5075,'JULIO MESQUITA'),(1,1,5076,'JUMIRIM'),(1,1,5077,'JUNDIAI'),(1,1,5078,'JUNQUEIROPOLIS'),(1,1,5079,'JUQUIA'),(1,1,5080,'JUQUITIBA'),(1,1,5081,'LAGOINHA'),(1,1,5082,'LARANJAL PAULISTA'),(1,1,5083,'LAVINIA'),(1,1,5084,'LAVRINHAS'),(1,1,5085,'LEME'),(1,1,5086,'LENCOIS PAULISTA'),(1,1,5087,'LIMEIRA'),(1,1,5088,'LINDOIA'),(1,1,5089,'LINS'),(1,1,5090,'LORENA'),(1,1,5091,'LOURDES'),(1,1,5092,'LOUVEIRA'),(1,1,5093,'LUCELIA'),(1,1,5094,'LUCIANOPOLIS'),(1,1,5095,'LUIS ANTONIO'),(1,1,5096,'LUIZIANIA'),(1,1,5097,'LUPERCIO'),(1,1,5098,'LUTECIA'),(1,1,5099,'MACATUBA'),(1,1,5100,'MACAUBAL'),(1,1,5101,'MACEDONIA'),(1,1,5102,'MAGDA'),(1,1,5103,'MAIRINQUE'),(1,1,5104,'MAIRIPORA'),(1,1,5105,'MANDURI'),(1,1,5106,'MARABA PAULISTA'),(1,1,5107,'MARACAI'),(1,1,5108,'MARAPOAMA'),(1,1,5109,'MARIAPOLIS'),(1,1,5110,'MARILIA'),(1,1,5111,'MARINOPOLIS'),(1,1,5112,'MARTINOPOLIS'),(1,1,5113,'MATAO'),(1,1,5114,'MAUA'),(1,1,5115,'MENDONCA'),(1,1,5116,'MERIDIANO'),(1,1,5117,'MESOPOLIS'),(1,1,5118,'MIGUELOPOLIS'),(1,1,5119,'MINEIROS DO TIETE'),(1,1,5120,'MIRA ESTRELA'),(1,1,5121,'MIRACATU'),(1,1,5122,'MIRANDOPOLIS'),(1,1,5123,'MIRANTE DO PARANAPANEMA'),(1,1,5124,'MIRASSOL'),(1,1,5125,'MIRASSOLANDIA'),(1,1,5126,'MOCOCA'),(1,1,5127,'MOGI GUACU'),(1,1,5128,'MOJI DAS CRUZES'),(1,1,5129,'MOJI-MIRIM'),(1,1,5130,'MOMBUCA'),(1,1,5131,'MONCOES'),(1,1,5132,'MONGAGUA'),(1,1,5133,'MONTE ALEGRE DO SUL'),(1,1,5134,'MONTE ALTO'),(1,1,5135,'MONTE APRAZIVEL'),(1,1,5136,'MONTE AZUL PAULISTA'),(1,1,5137,'MONTE CASTELO'),(1,1,5138,'MONTE MOR'),(1,1,5139,'MONTEIRO LOBATO'),(1,1,5140,'MORRO AGUDO'),(1,1,5141,'MORUNGABA'),(1,1,5142,'MOTUCA'),(1,1,5143,'MURUTINGA DO SUL'),(1,1,5144,'NANTES'),(1,1,5145,'NARANDIBA'),(1,1,5146,'NATIVIDADE DA SERRA'),(1,1,5147,'NAZARE PAULISTA'),(1,1,5148,'NEVES PAULISTA'),(1,1,5149,'NHANDEARA'),(1,1,5150,'NIPOA'),(1,1,5151,'NOVA ALIANCA'),(1,1,5152,'NOVA CAMPINA'),(1,1,5153,'NOVA CANAA PAULISTA'),(1,1,5154,'NOVA CASTILHO'),(1,1,5155,'NOVA EUROPA'),(1,1,5156,'NOVA GRANADA'),(1,1,5157,'NOVA GUATAPORANGA'),(1,1,5158,'NOVA INDEPENDENCIA'),(1,1,5159,'NOVA LUZITANIA'),(1,1,5160,'NOVA ODESSA'),(1,1,5161,'NOVAIS'),(1,1,5162,'NOVO HORIZONTE'),(1,1,5163,'NUPORANGA'),(1,1,5164,'OCAUCU'),(1,1,5165,'OLEO'),(1,1,5166,'OLIMPIA'),(1,1,5167,'ONDA VERDE'),(1,1,5168,'ORIENTE'),(1,1,5169,'ORINDIUVA'),(1,1,5170,'ORLANDIA'),(1,1,5171,'OSASCO'),(1,1,5172,'OSCAR BRESSANE'),(1,1,5173,'OSVALDO CRUZ'),(1,1,5174,'OURINHOS'),(1,1,5175,'OURO VERDE'),(1,1,5176,'OUROESTE'),(1,1,5177,'PACAEMBU'),(1,1,5178,'PALESTINA'),(1,1,5179,'PALMARES PAULISTA'),(1,1,5180,'PALMEIRA DOESTE'),(1,1,5181,'PALMITAL'),(1,1,5182,'PANORAMA'),(1,1,5183,'PARAGUACU PAULISTA'),(1,1,5184,'PARAIBUNA'),(1,1,5185,'PARAISO'),(1,1,5186,'PARANAPANEMA'),(1,1,5187,'PARANAPUA'),(1,1,5188,'PARAPUA'),(1,1,5189,'PARDINHO'),(1,1,5190,'PARIQUERA-ACU'),(1,1,5191,'PARISI'),(1,1,5192,'PATROCINIO PAULISTA'),(1,1,5193,'PAULICEIA'),(1,1,5194,'PAULINIA'),(1,1,5195,'PAULISTANIA'),(1,1,5196,'PAULO DE FARIA'),(1,1,5197,'PEDERNEIRAS'),(1,1,5198,'PEDRA BELA'),(1,1,5199,'PEDRANOPOLIS'),(1,1,5200,'PEDREGULHO'),(1,1,5201,'PEDREIRA'),(1,1,5202,'PEDRINHAS PAULISTAS'),(1,1,5203,'PEDRO DE TOLEDO'),(1,1,5204,'PENAPOLIS'),(1,1,5205,'PEREIRA BARRETO'),(1,1,5206,'PEREIRAS'),(1,1,5207,'PERUIBE'),(1,1,5208,'PIACATU'),(1,1,5209,'PIEDADE'),(1,1,5210,'PILAR DO SUL'),(1,1,5211,'PINDAMONHANGABA'),(1,1,5212,'PINDORAMA'),(1,1,5213,'PINHALZINHO'),(1,1,5214,'PIQUEROBI'),(1,1,5215,'PIQUETE'),(1,1,5216,'PIRACAIA'),(1,1,5217,'PIRACICABA'),(1,1,5218,'PIRAJU'),(1,1,5219,'PIRAJUI'),(1,1,5220,'PIRANGI'),(1,1,5221,'PIRAPORA DO BOM JESUS'),(1,1,5222,'PIRAPOZINHO'),(1,1,5223,'PIRASSUNUNGA'),(1,1,5224,'PIRATININGA'),(1,1,5225,'PITANGUEIRAS'),(1,1,5226,'PLANALTO'),(1,1,5227,'PLATINA'),(1,1,5228,'POA'),(1,1,5229,'POLONI'),(1,1,5230,'POMPEIA'),(1,1,5231,'PONGAI'),(1,1,5232,'PONTAL'),(1,1,5233,'PONTALINDA'),(1,1,5234,'PONTES GESTAL'),(1,1,5235,'POPULINA'),(1,1,5236,'PORANGABA'),(1,1,5237,'PORTO FELIZ'),(1,1,5238,'PORTO FERREIRA'),(1,1,5239,'POTIM'),(1,1,5240,'POTIRENDABA'),(1,1,5241,'PRACINHA'),(1,1,5242,'PRADOPOLIS'),(1,1,5243,'PRAIA GRANDE'),(1,1,5244,'PRATANIA'),(1,1,5245,'PRESIDENTE ALVES'),(1,1,5246,'PRESIDENTE BERNARDES'),(1,1,5247,'PRESIDENTE EPITACIO'),(1,1,5248,'PRESIDENTE PRUDENTE'),(1,1,5249,'PRESIDENTE VENCESLAU'),(1,1,5250,'PROMISSAO'),(1,1,5251,'QUADRA'),(1,1,5252,'QUATA'),(1,1,5253,'QUEIROZ'),(1,1,5254,'QUELUZ'),(1,1,5255,'QUINTANA'),(1,1,5256,'RAFARD'),(1,1,5257,'RANCHARIA'),(1,1,5258,'REDENCAO DA SERRA'),(1,1,5259,'REGENTE FEIJO'),(1,1,5260,'REGINOPOLIS'),(1,1,5261,'REGISTRO'),(1,1,5262,'RESTINGA'),(1,1,5263,'RIBEIRA'),(1,1,5264,'RIBEIRAO BONITO'),(1,1,5265,'RIBEIRAO BRANCO'),(1,1,5266,'RIBEIRAO CORRENTE'),(1,1,5267,'RIBEIRAO DO SUL'),(1,1,5268,'RIBEIRAO DOS INDIOS'),(1,1,5269,'RIBEIRAO GRANDE'),(1,1,5270,'RIBEIRAO PIRES'),(1,1,5271,'RIBEIRAO PRETO'),(1,1,5272,'RIFAINA'),(1,1,5273,'RINCAO'),(1,1,5274,'RINOPOLIS'),(1,1,5275,'RIO CLARO'),(1,1,5276,'RIO DAS PEDRAS'),(1,1,5277,'RIO GRANDE DA SERRA'),(1,1,5278,'RIOLANDIA'),(1,1,5279,'RIVERSUL'),(1,1,5280,'ROSANA'),(1,1,5281,'ROSEIRA'),(1,1,5282,'RUBIACEA'),(1,1,5283,'RUBINEIA'),(1,1,5284,'SABINO'),(1,1,5285,'SAGRES'),(1,1,5286,'SALES'),(1,1,5287,'SALES OLIVEIRA'),(1,1,5288,'SALESOPOLIS'),(1,1,5289,'SALMORAO'),(1,1,5290,'SALTINHO'),(1,1,5291,'SALTO'),(1,1,5292,'SALTO DE PIRAPORA'),(1,1,5293,'SALTO GRANDE'),(1,1,5294,'SANDOVALINA'),(1,1,5295,'SANTA ADELIA'),(1,1,5296,'SANTA ALBERTINA'),(1,1,5297,'SANTA BARBARA DOESTE'),(1,1,5298,'SANTA BRANCA'),(1,1,5299,'SANTA CLARA DOESTE'),(1,1,5300,'SANTA CRUZ DA CONCEICAO'),(1,1,5301,'SANTA CRUZ DA ESPERANCA'),(1,1,5302,'SANTA CRUZ DAS PALMEIRAS'),(1,1,5303,'SANTA CRUZ DO RIO PARDO'),(1,1,5304,'SANTA ERNESTINA'),(1,1,5305,'SANTA FE DO SUL'),(1,1,5306,'SANTA GERTRUDES'),(1,1,5307,'SANTA ISABEL'),(1,1,5308,'SANTA LUCIA'),(1,1,5309,'SANTA MARIA DA SERRA'),(1,1,5310,'SANTA MERCEDES'),(1,1,5311,'SANTA RITA DO PASSA QUATRO'),(1,1,5312,'SANTA RITA DOESTE'),(1,1,5313,'SANTA ROSA DE VITERBO'),(1,1,5314,'SANTA SALETE'),(1,1,5315,'SANTANA DA PONTE PENSA'),(1,1,5316,'SANTANA DE PARNAIBA'),(1,1,5317,'SANTO ANASTACIO'),(1,1,5318,'SANTO ANTONIO DA ALEGRIA'),(1,1,5319,'SANTO ANTONIO DE POSSE'),(1,1,5320,'SANTO ANTONIO DO ARACANGUA'),(1,1,5321,'SANTO ANTONIO DO JARDIM'),(1,1,5322,'SANTO ANTONIO DO PINHAL'),(1,1,5323,'SANTO EXPEDITO'),(1,1,5324,'SANTOPOLIS DO AGUAPEI'),(1,1,5325,'SANTOS'),(1,1,5326,'SAO BENTO DO SAPUCAI'),(1,1,5327,'SAO BERNARDO DO CAMPO'),(1,1,5328,'SAO CAETANO DO SUL'),(1,1,5329,'SAO CARLOS'),(1,1,5330,'SAO FRANCISCO'),(1,1,5331,'SAO JOAO DA BOA VISTA'),(1,1,5332,'SAO JOAO DAS DUAS PONTES'),(1,1,5333,'SAO JOAO DE IRACEMA'),(1,1,5334,'SAO JOAO DO PAU DALHO'),(1,1,5335,'SAO JOAQUIM DA BARRA'),(1,1,5336,'SAO JOSE DA BELA VISTA'),(1,1,5337,'SAO JOSE DO BARREIRO'),(1,1,5338,'SAO JOSE DO RIO PARDO'),(1,1,5339,'SAO JOSE DO RIO PRETO'),(1,1,5340,'SAO JOSE DOS CAMPOS'),(1,1,5341,'SAO LOURENCO DA SERRA'),(1,1,5342,'SAO LUIS DO PARAITINGA'),(1,1,5343,'SAO MANUEL'),(1,1,5344,'SAO MIGUEL ARCANJO'),(1,1,5345,'SAO PEDRO'),(1,1,5346,'SAO PEDRO DO TURVO'),(1,1,5347,'SAO ROQUE'),(1,1,5348,'SAO SEBASTIAO'),(1,1,5349,'SAO SEBASTIAO DA GRAMA'),(1,1,5350,'SAO SIMAO'),(1,1,5351,'SAO VICENTE'),(1,1,5352,'SARAPUI'),(1,1,5353,'SARUTAIA'),(1,1,5354,'SEBASTIANOPOLIS DO SUL'),(1,1,5355,'SERRA AZUL'),(1,1,5356,'SERRA NEGRA'),(1,1,5357,'SERRANA'),(1,1,5358,'SERTAOZINHO'),(1,1,5359,'SETE BARRAS'),(1,1,5360,'SEVERINIA'),(1,1,5361,'SILVEIRAS'),(1,1,5362,'SOCORRO'),(1,1,5363,'SOROCABA'),(1,1,5364,'SUD MENUCCI'),(1,1,5365,'SUMARE'),(1,1,5366,'SUZANAPOLIS'),(1,1,5367,'SUZANO'),(1,1,5368,'TABAPUA'),(1,1,5369,'TABATINGA'),(1,1,5370,'TABOAO DA SERRA'),(1,1,5371,'TACIBA'),(1,1,5372,'TAGUAI'),(1,1,5373,'TAIACU'),(1,1,5374,'TAIUVA'),(1,1,5375,'TAMBAU'),(1,1,5376,'TANABI'),(1,1,5377,'TAPIRAI'),(1,1,5378,'TAPIRATIBA'),(1,1,5379,'TAQUARAL'),(1,1,5380,'TAQUARITINGA'),(1,1,5381,'TAQUARITUBA'),(1,1,5382,'TAQUARIVAI'),(1,1,5383,'TARABAI'),(1,1,5384,'TARUMA'),(1,1,5385,'TATUI'),(1,1,5386,'TAUBATE'),(1,1,5387,'TEJUPA'),(1,1,5388,'TEODORO SAMPAIO'),(1,1,5389,'TERRA ROXA'),(1,1,5390,'TIETE'),(1,1,5391,'TIMBURI'),(1,1,5392,'TORRE DE PEDRA'),(1,1,5393,'TORRINHA'),(1,1,5394,'TRABIJU'),(1,1,5395,'TREMEMBE'),(1,1,5396,'TRES FRONTEIRAS'),(1,1,5397,'TUIUTI'),(1,1,5398,'TUPA'),(1,1,5399,'TUPI PAULISTA'),(1,1,5400,'TURIUBA'),(1,1,5401,'TURMALINA'),(1,1,5402,'UBARANA'),(1,1,5403,'UBATUBA'),(1,1,5404,'UBIRAJARA'),(1,1,5405,'UCHOA'),(1,1,5406,'UNIAO PAULISTA'),(1,1,5407,'URANIA'),(1,1,5408,'URU'),(1,1,5409,'URUPES'),(1,1,5410,'VALENTIM GENTIL'),(1,1,5411,'VALINHOS'),(1,1,5412,'VALPARAISO'),(1,1,5413,'VARGEM'),(1,1,5414,'VARGEM GRANDE DO SUL'),(1,1,5415,'VARGEM GRANDE PAULISTA'),(1,1,5416,'VARZEA PAULISTA'),(1,1,5417,'VERA CRUZ'),(1,1,5418,'VINHEDO'),(1,1,5419,'VIRADOURO'),(1,1,5420,'VISTA ALEGRE DO ALTO'),(1,1,5421,'VITORIA BRASIL'),(1,1,5422,'VOTORANTIM'),(1,1,5423,'VOTUPORANGA'),(1,1,5424,'ZACARIAS'),(1,13,5425,'ABREULANDIA'),(1,13,5426,'AGUIARNOPOLIS'),(1,13,5427,'ALIANCA DO TOCANTINS'),(1,13,5428,'ALMAS'),(1,13,5429,'ALVORADA'),(1,13,5430,'ANANAS'),(1,13,5431,'ANGICO'),(1,13,5432,'APARECIDA DO RIO NEGRO'),(1,13,5433,'ARAGOMINAS'),(1,13,5434,'ARAGUACEMA'),(1,13,5435,'ARAGUACU'),(1,13,5436,'ARAGUAINA'),(1,13,5437,'ARAGUANA'),(1,13,5438,'ARAGUATINS'),(1,13,5439,'ARAPOEMA'),(1,13,5440,'ARRAIAS'),(1,13,5441,'AUGUSTINOPOLIS'),(1,13,5442,'AURORA DO TOCANTINS'),(1,13,5443,'AXIXA DO TOCANTINS'),(1,13,5444,'BABACULANDIA'),(1,13,5445,'BANDEIRANTES DO TOCANTINS'),(1,13,5446,'BARRA DO OURO'),(1,13,5447,'BARROLANDIA'),(1,13,5448,'BERNARDO SAYAO'),(1,13,5449,'BOM JESUS DO TOCANTINS'),(1,13,5450,'BRASILANDIA DO TOCANTINS'),(1,13,5451,'BREJINHO DE NAZARE'),(1,13,5452,'BURITI DO TOCANTINS'),(1,13,5453,'CACHOEIRINHA'),(1,13,5454,'CAMPOS LINDOS'),(1,13,5455,'CARIRI DO TOCANTINS'),(1,13,5456,'CARMOLANDIA'),(1,13,5457,'CARRASCO BONITO'),(1,13,5458,'CASEARA'),(1,13,5459,'CENTENARIO'),(1,13,5460,'CHAPADA DA NATIVIDADE'),(1,13,5461,'CHAPADA DE AREIA'),(1,13,5462,'COLINAS DO TOCANTINS'),(1,13,5463,'COLMEIA'),(1,13,5464,'COMBINADO'),(1,13,5465,'CONCEICAO DO TOCANTINS'),(1,13,5466,'COUTO DE MAGALHAES'),(1,13,5467,'CRISTALANDIA'),(1,13,5468,'CRIXAS DO TOCANTINS'),(1,13,5469,'DARCINOPOLIS'),(1,13,5470,'DIANOPOLIS'),(1,13,5471,'DIVINOPOLIS DO TOCANTINS'),(1,13,5472,'DOIS IRMAOS DO TOCANTINS'),(1,13,5473,'DUERE'),(1,13,5474,'ESPERANTINA'),(1,13,5475,'FATIMA'),(1,13,5476,'FIGUEIROPOLIS'),(1,13,5477,'FILADELFIA'),(1,13,5478,'FORMOSO DO ARAGUAIA'),(1,13,5479,'FORTALEZA DO TABOCAO'),(1,13,5480,'GOIANORTE'),(1,13,5481,'GOIATINS'),(1,13,5482,'GUARAI'),(1,13,5483,'GURUPI'),(1,13,5484,'IPUEIRAS'),(1,13,5485,'ITACAJA'),(1,13,5486,'ITAGUATINS'),(1,13,5487,'ITAPIRATINS'),(1,13,5488,'ITAPORA DO TOCANTINS'),(1,13,5489,'JAU DO TOCANTINS'),(1,13,5490,'JUARINA'),(1,13,5491,'LAGOA DA CONFUSAO'),(1,13,5492,'LAGOA DO TOCANTINS'),(1,13,5493,'LAJEADO'),(1,13,5494,'LAVANDEIRA'),(1,13,5495,'LIZARDA'),(1,13,5496,'LUZINOPOLIS'),(1,13,5497,'MARIANOPOLIS DO TOCANTINS'),(1,13,5498,'MATEIROS'),(1,13,5499,'MAURILANDIA DO TOCANTINS'),(1,13,5500,'MIRACEMA DO TOCANTINS'),(1,13,5501,'MIRANORTE'),(1,13,5502,'MONTE DO CARMO'),(1,13,5503,'MONTE SANTO DO TOCANTINS'),(1,13,5504,'MURICILANDIA'),(1,13,5505,'NATIVIDADE'),(1,13,5506,'NAZARE'),(1,13,5507,'NOVA OLINDA'),(1,13,5508,'NOVA ROSALANDIA'),(1,13,5509,'NOVO ACORDO'),(1,13,5510,'NOVO ALEGRE'),(1,13,5511,'NOVO JARDIM'),(1,13,5512,'OLIVEIRA DE FATIMA'),(1,13,5513,'PALMAS'),(1,13,5514,'PALMEIRANTE'),(1,13,5515,'PALMEIRAS DO TOCANTINS'),(1,13,5516,'PALMEIROPOLIS'),(1,13,5517,'PARAISO DO TOCANTINS'),(1,13,5518,'PARANA'),(1,13,5519,'PAU DARCO'),(1,13,5520,'PEDRO AFONSO'),(1,13,5521,'PEIXE'),(1,13,5522,'PEQUIZEIRO'),(1,13,5523,'PINDORAMA DO TOCANTINS'),(1,13,5524,'PIRAQUE'),(1,13,5525,'PIUM'),(1,13,5526,'PONTE ALTA DO BOM JESUS'),(1,13,5527,'PONTE ALTA DO TOCANTINS'),(1,13,5528,'PORTO ALEGRE DO TOCANTINS'),(1,13,5529,'PORTO NACIONAL'),(1,13,5530,'PRAIA NORTE'),(1,13,5531,'PRESIDENTE KENNEDY'),(1,13,5532,'PUGMIL'),(1,13,5533,'RECURSOLANDIA'),(1,13,5534,'RIACHINHO'),(1,13,5535,'RIO DA CONCEICAO'),(1,13,5536,'RIO DOS BOIS'),(1,13,5537,'RIO SONO'),(1,13,5538,'SAMPAIO'),(1,13,5539,'SANDOLANDIA'),(1,13,5540,'SANTA FE DO ARAGUAIA'),(1,13,5541,'SANTA MARIA DO TOCANTINS'),(1,13,5542,'SANTA RITA DO TOCANTINS'),(1,13,5543,'SANTA ROSA DO TOCANTINS'),(1,13,5544,'SANTA TEREZA DO TOCANTINS'),(1,13,5545,'SANTA TEREZINHA DO TOCANTINS'),(1,13,5546,'SAO BENTO DO TOCANTINS'),(1,13,5547,'SAO FELIX DO TOCANTINS'),(1,13,5548,'SAO MIGUEL DO TOCANTINS'),(1,13,5549,'SAO SALVADOR DO TOCANTINS'),(1,13,5550,'SAO SEBASTIAO DO TOCANTINS'),(1,13,5551,'SAO VALERIO DA NATIVIDADE'),(1,13,5552,'SILVANOPOLIS'),(1,13,5553,'SITIO NOVO DO TOCANTINS'),(1,13,5554,'SUCUPIRA'),(1,13,5555,'TAGUATINGA'),(1,13,5556,'TAIPAS DO TOCANTINS'),(1,13,5557,'TALISMA'),(1,13,5558,'TOCANTINIA'),(1,13,5559,'TOCANTINOPOLIS'),(1,13,5560,'TUPIRAMA'),(1,13,5561,'TUPIRATINS'),(1,13,5562,'WANDERLANDIA'),(1,13,5563,'XAMBIOA');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencia`
--

DROP TABLE IF EXISTS `ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocorrencia` (
  `IdClassificacaoOcorrencia` int(11) NOT NULL,
  `IdTipoOcorrencia` int(11) NOT NULL,
  `IdOcorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `DtInicioOcorrencia` datetime NOT NULL,
  `IdGravidadeOcorrencia` int(11) NOT NULL,
  `DescricaoOcorrencia` varchar(500) DEFAULT NULL,
  `DtFimOcorrencia` datetime DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `Foto` mediumblob,
  `IdPessoa` int(11) DEFAULT NULL,
  `IdEvento` int(11) DEFAULT NULL,
  `IdLocal` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdContratante` int(11) DEFAULT NULL,
  `IdStatus` int(11) DEFAULT NULL,
  `UrlOcorrencia` varchar(200) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdOcorrencia`),
  KEY `R_106` (`IdClassificacaoOcorrencia`),
  KEY `R_108` (`IdTipoOcorrencia`),
  KEY `R_109` (`IdGravidadeOcorrencia`),
  KEY `R_219` (`IdPessoa`,`IdEvento`,`IdContratante`,`IdCliente`,`IdLocal`),
  KEY `R_220` (`IdStatus`),
  CONSTRAINT `R_106` FOREIGN KEY (`IdClassificacaoOcorrencia`) REFERENCES `classificacao_ocorrencia` (`IdClassificacaoOcorrencia`),
  CONSTRAINT `R_108` FOREIGN KEY (`IdTipoOcorrencia`) REFERENCES `tipo_ocorrencia` (`IdTipoOcorrencia`),
  CONSTRAINT `R_109` FOREIGN KEY (`IdGravidadeOcorrencia`) REFERENCES `gravidade_ocorrencia` (`IdGravidadeOcorrencia`),
  CONSTRAINT `R_219` FOREIGN KEY (`IdPessoa`, `IdEvento`, `IdContratante`, `IdCliente`, `IdLocal`) REFERENCES `contexto` (`IdPessoa`, `IdEvento`, `IdContratante`, `IdCliente`, `IdLocal`),
  CONSTRAINT `R_220` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencia`
--

LOCK TABLES `ocorrencia` WRITE;
/*!40000 ALTER TABLE `ocorrencia` DISABLE KEYS */;
INSERT INTO `ocorrencia` VALUES (1,2,1,'2014-07-29 10:45:00',5,'briga de torcida',NULL,'-22.9124127','-43.23060','����\0JFIF\0\0\0\0\0\0��FExif\0\0II*\0\0\0\0\0\0�\0\0\02\0\0\01\0\0\0\0\0\0i�\0\0\0\0\0\0\0\0\0\0Libertadores - Grêmio (BRAS) X Nacional (URU)Torceodres do Grêmio durante confronto com a propria torcida, momentos antes da partida entre Grêmio X Nacional do Uruguai, válido pela Copa Libertadores.FOTO: WESLEY SANTOS\0Picasa\0\0\0�\0\0\0\00220��\0\0\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��@ICC_PROFILE\0\0\00ADBE\0\0mntrRGB XYZ �\0\0\0\0\0\0\0\0acspAPPL\0\0\0\0none\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-ADBE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ncprt\0\0\0�\0\0\02desc\0\00\0\0\0kwtpt\0\0�\0\0\0bkpt\0\0�\0\0\0rTRC\0\0�\0\0\0gTRC\0\0�\0\0\0bTRC\0\0�\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0\0\0\0bXYZ\0\0\0\0\0text\0\0\0\0Copyright 1999 Adobe Systems Incorporated\0\0\0desc\0\0\0\0\0\0\0Adobe RGB (1998)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0XYZ \0\0\0\0\0\0�\0\0O�\0\0�XYZ \0\0\0\0\0\04�\0\0�,\0\0�XYZ \0\0\0\0\0\0&1\0\0/\0\0����\0C\0\n\n\n\r\r��\0C		\r\r��\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0{n�.��T�;���tj���m��;<~|�����U\0�D۶���ma��ƋC�؄�km�^����KL�d��>��A�]SR�/��ND~��k+W��J.c�r�_L7�	R1��d�WQ괎�e~d���.,��B(�va���$�`4;��[���*�F�~9.�aSkBm�K^�,LK\",_h�\'��f�M)�\0&��ӻ�d|��4wf�m\'�]kһ������ad)w�,���w4h>I��n/Y��z�	�q��F�Y4+,�h�Cn�q[-��Dk~�ph�&КSx�_���vy}�Qc��.�m�W�%XH\'u�u�z;\Z�H]�9l���ޒ���_��I�:��&UL�U.��e$��`��PL=�O��XR5YtLm����\r?�>Sl�����vrSE�8$�\r,[����	�A�_�����lJĔÅ#��\\9������Z�#&m���0��d>8�ӻ��ZΚ{Qe\r-h�\nz�	q\Z��D2�Q����?�ɠ�k��۞����\\׆+�jר�SY�]�t6��h2��>���%磻e�]�qߙ�a\n���#���i��1�����.�x����B��eQ�H(��0�K�`�V�[o���S��[q�}K8\'�#9��/�t�]���%�*�zG<8��,���H�H�x(��3j�Ï���y\'�K�;5��HQ�¢�GC�~�+i,�K:/t�U��D7C /��8`ud�g#/�=`Ф��11w�ߵ����m-��^N�Z�ڶO{N�\0��1=1K��gu<�?c����w��ǤyOم�k�꺾�ͧ	���m��\ru�W�E2DrWet�׭5�tbV�N%]9�	�j48��q$����O�L=#Pϵ�9��\'��Y%�4��Ҕ�sm�S@נy`�[ �`�UxB)�\'��]�;S\r��-�����6�[���e��V���V�h,�w�)z	s6Z}+�8�v&�����	�:⓻+��UT�PZ!|��Cg�\\Q���.�yt��.����]۲�gv1g��3�Wa��y�>|��U>�E,���5bf�d�\"܉B�P;�3��GQ��W��:+׷�~}c�(F��&Qa���w��i&db�0�%9��]��w5ֲг4�I�ns���a���Ǧ���ҫ�rL=�Xx+\"<�Suw��NZ�����+\"`(�7I=l��ʳ�1���V��,&c*���\0�nr�$8������n�;\\��D��ݔ�F�tw3(E�+m�����4�J�3e&ص�1>��7Ǯ��ϟ5�{p٤��Ī��@��[v@ڝ��E��ټ��z����-\'��8o̖�rJ5n$P���)=:zu�yf%�GaD2�lQv�:�5����_Wms>i�z� I��K��8�;?W�0a���oL���fi��mv	Kq�����Ka2yW��������mUY`M9Р�E��Y@}Ӽ���<�\0��l��-��Fꆳ��;&U���GF����l��&Ǣy��^�m�rb�\0tK��ް-aY��j���d��[�G��+2#�-�n:׍Q�5�3�s��\n�fU�1V-My����ר�v/�oN����2̄�5�IP]0,�&B�s�\\�q��r	u.ςY[�\0�؋�ΆT����M3_��W\r��J�N��V}cC���1�DzV\02��-�-Y�9c����ul4t.�.$��H�湺?�^}�\"�.$�U=��?����ʨ�C���_t���;����ږ�%��^(ݲ�2���w8�.L�dVP��x��t���]�F���E��#!�\0v]�2\r���S��.ɶ���#Ow���k�~M,FV�!e�\'%�薋�a��?�m^���GĪF`N�[�6��&q�W�4��o��O�a�����Plcɽ�>��?n�� O�1��ZY�3�X*;�����Ԃ�sJ����8��HE!1�ߤ�;	�AZ��ȸ���m��Dm���g?�M/�V�j�qU�	烖�i\'�5����^0�������U�����u�r�FCf7�Ҭ�_ @�5s�{�{��QO��׋�0s]�������0��a]d�l��ȓoiZr��2\nuB�*�U(]3�Wr�tm-�l]Y�e�y�ѿ1��}x͊����Jr�A\\�-��]���]jEy��[ժjRQ+�`�,_�<}��^��<�dh��g��ǥ��ϋ��j�S0;�Tm����͕��O@�ܩl��Y�-���?�w}i��&9�2��絯ac.И�Ya�`0\0\rį~s�K, )�Vi\rW��)�������\rvw�6`�u��#EW��9�������+m�zm�0u�M�=Յ&-�L\rsp�^+���d8�8>�k�޻S\ZӴ8����C�W�(�U�;C�ch��1\'T�,��yn��T�j$��PC�)կ��b8�a���&��(�*�t��$�KMl�}/-!����}��=ϋĎt�����:s��/K>~ �i��d\\��a���mP|k�<��g@��+��ک ��u��)�Qߜ;��4y�5MKoZ�UK���msv���\0\'����ϖ�.~��_���_�H\'W`�]�U��#;�g5�;I[F�W��s$�`�%�`dMx�8\rK�_��u�\n�0�u~�.#��q�vm��:�<2��`�B԰\'գ_B�-�-k����)�/8�No6�M�q�R�0��I\0�\r����H�	\"�]���O�Ux��ȊY�������D��Q��V�����v}�3^,;~�\\�\"S)���ڤ���y�g\0c��O,\0��qQJd3%7?�:�㘱��ur8��;s��@��Q�N5q��R�o$52��<��c2s�f:j�V��X�p{�sk��B&�2����|*_c�P3����.����5M9�Cz@�j~^��Dő��v��{�^�M2���#�nf�����r;�-��z�e�A9�d�y��8\0֚v��fz� jE��t�0Cwe{��SQŞ���*�$�q�u���-l��J��4���V��(�{MKf-�4\n!��v�W��vu��mBf�ޣ=��k�jm|\\8,�\\�E2����[�٬u8潱��0�c���]R�gz;倩\"�h�@���S묓i�(�}O�홯���h��0��[�����CR���b���;���g,�<1Y����k�s/r�>�~+O�̊��\"XZı��U}�ۍ�^\\i�y\Z��r��0\n�)iLT��l�޹�?�-�\nk����u�l��$ץ��T�t��)�\'@�s��+cg0y��Kv#	&9�a�޾Y~o�e-X�t�9s�J\nO^Z��2�Η��ƨ�T��j�Q\nW5`�H�UeKh9+E��\\�i2b|@�N���%�~dA��͕ ��N����/(�kb�[�{����������WY۔lBK)�sK�c��%��:r�a��i�� sC1�:D�Y��AU�7�zv��l�ő��ĩ�[��<t�8�_?H��n�ؿ�ժ�>��{T�Ly����DvS��@�Zۢ9�9(s��[	`������H��ɌM�����X��\Z�\\V�Nd�9�<\r�eR�MXM����E&�qa�Ҏ�j��̋F���*�u�2����D.;�ٶGV�{�VE���$i�y��D4Ƃ�UӾ>3���Q9IնbM��#?v���I���x�К����@̕Ύ���&�\\5�H9���g��V�oj%�o��$	�ъؒҢ�;PS\\1�	��a�\r�,0���D�	o��Ve�8!�(Zz_��kqXg��½���n��\n+A�zN���}��c|�q����F* Y�p�b��hQ>�\0h~i���(]v�y�J!�p���;�ޣ1��c��?0��*r���g]���8���-O`n�K*\0z)��{<3Y��Nq��˞���痲O�P�!.�G+��%v�5���Pm���j7uU���0�H�V�zb�}y5^G�{�)vN�\n<�Q�l�K8�6�yp��s�\"e�,�=�U�#��y,4�ĵY4\0�I��-Žv����j]=�*��{͐\r��Ė([�uW>���E�Z8r���9��+A�)�:��:������D�(u�W���G�L�ǿh��:#�z!J���ȼ!�0�%�]�>z�\0=MeI)|gV��#��ZR��5(�\'�فQ֜���U��T�z-&�Z�Y4N�j֭ͤV*h�%�1vԂe���$F�ҒuZB��Y:�:�z_%\r��ENoĊ\nE�5�0]�v�]�(����*�]���ك�y� �#N�l�|K-�3������*�}��+|�H�]��I�c��p�W�֫$W�PB�x{4R�bF�J�}[t�ޏ?�5s����F;�=���q���-ڽ��<�7��n0���c�����\'���yŌJW�>��N�3G��yӤ�=:Tn\0\n��9��� A\0\\�E������L�>�ݢ_JŪ�WA���?(�\n�Ԯ�t:�3:k~�z�Rb5k������z�h���h)��e\\wJPڹ��u�A��s�ÕU��oB�>O9�~��?(�����%�_5�\"Q[��Z�����߸�U�H��^8�I������L��k��8�ohm.O0l*�g�9�I�b1�����ҽ��w�P�Oo��#;����Y_�\\�r�W*X��Z8job�\'�]eĵsQ���[t�9\\���#�������(��ܫd�B���Z��]�mT�����f��3�x���/8�Ă��p-I��*�CR�dq^�t[�L�+loJٳ�1���*6\"�?x��}<^��H�M�����Ul���3�Y:�dN�kzքi�?j��v&���W��:Q�悝q�n�G�MP�6j��b�z�����f9k���[C>��si xX�W;�//��?�/�A� bO2�0s�N��܁=�s�OΓ���#����8�\'���Lx.��2�:��q�u�P�߲D��z�^� �<����|{��\r�8��g���\nh�/�\r����)V�ѓy�d�&���e�Eg������S��mV1�?+l;�+�o�\r��t�t፡������MrU�P�{��+�yf���f��̇\n�ӿ���T7��_	�\"���\0ڧ=t�aWqB?�B�v���./�������2_�}M�Y[}l�w<\n��[|�����*@X@C-�T�����h�F�#eK6�,,	��*M�4�d�·��UL;VQ:��aT�GN�H@��9��D�Q�/��\'�s�q�Za�Rt�+��$V��GYA�\n��Q��71D{�mS���Q˫;�@7��۽~��-���l,�B[p����y8���X�=7ŝhJ�)+��4�ʵdJ����7�9������e;	ҭRR�����s�>^Y���H�k9���m(+.��u���XP)]����uv�\'ұ+�H9���֑�F��d��>ىz1��$i����i,�X_�Ny�e깬��c�|ǧ�r����]����{`��=���M�4T����][���G(N�lkf>�ު=�DO==��r��kȟj�	yնۆ��iДD�(�-��_�0��<��@T��}�F��B�!��C��e��������16�p��	2��Zp8�-�YOJ��;F���.\n�o�\"���h�-�*-�lL�U^�9S>��D�}Ș_eҐ�>u�d�.t��~���3W�g��{f�>t�ϑ�{-�2��{q�+��z�)3�K�I��I�^�0���N��b��e����<��`P��C�\r�埭�\Z�yC��{�n�%����^�r�5�1WZ[�A��Η�n��U~�lk�*W�W�������;�r;�\\qc{�-8���Z=�޵g���\"��U�*�xLN����6���������Ǽ�����ki�.e~��?O�5�{�}蟟=��x׼���oy�;��K��{ɵ�!��ɕ0}�9���I?��&�)_x��ށ_�Ǎ>��?��\01\0\0\0\0!\"1#$2 3%A&50B��\0\0c�M��fm���\0k��\\�7��#�;@�K]�x����a?���?�h�F�\"���v��cwGu�榎�b�U��T^J �j�۶	��#�Ў���싧x���#�>�h@6��B.6��R�󵮭2a!�]��qE���\n�q���\Z�V�\Z`����bF?\Z��4b;e�dP�����`�ȑA������	~Mv\'�p�y׊,F\"cߚ�O�m�~9��MO��M�p���o��5D^�%���v�m�L��S܍�q\\�TF�\Zōeui��H�F~���O�(h�\Z8�-�1��@5�֘��6�L�,��t_n�s�ޱ��F��ɚn9�3��~0�s����3������0-�����Q�I�wk�X��nˊĝ*C�	d.K\"3ތ\"�Y\r��Čv#���<��v����]�1ɾ�r)\Z�f��d�\0ǻW�6�}Kzu������\rIPɚ�_f4��+3|Go�]�W|{��3�6�P�٤)��J#U1��v�rEFp�N�;X��Y�[0dG��zlo�U�٘�7���=ǀ6�٥D&�xa�ؒ�;ٲq�=���QIBc�6�!y��u��\'Y��OcҢ�a�۵�\'$x�,u�=���R?�Mb>�VW�8���5^�\Z5C��U��\0o�\\%�iՙ6�p�-W:��6�9�p�Y۩eo�o���w��][X�ovK9��64�����H:1�z`����	�S��n�\'$��g�:�G���)X�wWb��e_h��ϊ%w����soa\'��>ڪ/�\\�َj98�#I�27��6����R7z;�#�W\'���89ҿg�uc\\W:!#���䦛$�N�@��\r��TEG$5��9쭁:i��q\\c���ډא�L�Q���x,\n��*�Ȉ�Z��F�3�,��I͌���&j�nj#�E��8�ȁ�vˢ$rW@^[�f��+���x.,Tpъ�;c��\'���n�B^��w���zr{����������}z�y_�g���=�?�⢦O�P�J��c�*<踖�4bpa\0�{����_�b8d��Q�+,+[\nIb\n�9�ӂ�5Z�(�o�A�F�e�#e��y%B�\ZG`�Hv�>G��i��ۈ�ɼ��G��3����\0v�/�����{Ƀ�ĒY�\Z�h\'�R���f��.�Vx�V����r(���Z湉�jp �c�ݺ(�er9�s1�]ʬ�R\"=?�ƥBG;su��1qA�nn�����\0g�W����@��T�������r�^y�A�C�ȍ2��и��f\0���Ʀ�#]���ny#�Tg�DzTF(�nl;Ir�;�L��:�lV�L�#�Y��,У��E\0$��B�A�G}W�a8��D��4�%�Ŷ\Zܲ�H���\Z#Fo�bE�X�ʡ$����8��(��ҕf��*��tt4�b[�O�h�\0Y1�hJT�I������:%��\r󗏚�ě�;=E��[ܾS��,a��Vjhl_d�9�����	S#�==�� �y�����Lv[�3j�<�?F .>C�i���Hx�p�fG��|x�@�+^�l��\0�η�sW5��Uʈʀ԰[�Uv���y�GS�O�+���Fk��b�C�/O�	��\n8��,��e�<$w�-����;��9�s�<��UP���u\ZS���\Z�,V�@��e�Z�X�\"����6\\�jZ���Gs&&D��D�e;�n6����qZ�ڙوF�+۳���+W4d��q?v��9�,��\0�S|p\Z��D�J�ǩl�q��lO��ɶ�����M��{=��5����{����ߋ�Nƹ����5��M\Zc��`mc�|)���Ǖ�b���$�&Q���饂�E��w�FX1�L�5:�\\���-�;�1-��Z2��wn!��-���,�/km#��kr3�\rdf��[Z�5�@�ʬ$*u��¸�.\"�b�k��aam5JK���7]�2q>�M�H�x���v�UJ,kh{�S�o���?CVq X2p�\0�T��E B��%��w��мm?���渥��A�\"�s�{��j,���L�%w	�d+yf���Ύ��\'���=^YQ\r�U[Գz�d�ah#�X��E�h�,ɪHӾ�`��H�L6D;\ZI/�T���c}�ȏ�o\" $&���n��v��iP���YO_!��ݲ�DL�k��-`X*�1Z��6HB7�è����a��c@up��E֬g�4�*�B��{��e�fq�\Z+]�5@�\0�j�x��*ό�)�*�}�\'6��-\'S6T���뫏$�<�R1d���r�6}B��峥ݕӏP>��ư�}�������L�B-�b\r7�|���z�Kx޳�|�B�!{,��IL�j1�-�:�t�L��Btj����Մ������ċ\0}b���v������1S�$͒��1D�rHwUD�uk:��}q�ib8�g1�|��/�y���o=~�\rk��8��)f����%�k�0��4�8x�ރ��GqX��@�4�4��HGI+�Y;(�(�Q;ȯB&#��F2�i,-(�[��x���d�Ge��Ԋ��ز\\���92;ɫ�y�E\Z;<O �4˜�Ԓ\"�=�xV8E���%�\'G6iHi���Iq�ý�r&_��\Z�9�z�`���T��l���k{�:٤UF� ������\'�IcT;(���a:�SYJ�眰Lb2}3��Amkn�����P>E�Hyx	nh��XeDa\'�<�V\n�H����_�m���{H�CH������yZ���ўW�\"5���7+�hBK������J�b��P�Lwɯ�8+��uҮ�M�W\'�͈Q\'(MA���q��QP.�6�I�]�NUZ��Y�hj�j\ZQJ�Q�K���xd�ȩ#Oi��6%�R2L8�A�̀�>KU�3z�\ZD&Z0E��\"H���\ryR־C�Z�!D&根z*/�6��\'GV��\0dʀ�pЌ��2$�Jf��{\Ze�ke\"�����G�KHPC^\\��p�8�D#:�]�LT��i935%RU�91��3��>G�{.{���6ҺdeQ�7�N�%Dg\'����qT��xܓ�ƙ�D��ծвАe�D�A#�N^Mc�G䇩Pr�f[��km@A��W،UZZ�D�����l���5�M=wT�}��\'9�r�bC��H���NU���)S��%J�a$���{�dr	��Ē�E]D��ȇ�D�d����坧�!�	T�<�\Z\'�]��ϝ\Z��Ե/��T�T�\\wԴ�\r\\3{���9��ƽ\n��\0b�[a��ݒ��詏^J�t��VX��u�un5����f���\'�u�;�2�:�2��ר��DF��s8�\".m��9��k3B=Gf�.#\\�te%��)��-}`f��o�sw�7TL`j�b�f\Z�ۭ\Z�N~��\Z{G[E�Z�#\"������Ē����u<\"�q┱�/��[���F���%��_g���\Z�4�\rE\"#��ja%��P���\01ԄgGF��F�>|c��bf��$HG��g]�7T�������L�28r=��7�nj�(���/{�\\/�p~��92������������>�0n�:o��K$�l}AQ��]�	�q�$�g~|]�b78�$ߗ%p7J��1ȹ<����\0�X�;����i�Q�.�c ��B=A���^�+�/�\Z�����c���M���$8��l4My	\Z�0�a`8)Y\\�>�i(>f�	5h��|;Ւ�̐�[U,2��w팲x�li,�3�P9B1�\n�%��\"�郑�s�_�]� [X��%��ód�/�����>��H�tz\"�L���5k�e\\}Ðƹ�\Z�ݥA+p�kG_8��(��n��i��|]0��F�ꂅ���o�w�z�u��z.�jv\";�˝J�.�?L�y�NsZ2K�֝)Q�:1G*]��KM��$�.�(�>#�U�5����Xﲍ�Us�ݏk�&/{�\\ّM\\%�c���>s�Bç_Wl��F���Ҷ���ˌ:㟋� nc�r�	�W�;?�3I||eM��$D\'G폱 �MM��SY%��ͳ�����Үp-z3�&���&O��L�2#��$��Ӟ�\r��Z�W|��PGF��1YRv���k����_��j9tD����Z˔���eW�yb�\0�V�2;Gz=�œ�sb⁎����fhI|��UlZX�x��R)�ə0o�_]�Wc.�5]1J��i\ZD��8p�bò���d%J�WE$YH��S�AKt��!�qHH�{,����>\rwn��J����\Z]+�0����\Z;\0�x� �\r�a�!位�k���*�%t�U�+$G��Y��QG\n>#�	�����w	۞�R|�捃���OK卻&2	\n�|�tq�N\Z���E�x���U��r�˵���H��(٪XWY\"�/h�M���nj�3�w�\Z�\"�T��<bV@$��C<m@%R�X_�&���v�+J<B����f���ŎG6�EÜ��0��Ū�H�����;J�Fm\"�����\0s&�8���U�{%�n%BJ=`�mNB�Xm_�x�e���P϶��#�H+�s㼻$ܪ�琄�1�b8�ּ�/c\\�����X����%�B�Qr�1�a9�X�<�����[-�k��+�B�{�h�kb�-V\rܙ�h����R�U��-��C���\"T3��ŕ�uϫ�\Z�� ���Q�`�:ȳ���űZP�=�R6�9����侴;W�H�J$�c�+zdcm���f.��Ś�7C�3�1i4��Kb/�~)��YR\\;�]�&I5R�&���qY\rG��z�9��@B�B�[�u Y&��h���i�IP��&E+]}�FT�*��ʩrs(�M�0��#�5�s\n�;+��c��b����W�6a>�pr.=��sˍ\'cS��X��=�\n$D�B�Ya\"�t��f��t�D��A���o�2,�3+�RA\ZF\ZwN\'8Ъ�Bκ�CE���&�р�lܰ��¨�=K,�]�{QQ~��љ]�8���:7�\\ML�s*��x�8�cC\0x��>��Μ�Lh��nm����8���,-je00��ѳӮ�ɝH��W��q�g_�s$ߐ��Y�Qo&�����}�����bV���٥��r�O��h�H�^Bh �}����Dv*.DfrA��4{�m�W����7��Tq�%��e��)W�W�l�e�ͳEO<-C�91O�m,:��Z�3�3���\0 T��j�Y�\rk�B\'9��4f��K��]ŋIet�)��Q�o*O�\"H����n��]\00�촊�iN���GdB�����8V�;��أ}׌��!���ΉioU��qqKR]�\"�]Q��HǞF��g.�+4�E5f�Y�%:U|��y	�u05Sς�Q7�,�ȬT��g�m�*΋/�\'���{�VcN��s����AmkY��)\r(Ҏ��4���F6��OMGDǲ����Ҙ�A��2�;$�OǪ��5������C	��#��l+_P%�qwlʕR6ۚQ�\'��艖�W�����v�+$��E�y�F���BP�i\n��V� �E�Skj�D���%T(e08�r�Z��k1�����:�-S����O����:B��Ǳ�W���#��17�,Uŭk��26M|��s#0l^Y6���c&�4�)T�b�������ZY��2[f��D\'q��$�~����\Z>_E$��\Z�l����,#�k��\Z��\0�f��]�Rs��+vI�ɣ��Sی�偔�ř�!�F=��q�熈�V(ּ�cUtǷ�ur��f��\'vHwd��j�~K�w�J���s�F�Z&�sѾd��lb�h���U�XE\Z�XcWݢc�0�w�vbN���$���x�ESܸ��d\\�f�HH9���43�R�\r�J`\\��%A(�x�H�L|��L��{	��d��h����N�A��s��l{V�U74�@mu��u�N�C0�,m��V��%����ڽ�4=+g;�����;�t�x��҆ ���蹡�»ݢ�w�X$J{wk ��ʙ*��v��Ř�S��x�Y�7��TE���3��܉!�®�\0i�����r���	�b��\n34�f*9F��9d��Z����cw�G+WOSM���aI�j\rVќ��=B�5�^��e͗j��\r-���k�%]j�Z~EQ�*@��gٯ��������5!Wjj�R[I�-a6;*���3�s�r+RH��3+�s��d���-X���ܯȨ7��;�s��}bڞ�޿H��]k7\"\\:d �#��c�5c�=�V�װj��E�`�I%�\\����봀��$h\0՟���yVcm\\5~�p�Z�M���TW �so%W�Ѩ\Zq������$35�\Z{�x���M����P(�#��aٔ�� �vIc��P�u	9`#���������N�8�v<|Շtd�?$�C��\n��\0\\�\0���]+[�x���S�dM�W\rV9����М�!�(����\0L����\Zq���w�H֡�9h��\\F��Wrm	�����/������u`�>E����G����wnҙ��N���2vqGiW�߱!G�Uˎ�K}]��d�lvN��v�:[*��.EX�\r�\"�o�	C/|��!$�C�j����Vő)\\���x�CH�A�f]7��V�qt���r�=~&&�Ny\ZWQ!R@�C֎���;E,��Dl�k��\0ᑹ��*H���4i�m9N1kZ���]\'>*���D�&E(�I[Į�%�&�!�~�OTi\nKh���1UM�@ԓ�\n�=��8��z�]������签;�/�[�q�r�o�\\c��SG\"pҺ�3Š�&�kl�Ttc�N��E���_��%�ȑ��\Z6E�U��\"�sW�(�\0썭哷QʋT�}�#L��$�\Z)Z�\\�G$�/b\\�fEc�\'Eت0pQm�}�Z*�\r���Z#<�Y\rU�n�r.$��=3�n:ɍK��IS����]?nȍI�\\�bo�3�n$��y��Zg���)����7�H���Ǚ��6Ӱ�L�aa�_����)�\"Hj�I8b��C�9��l\\�c�������\Z4-�n9�B:S�y\\EF�{b\Z����܂\r��S�����������Cj�V%{�<֗��ᖵ\Z^@4&�:Y�(�E�E4�xV���t���v�\Z\r;\n)k�&T�9��h;���I-�Y1�V�BH�j$~��\'�1˜��Y�B��;�b��\"(e���/y��X�3���2@	���\0���R\"%�z�%�z�y��bN�;<Ʈ>w���t����x�Zh�OGP�%�Z��\Z0�Ʋ�Ҭ�49�Ul��p�ϙ]&�dd%t�QX�����J	\"emx�h�&ĢϘx\\D���,�.���-$��\"�=�,!���D�H����7�HF��2S(�ja�c�eZ\n(��ē��d*9�a�������z.�$����u6�q}�Y���DPi:�����Q�숪��6�ߖ\"튼�ʧ�QW�$M?)P-V:\\v��/��-�^x�G,�BY�ցT��z~�j�1�,�c;_���;�~!��;\0!*,Pm5<��w�zzU��YU\\F�1����� �3�g�͖q�*�/���J�OX�M@�e�Q`K�fCT2�x�C��\'V��)�K���c�ot{�]9V\0s�qȏKM4�x$E|xQ`��A�l���n���H~m��C�$��&f�s|z�\\��sy�	�=�%q6�[�<�4�C�N�n�f�SFM�e�%tGW\\ǐE_i��v�F�4\\��\0e��Z����)�PPN��$~_�Dvr�X��!�4%,@�/���+��\n����7Ʈ5pN�D6�7��Җ�)t�ad1%l�\'���i$y5�ڰp�Ff,��b�.Jғ��	}]0/�&���u���E4�uv:uc�|V��O�ȋ���W�y�[\"��d����&l�l�O�TdE�\'�El6/���+1j:WU�#X<ӯQ�{1I�Xn����5�goc��\'���N�e�Qp~�уl|�Ղ�Ʌ�A�c�����4�����p��\0�s]�~2�+�˶���KR�tV����;|���\0n����ҥ���\'Kҥ�QQ�</��\'=\\�_�j�ݳ�޲�y:�z�!)\n���l@\0.l}A�O�D�q*u���:ĖU\Z�ϊz��,f�����Wd�ɶ����5;�V!�Ȳ��f1aQU_�63�&�n$zя`GB���\Z`�Q�٪��On6�]������eu%��^�4�Hl3��X�+��A��\'��c���\0�w��%Q���͗���h��5!\nE��������3���N)�mQ�9�T�	q�쮏*ɦ\rY��v<�*cK�]�`ϾFF��5#�u�r����Έ��r(Ȇ�a2ʬ�\n�{��d���ѝ2D鞋�_��s��	i��8WG,(�J31��7ϯ�G�k[e�(��*�`e\n��{�R��Z&ຫ}T�#\'��s%dsA,��\Zxp��\Z:�m,l\Z�ӥ�:��^��\\鑑��>J���8&;a�I.j%������s\"1�B���Č����/��wu�����v���a�\r��O��/�e�|h���\Zye��y|U��#�bX쌐��عI`��v�_A���HU�f����\'U����L\0�1�����毂8LTG��$���̿�@\'�=�ɉ��u)&�\"��J����_�T`ْ$0)\0��c��U�K��Ռ�K*�ƑO?l��C\n=�48F�ir�2KH���\"�Hp�K\'�C�릸��\r�p�)جAK{	TX�lc,t�I̛Ƭ�����Ŋ��$v�>UL+�S%��鈙�B�Ȩ؁kTqe8y�l\'�8�\0ӭ�ݚZO�uH����$-Z�K��W��C29���q�,VNKQ$�ȳ�pH�ѹI��	�c\n�:���:W��b����Ic1\07�q�j��H��-���D6s]����f�l�e�%�����q㉚b�lfƍ�5`Z�+$i�j\r	�!F�7��}!���mU\\6��]1՚����;e���8rZT$&�����g�l��EUPV�G���?�\n͋]%X�By�:|��j���M٨�9���R�@K\Z��\n�����R��z`�_Ғ����	Ώ��k1�G$نI1����5!]���G�l��X�\"ƔtX��Ȳ���AG\'��NbLG�>MP9��@��G1YE��J��_w�̌1�f�؞��I����y79eBv��b��ł���,U�U��T#?:�\'!\"�?=��\n��u>,{�����F�z���z�P\Zy�h64>�G̽��B�鬵Y�Sޏ��UL�������̏�b��֘Ӱ�m\\C��s���L�*#|�o���:D��W��\Z�S㜕2�P,\\�f�5����E�s���\\t�\\t�\\��KA�J٥�b�rA�\"7���w(�7Q�=�l�6�S�Y��d��S�aXY��B.��*c�5�M㑬�W����F�������v5�뎟-��������GG�]I�B;c5�%��j��&7�4�%�=҇CPj#^Jc7�V��.�z�[�^�mJ��\0���Z�W����x�z�_��WӍ�&�gZ����=��j��,�ȶ��j�-5&H������l{�e�M?��v�is��8�n�0]�휽��.*T�h\n-Hף,w\nNiS�jg�\"c�3�\"�!�y Ğ����{ߒG�7�	��p_$��\n�ZRb�������T�Qj!׿8Z[�{��֩�,E���Ⱦ�ʘ\\U>�3\0>H����j�.\r2�?}���rH���ֲG�E#�h�/�`�M�����VD�֚�m&+9�}7����������r���N�U����;*>������:�GI�n�=៪��3�!�K�ʊ��I0.A z�O�4�	ҽ�$�[3x�/�@���(�r�)�U�=��e���f16�O �_1��Uý�s��Kg�o�\0�4�r��:@Ru�@A���zrZW�GDd�3ǜ��I�n�.�v�c�h��d�GB�p��#,f	�k:�\rF�3el���ճ#����٤�39a�9�R3��~��\0p#�v�+�:l��be�r9�P�b��\r�Ҳ/�����:K�u�/O�)�{����/oԡ��0������!9����$�&A�a�a��O!�b�_Mm���/ӧ,�s�W*-]S&�蒲\Z{�7]�W����\n�Nx�C��������5����Ts;\"���w%z+QX����U�a�$��{�z]���[��\0W�8��죞�t����U���:C��وN��B�a]\"��y0�㏙����U*ɜ�!-p�j@���\Z(h��U�Ns�+�7�>m�o\'D�yr�I�q,�z*���e�H���f^7j�/�q����<ڏSiq�HѾ�����\0�i�~e����@�\"*0�����i	�7���r��&�;U����e�r#v���L_�D�])�\0Г�	��,֍��I��p�YE\Zc$1ؒ�q���Hʋ���b&\"��!!l��?�j�ɧ/F�\\jpl���R�0�SrF���\0��/[��؉#tȿ\0�ރ�|I}�t�lY�F ��GG~O�X|�:�o�ǧ���\\A������g�-~Ç��#�z4,ZxnF����~���5T��\"��1�x��jz�2\\�J[�b�H��ʒ��k�`_��T,&��L�Z��$d(��@LW�x�k�U��G�\0,_����z<�\0�m\\_���\0������_��\\_��\\wӣ��;��4��5����6�	�ލӂ�RR��)yUJhp�����H��v62��k�*��k�E`��M\Z���h]��[�\Z�ÇQ�N٢�\0m!�Q��c����刼^V��-����\r+\"7��W5	8�Z<\\��\r%|=n��\'	9͆����^hZ�}K�\0�+�\0����G��E��3[����(���Ğ��56�3�L�<��13�LYI�JbIM���!7�M���%3�DĔ��7)�ޙߝ��!1d&6Ny)�Bgzgz&y����m�^潮�vvgjm���ٝ���W�$��R�v�fw흈�N�i���9���[��q���-p��;;��(l��+ЎV����ޖ��J�\Z�Wx�5��Y~,�]\\;g_IO@\Zry�,��u:����MT���\\Jo�ɸ��I;�v��g����a�a��9�;<�u���v:Z�~س��3��=3�L�T��/��y�\'��z�qlSQNKa�梧��|��1<���j$�g�/|R��&G�B��L��PL��g������5n$�TYx�}��\\l��خ_%sЩ\'O$��G�	b���S�猪q�����䬯�h��s7�Э\\��a�d���t7�J�{wMը�p�G4V�V\ZB�ue	�{hD\r@��%��V��oS�|�C�����!��U���5hUiVA7iI��A+���r�LMk����)�mc��Py�=��C�VtƮ\n�`������#]\0;j?��ӹ|�l�iC1�D#�ɓ$�ĸ��q1��rSu%2I��OX��=�M������j�F�B�%�	�,M1ݢc�\\�~�&~�&%�����K��\n�.��u�t�;[�P6�|�5A�\r��=<��G�_�I�t;縄{]�L� M��\0s����S얳�Sy8��6��v�^N�! iX��u��Y(Kf=�UC��I!�+�#Z8�Dv�f�%�lk�`X&ó~�A�V:0L_A�]�P��M�7�����܄~c?�9l�j�t�QdI��n�٩>Q���t�;l\'\0sd ~���*�	R\\^��#�+���~�w�(7Ty�p���>����se_��WG��h�E�qyf��7��ܳ��o�&7dzy7�$��p�l\n�yeV����y\rj���4Ɠ�q���֬j�M{��G\'�L��ب�s�X7l��T��\0/(��Գ:��s<�+I�z؉�F���.<^�}j�cN�ܗ-Me]�\Z�j����#f�b`�]N\\~Z�]�5��r;H��Vj8��]�Kz�����\Z\\����\"�H�>�^�z�Bg�7�~\\m���94��T2�rA������o�.�Gb�u�h�M�)�\"yxg��qR�����\Z�fo�����ϥF\ZKc�+*<Y�v�W����ڟ&N����Vq;,ce�pv�?t5+�0X0�pd,���9R6�jk�|�~$rbɁ�|]!O�\0�9Z���J��̓��ƚ� k+D9n�����A��*눰�\0#u$Z	ˑ��aWVݨ����`!gM�4C|a\\I�e��UV�q�U���s��QDn�/my��n��/Ą�+���/!;,J�zJ�\rf<.k�7.�5Er�;�e[wq�жIs欢�=K�3���y��\0�����9�fv&h	]Z���&��S/��)����\0�Hp!��`=��Ŕ2�L��z&�P��1#���N���j6L��1*Y��\Z��TDJF�\\���i��%|e��N��V��,t3�3O��S\"KKZ����V6t\Z-ݼ�Y���G\nFH�b��6���g=���}�L�\"r�gE�\"���>Y��N�n������0���1rG�o�v��]��*/���#F#J�\0؎\'9��VUĳ�6$|�W��>Y��{f��>9�sF7��/ڔo-�yVI����#?�kɷp�C ���@���ǩ92�F�Y��蕝��=G�ൗ�*��Ƶ\Z��.L��6	>�H�:�/�h%}mtZX�}�����u�X�v�Ͷlu��NT4���T�94��E��)�C�w���y>Γ����L������\r^\\�����Q�&�nݐ^�T������@���Џ�с�e�ԺV����:���X�Ҏ�r�uPNU1����\0q��{ڬrcS+��,�O�:�\r��^Mp!�W�;�����Hˆc^;wK�a\\(m�q`�(̏������\0�;���[�c�L^MT�B�\\�0�����(��c\n�U��iQX�3�buP��T�	Uq�\0��8.چ#bK�g�B�4x�S]�<ҫH��n�%��v�!��\0���?���1W�16`y�@��R\\��\'T|�$fH;���K����M��pU������R��D��m��Q^�\\޺ʝ��M޿�o����F���:{g��<Ex;E�*�f[ip��,R���M���]�7�:�\"=t�{���23Ri���gTy2�H�\0���[����\0-\0\0\0\0\0!1 \"AQ2#0a$Rq3B��\0?�j����F�|DF���3�^\r\'كH�pR��v��\Z�҃�J��X���� B�#i��2�>���:���%���,3�c�V7`���]���Ҹ�TEM�L|�ǫU��_��?�M`���1\r\'ʶy���|��m9���@�황I��@13���\"z����㪮x��\n�J��Pxi�euߺ�\'���>\";J�#��1�#P��AR}N�}@�&?�@�+�5��o�s9���L�s=����`����M���HV���V2��M���.ga۳�V]�6�5 )\n�OJS�j�&X��Lez�=�/t���}8c�4�]���D|ʹ�]�I+���vc�76�~�����U�M��b\Z0������|�r�s��Ҧ]��X���f�z�+1�z�����g+�e(ɍRJ�%�|B�lL`bfY�J��8�������T	kاk�4�2� �M�F�W�#��Ӄ,���zRp����V�����%�o���������z�B�y�p6�)��\\y2�ÜKv�&U��`��2Ũ}�o���eZ�ɳ\r����m�~��L۷/�=�k|M?�q�eV+�����v���r��wA+��_������[_������ɝ�^ *���ѨW��\\<r�,;�#6J���x+,bfJ����~ቦ9\n0��O�ْzTp���xij3i�z)��Q��ՖS�s�i��NÑ;m�t����m|{aV_=D�,}�J��\0 ��s�v���V�\"��%U�c3\r��f\\���0& l�ugv輰��I����f��\0�ӻ��b���0f�)n!?P1��vURL���^�0(Q���D��ǡ�h�����o���̥F�݊e���\\0\r�+�y��ewe�=�[\\�`�(9��t����G1m-nбp���㭯�L�Ļ�=�/90�67{l�\nr ������Ȟ節��3��~8��L>�iwf5�0D�n��\'�+z�I�Kj��&O�(���N��6�$���L�H�oi��3+�]J���l$DR\0�;J�v��j�7=}��6���kX��4��r�*�Ls-�p ���gޑ\\����N��KP���U�>�[3M��Tp�k)�-SVq��p��6�&;)n\"V���2��?�V�LKx����	�T3�%�C������#�c\01\n��vǑ6�ȉ_90y�� �3��s��a\'i��]�G�Q șs�];��4���UA��R��V�OJ�5\r����h�m�ikX�L�[���t���� ɕ\\��i��n2�v�v�ɟ�X����aq���y{fg�&s7���M�wP=���<���Y����ݦ3��g{3� �(��\'|���{_�.Z\Z��v}����E�8���)�r�Kuv����D?�ev�?R�\0P����q0T7�\Z�\\��sу�����U�b^>GKX*��\0^z��g�m������y�[\Z�;�#{L�)��9���j� ��-�f\Z+c���ҍBl�*�7���e,��\r�c�i؋�͝�F�K�D���RKP�f!㦪��\0ֳJ����}k^O�o$���[ǡ�� !g�)Zs��-%#�F��n֚{6jL���C���?1,]��^��O�H59���>guc؛y�B�f!�㻓-?�J���\Z�oJ�K׈	�w^kpv(��~�n�|	c����%M�z��.¥���SOn��2�w^-(�i��d<L��q�@��#x��̭�	��:�X}OźŕP\\?���=iM�z�-���?��\0��7s1k�V%��W\\@����̲��E<˴(���Y[T�[�6GqZ�3KF?�������y���=�M���nS�f���H���;�������~��;��&\'�{�����w*�ȭ�ͻ���~b����7LM��j��M={�a��.@i�z5{�g�1y^b`�?U0�\0����=ǈ.y��ì��BsϪ���\"��e��\"g�<��ӶSR1���M�st{6�/��6W�%WV}�є0�����p �o�s[	�x06�s�c1M÷��5-I`�y��k���Q�۟3��R�a OǷ���o�geǑ\0�4ŏ&*�q2������7K,g<M��\0�b2�J�t��u����^�p&:�\0���\0L�_�֧ȁ6������@��ș(�G?4���\0tY��[�V����D��� `�i�=*a�+\\�\"*�jm3lO�3	���ǶV����\'&��e�ǫ��O԰�Nb�y�E�D��c�����q�Z��*��Ei\\\n�3S�6��(��/^����M��^#%m.�3+]����\n\0~�u�7F9oWu��V9���q8���;+cZ8���r%��a��tE�0�y��|z3Ҩ�\0�C�ܱS>fBO����=��\r�֞c\"ve���t۴�G�V�e&j@�t+�#t�Ǡ�*����Ϙ�#�gE�,�zy^���I����\0/\0\0\0\0\0\0!1A\" 2Q#0aq$3BR���\0?�>�rV�b2���6(�=��3�U�����o��\\�E���?�\rM��]{/��o�f/F8��=Z9h�����o�ь�#B��ۡ��Nf�R-��0� 333W�VVc����}x3��z��2�7����m��OC�O���fZ�q��o�1���w0Y�1l�4�Fa��!81�\"?�<M�h,�b��f�9��a9�Z�m\"l�㞥�\r��4N�2�lu��tw;����3h�\0���6��s+�Y��\Z���?qo���ϓ2g��ݞ�g���eg�3�_Fz��,�WQ�f79i�q��k���a�&�Ll\\�J�Ȏ21;f�%u����);���͸M/9f�:Z���wca8�������͞�g0J��37M�x�k]83W��6��BO��lV�`x�8�]>�3I�3��-�[�6�50[��n��\"g<AY1N��GF�*%>��I�}&f9����&ߖ �1-\"=� ~&�Ǡ�D��)l�LB��*U����_qL*�`�33Q��<�%u�a�ѕ�����d\r\n8�.ߤ�o1Wp�\"�=��ʆ��ꊘ���.��12X	p�8�7�fcZ���P��#�{)��XL2	�ԩo\"3��cܿ��Ld5���x�@�:�d������L���)���e��s��ڭ0���S*�T��bؖ�Hڱ�0�`La<�X}��V\0�Qv��P9Y�N>%�6��-^�x9��2 `L<BF\'i�/��+��q��n�Qu\0�7�;���@��S14��e�6�s�+a�WSZF#��/��O�m�/̾�\0�/AE�gJ�;s7F%N�<	K�sҰ��y����^Rk9��E�a��̴3�=D� �V2�����T�y�(���]��0�5dv�N߸�^��&GV�YU���%ͱ�lB��30;%�l�N�2|�;������[l11�:�fV���N�Ђ�#njM�c\"=_�+9�z�s�hSOp�|b6��u�y���C� r\'y����N�\0���{/�O��}�M��%�2���t�����W������G��T�\'��D����g��:����g�x8�|��\Z��m9�ZYv��c�Y���Dﱝ�:�O����JV��MF�����z��X&l.օA�L��2��o��e����\0�Q����e��+�\0w�\\���	C�7ϙ��\"��e���Jl޼�9rf�j~#t���̷�������\r���x�ff+�w	��Տ=�m1�����͌ �Ѭ\0��x3�|���_ꏡ�匦�_�q���Z���%[QB����ww�r�6��Y2�6,�P�fb:�YN��n� ���oT�D�T��f�q�G�\nb<A\n�9�}g�1�����h9Ȉ��\'fvXO�X܉�i�ǘ;`��ԾbҪ3��h�/U�{~���\0mF3�`�6p�P��a��jы(��b�o��qn%��-.�Tv�\r�ט��l4+�1�p��V�!�nD���J�ii����s���(��+���5�M�3(�aǩ}{~B7�s-��4%pU潟`T�0D]e��Mi�ټ�.�O�1�Wr�8�{����s��\0�����2�RA2�1J�eO�qs�K_o�X�����ϩ�lJ���o�qEZ�`� ��Nx���e�f2Ҽ3a�� �+.]�+	N|�c+ab|�^a�(s�Z�q�A�}��m!C����NщSn�2@��f&�%8������[�j�\'$f[K��\'��*7\'�Zw�r�����\0�`����)�o�B�\'�̓5U��^�D�Ɗ�Z[n��8�~�J�m�r]I\'�\"�\0ı����2��K�>�A��j{Oψ�Y�p�?��#k4��\0yg�V�x�]cZ�Xt�3Hs�����%���\Z�j���dl����e�_Wwtqћ���^�8��)�5	ܬ�\0]Xu=+M�j.���A����^�cT�+=R�ո3Q�A�P�2a�e99Yb1�64�`�ϩ����n�wq*�;e��e�VӼs\nP��Д�n1��ڰO�l�j��F�͊q<����������	�ɍ�Wa�!y�q�R��t�|DB�R#�3R\0}�]�\0K>~�9�\0��l����g�o�]EÓҖe?����.OKrO;�Ȟ��\\��l���Z&GA��7�\0Q�33�\r�x_�U�d����O�������B�Ң[��}4�gfSR�>Pݎo��Dvs�.���#�;&��M�w�Y��L�����L��������/;�9�鞙��țə�ԟ�����E�@��a�0�pҐ\0�j�\0�2�ON&�\r^%�\r���ɚ�œCʑ5k��<G0Ĉ�\n��7>!�ĭS?)i���q10&a�c����q3��|M?�,��_v&� k�ai�d�и@�5��i��.�.~�fRݖȚ��m��c�e~q1�&\'��q?[��0.��Wl7��K������r��s4�\0ta���֚MH�3�Y�5�I��<���Yy��1���,��0�g�\n\\Ͷ~#X~؋�}n>&(��a����]�@w �\'�&e|�f���c���:7��^~�\ZY��bT!2�	�JN����~�|��t`	�\0AO��\0G\0\0\0!1\"2AQaq #BR�3���Cbr�$04�Scs����5��@T�����\0\0?���8xR7�ۯ�\n�Ua�iek����\\l�@Я�*�B�\\ef��Uʳ0�e�P�����(VWؠvxE��U��o��p��v�vn���#�*��^}�g�\n!P�W�ec�xV�o`�z>�\Z��6\r���Z�*Qp���t~�����=�xU��._�MṫW�\"Ch�~R���UY\n�_��r��Cf�UY\\U\n�!�5��4��J�������!��ejc{7g�����<26�Jˁ�d���~3G��k&o�\n��#y�v�c$�We@U����,�9����r�V�+�#�6s-vT{`R��o�����a��\0�Z�d~��4У�,��\ni��*�6WYA��&]�.��=B�-�x�T�9���RӲ��U	�g����YZ$x�\Z�!�	>GX��V��J�yW	�Tp[�D�*f����؆��\\}ч�.o�٪�T��4�㪣q����s�r�ѝ���uD��;5���UШ�O����N����\\�]N��>ÑALS}6��sx��h�MUZn�B��B��v����g�}\nuN��\r%\0�R��Z�E��p39���Nl-˖����B�����xcmT����k�h�\'E=�xzT�ú��S���]�t�\r����F~m@�����a��Sۘ��]+����`l�+�$��y���wEq�,hu���Y �d�H �^�ӳ\ZP�S-��\'�nR,+�OcEZ.U�^����cī�GN�ت�Q�`�cǰ�vM�鲨��έ;+���V�p��o�٘�+P����c��)ZG�b���_���TaB�?ҝ��v��\\�6p1лZ*�\\,�dou-���q����A(�>���Z��sь���Hj�]��t����[}>��yN��3_�N��$���_�\Z,�qbw 2\'g}u��UzTiu�¬���l�W�9:�֮M�L5�j��W4��+uU)��v�)=k}���oE�9����������6V���yW���T�gn�;~�h��2DryY) (G!��\"K��V<��+�L �~N���$�ݶo�x�>�{��-4:&a���j���i�`�Ǻ,{2ɲg{��	TD��j����Mlwr���GI��_T��E,��cu�k\\�.�����2V�°����v�^���F(��Ni\Z�2��:k��u2q�T�P���Z-��WEL�\\�j���yWFm^�Ί�/���;���x$sh�T5s�U��@�4P�x�������e�V���ޭB��E�	�[MU�P�l�r��\Z�L�>��#��\r�$����Fu�]��S�i�c��1��ީêk�U0���,��V�k�^T��%�I6��;�d���m	�>73!иuYA2ʍ��A��I�4�\n&��>��i��a��䤊�\Zx�	�t��]Æh��ە�9�V�pM.i�p8�EAL�FC�v�6v]ִ�V�_c\0#��\0�4Z\'��nf�T:�p�9v	ɞ_%���.�����M�[�m��ꢁߡV�\0ڲ��ݿ�U)uS��3]9�F_��YT�DҀ�0���E�3 م|�ޜ\'��m_N녙��S�ܡQ���\0Iϱ�W6��evP�����Q�	Z��մD�Q��;�)c�6N\'HA��cs��@��������,*�Ty�L��y���S\'��7=��^��F긣$�S4�M�`��6�p}i㪓��=[!�PYE�D�3�B�!P-V��SO�V��\"�۲/���<.��xG?�o(Vg\'1�)�p��R����u�a�vj�\\Oq�>:�>��G��q٤ݝ�&�D��CM��+suC�\r:�A����T\"�6��;w`���p�u.h�\"�\r7���dc�@���N�;@�?w�v�,�\"�2P3>BZl��\nk:��_�Bi��r�5D_��vٽe���b����E,8�<�<?+��:.�B��ۙ�nY���lQc���B\n����a%`�y� :�p\\��]#VF?w}6������L�\Z�vO��Q�P�����vMhԯxFf]��t��n%��w�UC#W�3�Td�\'��tvn^���a�ڭ����:�=��Q�g�`淲k��N�vM���� \0@Q�,�)�T(�s�x�9�U�Z^�FI�G|-�6�5�+�Y�l(�p�U�f�76���k��!�wP8w���&�S�-ԡ�������<*[��	�<Y�R�b�n����(�٪<��uxT^�z�c�͖�{�L���a�+�6�+8a+���֞�g�&���,F��{��wO�0��b-�?�����V�Ge�hl��W��>Qh[�{7k��� I�[�en����\"; �s�]�s*� �VP�6�O�AI\ZhG��b~G�^_�^W�j�GR�%fmB��MK���R5�\0�[&�f�u���Sb��X�=�A�ԥ�\Z�C�\0�z��зZ,���3�k)r���´d�������i���/b��i˲3N\'lx쮿享��j��s\ZZ��ɧc��s(�gS*;��jҎg�B�(ɹ��ø\rV�S�s�)c��^v����@��ŭT��ô|7�����\'T�:�J��E�����.�u\'_+-~���E�vgW�ed�f��跙N��GV�\Z~��02W�4�Y��\Z�\0X�:�z�d�z·�h�O��ڈ��p2�:�e�Y\\-h�UM�n]�⊴���:4{4O�yX��6e�ZhS#���L���z-�3r�P�R]��##�cj��6��48U�ȶ�T���F�Bt�Wx]f�9�\0ī��r��f���(Щ���c�����^e\Zu\\J���C#�t9{*��;�M�yFf��}�s��YT��]�E�?7��e�^Y.7~J��>�o�5�9�g	;+�]7 q>y����]��#C�c�R?��fg�l�!���)P�����z�_����T 5�v�&�U���\n�n)�U�Ӣ:����c���Nˈ#M[Ӿ�L��c_^��}\\�\\��;j��s\rT�8\\�]I��������	(=[��\n9^�5���ü�M��0[��x��9�b4����<f2F�:x�M�R;#V�F��fCҪ��Nǿ��3���@�K3Ǫ�aZ�\Z�Ӊ	�9⪊7�>/��8jW�d��;#��*VY%�ӭJq������F�����|O=��)�g\"�1���7P���P5�o꛻4�.\n\'m�R�1��`���f�ld9���e��\Z���뱸lcLur�p���B�W��X���Ui�,.�|tv�|�(�G;�,��Ν��avӫN�uA�6*��q���4+;ʠMsy�&6\'q��M{�sc�G���z\'b�hch���V�֢�ֿ7~�5�l��Y]���J|Q���yUxD��/����Z*h��\\4��Cn��5��~�\'1u�mN3p�;&��=P�Fo���)�:�\Z��9����,�.{��m��2d��\'�~�E�$�B̫z���.!��D�H�\"�+;8�u���F��BX��Iڽ��b�jM�=l���5�9�v��;7�_hŝ�wQ���<*����x���E[�Z�+��U\n�����G��vL��;%amX�+�/�NsM��a��Y��C�p:�����#�6z�uEč9B�J*ѣ;�2�몍�;+�&޹.J�RI���F+��%Č��C֋�y�ŔhPdQ�]HM�!�^ݽQ�N�%7�e+��:�t�,�ed�\Z�G7�z����G;�;,�E�m7��n0�F��N�sY�R��]��,���p�Y�es���u�{�f�TмQ��TZF���vZ� 3f�c��+��_x�!$��k�͈�\0��g��M�G����{�}�ި^��*sM԰���fҊ�o`y��T!���n�T�4ޠ�;���$lX�\n8|�^�XӇnXw��z��)�Qʣ��;��uL��C�XwI�L���s���5��fi�lп&\"&?�(���{���\0Dw���	F�v?�Cqp��j��TZ��\'�[���P	W�羪�{n��ǲ��Mv�!q<�j�=�����d��<�ι+wcS�u{��_w�z�ٺ����c�?��d�Tms�d���&��x�X�)�&�\Z �p�,VgX\0�\'�$m6Tw��P�O�gG皺�����p�Jh\r��x�-v0�j�]gtp�:)��s}\n�9�|.+1�!e��mi:*�V��4S8�9��H�᭛TA����tw�aq�Ӳ�7��Ñͨ�,�=º8����$ܕu�hN��h�<l4ZU\\Se��Z�K�_[�X�M#w�vQ���(�-m&������].�݌�~:N�Xy�[��l\'1x򲰚6�Ui�՟R�����%�З7�����T�E4��@!߯�V�K8**�Ԣ���i<NLv��\\�r��v�$��ҷ+�\'��h.Z�^�P�Q���V�j�F�4�:�o@��C���MJ(�+7�4Ե7��W:�f�\r��������=�C>\"WU�u=��_x�VV���ff������{,U��l�Gu=��T�&G�$tR�$y�B�Scy\ri�Q��{uG�U�mF��sXN��\'tyb��8�YM����)qW�K�o�W(�93�K�V�,��dX�<��TR�Zָ��gk����u�\0T�g�+ƪ�V4V�\\��y�஌��ˏˢY� ��p�.h4oW,I�?,��&>q�-�Q��3�n���?�M�Nk]�!X^�t�l�E�ξ)���Qx^�S��7B9��~e���*F|��\n�/���u�-4N/E.S�6ڄ���bgq�Q�&w�˕����oe���ͥl6�H52�Tm��*]��}���@�S�u�һY�4fy��}Ua��{�a���lU@x�dݎ�a�����&S�N蝈�k����0C�&�N�3Y��z�\r\n~I�.-�z���\'5�Cr�e�Ӳtn�ՄvQ>�h�܄~�1�9t�n �֙X�����\Z4۔�+t)��=T��Ŧ�����Q��+T�5��6z�9��;��E�\Z����g�͡�P��O��@�6lզڨ�\r�f��E4����2�\0�ʐ�+�&��\r�bƷ@SZ]t@�\'sh�\\Ǻ(���vC5oӶ�<R\\9��郃x>����c)�\0ڣ�\r���@跳���������2�k{�\0�궊��\'Nf�Uʍ%k��g)RA\';x��N~��g06D���@�c-[�����FL3�&\Z��Qe�Wޤ��3�b\rǪ�J�/�VA��c:��{�k�Th��7.\";H�(��S��xAZ�-Q[� z#����VI��țAv�d\Z�\"��]�oT�TuNo$�ڃ��)� �����ü��9��˝�&�����*}�̜�B�a��~�G��b{���|,��:��Q��e��#5\ZW�B�5$.A��\0 a#�26�w��\Z�hB��\nf+)`���#{��V��F(���\0��to`��MBҙ����\0�HĚ(�R\\)���c��;�J��o_�#��_�ԍS��K�R�j;+1G[\0�T��	�V��jIу�|�etq��jS��}��g�=��	�uK\r[�0{�[���Qí�~����Z»j\rD$�k��\r��)k^	�O���d�ϫXN�tܯ��Jl���8r�\\q�4��V�£�vaD\Z���o��;aS���U�讪���|pQ�������>I�ds�%=��W���7P��|C�Q3+�\0�N�����9�=�ңG(�G�Fp��~�6�A������������	ov�0n��md�j�Y9�X���\0(f�\n�E�vW7��о���P��W�5��ݗ+��s�p��*��0�3�@�D�D\"�����B0�S�7R�6.O���N5��ˏYbW���tXy��\"�w�M��Ǻ��-(8�F����v_�Ue���W֨P\0���\0Q@�#R����p�e%*��F�ޠ���_)�A�æ��6<U��gE���\'����\'��C���\0��/�xN�y����ٺ�74���{��\'M@������UJ�,�U�Π^��N�o#O�q��d(jR*�^�R�\n�ol��2ņc��$��\0E�%Yd�,��3N˯��n�jɇB�?�xO���T�1�pk��oTȫV�M�|M_��\0�-����,��Y�vP*귐s�\nw��Ʊ;�����N�����8j>%�p�]UXs+��=U���J���5����P-����U���ҿ)�Z��J�w^�\nY^x�jJ�\r\0�3�|�V�P%����gp\0tE�`-)،(�[� ǚ\n�:)�@2�m{ �K�^��k��Y���V(��=�\n�-}#E�	� ���sA �C��*ؙ��P���\"�M?����3�;���^ȩ@�UZ�{��u��D�����,��B�@aD��gUN��Y]D鸘ڟ�f���e���7&�	��-9H���߉�������Er����������Z��nd�j�Fx��ә�E�g��\0��,y��,J�Z��j�̤���RX�V��C��/�8�I�cF���0j�*�@ݎ�*j�����U�vů�����GGQKK��p��h��v�b$���isN�@�淼�S\n5�.��u����{\"��Ye��QZ�WQFZ�:94�(k��.y7��5��\Z�<\"(�j����fwT��o�~��>�7�]��[��+��e�Am��lf�3��uQ�&��رe\0ԩopڏ*w���V�M�s���@7��VUcj��:\0�I�km�O�>Vs�\nZ�2�\\��o��X���&�R���MQtP���\r�\\8IO�S��VO�a�l���A�<��Q~vS�P�j<\\�Lއ��LkNV�e=��![�P�FԧC�?�\0)�Ƚ�/q�J��(B�*�z����D\0����&�M�c��\'��V�w��aهu@�a����(*�m}S\Z�[l�;�RPr~\Z\0w��8ۘ4q�x����I�r��`���꾋[pX�y�#�MuD�TM���Y:V��UQ�8E�l����U6;w5\r:�DpU:)[�{MO�r�Z��ݼ�T@��\rk�ĴS4t�$B0]P����*P�t��xF��ʣi�s�x�)ދ�����R��6д�J\\8%e\Z�8:ɯ���?TwVw����t��}P�6��h���q���^$��T�֮$xT�4g�w\\\'��U^CG��	��U�N�\Z{=����j���%QƾTxx�g��!�W�������J�w�\\MS�\'\n����)eS�\"@�ԍ�Q�����q�\'��)�5(�g�I$3��lX98��� ��\'řկQ�w@�YB��g�O4p?�u�H̛#Z�M��UB��y+�Z*=Q{,]�F\rY���OT]�XO7T�O�ƊfW�â�+���y����U�uBH�&�G&$�7ުiO�2;\nؕ��%`ҡsl�uC�4j���(5�Uu�$u`�TWLq�J��k�����{�e�M->h���H2uW�Z�6�J��֪�q�Vx�G*�$��\\>��4n9^;�b���LcȲ�|\'6ZU��R}��i��O���zqk̎��8꛾<=��\"=\ZF���\Z��%�Eܳ<���\r�ue�C�j:�:�f�O�����\0�����bv���\Z,Q���7�{M����h�\"6�b߈$�\Z\\����\\�EG�3�G��������au��j	�5O��^6Y:����ם���W<]����nO�؞z�Z�V���U��s+�XЋ��wWV���3�����҃������j�Yf4��uVY�ӹA������P�칕���V*��!ak�\\�\Z�uW;-�R=�`1�䷏hk�i\"nY1c}\0�~\ZsGW;����ƛ����#d		����\0MB�x�V\"esXOԪ4_����	bOe6#\'�{s~_��E���KW��hG?���Os��j:e���6Sc�}����?u-��ۻ��H?�(�=�+yV��r׭��L��`?��� �I+�;��v\\�5�V����M�T�����2��Z�d�]�:>�#ە��W\Z���s-W2�\\�Ur������/3�m�Q>QS���q���#m�9�We���唋�G8��]Z������9��X9vC��J]���L�o7��-�a�;�����,m��M\\���4�4�7���Qq���~J)���c>�&\'ݲX�~m�8�dqѡWq���<3����W*�w��by�\0�UJ����c\\[�,g�U��7 :f���1�i8f9�F7�?y��z�c\n(K��:vYX�~맡@Sv�\0=UU���hS]�}�\r�n!��|���A�ד4m\r���WJ��(�\0�������V��{ݘ�8�-��a���WYo���=���ɬ�(��\0���4�P\0�vW���p�\Z����F�A����w[�s4�\\˙s-W�U��5j�4�しs�{�@���R^�ج��G��|�i�&R�GwO8��q\n���N��*L��R���n&hxsJ�xI��xR`1�&!��W\'�o�9�Df�Jé��ql�n�f4\\�����������9dkI�P��2S�\\z\'.�!&�8^C����Y�������\0�h���n�j�¶\'O��Gn����(��d-\'1�\'�N�H�ֻ�A?�=�9�f�5Xw��\'����;4̫���=gZ~�e;�#�o����J�\Z�Af��D�}�B��i���x\Z����W�X�ҩ�1�.��B �\'9�W���\0��f\\�y�YԢ�p�[ff֝(��\Zz��&��<\'��qYN�T�����?�f�ibS_\'�3�!�dd��˖+;(_v�I��8�(�K���l�\0��P�;��S��	����,/���s�OG7G���z,�9O��\\��+�)#�e���T�LnQ��;�n:���8o)�($�U�TU���{�R�V��mЧ5��\Z�Kl�m\n2b�$\r#i�T�e`Z��+���.V�U�U�)�Ta����CS�Od�õ���m�a[/�X�ר�U��uM\'�U�W���;�NX�ء,������=]��x-o̰m����h����|�����Bhq\0�Vx�YH�\n�k!n��R�01�9��M�����fs\\*n̨�4W^陊1�q�e}Z;�|݊w�\'���рj��ޱ��ΡoM�죖74���F�a�wϖ�,Еk+�{�k�)0¡�M�H\ZWU�ּ�W��{<ѻ/�_kD��.�߸Pb�1K����	��@+�f�U[����F��� 𢝚�;��D&�L3\n,�\n�%�\nnA���7	Ꝗ��ї�&7�^�;�O~!�����[mDK��g��p9^�5V�j�n������sW��������d�<*��~w��(|T��p�\nwu�ʲ��߾�jh\0�j���+�5���1�,�u�#�E���]��Y%4T+5�wDe�<*8��7��G��� 刴���	���|��ƙ����vjw�i��		�N�Wv�G#���n]6����Ţ�@�R���qX�gs�ٕ_��=�Z\ZvF�{m�������Ù����\08A�nZ�T3�O~12��c��{Ya�蝇nV=ַe���o�*�X�3�{(�Xs���cj�5�Һ��9�>��o�[�x�!��xY]V�hA�� ��>��y���\'�d!o�z,+��q��n�Mkn��%coS�4`�\'�H�UI�w�\r��0��b��-��X�e̽�I�Y������N��T�{�����))&P\r*���yE�ĸ�YL�3�����S���8�U��*|�@�M��{J�E�GU��\Z��.�$tG�\0Ϫ�Fm�B?UAf�wdhFQ׺c��ߊ�,�N�է�M�,�[��ip������\'w3�\"N(ǆ���4\"�\"@-��������2��f��WypLq`SGW\0]vT8��E�֐tF�)�G\0������i��dn�}zh�N\"��U�n�Q�U��C��e��W8����cE�gn��uNh�Ŏ���&��߰g��MB	�Q�k1QW%Tx����psi�|�o�EF��=s\ZҎ�?41��y�oF�	��-��u�&�3h�ø(�O�*HMq�\0袔;;^ڀ���/�%#Q��YFY��2�\0b���j��HT�M���?3���#A�Pru��UGY��\r���Q���\0��#�4�VZ���D����\0�[�(**���kX�uX�<�|8�}h�/&�qM����<� 0�����c��k�Y�˫ ���ŧ������p�凫��y�+���U��&�7�\"��OЦ9��NɄ*��\'1�\"�I@x}v���a[�p�;Zj,Wٔ�����}�Y��5+{Z��n�����S�>L>$ŉ��m^�(q��{>Wu[ظ]i�:�d�Qǲ6Z��<|.�N�)�ށRռ����iO���z�@���P�U2;��$�m#7���0a�U5O��L��������\n��\0��1���nN�=.\'��P���[!y�D%|fY:7�/�튽l�G>F�\\�[a�27]j�d���U?$}�Tacp��\"�֊):����GEv:��Щ�c�����3_�F�4���W���d�\\|m�d�o[�6�f��z��\\�U�*D#�U���b+�8�tǇ�y3���:m�诳]���Ƌ�q\nl�?\\&�!~�!�\rA�}�4T�2�T��o��,�3ݪ��<9�B,��^����s=ڕ���Eny����/�\"|g$�GE����$	�`,tO��<&B�j.o���4Ѝ�S�qD]=s����5k�eN��(�@�Ф�&�����oƵ�3��p��H\\IuUՖ�s;�~�T�*�(.\Z��r�j��g.e��%u�]������;ʍ��}�^ V!���0�+��k�X���}����d#��{��[]\0�Ɖ\r	�y���\0E��YM�K\ZUF�B����\0����Ѡ+Y�2���b$d`�}�1�\0�6\\,���^�~��xS�\ZiV5;-�|�h�h�\'B�Մo��T˂���+�\Z1�>@��V��?���k��x�챰�E�}S�J��mȔ�^2��.z.8���ZE�hY�:H5A�����8E+�\0���\n�N*��\"��̴1���N�`�\rmÇe<������S#�Oa��Vx��\Z�SiwS�t�u(�ޚ�k���?E]��:�@�%����<�w�H�#{�Tm{��Yw@&L߈u����bq�� *�{��|K\ZαRv�5E�\'4����l4�8X��n\"q�ߢc�s�ě����Yd��^�SuJ�r�i�� \Zh�+O�0�@�Z(ѲQ�u��@��!P����@��?�m�K[�0F���̮�c�GL@o���U�R��ɤ����W��܃O����u8�豌�\0�T�i+�4��tk���Ow�^n�uh�Z���0�\0�6\Z����Ds^�J\r$}Q|1�?�����*l{�UT���D�fp�q���y*��֑����τ~Q\'T���.��bYб��\0�O3��\'��Q���-�Y�*z5>�P��������\\Ʀ����\Z���mɔˊ���P��,����Ny���z,�N�I:��(OVY���b�d�&���	#���>\r��g�<:\"��9>J�\0�4*X��\Z�*6@{=��ƻ�S�kAs��/�b��\0�W��\0�=�F�+N���T׋�Z�h|\"��ɢ���:\'|I��i�5ݽ�4���j�>Bz�xEUEg+�lJ�����x���jz-jV�\0S��Y����a�\'�OP��T_f��\n�A��H�~��ܭ�������̙���M�p�#SO�P�\0R%��\n8��w�4���W��d-�Mý��Xf�i\"q��.v�.�K�7��otX�[�Q>�M��-5F��T$��q�E��s\"�\Z�ܨw���YiẔ��V��p��]�?��If�o�Vm\Z-_�Y����b\Z �����\Zk�E�5�����Zm��a���(�w�Ķ�Jֽ�b����6_5OvZ2a�e;l�<yq�%<�\\4�dv��}+Ц�t	�<��^�R\r�>������d����<������A����obJ<�Ph�RJþ�����\0��S�d�[z��.�M�f�wB|����lb���9�]Hߚ-�9��B{���[�����#�� \'���\0�2�Z�\'x��TP���d=\n�����d��>v\r�7N�9�ˍa�Y[���Wڒl��W,�p��B�Fwrg��/���m-�K��U�;*\0����{7��5�u��*��I��[�+H�?������\0��ɑ��`�B�G\n9����:<��*s�-i?��V�/h���R���hwШ���޻\Z��c�z�2Y�=U6>�\Zji4+!�b��e���F�ٶN~!��R��ʯ\rJyV!���Fݣ؛ÐQ����`;��������\n��h��Y�l�v�x��s4d2�n˔-����5�����l��3Js�s\Z��9!ѳ%B�r�G�i��A��qH�o\\��rܻ!gb��9�r�\0T�����Y_�D���������/�-�����K�d��ڹH#�>2�-x��R��_\n��4{�Aj/-��z���.���OEh�}�n>s��\0Ӥ�\0��\0@�zQ:�\\NQ�\0ݡ��u��i��ط5`nW\ZP�#d.��X\'a��ś5�U�@�*�r���-��Z�=Ubx��UKN�z����:�T*I�ЬTG�hpT�0��v�&͋����rfhpe��aه�%�2���IAU���.tQ�ǇQ;/�0:����Qͧ���T*tQd�b�)�_�uT�\0#]���j�Z�V�U�˹PH2�f�]��V�Ue���=�Pg9�+�.UL��sQ��>�*�i�$��sG�u���-/XgF}�u��.���\n����V\ZB}���՛&�P��\"Y]\\�:,5	̩4���/D����5d���;w_i��ɹ�&�飣?e�x7w=��c@�/��&.R��Z�貀����;.�\\��j��	��=PW��a�-�}v꾫U��j�E���D�UE�5Z���f�V�Tn�W2�V��j�V�\0YH��&\n5�Qn.\r359�u��~ʵ�:�q��7깐č;	��f�v	3��{*{(��9_�*�M��$�}���{p����2\\45sr�uX���ո\\��̿���e�\nV��ʏ_���O��6}T��Uh�\n�*��\\Ġ�M�r�,Gv��XIcnM�w�Tǃv�V]�x���\Z����$˙c���󶾈��сY�@�\n�D��j5�2p̅�UC��B�VrmM�;�e!z�C�!�p�`�L���T~eF\0�����|\n\'5���+��*�\\�EpB�!�!�L3F7������tY#�S�q�ȧ�B*����Y��2�♑��21�β.E�UW�Ӫ���������بr��{,>��ln-Ԋ�ǽ�g�c�#�n��T����𧉱�����\'5�\Z�l���I�:j(�����<t_haI夃g���/��sdo��� ��(�87�Dui�?�����B�7\Z�v�����c���*�WX5P��*�}=�tUW�{4\"�\\��oR�Xv�o���E�v�l��+i���B�]V���4P�����/�fݚ+Z���Y�x�\0eq�x#��eW�P%܅G7GZ�dks�zr��h��y�+����ݸ����\0���I�K����XV�V����)��\'��\'��rq�u�O�£�s�ܧ6�����WV�~R2��>>�D梤=cp?���\Z݂���K�nwQ����0�\\�<�>%��xu��\n<�����ە=�Ӷ����\"�We��n���v�Qm����q:�hؙ�������K1�;�6*s�iM\\����TЄB�K�\0�IѶV*�Y��\r�.UB�D�Z�T��Y��{��,@4\0��ꯜ��V6�G���V:g�Y����u\'�*Ŕ(�<�\"�C���S�I!i��>\'�����?��h2�$*3jSUG���s��+��qW�����W�Щ2�R�\0pϔ�Z��x�H�Ъ:B�]��WNG(\\z���aMhԮ)�p�MT-�\0�SM��t�p�(�I�8Q��}�g���\0�(a����W�}�*�k\0<�\n�,G�ɫUvew^�����MP#Bi</���]=�q��wQu*y9[˙s�2��q���\\!�W�O�p;�����X/�������?�qX��(���\Z�}P��8yH�n��87����v���������EÚ>+��t�:z,���5*�߽�k��^��(�V�qDXQfqN\0�.\'��v�Uep�����.��NN��;3\rF�,�	���o)\nXZx�vWmMϱ���1��S�Ҫ�Uzm�6Ŷu;*���Z�U���E�p�j��r���� �\'ael��|.*���i���C�Sa\rZ�E\r���\Z�֕OqiXI�J[�/�&����I\"h{�A�kcj��O46kʱ@��菻�\"l���7���U�j��Vg��£N��auS��D\r����ZP�UJ΀o-Jrv���l(Uy@Yp���\ZU\0q1��1Q8� &\r>Z���\rj{��k�VV\n���6���Ie�\r��NF��cX�\'�o����>Wek��Fg��vr��١�v�=�kT�\0�TBX��tQ�JTm����5��褄��ZxM�K��*8�S�.9�}��ʃ٤�qDԫ�S�����K���fZ�eN�\'�ʹJ�ʍ���֊,;1���}عM�q=K�~�-����gbˑƕ?������>=�q����A��1��DwA?;�$o+����ќ�\n�O��U�)[�9���Q�N�zY���wX����h�ʜ�����T�-���\0\'\0\0\0\0\0\0!1AQaq��������� ��\0\0?!�y�\0�1��O�e����ȅ��r��F��B���\n��\r2��90]�52�a�)��03Y׉�u(:�7S^�Mc�jEB��G�M��*^*��V�����s����J�.Uı�\r�$~��1�<�R�Or���y%�uk��*m��\"�l�$��L����s(�W\\K�:\\AG��R�ļ��S����e�_ش��!\"u��T�K��/ �8&��qP<�)���*G��d3))���=s!u/V�W᯾b��L	�P)�i�h�\0!rfT�W�$��g�.ei�N}j}�5�Zo�;s�P��.�g��b@������H����@:�U���\0�KhN�.�y�\Z�o�V�F%��Wҿ��T�L�N�z�NP���\n��+{�����_���՜�|�x�_������*��~�}L̝��p�������eK�\0}G����]jG+!�ö�(��ĮlA�eqDSY��-��\'����������_��̠�	�d)����J�,x��?b���8Z%���U:QP0Q���JWY�z`t�\rA��P���<Ӂ����A�a���k�T�p�V S�čk8�\0V�r��<�b����4!I,H�c����5�+�½�I%Xጶ���Q�qV0>��\0f�\0�t�V��5�0��6�����gZw*�d%���/���]P�O)��z�`��W	-/p��;��^������8\\�L�����|B�Jso�t������a�Y��/ߧԲS.�b<�v�e<���P0�bbs�ψ�A.���9�?�`��&9ၙ�`9� NS\Z=�A%E:���5�f)�	L�GA3ae�D�;��uK�\r\'�s����/�п�نc�4�]G�2`�E�b���#c)�b�3\0��x�Z^hyP�����7��_�\Zw�V�*�C$���\n�[�*e���{D��Ľ�,�[����9��%���h�|<L吏�1���Դ�,���6us9P-���UɆ���	4�b����~��&��1,���3\"��]�4�q2(����]�f[вm�=�(q#��]˘L��g�N^eI���1�P.��J�|�zH�k��*zF��q�t�-��k\0+�c�8�@�C^b�����U;��	�_��E��l�9iЏ��j�/0�95�C��H�GM��\"���K϶|��HZ�e��ޒ��6�Ad��\\?sxT�Pv���7�,�2�@��+���z���:՗��\0��4����̥�����㹙z�B{i}T�(Y��nJ�F�Ơ���(�e���םF���F�\n\n1���QN�ǆĶgE��c�-��	D��Ǔ��EǇ/��2�.R��:��-�q�`�y%OȨ�/V��0�6�����c׈�c0�؆as2�nEQ\"\'1�S�N�c����<K�&��!�KlArY��W���.��_1�M#����\0q�z�����cbkk�r�U�a�?�s�\"2��Z����?�Qܠ>Yh��2�:�\\3��rJF0�tPf(	Vs�Y~�-X�b7Ġ[v�(= �(�5y��r��Vq���F��;�P_ԡМ(�.Ñ�]{�0IEwj)6+&#_���UV��\r�%Kh�麸mԥ���:�Q���AK֎��\'��w�%���`���G�V�^�\'��g�$�r;%��kU:y������2�<�!iu��å3�[-���`��\0�y���\re�j��2�#P\Z���~\"�Y��\\dN����Ci��#F|F����W�a���TZ��*n٨/�׻:�#!��;��ʝ�%�5��g0|�ɉ��I�9\"�n�Q�[{�df��L,��Ê�& .7Uw.6�j�YLm̫��$57��Ȩ�h��t\0��u���xW����`�`�)��T�g�5p{��b,�˝���b�̳���vԧ�~N�q�\0�����-�-���\n8���(�<�N����Nӹu�Q~eMC|c�W}��kyeW-D���0\r�a��%a�i@��g�IK�;�V2����m��S��bf�LD�,�\nw)�	�n\'\n�s����WIQJm>#�Q�\"G@�P~����l�q)4zb�;\'����=���t\0+t��Í���R��؁�.&s��}���K@�a���y��\01=8\"�φ)�9�Y�P)l�g��ƕ{�C��Oe��Ղx�Դ;��\0S� ��Ǌ���o�\0l�p�e؇O����>��9���mu����:���8O���է������L�qX�(M����VFD�V��a��r�����j0�&�2��g<�b�}Bn���0?���q��K�o������\0Qa��*̿+���a��*tG�����6��3aQ�H�����]��\"��3�\0>���c�L�^/1A�s�d�x�B0��al��%�g1��lt��>c0.�f��x�[�[uA���X��Z�A���K>�1|�K�)m���~��M9l�w+��SL�2*����\rEev�r��Z�\ZE���uX�C`Y(�����7�K`F3w}Ř�-��r1���������2�>��&@!!Ub��Nmwi.���?1�\rJ1��BN��p��V*yM��Y~X#|���L���!Z�����L�<3��)�rB�EB�����S�*�����g�_�r�e\\0�7��_�~[/Ӣ\Z?���}�	��^��!�P�\rAg}�����W�\"�=�\r�1�{��X\\��c,2�A��\n�Q��vjZ(Rw,�_�hj��X���sx�1ȼV��SɅ�����O���^��`XX7��Eߔ�E�C�_��0�\r<����ٍ�ڬ]D���\0���`]�\Z!򂡭�%�a�7M�:6J�T\"c���[Y*�������¯���1~�o�Z����˷��Z�	��x؀�O<�1�K%�/�\'�d�QԒ�J-������eu�P��ʲR݄t	���Bk$;�>dE��s�,�dG3=C/u*@y�-��l�M�.�P���qh���Wv�L�<J�Ьʾ_�V���Ҭܦ@A�C?�s�,`����?���8�g�)n�ؖ`�B.��upq���5�0�Ƒ�:���C����#P�we\0ሎ��*�Ƒ��?�UsΝ���%��kk�.O�\nP�ݒ�N\"��-\r��0������?SF ^�d�M����VF6�v�Yw�|�A�0:|L�븇�×X�0�aL-���s��n擄f��Gr���e�h�?(�X�5\n��-�c�J�?p\n��cP�g�uo�[m]SH3����sT�-�ϘnE̩��1���%�P3/�n���>\Z�\n�ʎm�C:_-�#�z��=�lF��5��o��.`nR\ZG�^ey��e��+��Ѩ��l���_��FQ8��DL��f��px7�ƼKť��u���*H�11���6��(�+-���\"���G�L������zDVIy��$��4�g���F��`�C��-X\"q̆k|��S��,}�&�X��\Z�_�ғ��H�P�)*�<j��d8¥\'F*؁�}.٘�l9�[�Mq��Ug�;�J-#��\n��]\r���k��R��.xQ�Խ�lW�R\\���s��GA�\n��G����!B�#�`�!)�+��T8��c�b�nŽ��8P\"V�0q�}\r�jhG#`��EXyl��E�A�Rb���B�\"��a�����*�K���c��bE��p��U���sOP.&�PP�h��Ȼ(��z|8���ER��,�+M0�X];��5K�S�R����u;\'�����-xT9ZTRQx���hU\n���$!�9�1g�\"Q�������Jҡ)�Zc��uB�a�]Ah\Z�2������TSY����TQ�S{Թ�y�.P@kK����+�E���vJ-��a:�&�\0������\"\r��.��%k�uO#�*��,�f<B�m��&�o���l�ń|]���@��b\r��?�o�p�m�&�8n�L����,]u���������+��}5�Q��9�D>�5�̇�\\��S71m\\�J��U�3�]�ܢ����+	����?ldw�Q!z�7�l>O��膗\ZR\Zf#�GCG4C�L��\"*�@�_D	�@�3�d��[AG�)_h g�Ív��!��S���YB��6�\\�q,fw1���v#QV��hM�0�fO��*6��DtwÎ������{��S/�D��\nw\r!ķ�7�bC�#(+A��2�Zt=�c�o����Sr��,F��|\Ze�\Z��lF���a��\0� n�\"�`�iCi4���p�10;�D̾�[L�|�U���Bw�\01��OT��8�[k7��<�Ls�p8��|�?��b�e�tp�%� �4r�\n�xh�gwfk�\"4���J��F�+n�P9���z�L���?h:�Y�̡�Vw�N����S�ѭy$8�����av��\\C^�*�@�a�$7`Y_��Tx���_Ac���y���x�x�8c��PN��:�%�K�s9���̼Sn���vJ]?�Q� %�-�ζv� Uկ&�P�^U˞d��rLY�����w2�Vc��{!\"�����z�1qۈ�����SS˲nQ�Mw-:G�62�B)�õ�k�KŁ���ܬ�B{��H3>>�/�w���,���2��\\��M�\0�q�B�Di��+.�d�^l�X�)��&\Z��_�R\\�ܿBv���\'xf\'kvCX�5yx�$�G;��h�Ɛ�:F������3�[������]Qu�4��j��\0���?/� aZrDQ����k?�����~ޡ�Lȯ���\rz9�e��\0�j��=H~P�+L�K:��q����Z�UYZbG�>��gF� ��*�׸q9�3C0+��#s6��YA#\r�z���\Z�^�XqY$C1�`���jWƹF��������j<5�DL|E�*!�uP&��1�a\ZN��F͎Ѱ2�2��B�3O��s�f\'9E���^�� �˨���p����`���=�Am��J�*J���|�1�ݛ/R�q\\��_j%�N=�Q%4�X��J�n.�����\0.x\'a�������ک~�O��-}h��0���k���d:��ր|�\0�66��,<f�=yW��K���:���3&g����Zh�Rg�]�#�⻍��Z���&?����\01�e�t\nU�r�ˎ�Ȫ+D�aoY�#\0�ш+��`��+�T��vq�hN���j���\0�+6DO�)㶿�2\0c���[�F�0�T���AFa6���J��e���xy{��!��B��Lgaep��\0<Er�\"���hK�f��3i|LKfR&,~\0�]^�R���JնS���\\В�������ňAlw\0_<U���Z��yH<*+��93c	���T���M����ێ��*5�ky	�Y�z�����{�@z��1�_1�n�o��_R��FN��ns�k�����4�Υ�b1ܳ���끸%ٴ5.9M��v�L���w�N^�h[�c���T<�)�j��$U``�2����\'0�Ῠ=MhL�c�(W�.�-o�����U15Rᔶa�@`F5$I+K��]EK��fR��I�\"�N����:�,��ك��4h��Z��찴U���0Us����BsP��w��3��z�x��p&w��Q��$Z��ܣ�{��j!�+�3�=M�ʖ��n�����(�K`u��������<�\0��	\\֣��V�o����M�C)�<Ͳe�I�\0����dB���T�ޣc���#W�.o	P��Un�q@+�|W�[!)E�GIet�q�\r����W�7�\\J\\���.�vK�4wX)xGxwg�Z�]9c�Q�*�VZ��mb�	F>�&b[4!�{�_Ы+�@��{��udwe������Y�5�����^��)�!{J�L��Do�W�y���2\n���	�s�GI�52\'��<���b��B��S����S�@\r*�Ie$g1�>L\"\\f�y��x-�Y @�oYn ن�V�dOR������	�Zw0���S��\"����HSu�/�-��b_q���v�������ס���G�m��s��+��GAC���DW�4G�뙁$�n��Pnb�{DU.¾�\r��\0�%�ts��S	n�3-�\n\Z :\'����a�\r�U_��*���\"m&0� �N���t[��+����.�<�E ��c�\0b��d��Cj������.tm������+�n#f^��Y[�t�E?�Ď,��˛�\nTM��B���_�	F�f�����T�n?	�*�*c1mn,8֘�`�<�`�(9^a\"���0���R#K��(�J��h,5J�+\r0j��1���E̳F��j����UqU(��q.-��V*���k.�s2��.��\0�?q�=��$R���k���\Z�n�pO�	5�֚|c\\�Q�+	#�ny�!�_��1B4��\\4ͻ\\2継�v@[��\"�{b\0v�~�։\\5_��6Ӂt���=�Q��r��~#�\'pjm_Ԣ=�c^[J�L��S�32�=���7r&�]����\0�G��E�UC9�\0\'��G�P�8���i(�\0�0%��3&��,]���%��\Z��������(����gLF� p_�[�P�G����sƛR�N_�6�0�����\r\r�������ǥ2��Qd^Z��r�7]rK���s�W���\r�aH�R��5�Y���A\Zb�V1\00=���6��Uq|ܟ�Z~����L����QdުTHJ��C�tد\"�f�s<�\0�>�f=�����\0_+#\n��&�I�sPx.VN��\0��H�K�3,c��ce*B�S��(dx�}���m`���Ȯ>�J뻚� <�C·����$ZnW�&���+	d+\n���\03<_�2�C���jӈ��n/@��Z��P��)���M!��\0�d�L���1��<G�9�K@���\ZG��\0�J�f��$����)�X+G3:G��\'�Z8��tܟ�C��#��#��|c7�c�8�3�zkq	���_&ި�r��=��4f�\0�3<\\�_�ŵ�s��KrJ�ΉJ|�\\�\n˞b��S-F�P΋�5�!�q��gHA��1L�;���W�+���&ƥ���\0��i��]N z`�r����p�\"ч(�5p|��/��>��O�7\\�Cx4xǧ���QW0e��Zm_�P��x\'�b�� ��_)Oo�J���~1cz̳I�������-�v�%9���(J�����d�l~a�^d����b\0cp^���j\n�����<���?�acj2�m�i��\0p�u�sʸ�8E�9��aTG/0�#�/m\0L=#sK�-��;ł��qZ�C�%?rX���S88(ʠ2�i{`��N�%AJ?q��-7�@�\r�d��g��%eĽ5�-9�G�u�\n�%�⟊�2��84�\0�AuM����+/��F���-ƨ��Ŀ�\Zs�^*Π-��J�n%���b�Gh�\\�tV��H�K������8&\"�ܬ]4�S�re)��G��W�4�����<@gY�\"���u=@K^Q��r�(��I<��Zf�`�6Uw+�3\0�~�q�����;����\0ـ�0����/�^R���q����ˇ�/\0ɉ��k���PKK.�������ݤ���\ng%j(��R�*ZK�%��hT94C���\07����&ߖ��{e���Wq�B,�)3�=! �u_�J�mT�Lb�����d���EX ����|���y�!�h�_�K���\0�����w/��@�ܧ�\Zrs�K�q�,n��\\���7r���.�p�D����!u���B*pҵ�n\\ �X�B��g���e��[�R������i�����%B�hFJ���S��)u�W��e��,~>cA����A3�}w�9*ek`ӫ<�D�)U���\"�[F�Fk�������K���Q]�z�QR�����zd\Z��8�h�	�>�L��4yF�1\0Eܢ,�!~_�p�%�\0�#g��ҡ_�ME(7��4������ܡ�fkW���Q��$$[�\Z��Պ�p��%�V%�t��*�4���g\\F�V���]k�c�M�\Z#a�Vy�Y:K�A5��o&����(|A�XCCK�2Y.<eB��U[7�+�<�q�0ܩ�xb�Xj���d����������\nL� ����H���s\Z��b��پ���\n�=>����>a\Z��p�1uO0 [�*ݏ������b�b��$\'�c\r�W��A�Q��YiSk��u,���r�@5�u���i繚4�B�O���0K:��%3���ի8����C\n�%�+N3���1�P\0[O�����\0s5�&#�F��Fc�p�\0`�����bm#~�@�<ʱ]�y�����{|J�~�ؾ��\r:X�,a��+�D�@��}���c����[=Nh��\'ģՂ������*��&ض2-�����HƠ��)(V���\"��0��F��sؙʌ�c��o�҈:\\`�N��k�v�����E]�x���`���O��pA���6A��8�XKI��]W�e��w7�G<A��l����P�4� C�:f�_�F�\0�h���\r7{���1�;��AR�f07�\\E�|��n,Ь�J�j>��3R̐���e�U��s[��e�	_��J�L���	bY��|LJ	r_��ba��^&���^�\"�	��1]�M�j*���Q��c�����i:�C��O��^hL,B_c���A5a�;c	t��˿J*�x9!;�U�\0)v\\X��2�K�mp~���M�X|C	�R�P�i��/G,E=�@��PR��U�G1��(�+KqBVl`�~�Ń�F��Ń���b8�>�f����Yjj�Y`z�ep���b?�_�+�\0����\0q�0��6���w�n��S\0�e9���|\\hȠ5؀�Y�4Γ4q\Z�(P�|31�n�t���R�٨\0�1j�X[���2�w\\|�[����)k��5Lش~O��\\}��\r�X� �!`��R��D��d�t��|!˛�:��v9y�TY�h|���>템0�ی�v6\r4��2���R�p̬�Al��Jzr��e����(&��x���qj���2�9c�J�d�ُ�Ƈy�F4�S(p��\ZR���|j�zqy|�1�Nb�i߉�U=D���\\@�B�j\rCN=6Lq�n`]YR���3�\r5�P��F�Į%cE31.��5+�^\'3��b�K]XΌZrJ:����Z�\n\n��M�����l6�w1�	�� �൤!����;1\r��j�>c�FK���b^\\��ռ��b9F�����Q*�:F��O<���T��U���SR�|�Z(��B��������\0�KjӸ� b��Y��hV�����jB�h��;?Ж��(���U�T\'z]@�u/nſ?�Kψ(��z.���>�֥�:����_�__��=:���^���F��^C��\"��t��2ݟ0�s+}=q���������4��������o���4_�R��m�\nd��Z�غ$��t\'B��ȕ�2\"?���K��|�]�v����3��/5���5�3��p��&\n�2���y�ŝ�+0\Z����4D��Q��\0����-��3X݇���yw�+/�P#f�ٵ�*�U����@���͒�@�0�}���z�>v_�0k�����\\��V�Z��~� {��\ZD���J��PDH����`�(�ľ�{�����*(���0�к�\'�yy���8���`W|��&\Z�K��K�g3.?�J�=���?&��Y2\rp?,�W�n*���[��N�2J��J��į�o~�W�~ 7�Z�-ݷ�˵)�Z��U����:�8�v���,�#�����T��5�꣝�����#h�w\0s�\n�\ZR:e_d���~]�AT��72�n.��f��%��BP.\rp��o �]�-e��I)9�����%s\\�|ʡi|�F�ml-W�n\0�}Vh.�r��n�:=C�҇q�|^gAqx8���%��&�ۜ��M�]���-}�aeH	�}!K��B�]s��:�%O[�-rT����d֠��ܫ)�4U�@p��p�ws�Q��`O��+\Z��<��U/��{Gv���fN<�����\0�<o�\n�e��~zb��ߤ Q��鹓��[�탯Z@:�*��crr���_���=�2�\0c��q����\0��Kke�e7�Gm�R���0V�<�������6xq�4n�\0�ENg�?f�������֫S�]��\\�G~��f؎g\\�< \r(Xu���kfB:�{R�c�d�,�Hm�Y��%�^�g�\Z�c��,�<	g�>A�V�z�]>ㅬ�9��*+v��>��n�ww)�Fx�[x��#/\"NJ��_�)�r8aR�k�N�Y�n\\�#�~��I\00B��� \\��&�UxDt�y�f+�;˸�^T���ag�Ơ�J����)m�����k�H.�p��\ZZ�+�l�-�\0���U3��\0M�l:�\"q����vo�!l�d�𘤤҆�̥�^����<�?�� �t#�ex���&���y�\"�8����09��p�-E�p��	ke�AVf=�(ta�&-uÚי�i���p�lF=�6cǙ��:�(���k�6���Z*w���U��,<Z%���o=���z�����R��P�Ͷ��.�\r��\0���Q����؜�fZ)����GE��~��	�C���`���X�ɐ`�2��f��}�*�g�)��6ty��%?d`-��h+�E-���_�,�d������1�*��s%e���mh���%���摛b�\rs<�1���\"b1S�����2��LTTB8�,��r|���^��Oܣ+��?Z.��cz���0\\0�f�Էf��������!���~H�m�XʕM}G����p��ĸ���߲?�J����B4YߙefX!��b��B�T�(�犀�(��Z�����=`ܭ�C�(��j=���|�7c���(��ŋV���ܰ�G�{�a$�F��D0�������.��]VO�:�T�pAڒ�\'�9<@�����b��\n[F\"�W����R�|B�4??���\n�����(����T��)�q9��P�6?�\rY�ti��ak�y�_�9���)��H�axC*�����/F���:��:����o^��@��CZڟaZ�Kax�)�G�a�z��bM&Q�ޓol������:�ֱHl|S�9�nſ�q\Zۀ��)�P��\"(v1�e���vi��X�^�6t~��J\r�:tc�����E^J��x\\���)/ r�k$ۀ����Z�=�G��+:�͜Ω�!�\\S��i1b�#l�%�eU��^�7�>�°�_���iv�I�`�n��s%Yh5�x�k�ej\"��p��\0���3����^l�/�nO�̦��^�S+\0	A���=%�թ�C����xQC���om���l��mͶ.c�������M*{0�e^��-Sʯ�\r����]����7�5^��©rMB�6A3g�г8٨���C$no���l�b�h�69\r�E�]��&�e��xA�+��T�)O�J���((��N��zpVU��g>*T6���v|����3	��U�縲8�?_Ե����b}�������\'w��M=��שI��1�_K��B��R�#�<�͒��jXPJ]J�������jr�{�a�=)Sx��7O�j ��fW�����ׇ\\�紘*�]������M��w���:wh}���Q���)l��ݻz��4=l��kj�3)�ߘ�����q��l޲���������S��<2�\Z�����Ȁ]�3��<�X�&\Z�ͳ%1O��\0���� ��I.k�a`\'\'��\0��\06�M�\nccĕ\n����D�&`�=�,C�\"�3:�G^��a�d���t�q�إ�=�Q-�9ĵO�MV�3}�N����ɡN؃�X<q��⚚$C���Oĺδ�0>��\'�U�1�gX�\"��`�s���L�\'�l9��9�1��S^^��)\\��C���(�\0R�\n�07�5�kI��bG�ڪ¾ W�p�֘�[��g�=�`�%�c�Ĩ�p@��S~a��Ï��T|����~%���\\��w7�1r5T������#o���;���*��}T�V&�W!��S�����\r����8��.����\0�#��%��]�T&�`b�\n\Z�&�9?p�F�T�KèI�.�=K�\0�(;��_��������+#*a�N���b���ČΪ=�� �.4���&C4Buq�^#\'��@x%WDC1}�����{}ʩ�W�FC!����P��c��yqڏ��J(��Z�h�z���� ����./�\0�7R���@8J�b�����7�����Ky��w.0@~���*Й�u=���q�siX>f�\n�������/P[�s�9��#*n$��1g��U�I�zFy[)�<���k��L��\'��Mv����������k�q8�pv`sܺ��擋 4�~n2��1�[�&�Q+g)1���lB\n��X�w��\0LR�6�������ĤB6�5z��8�W�����}�Ѭ�e�D����D��=���5HʟRҟ�l�ն���O���^�2�v��C�j�\0q폱��.J�ta1p6|��i,D�\0P�uV_P�%����c����(�=����T����U�X��%�߭���E\r3q՞ T4(v��U�6�3��� 4=ʦ��a���aF����E��f\Z�X�!b�ϸN2~��k�\'L��ŭ?�3	ܱ�̮h7�g��G�D�5?~�3(�1,�puU�K����b����/����Y�����6BԵQ��G�)`�����)�<B3~�x����\0R�R��*��*]���d�\0Ȧ�0�R	�w���:���Z�wZ)��{,|����������0,(�z~!��a	kx�)�cp�K��|�\0\'�]C��N٫u��E�H6�c��UnSs��	k^��JB�\0pV�\Z^�D�9Ƞ���j�����A�E>\r�ˬ©.àМ�Nv(b��p�c��.���	�>�֨��>ӁR~�JJ�k+��KN�?�*]\r\"��\r�q,-�==�E=f?�S�w�N����,3�,�7��BkOFXNO��w��5�q&<,����&hn��Jv�jZ\"��.�uQ�bX�A�-����|J�@�\Z4�6�\'S)���W��we(���,��QM	� v0�J�2�Z�j�U\0Z��_�f!�͢a&�Q�B��P\r�?a�C~ �b\\WG�\0z���\0�8�A�#� B�\0DI����G��N F�����\'���8�\0���\n1f�YU�>�bZ�E��	�yg5�dV��1�0���%ʿ����R�,���®���\'��E\Z�)�w���zܵ3Ѡ�ֹ,�\"-��OLä\0�!&��4��9p�|K0�H8�3�g��W�o8@�f\\�����U�\\�L�t����H��_�)�/�f#ַ�{>�r��j跒j?��5��e���\\�tl3/�)��C65��9�i%��2K���7�4+��\nR�/:�f���l��0FX�y���gR�g��Ⱦ�����r�4n`�\0()�zK,ۿ�]�T�� }�1k��w���������&	�\0)T�>c8\\Gd<�`�ƽ��f���R��¨:/r�%S�bпs����M���(�8�#�1��+]��YX�����M�li�/\Z���Iae�lw-���EɮGh�9<	�����\n�rQr���yZ�G���n;������#:\'G�N1#��Es)��\Z�`p�i��p�W��v�ޝK��J\"����X�ơ��*0��\rZ�Y���yf�[.���Q+�)������Q�Zi�%@b�i(�����n���+��UW�q�rEU�%���L�q�e��S_1xw)B��3!�J\n�Ê-�?�0��9�(��|�/�M��8�w���r�Xrz\Z���!7<����\0q/��i��W�N �(E�=GPF\r�GG�kO����t̫r���Q#8�e��0h4ș���D]��ll9�U�}�P���Kǌ�$`�y8�:�\\���:�3�/�0��3�1��j>!�{��l,YsA\Ze��^rn�	|,k��3�vN�\\���ګ���Xb�4��a�VqD��}��\"�le��d&z����%���#M��+�R��E���(�ș�PB	����p���8P�\'KPˬ\\����E�_��jQe�:N��g�R#�\Z�T�{\"r�&��N�����TޝK �`Yk��6��gL���Ӹ��F�5���$m�Θ���e�F+�򇅑f�W��l5alr�Yd�>&���] Q�+=��&y����~e�e�1��T@y#ä,��̯%X�p%�R���b:a���dCv��Q,����2�.����0��%�7>a����}1�q�&0������)�*!BQ���q(Ηe6�n\Z������]{��,AF?3�J���l�d�g�WppJw.�nq\n��uu���cm�IF�o����4��(Њk��w蜿��_h����0|W�\nVc�8� )t@&�_R��ɌJ*5`Wf�n�q`Q�8=u\na�v_lZ��2���dr!�<�F�Ð4���&b��Sr[_>���T�I�+2�r/ȍ� ��`��@í��l�q��,���0T3.����bT=bS~b@ya-]�,g�ˁ��`���@��@�M$��K��@e��G�-Jr}G�ƹ��;l�f��\00жTDV�������0䳏1bU��qW�=Ef;f�Ry��4M�\Z�n`�w�f�a�^����sIG��F��0{��_ �G��5�|�칎�X?�	r�����\'�Ш�h_���ek�9�.%�o GNȯ@D��=�%��U�)���ڏw�`![o���9@��q����uT�E2> 8b�3�e��.9�@-s���O-|ܭ!#�)���d������#�X�d7�\Z�p�(2\'r�Ne�i�;��bu�ڑf��\\3 �deOv-�O�%�ҹ���blO�^\n�AT��+p��D�j��x��U�O\"�?�N٘����c�e\nYY������˸S.�[�L��+j�!!�^���Q��G��Eh�©Z�\0��:��q�1�񙞐d|2�J��ɒ#7��7�p��x�@ܥ��8�=�1���|���(��\r�T6b#/��d\Zd�ʢ*T�b��:!V��g��2�W8�W�!�g��F�f�>��e��S�߉(��<O^R�o8��T0����U��vǕ�������v-3����*�P�!X���\r��h�sR�lG�]��sD�{���H�g�\0R�Y�SB�pUQ�L�?ǌ�Բ�\0}��G�>S{��	o\"0br��Ԋa��R�:}�/b�L���ؖ��\Z��uA�d�J��n&�a\Z���\n��1pW?�7P�����2%<��rz��C/��I��C�\0�f̕��W�ء	�u�%;D�s718��x	j9�$�z�%]���ۭ72Ѫ��n5�� so�D��f\\g���5̮�V4��a�,Қ��h�l��T�D\0鶿�1��\Z�B�ZA5�`7L��)��q9\\Z��XL�i�U�рĘ>�l��V�o��\n�]jff\\U�\\楳F�_�Z\ZW�G�!��@��\0x�Z�\\^z@�L���x֦@��Ӟ`K�/�5԰����F7R�&��C\Z?a;W�\n7�/%\\3��x�m�s�JD��L��\n���D���$r?��~P\\ou2S`q}��r�)�K��0�u�Sg���d��\Z��8��~�d+�X\'���P����\\]�4��\0s|��Byz�£.�1�r٥1�	UE^�@��#�Pq��n(���׹u�fkJ�-���\\�Ǥ%��.�35�7{�ֳ����n�BW��0�r�>��%u#�.UXc�2�����������X\'3�3A�8���\0�P4�Ҧ�2��h�Յ���|š���Z]��,�O�2����@�E���╚@����LBj�00��v@�\'�E�3\r����\0\0\0\0\0\0N�\0�t6���\0�y��לw���O�������L\0��S����I�<{��>��q@|�>��S@�}\r|a�`>�h+��u���k�Z��r����dD�k�?���%7 <r�����k\\�u�\\�oU!!�p��>�&\"�8?�׉���m��{���0��\0!!33��^o�+�2��\'�:Nl�]7��T�DS,U*�Ԯ�P�8p���V��d\Z�{\\7	xc�s�)v���y]!��m�}���t7kPD\"�n\r���R�\'�	)ZNXOԅDx���C{{X����	^q��� �<�I8�����:,��a�auYc��C��;G����绔<3�rL\nf�l�i��Hsy���\'�����僒\r�y/�)�����-̥Y��zi#l�\0�9�1כ�\0�?���\0�\0�t+C1�Q@=��\0$^B;v=����B)�1]���O9�(,������\n\'�\0�/�)�����/C\"��C`Q0��ëyxX������G%���d}\'�����:o/_��>RϠ���Hq�ͻq�������b��k���a�H�m��5p��2�L������^p��l���\"}�3�\0�9�Iw��b;��s�1-�+����7Q����s l0b�oy��5	x���|L���2<�^�φ����\'�\0n/�&=�ݘ+�-O�V�\0�Y��v�F�~�Ƞ6��hK 鄀��M���*�\Z��F`����S#�D�ak��+�0vC��ktπ�]�̂�\0A�M�[���9H�2�pQ@K80d �ax�!�F&T�q�30-�I���X0C ]�^�\0]��<��\0�\r��}����B0�{����\0(\0\0\0\0\0\0!1AQa q����0�������\0?���}Ax�s.,��t�z�:���	ڌ��/A;�#��˂Y��X��o��ŸY��D���g��6$�=AX�fGs*���w��-��,���!���ܜL �Ze:�[�ݘ��oݚ�2�Hǹ&u��Q	�8]�K�IS_Q�t�G��Ύ-ۗg!�( �\'�ru�w�p��.rx����/29#3t-���2�֮M� @,;�x��^�!\rC�>5}0�^�\0�2�݁�E��鸎I���2��D@L��3Q��Ȥ^�YB�<c�c���G��.!\"\0�������z�Z�ɦD��ܓ���d����-����3��ߘ�İ\\ϓ�p��.X��������$�6\"0I(�r7���CB�g@����|�a��~F�Xv5�Y��y[��;\'��<�89NhܲH���θ,�}P�l._�]�3»�Y�:|z�4��՞b��Y�&)��g�%��H��#�xBcO��n#��.�b��:���>0�\0�>�0������9�b�x����CXď3�r@�p�`ZO6x!� D�0up%��=^��/Eǩnla��W�\0az	<Xw(����=Frjؘ����_b�\r�ե�W;�g�m�^`�lf�Y��f��.L���}.3E�2sq�S��\'h8@eyl}D8�@;��=�q��9\"�Ɂ�Q���KY��t���������i��Q{���3��s\"��Fq0}F\\x��̳z�Ɠ)�F�$����e��n@�\0���}��q��59.P�F�#��O�^�|SӨF�o8�3{��E��&{��h�f���p�\0��6#�:���z(�B���ay�\"�$�Ep�>pK̻OQ ��e��3���̛cdG��ϯ�����g��\0�e��\0��S��KI��%a7��\"��]�������R}�0v�xȺ��i^%�6�r���	��<�.�Š)��w���n�RN\0�[+�׭��X��\n>\"�K ��Ѷ=Y���{��m\\q�0A�����t@b�4�\"�.!�0����D��-Zwu�sP��8�3����\0s(�.3?�ܷ+�.�Ve�(p|Zw����~�W�����<6�����\0y9	��k��o�~\Z��y���G����}[Ie�9f@m#�/������\"*�s5_���[��d،鎃��p6oP��w��z&=���a��3���7��1�3�%��k�p�s�6��x^�F�u��T��!��d��3��ܹ6B��h8\'{r�\0s�6��C<i����\"iqϒ���3�u�FǍ|M��p�!#� ����\rs�F�f�V4NN@	��u��aun͋��\'� ��!�ve�K��\n�ԗ`��p�[ڌ�\0H]�Cowb�&����xߟ�pG�n����������J1$U�i�(f�\r���GN���͞p���������R\\3qr�`�����q*;ʘ�)�����E��9��\0k�%,o����Y�é!���1݆��c�⋻��\ZZ�Vĝ�0޼EiC��-�[���|$���0�%Ĺ&\0��.e�0�^��\r���Ǘ���t_�p�q�u�C=���({@yl\'dzf�b�w&�]7IG9���]PD�dȘN��@�\'�6�I{�N���{���v��{�׉7=Όن��`�Y=Ih��-�|o��)�����Ȱ��#>��C\Z8Og����H=������,�������@�m�[d\0aj�;I{��/�:��%�l��_p��~���V�����a݉��|�;�ȵ�G6�y@���&��?��>2rnMǣ\"p�e�Ya���`����~L[�3��E�w2���<z�O��@�ù\0;������Hs��������IկS���\0�9��_u�m�g�����x8��auK�={�x���KzL�Ǩ�I����� �F\\��iu�L���O��]��ɸl��7�;ĬI�y\r����~�\0A�?O0���b��\"u2+y�@�`ہ�l�0��>��\\D�g��s�V]�t[w���6K\'>��=��,ǻ˂ȹ-N,��c��tynӻ��v��lk�}R1�����c���pG�fԈk�,/��\0%\0\0\0\0\0\0\0!1AQaq���� �����\0?��8�����G�l.��p�g4Ô|7@���\'����&\0c:�z�U��#z�y���K�Kc���d!g�<��z�/[x\r����	\\I�Q�by��,�\nX<�	s��f���o����P����I��|JzK�Ͳ���c1�E�LRK\"2��D��!�w�����<��+�K\\c���Yf\\�\n:v���I��,��}s��9}�aܮxE��v���H@��B��)������|��|�`N컑��~�X�tC�k_�jv�N|��}�.;�4�ū��3c=L�NN,�̃�a.�ޓ���Mے�N�v;�W�� ���:c����m��s��������=Ȏ`$�5\n�Y?�_`��IOOb�F\Z^ÉGH�@`ۙ�.w,��.Jz��|,��@�́�t��\'	��\r�m��E�;K|�F{��5�]�������1�e3����:ܔ^rٳG���K��Z�}�����q��4,�\'A�R��7�����e�l\rO#�3@���o�g8��f*��.s�|i���Z��s��ԺV������p� �klcO����t>a��������\0�@�{ߟ�i�\'p�b��|Z3��\\����l�,n�q�;���o\'�:9���\0l�6��+H�rXE,rg<�\ZT๞��q���qͿ�v�\\7���:��\0��@�o_m��@�Hpwk�Ԙ��j���=���K�8,a�(��\'h���$.m�tY�G���pհ�l�����d0zu}�4bys7ȵtܸ�e�\'��P|,8��);ZX�������W<�u�ױo�b��S�f���4�L���|���!7>`K\0ߋl���m�\'&M4�Rqwؾ�D�J0s\"�e����e�1ڐ��6WW>�NQ��+/���&(?�uc��s~�\0��MC&�Бc��E�Y��0 ���S��\06���Q�����%����ύ���3�!�@@lbX��L����z�.�PY�N���/�o�Zwa�ڔ+-��	ͽ�m�,�����J���HHy�Qϫ/V|]&�-�w��\":��CX�,�_s���Ԉ���S5G�m�?,rd��2b�*�*�\"�d��ߙBa�:n�6>�}hZ��4��\\���^�Z�X.����.I�l��=X�F\'.I�/��`H삗nQv�p�0��Ė6p+�ظ�����4�L���Ri��\0E��x�\'���\r��	H�,1��C]�2��?[�	#1�\'p�dwc��^%�߄�|7��q ��\"�.nKa�Q��	D�v����;-�I��\"�����=&[������T����\\��!qy�a�����Ps���`De�n`�?������Y�.9��$b�$����J���~G�Τ�Z�c��p�8	Eb��2��5�X.��C���V\\�:����:�g/B�zÆxWnD�ՠdUvo^lcܦ����u�����Y�x��n<���]I�i�w\'>Oû3zK���xb�������dt��ܝ��@l��?h�\Z��=�\'��|[ ���p���6�ZE��$�\Z���n{�������.,\'=�Q23-��X��~���Ř�]������0ϗ4�@�����!I��6�-�ۅ�#cgIc����\n�.[7�� �����g$0>��d��������W���?���\nf-g�5�E��^�����$�� �SN�[�[�|M�#�_��#�z�,�K��ϸd1�08�{+X���M�;��MH�%J�!����n~͵�v�Bc�A龩 ����{�u��<4���\r����c)����j]ǹ`g���}Q<�?/Nݾo��žA)^<|N�1pC�5O���y\Z�;�q�E��1�m,X�݉�F; �i����c���[#	S�9�sJ�M�p�G+}�\"܎�a\\�~f/-ĝ���� �u=�riq����aŧ���y#��c�nX�V�����w��-\n�	�%������ݠhշ$K��L�ϸ0���s�p�n�@��3nd�͵��t�Ǚ�XA�☰�{��<�x�FwL�\r.{Y�l�!��d�r��w$Jx�;�o̔�Dݦtɭ\\���Ԁ����q�\0��6_�<���i�d���\\ߌ[r�+��:Z$��&�o>p��.�\'WH�z�j��9pL<0���庘���Dy����� �W_��\0&\0\0\0\0\0\0\0!1AQaq�����������\0\0?&��8@�F��l���a�r����.���)��B��`W�p�Z9e�!ܦ�k[�\"���LP,��V\\@�5L���*��5\0a�Vsb�x�pSY�O�Ew\n�5�#|)US�L9����Rh���s_<ÔX.��)��^a\"��Na����(��\'*�-� ?L!�\0nd��ET��D	l�$���9\\3�):ŕ��+��R=�y�|�|���#\r�J_L�v\'�UQe�o�] o�u;*���:28��B����^�ʷ\r����6\rm���g/��1`��QEpV�A��+���D\0ij�*�����<&���e6v��Yk\0�\0k3�M����� ��oq5V�\\�-K�\"*q;�ٻ~�&���-�gf�]��D��.-��vh-)��b�i_��:�����aC칊*=�R���mq��\0��P\r��}���7�ŐK9��@y�Urq\0J�Z���b�WP�\"��v�i|3#�5���L*\'���y4����IȪX��o (����z�\0��Q�u8a�����L\nֆ������bZyܠH�di*ݔ��32B+�R�`(�Q�(�4��v\0�A��\'?���n��烇��KQV�Op6��R��c{��69�0���Pb\n���\0нFwP�L)U�;��\ZP����BQ`�_�	ܝ�ۧ��{*��;1 ���P\"�`�C��\Ze�����%dϙ`��y��}����K��R\\��5,JB�\0�e=Whb��1��\rF���&��R�4�k%������>x�\0��r�l\Zk�K_1@�3���9�~��%�5ʬ&����C��1��5ӡ�ٗ!\n�t��BOnj�@C��=��,kQ�7�en`*�g����E1[�-@V3Y�.���b�����h�b�\0�a����e��@�[\rĉ�ۭ{�`�����V�]�3�R.^5+s/0m)��>Cڣ�^��Bz�v�AɨI#�\r�i\"����a��		C��c���(f��I08�g������򽦠�\Z�1vB��~8�\\��(ܴ4����8	�8�+������Աc\r:�����!;&<$��$u��(�����A�{�p�9�N)��� �H|�],��P>N��V�Zi�颐<���.��5�\0�ۨˉ�{�J���i&�t<�xc��-A�g�־�q�����.�[\ZwZ��>@m.&{B�ܞ3.����ډ�p[��r� �c\rZGW*�0T�N�S�G_iO�����B\0��.-|��������H`%2(����1	Fi�c�V���gR>D���Z�@����֊�E��q�V���Hp�.�P���̪�&]	�����n6o��WW/d}n-�7e�V�/�D�Z3�X�$�����▭�H��i�[��\0DʷQL������Ě��\\T�Js+����^{����@_ ����W��F�b0X,4#�GKǑ�(�-�Y3���K���K����Ԡ�D�klf�@��~ym���GA>�_dYM\"ݍbbd(o��H����8:��1����/�	Jj���)�/{̶Ԥv���G��4+t�\'���:LM=Bwv�۔\rZ\"�&\n��k�Wsrs~�a�H�\"�\r�9jPꘕ��?�����\ZϹVwp-*t�9�i��\\�(�,�-���b������苛�8�<�����m�F#^�KnG�G�J�]ʶ%�pe����v�tl\r9��+�y���\\2\\��+��$Oh+���^�%�2XQ�Eiam�Q*��-�P�eZ�H�*�&���K�)�[�X�U	��O\"��KH��x�\Zy�v/����-�Pg1d��p\r�\"�Yb�nZ�����Ι�}b�U1��j�dO�F�I��e8e�j6f\Zr�o��7i`[��bD �\n�X��1����\0&����Gc�D�J�z]N@h� �i�1�K.�\'�	�C�n2x�汉]��b3J���>�d<�CZ�R�D��AMP5z�^;k��m+�]]\rK��h���/�Y���8V���^}\\R��M��5;�z�_`\\3�v���ʉ�+j��ˤ�s���ر�pa<L����d\Z��n[.���\n�J��~�\0�f\0V��Pr��TWV�����ڝ�>`kF9��O!���.P�8\n�}W(��\0�4����Ake�C���F�U�\"�l;�!�c�Ԝ4�.$�j�2��Ҷ��ܸ��t�/%)�5Z���NK��& �}M7��K<Lo;��&pq���;^b.�fg�ܑ1�i.����������\0�b����\r��H+8;�Z�o��^bזۗ�+a���(�Փ��F�=Xh^lO�����	=8��;%�p�{@BA,+U\Z	�n}�hy�#&��טvӠh���M�����!@�DJ��Yԙ&n��C��@r�1�C�:���)�+e�����=����B0ϕ�o0�Hꘀɖ�yp,	���Vu��\\���1D��M��X��Z ������1R�zIg����|L�M���+�Hso���*G��p��X�X5�	_M��0�R�0t�e�+�M�zb\'j�\0�E�/,M{Xg����5�X G�RB�z��6g�FgN��G\'B�B/��S�#Ũ;\"ꢁ�����������p\0x��9�yP�&1�xL/M�b�	�R��q��_�B�~@t�Q~cd���_���N�2YBs\Z���w�t>�F%��*=0�A�3&^X���Q�7����eX�R��&\\��\0㨅�M\\$O-�F`#%�yʼ�$��U�{�v�6�U&���\"z�\0Q��NQQ��J�͸����M����ET�d�Ȼ��W�E�?�`<w|����SZ��z��z����y����!4TjTo�fW� �TL���\0d�uZ�������j���M؃j\r1����{.���8Xt�����C��x���NWP\"F��m�p�H�l0N��a�6��^\0R�Bj}�`f\\����q֜� �x�aֵ��2�Zǟ1Y�L� ���������,����$L�,�����lUd^��T�xR�wJ=Fp��s6�T��\r��\0�QxI�z���:�6V[��Fq�����s>k��ٙqu���l�?�P��|@�	Y�ȸ�$&�\0�B�~SӨNw�P�e W�Y,��]iX)�������n�-��i��0䂬0�nH��O������e ��x���	���.9�p�jw�{a���_�����ʤ�)Tf[�R��%L�vt�5�D�k-T�A�>ȭ�a~�p4��/�G������ ��\n�{pA\\�����@����T����%�E$8���d[,dF\\���Px��f�ۥ��m�=���Ӏ.��˱�eΠYA+�vU}J+6|�`h��$~酬�FH�H�x���\nY��\rKv	ʙ=��\'���0E��@�r�y- �r4�zO$6��>#�,4�c$/�)�1g��<���˃�}O,c��f<�񫡂�lx��L��\r�Y�����S��A�U�S�Y�6NV������ L�@6̲rS��\Z�`��)Pv�����f��R�c�Ǝ=?��1���]o���e�v���k�o�7w};n(@��	�J�\n����Pk�K?Z��-��Fe�eJ�$-qEc���$��p�A���7��^e3LVǎ���7>�r�:!o�|B3K��<��Q�$B�+�0��ow��K��f����8����el#ro�L�l��h/oSv\n#����(ثU\nZ5Cc����\"�s�<#�ﰞ��K�+�f4��\r��j����,���̍<�+�K�R\Z2�F�4�����JM�`�y�X�������x��ȗ�{Q�R�2\0U0�:{&<0\\VΠ)�.e��.9-�:����X�ߙXӷ��H�\r/BkiГP)Դ�2X�}h�	hdW:�\"A��}�Y8F^#\n��pbx�\"���uh}j�C�R0�[WT���-��B�V��XK8�g�{B�&ʖ�@ٌ��`�h�&���hu[,!��DZm�9���y�}J��%?2���Ī6�*[�BZ��a~\nX�KV���5�Ƭk���`�_��\nha�a`Ñ��!\n\"�-*φ=�K�]̸�Ήj���-*�ɸX����;CY�,.E��\r}�\n�IhN��\Z�[O�0�?�D��36_Ql.��n8�;��)/*�ˀv�AAEY��\0��Ne��`Aϸ�E�`���[���f��U*���\n�61�*�+S ����\"�#C�QEQ�)<�v���K�\'I��O�~\0��7c;��Y�)���vJ_<��ء�\nB��(����R�ҭ��]�M�k��9�������A��ܧk�9����2�I�c?�Qգ02d�^uے]~��z�^��X�}߹l$ݶ�?s((^\'�U��Z�PQ�Y(�c�B�a��	�G�Pm]u(���9�)�S������J�֒�F�%B�M0�����(�!��i�\0�6+\Z�(���ޟ�y/d(lX����y�r\"ؙ���;�\r #��c|\nB[B�b�ùz��BS��zM�+�/2�/�=�+�eD�[p��M�J%	�M�&�0uW؏�5*m8��HZ�I)W�U�=S�g��<5\r�\n�N�n(�E��]n`dW���������s@��\0�:�7f@�\0�H�&k2�wiP�8�f6�/D�!���i���D�A����o,:%.��ů��[\n,Yx:� �qR�nVo��e�Մ�\01��+(1U`�Z�\0F&����V�l���%\0V��C�`�\\��c{IZV�m]������%�ݪ`لO.�uO�k��I�R�v>f\0��������Ap)X��FY`�{3G�C�K�\'?̣	��~B]F�B)TUB`�o-��km�>qՀT�t��x���MA\\O����p��PT���Ꟙ\0:U؇gI�%\ZT�%�Xqa�1��g�凨#O�A��Q��,�C�*m�3��4�@!��G�VV�@0���$��_�LB��Bh���\0a}B��������5-�GY/?_Q�edޮ4S|���a�0�b�s�uO���`m��V2n:���i�/�e������z\Z.�qDv���uBSPDs�W=GJќ�5w(|$�c�J�a�G\"�����K�P�l��Qq�\n�q@\\o\r|ʗ#bJ@|�闥W	 ���n\\�G�ֱ�QXN��媼A�0������,m�/݃��� �x`(\0�jDi��[�@@��n�UpM�Pޮ���/(U�t�^��c\n��.��\n�Σ�ycgN�Hdah���1��Ȅ��++�0U���A3[��^A�Qi����0*q\r�rהőe�R�����7�Z�d\"����.���:�b�s\\�~*��]����t�j)a*�2ʉ����u)�-�,T���N;QiXm��|uW�_=��Z�л;XE-s,��\0�2�H�GE�\0�#@BeΧ<�>	c���*Ǆ[S����x��0PP���<[�x�?����2�\Z��ϹX��G\"n�pbr�~��HY��d4] t�:/r�e������/��\r�����r�S)���K\\O:�l�ʹϕW��d������$d��Q:j �k2���YI0�e�XC��h�o\rsA1�\'���ΫbUG�F���)l8n�Ȩg!�5\0���\"6f^O镚:��\rX�j��[�t0z����w�B����\Z��)�J4?ql4��]�|�#5(\nq�՟�e��W�4����X~&Ar�G�W�\rVVs̵���\'trl��Z�Gؐ��\0�K�&��HfbckH���^U��*�l�&\Z�A��?b&�mn9(�/����ͱ)^�r��M9�P���!�8�0��7.�R��6̤��3��e���0�l|@��%F#�!tF+E���\r�Z�!����m�P��\\�R<���1�D��R��-P��]/�h\Z�N�ŉ{TR��t���+.��Q��C2�zy��i�,�YE�Xg\Z�:�@�p,2���,�j��鏞�E����w���\r\"����\0�yCR����h�,���$�}���.�\"��Xei�l��p�EY]S�cx���y�C@�8�\Z/�]$G�\r��$8�/A���<����z�b��Di�^#}�)����}đY���������Y�P,:�����u\n������4c�D��̸�l�2�uV���\r�P�\"��}V�Y���S�0D�`��JUYn�%��Q��m%�\Z��p>q�^R�\n#�\n�O�L�4�o��G�U�]+��ؙt�+�Ō�	s��\0�,�	���h��P�$�ʡ\'k�P���qBq��~�X�����/\r�����.x��9�ʯ��38ØL��`�cM��f圡��;��A|Z���\Z��q�����o0�/��ʾ���< �\n.����ɇ2�A�o^��2K�ʪ�M���Y�+C\Zձ�p�@\0\'\"��oeC�*&��[��_:���h.�Կ�SGq>L�.��X^�3G*ya���P��n|s�2=�#\Zs�k�]x���[�G�Chr<ÙW��0֠�>/X��m�����ݯ�!�:���n�\Z���b^��/��mSÈm*B����5c\\��e��R����E;� �X\Zĵ��+}�2�J�^��L\0�]�^���x	L\r����Z�g�gߞ�G]�rgǮ!�4W~܇�@�G�5z�0�|UD�=b��%�s���mE(�(�U��f߈RQ�a]i\r�l���ub,�f�*�ˣ���� (�����-\ro�q����V�E�IL͕]A��\\.F�����-_ϙa�����gqՁ J��Úҩ��ZM<U.����},��6�x_<A���T�e,sܳN�EfO�u��mu�G�!�j\r\0k\na�\rC%N�%�h�[.,�0?�+e�eN��%�m���WLVd����/}F4�\0%P��Py�n_��!�s�=����\04�{\\@�;b2�p�Em66����%?U��\0dt�9I�R��{~�=MFJ]�}�\\5���Em}�.���Aj��K	�j�p8o2�6o�*y�I\Z������=�R��A���w�R��v_�\n��]A8�^���\\+�x(ᱭ�%�m���s6:����n�څ��\\��\'��0�f�u�j�Ӌ��^-=��a{�q�`�������@\00�U��$YP��m\n��-B��aJ���{��r��Vm��kL_:����9���ȁ����P�ܱ�!�{-�\"������\\L�������u����B���46��T�8�1��%����,\n[�h������\'9B�(4�I+������V��Ka�&�=9��`9�A.[VFӔXܵ4�p�Y��7=�mN���)T����+�!I]��2A�B(�]c��b�׍���p�����4����;a��P�g��0���m�\n]:�0h|kV�G>\"\n��S)��%�EN�]����p�B�����,Vڄs�-���Ҝ���Y�� ���EnT��Po݆| ��j�¨���e\r=Fd��I-Ui��)\\�Q��&���NY-7��:�S�j��e-��\n8+\rF���@�r�`�ϡ2�޹��&|�����QİgkD^dj�u^_sA�*��JZU+��\0�/�ԉ9����0A���֪Xo��L���P����\0hR>1�q�d��pUk̦\Zi��� �@��F�֣��Q��cA��{�\0\0�#�\01�2��B��W�W�Md�(B�.��F�`�=F��o�X� 7shg�a�,W*K���z�����>��x�]���r�j���m��a�I�#z`�2����(@��]�l���f1wv�j&*�����B����a��P��,�\Z�j��K��8�0j�P�>���c1z<��{.��aP�2�(�\\eUp$�,c()���W`�����J��h�S�1��11��;�\Z�U��f%���06a�P�Z��~��T>�:|��W���\r���Q���r�9�4.,i�Ӹx�A���`6����jf�/�?7X�4_��T�ܬ�$����*U1f���K^����&�Rz�\Z���-�0jm�f��1\"�WBQ�a���&��!´��z��LyHM�\0����ޝ��uB���c��ۜJ����Y��y\n��Yf��g�\r�8�0�3�������T������$��eK�XhՆ}�	Z�푮��S�H�\0�������@�)|{D�y���@�Y�{��|&�����	R�=�9��6����8]���#�?#exbm�\n�yWODo�%ov�x�\r�@�D���n0��1��Fg�o�`?C�ߒi*��T*H��i2��@�\0^z�lh�;���̵G0\\\nOa�pDy#@cw\0�-��5ĥ�f��\0&Y�\n�!��>�\0��!���2�%�yf������Q��eJ�|G;��O���K�)�T�Q�M�/j���n�;��4U��kDbH��nO*���Ӑ�U�5���۔���\0QTȶK��j:_���	f&�g�U_�#��ۗ��pv��0]VG�PӅ� �[}��g���_u���R���G7��$1�,���\rme�=�;J�]~�������fPK�/4�58%*\Z`���ԪA��bߨ�1DΥc԰�N|K���Ӌ��ß2���\0r���3��^0h�Ó���d,�� �h���!T��m\"�\nS�uΡ~	���<D����o1��=JGr���v\'WDPt�ȠuJ\ZPs\0\0��a�@�@d�BZ��\0�qo��h�0û�>ތ)��\0\'��\r�$��#�֖��_3����^�fc7�a ��F�uB<�=_��\'E(�̢���\\��{E�qV�!j�֓�\ZǠ�YE\\f���؃�?��ƕJ��,\Z����|��:��<O�S�@!�X�� d1<��\nP)����x��nDM�wBlM�W�.�����)�y�o��g\r��s�\'�ϔB�����\\5�a8T:wN�#�h��Ja�8��L���&�\0W���(����Q��9&��}�6��+�������!ޱ���s2%�����*w�}J���.�\neT�[J�Q��\"Q������O��3��R|bl��E�v�8\0���M�?!k\Z��0A�j���-X�P������@�MKP�M�����S\n��%�D��ف:{�br���=2�Y�Q�\r��,YU�\Z.l�C!���5���=C�~a�Ņ�=%�H�F{��T���P�$3}L�� j�hȜ�3�>�\r���������O�r�0���.��p:F�tU�8�`	�qH؎Q�.c���#���g���z�|��/c>���PaJmԴ���%e\Z-O�B�xmM\'R��n�\\�\Z�at��@�y�gV8��$B`�	4�7�z�+ZUƙv��?��>��	ř�l(��o����Y^�E#E�`\Z�R�Q��\r���`���޼FJ3-��»��wY[��(9��/\0�8�a�\Z��7,`����n��$v�l:�A��ht2�:پ�؏�&0C�ҟ�����B�ŋ������-� ̫z8X�IZ/4�Cg����1f4��]8ܺfB����\0�p�D!dtŜ�h��h���ͣ�J}��F�7t5^K�(��3%Q�1��Jf���&%�Z�g�x�hy�c��S�VX���Ǹ�Q�W��HyB\n��p���+���r��� 2�锋T��=���a�/@�-e=�%,b��v�^`B5�&��)����[�O%�J�%Y���^0�pc\rA<Z_ف�&�ˋuL�VbZˠ��7����.a�F\0@�2܅jV�չb�K��qX�oYRk�D��Ɇ\n��@T��4��\\إ�_�/dK�9�ȃ#kq�x�i����\"�w)L�Lψ��q�<Xh\0��y�7T]����B��m���-E�8��;�[��+p�b\r�M�E@<�D-`�@���\"��/��,�D��x�q\Zr�s*��,	�[�ddg)�~c #U+Ѩ�qH錱����VK�p�XX�@ކ\Z���NZ���(Š�5+�&F���SjP�c�\0���|�vF�|�0�aƜ�d3H:]R\'�J����J�5��q��p��z��_�iZ����[W���e�8��\n�.\ZP����\0��m�o\Z��E!T|\n���\Z�4�c�)E\"^\"![T�Ut@��-\0ǌq���/wV�pe�\\�7G|A]޵x�|���ij�\0b�!CZ�8&�[�wT�`.<�{Pa�D�`չ|���Xy�����`a��C�)�l�n�pUc�;�.<�`]С�6�����nk�A�v�N2~5����\\��7i?�1!=[�#�҅�p��̀����P�Lc��®]9�\\�qx��>�s�^B���}��U��{J�<���(s��ȝ1�5L��e1%*Ŏl���u#jB��<�L�? dLэ`˗.e�k���8������\0�.\rU�����R�cz�2�\rU�e�r7�m��q@�I��<��-N��E�\0F��4~����T�0_X��`\\\Z.ۘ\nI�§��rz��U���3s4�OX߸a�����?eQ�6]=�r}˝B�a#F����	Z90��S�E��}����$��\0Hx�t��,!nP�|h�\0P䀥7d`�0�Ez�q�Tl�0}���f�aUƁ��-�#�ڂ���9]�E݌t���G�_s(n�5��\n��>%��7� �������n|�\nh�<�>��V���-��ta�Ya�Ǯ�5>Zv���o�Sk#t��8����Dv�k������Pk�X��x�\"#\"�&i��T�a�8��J�x�4�M��.Ǆ!Pr�k��G�K��Ϡcԫ���Vѡ`d��^j�����K�\0��U��J���?��z��\n���$�(Ĝ.\"U@`㈹-��ny��AS��-�e/u	�K�j��F�([�2�9M��\ru�*��\r�`1�V�2�13]�\\����v�/��_�����7���gc	�U��N,%��u�-�c�~̮���y?`G\Z-؊�]��\r�r?���[-���I�OR�(\n���k��8�(@(�S�����m�H$\Zs��@�#u\n\0wa�x�� ���7{��0�%�b��������-�K��A#C°���w;8�y��(F,�j���1϶Q��k��zeI��|����kl�ⱘf���L�,��h���#`\n�ݠ����c�-�?p�Z*�o^efp}�+W,,&�9�\0p�˚F4\'���n��I�FJ�?�֛B�L4;MX|��#%XX�6.W��\Z���8\0�l��@�j�2�G��+;�gmY�{YYՌ {�E֥�Pj]��A]�YW��-eJ�E4�Aw��L����/�ۑlFٜy��{W��$�[\\�Q]0U����.�7��D��*�N�����,+��q�����xՅ���ͬ��A�o,5q��.�ǳ��S\"\rM���Hj\n���+��U�!=ŧ�z�h`�*�Ek���\0�������\Zc��\"F���2<��)F�f��%�UQXM{�g�����C�8}]]������|�~�����ĭ\07�m��\'v�Q�d\0�S���]br�4(ɛ5)Q�T}L�||@��ж	�H���f��,��,���E)�(�d~�(���\n��Qv���g]:P��Ŏ��X �`�m<��L�͚�Ed|���l��B>�3#��J]���\n\n(+���}D�f��WƠ�j_�<��uP\0nܸ����^�4��Ǹ�V(4�\nVO���hK� �r	Ec5�+U�*ʌ��NA�Z-�7r=���m���ɟ1]Tե�̣m�,�Vҝ�[kX]�,w�ɑ��C@�+W{��5Sq{VD���>�Y�C�$\n�\Z�,�Ϧ`�Rג��&E��s����o#�rlGDn�6�wq���Gc�g�1�j�h+6pj��]\n�̿�����8�b�y�ķR��R�<D#���t��w֬,� ϰr�,�@\n��>�ep�[Y}���՜��p��N!�D ��n��\0�ie�7##mE�D�m-�2�p��*�J��K�C<���i�ʥ||�%<aO�\r���-ݮćL110����QR�R�D��P�¦P��* tE�$\ZYEBS}�4�*�ܽ�V-�g��.v9�2���?K��cM+7_����qĽ$^�+M�\0�Ds�[���x�\0�����8)�-H��\n��_��\r͑� 8�z���{�������K&z>�޲ʮ�\\aɗE��2�����`���c���կ�H(^�l&�]���2�c����-^�!�μ�su�~�r���@nu�d?\"QK���hq�2U�TB�^��t�EC)7%��\Z�����e�\0Ǳ����g$.��A������t��У?R�����\nn\Z�q�v��o��\n�\0`FNh��\0�fA��b��uw���̠Ů3�od)���	��V+�}�\0C\\���1<,�>�Zc���\\�[I͛���W�[q*���f�+k�HM�ڳ+�e�M�m��3�\r�p��<F����(8�R�(�[ه1�OQ�kN%<\"�h+�Ӻ���T��ܳ.^�xTb�?�R%v�[-\Z)�ǁ�|���\n��@/I͚��_��:-] �\0)b�t�����`��;�a�@v�V!{p8y!��u%F>�S�	kX��HX���l�!���_�q�TJ�}ʅ@�y}��3����(<Wj�71����cU@�N��*UZ���w��*=,bUq-���Y��!��LS��{�h��T�� i����C.Ԏv�^&`$�(��#x��qU;R4�McLn6T\r�0���g����i���X�}��Db�ơ8�Y`p�˦%�g���<���8����X��\n���\0ȿ\"�HBN��!���!��#-U(�ݟ3������1ư�0t��\0\\^+��j0\'iBGr|��& ���(\n)��E%|��z�@*�����f9��\r�Ѻ �\Z�sO�`U���j��K+Ɲ��p�\n@��]��B�\n4��!�d��j��U��e����͋39�)+&�:΃�.�o�e=2�!6f^T�O]��#���ۋ:��l*���!�7n�ϵ7Mjw[(?�\Zɣ�pa�R�������6s��dQ�ĳ��X�E���A\n]f7lh8n�Ue�[�\"�R�)�*��:\0��ֿ�m�!|���@�fϚ\"w/	q�J�X��,38��Xt�5�#����PAP�\0!\'�#PB\r���K�L�dM{������z�\Zm��t�Nu5[�7�\rE`�`7%�����M\'Q@g\"y4R���C�⥕(��e�\'T\\ }Xe�Y��̘Q��~3;zYW�d.�V�4w}5)�\\�\n̤�(]��51I�³q��zts5y*+�	�J��2\\\"��\n;;��C����a\nի�-�5+f�UAo�Z���J�n-$u���H)�$�C��� �{�<�P1\"�?&H�q��DUy�T����;�)U �߱qu��0������@`��<*+��5��y\n�|A�纀xw-���\\-�#�k�e��p!�9�b��U�z}�[o�\0(�c\n`.�c�em\0[�R��w(�\n�c�26��P-�=�M�EXk)�έ�L7띲�D�`�O���0T��O0	.�\0\0>?ĤQ��^?�e��_���~L*w�ɢ\Z�c�+��iԹ�B�u�\Z)�Kg2�����\Z����J�R\0� }����z,d?IW�`�caAz�\0��Q!�]���X��9�ᴿ����D줣`�?0����n�^����i|��9�V��j2z����Ԭ�^E��CYV%\n�\Z*]�6ǐ,U��	K<��X�����y��6`��eo_a��喌%^�]@���[�� .����f� �(շ^\"!�Pp�/AЁ�ը8p�K\Z�WhP	��F�hz�G�Y��R�����!��U���5Τ-��|�	\\Q�o�B30:����زk���m�B��Ne�#Q��G�n��WU���D�Voܶe�&\r�?�B���^бJԤ�o��P�J���w���Chq�[)4�jR���!46�2�׈�#f*,��rMr\r�������qW�-\'�8*ޚ�B ����&��	�o~%BM%3�_\Z8\\UtD�ص�o~��S�8�q��:X/�;����=�?Pu�1�$S�(�\\�fܪ�� �EU��Kh�ҋ\'Tq��	֑��S�,��=��X�$�>�9�ϓ�V@�)�0�7����Y+���������㨘��> %��kx,LC��5;8w�>%$����I�9A�����#w� 3*�E\0�����R��6�^�u������D��Rۿb~���+�Ɓ�!i���\n��&Y�A�^�#p�T��o�16��7�!�M�oFT�=\0b=���\rtB8T̔�z�\0|�嗑��{Yp�_H�V^��P�������2.\n/Y��1�£$��$8-ķ�T�0�m<�11��ЩK����!�+\"���)K�4YTQ�#���%����j��>#\"s`x�,Z�ƀ�fgZ~\"�P���� e�Zs�J3Û��bg�e�[�](Q��>��[R5�_�`�d�� ��;���/S+x���ޒ{?��\r��e��gרZ�P^a���¿��A�qj�c���@�韊���� ٙXf1�+sg�ܧ�����]���0jԨ��	�ְ���u�l����zb�j�E�*7��]�bL,hX�*�w*�kN�c�iZ;�vQ���� �΁�ePi7\\����!g�B�c���Ly�:��8F]zX�pe���Y���B�4\\\r4��{��(\r���F�-R���@�d�k�=�	z9�Rl���y��`c�[����bZdt1�l�ٯFe� *.JB�6�,����X�\nJ pV��,�������wmN����fqAQ�u�)B��lxi������_�G7�p�k����4��8���ѷ��-g��<��i�c������D��m�����6�C��\nGB�{~!�5P���E�Z��ј��dS�@��w{�	D��ʈ�9��4��\0�4�Ds\0`G�==�Z������96�h���D5S��+��dHa������g�֌O1��U�c�9s2�+�F\r��~cPA@Q~V4��V�.��B�>e�Fϧ(�]Qb���Skb���KD����\nSz����g�/�Lް�60��2@��s����͞p��1A�@�Z�88n������f�$�T|����q�\'���*���zm��+��7�`�3h��S��+�H�D��c�4C6W>��#�%��7�!��70Jn�������Z�O$>�;B�mܱ	����X�l���\"��zZ�d��y����G�P�Q ��#��\r�+���+���h[�1Ǩ�9���F��\0\'}E7\0��\n<��XK0�H�h�[WtCN�	��C*��0W�E�)aE�x��t������DuW�}=bzic�)�`$B�Å�n��0�*�]@T�Q�%�m�4�,��X�\Z��������s�����dF��5}�s��y���-\r���v��JE�����b\\��a���K���jH��<��ԉj����fm��0o*��WY{I��W��r�h-�6�p�E�	ڑ~�(�Y;�+�q�\0vN6�������d�\Z>#��Fq��*>�Q�(;�]P�`�/��9�o1��B���D�!r%S@��7���\\�Ռ������+��5;�2y��<;��2��ɘ�\"�_:���jތ\n�l�=h�(���UG�g�+�X�RR9��aE)��:��!9��u.@��34�sG(�[LGw��FL�6�/3V,��0��p�1A�a�Im.�7P�K��O��$r�1���1WBd�r�K\"�i��mC�����\'+���%�b���ހV\';��7�Ab �u)2a����\Z�E�����Zc �[�\n( ¬�Nb�7#k7\"����JH|�� \n��O�lS��`�0�Ԃ���[��X2Y�%�2����2j����\0ȱ���X�i��@�\"�cq��dΪf5��)d�����e��bx�?�`���=T�e���L�/��7�O\nVL�m^\0?-\n���Hq!/�v��zw���r�t�\r��E��r����{�H_��ɖyk�B��g���]ӗ|��|q���{��H��У���H�F���)��_D�һn��]C�n�*��Uv.[��䫿�5�~IQ���Q�S�p8�������`���w�-�l	H�򫣧OR�p�^#��LC$��4^!jmT\r�U\rKҨ���\'ٯ���c��|�FL��14lxHQM�\0�ػ�\rî\'��3��3�6��ClmOX=�m_(F(�x!�AGD��\Zr��z�H��&]�.^!�K�P���,ɱC����%I:`�p|�.=^|�f�\0��%�\n�0�+o,$\rR���`�h*�a��/��+N>2^�mMț?!���z���V�&����s��&b�!e�W����S�@%1]ѣ�癆��:\"5�ǿ�.�L�:se;�T���k1��-���!�\"����RЅ�uL�Pxz5�	�a_5����_�&�_��;R�S�������+��F�ű�,����)�*C��A6�y1̻0>���kA��ZOLE���e���G_���e��0�ʯ����2%\'��=�� Cbt�ʫONw.���Uȣ\Z�+av�2��1\0y�tw7[��K��:v��C�!\0�O��am�C�X�q��<A�˙S�H�XعQdb��.V�E8R@���1�5�\n��\r%�\0�e�s�r͠WN��Jv,SK��v6��n�`��8�D�y����#%�wE���\r�(.6*��6<�i���W��<��D���v��\r�՛Pq���z\"��R\0��`�w}�z����}M[J���W�Ll.�l�����r������air{kpEN(\n��4QyWq�mnXuNW��:4�\0$���:U~�mmb��\0\n1��/��kmN	�w��D[��nFj��̮�yȬ�7��3��C��)�pF�V��$��W\r�S�k�R��\n���0��|S�����%?\"��6�֙fi�߄�����`�;%s��ي�}�Z��4p��%}�bЫ�q�w{�����pW�J�ż��k��lE��y��:Q;�Utd��.�EU�|�K�Q�Hf{Q�~/����3�۩ӆ�a�h� ��N�Pb�c\'O�we��=G-�p���[�r�)!u�ĸ�\0�(�@h�f��#�ջe�٩��薿�KF�+~��lM�	���Q��Ze���_�rm�g�H\n������zF),�#hW��8j�Q\Zw�ԪÈ#�f���y���ύL�W}o���?����:�(׬��*\\]*Z��7\':V��~f��_8�����g���Z?#�bF���V��zu�/���2%.H��N��LGǀ���Lۆ�æAEt��\0ٙO�\'<JӔG����8�b�tJ�����V���X�0}��gq���ƲǞ�u	L\nqF�F����\"��\"�\0�YM�c�#�\Z�x/��2���H�����tP��~切�dq���,M5A�7G��[��Օ��֮�fz��P�P��f�\0�u3�͈�f�>�e�a��:�д[Ə�\\�Hˆ��2�H��A5Vx0������\r�������T��U\nԼ.���u��0���2V0�\"-)��\0qL��@�˰F��\Z��p��q�=���&c�ןp�QƳ�Pg���1���w,P]�����nH�6{��\r�J8��0ңA�:���R@�[T��qc����w_�\r6)h����qQoo�1RQp���R�/\Z�Zk-�/k�����.��.����j���i�y+�}�+�T^�+�hq���6­�\Zk6�Q�S<?ȋ�kѣ퍽4:X?�fKk&��n05+!> �C�CV��@�v_�b\Z�Nߨ#<=�s@�C�Iϸ�]���B\n`n> ��4u9�U��Nt����߈�\\t��[��{�Yq�����0���k�\0B�����\0V�G���Z�\"V�tx�a�k�� �V.k�1��m�)�̆Qc�����xH�>a��3�{#�m[��[T|ǽ���q�zht�W0��j�\n>I�\n��7\\�w�j���j��#�Ut�ϒ�e~2�:Y���<�Ǣ\n<�\Z�����\r�\0$4\'�zJ�\r���w��\Z�^�IR��\"�	�GyX3�ge�8�N	�f8B�ʜBv>+wr�K�(�`1��cIK�R���\\���@��� ��R�S\\@��eZi�(���E-.�%�8��\"-�_�j�G������`�\Zzc��V�1�a�+�)�-	qy���o\"AT�>b�\"���u�{O�O�K&%��%\Z[���O��B{�ȅAz��ޛF�+�d!De��ޠ�� ��Vn���P5$�(G�&x9������!��G�Y�� *[�+_�+x�Cܬ]e7bs.�.��hSN�h�Xix����q�5�\'��>jU���Fi`-Z�P|u=�؍�ֵ\0��y<�`����=�9y�dz����)9��%J���H�p��n���\0&j�b�~+���6����}!�v�X-��a��Y��!���J��,(�W��6�����eX�\0h-/JP��\ZzǹT�,!v��UU<��^T1���~C��q|��#֮Tfq���g�[,��C\Z��Aoj��pK�pw��/8)�g�����KPԼTќ��#��2��fpW�̰�5�W��.9�d6\'+���U����^������z��{�|J�.�>7~��)���\0�\08����`>�|����cȷ�Ѣ%q��*�ԫ\\^�!,�-��bT�g���T���\"l�t��,�	_����-��/MZU�\n^�\nxb���^ \Z��\\\Z,=�@�soa5�xL��kQ�:^��G�R2��\\Q\0�./)\Z$����Hb�\0B^W��(\\�D{�vgE�8p��l6K �.��V��%���b7)B:9)��K��%b�5�*���#�o���9�0�j��hsg3X��+��-�Q�\nK�2�\n5~b4��Rf91�k(��byx�-���Q�4�#Lr��N�ڛ�3�F�+*=�1��A<�[U����i��\"_�[�~�L�K�CᏲ �.h�K��g&��TRT�tj��y�ۙt|$!<��\'~�E�h�|K��cÿ�B�Do)��Z�g��\0m�@96/lm�d���X������҂��d���c�P��#.p���A\\$$�#������\"�����s���Q�\\ 9�nF=���\n�kY�=���CNEM�K\\�\0�舄V,�ܵ3A�g��.}��BaE��_ܧe5���u�nj���x8{�e�\r������nb��v���r�_\n��K���1�+(I\\��D<G�a)2)�P�R�����p�Z)�DW|t���g�o����%��p�\r�+�γy�\0�c\ZU�h��q�[��������*]9��g�eQ}�K��5��[�� ��n����#��ʚ}[�(�o��trR�]rw�e!_\'�#�L��)HJ&}���O���U�\'%�Q��S���)0.����d�̽N�\nŃ���\\Ϩ�1,(h�۠EPys��VD�)��a+�,[��ʷ���\n�m���쐾~��AU�)ou5�3�L JJ�A&>$b:����|D��c���g](�Il�`�M@��{�t�+�0�WB�����������H�/H_-ߘVC<�&ƌƪ�5W��R7�g�h��%�g� ��\Z���\rtA���͸XT�{�3�i()|&bX?������4+�^�X��ݎc�:�PK|�\Z�b��m�V��+D���]�	jT�Y�C�;nN��\'�!辐����m���n��VW�];]�)X,���֚��A�g�R�-�w\r�y?�T��-\n\n����@�gTAu.+n0�\n�����R\"d�N9�pQ~�!�eR�6msVψ-Ѵ.enJ��wJh<��,NE��B�\0��ҵ��Z��]�ÜJ�Tu�m\0�&f<V�\0��9gMƳ�M?����/���\0�u�̗6?�pr�PR���ô\0��\",���8���Әե��\0��<*��a����� ���V	5�M�S�_<by6�GS\n�x�,o3ധt��9�k\rb>bҊo�~��{��@^�J�,��y�>\"6?L���\nϲ��p_l�u�m\'��T���kʐ�8\"W�/\ZM��3Vn\0��U#�J��R<	T�E�Q�v5�� )�(i��x��̀���U�=P\Z�Q�\ZX?�l	�]ڽA����-�,�>�N��t]_R��|&kB�=> ,ޱ;��-K^�7A��u�y��ay[���1���s�9\\F!k���t>&1�(d㸪�-�+���`�f��?�,�\0`XK�dCT�reFb/C(�\\=�\0�,�����Kkv�P���Z�e���R��晠�]ʚ��\Z�}�Z>�@K�$g(:am�V�33��KoS�j�]�7C8��[�T�ԩM�2���6kqզkpOwܪ���`51��8�ƥ��P_�s��e�ՠK������2�:�\r1�fo|q3\nspҐ9X��	T�-U��a�\\:U�q�f�1!�{1+�訢���o��E)�Yy@˂!�d���x�,��r0&��E~�l�S1 G*<a�>�YO�n�g$�_s^9h�`�ħ��f�&uy�!��8#%����_2�&�YV��L�%v�d���W��hʣzR���v��/��\Z�SM�|16�T@�uz���.>#,]��т��n*��e�[���#`z\0R���=Ґ{�|��s�#^b0K��{55,`e����L`���ڞ�:��KE����0D�hC;��B�Hj���T:�jph�`<T�,\r�8ϲ(/,�;�RiFV�Ղū%g�\0.����H	V7\0�)4���Wy�4��sM�{f�a���P@i\0�s3�4\n�c�z|�݋���O7(���U��q�2ᖆp�3,���A-�(s�0x�no�J�6�,T��ܱ���=��+�F���\"��բ�*Zq�,�y�ʚ\'Sx?3�V��-��ѡ����a��cwI����N��Da�\n/�G�F���UT)>᠋��7)0�_-���\r�8/����J�{<�0�φ���&�,_D%���r+�\"��R�l�\"*��}��Nĩf���]+����%0�ɹ�-��Ȳ�eX�m���b�VX0�^F�1��.�/#���6{=+�~���\Z��(��W��*�7Vv�pl���T�3��f��M@X�mD����S�\'�����e�a�)A�̾�(cpG��lQtJ`��j�F���&��¡oU(�K*S�b͊x�p��K~#��,r��.(@y�JzG��ۓ]BF7+��E�*(�Bf��F�&;da�\"l/F �uL�4�8�\\�e�4�ς%=��3KE��z\\#>*,44e�fK3ve���;��ޣB�*}�+���\Z*�S4j��C@*镎ki�����-�=�~���P�~%�����5\n�A^��\"n�9��/�����owt��-���ScG��.Ϳ��*�r]�hzqȡ���,�R�F����a[U�--S�b���d�E�i�b����.D^���F m(�3��5�9M�^���P�J��2���p&\r�HK�Pډ~%ٲ�V\'.[0��%�Ч�(�y��V�&�BQhi)���wz�Js*�����.�-���%P��/R�%�̈AK�k@�o����u�2�����6�C�c���v��KN��������S��3<���Zb٫�4[j�/���\'h��`�ڏh_��k�Yhn���Y5��W��\ZSI�r�a�,��ʶ��w`��SG��[#��\0�J�������V�� +����6\\�<\nJʒp8:���*�c�,b�ʘ�XU�\'�9 +SqQ�]\n��Fh˚�@�,��F-x�	�sB�9�K��۶���\n��uE�V�f�����~���ǌ������O�����څ�+1�x	Q��%HV�9��Qp�;ṃI��#�,]��Kb�\"�Z�`�?{89�%�$,}w)N�`�����y����7\r�m0U/D(7���\0�)����\\Ȣ�\"Ӕ�u�����j�C�51� 8����@�L�Gj�.����a�\0�?\0YBG��G��a9U�>��C�����Fl�8�W)�\0T�C�\\�-=@m�U-ȶ��&]���m��G���JG������&�?�^�A��c~a��\nV	r��+C.�R�R���P�q\n�<X���\n�Z/i���� ul�cA�A�S�,(ƍ(��/�.4���.a��Y�����O��dŅJ�+���������g��C`b4�ʔ�\0����X\"�9̡��,v�+j��Za�bJ��a`6��l��D�[x�F�a\"Ţ�H�`�S.8@����y��(���=��S�L~��(ܣ��4&\0���#��Fz�����]s��o�\r�Hֱ\\n�_�QD�]���9x�U�&��R�?����o+��^#x%�݈�l{�ƹ�!on��5E���\Z�\0�B�q]�.��z�F�%�\0ߨ��\r�3[�Y��T,R��*�W�Q��(�a�u��~D]���*��o��Y�B�Q�\\�/\'��.LY5\\�X����E���U�%h߱B��F-2�1]�Z�P�W��-٬8����j���������x����r�<D��ĸj�G�P�\r����3741\"n�\r6o��:�2�sHF��q��Xg�%��O6��Mv���󈤶ߛ%�uZ���b�\0�)z��r�PzakG�;deT�R�w6���0\'Ϲb�Vf���m�B\0d0B�0��\r�|��\n�<���Z>`�f�\0��b�7|�\0r��@�|����N&���Eb$Z��4�qz|���\0�!���an�Ȧ!�����#oX�4\r��E*�亍��Ү*�^\',-�Ӛi-sC��61�<$�e]���9�_�pvbP���3�YgQ����ƴ�q[e�lAm`�����69s�m����!��݋*�)�	K0GY!�\Z��.�AQ���*�&���ʁ�HL8�����e@ۭ���h���Y�&�U_�)R���\0�?Ķ��E�\r��J��e�9���12�N�~R�~�d�:u\nq�J����Ff����ɣ5Y���v���(Y�Lr��`���R��&\0۫*!=��\"�e���3m�[Qm{�\r�VB��d� v��ef9	l����^M��5��^�fe�^rJ]�7	Tp��`�B��\\�� .�����.������mg���lW�r����ڳm����r%������}���{�Z��)��9V���!\\���*X���F����chl��RO\\BCD��5�-�#c�]C��ôF�2��X� \n�&������nm���=YX5b\"��Zj�0DQ�T�<�\0���Cg�������`�L���9ʅr�h�\'�[-0�#����e�\'��}S�q��V�Ij\n�&��W�C{�̍]Ma�V��uqc��;�[��t�R㟹oV\n�ْ!\'M����sN�ey��\0�z��Gܣ r��ܪEr��$Ζ��ȃ��yLԾ�r\r�\"d̬�	٥�dAN�I����4�`�ܾ�{���Os\Z`���)r��WB�ll��3�9���e��r��d{#UZL.%�\'�uV�9CX��8�j�\"1t���W�9G��Q荁�H���WU��?�g�(�x��5�~[�`�G\\̸�,Gr��s�>R����C��D5���\n�`NH+��!���fRD>��V�e��W_2���}LK��d�����\"\Z���}�iiE�pTYWQ�V�9l~!�;�>*�ܰ<+�L����1��r��A�;���oկ_�m�[�A��ٛ��k9=�Uf�q���_7[�*/����y6��*�QUDcT�J�5StE\r�)���5XUh5����C���+�_��Wj�X��z!��\0R���TؤwN%8:l�\r��9�i�}&Qig�rZ\Zb��n��U��\'(J�y�w\n�9�XB��_JI��[��!�t���0� x1�@�B\nB2��\0�қ��q�0��lrЄǀ�Ig..%Dx���,e0y(��s�t��5�l\r(r��\Z�Y鍕W*��ȉi�Tů8ڿ˙J�R@n�2%�h+*������Ǎ�S��pp5�a�BdY����\0�>O�[�J�Vp�:	�Ya���q��R�P���U���j�Ik)_\r�\\e8�]z\"E��:��wU*ɠ���?��cH����+�@:�5��\"�n\'�ȷ�Y\'s�)~4@�;�f�p��i��N;A�P#��',5,20,4,4,3,2,NULL,0),(1,1,2,'2014-08-05 16:45:09',6,'briga de torcidas',NULL,'-22.912611','-43.2301523',NULL,5,11,4,4,3,3,NULL,0);
/*!40000 ALTER TABLE `ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_atividade`
--

DROP TABLE IF EXISTS `operacao_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_atividade` (
  `IdOperacao` int(11) NOT NULL AUTO_INCREMENT,
  `DtHrStatus` datetime NOT NULL,
  `Justificativa` varchar(200) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `IdAtividade` int(11) NOT NULL,
  `IdProcedimento` int(11) NOT NULL,
  `NrItem` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdPessoa` int(11) DEFAULT NULL,
  `IdStatus` int(11) DEFAULT NULL,
  `IdContratanteUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdOperacao`,`IdAtividade`,`IdProcedimento`,`NrItem`,`IdContratante`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`),
  KEY `R_250` (`IdAtividade`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`,`IdProcedimento`,`NrItem`),
  KEY `R_251` (`IdPessoa`,`IdContratante`),
  KEY `R_252` (`IdStatus`),
  CONSTRAINT `R_250` FOREIGN KEY (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItem`) REFERENCES `atividade` (`IdAtividade`, `IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`, `IdProcedimento`, `NrItem`),
  CONSTRAINT `R_251` FOREIGN KEY (`IdPessoa`, `IdContratante`) REFERENCES `usuario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_252` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_atividade`
--

LOCK TABLES `operacao_atividade` WRITE;
/*!40000 ALTER TABLE `operacao_atividade` DISABLE KEYS */;
INSERT INTO `operacao_atividade` VALUES (1,'2014-08-21 16:55:18',NULL,NULL,NULL,1,1,1,3,1,1,5,4,5,2,3),(2,'2014-08-21 16:56:32',NULL,NULL,NULL,1,1,1,3,1,1,5,4,5,5,3),(3,'2014-08-21 16:58:52',NULL,NULL,NULL,4,4,4,3,1,1,5,4,5,5,3),(4,'2014-08-21 16:59:03',NULL,NULL,NULL,10,10,10,3,1,1,5,4,5,5,3),(5,'2014-08-21 16:59:03',NULL,NULL,NULL,7,7,7,3,1,1,5,4,5,5,3),(6,'2014-08-21 16:59:03',NULL,NULL,NULL,5,5,5,3,1,1,5,4,5,5,3),(7,'2014-08-21 16:59:03',NULL,NULL,NULL,8,8,8,3,1,1,5,4,5,5,3),(8,'2014-08-21 16:59:03',NULL,NULL,NULL,9,9,9,3,1,1,5,4,5,5,3),(9,'2014-08-21 16:59:03',NULL,NULL,NULL,3,3,3,3,1,1,5,4,5,5,3),(10,'2014-08-21 16:59:03',NULL,NULL,NULL,6,6,6,3,1,1,5,4,5,5,3),(11,'2014-08-21 16:59:03',NULL,NULL,NULL,2,2,2,3,1,1,5,4,5,5,3);
/*!40000 ALTER TABLE `operacao_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_checklist`
--

DROP TABLE IF EXISTS `operacao_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_checklist` (
  `IdOperacao` int(11) NOT NULL AUTO_INCREMENT,
  `DtHrStatus` datetime NOT NULL,
  `Justificativa` varchar(200) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `IdCheckList` int(11) NOT NULL,
  `IdEvento` int(11) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `IdPessoa` int(11) DEFAULT NULL,
  `IdStatus` int(11) DEFAULT NULL,
  `IdContratanteUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdOperacao`,`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_253` (`IdCheckList`,`IdEvento`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_254` (`IdPessoa`,`IdContratante`),
  KEY `R_255` (`IdStatus`),
  CONSTRAINT `R_253` FOREIGN KEY (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `checklist` (`IdCheckList`, `IdEvento`, `IdLocal`, `IdCliente`, `IdContratante`),
  CONSTRAINT `R_254` FOREIGN KEY (`IdPessoa`, `IdContratante`) REFERENCES `usuario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_255` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_checklist`
--

LOCK TABLES `operacao_checklist` WRITE;
/*!40000 ALTER TABLE `operacao_checklist` DISABLE KEYS */;
INSERT INTO `operacao_checklist` VALUES (1,'2014-08-21 16:53:43',NULL,NULL,NULL,1,1,5,4,3,5,2,3),(2,'2014-08-21 16:58:21','cancelando checklist',NULL,NULL,1,1,5,4,3,5,5,3);
/*!40000 ALTER TABLE `operacao_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `IdPais` int(11) NOT NULL AUTO_INCREMENT,
  `NomePais` varchar(80) NOT NULL,
  PRIMARY KEY (`IdPais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
  `IdPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `NomePerfil` varchar(50) NOT NULL,
  `DescricaoPerfil` varchar(50) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador','Administra o sistema',1),(2,'Gerente','Gerencia o processo',1),(3,'Operador Padrão','Opera o sistema',1),(4,'Supervisor','Verifica o processo',1),(5,'Diretor','Acesso executivo somente para consultas',1),(6,'Operador Master','Pode operar em lugar do Operador Padrão',1),(7,'Administrador do Cliente','Perfil para o cliente administrar o sistema',1);
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_menu`
--

DROP TABLE IF EXISTS `perfil_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_menu` (
  `IdPerfil` int(11) NOT NULL,
  `IdMenu` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdPerfil`,`IdMenu`),
  KEY `R_166` (`IdMenu`),
  CONSTRAINT `R_165` FOREIGN KEY (`IdPerfil`) REFERENCES `perfil` (`IdPerfil`),
  CONSTRAINT `R_166` FOREIGN KEY (`IdMenu`) REFERENCES `menu` (`IdMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_menu`
--

LOCK TABLES `perfil_menu` WRITE;
/*!40000 ALTER TABLE `perfil_menu` DISABLE KEYS */;
INSERT INTO `perfil_menu` VALUES (1,16,1),(1,17,1),(1,18,1),(1,19,1),(1,20,1),(1,21,1),(1,22,1),(1,23,1),(1,24,1),(1,25,1),(1,26,1),(1,27,1),(1,28,1),(1,29,1),(1,30,1),(1,31,1),(1,32,1),(1,33,1),(1,34,1),(1,35,1),(1,36,1),(1,37,1),(1,38,1),(1,39,1),(1,40,1),(1,41,1),(1,42,1),(1,43,1),(1,44,1),(1,45,1),(1,46,1),(1,47,1),(1,48,1),(1,49,1),(1,50,1),(1,51,1),(1,52,1),(1,53,1),(1,54,1),(1,55,1),(1,56,1),(1,57,1),(1,58,1),(1,59,1),(1,60,1),(1,61,1),(1,62,1),(1,63,1),(1,64,1),(1,66,1),(1,67,1),(1,68,1),(1,69,1),(1,70,1),(1,71,1),(1,72,1),(1,73,1),(1,74,1),(1,75,1),(1,76,1),(1,77,1),(1,78,1),(1,79,1),(1,80,1),(1,81,1),(1,82,1),(1,83,1),(1,84,1),(1,85,1),(1,86,1),(1,87,1),(1,88,1),(1,89,1),(1,90,1),(2,19,1),(2,20,1),(2,21,1),(2,22,1),(2,24,1),(2,36,1),(2,37,1),(2,46,1),(2,47,1),(2,49,1),(2,57,1),(2,66,1),(2,67,1),(2,68,1),(2,71,1),(2,73,1),(2,81,1),(2,89,1),(2,90,1),(3,36,1),(3,37,1),(3,46,1),(3,47,1),(3,57,1),(3,66,1),(3,67,1),(3,68,1),(3,81,1),(3,89,1),(3,90,1),(4,19,1),(4,20,1),(4,21,1),(4,22,1),(4,24,1),(4,36,1),(4,37,1),(4,46,1),(4,47,1),(4,49,1),(4,57,1),(4,66,1),(4,67,1),(4,68,1),(4,71,1),(4,73,1),(4,81,1),(4,89,1),(4,90,1),(5,36,1),(5,37,1),(5,46,1),(5,47,1),(5,57,1),(5,66,1),(5,67,1),(5,68,1),(5,81,1),(5,89,1),(5,90,1),(6,36,1),(6,37,1),(6,46,1),(6,47,1),(6,57,1),(6,66,1),(6,67,1),(6,68,1),(6,81,1),(6,89,1),(6,90,1),(7,16,1),(7,17,1),(7,18,1),(7,19,1),(7,20,1),(7,21,1),(7,22,1),(7,23,1),(7,24,1),(7,25,1),(7,26,1),(7,27,1),(7,28,1),(7,29,1),(7,30,1),(7,31,1),(7,32,1),(7,33,1),(7,34,1),(7,35,1),(7,36,1),(7,37,1),(7,38,1),(7,39,1),(7,40,1),(7,41,1),(7,42,1),(7,43,1),(7,44,1),(7,45,1),(7,46,1),(7,47,1),(7,48,1),(7,49,1),(7,50,1),(7,51,1),(7,52,1),(7,53,1),(7,54,1),(7,55,1),(7,56,1),(7,57,1),(7,58,1),(7,59,1),(7,60,1),(7,61,1),(7,62,1),(7,63,1),(7,64,1),(7,66,1),(7,67,1),(7,68,1),(7,69,1),(7,70,1),(7,71,1),(7,72,1),(7,73,1),(7,74,1),(7,75,1),(7,76,1),(7,77,1),(7,78,1),(7,79,1),(7,80,1),(7,81,1),(7,82,1),(7,83,1),(7,84,1),(7,85,1),(7,86,1),(7,87,1),(7,88,1),(7,89,1),(7,90,1);
/*!40000 ALTER TABLE `perfil_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pergunta` (
  `IdFormulario` int(11) NOT NULL,
  `IdTopico` int(11) NOT NULL,
  `DescricaoPergunta` varchar(300) DEFAULT NULL,
  `RespostaMultipla` tinyint(4) NOT NULL,
  `TipoPontuacao` tinyint(4) NOT NULL,
  `Obrigatorio` tinyint(4) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdPergunta` int(11) NOT NULL AUTO_INCREMENT,
  `QtdVezes` int(11) NOT NULL,
  PRIMARY KEY (`IdPergunta`,`IdFormulario`,`IdTopico`),
  KEY `R_192` (`IdTopico`,`IdFormulario`),
  CONSTRAINT `R_192` FOREIGN KEY (`IdTopico`, `IdFormulario`) REFERENCES `topico` (`IdTopico`, `IdFormulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `IdPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `IdTipoPessoa` int(11) NOT NULL,
  `NomePessoa` varchar(80) NOT NULL,
  `CpfPessoa` varchar(20) NOT NULL,
  `RgPessoa` varchar(20) DEFAULT NULL,
  `DtNascimentoPessoa` datetime NOT NULL,
  `Foto` mediumblob,
  `Ativo` tinyint(4) NOT NULL,
  `IdEndereco` int(11) DEFAULT NULL,
  `IdGenero` int(11) DEFAULT NULL,
  `DtCadastro` datetime DEFAULT NULL,
  `DtUltimaAtualizacao` datetime DEFAULT NULL,
  PRIMARY KEY (`IdPessoa`),
  UNIQUE KEY `XAK1PESSOA_CPF` (`CpfPessoa`),
  KEY `R_20` (`IdTipoPessoa`),
  KEY `R_221` (`IdEndereco`),
  KEY `R_263` (`IdGenero`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`IdGenero`) REFERENCES `genero` (`IdGenero`),
  CONSTRAINT `R_20` FOREIGN KEY (`IdTipoPessoa`) REFERENCES `tipo_pessoa` (`IdTipoPessoa`),
  CONSTRAINT `R_221` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`IdEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,1,'Administrador','111.111.111-11','11.111.111-1','1900-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(2,1,'Sidney Samitsu','596.278.919-91','18.740.470-7','1968-08-25 00:00:00',NULL,1,1,1,NULL,NULL),(3,1,'Marcus Sandin','111.222.333-44','11.222.333-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(4,1,'Ederson Juliano','163.527.038-36','11.222.333-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(5,1,'Alexandre Takashi','281.038.128-38','11.222.333-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(6,1,'Eduardo de Abreu','305.898.098-14','44.444.444-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(7,1,'Operador Padrão','111.111.111-22','11.111.111-2','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(8,1,'Operador Master','222.222.222-22','22.222.222-2','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(9,1,'Leonardo Cohen','442.614.378-05','66.666.666-6','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto_servico`
--

DROP TABLE IF EXISTS `posto_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posto_servico` (
  `IdPostoServico` int(11) NOT NULL AUTO_INCREMENT,
  `NomePostoServico` varchar(50) NOT NULL,
  `TelefonePosto` varchar(20) DEFAULT NULL,
  `Observacao` varchar(100) DEFAULT NULL,
  `ResponsavelPosto` varchar(40) DEFAULT NULL,
  `CelularResponsavel` varchar(20) DEFAULT NULL,
  `EmailResponsavel` varchar(80) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `IdTipoServico` int(11) DEFAULT NULL,
  `IdSetor` int(11) DEFAULT NULL,
  `IdLocal` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdContratante` int(11) DEFAULT NULL,
  `Ativo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IdPostoServico`),
  KEY `R_246` (`IdTipoServico`),
  KEY `R_249` (`IdSetor`,`IdLocal`,`IdCliente`,`IdContratante`),
  CONSTRAINT `R_246` FOREIGN KEY (`IdTipoServico`) REFERENCES `tipo_servico` (`IdTipoServico`),
  CONSTRAINT `R_249` FOREIGN KEY (`IdSetor`, `IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `setor` (`IdSetor`, `IdLocal`, `IdCliente`, `IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto_servico`
--

LOCK TABLES `posto_servico` WRITE;
/*!40000 ALTER TABLE `posto_servico` DISABLE KEYS */;
INSERT INTO `posto_servico` VALUES (1,'Ambulância','(11) 2014-2014',NULL,'José João da Silva','(21) 92014-2014','kobel@kobel.com.br','-22.913885','-43.2304856',1,2,4,4,3,1),(2,'Bombeiro','(11) 2014-2014',NULL,'José João da Silva','(21) 92014-2014','kobel@kobel.com.br','-22.911724','-43.231047',4,2,4,4,3,1),(3,'Policia Militar','(11) 2014-2014',NULL,'José João da Silva','(21) 92014-2014','kobel@kobel.com.br','-22.913303','-43.228855',2,2,4,4,3,1);
/*!40000 ALTER TABLE `posto_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimento`
--

DROP TABLE IF EXISTS `procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimento` (
  `IdProcedimento` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoProcedimento` varchar(300) NOT NULL,
  `NomeProcedimento` varchar(300) NOT NULL,
  `Mandatorio` tinyint(4) NOT NULL,
  `IdProcedimentoAuxiliar` int(11) DEFAULT NULL,
  `TempoExecEstimado` int(11) NOT NULL,
  `TempoTolerInicio` int(11) NOT NULL,
  `TempoTolerFim` int(11) NOT NULL,
  `CampoCheck` tinyint(4) DEFAULT NULL,
  `IdFormulario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProcedimento`),
  KEY `R_179` (`IdProcedimentoAuxiliar`),
  KEY `R_257` (`IdFormulario`),
  CONSTRAINT `R_179` FOREIGN KEY (`IdProcedimentoAuxiliar`) REFERENCES `procedimento` (`IdProcedimento`),
  CONSTRAINT `R_257` FOREIGN KEY (`IdFormulario`) REFERENCES `formulario` (`IdFormulario`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimento`
--

LOCK TABLES `procedimento` WRITE;
/*!40000 ALTER TABLE `procedimento` DISABLE KEYS */;
INSERT INTO `procedimento` VALUES (1,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações gerais)','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada (detalhamento e recomendações gerais)',0,NULL,10,5,5,0,NULL),(2,'Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF','Revista do turno de 12:00hs dos agentes de segurança privada (Stewards).  Biometria da DPF',0,NULL,60,5,5,0,NULL),(3,'Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)','Início do turno dos Agentes de Segurança Privada no posto previsto no MD (12 horas)',0,NULL,720,5,5,0,NULL),(4,'Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)','Início das atividades de segurança pública e Defesa (Conforme planejamento próprio das instituições)',0,NULL,10,5,5,0,NULL),(5,'Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)','Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',0,NULL,120,5,5,0,NULL),(6,'Término de entregas de mercadorias (6 horas antes do inicio do jogo)','Término de entregas de mercadorias (6 horas antes do inicio do jogo)',0,NULL,30,5,5,0,NULL),(7,'Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)','Início das atividades dos Postos de Verificação Veicular - PVVs (AF Transportes)',0,NULL,15,5,5,0,NULL),(8,'Ativação das Zonas de Credenciamento (Zonas 1 a 9)','Ativação das Zonas de Credenciamento (Zonas 1 a 9)',0,NULL,15,5,5,0,NULL),(9,'Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas','Reunião da GSS com os Coordenadores e Supervisores da empresa de segurança privada do turno de 08 horas',0,NULL,10,5,5,0,NULL),(10,'Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF','Revista do turno de 08:00h de segurança privada (Stewards). Biometria da DPF',0,NULL,60,5,5,0,NULL),(130,'Acionar polícia local por rádio','Acionar polícia local por rádio',1,131,0,0,0,0,NULL),(131,'Acionar polícia local pessoalmente','Acionar polícia local pessoalmente',0,151,0,0,0,0,NULL),(132,'Isolar a area','Isolar a area',1,133,0,0,0,0,NULL),(133,'Chamar reforços para isolar a area','Chamar reforços para isolar a area',0,151,0,0,0,0,NULL),(134,'Retirar as pessoas do local','Retirar as pessoas do local',1,135,0,0,0,0,NULL),(135,'Chamar reforços para retirar as pessoas do local','Chamar reforços para retirar as pessoas do local',0,151,0,0,0,0,NULL),(136,'Deter os envolvidos na briga','Deter os envolvidos na briga',1,137,0,0,0,0,NULL),(137,'Chamar a polícia para ajudar a deter os envolvidos na briga','Chamar a polícia para ajudar a deter os envolvidos na briga',0,151,0,0,0,0,NULL),(138,'Entregar detentos a polícia','Entregar detentos a polícia',0,151,0,0,0,0,NULL),(139,'Liberar a area após a detenção','Liberar a area após a detenção',1,151,0,0,0,0,NULL),(140,'Cadastrar envolvidos na Blacklist do Sistema','Cadastrar envolvidos na Blacklist do Sistema',0,141,0,0,0,0,NULL),(141,'Anotar dados dos envolvidos manualmente','Anotar dados dos envolvidos manualmente',0,151,0,0,0,0,NULL),(142,'Acionar Bombeiros e Ambulância por rádio','Acionar Bombeiros e Ambulância por rádio',1,143,0,0,0,0,NULL),(143,'Acionar Bombeiros e Ambulância pessoalmente','Acionar Bombeiros e Ambulância pessoalmente',0,151,0,0,0,0,NULL),(144,'Liberar area após serviço prestado','Liberar area após serviço prestado',1,151,0,0,0,0,NULL),(145,'Procedimento 1','Procedimento 1',1,146,0,0,0,0,NULL),(146,'Procedimento 1.1','Procedimento 1.1',0,151,0,0,0,0,NULL),(147,'Procedimento 2','Procedimento 2',1,148,0,0,0,0,NULL),(148,'Procedimento 2.2','Procedimento 2.2',0,151,0,0,0,0,NULL),(149,'Procedimento 3','Procedimento 3',1,150,0,0,0,0,NULL),(150,'Procedimento 3.3','Procedimento 3.3',0,151,0,0,0,0,NULL),(151,'Ligar para o seu superior imediato','Ligar para o seu superior imediato',0,NULL,0,0,0,0,NULL);
/*!40000 ALTER TABLE `procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamento`
--

DROP TABLE IF EXISTS `rastreamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastreamento` (
  `IdRastreamento` int(11) NOT NULL AUTO_INCREMENT,
  `DtHrInicioRastreamento` datetime DEFAULT NULL,
  `DtHrFimRastreamento` datetime DEFAULT NULL,
  `DtHrCadastro` datetime DEFAULT NULL,
  `Ativo` tinyint(4) DEFAULT NULL,
  `IdPessoa` int(11) DEFAULT NULL,
  `TempoRastreamento` int(11) DEFAULT NULL,
  `Rastreamento_por_Rota` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IdRastreamento`),
  KEY `R_261` (`IdPessoa`),
  CONSTRAINT `rastreamento_ibfk_1` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamento`
--

LOCK TABLES `rastreamento` WRITE;
/*!40000 ALTER TABLE `rastreamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreamento` ENABLE KEYS */;
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
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `IdRastreamento` int(11) NOT NULL,
  `IdPessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdRastrearOnLine`,`IdRastreamento`),
  KEY `R_260` (`IdRastreamento`),
  KEY `R_262` (`IdPessoa`),
  CONSTRAINT `rastrear_online_ibfk_1` FOREIGN KEY (`IdRastreamento`) REFERENCES `rastreamento` (`IdRastreamento`),
  CONSTRAINT `rastrear_online_ibfk_2` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastrear_online`
--

LOCK TABLES `rastrear_online` WRITE;
/*!40000 ALTER TABLE `rastrear_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastrear_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regeracaodesenha`
--

DROP TABLE IF EXISTS `regeracaodesenha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regeracaodesenha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashDeValidacacao` varchar(100) NOT NULL,
  `dataDoPedidoDeRegeracao` datetime DEFAULT NULL,
  `dataDaTentativaDeRegeracao` datetime DEFAULT NULL,
  `tentativaExpirada` int(11) DEFAULT NULL,
  `dataDaExpiracaoDaTentativa` datetime DEFAULT NULL,
  `regeracaoConcluida` int(11) DEFAULT NULL,
  `dataDaConclusaoDaRegeracao` datetime DEFAULT NULL,
  `IdPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regeracaodesenha`
--

LOCK TABLES `regeracaodesenha` WRITE;
/*!40000 ALTER TABLE `regeracaodesenha` DISABLE KEYS */;
/*!40000 ALTER TABLE `regeracaodesenha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmento`
--

DROP TABLE IF EXISTS `segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmento` (
  `IdSegmento` int(11) NOT NULL AUTO_INCREMENT,
  `NomeSegmento` varchar(50) NOT NULL,
  `DescricaoSegmento` varchar(50) DEFAULT NULL,
  `UrlBackground` varchar(100) DEFAULT NULL,
  `UrlLogotipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdSegmento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmento`
--

LOCK TABLES `segmento` WRITE;
/*!40000 ALTER TABLE `segmento` DISABLE KEYS */;
INSERT INTO `segmento` VALUES (1,'Administração','Administração Kobel','../images/background/logotipo.png','../images/cabecalho/logotipo.png'),(2,'Evento','Realização de Eventos','../images/background/Logo-event.png','../images/cabecalho/logo-event.png'),(3,'Condominio','Condominios Residenciais','../images/background/Logo-condo.png','../images/cabecalho/logo-condo.png'),(4,'Escola','Instituição de Ensino','../images/background/Logo-school.png','../images/cabecalho/logo-school.png'),(5,'Segurança','Empresas de Segurança',NULL,NULL),(6,'Shopping','Conjunto de lojas de compras',NULL,NULL),(7,'TI','Tecnologia da Informação',NULL,NULL),(8,'Banco','Bancos',NULL,NULL);
/*!40000 ALTER TABLE `segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setor` (
  `IdSetor` int(11) NOT NULL AUTO_INCREMENT,
  `NomeSetor` varchar(80) NOT NULL,
  `TelefoneSetor` varchar(20) DEFAULT NULL,
  `ResponsavelSetor` varchar(50) DEFAULT NULL,
  `TelefoneResponsavel` varchar(20) DEFAULT NULL,
  `CelularResponsavel` varchar(20) DEFAULT NULL,
  `EmailResponsavel` varchar(80) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `DistanciaLimite` int(11) DEFAULT NULL,
  `Observacao` varchar(200) DEFAULT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  `MapaSetor` mediumblob,
  PRIMARY KEY (`IdSetor`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_198` (`IdLocal`,`IdCliente`,`IdContratante`),
  CONSTRAINT `R_198` FOREIGN KEY (`IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `local` (`IdLocal`, `IdCliente`, `IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (1,'Escritório Kobel','(11) 4427-7554','Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br',NULL,NULL,10,NULL,3,3,3,NULL),(2,'Setor Maracanã – L0','(11) 2014-2014','José João da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,4,4,3,NULL),(3,'Setor Arena São Paulo','(11) 2014-2014','José João da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,5,4,3,NULL),(4,'Setor Mineirão','(11) 2014-2014','José João da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,6,4,3,NULL),(5,'Setor Rio Centro','(11) 2014-2014','José João da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,17,4,3,NULL),(6,'Setor Maracanã – L1','(11) 2014-2014','José João da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,4,4,3,NULL);
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `IdStatus` int(11) NOT NULL AUTO_INCREMENT,
  `NomeStatus` varchar(50) NOT NULL,
  `DescricaoStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Agendada','Com programação realizada'),(2,'Em Andamento','Já iniciada'),(3,'Aguardando Atendimento','Em aguardo Terceiros'),(4,'Pausada','Em aguardo'),(5,'Cancelada','Não será realizada'),(6,'Finalizada','Finalizou a execução'),(7,'Finalizada com ressalva','Finalizou a execução mas com alerta');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_pessoa`
--

DROP TABLE IF EXISTS `telefone_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone_pessoa` (
  `IdPessoa` int(11) NOT NULL,
  `IdTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `Telefone` varchar(20) NOT NULL,
  `DtCadastro` datetime NOT NULL,
  `IdTipoTelefone` int(11) NOT NULL,
  PRIMARY KEY (`IdTelefone`,`IdPessoa`),
  KEY `R_79` (`IdPessoa`),
  KEY `R_81` (`IdTipoTelefone`),
  CONSTRAINT `R_79` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`),
  CONSTRAINT `R_81` FOREIGN KEY (`IdTipoTelefone`) REFERENCES `tipo_telefone` (`IdTipoTelefone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_pessoa`
--

LOCK TABLES `telefone_pessoa` WRITE;
/*!40000 ALTER TABLE `telefone_pessoa` DISABLE KEYS */;
INSERT INTO `telefone_pessoa` VALUES (1,1,'(11) 99999-9999','2014-07-21 10:06:21',3),(2,2,'(11) 99171-7827','2014-07-21 10:06:21',3),(3,3,'(11) 98380-5892','2014-07-21 10:06:21',3),(4,4,'(11) 99153-0624','2014-07-21 10:06:21',3),(5,5,'(11) 98400-2667','2014-07-21 10:06:21',3),(6,6,'(11) 97351-6007','2014-07-21 10:06:21',3),(7,7,'(11) 99171-7827','2014-07-21 10:06:21',3),(8,8,'(11) 99171-7827','2014-07-21 10:06:21',3),(9,9,'(11) 98372-7140','2014-07-21 10:06:21',3);
/*!40000 ALTER TABLE `telefone_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_util`
--

DROP TABLE IF EXISTS `telefone_util`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone_util` (
  `IdTelefoneUtil` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTelefoneUtil` varchar(50) NOT NULL,
  `NrTelefoneUtil` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTelefoneUtil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_util`
--

LOCK TABLES `telefone_util` WRITE;
/*!40000 ALTER TABLE `telefone_util` DISABLE KEYS */;
INSERT INTO `telefone_util` VALUES (1,'BOMBEIROS','193'),(2,'DEFESA CIVIL','199'),(3,'POLICIA CIVIL','147'),(4,'POLICIA MILITAR','190'),(5,'PRONTO SOCORRO','192'),(6,'DISQUE DENÚNCIA','181'),(7,'POLICIA FEDERAL','194');
/*!40000 ALTER TABLE `telefone_util` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_endereco`
--

DROP TABLE IF EXISTS `tipo_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_endereco` (
  `IdTipoEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoEndereco` varchar(40) NOT NULL,
  `DescricaoTipoEndereco` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTipoEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_endereco`
--

LOCK TABLES `tipo_endereco` WRITE;
/*!40000 ALTER TABLE `tipo_endereco` DISABLE KEYS */;
INSERT INTO `tipo_endereco` VALUES (1,'Residencial','Residencial'),(2,'Comercial','Comercial');
/*!40000 ALTER TABLE `tipo_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_envio`
--

DROP TABLE IF EXISTS `tipo_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_envio` (
  `IdTipoEnvio` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoEnvio` varchar(50) NOT NULL,
  `DescricaoTipoEnvio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTipoEnvio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_envio`
--

LOCK TABLES `tipo_envio` WRITE;
/*!40000 ALTER TABLE `tipo_envio` DISABLE KEYS */;
INSERT INTO `tipo_envio` VALUES (1,'E-Mail','Mensagem por e-mail'),(2,'Push','Mensagem por push'),(3,'SMS','Mensagem por SMS');
/*!40000 ALTER TABLE `tipo_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_equipamento`
--

DROP TABLE IF EXISTS `tipo_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_equipamento` (
  `IdTipoEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoEquipamento` varchar(40) NOT NULL,
  `DescricaoTipoEquipamento` varchar(100) DEFAULT NULL,
  `IconeTipoEquipamento` blob,
  PRIMARY KEY (`IdTipoEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_equipamento`
--

LOCK TABLES `tipo_equipamento` WRITE;
/*!40000 ALTER TABLE `tipo_equipamento` DISABLE KEYS */;
INSERT INTO `tipo_equipamento` VALUES (1,'Câmera','Câmera de Segurança','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0}Jb\0\0.iCCPAdobe RGB (1998)\0\0x�c``2ptqre``��+)\nrwR���R`������ �`�`��\\\\���\0y�y���5F}Yd�<^��\\PT��\0�QJjq2���]^R\0g�d�$e��@좐 g ��͗a_�� �\' v�@���t0��l�-b��V��ep�/�,�L�(Q0200PpL�OJU�,.I�-V��K�/*�/J,IM���!\nA!�ahii�I��	P<@X����(v!�\0ɥEeP&#�1a>9�KX� �Lz�00�OE��20�30�\0ïPob�;�\0\0\0	pHYs\0\0\0\0��~�\0\0RIDATx��W	tT��ޛ�5��:�$!�M�D+B�(ԪU����i�r<�O[�V���Ӣui+�V�V�q!�\rK�NI&��2[f__��,������˼�w�����{�$	����˽���\"�?�UUH�j3�gΔ��%�vT��?�?>�؞�ﵴ�o�~��/Q`+�1n�e�q�{0ݱ�Ylժ��Xʃ �`��$v��I$�i,)�`��/���Hz#\\3�Hr���ҹ��ƃgΜ�R��S	��ztv�f�F�}�<�����[���K8x:��gN������N�=6w���ـ�~�q|�&�r6|��#�B�Yww�p�5�{]�y.��(��NL�Ż^y��6v	���ʥ�/{�79&��Z466����زU�i����[�h4p����[��֟\n�[�:�E�v�ps^�������X|�\'�,�IU1������\r�W@4�A:?\rs���e�Y������{N4ZS�8�NA�Ղ9뮀�=����q̲�ӧ�j+{d����R^����4&�p�T �M�w;��.�mW��)..�(*0�Y����K8��h4�m��}�	B��ɣ��}���\\�фҲ\n�[������D2��cL���-)WC^}��ХvR�4���l��M�;6ʃ)Z��l��#�����DQ֭[�z��u�BA�Q��������׃�>�:&��\Z�\\	4��0L8�Ӎ�\\�I���ĸ�t\Zz�)�$�Z��O>���x≿��{~m�y��fF�((,��`gΝ�ْ%�^q�S�I��Y<��%��)ϛh���$�J��:�qZ�N%a�e�u���57_��ԩ㰈V(�F )t�V��\'�\\Th�Kp�\"���Ռ��c;d�y��T*�v�ձx,�L&���ɂ�(ʕ@<��wNg��7a��?s���.�0�J�A0�EQ0cmm�fB�F��dN�2������G�9r$AϤ����<��B�P-X��wӪj���eM�hS�`���������|��?�>�c�\r�^�|�Ͽ5t�N�:�d2�B��X�N禫�-�t��E;;�}��K��q�XeeUa�;� ����d�r� �pFܘ�p�[����/���r�+ּO�R�����!<���PY�P�y\' ���\0��-u�[<�u��n�Qk�w��gI�\'��˥�Ē1�_����V��~EE9L��0�N�Ñ#��\Z�w�6��������#J`q�NEC�ѽ�QVS�����j))hC�\0k֏H$,g�\n�<�7�b�[:2r�$@�T��Z�T#g���(��ܹQ�X�!E�P�2*���ek��%�1U&��R�B\"��Z91uc}�X���p��c�cۡ��<�VY�S�i��4Zݥ�#N��w���GЯ ƝG��4ZT������R *���J���J��hu:C&�����zD�$���;a��aRy%\"�R@.��/�ˍ����?54\\qO�[�V#�{�l�&T�@�@��\"�N�D��Ru��~\r���Cݏ���pn���𗩤�E���\Z�)�	!��\rZ�0��l��]�ׂ�G�`��3f4��2gޣ�}=�lR�B��8lV2&F�/�o�D�i|}�J��ڋ7�z�C�1�ر#��-l�(���{d�\0e�����$�O��W$²�k��������~A����\\f/{i�얿��E\"S��Vƽ ?�\0ͳ�\0ǟ��C�訧�Kb\"/Pѥc�7���Kj�\Z��\nk\n���N����m����E=�&H~���ᬙ�fvK��R{�Q�x ���D\".o�<� \'\"�����N�:�+2��W|�U7���\\�����K�jn\\y<�8��Yo�.�Y~f�E�U�/���)��,Q�E+���_�bֵ�?�^<���n	��3��R�zͭ��]�����o���w��/+����_��%xR\\iER&:�,�s��Hrz�7̼j��W������o/�\'��/$��ش~���dR8|�C�8\"���ڲAo\"6��Da0�(�0���!�H�ԗE**A�Uq���R��p��i�,Vg����񕕕_�v�p:ko[�h�SS!N�8J��d�y�Bj��MUMv|�njk1?�\r�C׋}��e�*$\r�c�C�!�9K���/�$�|NR��y\\*��2�=�E�W3[�͵`��~�N�xs�����w�}3\Z�������t�7�e�\"���E���Lc1d�A\ZM�t�\"28@�*����璂�by#Ij�^B�(����`��\r[s�lI�`��e��ԣ�\Z��F�/a�J�̴����<~\'�{�p�tTۚ`�ӌ�D�axi���8\n�EH�&�\n,��T���2�8?��\r�&�\r8�y�xc�eDf��z]�>B����Hā*(Щ�|�~��hi����=x��;h8� A�n����*\Z�V�4��<�˘U�Q3���?�6��NS�l�+CϏA���D�`*��a0k�I8���C���>%��!�L�S��K�T�`i�M���\nq��?%b$K��Gh�@���4_������e啭�RGc� ������&$)�0�(@BiÈwEZ*��?����D\Z\Z�\ni�������~�����L�����௠9%��P\0%�v�(���\\\'���>2�;*�jԻ�T$�)�U G�)��FI1�*��\n����r���Q�b�dE(��~�9��&K4p����šSk�pL����j��jZ\"4�t��K���;z��{��+�t��5�F��u�nWD2��&IA(MV�dF)r����$�8��B��8���e���r��!?5/\\��()��V7�y��]sHq��F4>1~�toj���ܴj��N��o�K\n�O\0ʼ�ڸN&(�irG�|A�h�������������)rC��w�V��j�C��]>���/[q�oX�d�.���aG��ǅ��\"�d�d$~��ܠ��O�3+�d���2x�+8k����F�{�����ȧ����(�Y���O�84T8*n�pT�i���$&+T� 7!��x\"L��w��D������?�x�����e����Z��	�ڵKx�g,��~�ZZZ�t�\'c�\"#��09�Bԓ��*��,��:�ͦ}>_xphh�zE�*�����1�!�?J��m۶ͳiӦܥ��\r֥ٞͨat\0\0\0\0IEND�B`�'),(2,'Alarme','Central de Alarme',NULL),(3,'Catraca de Acesso','Cadatra de Acesso',NULL),(4,'Leitor de Digital','Leitor de Digital (biometria)',NULL);
/*!40000 ALTER TABLE `tipo_equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_logradouro`
--

DROP TABLE IF EXISTS `tipo_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_logradouro` (
  `IdTipoLogradouro` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoLogradouro` varchar(20) NOT NULL,
  `DescricaoTipoLogradouro` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`IdTipoLogradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_logradouro`
--

LOCK TABLES `tipo_logradouro` WRITE;
/*!40000 ALTER TABLE `tipo_logradouro` DISABLE KEYS */;
INSERT INTO `tipo_logradouro` VALUES (1,'Rua','Rua Comum'),(2,'Avenida','Rua de grande movimento'),(3,'Travessa','Travessa');
/*!40000 ALTER TABLE `tipo_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_mensagem`
--

DROP TABLE IF EXISTS `tipo_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_mensagem` (
  `IdTipoMsg` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoMsg` varchar(40) NOT NULL,
  `DescricaoTipoMsg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTipoMsg`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mensagem`
--

LOCK TABLES `tipo_mensagem` WRITE;
/*!40000 ALTER TABLE `tipo_mensagem` DISABLE KEYS */;
INSERT INTO `tipo_mensagem` VALUES (1,'Aviso','Mensagem de Aviso'),(2,'Alerta','Mensagem de Alerta');
/*!40000 ALTER TABLE `tipo_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ocorrencia`
--

DROP TABLE IF EXISTS `tipo_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_ocorrencia` (
  `IdTipoOcorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoOcorrencia` varchar(50) NOT NULL,
  `DescricaoTipoOcorrencia` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdTipoOcorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ocorrencia`
--

LOCK TABLES `tipo_ocorrencia` WRITE;
/*!40000 ALTER TABLE `tipo_ocorrencia` DISABLE KEYS */;
INSERT INTO `tipo_ocorrencia` VALUES (1,'Anomalia','Algo Anormal'),(2,'Incidencia','Algo Inesperado'),(3,'Emergencia','Algo Urgente');
/*!40000 ALTER TABLE `tipo_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pessoa`
--

DROP TABLE IF EXISTS `tipo_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pessoa` (
  `IdTipoPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTipoPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pessoa`
--

LOCK TABLES `tipo_pessoa` WRITE;
/*!40000 ALTER TABLE `tipo_pessoa` DISABLE KEYS */;
INSERT INTO `tipo_pessoa` VALUES (1,'Pessoa Física'),(2,'Pessoa Jurídica');
/*!40000 ALTER TABLE `tipo_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servico`
--

DROP TABLE IF EXISTS `tipo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servico` (
  `IdTipoServico` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoServico` varchar(40) NOT NULL,
  `DescricaoTipoServico` varchar(40) DEFAULT NULL,
  `IconeTipoServico` blob,
  PRIMARY KEY (`IdTipoServico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servico`
--

LOCK TABLES `tipo_servico` WRITE;
/*!40000 ALTER TABLE `tipo_servico` DISABLE KEYS */;
INSERT INTO `tipo_servico` VALUES (1,'Ambulância','Ambulância','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0}Jb\0\0\n7iCCPsRGB IEC61966-2.1\0\0x���wTS��Ͻ7�P����khRH\r�H�.*1	J��\0\"6DTpDQ��2(���C��\"��Q��D�qp�Id�߼y�͛��~k����g�}ֺ\0����LX	��X��ň��g`�\0l\0�p��B�F�|،l���� ��*�?��\0����Y\"1\0P������\\�8=W�%�Oɘ�4M�0J�\"Y�2V�s�,[|��e9�2�<�s��e���\'�9���`���2�&c�tI�@�o�|N6\0(��.�sSdl-c�(2�-�y\0�H�_��/X������Z.$��&\\S�������M���07�#�1ؙY�r\0f��Yym�\";�8980m-m�(�]����v�^��D���W~�\r\0��e����mi\0]�P����`/\0���u}q�|^R��,g+���\\K�k)/����C_|�R����ax�8�t1C^7nfz�D����p�柇��u�$��/�ED˦L L��[���B�@�������ٹ����ЖX�!\Z@~\0(* 	{d+��}�G�͋љ���ς�}W�L��$�cGD2�Q���Z4 \0E@�@�����\0�A(�q`1���D ������`\'�u�4�6pt�c�48.��`�R0��)�\n�@���R�t C���X��CP�%CBH@�R����f�[�(t\Z�\0\rC��Qh�z#0	��Z�l�`O8�����28.����p|�O×�X\n?���:��0�FB�x$	!���i@ڐ���H���[EE1PL���⢖�V�6��QP��>�U�(j\n�MFk�����\0t,:��.FW������8���c�1�L&���ӎ9�ƌa��X�:��\r�r�bl1�\n{{{;�}�#�tp�8_\\<N�+�U�Zp\'pWp���������e�F|~?��!(�	��HB*a-���F8K�KxA$��N�p����XI<D<O%�%QHf$6)�$!m!�\'�\"�\"� ��Fdr<YL�Bn&�!�\'�Q�*X*(�V+�(t*\\Qx��W4T�T\\���X�xDqH�^�H���QZ�T�tT�Ҵ2U�F9T9Cy�r���G,ň�C�Q�(�(g(cT��OeS��u�F�Y�8\rC3��Ri��oh��)���J�J�J��q)�����2�a�u�;U-UOU��&�6�+����y���J���F�ީ3�}��Է�w���@i�i�k�j��8��tm��9���ք5�4#4Wh��М������Ҫ�:��T�����C����U�MG��C��c�\nÓ�Ψd�1�t5u�u%�����3z�zQz�z�z��	�,�$����S:!��\r�,��]�������b�6u=2V30�7n5�kB6q7Yf�`r�c�2M3�mz�6�7K1�12����͇-�NB��Lӓ��le�Z�-�--�,�YX�[m���hmo�n�h}ǆbhSh�c󫭙-׶���\\�\\߹��v�}ngnǷ�cwӞjb���������ȡ�a���1ѱ����\ncmf�wB;y9�v:�����Y�|���K�K�ˣy����\Z獹�r\\�]�n�D��nRw]w�{��}�G�Ǆ��g��A�g^�^\"���lg�J�)o��ϻ�{Ї��S�s�W�7ٷ�w���o��)���6�Z܀怩@����}A��A�A�͂E�=!pH`�����\r��w��Ѐ���Ö�}�	�	aQѿ��`ɂ��\"�\"�\"�D�DI�z�����_�xǔ�Hc�bW�^�ӈ�u�c����,ܹp<�>�8��\"�Ey�.,�X�����%�%Gщ1�-��9����Ҁ��K��l�.��oo���/�O$�&�\'=JvMޞ<��R��T�T����֥�NM۟�)=&�=���qTH�	�2�3�2��̳���˜��\\6%\n5eCً���4��Ԁ�D�^2��S��&7:�H�r�0o`���M�\'�}�^�Z�]�[�[��`t����UЪ��zW�.Z=��ó���ik(�.,/|�.f]O�Vњ���~�[��E�76�l�ۈ�(�8�iMKx%K�K+J�o�n����W�_}ڒ�e�̡l�V�V����ܷ(W.�/���scGɎ�;��PaWQ���K�KZ\\�]eP���}uJ�H�WM{�f��׻y������V�UWZ�n�`��z������}�}9�6F7�����I�����~�~遈}͎��-�-e�p��u�`����x���l�o����$������A�{����}g�]m����\\�9Օ�%��>\Zx��ǥ��{����=Vs\\�x�	��N柜>�u�����c�Kz=s�/�o�l����|ϝ���?y������^d]��p�s�~���:;���/;]��7|����W����p�������Q�o�H�!�ɻ��V���sn��Ys}��ҽ����~4��]� =>�=:�`��;cܱ\'?e��~��!�ań�D�#�G�&}\'/?^�x�I֓���?+�\\����w�x�20;5�\\��ӯ�_������e�t���W�f^��Qs�-�m���w3���+?�~����O�~�����pf*\0\0\0	pHYs\0\0C�\0\0C��P`\0\0�IDATx��W	L��3�)��2�C�eD[$AͲŵ�/<�U4P��V7iTTDI��>0��)�z�F[4�1�\n�\\�Bf�����ߙ�.M�_���]������zT���U�V]�q��FJt�Q\\�a<���QOKAB�����\0�������ꖖ)7��B1���>.W(>�3�iii9�E�6�\">>�������y�-����p�R	����������֏���<���]�ʤ8y��>�\'�����z���I&O����`nO�P�a������J�������y[[���ŕ+WΜ9��V���v��MJJ*7c����:t(oäI?q���o޼9���iӚ{zz�����J����Y�d��������Ӟg�����d���S�N�Ǐ�:C.s#}�#�RS�s�LH���w�ȑ�t2&����#\"\"^2�؄J����f����������߿z�*���ٔ+�������W��ŋ0�8��FGG�ׯ?}���-]]]��jW�V��A��ťsJ_�L0�a݅�=~�x����1b24�h К�=��3�[�����*Þur\Z��NJ��1�={6��Y��$����Nk��\n�/hQQQ���K���W�e��\Z�t�A��<�̙3GFu����ϡ@�Ν;�r���}N>|�3��t\\�ܻwo��ŋ����l��+V��۰ܴS�Nm�J�5��֦�&����_eee��ر�ʁ��jʹ=88�r��ˍ�������a�s��}v���Tخ�x=5E��y�Ν5֔��PUUYVV�΂L�}���TD�ߘP�e󻱱�Snnno���i`������WhpN=�r��v���z���]�{��Z�����X������p*J�.]Z�s�� ��)�܊�aG*664�k��{���.11��*�J7XU%%��2����uڕ���xuMM�\\\Z^�\rZ��6�[;{��,h&Lh�-}���|�g�?�Z[�~��Z}�#��;��ӄ��ƋH$\\[,���V�t���E�5��\'�H���]��ڒ�������{333��A���\0\\�zuuzz�5�����\Z�DA�\n1���Mc�7�#|����-��DE�4�,�����7644,�#�̟?�f*��K����M���*JKKWmذ��4��)���YX�KHH������4M�2e�|-��s]]]����=����[���jmEC�R	���!@�mۊ>)�H�K�,y�>t����GLLL�7o|`-�CCC�m\n\0��D\n��8���]]���o��C(����@$r��U�=J`�M�6}��A�L&�-�Oa\"@nnn�c�2!i�X,�P�����V�;�ŋ��?�����s綤����8q���K�.maY�Nm���ϟX���:��������Zpc����ׇ�]QQg�\\&AD/%�Z������������D ���$�̛W�<>�|�Wr�U��.����?\Z��ړ�o�-�4\ZJ��?�:7:�o\"�WK$�n\nuH��������2��U�?�0�K�Fkk�EP�z�ƍ�(>f���wp3�rq��+@T#n�\'�\\y<5qv�!ZF8J���\'O�H��466�z���\'PZ�!3Z hId�s�B�Cw�y�Ѥ�3�H�E�����MWF�wX�z����ѿDN#�Ob�p�NNN���A��}�	�{��o������EU���Sh���w�6��u�a�R͡Ѱ�ƺ��������oP�oG$\\�`Į�4����i(�c��.d�K���ݹ���������+>Z^^�ŭ[���/�x�j2�=<�玚��ى���ӳ��\n�\nD�6kt���ヴ�Eqqq\n�N��������g�9�\n��H$R�@8�>�������߁t��E��)�H.ϗ-[v��־}�\n��s�a�7��r]ZK\r}\0\0\0\0IEND�B`�'),(2,'Polícia Militar','Polícia Militar','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0\0\0wō�\0\0\n7iCCPsRGB IEC61966-2.1\0\0x���wTS��Ͻ7�P����khRH\r�H�.*1	J��\0\"6DTpDQ��2(���C��\"��Q��D�qp�Id�߼y�͛��~k����g�}ֺ\0����LX	��X��ň��g`�\0l\0�p��B�F�|،l���� ��*�?��\0����Y\"1\0P������\\�8=W�%�Oɘ�4M�0J�\"Y�2V�s�,[|��e9�2�<�s��e���\'�9���`���2�&c�tI�@�o�|N6\0(��.�sSdl-c�(2�-�y\0�H�_��/X������Z.$��&\\S�������M���07�#�1ؙY�r\0f��Yym�\";�8980m-m�(�]����v�^��D���W~�\r\0��e����mi\0]�P����`/\0���u}q�|^R��,g+���\\K�k)/����C_|�R����ax�8�t1C^7nfz�D����p�柇��u�$��/�ED˦L L��[���B�@�������ٹ����ЖX�!\Z@~\0(* 	{d+��}�G�͋љ���ς�}W�L��$�cGD2�Q���Z4 \0E@�@�����\0�A(�q`1���D ������`\'�u�4�6pt�c�48.��`�R0��)�\n�@���R�t C���X��CP�%CBH@�R����f�[�(t\Z�\0\rC��Qh�z#0	��Z�l�`O8�����28.����p|�O×�X\n?���:��0�FB�x$	!���i@ڐ���H���[EE1PL���⢖�V�6��QP��>�U�(j\n�MFk�����\0t,:��.FW������8���c�1�L&���ӎ9�ƌa��X�:��\r�r�bl1�\n{{{;�}�#�tp�8_\\<N�+�U�Zp\'pWp���������e�F|~?��!(�	��HB*a-���F8K�KxA$��N�p����XI<D<O%�%QHf$6)�$!m!�\'�\"�\"� ��Fdr<YL�Bn&�!�\'�Q�*X*(�V+�(t*\\Qx��W4T�T\\���X�xDqH�^�H���QZ�T�tT�Ҵ2U�F9T9Cy�r���G,ň�C�Q�(�(g(cT��OeS��u�F�Y�8\rC3��Ri��oh��)���J�J�J��q)�����2�a�u�;U-UOU��&�6�+����y���J���F�ީ3�}��Է�w���@i�i�k�j��8��tm��9���ք5�4#4Wh��М������Ҫ�:��T�����C����U�MG��C��c�\nÓ�Ψd�1�t5u�u%�����3z�zQz�z�z��	�,�$����S:!��\r�,��]�������b�6u=2V30�7n5�kB6q7Yf�`r�c�2M3�mz�6�7K1�12����͇-�NB��Lӓ��le�Z�-�--�,�YX�[m���hmo�n�h}ǆbhSh�c󫭙-׶���\\�\\߹��v�}ngnǷ�cwӞjb���������ȡ�a���1ѱ����\ncmf�wB;y9�v:�����Y�|���K�K�ˣy����\Z獹�r\\�]�n�D��nRw]w�{��}�G�Ǆ��g��A�g^�^\"���lg�J�)o��ϻ�{Ї��S�s�W�7ٷ�w���o��)���6�Z܀怩@����}A��A�A�͂E�=!pH`�����\r��w��Ѐ���Ö�}�	�	aQѿ��`ɂ��\"�\"�\"�D�DI�z�����_�xǔ�Hc�bW�^�ӈ�u�c����,ܹp<�>�8��\"�Ey�.,�X�����%�%Gщ1�-��9����Ҁ��K��l�.��oo���/�O$�&�\'=JvMޞ<��R��T�T����֥�NM۟�)=&�=���qTH�	�2�3�2��̳���˜��\\6%\n5eCً���4��Ԁ�D�^2��S��&7:�H�r�0o`���M�\'�}�^�Z�]�[�[��`t����UЪ��zW�.Z=��ó���ik(�.,/|�.f]O�Vњ���~�[��E�76�l�ۈ�(�8�iMKx%K�K+J�o�n����W�_}ڒ�e�̡l�V�V����ܷ(W.�/���scGɎ�;��PaWQ���K�KZ\\�]eP���}uJ�H�WM{�f��׻y������V�UWZ�n�`��z������}�}9�6F7�����I�����~�~遈}͎��-�-e�p��u�`����x���l�o����$������A�{����}g�]m����\\�9Օ�%��>\Zx��ǥ��{����=Vs\\�x�	��N柜>�u�����c�Kz=s�/�o�l����|ϝ���?y������^d]��p�s�~���:;���/;]��7|����W����p�������Q�o�H�!�ɻ��V���sn��Ys}��ҽ����~4��]� =>�=:�`��;cܱ\'?e��~��!�ań�D�#�G�&}\'/?^�x�I֓���?+�\\����w�x�20;5�\\��ӯ�_������e�t���W�f^��Qs�-�m���w3���+?�~����O�~�����pf*\0\0\0	pHYs\0\0\0\0��~�\0\0	IDATx��V	tT���̛%��HV��Ę 6U�}A�hiR{����c�D{j�j�jEm�Zh�k]�ǖE�\n\"A@�b��$�d���f��[����qp��s��y�����˽,\0�T\"mf����E}�^��U��ׯ?}�*|_`\"bb�]̨���=�\'���w)��lý/�����f���~{�v�ϯ.��tYY�]�;��e�v�:��F�r+�ރ�S��WU��	W�S���5����Hw~���`�+]w�us��3n�\'/�\r׌%�޿в���s���S��~�o�T&\\0+y�����#�E�ە���h���ư�q�}x����>\"�n�}(z�#��>yc�\'�y�UT�� �cX�X�ֽ�)�E���C�4��l��ZWo�l�����hZ�\'���Ĵ�n�����7��dd��s�9�^�=�QS\Zy$_Zar��-��XB��\\���,��������{?�+���nd�c�؁���U�MMӊL�9�����	_/6<�\0��n�v�󥿮e^J%�4�����y�4�Y��Tk[i����v$G�py�Y�N\Z�)�\0�2���������5��_�.����d��^yS��&p�2p���jgm�@���B�������[��x���as^�H���C(.1@�-H��p�^ek�gSܒ�quك��.3n=w����۷b���0�q9\Z\'�\"�q$�Ap!7]ې��{6��1�d���������{M�q0W�s����<5�s�>[5+rLg�ڳ�nAE13e��符s�,����[�|Y?[.����Y��\Z��5�3��6�ı~u7����\\��256%+���=\'���}�!6?*F���qDM�	8Klh�ԣ��� ���|��K���I�v�E\"2�47.����p����G}(>[N�\'�}aI�ޮ���`����L�:\rQŉB�O���t����������)�ؗ�ˌ�\'N������ۘ�o��/�;�ܻ�����.kv\0��a���C���~�����U��w7]�:�{��\r�Y7����0���lGWo�\\�!	��+������áQwnu���x|b/�(=A�4�c ��w����d63�(�����wl��T<@�� �:��(�U(���� g�$�j�\\�A��j�y�=�ɜ�]�֓�!�\\�W>������\\�T4\rW]7|=m0[���zO������\'�b2\"�_}؂�������\0j\Z.Aiu-�@J*���n�32���z��\"m�*a��aS��h��En�cEOP=���όR��V\ZQ��o�k�����y��������F��PO)���\'P����֮0v���@��3�Ө�n��&eހBEԞU���:��N�ص���[�>i\r�R�P�|\\�g�/{�y���g�7޹\\�3!��?τg н|�ќzf�/�^Q�`7��ʎ93�c��q�{I^s��愠��1��\"ʹ��A�i���uS��|j�k��ZF����EG,Ы�j�ׇL:!����,O��AY;w�J�I/��΍���++�\\�,�1��p�[Z��m�\rw����uԀ1ѥL�C���Ad�?�	�4�S�!��P�*׌�iVT��yK\n���$ҩ��d����E;�E��\"#�u�P���`����C�WP��bV9\r9k����7�p�\\:\r�ݱ��@˳�����~�6U��,��I��\0{E,5��JyU���ҵ1�2���\Z�«�w�g^!��^=y��G�\\_�����~$�X��HpT�O��t��K�(����� 2�\r��\0�yN�xQ@��,2���3,�����w�?��;��k58濶aɆ�oX�m�I&RC���+\n�*�%CW��M2��r��z��*�0h9@k�x&���w��x���=wZj�\rc���y������d��5��������(�93(�1�!3�� J������y��Z�����ޓqz_̻X}���x��V��x�h)�Qc��^�Q�ŌL�C�j����H�h��S�;`7�LO}�bV����\ZrZM�v�&� ���Jf�+�]�b��t�#a�^VK�Ƒ$���?���r	m[����=@��A�V��`\Z�*AY�4����\'�nDu��.&��}�R�)e�k��P��ҥ��V��_7	s\'��b�=��`QG�J[��jۋ\\����5�l$������!Ifts6\Z���ˏ]C8,���bLٟ���d�O��8I�_[�m�܋*���,L`?E��>;$Er<c��/�B�Fcj��i�ح�<��lM�l�?�~��9M3,\0\0\0\0IEND�B`�'),(3,'Segurança Privada','Ambulância',NULL),(4,'Bombeiro','Bombeiro','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\"\0\0\0 \0\0\0��_\0\0\n7iCCPsRGB IEC61966-2.1\0\0x���wTS��Ͻ7�P����khRH\r�H�.*1	J��\0\"6DTpDQ��2(���C��\"��Q��D�qp�Id�߼y�͛��~k����g�}ֺ\0����LX	��X��ň��g`�\0l\0�p��B�F�|،l���� ��*�?��\0����Y\"1\0P������\\�8=W�%�Oɘ�4M�0J�\"Y�2V�s�,[|��e9�2�<�s��e���\'�9���`���2�&c�tI�@�o�|N6\0(��.�sSdl-c�(2�-�y\0�H�_��/X������Z.$��&\\S�������M���07�#�1ؙY�r\0f��Yym�\";�8980m-m�(�]����v�^��D���W~�\r\0��e����mi\0]�P����`/\0���u}q�|^R��,g+���\\K�k)/����C_|�R����ax�8�t1C^7nfz�D����p�柇��u�$��/�ED˦L L��[���B�@�������ٹ����ЖX�!\Z@~\0(* 	{d+��}�G�͋љ���ς�}W�L��$�cGD2�Q���Z4 \0E@�@�����\0�A(�q`1���D ������`\'�u�4�6pt�c�48.��`�R0��)�\n�@���R�t C���X��CP�%CBH@�R����f�[�(t\Z�\0\rC��Qh�z#0	��Z�l�`O8�����28.����p|�O×�X\n?���:��0�FB�x$	!���i@ڐ���H���[EE1PL���⢖�V�6��QP��>�U�(j\n�MFk�����\0t,:��.FW������8���c�1�L&���ӎ9�ƌa��X�:��\r�r�bl1�\n{{{;�}�#�tp�8_\\<N�+�U�Zp\'pWp���������e�F|~?��!(�	��HB*a-���F8K�KxA$��N�p����XI<D<O%�%QHf$6)�$!m!�\'�\"�\"� ��Fdr<YL�Bn&�!�\'�Q�*X*(�V+�(t*\\Qx��W4T�T\\���X�xDqH�^�H���QZ�T�tT�Ҵ2U�F9T9Cy�r���G,ň�C�Q�(�(g(cT��OeS��u�F�Y�8\rC3��Ri��oh��)���J�J�J��q)�����2�a�u�;U-UOU��&�6�+����y���J���F�ީ3�}��Է�w���@i�i�k�j��8��tm��9���ք5�4#4Wh��М������Ҫ�:��T�����C����U�MG��C��c�\nÓ�Ψd�1�t5u�u%�����3z�zQz�z�z��	�,�$����S:!��\r�,��]�������b�6u=2V30�7n5�kB6q7Yf�`r�c�2M3�mz�6�7K1�12����͇-�NB��Lӓ��le�Z�-�--�,�YX�[m���hmo�n�h}ǆbhSh�c󫭙-׶���\\�\\߹��v�}ngnǷ�cwӞjb���������ȡ�a���1ѱ����\ncmf�wB;y9�v:�����Y�|���K�K�ˣy����\Z獹�r\\�]�n�D��nRw]w�{��}�G�Ǆ��g��A�g^�^\"���lg�J�)o��ϻ�{Ї��S�s�W�7ٷ�w���o��)���6�Z܀怩@����}A��A�A�͂E�=!pH`�����\r��w��Ѐ���Ö�}�	�	aQѿ��`ɂ��\"�\"�\"�D�DI�z�����_�xǔ�Hc�bW�^�ӈ�u�c����,ܹp<�>�8��\"�Ey�.,�X�����%�%Gщ1�-��9����Ҁ��K��l�.��oo���/�O$�&�\'=JvMޞ<��R��T�T����֥�NM۟�)=&�=���qTH�	�2�3�2��̳���˜��\\6%\n5eCً���4��Ԁ�D�^2��S��&7:�H�r�0o`���M�\'�}�^�Z�]�[�[��`t����UЪ��zW�.Z=��ó���ik(�.,/|�.f]O�Vњ���~�[��E�76�l�ۈ�(�8�iMKx%K�K+J�o�n����W�_}ڒ�e�̡l�V�V����ܷ(W.�/���scGɎ�;��PaWQ���K�KZ\\�]eP���}uJ�H�WM{�f��׻y������V�UWZ�n�`��z������}�}9�6F7�����I�����~�~遈}͎��-�-e�p��u�`����x���l�o����$������A�{����}g�]m����\\�9Օ�%��>\Zx��ǥ��{����=Vs\\�x�	��N柜>�u�����c�Kz=s�/�o�l����|ϝ���?y������^d]��p�s�~���:;���/;]��7|����W����p�������Q�o�H�!�ɻ��V���sn��Ys}��ҽ����~4��]� =>�=:�`��;cܱ\'?e��~��!�ań�D�#�G�&}\'/?^�x�I֓���?+�\\����w�x�20;5�\\��ӯ�_������e�t���W�f^��Qs�-�m���w3���+?�~����O�~�����pf*\0\0\0	pHYs\0\0\0\0�&�?\0\0�IDATx��WT��fvv�M��t$�Ƴ�k�	��#�b����X�%�[D%ς�bD�QP4��\"R�(eiK���ߝ%xL�;�3;��?����w�$��q]8}��*iA4S����x������/[6E&��+0�����m���5�7�����^�軯�~�	���a�3\nM3ʸe$���ܼ��!�d�Ov�\Z^�jh�� �1H�����������\r\r\Z��m��A띛�W��3���i\'8�6Zc$��^n�%w~��R��s��0s����<�����1\"3R�ESl1lW>^��B�8��\0����&�yv@��҄��[C�z�u^?�\n��2���~�S�qE�ѥ��O=�\'���ۋ՚�9���h���x�����_+̈́-K\"�&�S?B�Sb`��V�7^��5\'�A�\0W�¶	�&,@��Q~��?5���D�V�1�\'g8�iQ��\\J�-���bu5*�� ��/���S�)*F�K?FJ�r�6f�e\"Z�e�>X���6y�+��2y{{��x�(x�\"Xw[��fJ�]�x�N�[��逳	n�I�<�e/\0�>@U�!���x�������g�����ѯ���\r�x����$���	�m���LK�ږ�b�yE\\�!���L.�Sr��V5��\"�L��b�\Z6�b��7�b��Ô��p�Xs3���L���\r\'�?+&)rJ{Nd^֬y�y!�G���&U���MD��T�\0�/Hu����!)3��F&���� &���Q7�����y�g���㗨(����\\=�igtf�REȽ|%5��e���)��d����P����hpN��<����H���Q�x��]x]瓠�=����)\r�\ZQY��J����5*{�A%�o�@���b3�M�N���o����mt���t��a�G�=��x���7���,����j�B]�5,kyC��??���t���y\"Q���C\"M7�>y�,�����F�J7��mr��O�����»��39 ��$1Nҧ�\Z��Yk���N��ƺ�p�ݻl���=�~<�&;>�$6���P���,�\"��GPh��{=157&����c����_���uǔ�Lf��-J�Hek׃��Ja�@�T�1���Q����&����C�c�链;T-_����W:&g�Ĉ��\0��DZ������\r;dlF�x����w�L�w:V�:�Qq�D���}T�P*�Qƶ�?,�TW���n	.�(1)���e�Ғ��XS#�%�-B��A���5\n٧�����F5M��B�!jS�k�����r�&�F^��Վ�� Fd3��ve�֝���À�OZ\r�w_.���0���2�8f���#�{��2-���;ʤ���@&p�L�k-\r�\"T�}��ߦz�y��O�_�<�SB{��-��C\"��v�u=Yu��(�j��e\'���8hCB��J�}d<n��������-m/�fa����&Q\\\r��9� .ݧN���.p�9��[Y��솾7��4������K�|R��T��olLW����meǏ�U�E���P�٧�J�	²�m��i�P����a�W�#(������/�F~�p|��|��5](�vE�JM��B��p�0Bܑ�\\!�/,Z�]�}�V���C���ǌ��Ǩ}\0��n㇣b�V�_�\n�e���`@	��쐌��w��C�|������_~}�̷b�\n�G���ec��%�r-IւEG�����U�;wmﲊ�����n޳8t}XƵ�O-ٍ�������9�Q����b��3t�\'�Y����&-�X΅��޷G9\r$�P��A�\n��	h��L����Q&s���������VǙw;��כ;�=�{��]-r��ٛ\"k�V׋*^L���=�i��������@B�t>��C�������U���x]e�qν�>yU�Fy��0�ß�\',SV���?��aQh�o9�H����_�����Ƀ���*�#y�����9���Y�I��Jʛ������7��7J����څW�H\n8|4HU]���\"6�νK?^��x$�Z����\"}���%�^�,��K\"鷭��E�\0���г�G�a;*Rհ/�@�P�(\0���\ni�{Sk$\0\n�X�>�{g6��8a�WS/��)����ƍζ>r�Xtu��&���d:%ʴ\"�Tj(ёS���N�#�0C��!v�0�<��+UT��9n���1\nC�#�\\\n˙�3d�W�����;y���\Z$�\r�o�x�X40Թ��%!�H\n|�����H��\"1���#�����u`�{=yL��¼H����;���\Z�h�@9�����1D\n��]�G�,~߇�b�����9��t(��+B�N����jL���\Z��2�\\�}�(��hP�-�V_�w�4\n��E^�&�cc���^�GՊ��tu���-�Ä���DJ*��܅�nnކ�\n���H1�k�qNц��<�jh��cd��l8�^��ˇ�B�2�U��Hʧ�4)�ˀaW�\Z+Fs0,}\0�3I�����w�����^���x#�ɺB��lSЗ���PjP�����~n��e�@�,�G����\\X���Qs	b�܃_3�6���z�^��\\O㖑�(=��m�L����fyu	mm�hܴh�u�x\Z{h�c�=�%�5�x��6<���cA(�X&�8;��G@](�kP\Z��a>�>�?�E���u՛�>��?�?�7S���LB��Iꃚn�(:�g!�\nȇ&D�/�E��Gx� ���`���K���&Yp��;Te������<\rk�T���RG2�ߗ�e|�n� �~v��^�n�\\7NN�i��y�,��Ю7f<�o���h�zrP֢�a\r�=Q[\\�VzWmMc��W0{V��Eh\"$�Р;��6fT��J���m�f����O�]����]���y\\������o��ul�onn�6���{���{�\n�,I��kנ7o1<����ѡ����&A-�i����\"��Y�0�҄�+3ˮǵH��xu}�0�,�,�.9�k�LHuO_κ^\"U����9��|l�}���I����X����z�\0���5�N4�@���£g%g�ύ��+{Gv�M�����nҳ稑�y^;��h���c��2��m`�z�\rAB����	5���T����[��I��޷)�cP���ʭg���#��]��R�w)�ff��t��9�o��cǍ��?e�\\6FV��=46\Zqz�������P��b܍7�^�ꌡ�����_�ꎅ\r�t�\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `tipo_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefone` (
  `IdTipoTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipoTelefone` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTipoTelefone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
-- Table structure for table `topico`
--

DROP TABLE IF EXISTS `topico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topico` (
  `IdFormulario` int(11) NOT NULL,
  `TituloTopico` varchar(50) NOT NULL,
  `IdTopico` int(11) NOT NULL AUTO_INCREMENT,
  `SequenciaTopico` int(11) NOT NULL,
  PRIMARY KEY (`IdTopico`,`IdFormulario`),
  KEY `R_191` (`IdFormulario`),
  CONSTRAINT `R_191` FOREIGN KEY (`IdFormulario`) REFERENCES `formulario` (`IdFormulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `IdTurno` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoTurno` varchar(50) NOT NULL,
  `CargaHoraria` int(11) NOT NULL,
  `HrInicioTurno` int(11) NOT NULL,
  `HrFimTurno` int(11) NOT NULL,
  `Observacao` varchar(100) DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdLocal` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdContratante` int(11) NOT NULL,
  PRIMARY KEY (`IdTurno`,`IdLocal`,`IdCliente`,`IdContratante`),
  KEY `R_197` (`IdLocal`,`IdCliente`,`IdContratante`),
  CONSTRAINT `R_197` FOREIGN KEY (`IdLocal`, `IdCliente`, `IdContratante`) REFERENCES `local` (`IdLocal`, `IdCliente`, `IdContratante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `NomeUsuario` varchar(50) NOT NULL,
  `SenhaUsuario` varchar(256) NOT NULL,
  `EmailUsuario` varchar(80) NOT NULL,
  `DtUltimoLogin` datetime DEFAULT NULL,
  `UltimoIP` varchar(20) DEFAULT NULL,
  `DtPrimeiroAcesso` datetime DEFAULT NULL,
  `NrTentativasLogin` int(11) NOT NULL,
  `UsuarioBloqueado` tinyint(4) DEFAULT NULL,
  `DtValidadeSenha` datetime DEFAULT NULL,
  `DtValidadeConta` datetime DEFAULT NULL,
  `Permissao` varchar(20) NOT NULL,
  `IdPessoa` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `IdPerfil` int(11) DEFAULT NULL,
  `IdContratante` int(11) NOT NULL,
  `ResetarSenha` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IdPessoa`,`IdContratante`),
  UNIQUE KEY `XAK1USUÁRIO_FUNCIONARIO` (`EmailUsuario`),
  KEY `R_178` (`IdPerfil`),
  CONSTRAINT `R_171` FOREIGN KEY (`IdPessoa`, `IdContratante`) REFERENCES `funcionario` (`IdPessoa`, `IdContratante`),
  CONSTRAINT `R_178` FOREIGN KEY (`IdPerfil`) REFERENCES `perfil` (`IdPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('administrador','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','administrador@kobel.com.br','2014-08-01 16:08:28','0:0:0:0:0:0:0:1','2014-07-24 16:58:36',0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',1,1,1,3,0),('ssamitsu','5ae489d510df855588776f386e8874450f750a85726d7922263092eee67dece4','sidney@kobel.com.br','2014-08-13 15:55:02','192.168.0.44','2014-08-13 15:46:24',0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',2,1,1,3,0),('msandin','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','marcus1@belfort.com.br',NULL,NULL,NULL,0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',3,1,7,3,0),('ejuliano','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','ederson1@kolss.com.br',NULL,NULL,NULL,0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',4,1,5,3,0),('atakashi','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','alexandre@kolss.com.br','2014-08-21 16:53:03','0:0:0:0:0:0:0:1','2014-07-24 16:58:36',0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ ADMIN',5,1,1,3,0),('eabreu','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','eduardo@kolss.com.br',NULL,NULL,NULL,0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',6,1,1,3,0),('opepadrao','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','sidney@kolss.com.br',NULL,NULL,NULL,0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',7,1,3,3,0),('opemaster','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','opemaster@kolss.com.br','2014-08-01 16:05:31','0:0:0:0:0:0:0:1','2014-07-24 16:58:36',0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',8,1,6,3,0),('lcohen','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','leonardo@kolss.com.br','2014-08-01 16:40:25','0:0:0:0:0:0:0:1',NULL,0,0,'2015-01-01 00:00:00','2020-01-01 00:00:00','ROLE_ADMIN',9,1,1,3,0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-17 16:55:42
