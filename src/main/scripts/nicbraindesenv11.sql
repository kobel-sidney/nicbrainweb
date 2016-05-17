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
INSERT INTO `atividade` VALUES (3,1,5,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\n(detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-12 09:00:00','2014-08-12 09:10:00','2014-08-21 16:53:24','2014-08-21 16:55:50',NULL,NULL,1,7,1,1,5,4,'cancelamento',0,NULL),(3,2,5,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria \n\nda DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-12 09:00:00','2014-08-12 10:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,3,5,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-12 10:00:00','2014-08-12 22:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,4,5,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio \n\ndas instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-12 11:00:00','2014-08-12 11:10:00',NULL,'2014-08-21 16:58:52',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,5,5,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)','Varredura \n\nantibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-12 11:00:00','2014-08-12 13:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,6,5,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-12 11:00:00','2014-08-12 11:30:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,7,5,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-12 11:00:00','2014-08-12 11:15:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,8,5,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-12 11:00:00','2014-08-12 11:15:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,9,5,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\ndo turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-12 12:00:00','2014-08-12 12:10:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,10,5,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-12 12:00:00','2014-08-12 13:00:00',NULL,'2014-08-21 16:59:03',NULL,NULL,1,7,1,1,5,4,'cancelando checklist',0,NULL),(3,11,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-13 05:00:00','2014-08-13 05:10:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,12,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-13 05:00:00','2014-08-13 06:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,13,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-13 06:00:00','2014-08-13 18:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,14,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-13 07:00:00','2014-08-13 07:10:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,15,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-13 07:00:00','2014-08-13 09:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,16,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-13 07:00:00','2014-08-13 07:30:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,17,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-13 07:00:00','2014-08-13 07:15:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,18,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-13 07:00:00','2014-08-13 07:15:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,19,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-13 08:00:00','2014-08-13 08:10:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,20,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-13 08:00:00','2014-08-13 09:00:00',NULL,NULL,NULL,NULL,1,7,2,2,11,4,NULL,0,NULL),(3,21,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-13 08:00:00','2014-08-13 08:10:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,22,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-13 08:00:00','2014-08-13 09:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,23,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-13 09:00:00','2014-08-13 21:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,24,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-13 10:00:00','2014-08-13 10:10:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,25,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-13 10:00:00','2014-08-13 12:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,26,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-13 10:00:00','2014-08-13 10:30:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,27,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-13 10:00:00','2014-08-13 10:15:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,28,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-13 10:00:00','2014-08-13 10:15:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,29,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-13 11:00:00','2014-08-13 11:10:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,30,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-13 11:00:00','2014-08-13 12:00:00',NULL,NULL,NULL,NULL,1,7,3,3,13,4,NULL,0,NULL),(3,31,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\n(detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-13 11:00:00','2014-08-13 11:10:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,32,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-13 11:00:00','2014-08-13 12:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,33,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-13 12:00:00','2014-08-14 00:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,34,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio \n\ndas instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-13 13:00:00','2014-08-13 13:10:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,35,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-13 13:00:00','2014-08-13 15:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,36,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-13 13:00:00','2014-08-13 13:30:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,37,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-13 13:00:00','2014-08-13 13:15:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,38,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-13 13:00:00','2014-08-13 13:15:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,39,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\ndo turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-13 14:00:00','2014-08-13 14:10:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,40,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-13 14:00:00','2014-08-13 15:00:00',NULL,NULL,NULL,NULL,1,7,4,4,8,4,NULL,0,NULL),(3,41,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\n(detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-14 05:00:00','2014-08-14 05:10:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,42,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 05:00:00','2014-08-14 06:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,43,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 06:00:00','2014-08-14 18:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,44,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio \n\ndas instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-14 07:00:00','2014-08-14 07:10:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,45,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-14 07:00:00','2014-08-14 09:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,46,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 07:00:00','2014-08-14 07:30:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,47,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 07:00:00','2014-08-14 07:15:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,48,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 07:00:00','2014-08-14 07:15:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,49,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\ndo turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-14 08:00:00','2014-08-14 08:10:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,50,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 08:00:00','2014-08-14 09:00:00',NULL,NULL,NULL,NULL,1,7,5,5,6,4,NULL,0,NULL),(3,51,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-14 08:00:00','2014-08-14 08:10:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,52,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 08:00:00','2014-08-14 09:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,53,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 09:00:00','2014-08-14 21:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,54,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-14 10:00:00','2014-08-14 10:10:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,55,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-14 10:00:00','2014-08-14 12:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,56,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 10:00:00','2014-08-14 10:30:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,57,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 10:00:00','2014-08-14 10:15:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,58,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 10:00:00','2014-08-14 10:15:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,59,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-14 11:00:00','2014-08-14 11:10:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,60,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 11:00:00','2014-08-14 12:00:00',NULL,NULL,NULL,NULL,1,7,6,6,10,4,NULL,0,NULL),(3,61,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\n(detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-14 11:00:00','2014-08-14 11:10:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,62,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 11:00:00','2014-08-14 12:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,63,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 12:00:00','2014-08-15 00:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,64,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio \n\ndas instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-14 13:00:00','2014-08-14 13:10:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,65,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-14 13:00:00','2014-08-14 15:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,66,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 13:00:00','2014-08-14 13:30:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,67,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 13:00:00','2014-08-14 13:15:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,68,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 13:00:00','2014-08-14 13:15:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,69,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\ndo turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-14 14:00:00','2014-08-14 14:10:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,70,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 14:00:00','2014-08-14 15:00:00',NULL,NULL,NULL,NULL,1,7,7,7,7,4,NULL,0,NULL),(3,71,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-14 14:00:00','2014-08-14 14:10:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,72,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-14 14:00:00','2014-08-14 15:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,73,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-14 15:00:00','2014-08-15 03:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,74,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-14 16:00:00','2014-08-14 16:10:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,75,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-14 16:00:00','2014-08-14 18:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,76,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-14 16:00:00','2014-08-14 16:30:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,77,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-14 16:00:00','2014-08-14 16:15:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,78,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-14 16:00:00','2014-08-14 16:15:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,79,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-14 17:00:00','2014-08-14 17:10:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,80,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-14 17:00:00','2014-08-14 18:00:00',NULL,NULL,NULL,NULL,1,7,8,8,12,4,NULL,0,NULL),(3,81,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\n(detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-15 05:00:00','2014-08-15 05:10:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,82,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-15 05:00:00','2014-08-15 06:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,83,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-15 06:00:00','2014-08-15 18:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,84,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio \n\ndas instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-15 07:00:00','2014-08-15 07:10:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,85,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-15 07:00:00','2014-08-15 09:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,86,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de \n\nentregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-15 07:00:00','2014-08-15 07:30:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,87,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-15 07:00:00','2014-08-15 07:15:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,88,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-15 07:00:00','2014-08-15 07:15:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,89,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada \n\ndo turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-15 08:00:00','2014-08-15 08:10:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,90,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-15 08:00:00','2014-08-15 09:00:00',NULL,NULL,NULL,NULL,1,7,9,9,9,4,NULL,0,NULL),(3,91,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-15 08:00:00','2014-08-15 08:10:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,92,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-15 08:00:00','2014-08-15 09:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,93,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-15 09:00:00','2014-08-15 21:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,94,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-15 10:00:00','2014-08-15 10:10:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,95,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-15 10:00:00','2014-08-15 12:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,96,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-15 10:00:00','2014-08-15 10:30:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,97,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-15 10:00:00','2014-08-15 10:15:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,98,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-15 10:00:00','2014-08-15 10:15:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,99,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-15 11:00:00','2014-08-15 11:10:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,100,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-15 11:00:00','2014-08-15 12:00:00',NULL,NULL,NULL,NULL,1,7,10,10,15,4,NULL,0,NULL),(3,101,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-15 11:00:00','2014-08-15 11:10:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,102,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-15 11:00:00','2014-08-15 12:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,103,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-15 12:00:00','2014-08-16 00:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,104,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-15 13:00:00','2014-08-15 13:10:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,105,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-15 13:00:00','2014-08-15 15:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,106,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-15 13:00:00','2014-08-15 13:30:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,107,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-15 13:00:00','2014-08-15 13:15:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,108,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-15 13:00:00','2014-08-15 13:15:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,109,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-15 14:00:00','2014-08-15 14:10:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,110,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-15 14:00:00','2014-08-15 15:00:00',NULL,NULL,NULL,NULL,1,7,11,11,4,4,NULL,0,NULL),(3,111,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-16 05:00:00','2014-08-16 05:10:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,112,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-16 05:00:00','2014-08-16 06:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,113,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-16 06:00:00','2014-08-16 18:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,114,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-16 07:00:00','2014-08-16 07:10:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,115,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-16 07:00:00','2014-08-16 09:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,116,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-16 07:00:00','2014-08-16 07:30:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,117,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-16 07:00:00','2014-08-16 07:15:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,118,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-16 07:00:00','2014-08-16 07:15:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,119,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-16 08:00:00','2014-08-16 08:10:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,120,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-16 08:00:00','2014-08-16 09:00:00',NULL,NULL,NULL,NULL,1,7,12,12,13,4,NULL,0,NULL),(3,121,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-16 08:00:00','2014-08-16 08:10:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,122,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-16 08:00:00','2014-08-16 09:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,123,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-16 09:00:00','2014-08-16 21:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,124,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-16 10:00:00','2014-08-16 10:10:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,125,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-16 10:00:00','2014-08-16 12:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,126,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-16 10:00:00','2014-08-16 10:30:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,127,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-16 10:00:00','2014-08-16 10:15:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,128,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-16 10:00:00','2014-08-16 10:15:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,129,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-16 11:00:00','2014-08-16 11:10:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,130,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-16 11:00:00','2014-08-16 12:00:00',NULL,NULL,NULL,NULL,1,7,13,13,14,4,NULL,0,NULL),(3,131,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-16 11:00:00','2014-08-16 11:10:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,132,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-16 11:00:00','2014-08-16 12:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,133,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-16 12:00:00','2014-08-17 00:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,134,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-16 13:00:00','2014-08-16 13:10:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,135,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-16 13:00:00','2014-08-16 15:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,136,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-16 13:00:00','2014-08-16 13:30:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,137,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-16 13:00:00','2014-08-16 13:15:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,138,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-16 13:00:00','2014-08-16 13:15:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,139,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-16 14:00:00','2014-08-16 14:10:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,140,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-16 14:00:00','2014-08-16 15:00:00',NULL,NULL,NULL,NULL,1,7,14,14,11,4,NULL,0,NULL),(3,141,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-17 05:00:00','2014-08-17 05:10:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,142,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-17 05:00:00','2014-08-17 06:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,143,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-17 06:00:00','2014-08-17 18:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,144,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-17 07:00:00','2014-08-17 07:10:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,145,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-17 07:00:00','2014-08-17 09:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,146,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-17 07:00:00','2014-08-17 07:30:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,147,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-17 07:00:00','2014-08-17 07:15:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,148,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-17 07:00:00','2014-08-17 07:15:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,149,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-17 08:00:00','2014-08-17 08:10:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,150,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-17 08:00:00','2014-08-17 09:00:00',NULL,NULL,NULL,NULL,1,7,15,15,6,4,NULL,0,NULL),(3,151,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-17 08:00:00','2014-08-17 08:10:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,152,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-17 08:00:00','2014-08-17 09:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,153,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-17 09:00:00','2014-08-17 21:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,154,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-17 10:00:00','2014-08-17 10:10:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,155,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-17 10:00:00','2014-08-17 12:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,156,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-17 10:00:00','2014-08-17 10:30:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,157,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-17 10:00:00','2014-08-17 10:15:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,158,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-17 10:00:00','2014-08-17 10:15:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,159,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-17 11:00:00','2014-08-17 11:10:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,160,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-17 11:00:00','2014-08-17 12:00:00',NULL,NULL,NULL,NULL,1,7,16,16,10,4,NULL,0,NULL),(3,161,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-17 11:00:00','2014-08-17 11:10:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,162,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-17 11:00:00','2014-08-17 12:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,163,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-17 12:00:00','2014-08-18 00:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,164,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-17 13:00:00','2014-08-17 13:10:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,165,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-17 13:00:00','2014-08-17 15:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,166,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-17 13:00:00','2014-08-17 13:30:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,167,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-17 13:00:00','2014-08-17 13:15:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,168,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-17 13:00:00','2014-08-17 13:15:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,169,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-17 14:00:00','2014-08-17 14:10:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,170,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-17 14:00:00','2014-08-17 15:00:00',NULL,NULL,NULL,NULL,1,7,17,17,8,4,NULL,0,NULL),(3,171,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-18 05:00:00','2014-08-18 05:10:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,172,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-18 05:00:00','2014-08-18 06:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,173,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-18 06:00:00','2014-08-18 18:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,174,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-18 07:00:00','2014-08-18 07:10:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,175,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-18 07:00:00','2014-08-18 09:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,176,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-18 07:00:00','2014-08-18 07:30:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,177,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-18 07:00:00','2014-08-18 07:15:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,178,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-18 07:00:00','2014-08-18 07:15:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,179,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-18 08:00:00','2014-08-18 08:10:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,180,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-18 08:00:00','2014-08-18 09:00:00',NULL,NULL,NULL,NULL,1,7,18,18,15,4,NULL,0,NULL),(3,181,1,1,NULL,1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes \n\ngerais)',10,5,5,'2014-08-18 11:00:00','2014-08-18 11:10:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,182,1,2,NULL,2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  \n\nBiometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',60,5,5,'2014-08-18 11:00:00','2014-08-18 12:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,183,1,3,NULL,3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 \n\nhoras)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',720,5,5,'2014-08-18 12:00:00','2014-08-19 00:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,184,1,4,NULL,4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento \n\nprÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',10,5,5,'2014-08-18 13:00:00','2014-08-18 13:10:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,185,1,5,NULL,5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e \n\ncampo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',120,5,5,'2014-08-18 13:00:00','2014-08-18 15:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,186,1,6,NULL,6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino \n\nde entregas de mercadorias (6 horas antes do inicio do jogo)',30,5,5,'2014-08-18 13:00:00','2014-08-18 13:30:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,187,1,7,NULL,7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF \n\nTransportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',15,5,5,'2014-08-18 13:00:00','2014-08-18 13:15:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,188,1,8,NULL,8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de \n\nCredenciamento (Zonas 1 a 9)',15,5,5,'2014-08-18 13:00:00','2014-08-18 13:15:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,189,1,9,NULL,9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a \n\nprivada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',10,5,5,'2014-08-18 14:00:00','2014-08-18 14:10:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL),(3,190,1,10,NULL,10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da \n\nDPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',60,5,5,'2014-08-18 14:00:00','2014-08-18 15:00:00',NULL,NULL,NULL,NULL,1,7,19,19,7,4,NULL,0,NULL);
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
INSERT INTO `cargo` VALUES (1,'Gerente','Gerente'),(2,'Arquiteto de SoluÃ§Ãµes','Responsavel por desenhar o sistema'),(3,'Diretor','Diretor'),(4,'Supervisor','Supervisor'),(5,'Operador','Operador'),(6,'VP','Vice-Presidente'),(7,'Presidente','Presidente'),(8,'Operador','Operador'),(9,'Coordenador','Coordenador');
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
INSERT INTO `checklist` VALUES (1,1,5,4,3,'Match Day','Brasil x CroÃ¡cia',0,880,5,5,'2014-08-12 09:00:00','2014-08-12 23:40:00','2014-08-21 16:53:38','2014-08-21 16:58:21',NULL,NULL,1,5,7,1,'cancelando checklist'),(2,2,11,4,3,'Match Day','MÃ©xico x CamarÃµes',0,880,5,5,'2014-08-13 05:00:00','2014-08-13 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(3,3,13,4,3,'Match Day','Espanha x Holanda',0,880,5,5,'2014-08-13 08:00:00','2014-08-13 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(4,4,8,4,3,'Match Day','Chile x AustrÃ¡lia',0,880,5,5,'2014-08-13 11:00:00','2014-08-14 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(5,5,6,4,3,'Match Day','Colombia x GrÃ©cia',0,880,5,5,'2014-08-14 05:00:00','2014-08-14 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(6,6,10,4,3,'Match Day','Uruguai x Costa Rica',0,880,5,5,'2014-08-14 08:00:00','2014-08-14 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(7,7,7,4,3,'Match Day','Inglaterra x ItÃ¡lia',0,880,5,5,'2014-08-14 11:00:00','2014-08-15 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(8,8,12,4,3,'Match Day','Costa do Marfim x JapÃ£o',0,880,5,5,'2014-08-14 14:00:00','2014-08-15 04:30:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(9,9,9,4,3,'Match Day','SuÃ­Ã§a x Equador',0,880,5,5,'2014-08-15 05:00:00','2014-08-15 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(10,10,15,4,3,'Match Day','FranÃ§a x Honduras',0,880,5,5,'2014-08-15 08:00:00','2014-08-15 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(11,11,4,4,3,'Match Day','Argentina x BÃ³snia',0,880,5,5,'2014-08-15 11:00:00','2014-08-16 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(12,12,13,4,3,'Match Day','Alemanha x Portugal',0,880,5,5,'2014-08-16 05:00:00','2014-08-16 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(13,13,14,4,3,'Match Day','IrÃ£ x NigÃ©ria',0,880,5,5,'2014-08-16 08:00:00','2014-08-16 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(14,14,11,4,3,'Match Day','Gana x Estados Unidos',0,880,5,5,'2014-08-16 11:00:00','2014-08-17 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(15,15,6,4,3,'Match Day','BÃ©lgica x ArgÃ©lia',0,880,5,5,'2014-08-17 05:00:00','2014-08-17 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(16,16,10,4,3,'Match Day','Brasil x MÃ©xico',0,880,5,5,'2014-08-17 08:00:00','2014-08-17 22:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(17,17,8,4,3,'Match Day','RÃºssia x CorÃ©ia do Sul',0,880,5,5,'2014-08-17 11:00:00','2014-08-18 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(18,18,15,4,3,'Match Day','Holanda x AustrÃ¡lia',0,880,5,5,'2014-08-18 05:00:00','2014-08-18 19:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL),(19,19,7,4,3,'Match Day','CroÃ¡cia x CamarÃµes',0,880,5,5,'2014-08-18 11:00:00','2014-08-19 01:40:00',NULL,NULL,NULL,NULL,1,1,7,1,NULL);
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
INSERT INTO `checklist_ocorrencia` VALUES (1,'Briga','Checklist Briga',1),(2,'Alarme','Checklist Alarme',2),(3,'Fogo','Checklist Fogo',3),(4,'Tumulto','Checklist Tumulto',4),(5,'Roubo','Checklist Roubo',5),(6,'Ãgua','Checklist Ãgua',6),(7,'Ferido','Checklist Ferido',7);
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
INSERT INTO `contratante` VALUES (1,2,'Kolss','10.837.432/0001-05','ISENTO','(11) 4427-7554','Kolss GestÃ£o Empresarial','Kolss GestÃ£o Empresarial','www.kolss.com.br',NULL,'Ederson Juliano','(11) 99153-0624',NULL,'ederson@kolss.com.br',7),(2,2,'Belfort','11.222.333/0001-44','ISENTO','(11) 3723-2020','Belfort','Belfort','www.belfort.com.br',NULL,'Marcus Sandin','(11) 98448-5577',NULL,'marcus@belfort.com.br',3),(3,2,'Kobel','19.335.987/0001-23','ISENTO','(11) 4427-7554','Empresa especializada em sistemas de seguranÃ§a','Kobel Software Ltda','www.kobel.com.br',NULL,'Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br',1);
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
INSERT INTO `endereco` VALUES ('JosÃ© Caballero',65,'Sala 12',' Vila Bastos',2,'09040-210',1,1,2,'2014-07-21 10:04:33',1,'-23.658226','-46.533063',2),('Santa Albina',430,NULL,' Jd. Trussardi',1,'05518-000',1,1,1,'2014-07-21 10:04:33',3,'-23.584511','-46.729257',2),('Salvador Allende',6555,'Rio Centro-PortÃ£o B','Barra da Tijuca',2,'22783-127',1,2,3,'2014-07-21 10:04:33',4,'-22.978049','-43.411488',2),('Professor Eurico Rabelo',20271,NULL,'MaracanÃ£',1,'20271-150',1,2,3,'2014-07-21 10:04:33',5,'-22.913931','-43.230989',2),('Doutor LuÃ­s Aires',0,NULL,'Itaquera',1,'08295-005',1,1,1,'2014-07-21 10:04:33',6,'-23.543503','-46.476490',2),('AntÃ´nio AbrahÃ£o Caram',1001,NULL,'SÃ£o LuÃ­s',2,'31275-000',1,3,4,'2014-07-21 10:04:33',7,'-19.865015','-43.970914',2),('Complexo Poliesportivo Ayrton Senna',0,NULL,'Asa Norte',2,'70077-000',1,10,6,'2014-07-21 10:04:33',8,'-15.783839','-47.897319',2),('AgrÃ­cola Paes de Barros',0,NULL,'VerdÃ£o',2,'78030-210',1,15,7,'2014-07-21 10:04:33',9,'-15.60379','-56.121605',2),('Buenos Aires',0,NULL,'Ãgua Verde',1,'80250-070',1,19,8,'2014-07-21 10:04:33',10,'-25.447873','-49.275899',2),('Alberto Craveiro',2901,NULL,'CastelÃ£o',2,'60861-211',1,9,9,'2014-07-21 10:04:33',11,'-3.807231','-38.522434',2),('Constantino Nery',0,NULL,'Flores',2,'69058-795',1,7,5,'2014-07-21 10:04:33',12,'-3.0838035','-60.026296',2),('Presidente Prudente de Morais',5121,NULL,'Lagoa Nova',2,'59056-200',1,22,10,'2014-07-21 10:04:33',13,'-5.8269481','-35.2134785',2),('Padre Cacique',891,NULL,'Praia de Belas',2,'90810-240',1,23,11,'2014-07-21 10:04:33',14,'-30.0650812','-51.2352245',2),('Deus Ã© Fiel',1,NULL,'Jardim Tenedo',1,'54710-010',1,20,12,'2014-07-21 10:04:33',15,'-8.041675','-35.00782',2),('Presidente Costa e Silva',0,NULL,'NazarÃ©',2,'40050-360',1,20,12,'2014-07-21 10:04:33',16,'-12.978644','-38.504044',2);
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
INSERT INTO `equipamento` VALUES ('123456',1,1,'http://192.168.0.16:81/videostream.cgi?user=admin&pwd=123&resolution=32&rate=30','usuario','senha',1,1,3,3,3,NULL,NULL,'CÃ¢mera 1'),('123456',1,2,'mms://201.87.159.148/VO_KM_41.990_270','usuario','senha',1,2,4,4,3,'-22.910840','-43.231059','CÃ¢mera 1a'),('123456',1,3,'rtsp://live240.impek.com/soleiltv/video','usuario','senha',1,2,4,4,3,'-22.911095','-43.229671','CÃ¢mera 2a'),('123456',1,4,'rtsp://plazacam.studentaffairs.duke.edu:554/axis-media/media.amp?videocodec=h264','usuario','senha',1,6,4,4,3,'-22.912650','-43.230963','CÃ¢mera 1b'),('123456',1,5,'mms://201.87.159.148/VO_KM_13.000_280','usuario','senha',1,6,4,4,3,'-22.911055','-43.228306','CÃ¢mera 2b'),('123456',1,6,'http://radar.g1.globo.com/FinxiPlayer.swf','usuario','senha',1,6,4,4,3,'-22.913','-43.23','CÃ¢mera 2c');
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
INSERT INTO `estado` VALUES (1,1,'SP','SÃ£o Paulo'),(1,2,'RJ','Rio de Janeiro'),(1,3,'MG','Minas Gerais'),(1,4,'AC','Acre'),(1,5,'AL','Alagoas'),(1,6,'AP','AmapÃ¡'),(1,7,'AM','Amazonas'),(1,8,'BA','Bahia'),(1,9,'CE','CearÃ¡'),(1,10,'DF','Distrito Federal'),(1,11,'ES','EspÃ­rito Santo'),(1,12,'GO','GoiÃ¡s'),(1,13,'TO','Tocantins'),(1,14,'MA','MaranhÃ£o'),(1,15,'MT','Mato Grosso'),(1,16,'MS','Mato Grosso do Sul'),(1,17,'PA','ParÃ¡'),(1,18,'PB','ParaÃ­ba'),(1,19,'PR','ParanÃ¡'),(1,20,'PE','Pernambuco'),(1,21,'PI','PiauÃ­'),(1,22,'RN','Rio Grande do Norte'),(1,23,'RS','Rio Grande do Sul'),(1,24,'RO','RondÃ´nia'),(1,25,'RR','Roraima'),(1,26,'SC','Santa Catarina'),(1,27,'SE','Sergipe');
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
INSERT INTO `evento` VALUES (1,'Brasil x CroÃ¡cia','2014-08-12 17:00:00','2014-08-12 19:00:00',1,5,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(2,'MÃ©xico x CamarÃµes','2014-08-13 13:00:00','2014-08-13 15:00:00',1,11,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(3,'Espanha x Holanda','2014-08-13 16:00:00','2014-08-13 18:00:00',1,13,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(4,'Chile x AustrÃ¡lia','2014-08-13 19:00:00','2014-08-13 21:00:00',1,8,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(5,'Colombia x GrÃ©cia','2014-08-14 13:00:00','2014-08-14 15:00:00',1,6,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(6,'Uruguai x Costa Rica','2014-08-14 16:00:00','2014-08-14 18:00:00',1,10,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(7,'Inglaterra x ItÃ¡lia','2014-08-14 19:00:00','2014-08-14 21:00:00',1,7,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(8,'Costa do Marfim x JapÃ£o','2014-08-14 22:00:00','2014-08-15 00:00:00',1,12,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(9,'SuÃ­Ã§a x Equador','2014-08-15 13:00:00','2014-08-15 15:00:00',1,9,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(10,'FranÃ§a x Honduras','2014-08-15 16:00:00','2014-08-15 18:00:00',1,15,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(11,'Argentina x BÃ³snia','2014-08-15 19:00:00','2014-08-15 21:00:00',1,4,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(12,'Alemanha x Portugal','2014-08-16 13:00:00','2014-08-16 15:00:00',1,13,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(13,'IrÃ£ x NigÃ©ria','2014-08-16 16:00:00','2014-08-16 18:00:00',1,14,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(14,'Gana x Estados Unidos','2014-08-16 19:00:00','2014-08-16 21:00:00',1,11,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(15,'BÃ©lgica x ArgÃ©lia','2014-08-17 13:00:00','2014-08-17 15:00:00',1,6,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(16,'Brasil x MÃ©xico','2014-08-17 16:00:00','2014-08-17 18:00:00',1,10,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(17,'RÃºssia x CorÃ©ia do Sul','2014-08-17 19:00:00','2014-08-17 21:00:00',1,8,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(18,'Holanda x AustrÃ¡lia','2014-08-18 13:00:00','2014-08-18 15:00:00',1,15,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(19,'CroÃ¡cia x CamarÃµes','2014-08-18 19:00:00','2014-08-18 21:00:00',1,7,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br'),(20,'Espanha x Chile','2014-08-18 16:00:00','2014-08-18 18:00:00',1,4,4,3,NULL,'GSS','(11) 2014-2014','(11) 2014-2014','GSS@brasil2014.com.br');
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
INSERT INTO `fornecedor` VALUES (1,'Fornecedor Geral','Geral','222.222.222/0001-22',NULL,NULL,'JosÃ© JoÃ£o','(11) 2222-2222','geral@geral.com.br','(21) 92014-2014',NULL,1,1,1);
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
INSERT INTO `gravidade_ocorrencia` VALUES (1,'Maxima','Maxima Gravidade',91,100),(2,'Alta+','Gravidade Muito Alta',71,90),(3,'Alta','Alta Gravidade',61,70),(4,'MÃ©dia++','MÃ©dia/Alta Gravidade',51,60),(5,'MÃ©dia+','MÃ©dia/MÃ©dia Gravidade',41,50),(6,'MÃ©dia','Gravidade MÃ©dia',31,40),(7,'Baixa++','Baixa/MÃ©dia Gravidade',21,30),(8,'Baixa+','Baixa/Baixa Gravidade',11,20),(9,'Baixa','Baixa Gravidade',0,10);
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
INSERT INTO `grupo` VALUES (1,'Superior Imediato','Superior Imediato'),(2,'Gerentes','Gerentes'),(3,'Diretores','Diretores'),(4,'ResponsÃ¡vel','ResponsÃ¡vel'),(5,'Superintendete','Superintendentes'),(6,'Vice-Presidente','Vice-Presidentes'),(7,'Presidente','Presidente'),(8,'Supervisores','Supervisores'),(9,'Operadores','Operadores');
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
INSERT INTO `local` VALUES (1,'EscritÃ³rio da Kolss',1,1,'www.kolss.com.br',NULL,'(11) 4427-7554','Ederson Juliano','(11) 4427-7554','(11) 99153-0624','ederson@kolss.com.br',NULL,'EscritÃ³rio Kolss - Santo AndrÃ©',30,1,'-23.658226','-46.533063',NULL),(2,'EscritÃ³rio da Belfort',2,2,'www.belfort.com.br',NULL,'(11) 3723-2020','Marcus Sandin','(11) 3723-2020','(11) 98448-5577','marcus@belfort.com.br',NULL,'EscritÃ³rio Belfort â€“ SÃ£o Paulo',30,1,'-23.584511','-46.729257',NULL),(3,'EscritÃ³rio da Kobel',3,3,'www.kobel.com.br',NULL,'(11) 4427-7554','Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br',NULL,'EscritÃ³rio Kobel - Santo AndrÃ©',30,1,'-23.658226','-46.533063',NULL),(4,'EstÃ¡dio do MaracanÃ£',4,3,NULL,NULL,'(21) 2014-2014','GSS MaracanÃ£','(21) 2014-2014','(21) 2014-2014','gss@brasil2014.com.br',NULL,'EstÃ¡dio MÃ¡rio Filho',50,5,NULL,NULL,NULL),(5,'Arena de SÃ£o Paulo',4,3,NULL,NULL,'(21) 2014-2014','GSS SÃ£o Paulo','(11) 2014-2014','(11) 2014-2014','gss@brasil2014.com.br',NULL,'Arena Corinthians',50,6,NULL,NULL,NULL),(6,'EstÃ¡dio MineirÃ£o',4,3,NULL,NULL,'(21) 2014-2014','GSS MinerÃ£o','(21) 2014-2014','(31) 2014-2014','gss@brasil2014.com.br',NULL,'EstÃ¡dio Governador MagalhÃ£es Pinto',50,7,NULL,NULL,NULL),(7,'Arena da AmazÃ´nia',4,3,NULL,NULL,'(21) 2014-2014','GSS AmazÃ´nia','(21) 2014-2014','(92) 2014-2014','gss@brasil2014.com.br',NULL,'Arena da AmazÃ´nia - Manaus',50,12,NULL,NULL,NULL),(8,'Arena Pantanal',4,3,NULL,NULL,'(21) 2014-2014','GSS Pantanal','(21) 2014-2014','(65) 2014-2014','gss@brasil2014.com.br',NULL,'Arena Pantanal - CuiabÃ¡',50,9,NULL,NULL,NULL),(9,'EstÃ¡dio Nacional',4,3,NULL,NULL,'(21) 2014-2014','GSS Nacional','(21) 2014-2014','(61) 2014-2014','gss@brasil2014.com.br',NULL,'ManÃ© Garrincha - BrasÃ­lia',50,8,NULL,NULL,NULL),(10,'EstÃ¡dio CastelÃ£o',4,3,NULL,NULL,'(21) 2014-2014','GSS CastelÃ£o','(21) 2014-2014','(85) 2014-2014','gss@brasil2014.com.br',NULL,'CastelÃ£o - Fortaleza',50,11,NULL,NULL,NULL),(11,'EstÃ¡dio das Dunas',4,3,NULL,NULL,'(21) 2014-2014','GSS Dunas','(21) 2014-2014','(84) 2014-2014','gss@brasil2014.com.br',NULL,'Arena das Dunas - Natal',50,13,NULL,NULL,NULL),(12,'Arena Pernambuco',4,3,NULL,NULL,'(21) 2014-2014','GSS Pernambuco','(21) 2014-2014','(81) 2014-2014','gss@brasil2014.com.br',NULL,'Arena Pernambuco - Recife',50,15,NULL,NULL,NULL),(13,'Arena Fonte Nova',4,3,NULL,NULL,'(21) 2014-2014','GSS Fonte Nova','(21) 2014-2014','(71) 2014-2014','gss@brasil2014.com.br',NULL,'Fonte Nova - Salvador',50,16,NULL,NULL,NULL),(14,'Arena da Baixada',4,3,NULL,NULL,'(21) 2014-2014','GSS Baixada','(21) 2014-2014','(41) 2014-2014','gss@brasil2014.com.br',NULL,'Arena da Baixada - Curitiba',50,10,NULL,NULL,NULL),(15,'EstÃ¡dio Beira Rio',4,3,NULL,NULL,'(21) 2014-2014','GSS Beira Rio','(21) 2014-2014','(51) 2014-2014','gss@brasil2014.com.br',NULL,'Beira Rio â€“ Porto Alegre',50,14,NULL,NULL,NULL),(17,'COL - Rio Centro',4,3,NULL,NULL,'(21) 2014-2014','GSS COL','(21) 2014-2014',NULL,'gss@brasil2014.com.br',NULL,'Rio Centro â€“ Rio de Janeiro',50,4,NULL,NULL,NULL);
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
INSERT INTO `mensagem` VALUES (1,'InÃ­cio na data e hora prevista','Sempre que um checklist ou uma atividade Ã© iniciado na data e hora prevista',1,1,1,1,1,1),(2,'InÃ­cio dentro do periodo de tolerÃ¢ncia','Sempre que um checklist ou uma atividade Ã© iniciado dentro do periodo de tolerÃ¢ncia',1,1,1,1,1,1),(3,'25% do tempo percorrido','Sempre que um checklist ou uma atividade atingir 25% do seu tempo de execuÃ§Ã£o',1,1,1,1,1,1),(4,'50% do tempo percorrido','Sempre que um checklist ou uma atividade atingir 50% do seu tempo de execuÃ§Ã£o',1,1,1,1,1,1),(5,'75% do tempo percorrido','Sempre que um checklist ou uma atividade atingir 75% do seu tempo de execuÃ§Ã£o',1,1,1,1,1,1),(6,'ParabÃ©ns, atividade concluÃ­da com Ãªxito','Sempre que uma atividade for finalizada com Ãªxito na data e hora prevista',0,1,1,1,1,1),(7,'Atividade concluÃ­da dentro do perÃ­odo de tolerÃ¢ncia com Ãªxito','Sempre que uma atividade for finalizada com Ãªxito dentro do perÃ­odo de tolerÃ¢ncia',0,1,1,1,1,1),(8,'ParabÃ©ns, checklist concluÃ­do com Ãªxito','Sempre que um checklist for finalizado com Ãªxito na data e hora prevista',1,0,1,1,1,1),(9,'Checklist concluÃ­do com Ãªxito dentro do perÃ­odo de tolerÃ¢ncia com Ãªxito','Sempre que um checklist for finalizado com Ãªxito dentro do perÃ­odo de tolerÃ¢ncia',1,1,1,1,1,1),(10,'Produtividade da atividade','Ao encerrar um checklist, enviar aviso com o % de produtividade de cada atividade do checklist',1,0,1,1,1,1),(11,'Produtividade do checklist','Ao encerrar um checklist, enviar aviso com o % de produtividade do checklist  e de cada atividade do checklist',1,0,1,1,1,1),(12,'InÃ­cio nÃ£o realizado na data e hora prevista','Sempre que um checklist ou atividade nÃ£o for iniciado na data/hora prevista',1,1,1,2,1,1),(13,'InÃ­cio com atraso','Sempre que um checklist ou atividade for iniciado apÃ³s a data/hora prevista',1,1,1,2,1,1),(14,'Estouro do tempo de tolerÃ¢ncia para inÃ­cio','Sempre que estourar o tempo de tolerÃ¢ncia de inÃ­cio de um checklist ou atividade e esta nÃ£o ter sido iniciada',1,1,1,2,1,1),(15,'Estouro do tempo previsto para finalizaÃ§Ã£o','Sempre que um checklist ou atividade nÃ£o for finalizado na data/hora prevista',1,1,1,2,1,1),(16,'Estouro do perÃ­odo previsto para finalizaÃ§Ã£o','Sempre que estourar o tempo previsto de execuÃ§Ã£o de um checklist ou atividade que possui apenas perÃ­odo de execuÃ§Ã£o e nÃ£o data/hora prevista de termino',1,1,1,2,1,1),(17,'Finalizado com atraso','Sempre que um checklist ou uma atividade for concluÃ­do depois do horÃ¡rio de tÃ©rmino previsto',1,1,1,2,1,1),(18,'Checklist ou atividade Pausada','Sempre que um checklist ou uma atividade Ã© pausado',1,1,1,2,1,1),(19,'Checklist Cancelado','Sempre que um checklist Ã© cancelado',1,1,1,2,1,1),(20,'Checklist e atividades pendentes','Sempre duas (2) horas apÃ³s o final do tempo previsto de tÃ©rmino do checklist. Caso nÃ£o exista tÃ©rmino previsto, considerar duas (2) horas apÃ³s o tÃ©rmino do turno.',1,0,1,2,1,1),(21,'Clientes nÃ£o visitados na semana','Todas as segundas-feiras reportando se na semana anterior nÃ£o houve agendamento de checklist para o cliente',1,0,1,2,1,1),(22,'Atividade por perÃ­odo nÃ£o iniciada - mais a msg especÃ­fica de TI, T2 e T3','DeverÃ¡ verificar qual o perÃ­odo da atividade e calcular e comparar se o tempo restante para o tÃ©rmino do checklist Ã© suficiente para a execuÃ§Ã£o',0,1,1,2,1,1),(23,'RealizaÃ§Ã£o fora do local designado','Ao iniciar um checklist ou atividade, comparar a lat/long capturada pelo aplicativo mobile no check de inÃ­cio com a lat/long do cadastro do local do cliente/checklist. Se a distancia exceder uma distÃ¢ncia previamente cadastrada no local, enviar alerta',1,1,1,2,1,1),(24,'Alerta manual','Permitir escrever mensagem para envio',0,0,1,2,1,1),(25,'Alerta de equipamento com defeito:','VerificaÃ§Ã£o automÃ¡tica se equipamentos estÃ£o em funcionamento',0,0,1,2,1,1),(26,'Item Normas e procedimentos / treinamento avaliado como Ruim - vide relatÃ³rio de OSs','Quando o campo 3. Normas e procedimento / treinamentos do tÃ³pico B do formulÃ¡rio de OS (SeguranÃ§a, ServiÃ§os e Limpeza) for preenchido com ruim',1,0,1,2,1,1),(27,'Itens SARCC RQO e Nextel / Celular avaliado como Ruim - vide relatÃ³rio de OSs','Quando os campos SARCC RQO e Nextel / Celular do tÃ³pico C do formulÃ¡rio de OS (SeguranÃ§a, ServiÃ§os e Limpeza) for preenchido com ruim',1,0,1,2,1,1),(28,'Item Normas e procedimentos / treinamento avaliado como Ruim menos de 10 vezes no mÃªs','Quando o campo 3. Normas e procedimento / treinamentos do tÃ³pico B do formulÃ¡rio de OS (SeguranÃ§a, ServiÃ§os e Limpeza) for preenchido com ruim menos de 10 vezes no mÃªs anterior. Calcular todo dia 01 do mÃªs',0,0,1,2,1,1),(29,'Respostas semelhantes nas OSs do dia - vide relatÃ³rio de OSs','Comparar para um mesmo usuÃ¡rio responsÃ¡vel pelas atividades de um dia de preenchimento de OSs (SeguranÃ§a, ServiÃ§os e Limpeza), se para cada resposta preenchida em campos de pontuaÃ§Ã£o, obtiver preenchimento das OSs semelhantes mediante a um Ã­ndice de 95% de respostas idÃªnticas',0,0,1,2,1,1),(30,'Respostas pontuadas como RUIM nas OSs - vide relatÃ³rio de OSs','Analisar as OS apÃ³s o preenchimento e enviar os campos que contenham a pontuaÃ§Ã£o como Ruim',1,0,1,2,1,1),(31,' Alerta Mensal de Desempenho (tirar dÃºvida sobre este alerta)','Enviar todo dia 01 do mÃªs',0,0,1,2,1,1),(32,'VocÃª possui checklist e atividades agendadas. Consulte o sistema.','VocÃª possui checklist e atividades agendadas. Consulte o sistema.',0,0,1,1,1,1),(33,'Alerta de OcorrÃªncia enviado. ',' Alerta de OcorrÃªncia enviado.',1,1,1,2,1,1),(34,'Atividade Cancelada','Sempre que uma atividade Ã© cancelada',1,1,1,2,1,1);
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
INSERT INTO `menu` VALUES (1,NULL,'menu.contratante','Contratante',1,NULL,'E',1,'/images/iconesNovos/contratante.png'),(2,NULL,'menu.perfiAcesso','Perfil de Acesso',1,NULL,'E',2,'/images/iconesNovos/perfil-acesso.png'),(3,NULL,'menu.usuario','UsuÃ¡rio',1,NULL,'E',3,'/images/iconesNovos/usuario.png'),(4,NULL,'menu.dadosMestres','Dados Mestres',1,NULL,'E',4,'/images/iconesNovos/dados-mestre.png'),(5,NULL,'menu.controleDeAcesso','Controle de Acesso',1,NULL,'E',5,'/images/iconesNovos/controle-acesso.png'),(6,NULL,'menu.ocorrencia','OcorrÃªncia',1,NULL,'E',6,'/images/iconesNovos/ocorrencias.png'),(7,NULL,'menu.checklist','CheckList',1,NULL,'E',7,'/images/iconesNovos/check-list.png'),(8,NULL,'menu.monitorar','Monitorar',1,NULL,'E',8,'/images/iconesNovos/monitorar.png'),(9,NULL,'menu.rastrear','Rastrear',1,NULL,'E',9,'/images/iconesNovos/rastrear.png'),(10,NULL,'menu.relatorio','RelatÃ³rios',1,NULL,'E',10,'/images/iconesNovos/relatorios.png'),(11,NULL,'menu.telefonesUteis','Telefones Uteis',1,'TelefonesUteis.nicbrain','E',11,'/images/iconesNovos/tel-uteis.png'),(16,1,'menu.cadastroContratante','Cadastro Contratante',1,'ListaContratante.nicbrain','E',1,NULL),(17,1,'menu.consultaContrantane','Consulta Contratante',1,'ConsultaContratante.nicbrain','E',2,NULL),(18,1,'menu.cliente','Cliente',1,'ListaCliente.nicbrain','E',3,NULL),(19,1,'menu.local','Local',1,'ListaLocal.nicbrain','E',4,NULL),(20,1,'menu.evento','Evento',1,'ListaEvento.nicbrain','E',5,NULL),(21,1,'menu.funcionario','FuncionÃ¡rio',1,'ListaFuncionario.nicbrain','E',6,NULL),(22,1,'menu.confChecklist','ConfiguraÃ§Ã£o de CheckList e Atividades',1,'ListaConfiguracaoChecklist.nicbrain','E',7,NULL),(23,4,'menu.segmento','Segmento',1,'ListaSegmento.nicbrain','E',14,NULL),(24,4,'menu.checklistProcedimento','CheckList e Procedimentos',1,'layout.nicbrain','E',2,NULL),(25,26,'menu.tipoMensagem','Tipo de Mensagem',1,'ListaTipoMensagem.nicbrain','E',5,NULL),(26,4,'menu.outrasTabelas','Outras Tabelas',1,'layout.nicbrain','E',18,NULL),(27,4,'menu.status','Status',1,'ListaStatus.nicbrain','E',15,NULL),(28,4,'menu.pais','PaÃ­s',1,'ListaPais.nicbrain','E',13,NULL),(29,4,'menu.estado','Estado',1,'ListaEstado.nicbrain','E',4,NULL),(30,4,'menu.municipio','MunicÃ­pio',1,'ListaMunicipio.nicbrain','E',12,NULL),(31,5,'menu.cadastroPessoas','Cadastro de Pessoas',1,'ListaPessoa.nicbrain','E',1,NULL),(32,5,'menu.bloqueioPessoas','Bloqueio de Pessoas',1,'ListaBloqueioPessoas.nicbrain','E',2,NULL),(33,5,'menu.cadastroVeiculos','Cadastro de VeÃ­culos',1,'ListaVeiculo.nicbrain','E',3,NULL),(34,5,'menu.bloqueioVeiculos','Bloqueio de VeÃ­culos',1,'ListaBloqueioVeiculos.nicbrain','E',4,NULL),(35,5,'menu.liberarAcesso','Liberar Acesso',1,'LiberarAcesso.nicbrain','E',5,NULL),(36,6,'menu.cadastroOcorrencia','Cadastro de OcorrÃªncia',1,'ListaCadastroOcor.nicbrain','E',1,NULL),(37,6,'menu.listaOcorrencia','OperaÃ§Ã£o de OcorrÃªncias em lista ',1,'ListaOcorrencia.nicbrain','E',2,NULL),(38,8,'menu.cameraAoVivo','CÃ¢meras ao Vivo',1,'ListaCamera.nicbrain','E',1,NULL),(39,8,'menu.recuperarImagem','Recuperar Imagem Gravada',1,'RecuperarImagem.nicbrain','E',2,NULL),(40,9,'menu.cadastroPessoasRastrear','Cadastro de Pessoas para Rastreamento',1,'ListaCadastroPessoaRastrear.nicbrain','E',1,NULL),(41,9,'menu.cadastroVeiculosRastrear','Cadastro de VeÃ­culos para Rastreamento',1,'ListaCadastroVeiculosRastrear.nicbrain','E',2,NULL),(42,82,'menu.osSeguranca','OS de SeguranÃ§a',1,'ListaOSSeguranÃ§a.nicbrain','E',1,NULL),(43,82,'menu.osServico','OS de ServiÃ§o',1,'ListaOSServico.nicbrain','E',2,NULL),(44,82,'menu.osLimpeza','OS de Limpeza',1,'ListaOSLimpeza.nicbrain','E',3,NULL),(45,82,'menu.osRespostasSemelh','OS com Respostas Semelhantes',1,'ListaOSRespSemelhante.nicbrain','E',4,NULL),(46,10,'menu.checklists','RelatÃ³rio de CheckLists',1,'ConsultaChecklist.nicbrain ','E',1,NULL),(47,10,'menu.consultaOcorrencia','RelatÃ³rio de OcorrÃªncias',1,'ConsultaOcorrencia.nicbrain','E',3,NULL),(48,2,'menu.perfilAcesso','Perfil de Acesso',1,'ListaPerfil.nicbrain','E',1,NULL),(49,3,'menu.usuarios','UsuÃ¡rios',1,'ListaUsuarioFuncionario.nicbrain','E',1,NULL),(50,4,'menu.cargo','Cargo',1,'ListaCargo.nicbrain','E',1,NULL),(51,4,'menu.classificacaoOcorrencia','ClassificaÃ§Ã£o OcorrÃªncia',1,'ListaClassificacaoOcorrencia.nicbrain','E',3,NULL),(52,4,'menu.turno','Turno',1,'ListaTurno.nicbrain','E',17,NULL),(53,4,'menu.formulario','FormulÃ¡rio',1,'layout.nicbrain','E',5,NULL),(54,4,'menu.gravidadeOcorrencia','Gravidade OcorrÃªncia',1,'ListaGravidadeOcorrencia.nicbrain','E',7,NULL),(55,4,'menu.grupo','Grupo',1,'ListaGrupo.nicbrain','E',8,NULL),(56,4,'menu.menu','Menu',1,'ListaMenu.nicbrain','E',10,NULL),(57,11,'menu.telefonesUteis','Telefones Ãšteis',1,'TelefoneUtilPagina.nicbrain','E',1,NULL),(58,4,'menu.telefonesUteis','Telefones Uteis',1,'ListaTelefoneUtil.nicbrain','E',16,NULL),(59,26,'menu.tipoEnvio','Tipo de Envio',1,'ListaTipoEnvio.nicbrain','E',2,NULL),(60,26,'menu.tipoEquipamento','Tipo de Equipamento',1,'ListaTipoEquipamento.nicbrain','E',3,NULL),(61,26,'menu.tipoLogradouro','Tipo de Logradouro',1,'ListaTipoLogradouro.nicbrain','E',4,NULL),(62,26,'menu.tipoOcorrencias','Tipo de OcorrÃªncias',1,'ListaTipoOcorrencia.nicbrain','E',6,NULL),(63,26,'menu.tipoPessoa','Tipo de Pessoa',1,'ListaTipoPessoa.nicbrain','E',7,NULL),(64,26,'menu.tipoTelefone','Tipo de Telefone',1,'ListaTipoTelefone.nicbrain','E',9,NULL),(66,6,'menu.visualizarOcorrencias','Visualizar OcorrÃªncias no Mapa ',1,'MapaLocalPorOcorrencia.nicbrain','E',3,NULL),(67,7,'menu.listaChecklist','OperaÃ§Ã£o de Checklist em Lista',1,'ListaEventoPorChecklist.nicbrain','E',1,NULL),(68,7,'menu.visualizarChecklist','Visualizar Checklists no Mapa',1,'MapaLocalPorChecklist.nicbrain','E',2,NULL),(69,26,'menu.tipoServico','Tipo de ServiÃ§o',1,'ListaTipoServico.nicbrain','E',8,NULL),(70,1,'menu.equipamento','Cadastro de Equipamentos',1,'ListaEquipamento.nicbrain','E',8,NULL),(71,24,'menu.checklistPadrao','CheckList PadrÃ£o',1,'ListaChecklistPadrao.nicbrain','E',1,NULL),(72,24,'menu.checklistPadraoOcor',' CheckList PadrÃ£o de OcorrÃªncia ',1,'ListaChecklistOcor.nicbrain','E',2,NULL),(73,24,'menu.procedimento','Procedimento',1,'ListaProcedimento.nicbrain','E',3,NULL),(74,4,'menu.fornecedor','Fornecedor',1,'ListaFornecedor.nicbrain','E',6,NULL),(75,4,'menu.mensagem','Mensagem',1,'ListaMensagem.nicbrain','E',9,NULL),(76,4,'menu.modeloequipto','Modelo Equipamento',1,'ListaModeloEquipamento.nicbrain','E',11,NULL),(77,26,'menu.tipoEndereco','Tipo de EndereÃ§o',1,'ListaTipoEndereco.nicbrain','E',1,NULL),(78,9,'menu.tracarRota','TraÃ§ar Rota para Rastreamento',1,'ListaRota.nicbrain','E',3,NULL),(79,9,'menu.rastreamento','Rastreamento',1,'VisualizarMapaRastreamento.nicbrain','E',2,NULL),(80,79,'menu.rastreamentoRota','Rastreamento por Rota',1,'VisualizaCaminhoMapeado.nicbrain','E',2,NULL),(81,10,'menu.dashboard','Dashboard Checklist',1,'DashboardChecklist.nicbrain','E',2,NULL),(82,10,'menu.orderServico','Ordem de ServiÃ§o',1,'ListaOS.nicbrain','E',5,NULL),(83,53,'menu.pergunta','Pergunta',1,' ListaPergunta.nicbrain','E',2,NULL),(84,53,'menu.topico','TÃ³pico',1,'ListaTopico.nicbrain','E',3,NULL),(85,53,'menu.formulario','FormulÃ¡rio',1,'ListaFormulario.nicbrain','E',1,NULL),(86,79,'menu.rastramentoAleat','Rastreamento AleatÃ³rio',1,'VisualizarCaminhoAleatorio.nicbrain','E',1,NULL),(87,1,'menu.postoservico','Cadastro de Postos de ServiÃ§os',1,'ListaPosto.nicbrain','E',9,NULL),(88,1,'menu.setor','Setor',1,'ListaSetor.nicbrain','E',10,NULL),(89,10,'menu.dashboardocorrencia','Dashboard OcorrÃªncia',1,'DashboardOcorrencia.nicbrain','E',4,NULL),(90,3,'menu.trocasenha','Trocar Senha',1,'TrocarSenha.nicbrain','E',2,NULL),(91,38,'menu.listacamera','Visualizar Lista de CÃ¢meras',1,'ListaCamera.nicbrain','E',1,NULL),(92,38,'menu.mapacamera','Visualizar CÃ¢meras em Mapa',1,'MapaCamera.nicbrain','E',1,NULL),(93,79,'menu.rastreamentochecklist','Rastreamento de Checklist',1,'ListaRastreamentoChecklist.nicbrain','E',2,NULL),(94,4,'menu.genero','GenÃªro',1,'listaGenero.nicbrain','E',19,NULL);
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
INSERT INTO `modelo_equipamento` VALUES (1,'CÃ¢mera de VigilÃ¢ncia Speed Dome','CÃ¢mera de VigilÃ¢ncia Speed Dome',1,NULL,1,1),(2,'CÃ¢mera IP','CÃ¢mera IP',1,NULL,1,1),(3,'Central de Alarme com discadora linha fixa','Central de Alarme com discadora linha fixa',1,NULL,2,1),(4,'Central de Alarme com discadora linha mÃ³vel','Central de Alarme com discadora linha mÃ³vel',1,NULL,2,1);
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
INSERT INTO `municipio` VALUES (1,1,1,'SÃƒO PAULO'),(1,1,2,'SANTO ANDRÃ‰'),(1,2,3,'RIO DE JANEIRO'),(1,3,4,'BELO HORIZONTE'),(1,7,5,'MANAUS'),(1,10,6,'BRASILIA'),(1,15,7,'CUIABÃ'),(1,19,8,'CURITIBA'),(1,9,9,'FORTALEZA'),(1,22,10,'NATAL'),(1,23,11,'PORTO ALEGRE'),(1,20,12,'RECIFE'),(1,8,13,'SALVADOR'),(1,4,14,'ACRELANDIA'),(1,4,15,'ASSIS BRASIL'),(1,4,16,'BRASILEIA'),(1,4,17,'BUJARI'),(1,4,18,'CAPIXABA'),(1,4,19,'CRUZEIRO DO SUL'),(1,4,20,'EPITACIOLANDIA'),(1,4,21,'FEIJO'),(1,4,22,'JORDAO'),(1,4,23,'MANCIO LIMA'),(1,4,24,'MANOEL URBANO'),(1,4,25,'MARECHAL TAUMATURGO'),(1,4,26,'PLACIDO DE CASTRO'),(1,4,27,'PORTO ACRE'),(1,4,28,'PORTO WALTER'),(1,4,29,'RIO BRANCO'),(1,4,30,'RODRIGUES ALVES'),(1,4,31,'SANTA ROSA DO PURUS'),(1,4,32,'SENA MADUREIRA'),(1,4,33,'SENADOR GUIOMARD'),(1,4,34,'TARAUACA'),(1,4,35,'XAPURI'),(1,5,36,'AGUA BRANCA'),(1,5,37,'ANADIA'),(1,5,38,'ARAPIRACA'),(1,5,39,'ATALAIA'),(1,5,40,'BARRA DE SANTO ANTONIO'),(1,5,41,'BARRA DE SAO MIGUEL'),(1,5,42,'BATALHA'),(1,5,43,'BELEM'),(1,5,44,'BELO MONTE'),(1,5,45,'BOCA DA MATA'),(1,5,46,'BRANQUINHA'),(1,5,47,'CACIMBINHAS'),(1,5,48,'CAJUEIRO'),(1,5,49,'CAMPESTRE'),(1,5,50,'CAMPO ALEGRE'),(1,5,51,'CAMPO GRANDE'),(1,5,52,'CANAPI'),(1,5,53,'CAPELA'),(1,5,54,'CARNEIROS'),(1,5,55,'CHA PRETA'),(1,5,56,'COITE DO NOIA'),(1,5,57,'COLONIA LEOPOLDINA'),(1,5,58,'COQUEIRO SECO'),(1,5,59,'CORURIPE'),(1,5,60,'CRAIBAS'),(1,5,61,'DELMIRO GOUVEIA'),(1,5,62,'DOIS RIACHOS'),(1,5,63,'ESTRELA DE ALAGOAS'),(1,5,64,'FEIRA GRANDE'),(1,5,65,'FELIZ DESERTO'),(1,5,66,'FLEXEIRAS'),(1,5,67,'GIRAU DO PONCIANO'),(1,5,68,'IBATEGUARA'),(1,5,69,'IGACI'),(1,5,70,'IGREJA NOVA'),(1,5,71,'INHAPI'),(1,5,72,'JACARE DOS HOMENS'),(1,5,73,'JACUIPE'),(1,5,74,'JAPARATINGA'),(1,5,75,'JARAMATAIA'),(1,5,76,'JEQUIA DA PRAIA'),(1,5,77,'JOAQUIM GOMES'),(1,5,78,'JUNDIA'),(1,5,79,'JUNQUEIRO'),(1,5,80,'LAGOA DA CANOA'),(1,5,81,'LIMOEIRO DE ANADIA'),(1,5,82,'MACEIO'),(1,5,83,'MAJOR ISIDORO'),(1,5,84,'MAR VERMELHO'),(1,5,85,'MARAGOGI'),(1,5,86,'MARAVILHA'),(1,5,87,'MARECHAL DEODORO'),(1,5,88,'MARIBONDO'),(1,5,89,'MATA GRANDE'),(1,5,90,'MATRIZ DE CAMARAGIBE'),(1,5,91,'MESSIAS'),(1,5,92,'MINADOR DO NEGRAO'),(1,5,93,'MONTEIROPOLIS'),(1,5,94,'MURICI'),(1,5,95,'NOVO LINO'),(1,5,96,'OLHO DAGUA DAS FLORES'),(1,5,97,'OLHO DAGUA DO CASADO'),(1,5,98,'OLHO DAGUA GRANDE'),(1,5,99,'OLIVENCA'),(1,5,100,'OURO BRANCO'),(1,5,101,'PALESTINA'),(1,5,102,'PALMEIRA DOS INDIOS'),(1,5,103,'PAO DE ACUCAR'),(1,5,104,'PARICONHA'),(1,5,105,'PARIPUEIRA'),(1,5,106,'PASSO DE CAMARAGIBE'),(1,5,107,'PAULO JACINTO'),(1,5,108,'PENEDO'),(1,5,109,'PIACABUCU'),(1,5,110,'PILAR'),(1,5,111,'PINDOBA'),(1,5,112,'PIRANHAS'),(1,5,113,'POCO DAS TRINCHEIRAS'),(1,5,114,'PORTO CALVO'),(1,5,115,'PORTO DE PEDRAS'),(1,5,116,'PORTO REAL DO COLEGIO'),(1,5,117,'QUEBRANGULO'),(1,5,118,'RIO LARGO'),(1,5,119,'ROTEIRO'),(1,5,120,'SANTA LUZIA DO NORTE'),(1,5,121,'SANTANA DO IPANEMA'),(1,5,122,'SANTANA DO MUNDAU'),(1,5,123,'SAO BRAS'),(1,5,124,'SAO JOSE DA LAJE'),(1,5,125,'SAO JOSE DA TAPERA'),(1,5,126,'SAO LUIS DO QUITUNDE'),(1,5,127,'SAO MIGUEL DOS CAMPOS'),(1,5,128,'SAO MIGUEL DOS MILAGRES'),(1,5,129,'SAO SEBASTIAO'),(1,5,130,'SATUBA'),(1,5,131,'SENADOR RUI PALMEIRA'),(1,5,132,'TANQUE DARCA'),(1,5,133,'TAQUARANA'),(1,5,134,'TEOTONIO VILELA'),(1,5,135,'TRAIPU'),(1,5,136,'UNIAO DOS PALMARES'),(1,5,137,'VICOSA'),(1,7,138,'ALVARAES'),(1,7,139,'AMATURA'),(1,7,140,'ANAMA'),(1,7,141,'ANORI'),(1,7,142,'APUI'),(1,7,143,'ATALAIA DO NORTE'),(1,7,144,'AUTAZES'),(1,7,145,'BARCELOS'),(1,7,146,'BARREIRINHA'),(1,7,147,'BENJAMIN CONSTANT'),(1,7,148,'BERURI'),(1,7,149,'BOA VISTA DO RAMOS'),(1,7,150,'BOCA DO ACRE'),(1,7,151,'BORBA'),(1,7,152,'CAAPIRANGA'),(1,7,153,'CANUTAMA'),(1,7,154,'CARAUARI'),(1,7,155,'CAREIRO'),(1,7,156,'CAREIRO DA VARZEA'),(1,7,157,'COARI'),(1,7,158,'CODAJAS'),(1,7,159,'EIRUNEPE'),(1,7,160,'ENVIRA'),(1,7,161,'FONTE BOA'),(1,7,162,'GUAJARA'),(1,7,163,'HUMAITA'),(1,7,164,'IPIXUNA'),(1,7,165,'IRANDUBA'),(1,7,166,'ITACOATIARA'),(1,7,167,'ITAMARATI'),(1,7,168,'ITAPIRANGA'),(1,7,169,'JAPURA'),(1,7,170,'JURUA'),(1,7,171,'JUTAI'),(1,7,172,'LABREA'),(1,7,173,'MANACAPURU'),(1,7,174,'MANAQUIRI'),(1,7,175,'MANICORE'),(1,7,176,'MARAA'),(1,7,177,'MAUES'),(1,7,178,'NHAMUNDA'),(1,7,179,'NOVA OLINDA DO NORTE'),(1,7,180,'NOVO AIRAO'),(1,7,181,'NOVO ARIPUANA'),(1,7,182,'PARINTINS'),(1,7,183,'PAUINI'),(1,7,184,'PRESIDENTE FIGUEIREDO'),(1,7,185,'RIO PRETO DA EVA'),(1,7,186,'SANTA ISABEL DO RIO NEGRO'),(1,7,187,'SANTO ANTONIO DO ICA'),(1,7,188,'SAO GABRIEL DA CACHOEIRA'),(1,7,189,'SAO PAULO DE OLIVENCA'),(1,7,190,'SAO SEBASTIAO DO UATUMA'),(1,7,191,'SILVES'),(1,7,192,'TABATINGA'),(1,7,193,'TAPAUA'),(1,7,194,'TEFE'),(1,7,195,'TONANTINS'),(1,7,196,'UARINI'),(1,7,197,'URUCARA'),(1,7,198,'URUCURITUBA'),(1,6,199,'AMAPA(MUNICIPIO)'),(1,6,200,'CALCOENE'),(1,6,201,'CUTIAS'),(1,6,202,'FERREIRA GOMES'),(1,6,203,'ITAUBAL'),(1,6,204,'LARANJAL DO JARI'),(1,6,205,'MACAPA'),(1,6,206,'MAZAGAO'),(1,6,207,'OIAPOQUE'),(1,6,208,'PEDRA BRANCA DO AMAPARI'),(1,6,209,'PORTO GRANDE'),(1,6,210,'PRACUUBA'),(1,6,211,'SANTANA'),(1,6,212,'SERRA DO NAVIO'),(1,6,213,'TARTARUGALZINHO'),(1,6,214,'VITORIA DO JARI'),(1,8,215,'ABAIRA'),(1,8,216,'ABARE'),(1,8,217,'ACAJUTIBA'),(1,8,218,'ADUSTINA'),(1,8,219,'AGUA FRIA'),(1,8,220,'AIQUARA'),(1,8,221,'ALAGOINHAS'),(1,8,222,'ALCOBACA'),(1,8,223,'ALMADINA'),(1,8,224,'AMARGOSA'),(1,8,225,'AMELIA RODRIGUES'),(1,8,226,'AMERICA DOURADA'),(1,8,227,'ANAGE'),(1,8,228,'ANDARAI'),(1,8,229,'ANDORINHA'),(1,8,230,'ANGICAL'),(1,8,231,'ANGUERA'),(1,8,232,'ANTAS'),(1,8,233,'ANTONIO CARDOSO'),(1,8,234,'ANTONIO GONCALVES'),(1,8,235,'APORA'),(1,8,236,'APUAREMA'),(1,8,237,'ARACAS'),(1,8,238,'ARACATU'),(1,8,239,'ARACI'),(1,8,240,'ARAMARI'),(1,8,241,'ARATACA'),(1,8,242,'ARATUIPE'),(1,8,243,'AURELINO LEAL'),(1,8,244,'BAIANOPOLIS'),(1,8,245,'BAIXA GRANDE'),(1,8,246,'BANZAE'),(1,8,247,'BARRA'),(1,8,248,'BARRA DA ESTIVA'),(1,8,249,'BARRA DO CHOCA'),(1,8,250,'BARRA DO MENDES'),(1,8,251,'BARRA DO ROCHA'),(1,8,252,'BARREIRAS'),(1,8,253,'BARRO ALTO'),(1,8,254,'BARROCAS'),(1,8,255,'BELMONTE'),(1,8,256,'BELO CAMPO'),(1,8,257,'BIRITINGA'),(1,8,258,'BOA NOVA'),(1,8,259,'BOA VISTA DO TUPIM'),(1,8,260,'BOM JESUS DA LAPA'),(1,8,261,'BOM JESUS DA SERRA'),(1,8,262,'BONINAL'),(1,8,263,'BONITO'),(1,8,264,'BOQUIRA'),(1,8,265,'BOTUPORA'),(1,8,266,'BREJOES'),(1,8,267,'BREJOLANDIA'),(1,8,268,'BROTAS DE MACAUBAS'),(1,8,269,'BRUMADO'),(1,8,270,'BUERAREMA'),(1,8,271,'BURITIRAMA'),(1,8,272,'CAATIBA'),(1,8,273,'CABACEIRAS DO PARAGUACU'),(1,8,274,'CACHOEIRA'),(1,8,275,'CACULE'),(1,8,276,'CAEM'),(1,8,277,'CAETANOS'),(1,8,278,'CAETITE'),(1,8,279,'CAFARNAUM'),(1,8,280,'CAIRU'),(1,8,281,'CALDEIRAO GRANDE'),(1,8,282,'CAMACAN'),(1,8,283,'CAMACARI'),(1,8,284,'CAMAMU'),(1,8,285,'CAMPO ALEGRE DE LOURDES'),(1,8,286,'CAMPO FORMOSO'),(1,8,287,'CANAPOLIS'),(1,8,288,'CANARANA'),(1,8,289,'CANAVIEIRAS'),(1,8,290,'CANDEAL'),(1,8,291,'CANDEIAS'),(1,8,292,'CANDIBA'),(1,8,293,'CANDIDO SALES'),(1,8,294,'CANSANCAO'),(1,8,295,'CANUDOS'),(1,8,296,'CAPELA DO ALTO ALEGRE'),(1,8,297,'CAPIM GROSSO'),(1,8,298,'CARAIBAS'),(1,8,299,'CARAVELAS'),(1,8,300,'CARDEAL DA SILVA'),(1,8,301,'CARINHANHA'),(1,8,302,'CASA NOVA'),(1,8,303,'CASTRO ALVES'),(1,8,304,'CATOLANDIA'),(1,8,305,'CATU'),(1,8,306,'CATURAMA'),(1,8,307,'CENTRAL'),(1,8,308,'CHORROCHO'),(1,8,309,'CICERO DANTAS'),(1,8,310,'CIPO'),(1,8,311,'COARACI'),(1,8,312,'COCOS'),(1,8,313,'CONCEICAO DA FEIRA'),(1,8,314,'CONCEICAO DO ALMEIDA'),(1,8,315,'CONCEICAO DO COITE'),(1,8,316,'CONCEICAO DO JACUIPE'),(1,8,317,'CONDE'),(1,8,318,'CONDEUBA'),(1,8,319,'CONTENDAS DO SINCORA'),(1,8,320,'CORACAO DE MARIA'),(1,8,321,'CORDEIROS'),(1,8,322,'CORIBE'),(1,8,323,'CORONEL JOAO SA'),(1,8,324,'CORRENTINA'),(1,8,325,'COTEGIPE'),(1,8,326,'CRAVOLANDIA'),(1,8,327,'CRISOPOLIS'),(1,8,328,'CRISTOPOLIS'),(1,8,329,'CRUZ DAS ALMAS'),(1,8,330,'CURACA'),(1,8,331,'DARIO MEIRA'),(1,8,332,'DIAS DAVILA'),(1,8,333,'DOM BASILIO'),(1,8,334,'DOM MACEDO COSTA'),(1,8,335,'ELISIO MEDRADO'),(1,8,336,'ENCRUZILHADA'),(1,8,337,'ENTRE RIOS'),(1,8,338,'ERICO CARDOSO'),(1,8,339,'ESPLANADA'),(1,8,340,'EUCLIDES DA CUNHA'),(1,8,341,'EUNAPOLIS'),(1,8,342,'FATIMA'),(1,8,343,'FEIRA DA MATA'),(1,8,344,'FEIRA DE SANTANA'),(1,8,345,'FILADELFIA'),(1,8,346,'FIRMINO ALVES'),(1,8,347,'FLORESTA AZUL'),(1,8,348,'FORMOSA DO RIO PRETO'),(1,8,349,'GANDU'),(1,8,350,'GAVIAO'),(1,8,351,'GENTIO DO OURO'),(1,8,352,'GLORIA'),(1,8,353,'GONGOGI'),(1,8,354,'GOVERNADOR LOMANTO JUNIOR'),(1,8,355,'GOVERNADOR MANGABEIRA'),(1,8,356,'GUAJERU'),(1,8,357,'GUANAMBI'),(1,8,358,'GUARATINGA'),(1,8,359,'HELIOPOLIS'),(1,8,360,'IACU'),(1,8,361,'IBIASSUCE'),(1,8,362,'IBICARAI'),(1,8,363,'IBICOARA'),(1,8,364,'IBICUI'),(1,8,365,'IBIPEBA'),(1,8,366,'IBIPITANGA'),(1,8,367,'IBIQUERA'),(1,8,368,'IBIRAPITANGA'),(1,8,369,'IBIRAPUA'),(1,8,370,'IBIRATAIA'),(1,8,371,'IBITIARA'),(1,8,372,'IBITITA'),(1,8,373,'IBOTIRAMA'),(1,8,374,'ICHU'),(1,8,375,'IGAPORA'),(1,8,376,'IGRAPIUNA'),(1,8,377,'IGUAI'),(1,8,378,'ILHEUS'),(1,8,379,'INHAMBUPE'),(1,8,380,'IPECAETA'),(1,8,381,'IPIAU'),(1,8,382,'IPIRA'),(1,8,383,'IPUPIARA'),(1,8,384,'IRAJUBA'),(1,8,385,'IRAMAIA'),(1,8,386,'IRAQUARA'),(1,8,387,'IRARA'),(1,8,388,'IRECE'),(1,8,389,'ITABELA'),(1,8,390,'ITABERABA'),(1,8,391,'ITABUNA'),(1,8,392,'ITACARE'),(1,8,393,'ITAETE'),(1,8,394,'ITAGI'),(1,8,395,'ITAGIBA'),(1,8,396,'ITAGIMIRIM'),(1,8,397,'ITAGUACU DA BAHIA'),(1,8,398,'ITAJU DO COLONIA'),(1,8,399,'ITAJUIPE'),(1,8,400,'ITAMARAJU'),(1,8,401,'ITAMARI'),(1,8,402,'ITAMBE'),(1,8,403,'ITANAGRA'),(1,8,404,'ITANHEM'),(1,8,405,'ITAPARICA'),(1,8,406,'ITAPE'),(1,8,407,'ITAPEBI'),(1,8,408,'ITAPETINGA'),(1,8,409,'ITAPICURU'),(1,8,410,'ITAPITANGA'),(1,8,411,'ITAQUARA'),(1,8,412,'ITARANTIM'),(1,8,413,'ITATIM'),(1,8,414,'ITIRUCU'),(1,8,415,'ITIUBA'),(1,8,416,'ITORORO'),(1,8,417,'ITUACU'),(1,8,418,'ITUBERA'),(1,8,419,'IUIU'),(1,8,420,'JABORANDI'),(1,8,421,'JACARACI'),(1,8,422,'JACOBINA'),(1,8,423,'JAGUAQUARA'),(1,8,424,'JAGUARARI'),(1,8,425,'JAGUARIPE'),(1,8,426,'JANDAIRA'),(1,8,427,'JEQUIE'),(1,8,428,'JEREMOABO'),(1,8,429,'JIQUIRICA'),(1,8,430,'JITAUNA'),(1,8,431,'JOAO DOURADO'),(1,8,432,'JUAZEIRO'),(1,8,433,'JUCURUCU'),(1,8,434,'JUSSARA'),(1,8,435,'JUSSARI'),(1,8,436,'JUSSIAPE'),(1,8,437,'LAFAIETE COUTINHO'),(1,8,438,'LAGOA REAL'),(1,8,439,'LAJE'),(1,8,440,'LAJEDAO'),(1,8,441,'LAJEDINHO'),(1,8,442,'LAJEDO DO TABOCAL'),(1,8,443,'LAMARAO'),(1,8,444,'LAPAO'),(1,8,445,'LAURO DE FREITAS'),(1,8,446,'LENCOIS'),(1,8,447,'LICINIO DE ALMEIDA'),(1,8,448,'LIVRAMENTO DE NOSSA SENHORA'),(1,8,449,'LUIS EDUARDO MAGALHAES'),(1,8,450,'MACAJUBA'),(1,8,451,'MACARANI'),(1,8,452,'MACAUBAS'),(1,8,453,'MACURURE'),(1,8,454,'MADRE DE DEUS'),(1,8,455,'MAETINGA'),(1,8,456,'MAIQUINIQUE'),(1,8,457,'MAIRI'),(1,8,458,'MALHADA'),(1,8,459,'MALHADA DE PEDRAS'),(1,8,460,'MANOEL VITORINO'),(1,8,461,'MANSIDAO'),(1,8,462,'MARACAS'),(1,8,463,'MARAGOGIPE'),(1,8,464,'MARAU'),(1,8,465,'MARCIONILIO SOUZA'),(1,8,466,'MASCOTE'),(1,8,467,'MATA DE SAO JOAO'),(1,8,468,'MATINA'),(1,8,469,'MEDEIROS NETO'),(1,8,470,'MIGUEL CALMON'),(1,8,471,'MILAGRES'),(1,8,472,'MIRANGABA'),(1,8,473,'MIRANTE'),(1,8,474,'MONTE SANTO'),(1,8,475,'MORPARA'),(1,8,476,'MORRO DO CHAPEU'),(1,8,477,'MORTUGABA'),(1,8,478,'MUCUGE'),(1,8,479,'MUCURI'),(1,8,480,'MULUNGU DO MORRO'),(1,8,481,'MUNDO NOVO'),(1,8,482,'MUNIZ FERREIRA'),(1,8,483,'MUQUEM DO SAO FRANCISCO'),(1,8,484,'MURITIBA'),(1,8,485,'MUTUIPE'),(1,8,486,'NAZARE'),(1,8,487,'NILO PECANHA'),(1,8,488,'NORDESTINA'),(1,8,489,'NOVA CANAA'),(1,8,490,'NOVA FATIMA'),(1,8,491,'NOVA IBIA'),(1,8,492,'NOVA ITARANA'),(1,8,493,'NOVA REDENCAO'),(1,8,494,'NOVA SOURE'),(1,8,495,'NOVA VICOSA'),(1,8,496,'NOVO HORIZONTE'),(1,8,497,'NOVO TRIUNFO'),(1,8,498,'OLINDINA'),(1,8,499,'OLIVEIRA DOS BREJINHOS'),(1,8,500,'OURICANGAS'),(1,8,501,'OUROLANDIA'),(1,8,502,'PALMAS DE MONTE ALTO'),(1,8,503,'PALMEIRAS'),(1,8,504,'PARAMIRIM'),(1,8,505,'PARATINGA'),(1,8,506,'PARIPIRANGA'),(1,8,507,'PAU BRASIL'),(1,8,508,'PAULO AFONSO'),(1,8,509,'PE DE SERRA'),(1,8,510,'PEDRAO'),(1,8,511,'PEDRO ALEXANDRE'),(1,8,512,'PIATA'),(1,8,513,'PILAO ARCADO'),(1,8,514,'PINDAI'),(1,8,515,'PINDOBACU'),(1,8,516,'PINTADAS'),(1,8,517,'PIRAI DO NORTE'),(1,8,518,'PIRIPA'),(1,8,519,'PIRITIBA'),(1,8,520,'PLANALTINO'),(1,8,521,'PLANALTO'),(1,8,522,'POCOES'),(1,8,523,'POJUCA'),(1,8,524,'PONTO NOVO'),(1,8,525,'PORTO SEGURO'),(1,8,526,'POTIRAGUA'),(1,8,527,'PRADO'),(1,8,528,'PRESIDENTE DUTRA'),(1,8,529,'PRESIDENTE JANIO QUADROS'),(1,8,530,'PRESIDENTE TANCREDO NEVES'),(1,8,531,'QUEIMADAS'),(1,8,532,'QUIJINGUE'),(1,8,533,'QUIXABEIRA'),(1,8,534,'RAFAEL JAMBEIRO'),(1,8,535,'REMANSO'),(1,8,536,'RETIROLANDIA'),(1,8,537,'RIACHAO DAS NEVES'),(1,8,538,'RIACHAO DO JACUIPE'),(1,8,539,'RIACHO DE SANTANA'),(1,8,540,'RIBEIRA DO AMPARO'),(1,8,541,'RIBEIRA DO POMBAL'),(1,8,542,'RIBEIRAO DO LARGO'),(1,8,543,'RIO DE CONTAS'),(1,8,544,'RIO DO ANTONIO'),(1,8,545,'RIO DO PIRES'),(1,8,546,'RIO REAL'),(1,8,547,'RODELAS'),(1,8,548,'RUY BARBOSA'),(1,8,549,'SALINAS DA MARGARIDA'),(1,8,550,'SANTA BARBARA'),(1,8,551,'SANTA BRIGIDA'),(1,8,552,'SANTA CRUZ CABRALIA'),(1,8,553,'SANTA CRUZ DA VITORIA'),(1,8,554,'SANTA INES'),(1,8,555,'SANTA LUZIA'),(1,8,556,'SANTA MARIA DA VITORIA'),(1,8,557,'SANTA RITA DE CASSIA'),(1,8,558,'SANTA TERESINHA'),(1,8,559,'SANTALUZ'),(1,8,560,'SANTANA'),(1,8,561,'SANTANOPOLIS'),(1,8,562,'SANTO AMARO'),(1,8,563,'SANTO ANTONIO DE JESUS'),(1,8,564,'SANTO ESTEVAO'),(1,8,565,'SAO DESIDERIO'),(1,8,566,'SAO DOMINGOS'),(1,8,567,'SAO FELIPE'),(1,8,568,'SAO FELIX'),(1,8,569,'SAO FELIX DO CORIBE'),(1,8,570,'SAO FRANCISCO DO CONDE'),(1,8,571,'SAO GABRIEL'),(1,8,572,'SAO GONCALO DOS CAMPOS'),(1,8,573,'SAO JOSE DA VITORIA'),(1,8,574,'SAO JOSE DO JACUIPE'),(1,8,575,'SAO MIGUEL DAS MATAS'),(1,8,576,'SAO SEBASTIAO DO PASSE'),(1,8,577,'SAPEACU'),(1,8,578,'SATIRO DIAS'),(1,8,579,'SAUBARA'),(1,8,580,'SAUDE'),(1,8,581,'SEABRA'),(1,8,582,'SEBASTIAO LARANJEIRAS'),(1,8,583,'SENHOR DO BONFIM'),(1,8,584,'SENTO SE'),(1,8,585,'SERRA DO RAMALHO'),(1,8,586,'SERRA DOURADA'),(1,8,587,'SERRA PRETA'),(1,8,588,'SERRINHA'),(1,8,589,'SERROLANDIA'),(1,8,590,'SIMOES FILHO'),(1,8,591,'SITIO DO MATO'),(1,8,592,'SITIO DO QUINTO'),(1,8,593,'SOBRADINHO'),(1,8,594,'SOUTO SOARES'),(1,8,595,'TABOCAS DO BREJO VELHO'),(1,8,596,'TANHACU'),(1,8,597,'TANQUE NOVO'),(1,8,598,'TANQUINHO'),(1,8,599,'TAPEROA'),(1,8,600,'TAPIRAMUTA'),(1,8,601,'TEIXEIRA DE FREITAS'),(1,8,602,'TEODORO SAMPAIO'),(1,8,603,'TEOFILANDIA'),(1,8,604,'TEOLANDIA'),(1,8,605,'TERRA NOVA'),(1,8,606,'TREMEDAL'),(1,8,607,'TUCANO'),(1,8,608,'UAUA'),(1,8,609,'UBAIRA'),(1,8,610,'UBAITABA'),(1,8,611,'UBATA'),(1,8,612,'UIBAI'),(1,8,613,'UMBURANAS'),(1,8,614,'UNA'),(1,8,615,'URANDI'),(1,8,616,'URUCUCA'),(1,8,617,'UTINGA'),(1,8,618,'VALENCA'),(1,8,619,'VALENTE'),(1,8,620,'VARZEA DA ROCA'),(1,8,621,'VARZEA DO POCO'),(1,8,622,'VARZEA NOVA'),(1,8,623,'VARZEDO'),(1,8,624,'VERA CRUZ'),(1,8,625,'VEREDA'),(1,8,626,'VITORIA DA CONQUISTA'),(1,8,627,'WAGNER'),(1,8,628,'WANDERLEY'),(1,8,629,'WENCESLAU GUIMARAES'),(1,8,630,'XIQUE-XIQUE'),(1,9,631,'ABAIARA'),(1,9,632,'ACARAPE'),(1,9,633,'ACARAU'),(1,9,634,'ACOPIARA'),(1,9,635,'AIUABA'),(1,9,636,'ALCANTARAS'),(1,9,637,'ALTANEIRA'),(1,9,638,'ALTO SANTO'),(1,9,639,'AMONTADA'),(1,9,640,'ANTONINA DO NORTE'),(1,9,641,'APUIARES'),(1,9,642,'AQUIRAZ'),(1,9,643,'ARACATI'),(1,9,644,'ARACOIABA'),(1,9,645,'ARARENDA'),(1,9,646,'ARARIPE'),(1,9,647,'ARATUBA'),(1,9,648,'ARNEIROZ'),(1,9,649,'ASSARE'),(1,9,650,'AURORA'),(1,9,651,'BAIXIO'),(1,9,652,'BANABUIU'),(1,9,653,'BARBALHA'),(1,9,654,'BARREIRA'),(1,9,655,'BARRO'),(1,9,656,'BARROQUINHA'),(1,9,657,'BATURITE'),(1,9,658,'BEBERIBE'),(1,9,659,'BELA CRUZ'),(1,9,660,'BOA VIAGEM'),(1,9,661,'BREJO SANTO'),(1,9,662,'CAMOCIM'),(1,9,663,'CAMPOS SALES'),(1,9,664,'CANINDE'),(1,9,665,'CAPISTRANO'),(1,9,666,'CARIDADE'),(1,9,667,'CARIRE'),(1,9,668,'CARIRIACU'),(1,9,669,'CARIUS'),(1,9,670,'CARNAUBAL'),(1,9,671,'CASCAVEL'),(1,9,672,'CATARINA'),(1,9,673,'CATUNDA'),(1,9,674,'CAUCAIA'),(1,9,675,'CEDRO'),(1,9,676,'CHAVAL'),(1,9,677,'CHORO'),(1,9,678,'CHOROZINHO'),(1,9,679,'COREAU'),(1,9,680,'CRATEUS'),(1,9,681,'CRATO'),(1,9,682,'CROATA'),(1,9,683,'CRUZ'),(1,9,684,'DEPUTADO IRAPUAN PINHEIRO'),(1,9,685,'ERERE'),(1,9,686,'EUSEBIO'),(1,9,687,'FARIAS BRITO'),(1,9,688,'FORQUILHA'),(1,9,689,'FORTIM'),(1,9,690,'FRECHEIRINHA'),(1,9,691,'GENERAL SAMPAIO'),(1,9,692,'GRACA'),(1,9,693,'GRANJA'),(1,9,694,'GRANJEIRO'),(1,9,695,'GROAIRAS'),(1,9,696,'GUAIUBA'),(1,9,697,'GUARACIABA DO NORTE'),(1,9,698,'GUARAMIRANGA'),(1,9,699,'HIDROLANDIA'),(1,9,700,'HORIZONTE'),(1,9,701,'IBARETAMA'),(1,9,702,'IBIAPINA'),(1,9,703,'IBICUITINGA'),(1,9,704,'ICAPUI'),(1,9,705,'ICO'),(1,9,706,'IGUATU'),(1,9,707,'INDEPENDENCIA'),(1,9,708,'IPAPORANGA'),(1,9,709,'IPAUMIRIM'),(1,9,710,'IPU'),(1,9,711,'IPUEIRAS'),(1,9,712,'IRACEMA'),(1,9,713,'IRAUCUBA'),(1,9,714,'ITAICABA'),(1,9,715,'ITAITINGA'),(1,9,716,'ITAPAGE'),(1,9,717,'ITAPIPOCA'),(1,9,718,'ITAPIUNA'),(1,9,719,'ITAREMA'),(1,9,720,'ITATIRA'),(1,9,721,'JAGUARETAMA'),(1,9,722,'JAGUARIBARA'),(1,9,723,'JAGUARIBE'),(1,9,724,'JAGUARUANA'),(1,9,725,'JARDIM'),(1,9,726,'JATI'),(1,9,727,'JIJOCA DE JERICOACOARA'),(1,9,728,'JUAZEIRO DO NORTE'),(1,9,729,'JUCAS'),(1,9,730,'LAVRAS DA MANGABEIRA'),(1,9,731,'LIMOEIRO DO NORTE'),(1,9,732,'MADALENA'),(1,9,733,'MARACANAU'),(1,9,734,'MARANGUAPE'),(1,9,735,'MARCO'),(1,9,736,'MARTINOPOLE'),(1,9,737,'MASSAPE'),(1,9,738,'MAURITI'),(1,9,739,'MERUOCA'),(1,9,740,'MILAGRES'),(1,9,741,'MILHA'),(1,9,742,'MIRAIMA'),(1,9,743,'MISSAO VELHA'),(1,9,744,'MOMBACA'),(1,9,745,'MONSENHOR TABOSA'),(1,9,746,'MORADA NOVA'),(1,9,747,'MORAUJO'),(1,9,748,'MORRINHOS'),(1,9,749,'MUCAMBO'),(1,9,750,'MULUNGU'),(1,9,751,'NOVA OLINDA'),(1,9,752,'NOVA RUSSAS'),(1,9,753,'NOVO ORIENTE'),(1,9,754,'OCARA'),(1,9,755,'OROS'),(1,9,756,'PACAJUS'),(1,9,757,'PACATUBA'),(1,9,758,'PACOTI'),(1,9,759,'PACUJA'),(1,9,760,'PALHANO'),(1,9,761,'PALMACIA'),(1,9,762,'PARACURU'),(1,9,763,'PARAIPABA'),(1,9,764,'PARAMBU'),(1,9,765,'PARAMOTI'),(1,9,766,'PEDRA BRANCA'),(1,9,767,'PENAFORTE'),(1,9,768,'PENTECOSTE'),(1,9,769,'PEREIRO'),(1,9,770,'PINDORETAMA'),(1,9,771,'PIQUET CARNEIRO'),(1,9,772,'PIRES FERREIRA'),(1,9,773,'PORANGA'),(1,9,774,'PORTEIRAS'),(1,9,775,'POTENGI'),(1,9,776,'POTIRETAMA'),(1,9,777,'QUITERIANOPOLIS'),(1,9,778,'QUIXADA'),(1,9,779,'QUIXELO'),(1,9,780,'QUIXERAMOBIM'),(1,9,781,'QUIXERE'),(1,9,782,'REDENCAO'),(1,9,783,'RERIUTABA'),(1,9,784,'RUSSAS'),(1,9,785,'SABOEIRO'),(1,9,786,'SALITRE'),(1,9,787,'SANTA QUITERIA'),(1,9,788,'SANTANA DO ACARAU'),(1,9,789,'SANTANA DO CARIRI'),(1,9,790,'SAO BENEDITO'),(1,9,791,'SAO GONCALO DO AMARANTE'),(1,9,792,'SAO JOAO DO JAGUARIBE'),(1,9,793,'SAO LUIS DO CURU'),(1,9,794,'SENADOR POMPEU'),(1,9,795,'SENADOR SA'),(1,9,796,'SOBRAL'),(1,9,797,'SOLONOPOLE'),(1,9,798,'TABULEIRO DO NORTE'),(1,9,799,'TAMBORIL'),(1,9,800,'TARRAFAS'),(1,9,801,'TAUA'),(1,9,802,'TEJUCUOCA'),(1,9,803,'TIANGUA'),(1,9,804,'TRAIRI'),(1,9,805,'TURURU'),(1,9,806,'UBAJARA'),(1,9,807,'UMARI'),(1,9,808,'UMIRIM'),(1,9,809,'URUBURETAMA'),(1,9,810,'URUOCA'),(1,9,811,'VARJOTA'),(1,9,812,'VARZEA ALEGRE'),(1,9,813,'VICOSA DO CEARA'),(1,11,814,'AFONSO CLAUDIO'),(1,11,815,'AGUA DOCE DO NORTE'),(1,11,816,'AGUIA BRANCA'),(1,11,817,'ALEGRE'),(1,11,818,'ALFREDO CHAVES'),(1,11,819,'ALTO RIO NOVO'),(1,11,820,'ANCHIETA'),(1,11,821,'APIACA'),(1,11,822,'ARACRUZ'),(1,11,823,'ATILIO VIVACQUA'),(1,11,824,'BAIXO GUANDU'),(1,11,825,'BARRA DE SAO FRANCISCO'),(1,11,826,'BOA ESPERANCA'),(1,11,827,'BOM JESUS DO NORTE'),(1,11,828,'BREJETUBA'),(1,11,829,'CACHOEIRO DE ITAPEMIRIM'),(1,11,830,'CARIACICA'),(1,11,831,'CASTELO'),(1,11,832,'COLATINA'),(1,11,833,'CONCEICAO DA BARRA'),(1,11,834,'CONCEICAO DO CASTELO'),(1,11,835,'DIVINO DE SAO LOURENCO'),(1,11,836,'DOMINGOS MARTINS'),(1,11,837,'DORES DO RIO PRETO'),(1,11,838,'ECOPORANGA'),(1,11,839,'FUNDAO'),(1,11,840,'GOVERNADOR LINDENBERG'),(1,11,841,'GUACUI'),(1,11,842,'GUARAPARI'),(1,11,843,'IBATIBA'),(1,11,844,'IBIRACU'),(1,11,845,'IBITIRAMA'),(1,11,846,'ICONHA'),(1,11,847,'IRUPI'),(1,11,848,'ITAGUACU'),(1,11,849,'ITAPEMIRIM'),(1,11,850,'ITARANA'),(1,11,851,'IUNA'),(1,11,852,'JAGUARE'),(1,11,853,'JERONIMO MONTEIRO'),(1,11,854,'JOAO NEIVA'),(1,11,855,'LARANJA DA TERRA'),(1,11,856,'LINHARES'),(1,11,857,'MANTENOPOLIS'),(1,11,858,'MARATAIZES'),(1,11,859,'MARECHAL FLORIANO'),(1,11,860,'MARILANDIA'),(1,11,861,'MIMOSO DO SUL'),(1,11,862,'MONTANHA'),(1,11,863,'MUCURICI'),(1,11,864,'MUNIZ FREIRE'),(1,11,865,'MUQUI'),(1,11,866,'NOVA VENECIA'),(1,11,867,'PANCAS'),(1,11,868,'PEDRO CANARIO'),(1,11,869,'PINHEIROS'),(1,11,870,'PIUMA'),(1,11,871,'PONTO BELO'),(1,11,872,'PRESIDENTE KENNEDY'),(1,11,873,'RIO BANANAL'),(1,11,874,'RIO NOVO DO SUL'),(1,11,875,'SANTA LEOPOLDINA'),(1,11,876,'SANTA MARIA DE JETIBA'),(1,11,877,'SANTA TERESA'),(1,11,878,'SAO DOMINGOS DO NORTE'),(1,11,879,'SAO GABRIEL DA PALHA'),(1,11,880,'SAO JOSE DO CALCADO'),(1,11,881,'SAO MATEUS'),(1,11,882,'SAO ROQUE DO CANAA'),(1,11,883,'SERRA'),(1,11,884,'SOORETAMA'),(1,11,885,'VARGEM ALTA'),(1,11,886,'VENDA NOVA DO IMIGRANTE'),(1,11,887,'VIANA'),(1,11,888,'VILA PAVAO'),(1,11,889,'VILA VALERIO'),(1,11,890,'VILA VELHA'),(1,11,891,'VITORIA'),(1,12,892,'ABADIA DE GOIAS'),(1,12,893,'ABADIANIA'),(1,12,894,'ACREUNA'),(1,12,895,'ADELANDIA'),(1,12,896,'AGUA FRIA DE GOIAS'),(1,12,897,'AGUA LIMPA'),(1,12,898,'AGUAS LINDAS DE GOIAS'),(1,12,899,'ALEXANIA'),(1,12,900,'ALOANDIA'),(1,12,901,'ALTO HORIZONTE'),(1,12,902,'ALTO PARAISO DE GOIAS'),(1,12,903,'ALVORADA DO NORTE'),(1,12,904,'AMARALINA'),(1,12,905,'AMERICANO DO BRASIL'),(1,12,906,'AMORINOPOLIS'),(1,12,907,'ANAPOLIS'),(1,12,908,'ANHANGUERA'),(1,12,909,'ANICUNS'),(1,12,910,'APARECIDA DE GOIANIA'),(1,12,911,'APARECIDA DO RIO DOCE'),(1,12,912,'APORE'),(1,12,913,'ARACU'),(1,12,914,'ARAGARCAS'),(1,12,915,'ARAGOIANIA'),(1,12,916,'ARAGUAPAZ'),(1,12,917,'ARENOPOLIS'),(1,12,918,'ARUANA'),(1,12,919,'AURILANDIA'),(1,12,920,'AVELINOPOLIS'),(1,12,921,'BALIZA'),(1,12,922,'BARRO ALTO'),(1,12,923,'BELA VISTA DE GOIAS'),(1,12,924,'BOM JARDIM DE GOIAS'),(1,12,925,'BOM JESUS DE GOIAS'),(1,12,926,'BONFINOPOLIS'),(1,12,927,'BONOPOLIS'),(1,12,928,'BRAZABRANTES'),(1,12,929,'BRITANIA'),(1,12,930,'BURITI ALEGRE'),(1,12,931,'BURITI DE GOIAS'),(1,12,932,'BURITINOPOLIS'),(1,12,933,'CABECEIRAS'),(1,12,934,'CACHOEIRA ALTA'),(1,12,935,'CACHOEIRA DE GOIAS'),(1,12,936,'CACHOEIRA DOURADA'),(1,12,937,'CACU'),(1,12,938,'CAIAPONIA'),(1,12,939,'CALDAS NOVAS'),(1,12,940,'CALDAZINHA'),(1,12,941,'CAMPESTRE DE GOIAS'),(1,12,942,'CAMPINACU'),(1,12,943,'CAMPINORTE'),(1,12,944,'CAMPO ALEGRE DE GOIAS'),(1,12,945,'CAMPO LIMPO DE GOIAS'),(1,12,946,'CAMPOS BELOS'),(1,12,947,'CAMPOS VERDES'),(1,12,948,'CARMO DO RIO VERDE'),(1,12,949,'CASTELANDIA'),(1,12,950,'CATALAO'),(1,12,951,'CATURAI'),(1,12,952,'CAVALCANTE'),(1,12,953,'CERES'),(1,12,954,'CEZARINA'),(1,12,955,'CHAPADAO DO CEU'),(1,12,956,'CIDADE OCIDENTAL'),(1,12,957,'COCALZINHO DE GOIAS'),(1,12,958,'COLINAS DO SUL'),(1,12,959,'CORREGO DO OURO'),(1,12,960,'CORUMBA DE GOIAS'),(1,12,961,'CORUMBAIBA'),(1,12,962,'CRISTALINA'),(1,12,963,'CRISTIANOPOLIS'),(1,12,964,'CRIXAS'),(1,12,965,'CROMINIA'),(1,12,966,'CUMARI'),(1,12,967,'DAMIANOPOLIS'),(1,12,968,'DAMOLANDIA'),(1,12,969,'DAVINOPOLIS'),(1,12,970,'DIORAMA'),(1,12,971,'DIVINOPOLIS DE GOIAS'),(1,12,972,'DOVERLANDIA'),(1,12,973,'EDEALINA'),(1,12,974,'EDEIA'),(1,12,975,'ESTRELA DO NORTE'),(1,12,976,'FAINA'),(1,12,977,'FAZENDA NOVA'),(1,12,978,'FIRMINOPOLIS'),(1,12,979,'FLORES DE GOIAS'),(1,12,980,'FORMOSA'),(1,12,981,'FORMOSO'),(1,12,982,'GAMELEIRA DE GOIAS'),(1,12,983,'GOIANAPOLIS'),(1,12,984,'GOIANDIRA'),(1,12,985,'GOIANESIA'),(1,12,986,'GOIANIA'),(1,12,987,'GOIANIRA'),(1,12,988,'GOIAS'),(1,12,989,'GOIATUBA'),(1,12,990,'GOUVELANDIA'),(1,12,991,'GUAPO'),(1,12,992,'GUARAITA'),(1,12,993,'GUARANI DE GOIAS'),(1,12,994,'GUARINOS'),(1,12,995,'HEITORAI'),(1,12,996,'HIDROLANDIA'),(1,12,997,'HIDROLINA'),(1,12,998,'IACIARA'),(1,12,999,'INACIOLANDIA'),(1,12,1000,'INDIARA'),(1,12,1001,'INHUMAS'),(1,12,1002,'IPAMERI'),(1,12,1003,'IPIRANGA DE GOIAS'),(1,12,1004,'IPORA'),(1,12,1005,'ISRAELANDIA'),(1,12,1006,'ITABERAI'),(1,12,1007,'ITAGUARI'),(1,12,1008,'ITAGUARU'),(1,12,1009,'ITAJA'),(1,12,1010,'ITAPACI'),(1,12,1011,'ITAPIRAPUA'),(1,12,1012,'ITAPURANGA'),(1,12,1013,'ITARUMA'),(1,12,1014,'ITAUCU'),(1,12,1015,'ITUMBIARA'),(1,12,1016,'IVOLANDIA'),(1,12,1017,'JANDAIA'),(1,12,1018,'JARAGUA'),(1,12,1019,'JATAI'),(1,12,1020,'JAUPACI'),(1,12,1021,'JESUPOLIS'),(1,12,1022,'JOVIANIA'),(1,12,1023,'JUSSARA'),(1,12,1024,'LAGOA SANTA'),(1,12,1025,'LEOPOLDO DE BULHOES'),(1,12,1026,'LUZIANIA'),(1,12,1027,'MAIRIPOTABA'),(1,12,1028,'MAMBAI'),(1,12,1029,'MARA ROSA'),(1,12,1030,'MARZAGAO'),(1,12,1031,'MATRINCHA'),(1,12,1032,'MAURILANDIA'),(1,12,1033,'MIMOSO DE GOIAS'),(1,12,1034,'MINACU'),(1,12,1035,'MINEIROS'),(1,12,1036,'MOIPORA'),(1,12,1037,'MONTE ALEGRE DE GOIAS'),(1,12,1038,'MONTES CLAROS DE GOIAS'),(1,12,1039,'MONTIVIDIU'),(1,12,1040,'MONTIVIDIU DO NORTE'),(1,12,1041,'MORRINHOS'),(1,12,1042,'MORRO AGUDO DE GOIAS'),(1,12,1043,'MOSSAMEDES'),(1,12,1044,'MOZARLANDIA'),(1,12,1045,'MUNDO NOVO'),(1,12,1046,'MUTUNOPOLIS'),(1,12,1047,'NAZARIO'),(1,12,1048,'NEROPOLIS'),(1,12,1049,'NIQUELANDIA'),(1,12,1050,'NOVA AMERICA'),(1,12,1051,'NOVA AURORA'),(1,12,1052,'NOVA CRIXAS'),(1,12,1053,'NOVA GLORIA'),(1,12,1054,'NOVA IGUACU DE GOIAS'),(1,12,1055,'NOVA ROMA'),(1,12,1056,'NOVA VENEZA'),(1,12,1057,'NOVO BRASIL'),(1,12,1058,'NOVO GAMA'),(1,12,1059,'NOVO PLANALTO'),(1,12,1060,'ORIZONA'),(1,12,1061,'OURO VERDE DE GOIAS'),(1,12,1062,'OUVIDOR'),(1,12,1063,'PADRE BERNARDO'),(1,12,1064,'PALESTINA DE GOIAS'),(1,12,1065,'PALMEIRAS DE GOIAS'),(1,12,1066,'PALMELO'),(1,12,1067,'PALMINOPOLIS'),(1,12,1068,'PANAMA'),(1,12,1069,'PARANAIGUARA'),(1,12,1070,'PARAUNA'),(1,12,1071,'PEROLANDIA'),(1,12,1072,'PETROLINA DE GOIAS'),(1,12,1073,'PILAR DE GOIAS'),(1,12,1074,'PIRACANJUBA'),(1,12,1075,'PIRANHAS'),(1,12,1076,'PIRENOPOLIS'),(1,12,1077,'PIRES DO RIO'),(1,12,1078,'PLANALTINA'),(1,12,1079,'PONTALINA'),(1,12,1080,'PORANGATU'),(1,12,1081,'PORTEIRAO'),(1,12,1082,'PORTELANDIA'),(1,12,1083,'POSSE'),(1,12,1084,'PROFESSOR JAMIL'),(1,12,1085,'QUIRINOPOLIS'),(1,12,1086,'RIALMA'),(1,12,1087,'RIANAPOLIS'),(1,12,1088,'RIO QUENTE'),(1,12,1089,'RIO VERDE'),(1,12,1090,'RUBIATABA'),(1,12,1091,'SANCLERLANDIA'),(1,12,1092,'SANTA BARBARA DE GOIAS'),(1,12,1093,'SANTA CRUZ DE GOIAS'),(1,12,1094,'SANTA FE DE GOIAS'),(1,12,1095,'SANTA HELENA DE GOIAS'),(1,12,1096,'SANTA ISABEL'),(1,12,1097,'SANTA RITA DO ARAGUAIA'),(1,12,1098,'SANTA RITA DO NOVO DESTINO'),(1,12,1099,'SANTA ROSA DE GOIAS'),(1,12,1100,'SANTA TEREZA DE GOIAS'),(1,12,1101,'SANTA TEREZINHA DE GOIAS'),(1,12,1102,'SANTO ANTONIO DA BARRA'),(1,12,1103,'SANTO ANTONIO DE GOIAS'),(1,12,1104,'SANTO ANTONIO DO DESCOBERTO'),(1,12,1105,'SAO DOMINGOS'),(1,12,1106,'SAO FRANCISCO DE GOIAS'),(1,12,1107,'SAO JOAO DA PARAUNA'),(1,12,1108,'SAO JOAO DALIANCA'),(1,12,1109,'SAO LUIS DE MONTES BELOS'),(1,12,1110,'SAO LUIZ DO NORTE'),(1,12,1111,'SAO MIGUEL DO ARAGUAIA'),(1,12,1112,'SAO MIGUEL DO PASSA QUATRO'),(1,12,1113,'SAO PATRICIO'),(1,12,1114,'SAO SIMAO'),(1,12,1115,'SENADOR CANEDO'),(1,12,1116,'SERRANOPOLIS'),(1,12,1117,'SILVANIA'),(1,12,1118,'SIMOLANDIA'),(1,12,1119,'SITIO DABADIA'),(1,12,1120,'TAQUARAL DE GOIAS'),(1,12,1121,'TERESINA DE GOIAS'),(1,12,1122,'TEREZOPOLIS DE GOIAS'),(1,12,1123,'TRES RANCHOS'),(1,12,1124,'TRINDADE'),(1,12,1125,'TROMBAS'),(1,12,1126,'TURVANIA'),(1,12,1127,'TURVELANDIA'),(1,12,1128,'UIRAPURU'),(1,12,1129,'URUACU'),(1,12,1130,'URUANA'),(1,12,1131,'URUTAI'),(1,12,1132,'VALPARAISO DE GOIAS'),(1,12,1133,'VARJAO'),(1,12,1134,'VIANOPOLIS'),(1,12,1135,'VICENTINOPOLIS'),(1,12,1136,'VILA BOA'),(1,12,1137,'VILA PROPICIO'),(1,14,1138,'ACAILANDIA'),(1,14,1139,'AFONSO CUNHA'),(1,14,1140,'AGUA DOCE DO MARANHAO'),(1,14,1141,'ALCANTARA'),(1,14,1142,'ALDEIAS ALTAS'),(1,14,1143,'ALTAMIRA DO MARANHAO'),(1,14,1144,'ALTO ALEGRE DO MARANHAO'),(1,14,1145,'ALTO ALEGRE DO PINDARE'),(1,14,1146,'ALTO PARNAIBA'),(1,14,1147,'AMAPA DO MARANHAO'),(1,14,1148,'AMARANTE DO MARANHAO'),(1,14,1149,'ANAJATUBA'),(1,14,1150,'ANAPURUS'),(1,14,1151,'APICUM-ACU'),(1,14,1152,'ARAGUANA'),(1,14,1153,'ARAIOSES'),(1,14,1154,'ARAME'),(1,14,1155,'ARARI'),(1,14,1156,'AXIXA'),(1,14,1157,'BACABAL'),(1,14,1158,'BACABEIRA'),(1,14,1159,'BACURI'),(1,14,1160,'BACURITUBA'),(1,14,1161,'BALSAS'),(1,14,1162,'BARAO DE GRAJAU'),(1,14,1163,'BARRA DO CORDA'),(1,14,1164,'BARREIRINHAS'),(1,14,1165,'BELA VISTA DO MARANHAO'),(1,14,1166,'BELAGUA'),(1,14,1167,'BENEDITO LEITE'),(1,14,1168,'BEQUIMAO'),(1,14,1169,'BERNARDO DO MEARIM'),(1,14,1170,'BOA VISTA DO GURUPI'),(1,14,1171,'BOM JARDIM'),(1,14,1172,'BOM JESUS DAS SELVAS'),(1,14,1173,'BOM LUGAR'),(1,14,1174,'BREJO'),(1,14,1175,'BREJO DE AREIA'),(1,14,1176,'BURITI'),(1,14,1177,'BURITI BRAVO'),(1,14,1178,'BURITICUPU'),(1,14,1179,'BURITIRANA'),(1,14,1180,'CACHOEIRA GRANDE'),(1,14,1181,'CAJAPIO'),(1,14,1182,'CAJARI'),(1,14,1183,'CAMPESTRE DO MARANHAO'),(1,14,1184,'CANDIDO MENDES'),(1,14,1185,'CANTANHEDE'),(1,14,1186,'CAPINZAL DO NORTE'),(1,14,1187,'CAROLINA'),(1,14,1188,'CARUTAPERA'),(1,14,1189,'CAXIAS'),(1,14,1190,'CEDRAL'),(1,14,1191,'CENTRAL DO MARANHAO'),(1,14,1192,'CENTRO DO GUILHERME'),(1,14,1193,'CENTRO NOVO DO MARANHAO'),(1,14,1194,'CHAPADINHA'),(1,14,1195,'CIDELANDIA'),(1,14,1196,'CODO'),(1,14,1197,'COELHO NETO'),(1,14,1198,'COLINAS'),(1,14,1199,'CONCEICAO DO LAGO-ACU'),(1,14,1200,'COROATA'),(1,14,1201,'CURURUPU'),(1,14,1202,'DAVINOPOLIS'),(1,14,1203,'DOM PEDRO'),(1,14,1204,'DUQUE BACELAR'),(1,14,1205,'ESPERANTINOPOLIS'),(1,14,1206,'ESTREITO'),(1,14,1207,'FEIRA NOVA DO MARANHAO'),(1,14,1208,'FERNANDO FALCAO'),(1,14,1209,'FORMOSA DA SERRA NEGRA'),(1,14,1210,'FORTALEZA DOS NOGUEIRAS'),(1,14,1211,'FORTUNA'),(1,14,1212,'GODOFREDO VIANA'),(1,14,1213,'GONCALVES DIAS'),(1,14,1214,'GOVERNADOR ARCHER'),(1,14,1215,'GOVERNADOR EDISON LOBAO'),(1,14,1216,'GOVERNADOR EUGENIO BARROS'),(1,14,1217,'GOVERNADOR LUIZ ROCHA'),(1,14,1218,'GOVERNADOR NEWTON BELLO'),(1,14,1219,'GOVERNADOR NUNES FREIRE'),(1,14,1220,'GRACA ARANHA'),(1,14,1221,'GRAJAU'),(1,14,1222,'GUIMARAES'),(1,14,1223,'HUMBERTO DE CAMPOS'),(1,14,1224,'ICATU'),(1,14,1225,'IGARAPE DO MEIO'),(1,14,1226,'IGARAPE GRANDE'),(1,14,1227,'IMPERATRIZ'),(1,14,1228,'ITAIPAVA DO GRAJAU'),(1,14,1229,'ITAPECURU MIRIM'),(1,14,1230,'ITINGA DO MARANHAO'),(1,14,1231,'JATOBA'),(1,14,1232,'JENIPAPO DOS VIEIRAS'),(1,14,1233,'JOAO LISBOA'),(1,14,1234,'JOSELANDIA'),(1,14,1235,'JUNCO DO MARANHAO'),(1,14,1236,'LAGO DA PEDRA'),(1,14,1237,'LAGO DO JUNCO'),(1,14,1238,'LAGO DOS RODRIGUES'),(1,14,1239,'LAGO VERDE'),(1,14,1240,'LAGOA DO MATO'),(1,14,1241,'LAGOA GRANDE DO MARANHAO'),(1,14,1242,'LAJEADO NOVO'),(1,14,1243,'LIMA CAMPOS'),(1,14,1244,'LORETO'),(1,14,1245,'LUIS DOMINGUES'),(1,14,1246,'MAGALHAES DE ALMEIDA'),(1,14,1247,'MARACACUME'),(1,14,1248,'MARAJA DO SENA'),(1,14,1249,'MARANHAOZINHO'),(1,14,1250,'MATA ROMA'),(1,14,1251,'MATINHA'),(1,14,1252,'MATOES'),(1,14,1253,'MATOES DO NORTE'),(1,14,1254,'MILAGRES DO MARANHAO'),(1,14,1255,'MIRADOR'),(1,14,1256,'MIRANDA DO NORTE'),(1,14,1257,'MIRINZAL'),(1,14,1258,'MONCAO'),(1,14,1259,'MONTES ALTOS'),(1,14,1260,'MORROS'),(1,14,1261,'NINA RODRIGUES'),(1,14,1262,'NOVA COLINAS'),(1,14,1263,'NOVA IORQUE'),(1,14,1264,'NOVA OLINDA DO MARANHAO'),(1,14,1265,'OLHO DAGUA DAS CUNHAS'),(1,14,1266,'OLINDA NOVA DO MARANHAO'),(1,14,1267,'PACO DO LUMIAR'),(1,14,1268,'PALMEIRANDIA'),(1,14,1269,'PARAIBANO'),(1,14,1270,'PARNARAMA'),(1,14,1271,'PASSAGEM FRANCA'),(1,14,1272,'PASTOS BONS'),(1,14,1273,'PAULINO NEVES'),(1,14,1274,'PAULO RAMOS'),(1,14,1275,'PEDREIRAS'),(1,14,1276,'PEDRO DO ROSARIO'),(1,14,1277,'PENALVA'),(1,14,1278,'PERI MIRIM'),(1,14,1279,'PERITORO'),(1,14,1280,'PINDARE MIRIM'),(1,14,1281,'PINHEIRO'),(1,14,1282,'PIO XII'),(1,14,1283,'PIRAPEMAS'),(1,14,1284,'POCAO DE PEDRAS'),(1,14,1285,'PORTO FRANCO'),(1,14,1286,'PORTO RICO DO MARANHAO'),(1,14,1287,'PRESIDENTE DUTRA'),(1,14,1288,'PRESIDENTE JUSCELINO'),(1,14,1289,'PRESIDENTE MEDICI'),(1,14,1290,'PRESIDENTE SARNEY'),(1,14,1291,'PRESIDENTE VARGAS'),(1,14,1292,'PRIMEIRA CRUZ'),(1,14,1293,'RAPOSA'),(1,14,1294,'RIACHAO'),(1,14,1295,'RIBAMAR FIQUENE'),(1,14,1296,'ROSARIO'),(1,14,1297,'SAMBAIBA'),(1,14,1298,'SANTA FILOMENA DO MARANHAO'),(1,14,1299,'SANTA HELENA'),(1,14,1300,'SANTA INES'),(1,14,1301,'SANTA LUZIA'),(1,14,1302,'SANTA LUZIA DO PARUA'),(1,14,1303,'SANTA QUITERIA DO MARANHAO'),(1,14,1304,'SANTA RITA'),(1,14,1305,'SANTANA DO MARANHAO'),(1,14,1306,'SANTO AMARO DO MARANHAO'),(1,14,1307,'SANTO ANTONIO DOS LOPES'),(1,14,1308,'SAO BENEDITO DO RIO PRETO'),(1,14,1309,'SAO BENTO'),(1,14,1310,'SAO BERNARDO'),(1,14,1311,'SAO DOMINGOS DO AZEITAO'),(1,14,1312,'SAO DOMINGOS DO MARANHAO'),(1,14,1313,'SAO FELIX DE BALSAS'),(1,14,1314,'SAO FRANCISCO DO BREJAO'),(1,14,1315,'SAO FRANCISCO DO MARANHAO'),(1,14,1316,'SAO JOAO BATISTA'),(1,14,1317,'SAO JOAO DO CARU'),(1,14,1318,'SAO JOAO DO PARAISO'),(1,14,1319,'SAO JOAO DO SOTER'),(1,14,1320,'SAO JOAO DOS PATOS'),(1,14,1321,'SAO JOSE DE RIBAMAR'),(1,14,1322,'SAO JOSE DOS BASILIOS'),(1,14,1323,'SAO LUIS'),(1,14,1324,'SAO LUIS GONZAGA DO MARANHAO'),(1,14,1325,'SAO MATEUS DO MARANHAO'),(1,14,1326,'SAO PEDRO DA AGUA BRANCA'),(1,14,1327,'SAO PEDRO DOS CRENTES'),(1,14,1328,'SAO RAIMUNDO DAS MANGABEIRAS'),(1,14,1329,'SAO RAIMUNDO DO DOCA BEZERRA'),(1,14,1330,'SAO ROBERTO'),(1,14,1331,'SAO VICENTE FERRER'),(1,14,1332,'SATUBINHA'),(1,14,1333,'SENADOR ALEXANDRE COSTA'),(1,14,1334,'SENADOR LA ROCQUE'),(1,14,1335,'SERRANO DO MARANHAO'),(1,14,1336,'SITIO NOVO'),(1,14,1337,'SUCUPIRA DO NORTE'),(1,14,1338,'SUCUPIRA DO RIACHAO'),(1,14,1339,'TASSO FRAGOSO'),(1,14,1340,'TIMBIRAS'),(1,14,1341,'TIMON'),(1,14,1342,'TRIZIDELA DO VALE'),(1,14,1343,'TUFILANDIA'),(1,14,1344,'TUNTUM'),(1,14,1345,'TURIACU'),(1,14,1346,'TURILANDIA'),(1,14,1347,'TUTOIA'),(1,14,1348,'URBANO SANTOS'),(1,14,1349,'VARGEM GRANDE'),(1,14,1350,'VIANA'),(1,14,1351,'VILA NOVA DOS MARTIRIOS'),(1,14,1352,'VITORIA DO MEARIM'),(1,14,1353,'VITORINO FREIRE'),(1,14,1354,'ZE DOCA'),(1,3,1355,'ABADIA DOS DOURADOS'),(1,3,1356,'ABAETE'),(1,3,1357,'ABRE CAMPO'),(1,3,1358,'ACAIACA'),(1,3,1359,'ACUCENA'),(1,3,1360,'AGUA BOA'),(1,3,1361,'AGUA COMPRIDA'),(1,3,1362,'AGUANIL'),(1,3,1363,'AGUAS FORMOSAS'),(1,3,1364,'AGUAS VERMELHAS'),(1,3,1365,'AIMORES'),(1,3,1366,'AIURUOCA'),(1,3,1367,'ALAGOA'),(1,3,1368,'ALBERTINA'),(1,3,1369,'ALEM PARAIBA'),(1,3,1370,'ALFENAS'),(1,3,1371,'ALFREDO VASCONCELOS'),(1,3,1372,'ALMENARA'),(1,3,1373,'ALPERCATA'),(1,3,1374,'ALPINOPOLIS'),(1,3,1375,'ALTEROSA'),(1,3,1376,'ALTO CAPARAO'),(1,3,1377,'ALTO JEQUITIBA'),(1,3,1378,'ALTO RIO DOCE'),(1,3,1379,'ALVARENGA'),(1,3,1380,'ALVINOPOLIS'),(1,3,1381,'ALVORADA DE MINAS'),(1,3,1382,'AMPARO DO SERRA'),(1,3,1383,'ANDRADAS'),(1,3,1384,'ANDRELANDIA'),(1,3,1385,'ANGELANDIA'),(1,3,1386,'ANTONIO CARLOS'),(1,3,1387,'ANTONIO DIAS'),(1,3,1388,'ANTONIO PRADO DE MINAS'),(1,3,1389,'ARACAI'),(1,3,1390,'ARACITABA'),(1,3,1391,'ARACUAI'),(1,3,1392,'ARAGUARI'),(1,3,1393,'ARANTINA'),(1,3,1394,'ARAPONGA'),(1,3,1395,'ARAPORA'),(1,3,1396,'ARAPUA'),(1,3,1397,'ARAUJOS'),(1,3,1398,'ARAXA'),(1,3,1399,'ARCEBURGO'),(1,3,1400,'ARCOS'),(1,3,1401,'AREADO'),(1,3,1402,'ARGIRITA'),(1,3,1403,'ARICANDUVA'),(1,3,1404,'ARINOS'),(1,3,1405,'ASTOLFO DUTRA'),(1,3,1406,'ATALEIA'),(1,3,1407,'AUGUSTO DE LIMA'),(1,3,1408,'BAEPENDI'),(1,3,1409,'BALDIM'),(1,3,1410,'BAMBUI'),(1,3,1411,'BANDEIRA'),(1,3,1412,'BANDEIRA DO SUL'),(1,3,1413,'BARAO DE COCAIS'),(1,3,1414,'BARAO DE MONTE ALTO'),(1,3,1415,'BARBACENA'),(1,3,1416,'BARRA LONGA'),(1,3,1417,'BARROSO'),(1,3,1418,'BELA VISTA DE MINAS'),(1,3,1419,'BELMIRO BRAGA'),(1,3,1420,'BELO ORIENTE'),(1,3,1421,'BELO VALE'),(1,3,1422,'BERILO'),(1,3,1423,'BERIZAL'),(1,3,1424,'BERTOPOLIS'),(1,3,1425,'BETIM'),(1,3,1426,'BIAS FORTES'),(1,3,1427,'BICAS'),(1,3,1428,'BIQUINHAS'),(1,3,1429,'BOA ESPERANCA'),(1,3,1430,'BOCAINA DE MINAS'),(1,3,1431,'BOCAIUVA'),(1,3,1432,'BOM DESPACHO'),(1,3,1433,'BOM JARDIM DE MINAS'),(1,3,1434,'BOM JESUS DA PENHA'),(1,3,1435,'BOM JESUS DO AMPARO'),(1,3,1436,'BOM JESUS DO GALHO'),(1,3,1437,'BOM REPOUSO'),(1,3,1438,'BOM SUCESSO'),(1,3,1439,'BONFIM'),(1,3,1440,'BONFINOPOLIS DE MINAS'),(1,3,1441,'BONITO DE MINAS'),(1,3,1442,'BORDA DA MATA'),(1,3,1443,'BOTELHOS'),(1,3,1444,'BOTUMIRIM'),(1,3,1445,'BRAS PIRES'),(1,3,1446,'BRASILANDIA DE MINAS'),(1,3,1447,'BRASILIA DE MINAS'),(1,3,1448,'BRASOPOLIS'),(1,3,1449,'BRAUNAS'),(1,3,1450,'BRUMADINHO'),(1,3,1451,'BUENO BRANDAO'),(1,3,1452,'BUENOPOLIS'),(1,3,1453,'BUGRE'),(1,3,1454,'BURITIS'),(1,3,1455,'BURITIZEIRO'),(1,3,1456,'CABECEIRA GRANDE'),(1,3,1457,'CABO VERDE'),(1,3,1458,'CACHOEIRA DA PRATA'),(1,3,1459,'CACHOEIRA DE MINAS'),(1,3,1460,'CACHOEIRA DE PAJEU'),(1,3,1461,'CACHOEIRA DOURADA'),(1,3,1462,'CAETANOPOLIS'),(1,3,1463,'CAETE'),(1,3,1464,'CAIANA'),(1,3,1465,'CAJURI'),(1,3,1466,'CALDAS'),(1,3,1467,'CAMACHO'),(1,3,1468,'CAMANDUCAIA'),(1,3,1469,'CAMBUI'),(1,3,1470,'CAMBUQUIRA'),(1,3,1471,'CAMPANARIO'),(1,3,1472,'CAMPANHA'),(1,3,1473,'CAMPESTRE'),(1,3,1474,'CAMPINA VERDE'),(1,3,1475,'CAMPO AZUL'),(1,3,1476,'CAMPO BELO'),(1,3,1477,'CAMPO DO MEIO'),(1,3,1478,'CAMPO FLORIDO'),(1,3,1479,'CAMPOS ALTOS'),(1,3,1480,'CAMPOS GERAIS'),(1,3,1481,'CANA VERDE'),(1,3,1482,'CANAA'),(1,3,1483,'CANAPOLIS'),(1,3,1484,'CANDEIAS'),(1,3,1485,'CANTAGALO'),(1,3,1486,'CAPARAO'),(1,3,1487,'CAPELA NOVA'),(1,3,1488,'CAPELINHA'),(1,3,1489,'CAPETINGA'),(1,3,1490,'CAPIM BRANCO'),(1,3,1491,'CAPINOPOLIS'),(1,3,1492,'CAPITAO ANDRADE'),(1,3,1493,'CAPITAO ENEAS'),(1,3,1494,'CAPITOLIO'),(1,3,1495,'CAPUTIRA'),(1,3,1496,'CARAI'),(1,3,1497,'CARANAIBA'),(1,3,1498,'CARANDAI'),(1,3,1499,'CARANGOLA'),(1,3,1500,'CARATINGA'),(1,3,1501,'CARBONITA'),(1,3,1502,'CAREACU'),(1,3,1503,'CARLOS CHAGAS'),(1,3,1504,'CARMESIA'),(1,3,1505,'CARMO DA CACHOEIRA'),(1,3,1506,'CARMO DA MATA'),(1,3,1507,'CARMO DE MINAS'),(1,3,1508,'CARMO DO CAJURU'),(1,3,1509,'CARMO DO PARANAIBA'),(1,3,1510,'CARMO DO RIO CLARO'),(1,3,1511,'CARMOPOLIS DE MINAS'),(1,3,1512,'CARNEIRINHO'),(1,3,1513,'CARRANCAS'),(1,3,1514,'CARVALHOPOLIS'),(1,3,1515,'CARVALHOS'),(1,3,1516,'CASA GRANDE'),(1,3,1517,'CASCALHO RICO'),(1,3,1518,'CASSIA'),(1,3,1519,'CATAGUASES'),(1,3,1520,'CATAS ALTAS'),(1,3,1521,'CATAS ALTAS DA NORUEGA'),(1,3,1522,'CATUJI'),(1,3,1523,'CATUTI'),(1,3,1524,'CAXAMBU'),(1,3,1525,'CEDRO DO ABAETE'),(1,3,1526,'CENTRAL DE MINAS'),(1,3,1527,'CENTRALINA'),(1,3,1528,'CHACARA'),(1,3,1529,'CHALE'),(1,3,1530,'CHAPADA DO NORTE'),(1,3,1531,'CHAPADA GAUCHA'),(1,3,1532,'CHIADOR'),(1,3,1533,'CIPOTANEA'),(1,3,1534,'CLARAVAL'),(1,3,1535,'CLARO DOS POCOES'),(1,3,1536,'CLAUDIO'),(1,3,1537,'COIMBRA'),(1,3,1538,'COLUNA'),(1,3,1539,'COMENDADOR GOMES'),(1,3,1540,'COMERCINHO'),(1,3,1541,'CONCEICAO DA APARECIDA'),(1,3,1542,'CONCEICAO DA BARRA DE MINAS'),(1,3,1543,'CONCEICAO DAS ALAGOAS'),(1,3,1544,'CONCEICAO DAS PEDRAS'),(1,3,1545,'CONCEICAO DE IPANEMA'),(1,3,1546,'CONCEICAO DO MATO DENTRO'),(1,3,1547,'CONCEICAO DO PARA'),(1,3,1548,'CONCEICAO DO RIO VERDE'),(1,3,1549,'CONCEICAO DOS OUROS'),(1,3,1550,'CONEGO MARINHO'),(1,3,1551,'CONFINS'),(1,3,1552,'CONGONHAL'),(1,3,1553,'CONGONHAS'),(1,3,1554,'CONGONHAS DO NORTE'),(1,3,1555,'CONQUISTA'),(1,3,1556,'CONSELHEIRO LAFAIETE'),(1,3,1557,'CONSELHEIRO PENA'),(1,3,1558,'CONSOLACAO'),(1,3,1559,'CONTAGEM'),(1,3,1560,'COQUEIRAL'),(1,3,1561,'CORACAO DE JESUS'),(1,3,1562,'CORDISBURGO'),(1,3,1563,'CORDISLANDIA'),(1,3,1564,'CORINTO'),(1,3,1565,'COROACI'),(1,3,1566,'COROMANDEL'),(1,3,1567,'CORONEL FABRICIANO'),(1,3,1568,'CORONEL MURTA'),(1,3,1569,'CORONEL PACHECO'),(1,3,1570,'CORONEL XAVIER CHAVES'),(1,3,1571,'CORREGO DANTA'),(1,3,1572,'CORREGO DO BOM JESUS'),(1,3,1573,'CORREGO FUNDO'),(1,3,1574,'CORREGO NOVO'),(1,3,1575,'COUTO DE MAGALHAES DE MINAS'),(1,3,1576,'CRISOLITA'),(1,3,1577,'CRISTAIS'),(1,3,1578,'CRISTALIA'),(1,3,1579,'CRISTIANO OTONI'),(1,3,1580,'CRISTINA'),(1,3,1581,'CRUCILANDIA'),(1,3,1582,'CRUZEIRO DA FORTALEZA'),(1,3,1583,'CRUZILIA'),(1,3,1584,'CUPARAQUE'),(1,3,1585,'CURRAL DE DENTRO'),(1,3,1586,'CURVELO'),(1,3,1587,'DATAS'),(1,3,1588,'DELFIM MOREIRA'),(1,3,1589,'DELFINOPOLIS'),(1,3,1590,'DELTA'),(1,3,1591,'DESCOBERTO'),(1,3,1592,'DESTERRO DE ENTRE RIOS'),(1,3,1593,'DESTERRO DO MELO'),(1,3,1594,'DIAMANTINA'),(1,3,1595,'DIOGO DE VASCONCELOS'),(1,3,1596,'DIONISIO'),(1,3,1597,'DIVINESIA'),(1,3,1598,'DIVINO'),(1,3,1599,'DIVINO DAS LARANJEIRAS'),(1,3,1600,'DIVINOLANDIA DE MINAS'),(1,3,1601,'DIVINOPOLIS'),(1,3,1602,'DIVISA ALEGRE'),(1,3,1603,'DIVISA NOVA'),(1,3,1604,'DIVISOPOLIS'),(1,3,1605,'DOM BOSCO'),(1,3,1606,'DOM CAVATI'),(1,3,1607,'DOM JOAQUIM'),(1,3,1608,'DOM SILVERIO'),(1,3,1609,'DOM VICOSO'),(1,3,1610,'DONA EUZEBIA'),(1,3,1611,'DORES DE CAMPOS'),(1,3,1612,'DORES DE GUANHAES'),(1,3,1613,'DORES DO INDAIA'),(1,3,1614,'DORES DO TURVO'),(1,3,1615,'DORESOPOLIS'),(1,3,1616,'DOURADOQUARA'),(1,3,1617,'DURANDE'),(1,3,1618,'ELOI MENDES'),(1,3,1619,'ENGENHEIRO CALDAS'),(1,3,1620,'ENGENHEIRO NAVARRO'),(1,3,1621,'ENTRE FOLHAS'),(1,3,1622,'ENTRE RIOS DE MINAS'),(1,3,1623,'ERVALIA'),(1,3,1624,'ESMERALDAS'),(1,3,1625,'ESPERA FELIZ'),(1,3,1626,'ESPINOSA'),(1,3,1627,'ESPIRITO SANTO DO DOURADO'),(1,3,1628,'ESTIVA'),(1,3,1629,'ESTRELA DALVA'),(1,3,1630,'ESTRELA DO INDAIA'),(1,3,1631,'ESTRELA DO SUL'),(1,3,1632,'EUGENOPOLIS'),(1,3,1633,'EWBANK DA CAMARA'),(1,3,1634,'EXTREMA'),(1,3,1635,'FAMA'),(1,3,1636,'FARIA LEMOS'),(1,3,1637,'FELICIO DOS SANTOS'),(1,3,1638,'FELISBURGO'),(1,3,1639,'FELIXLANDIA'),(1,3,1640,'FERNANDES TOURINHO'),(1,3,1641,'FERROS'),(1,3,1642,'FERVEDOURO'),(1,3,1643,'FLORESTAL'),(1,3,1644,'FORMIGA'),(1,3,1645,'FORMOSO'),(1,3,1646,'FORTALEZA DE MINAS'),(1,3,1647,'FORTUNA DE MINAS'),(1,3,1648,'FRANCISCO BADARO'),(1,3,1649,'FRANCISCO DUMONT'),(1,3,1650,'FRANCISCO SA'),(1,3,1651,'FRANCISCOPOLIS'),(1,3,1652,'FREI GASPAR'),(1,3,1653,'FREI INOCENCIO'),(1,3,1654,'FREI LAGONEGRO'),(1,3,1655,'FRONTEIRA'),(1,3,1656,'FRONTEIRA DOS VALES'),(1,3,1657,'FRUTA DE LEITE'),(1,3,1658,'FRUTAL'),(1,3,1659,'FUNILANDIA'),(1,3,1660,'GALILEIA'),(1,3,1661,'GAMELEIRAS'),(1,3,1662,'GLAUCILANDIA'),(1,3,1663,'GOIABEIRA'),(1,3,1664,'GOIANA'),(1,3,1665,'GONCALVES'),(1,3,1666,'GONZAGA'),(1,3,1667,'GOUVEA'),(1,3,1668,'GOVERNADOR VALADARES'),(1,3,1669,'GRAO MOGOL'),(1,3,1670,'GRUPIARA'),(1,3,1671,'GUANHAES'),(1,3,1672,'GUAPE'),(1,3,1673,'GUARACIABA'),(1,3,1674,'GUARACIAMA'),(1,3,1675,'GUARANESIA'),(1,3,1676,'GUARANI'),(1,3,1677,'GUARARA'),(1,3,1678,'GUARDA-MOR'),(1,3,1679,'GUAXUPE'),(1,3,1680,'GUIDOVAL'),(1,3,1681,'GUIMARANIA'),(1,3,1682,'GUIRICEMA'),(1,3,1683,'GURINHATA'),(1,3,1684,'HELIODORA'),(1,3,1685,'IAPU'),(1,3,1686,'IBERTIOGA'),(1,3,1687,'IBIA'),(1,3,1688,'IBIAI'),(1,3,1689,'IBIRACATU'),(1,3,1690,'IBIRACI'),(1,3,1691,'IBIRITE'),(1,3,1692,'IBITIURA DE MINAS'),(1,3,1693,'IBITURUNA'),(1,3,1694,'ICARAI DE MINAS'),(1,3,1695,'IGARAPE'),(1,3,1696,'IGARATINGA'),(1,3,1697,'IGUATAMA'),(1,3,1698,'IJACI'),(1,3,1699,'ILICINEA'),(1,3,1700,'IMBE DE MINAS'),(1,3,1701,'INCONFIDENTES'),(1,3,1702,'INDAIABIRA'),(1,3,1703,'INDIANOPOLIS'),(1,3,1704,'INGAI'),(1,3,1705,'INHAPIM'),(1,3,1706,'INHAUMA'),(1,3,1707,'INIMUTABA'),(1,3,1708,'IPABA'),(1,3,1709,'IPANEMA'),(1,3,1710,'IPATINGA'),(1,3,1711,'IPIACU'),(1,3,1712,'IPUIUNA'),(1,3,1713,'IRAI DE MINAS'),(1,3,1714,'ITABIRA'),(1,3,1715,'ITABIRINHA DE MANTENA'),(1,3,1716,'ITABIRITO'),(1,3,1717,'ITACAMBIRA'),(1,3,1718,'ITACARAMBI'),(1,3,1719,'ITAGUARA'),(1,3,1720,'ITAIPE'),(1,3,1721,'ITAJUBA'),(1,3,1722,'ITAMARANDIBA'),(1,3,1723,'ITAMARATI DE MINAS'),(1,3,1724,'ITAMBACURI'),(1,3,1725,'ITAMBE DO MATO DENTRO'),(1,3,1726,'ITAMOGI'),(1,3,1727,'ITAMONTE'),(1,3,1728,'ITANHANDU'),(1,3,1729,'ITANHOMI'),(1,3,1730,'ITAOBIM'),(1,3,1731,'ITAPAGIPE'),(1,3,1732,'ITAPECERICA'),(1,3,1733,'ITAPEVA'),(1,3,1734,'ITATIAIUCU'),(1,3,1735,'ITAU DE MINAS'),(1,3,1736,'ITAUNA'),(1,3,1737,'ITAVERAVA'),(1,3,1738,'ITINGA'),(1,3,1739,'ITUETA'),(1,3,1740,'ITUIUTABA'),(1,3,1741,'ITUMIRIM'),(1,3,1742,'ITURAMA'),(1,3,1743,'ITUTINGA'),(1,3,1744,'JABOTICATUBAS'),(1,3,1745,'JACINTO'),(1,3,1746,'JACUI'),(1,3,1747,'JACUTINGA'),(1,3,1748,'JAGUARACU'),(1,3,1749,'JAIBA'),(1,3,1750,'JAMPRUCA'),(1,3,1751,'JANAUBA'),(1,3,1752,'JANUARIA'),(1,3,1753,'JAPARAIBA'),(1,3,1754,'JAPONVAR'),(1,3,1755,'JECEABA'),(1,3,1756,'JENIPAPO DE MINAS'),(1,3,1757,'JEQUERI'),(1,3,1758,'JEQUITAI'),(1,3,1759,'JEQUITIBA'),(1,3,1760,'JEQUITINHONHA'),(1,3,1761,'JESUANIA'),(1,3,1762,'JOAIMA'),(1,3,1763,'JOANESIA'),(1,3,1764,'JOAO MONLEVADE'),(1,3,1765,'JOAO PINHEIRO'),(1,3,1766,'JOAQUIM FELICIO'),(1,3,1767,'JORDANIA'),(1,3,1768,'JOSE GONCALVES DE MINAS'),(1,3,1769,'JOSE RAYDAN'),(1,3,1770,'JOSENOPOLIS'),(1,3,1771,'JUATUBA'),(1,3,1772,'JUIZ DE FORA'),(1,3,1773,'JURAMENTO'),(1,3,1774,'JURUAIA'),(1,3,1775,'JUVENILIA'),(1,3,1776,'LADAINHA'),(1,3,1777,'LAGAMAR'),(1,3,1778,'LAGOA DA PRATA'),(1,3,1779,'LAGOA DOS PATOS'),(1,3,1780,'LAGOA DOURADA'),(1,3,1781,'LAGOA FORMOSA'),(1,3,1782,'LAGOA GRANDE'),(1,3,1783,'LAGOA SANTA'),(1,3,1784,'LAJINHA'),(1,3,1785,'LAMBARI'),(1,3,1786,'LAMIM'),(1,3,1787,'LARANJAL'),(1,3,1788,'LASSANCE'),(1,3,1789,'LAVRAS'),(1,3,1790,'LEANDRO FERREIRA'),(1,3,1791,'LEME DO PRADO'),(1,3,1792,'LEOPOLDINA'),(1,3,1793,'LIBERDADE'),(1,3,1794,'LIMA DUARTE'),(1,3,1795,'LIMEIRA D OESTE'),(1,3,1796,'LONTRA'),(1,3,1797,'LUISBURGO'),(1,3,1798,'LUISLANDIA'),(1,3,1799,'LUMINARIAS'),(1,3,1800,'LUZ'),(1,3,1801,'MACHACALIS'),(1,3,1802,'MACHADO'),(1,3,1803,'MADRE DE DEUS DE MINAS'),(1,3,1804,'MALACACHETA'),(1,3,1805,'MAMONAS'),(1,3,1806,'MANGA'),(1,3,1807,'MANHUACU'),(1,3,1808,'MANHUMIRIM'),(1,3,1809,'MANTENA'),(1,3,1810,'MAR DE ESPANHA'),(1,3,1811,'MARAVILHAS'),(1,3,1812,'MARIA DA FE'),(1,3,1813,'MARIANA'),(1,3,1814,'MARILAC'),(1,3,1815,'MARIO CAMPOS'),(1,3,1816,'MARIPA DE MINAS'),(1,3,1817,'MARLIERIA'),(1,3,1818,'MARMELOPOLIS'),(1,3,1819,'MARTINHO CAMPOS'),(1,3,1820,'MARTINS SOARES'),(1,3,1821,'MATA VERDE'),(1,3,1822,'MATERLANDIA'),(1,3,1823,'MATEUS LEME'),(1,3,1824,'MATHIAS LOBATO'),(1,3,1825,'MATIAS BARBOSA'),(1,3,1826,'MATIAS CARDOSO'),(1,3,1827,'MATIPO'),(1,3,1828,'MATO VERDE'),(1,3,1829,'MATOZINHOS'),(1,3,1830,'MATUTINA'),(1,3,1831,'MEDEIROS'),(1,3,1832,'MEDINA'),(1,3,1833,'MENDES PIMENTEL'),(1,3,1834,'MERCES'),(1,3,1835,'MESQUITA'),(1,3,1836,'MINAS NOVAS'),(1,3,1837,'MINDURI'),(1,3,1838,'MIRABELA'),(1,3,1839,'MIRADOURO'),(1,3,1840,'MIRAI'),(1,3,1841,'MIRAVANIA'),(1,3,1842,'MOEDA'),(1,3,1843,'MOEMA'),(1,3,1844,'MONJOLOS'),(1,3,1845,'MONSENHOR PAULO'),(1,3,1846,'MONTALVANIA'),(1,3,1847,'MONTE ALEGRE DE MINAS'),(1,3,1848,'MONTE AZUL'),(1,3,1849,'MONTE BELO'),(1,3,1850,'MONTE CARMELO'),(1,3,1851,'MONTE FORMOSO'),(1,3,1852,'MONTE SANTO DE MINAS'),(1,3,1853,'MONTE SIAO'),(1,3,1854,'MONTES CLAROS'),(1,3,1855,'MONTEZUMA'),(1,3,1856,'MORADA NOVA DE MINAS'),(1,3,1857,'MORRO DA GARCA'),(1,3,1858,'MORRO DO PILAR'),(1,3,1859,'MUNHOZ'),(1,3,1860,'MURIAE'),(1,3,1861,'MUTUM'),(1,3,1862,'MUZAMBINHO'),(1,3,1863,'NACIP RAYDAN'),(1,3,1864,'NANUQUE'),(1,3,1865,'NAQUE'),(1,3,1866,'NATALANDIA'),(1,3,1867,'NATERCIA'),(1,3,1868,'NAZARENO'),(1,3,1869,'NEPOMUCENO'),(1,3,1870,'NINHEIRA'),(1,3,1871,'NOVA BELEM'),(1,3,1872,'NOVA ERA'),(1,3,1873,'NOVA LIMA'),(1,3,1874,'NOVA MODICA'),(1,3,1875,'NOVA PONTE'),(1,3,1876,'NOVA PORTEIRINHA'),(1,3,1877,'NOVA RESENDE'),(1,3,1878,'NOVA SERRANA'),(1,3,1879,'NOVA UNIAO'),(1,3,1880,'NOVO CRUZEIRO'),(1,3,1881,'NOVO ORIENTE DE MINAS'),(1,3,1882,'NOVORIZONTE'),(1,3,1883,'OLARIA'),(1,3,1884,'OLHOS-DAGUA'),(1,3,1885,'OLIMPIO NORONHA'),(1,3,1886,'OLIVEIRA'),(1,3,1887,'OLIVEIRA FORTES'),(1,3,1888,'ONCA DE PITANGUI'),(1,3,1889,'ORATORIOS'),(1,3,1890,'ORIZANIA'),(1,3,1891,'OURO BRANCO'),(1,3,1892,'OURO FINO'),(1,3,1893,'OURO PRETO'),(1,3,1894,'OURO VERDE DE MINAS'),(1,3,1895,'PADRE CARVALHO'),(1,3,1896,'PADRE PARAISO'),(1,3,1897,'PAI PEDRO'),(1,3,1898,'PAINEIRAS'),(1,3,1899,'PAINS'),(1,3,1900,'PAIVA'),(1,3,1901,'PALMA'),(1,3,1902,'PALMOPOLIS'),(1,3,1903,'PAPAGAIOS'),(1,3,1904,'PARA DE MINAS'),(1,3,1905,'PARACATU'),(1,3,1906,'PARAGUACU'),(1,3,1907,'PARAISOPOLIS'),(1,3,1908,'PARAOPEBA'),(1,3,1909,'PASSA QUATRO'),(1,3,1910,'PASSA TEMPO'),(1,3,1911,'PASSABEM'),(1,3,1912,'PASSA-VINTE'),(1,3,1913,'PASSOS'),(1,3,1914,'PATIS'),(1,3,1915,'PATOS DE MINAS'),(1,3,1916,'PATROCINIO'),(1,3,1917,'PATROCINIO DO MURIAE'),(1,3,1918,'PAULA CANDIDO'),(1,3,1919,'PAULISTAS'),(1,3,1920,'PAVAO'),(1,3,1921,'PECANHA'),(1,3,1922,'PEDRA AZUL'),(1,3,1923,'PEDRA BONITA'),(1,3,1924,'PEDRA DO ANTA'),(1,3,1925,'PEDRA DO INDAIA'),(1,3,1926,'PEDRA DOURADA'),(1,3,1927,'PEDRALVA'),(1,3,1928,'PEDRAS DE MARIA DA CRUZ'),(1,3,1929,'PEDRINOPOLIS'),(1,3,1930,'PEDRO LEOPOLDO'),(1,3,1931,'PEDRO TEIXEIRA'),(1,3,1932,'PEQUERI'),(1,3,1933,'PEQUI'),(1,3,1934,'PERDIGAO'),(1,3,1935,'PERDIZES'),(1,3,1936,'PERDOES'),(1,3,1937,'PERIQUITO'),(1,3,1938,'PESCADOR'),(1,3,1939,'PIAU'),(1,3,1940,'PIEDADE DE CARATINGA'),(1,3,1941,'PIEDADE DE PONTE NOVA'),(1,3,1942,'PIEDADE DO RIO GRANDE'),(1,3,1943,'PIEDADE DOS GERAIS'),(1,3,1944,'PIMENTA'),(1,3,1945,'PINGO DAGUA'),(1,3,1946,'PINTOPOLIS'),(1,3,1947,'PIRACEMA'),(1,3,1948,'PIRAJUBA'),(1,3,1949,'PIRANGA'),(1,3,1950,'PIRANGUCU'),(1,3,1951,'PIRANGUINHO'),(1,3,1952,'PIRAPETINGA'),(1,3,1953,'PIRAPORA'),(1,3,1954,'PIRAUBA'),(1,3,1955,'PITANGUI'),(1,3,1956,'PIUMHI'),(1,3,1957,'PLANURA'),(1,3,1958,'POCO FUNDO'),(1,3,1959,'POCOS DE CALDAS'),(1,3,1960,'POCRANE'),(1,3,1961,'POMPEU'),(1,3,1962,'PONTE NOVA'),(1,3,1963,'PONTO CHIQUE'),(1,3,1964,'PONTO DOS VOLANTES'),(1,3,1965,'PORTEIRINHA'),(1,3,1966,'PORTO FIRME'),(1,3,1967,'POTE'),(1,3,1968,'POUSO ALEGRE'),(1,3,1969,'POUSO ALTO'),(1,3,1970,'PRADOS'),(1,3,1971,'PRATA'),(1,3,1972,'PRATAPOLIS'),(1,3,1973,'PRATINHA'),(1,3,1974,'PRESIDENTE BERNARDES'),(1,3,1975,'PRESIDENTE JUSCELINO'),(1,3,1976,'PRESIDENTE KUBITSCHEK'),(1,3,1977,'PRESIDENTE OLEGARIO'),(1,3,1978,'PRUDENTE DE MORAIS'),(1,3,1979,'QUARTEL GERAL'),(1,3,1980,'QUELUZITA'),(1,3,1981,'RAPOSOS'),(1,3,1982,'RAUL SOARES'),(1,3,1983,'RECREIO'),(1,3,1984,'REDUTO'),(1,3,1985,'RESENDE COSTA'),(1,3,1986,'RESPLENDOR'),(1,3,1987,'RESSAQUINHA'),(1,3,1988,'RIACHINHO'),(1,3,1989,'RIACHO DOS MACHADOS'),(1,3,1990,'RIBEIRAO DAS NEVES'),(1,3,1991,'RIBEIRAO VERMELHO'),(1,3,1992,'RIO ACIMA'),(1,3,1993,'RIO CASCA'),(1,3,1994,'RIO DO PRADO'),(1,3,1995,'RIO DOCE'),(1,3,1996,'RIO ESPERA'),(1,3,1997,'RIO MANSO'),(1,3,1998,'RIO NOVO'),(1,3,1999,'RIO PARANAIBA'),(1,3,2000,'RIO PARDO DE MINAS'),(1,3,2001,'RIO PIRACICABA'),(1,3,2002,'RIO POMBA'),(1,3,2003,'RIO PRETO'),(1,3,2004,'RIO VERMELHO'),(1,3,2005,'RITAPOLIS'),(1,3,2006,'ROCHEDO DE MINAS'),(1,3,2007,'RODEIRO'),(1,3,2008,'ROMARIA'),(1,3,2009,'ROSARIO DA LIMEIRA'),(1,3,2010,'RUBELITA'),(1,3,2011,'RUBIM'),(1,3,2012,'SABARA'),(1,3,2013,'SABINOPOLIS'),(1,3,2014,'SACRAMENTO'),(1,3,2015,'SALINAS'),(1,3,2016,'SALTO DA DIVISA'),(1,3,2017,'SANTA BARBARA'),(1,3,2018,'SANTA BARBARA DO LESTE'),(1,3,2019,'SANTA BARBARA DO MONTE VERDE'),(1,3,2020,'SANTA BARBARA DO TUGURIO'),(1,3,2021,'SANTA CRUZ DE MINAS'),(1,3,2022,'SANTA CRUZ DE SALINAS'),(1,3,2023,'SANTA CRUZ DO ESCALVADO'),(1,3,2024,'SANTA EFIGENIA DE MINAS'),(1,3,2025,'SANTA FE DE MINAS'),(1,3,2026,'SANTA HELENA DE MINAS'),(1,3,2027,'SANTA JULIANA'),(1,3,2028,'SANTA LUZIA'),(1,3,2029,'SANTA MARGARIDA'),(1,3,2030,'SANTA MARIA DE ITABIRA'),(1,3,2031,'SANTA MARIA DO SALTO'),(1,3,2032,'SANTA MARIA DO SUACUI'),(1,3,2033,'SANTA RITA DE CALDAS'),(1,3,2034,'SANTA RITA DE JACUTINGA'),(1,3,2035,'SANTA RITA DE MINAS'),(1,3,2036,'SANTA RITA DO IBITIPOCA '),(1,3,2037,'SANTA RITA DO ITUETO'),(1,3,2038,'SANTA RITA DO SAPUCAI'),(1,3,2039,'SANTA ROSA DA SERRA'),(1,3,2040,'SANTA VITORIA'),(1,3,2041,'SANTANA DA VARGEM'),(1,3,2042,'SANTANA DE CATAGUASES'),(1,3,2043,'SANTANA DE PIRAPAMA'),(1,3,2044,'SANTANA DO DESERTO'),(1,3,2045,'SANTANA DO GARAMBEU'),(1,3,2046,'SANTANA DO JACARE'),(1,3,2047,'SANTANA DO MANHUACU'),(1,3,2048,'SANTANA DO PARAISO'),(1,3,2049,'SANTANA DO RIACHO'),(1,3,2050,'SANTANA DOS MONTES'),(1,3,2051,'SANTO ANTONIO DO AMPARO'),(1,3,2052,'SANTO ANTONIO DO AVENTUREIRO'),(1,3,2053,'SANTO ANTONIO DO GRAMA'),(1,3,2054,'SANTO ANTONIO DO ITAMBE'),(1,3,2055,'SANTO ANTONIO DO JACINTO'),(1,3,2056,'SANTO ANTONIO DO MONTE'),(1,3,2057,'SANTO ANTONIO DO RETIRO'),(1,3,2058,'SANTO ANTONIO DO RIO ABAIXO'),(1,3,2059,'SANTO HIPOLITO'),(1,3,2060,'SANTOS DUMONT'),(1,3,2061,'SAO BENTO ABADE'),(1,3,2062,'SAO BRAS DO SUACUI'),(1,3,2063,'SAO DOMINGOS DAS DORES'),(1,3,2064,'SAO DOMINGOS DO PRATA'),(1,3,2065,'SAO FELIX DE MINAS'),(1,3,2066,'SAO FRANCISCO'),(1,3,2067,'SAO FRANCISCO DE PAULA'),(1,3,2068,'SAO FRANCISCO DE SALES'),(1,3,2069,'SAO FRANCISCO DO GLORIA'),(1,3,2070,'SAO GERALDO'),(1,3,2071,'SAO GERALDO DA PIEDADE'),(1,3,2072,'SAO GERALDO DO BAIXIO'),(1,3,2073,'SAO GONCALO DO ABAETE'),(1,3,2074,'SAO GONCALO DO PARA'),(1,3,2075,'SAO GONCALO DO RIO ABAIXO'),(1,3,2076,'SAO GONCALO DO RIO PRETO'),(1,3,2077,'SAO GONCALO DO SAPUCAI'),(1,3,2078,'SAO GOTARDO'),(1,3,2079,'SAO JOAO BATISTA DO GLORIA'),(1,3,2080,'SAO JOAO DA LAGOA'),(1,3,2081,'SAO JOAO DA MATA'),(1,3,2082,'SAO JOAO DA PONTE'),(1,3,2083,'SAO JOAO DAS MISSOES'),(1,3,2084,'SAO JOAO DEL REI'),(1,3,2085,'SAO JOAO DO MANHUACU'),(1,3,2086,'SAO JOAO DO MANTENINHA'),(1,3,2087,'SAO JOAO DO ORIENTE'),(1,3,2088,'SAO JOAO DO PACUI'),(1,3,2089,'SAO JOAO DO PARAISO'),(1,3,2090,'SAO JOAO EVANGELISTA'),(1,3,2091,'SAO JOAO NEPOMUCENO'),(1,3,2092,'SAO JOAQUIM DE BICAS'),(1,3,2093,'SAO JOSE DA BARRA'),(1,3,2094,'SAO JOSE DA LAPA'),(1,3,2095,'SAO JOSE DA SAFIRA'),(1,3,2096,'SAO JOSE DA VARGINHA'),(1,3,2097,'SAO JOSE DO ALEGRE'),(1,3,2098,'SAO JOSE DO DIVINO'),(1,3,2099,'SAO JOSE DO GOIABAL'),(1,3,2100,'SAO JOSE DO JACURI'),(1,3,2101,'SAO JOSE DO MANTIMENTO'),(1,3,2102,'SAO LOURENCO'),(1,3,2103,'SAO MIGUEL DO ANTA'),(1,3,2104,'SAO PEDRO DA UNIAO'),(1,3,2105,'SAO PEDRO DO SUACUI'),(1,3,2106,'SAO PEDRO DOS FERROS'),(1,3,2107,'SAO ROMAO'),(1,3,2108,'SAO ROQUE DE MINAS'),(1,3,2109,'SAO SEBASTIAO DA BELA VISTA'),(1,3,2110,'SAO SEBASTIAO DA VARGEM ALEGRE'),(1,3,2111,'SAO SEBASTIAO DO ANTA'),(1,3,2112,'SAO SEBASTIAO DO MARANHAO'),(1,3,2113,'SAO SEBASTIAO DO OESTE'),(1,3,2114,'SAO SEBASTIAO DO PARAISO'),(1,3,2115,'SAO SEBASTIAO DO RIO PRETO'),(1,3,2116,'SAO SEBASTIAO DO RIO VERDE'),(1,3,2117,'SAO THOME DAS LETRAS'),(1,3,2118,'SAO TIAGO'),(1,3,2119,'SAO TOMAS DE AQUINO'),(1,3,2120,'SAO VICENTE DE MINAS'),(1,3,2121,'SAPUCAI-MIRIM'),(1,3,2122,'SARDOA'),(1,3,2123,'SARZEDO'),(1,3,2124,'SEM-PEIXE'),(1,3,2125,'SENADOR AMARAL'),(1,3,2126,'SENADOR CORTES'),(1,3,2127,'SENADOR FIRMINO'),(1,3,2128,'SENADOR JOSE BENTO'),(1,3,2129,'SENADOR MODESTINO GONCALVES'),(1,3,2130,'SENHORA DE OLIVEIRA'),(1,3,2131,'SENHORA DO PORTO'),(1,3,2132,'SENHORA DOS REMEDIOS'),(1,3,2133,'SERICITA'),(1,3,2134,'SERITINGA'),(1,3,2135,'SERRA AZUL DE MINAS'),(1,3,2136,'SERRA DA SAUDADE'),(1,3,2137,'SERRA DO SALITRE'),(1,3,2138,'SERRA DOS AIMORES'),(1,3,2139,'SERRANIA'),(1,3,2140,'SERRANOPOLIS DE MINAS'),(1,3,2141,'SERRANOS'),(1,3,2142,'SERRO'),(1,3,2143,'SETE LAGOAS'),(1,3,2144,'SETUBINHA'),(1,3,2145,'SILVEIRANIA'),(1,3,2146,'SILVIANOPOLIS'),(1,3,2147,'SIMAO PEREIRA'),(1,3,2148,'SIMONESIA'),(1,3,2149,'SOBRALIA'),(1,3,2150,'SOLEDADE DE MINAS'),(1,3,2151,'TABULEIRO'),(1,3,2152,'TAIOBEIRAS'),(1,3,2153,'TAPARUBA'),(1,3,2154,'TAPIRA'),(1,3,2155,'TAPIRAI'),(1,3,2156,'TAQUARACU DE MINAS'),(1,3,2157,'TARUMIRIM'),(1,3,2158,'TEIXEIRAS'),(1,3,2159,'TEOFILO OTONI'),(1,3,2160,'TIMOTEO'),(1,3,2161,'TIRADENTES'),(1,3,2162,'TIROS'),(1,3,2163,'TOCANTINS'),(1,3,2164,'TOCOS DO MOGI'),(1,3,2165,'TOLEDO'),(1,3,2166,'TOMBOS'),(1,3,2167,'TRES CORACOES'),(1,3,2168,'TRES MARIAS'),(1,3,2169,'TRES PONTAS'),(1,3,2170,'TUMIRITINGA'),(1,3,2171,'TUPACIGUARA'),(1,3,2172,'TURMALINA'),(1,3,2173,'TURVOLANDIA'),(1,3,2174,'UBA'),(1,3,2175,'UBAI'),(1,3,2176,'UBAPORANGA'),(1,3,2177,'UBERABA'),(1,3,2178,'UBERLANDIA'),(1,3,2179,'UMBURATIBA'),(1,3,2180,'UNAI'),(1,3,2181,'UNIAO DE MINAS'),(1,3,2182,'URUANA DE MINAS'),(1,3,2183,'URUCANIA'),(1,3,2184,'URUCUIA'),(1,3,2185,'VARGEM ALEGRE'),(1,3,2186,'VARGEM BONITA'),(1,3,2187,'VARGEM GRANDE DO RIO PARDO'),(1,3,2188,'VARGINHA'),(1,3,2189,'VARJAO DE MINAS'),(1,3,2190,'VARZEA DA PALMA'),(1,3,2191,'VARZELANDIA'),(1,3,2192,'VAZANTE'),(1,3,2193,'VERDELANDIA'),(1,3,2194,'VEREDINHA'),(1,3,2195,'VERISSIMO'),(1,3,2196,'VERMELHO NOVO'),(1,3,2197,'VESPASIANO'),(1,3,2198,'VICOSA'),(1,3,2199,'VIEIRAS'),(1,3,2200,'VIRGEM DA LAPA'),(1,3,2201,'VIRGINIA'),(1,3,2202,'VIRGINOPOLIS'),(1,3,2203,'VIRGOLANDIA'),(1,3,2204,'VISCONDE DO RIO BRANCO'),(1,3,2205,'VOLTA GRANDE'),(1,3,2206,'WENCESLAU BRAZ'),(1,16,2207,'AGUA CLARA'),(1,16,2208,'ALCINOPOLIS'),(1,16,2209,'AMAMBAI'),(1,16,2210,'ANASTACIO'),(1,16,2211,'ANAURILANDIA'),(1,16,2212,'ANGELICA'),(1,16,2213,'ANTONIO JOAO'),(1,16,2214,'APARECIDA DO TABOADO'),(1,16,2215,'AQUIDAUANA'),(1,16,2216,'ARAL MOREIRA'),(1,16,2217,'BANDEIRANTES'),(1,16,2218,'BATAGUASSU'),(1,16,2219,'BATAIPORA'),(1,16,2220,'BELA VISTA'),(1,16,2221,'BODOQUENA'),(1,16,2222,'BONITO'),(1,16,2223,'BRASILANDIA'),(1,16,2224,'CAARAPO'),(1,16,2225,'CAMAPUA'),(1,16,2226,'CAMPO GRANDE'),(1,16,2227,'CARACOL'),(1,16,2228,'CASSILANDIA'),(1,16,2229,'CHAPADAO DO SUL'),(1,16,2230,'CORGUINHO'),(1,16,2231,'CORONEL SAPUCAIA'),(1,16,2232,'CORUMBA'),(1,16,2233,'COSTA RICA'),(1,16,2234,'COXIM'),(1,16,2235,'DEODAPOLIS'),(1,16,2236,'DOIS IRMAOS DO BURITI'),(1,16,2237,'DOURADINA'),(1,16,2238,'DOURADOS'),(1,16,2239,'ELDORADO'),(1,16,2240,'FATIMA DO SUL'),(1,16,2241,'FIGUEIRÃƒO'),(1,16,2242,'GLORIA DE DOURADOS'),(1,16,2243,'GUIA LOPES DA LAGUNA'),(1,16,2244,'IGUATEMI'),(1,16,2245,'INOCENCIA'),(1,16,2246,'ITAPORA'),(1,16,2247,'ITAQUIRAI'),(1,16,2248,'IVINHEMA'),(1,16,2249,'JAPORA'),(1,16,2250,'JARAGUARI'),(1,16,2251,'JARDIM'),(1,16,2252,'JATEI'),(1,16,2253,'JUTI'),(1,16,2254,'LADARIO'),(1,16,2255,'LAGUNA CARAPA'),(1,16,2256,'MARACAJU'),(1,16,2257,'MIRANDA'),(1,16,2258,'MUNDO NOVO'),(1,16,2259,'NAVIRAI'),(1,16,2260,'NIOAQUE'),(1,16,2261,'NOVA ALVORADA DO SUL'),(1,16,2262,'NOVA ANDRADINA'),(1,16,2263,'NOVO HORIZONTE DO SUL'),(1,16,2264,'PARANAIBA'),(1,16,2265,'PARANHOS'),(1,16,2266,'PEDRO GOMES'),(1,16,2267,'PONTA PORA'),(1,16,2268,'PORTO MURTINHO'),(1,16,2269,'RIBAS DO RIO PARDO'),(1,16,2270,'RIO BRILHANTE'),(1,16,2271,'RIO NEGRO'),(1,16,2272,'RIO VERDE DE MATO GROSSO'),(1,16,2273,'ROCHEDO'),(1,16,2274,'SANTA RITA DO PARDO'),(1,16,2275,'SAO GABRIEL DO OESTE'),(1,16,2276,'SELVIRIA'),(1,16,2277,'SETE QUEDAS'),(1,16,2278,'SIDROLANDIA'),(1,16,2279,'SONORA'),(1,16,2280,'TACURU'),(1,16,2281,'TAQUARUSSU'),(1,16,2282,'TERENOS'),(1,16,2283,'TRES LAGOAS'),(1,16,2284,'VICENTINA'),(1,15,2285,'ACORIZAL'),(1,15,2286,'AGUA BOA'),(1,15,2287,'ALTA FLORESTA'),(1,15,2288,'ALTO ARAGUAIA'),(1,15,2289,'ALTO BOA VISTA'),(1,15,2290,'ALTO GARCAS'),(1,15,2291,'ALTO PARAGUAI'),(1,15,2292,'ALTO TAQUARI'),(1,15,2293,'APIACAS'),(1,15,2294,'ARAGUAIANA'),(1,15,2295,'ARAGUAINHA'),(1,15,2296,'ARAPUTANGA'),(1,15,2297,'ARENAPOLIS'),(1,15,2298,'ARIPUANA'),(1,15,2299,'BARAO DE MELGACO'),(1,15,2300,'BARRA DO BUGRES'),(1,15,2301,'BARRA DO GARCAS'),(1,15,2302,'BOM JESUS DO ARAGUAIA'),(1,15,2303,'BRASNORTE'),(1,15,2304,'CACERES'),(1,15,2305,'CAMPINAPOLIS'),(1,15,2306,'CAMPO NOVO DO PARECIS'),(1,15,2307,'CAMPO VERDE'),(1,15,2308,'CAMPOS DE JULIO'),(1,15,2309,'CANA BRAVA DO NORTE'),(1,15,2310,'CANARANA'),(1,15,2311,'CARLINDA'),(1,15,2312,'CASTANHEIRA'),(1,15,2313,'CHAPADA DOS GUIMARAES'),(1,15,2314,'CLAUDIA'),(1,15,2315,'COCALINHO'),(1,15,2316,'COLIDER'),(1,15,2317,'COLNIZA'),(1,15,2318,'COMODORO'),(1,15,2319,'CONFRESA'),(1,15,2320,'CONQUISTA DOESTE'),(1,15,2321,'COTRIGUACU'),(1,15,2322,'CURVELANDIA'),(1,15,2323,'DENISE'),(1,15,2324,'DIAMANTINO'),(1,15,2325,'DOM AQUINO'),(1,15,2326,'FELIZ NATAL'),(1,15,2327,'FIGUEIROPOLIS DOESTE'),(1,15,2328,'GAUCHA DO NORTE'),(1,15,2329,'GENERAL CARNEIRO'),(1,15,2330,'GLORIA DOESTE'),(1,15,2331,'GUARANTA DO NORTE'),(1,15,2332,'GUIRATINGA'),(1,15,2333,'INDIAVAI'),(1,15,2334,'IPIRANGA DO NORTE'),(1,15,2335,'ITANHANGÃ'),(1,15,2336,'ITAUBA'),(1,15,2337,'ITIQUIRA'),(1,15,2338,'JACIARA'),(1,15,2339,'JANGADA'),(1,15,2340,'JAURU'),(1,15,2341,'JUARA'),(1,15,2342,'JUINA'),(1,15,2343,'JURUENA'),(1,15,2344,'JUSCIMEIRA'),(1,15,2345,'LAMBARI DOESTE'),(1,15,2346,'LUCAS DO RIO VERDE'),(1,15,2347,'LUCIARA'),(1,15,2348,'MARCELANDIA'),(1,15,2349,'MATUPA'),(1,15,2350,'MIRASSOL DOESTE'),(1,15,2351,'NOBRES'),(1,15,2352,'NORTELANDIA'),(1,15,2353,'NOSSA SENHORA DO LIVRAMENTO'),(1,15,2354,'NOVA BANDEIRANTES'),(1,15,2355,'NOVA BRASILANDIA'),(1,15,2356,'NOVA CANAA DO NORTE'),(1,15,2357,'NOVA GUARITA'),(1,15,2358,'NOVA LACERDA'),(1,15,2359,'NOVA MARILANDIA'),(1,15,2360,'NOVA MARINGA'),(1,15,2361,'NOVA MONTE VERDE'),(1,15,2362,'NOVA MUTUM'),(1,15,2363,'NOVA NAZARE'),(1,15,2364,'NOVA OLIMPIA'),(1,15,2365,'NOVA SANTA HELENA'),(1,15,2366,'NOVA UBIRATA'),(1,15,2367,'NOVA XAVANTINA'),(1,15,2368,'NOVO HORIZONTE DO NORTE'),(1,15,2369,'NOVO MUNDO'),(1,15,2370,'NOVO SANTO ANTONIO'),(1,15,2371,'NOVO SAO JOAQUIM'),(1,15,2372,'PARANAITA'),(1,15,2373,'PARANATINGA'),(1,15,2374,'PEDRA PRETA'),(1,15,2375,'PEIXOTO DE AZEVEDO'),(1,15,2376,'PLANALTO DA SERRA'),(1,15,2377,'POCONE'),(1,15,2378,'PONTAL DO ARAGUAIA'),(1,15,2379,'PONTE BRANCA'),(1,15,2380,'PONTES E LACERDA'),(1,15,2381,'PORTO ALEGRE DO NORTE'),(1,15,2382,'PORTO DOS GAUCHOS'),(1,15,2383,'PORTO ESPERIDIAO'),(1,15,2384,'PORTO ESTRELA'),(1,15,2385,'POXOREO'),(1,15,2386,'PRIMAVERA DO LESTE'),(1,15,2387,'QUERENCIA'),(1,15,2388,'RESERVA DO CABACAL'),(1,15,2389,'RIBEIRAO CASCALHEIRA'),(1,15,2390,'RIBEIRAOZINHO'),(1,15,2391,'RIO BRANCO'),(1,15,2392,'RONDOLANDIA'),(1,15,2393,'RONDONOPOLIS'),(1,15,2394,'ROSARIO OESTE'),(1,15,2395,'SALTO DO CEU'),(1,15,2396,'SANTA CARMEN'),(1,15,2397,'SANTA CRUZ DO XINGU'),(1,15,2398,'SANTA RITA DO TRIVELATO'),(1,15,2399,'SANTA TEREZINHA'),(1,15,2400,'SANTO AFONSO'),(1,15,2401,'SANTO ANTONIO DO LESTE'),(1,15,2402,'SANTO ANTONIO DO LEVERGER'),(1,15,2403,'SAO FELIX DO ARAGUAIA'),(1,15,2404,'SAO JOSE DO POVO'),(1,15,2405,'SAO JOSE DO RIO CLARO'),(1,15,2406,'SAO JOSE DO XINGU'),(1,15,2407,'SAO JOSE DOS QUATRO MARCOS'),(1,15,2408,'SAO PEDRO DA CIPA'),(1,15,2409,'SAPEZAL'),(1,15,2410,'SERRA NOVA DOURADA'),(1,15,2411,'SINOP'),(1,15,2412,'SORRISO'),(1,15,2413,'TABAPORA'),(1,15,2414,'TANGARA DA SERRA'),(1,15,2415,'TAPURAH'),(1,15,2416,'TERRA NOVA DO NORTE'),(1,15,2417,'TESOURO'),(1,15,2418,'TORIXOREU'),(1,15,2419,'UNIAO DO SUL'),(1,15,2420,'VALE DE SAO DOMINGOS'),(1,15,2421,'VARZEA GRANDE'),(1,15,2422,'VERA'),(1,15,2423,'VILA BELA SANTISSIMA TRINDADE'),(1,15,2424,'VILA RICA'),(1,17,2425,'ABAETETUBA'),(1,17,2426,'ABEL FIGUEIREDO'),(1,17,2427,'ACARA'),(1,17,2428,'AFUA'),(1,17,2429,'AGUA AZUL DO NORTE'),(1,17,2430,'ALENQUER'),(1,17,2431,'ALMEIRIM'),(1,17,2432,'ALTAMIRA'),(1,17,2433,'ANAJAS'),(1,17,2434,'ANANINDEUA'),(1,17,2435,'ANAPU'),(1,17,2436,'AUGUSTO CORREA'),(1,17,2437,'AURORA DO PARA'),(1,17,2438,'AVEIRO'),(1,17,2439,'BAGRE'),(1,17,2440,'BAIAO'),(1,17,2441,'BANNACH'),(1,17,2442,'BARCARENA'),(1,17,2443,'BELEM'),(1,17,2444,'BELTERRA'),(1,17,2445,'BENEVIDES'),(1,17,2446,'BOM JESUS DO TOCANTINS'),(1,17,2447,'BONITO'),(1,17,2448,'BRAGANCA'),(1,17,2449,'BRASIL NOVO'),(1,17,2450,'BREJO GRANDE DO ARAGUAIA'),(1,17,2451,'BREU BRANCO'),(1,17,2452,'BREVES'),(1,17,2453,'BUJARU'),(1,17,2454,'CACHOEIRA DO ARARI'),(1,17,2455,'CACHOEIRA DO PIRIA'),(1,17,2456,'CAMETA'),(1,17,2457,'CANAA DOS CARAJAS'),(1,17,2458,'CAPANEMA'),(1,17,2459,'CAPITAO POCO'),(1,17,2460,'CASTANHAL'),(1,17,2461,'CHAVES'),(1,17,2462,'COLARES'),(1,17,2463,'CONCEICAO DO ARAGUAIA'),(1,17,2464,'CONCORDIA DO PARA'),(1,17,2465,'CUMARU DO NORTE'),(1,17,2466,'CURIONOPOLIS'),(1,17,2467,'CURRALINHO'),(1,17,2468,'CURUA'),(1,17,2469,'CURUCA'),(1,17,2470,'DOM ELISEU'),(1,17,2471,'ELDORADO DOS CARAJAS'),(1,17,2472,'FARO'),(1,17,2473,'FLORESTA DO ARAGUAIA'),(1,17,2474,'GARRAFAO DO NORTE'),(1,17,2475,'GOIANESIA DO PARA'),(1,17,2476,'GURUPA'),(1,17,2477,'IGARAPE-ACU'),(1,17,2478,'IGARAPE-MIRI'),(1,17,2479,'INHANGAPI'),(1,17,2480,'IPIXUNA DO PARA'),(1,17,2481,'IRITUIA'),(1,17,2482,'ITAITUBA'),(1,17,2483,'ITUPIRANGA'),(1,17,2484,'JACAREACANGA'),(1,17,2485,'JACUNDA'),(1,17,2486,'JURUTI'),(1,17,2487,'LIMOEIRO DO AJURU'),(1,17,2488,'MAE DO RIO'),(1,17,2489,'MAGALHAES BARATA'),(1,17,2490,'MARABA'),(1,17,2491,'MARACANA'),(1,17,2492,'MARAPANIM'),(1,17,2493,'MARITUBA'),(1,17,2494,'MEDICILANDIA'),(1,17,2495,'MELGACO'),(1,17,2496,'MOCAJUBA'),(1,17,2497,'MOJU'),(1,17,2498,'MONTE ALEGRE'),(1,17,2499,'MUANA'),(1,17,2500,'NOVA ESPERANCA DO PIRIA'),(1,17,2501,'NOVA IPIXUNA'),(1,17,2502,'NOVA TIMBOTEUA'),(1,17,2503,'NOVO PROGRESSO'),(1,17,2504,'NOVO REPARTIMENTO'),(1,17,2505,'OBIDOS'),(1,17,2506,'OEIRAS DO PARA'),(1,17,2507,'ORIXIMINA'),(1,17,2508,'OUREM'),(1,17,2509,'OURILANDIA DO NORTE'),(1,17,2510,'PACAJA'),(1,17,2511,'PALESTINA DO PARA'),(1,17,2512,'PARAGOMINAS'),(1,17,2513,'PARAUAPEBAS'),(1,17,2514,'PAU DARCO'),(1,17,2515,'PEIXE BOI'),(1,17,2516,'PICARRA'),(1,17,2517,'PLACAS'),(1,17,2518,'PONTA DE PEDRAS'),(1,17,2519,'PORTEL'),(1,17,2520,'PORTO DE MOZ'),(1,17,2521,'PRAINHA'),(1,17,2522,'PRIMAVERA'),(1,17,2523,'QUATIPURU'),(1,17,2524,'REDENCAO'),(1,17,2525,'RIO MARIA'),(1,17,2526,'RONDON DO PARA'),(1,17,2527,'RUROPOLIS'),(1,17,2528,'SALINOPOLIS'),(1,17,2529,'SALVATERRA'),(1,17,2530,'SANTA BARBARA DO PARA'),(1,17,2531,'SANTA CRUZ DO ARARI'),(1,17,2532,'SANTA ISABEL DO PARA'),(1,17,2533,'SANTA LUZIA DO PARA'),(1,17,2534,'SANTA MARIA DAS BARREIRAS'),(1,17,2535,'SANTA MARIA DO PARA'),(1,17,2536,'SANTANA DO ARAGUAIA'),(1,17,2537,'SANTAREM'),(1,17,2538,'SANTAREM NOVO'),(1,17,2539,'SANTO ANTONIO DO TAUA'),(1,17,2540,'SAO CAETANO DE ODIVELAS'),(1,17,2541,'SAO DOMINGOS DO ARAGUAIA'),(1,17,2542,'SAO DOMINGOS DO CAPIM'),(1,17,2543,'SAO FELIX DO XINGU'),(1,17,2544,'SAO FRANCISCO DO PARA'),(1,17,2545,'SAO GERALDO DO ARAGUAIA'),(1,17,2546,'SAO JOAO DA PONTA'),(1,17,2547,'SAO JOAO DE PIRABAS'),(1,17,2548,'SAO JOAO DO ARAGUAIA'),(1,17,2549,'SAO MIGUEL DO GUAMA'),(1,17,2550,'SAO SEBASTIAO DA BOA VISTA'),(1,17,2551,'SAPUCAIA'),(1,17,2552,'SENADOR JOSE PORFIRIO'),(1,17,2553,'SOURE'),(1,17,2554,'TAILANDIA'),(1,17,2555,'TERRA ALTA'),(1,17,2556,'TERRA SANTA'),(1,17,2557,'TOME-ACU'),(1,17,2558,'TRACUATEUA'),(1,17,2559,'TRAIRAO'),(1,17,2560,'TUCUMA'),(1,17,2561,'TUCURUI'),(1,17,2562,'ULIANOPOLIS'),(1,17,2563,'URUARA'),(1,17,2564,'VIGIA'),(1,17,2565,'VISEU'),(1,17,2566,'VITORIA DO XINGU'),(1,17,2567,'XINGUARA'),(1,18,2568,'AGUA BRANCA'),(1,18,2569,'AGUIAR'),(1,18,2570,'ALAGOA GRANDE'),(1,18,2571,'ALAGOA NOVA'),(1,18,2572,'ALAGOINHA'),(1,18,2573,'ALCANTIL'),(1,18,2574,'ALGODAO DE JANDAIRA'),(1,18,2575,'ALHANDRA'),(1,18,2576,'AMPARO'),(1,18,2577,'APARECIDA'),(1,18,2578,'ARACAGI'),(1,18,2579,'ARARA'),(1,18,2580,'ARARUNA'),(1,18,2581,'AREIA'),(1,18,2582,'AREIA DE BARAUNAS'),(1,18,2583,'AREIAL'),(1,18,2584,'AROEIRAS'),(1,18,2585,'ASSUNCAO'),(1,18,2586,'BAIA DA TRAICAO'),(1,18,2587,'BANANEIRAS'),(1,18,2588,'BARAUNA'),(1,18,2589,'BARRA DE SANTA ROSA'),(1,18,2590,'BARRA DE SANTANA'),(1,18,2591,'BARRA DE SAO MIGUEL'),(1,18,2592,'BAYEUX'),(1,18,2593,'BELEM'),(1,18,2594,'BELEM DO BREJO DO CRUZ'),(1,18,2595,'BERNARDINO BATISTA'),(1,18,2596,'BOA VENTURA'),(1,18,2597,'BOA VISTA'),(1,18,2598,'BOM JESUS'),(1,18,2599,'BOM SUCESSO'),(1,18,2600,'BONITO DE SANTA FE'),(1,18,2601,'BOQUEIRAO'),(1,18,2602,'BORBOREMA'),(1,18,2603,'BREJO DO CRUZ'),(1,18,2604,'BREJO DOS SANTOS'),(1,18,2605,'CAAPORA'),(1,18,2606,'CABACEIRAS'),(1,18,2607,'CABEDELO'),(1,18,2608,'CACHOEIRA DOS INDIOS'),(1,18,2609,'CACIMBA DE AREIA'),(1,18,2610,'CACIMBA DE DENTRO'),(1,18,2611,'CACIMBAS'),(1,18,2612,'CAICARA'),(1,18,2613,'CAJAZEIRAS'),(1,18,2614,'CAJAZEIRINHAS'),(1,18,2615,'CALDAS BRANDAO'),(1,18,2616,'CAMALAU'),(1,18,2617,'CAMPINA GRANDE'),(1,18,2618,'CAMPO DE SANTANA'),(1,18,2619,'CAPIM'),(1,18,2620,'CARAUBAS'),(1,18,2621,'CARRAPATEIRA'),(1,18,2622,'CASSERENGUE'),(1,18,2623,'CATINGUEIRA'),(1,18,2624,'CATOLE DO ROCHA'),(1,18,2625,'CATURITE'),(1,18,2626,'CONCEICAO'),(1,18,2627,'CONDADO'),(1,18,2628,'CONDE'),(1,18,2629,'CONGO'),(1,18,2630,'COREMAS'),(1,18,2631,'COXIXOLA'),(1,18,2632,'CRUZ DO ESPIRITO SANTO'),(1,18,2633,'CUBATI'),(1,18,2634,'CUITE'),(1,18,2635,'CUITE DE MAMANGUAPE'),(1,18,2636,'CUITEGI'),(1,18,2637,'CURRAL DE CIMA'),(1,18,2638,'CURRAL VELHO'),(1,18,2639,'DAMIAO'),(1,18,2640,'DESTERRO'),(1,18,2641,'DIAMANTE'),(1,18,2642,'DONA INES'),(1,18,2643,'DUAS ESTRADAS'),(1,18,2644,'EMAS'),(1,18,2645,'ESPERANCA'),(1,18,2646,'FAGUNDES'),(1,18,2647,'FREI MARTINHO'),(1,18,2648,'GADO BRAVO'),(1,18,2649,'GUARABIRA'),(1,18,2650,'GURINHEM'),(1,18,2651,'GURJAO'),(1,18,2652,'IBIARA'),(1,18,2653,'IGARACY'),(1,18,2654,'IMACULADA'),(1,18,2655,'INGA'),(1,18,2656,'ITABAIANA'),(1,18,2657,'ITAPORANGA'),(1,18,2658,'ITAPOROROCA'),(1,18,2659,'ITATUBA'),(1,18,2660,'JACARAU'),(1,18,2661,'JERICO'),(1,18,2662,'JOAO PESSOA'),(1,18,2663,'JUAREZ TAVORA'),(1,18,2664,'JUAZEIRINHO'),(1,18,2665,'JUNCO DO SERIDO'),(1,18,2666,'JURIPIRANGA'),(1,18,2667,'JURU'),(1,18,2668,'LAGOA'),(1,18,2669,'LAGOA DE DENTRO'),(1,18,2670,'LAGOA SECA'),(1,18,2671,'LASTRO'),(1,18,2672,'LIVRAMENTO'),(1,18,2673,'LOGRADOURO'),(1,18,2674,'LUCENA'),(1,18,2675,'MAE DAGUA'),(1,18,2676,'MALTA'),(1,18,2677,'MAMANGUAPE'),(1,18,2678,'MANAIRA'),(1,18,2679,'MARCACAO'),(1,18,2680,'MARI'),(1,18,2681,'MARIZOPOLIS'),(1,18,2682,'MASSARANDUBA'),(1,18,2683,'MATARACA'),(1,18,2684,'MATINHAS'),(1,18,2685,'MATO GROSSO'),(1,18,2686,'MATUREIA'),(1,18,2687,'MOGEIRO'),(1,18,2688,'MONTADAS'),(1,18,2689,'MONTE HOREBE'),(1,18,2690,'MONTEIRO'),(1,18,2691,'MULUNGU'),(1,18,2692,'NATUBA'),(1,18,2693,'NAZAREZINHO'),(1,18,2694,'NOVA FLORESTA'),(1,18,2695,'NOVA OLINDA'),(1,18,2696,'NOVA PALMEIRA'),(1,18,2697,'OLHO DAGUA'),(1,18,2698,'OLIVEDOS'),(1,18,2699,'OURO VELHO'),(1,18,2700,'PARARI'),(1,18,2701,'PASSAGEM'),(1,18,2702,'PATOS'),(1,18,2703,'PAULISTA'),(1,18,2704,'PEDRA BRANCA'),(1,18,2705,'PEDRA LAVRADA'),(1,18,2706,'PEDRAS DE FOGO'),(1,18,2707,'PEDRO REGIS'),(1,18,2708,'PIANCO'),(1,18,2709,'PICUI'),(1,18,2710,'PILAR'),(1,18,2711,'PILOES'),(1,18,2712,'PILOEZINHOS'),(1,18,2713,'PIRPIRITUBA'),(1,18,2714,'PITIMBU'),(1,18,2715,'POCINHOS'),(1,18,2716,'POCO DANTAS'),(1,18,2717,'POCO DE JOSE DE MOURA'),(1,18,2718,'POMBAL'),(1,18,2719,'PRATA'),(1,18,2720,'PRINCESA ISABEL'),(1,18,2721,'PUXINANA'),(1,18,2722,'QUEIMADAS'),(1,18,2723,'QUIXABA'),(1,18,2724,'REMIGIO'),(1,18,2725,'RIACHAO'),(1,18,2726,'RIACHAO DO BACAMARTE'),(1,18,2727,'RIACHAO DO POCO'),(1,18,2728,'RIACHO DE SANTO ANTONIO'),(1,18,2729,'RIACHO DOS CAVALOS'),(1,18,2730,'RIO TINTO'),(1,18,2731,'SALGADINHO'),(1,18,2732,'SALGADO DE SAO FELIX'),(1,18,2733,'SANTA CECILIA'),(1,18,2734,'SANTA CRUZ'),(1,18,2735,'SANTA HELENA'),(1,18,2736,'SANTA INES'),(1,18,2737,'SANTA LUZIA'),(1,18,2738,'SANTA RITA'),(1,18,2739,'SANTA TERESINHA'),(1,18,2740,'SANTANA DE MANGUEIRA'),(1,18,2741,'SANTANA DOS GARROTES'),(1,18,2742,'SANTAREM'),(1,18,2743,'SANTO ANDRE'),(1,18,2744,'SÃƒO BENTINHO'),(1,18,2745,'SAO BENTO'),(1,18,2746,'SAO DOMINGOS DE POMBAL'),(1,18,2747,'SAO DOMINGOS DO CARIRI'),(1,18,2748,'SAO FRANCISCO'),(1,18,2749,'SAO JOAO DO CARIRI'),(1,18,2750,'SAO JOAO DO RIO DO PEIXE'),(1,18,2751,'SAO JOAO DO TIGRE'),(1,18,2752,'SAO JOSE DA LAGOA TAPADA'),(1,18,2753,'SAO JOSE DE CAIANA'),(1,18,2754,'SAO JOSE DE ESPINHARAS'),(1,18,2755,'SAO JOSE DE PIRANHAS'),(1,18,2756,'SAO JOSE DE PRINCESA'),(1,18,2757,'SAO JOSE DO BONFIM'),(1,18,2758,'SAO JOSE DO BREJO DO CRUZ'),(1,18,2759,'SAO JOSE DO SABUGI'),(1,18,2760,'SAO JOSE DOS CORDEIROS'),(1,18,2761,'SAO JOSE DOS RAMOS'),(1,18,2762,'SAO MAMEDE'),(1,18,2763,'SAO MIGUEL DE TAIPU'),(1,18,2764,'SAO SEBASTIAO DE LAGOA DE ROCA'),(1,18,2765,'SAO SEBASTIAO DO UMBUZEIRO'),(1,18,2766,'SAPE'),(1,18,2767,'SERIDO'),(1,18,2768,'SERRA BRANCA'),(1,18,2769,'SERRA DA RAIZ'),(1,18,2770,'SERRA GRANDE'),(1,18,2771,'SERRA REDONDA'),(1,18,2772,'SERRARIA'),(1,18,2773,'SERTAOZINHO'),(1,18,2774,'SOBRADO'),(1,18,2775,'SOLANEA'),(1,18,2776,'SOLEDADE'),(1,18,2777,'SOSSEGO'),(1,18,2778,'SOUSA'),(1,18,2779,'SUME'),(1,18,2780,'TAPEROA'),(1,18,2781,'TAVARES'),(1,18,2782,'TEIXEIRA'),(1,18,2783,'TENORIO'),(1,18,2784,'TRIUNFO'),(1,18,2785,'UIRAUNA'),(1,18,2786,'UMBUZEIRO'),(1,18,2787,'VARZEA'),(1,18,2788,'VIEIROPOLIS'),(1,18,2789,'VISTA SERRANA'),(1,18,2790,'ZABELE'),(1,20,2791,'ABREU E LIMA'),(1,20,2792,'AFOGADOS DA INGAZEIRA'),(1,20,2793,'AFRANIO'),(1,20,2794,'AGRESTINA'),(1,20,2795,'AGUA PRETA'),(1,20,2796,'AGUAS BELAS'),(1,20,2797,'ALAGOINHA'),(1,20,2798,'ALIANCA'),(1,20,2799,'ALTINHO'),(1,20,2800,'AMARAJI'),(1,20,2801,'ANGELIM'),(1,20,2802,'ARACOIABA'),(1,20,2803,'ARARIPINA'),(1,20,2804,'ARCOVERDE'),(1,20,2805,'BARRA DE GUABIRABA'),(1,20,2806,'BARREIROS'),(1,20,2807,'BELEM DE MARIA'),(1,20,2808,'BELEM DE SAO FRANCISCO'),(1,20,2809,'BELO JARDIM'),(1,20,2810,'BETANIA'),(1,20,2811,'BEZERROS'),(1,20,2812,'BODOCO'),(1,20,2813,'BOM CONSELHO'),(1,20,2814,'BOM JARDIM'),(1,20,2815,'BONITO'),(1,20,2816,'BREJAO'),(1,20,2817,'BREJINHO'),(1,20,2818,'BREJO DA MADRE DE DEUS'),(1,20,2819,'BUENOS AIRES'),(1,20,2820,'BUIQUE'),(1,20,2821,'CABO DE SANTO AGOSTINHO'),(1,20,2822,'CABROBO'),(1,20,2823,'CACHOEIRINHA'),(1,20,2824,'CAETES'),(1,20,2825,'CALCADO'),(1,20,2826,'CALUMBI'),(1,20,2827,'CAMARAGIBE'),(1,20,2828,'CAMOCIM DE SAO FELIX'),(1,20,2829,'CAMUTANGA'),(1,20,2830,'CANHOTINHO'),(1,20,2831,'CAPOEIRAS'),(1,20,2832,'CARNAIBA'),(1,20,2833,'CARNAUBEIRAS DA PENHA'),(1,20,2834,'CARPINA'),(1,20,2835,'CARUARU'),(1,20,2836,'CASINHAS'),(1,20,2837,'CATENDE'),(1,20,2838,'CEDRO'),(1,20,2839,'CHA DE ALEGRIA'),(1,20,2840,'CHA GRANDE'),(1,20,2841,'CONDADO'),(1,20,2842,'CORRENTES'),(1,20,2843,'CORTES'),(1,20,2844,'CUMARU'),(1,20,2845,'CUPIRA'),(1,20,2846,'CUSTODIA'),(1,20,2847,'DORMENTES'),(1,20,2848,'ESCADA'),(1,20,2849,'EXU'),(1,20,2850,'FEIRA NOVA'),(1,20,2851,'FERREIROS'),(1,20,2852,'FLORES'),(1,20,2853,'FLORESTA'),(1,20,2854,'FREI MIGUELINHO'),(1,20,2855,'GAMELEIRA'),(1,20,2856,'GARANHUNS'),(1,20,2857,'GLORIA DO GOITA'),(1,20,2858,'GOIANA'),(1,20,2859,'GRANITO'),(1,20,2860,'GRAVATA'),(1,20,2861,'IATI'),(1,20,2862,'IBIMIRIM'),(1,20,2863,'IBIRAJUBA'),(1,20,2864,'IGARASSU'),(1,20,2865,'IGUARACI'),(1,20,2866,'ILHA DE ITAMARACA'),(1,20,2867,'INAJA'),(1,20,2868,'INGAZEIRA'),(1,20,2869,'IPOJUCA'),(1,20,2870,'IPUBI'),(1,20,2871,'ITACURUBA'),(1,20,2872,'ITAIBA'),(1,20,2873,'ITAMBE'),(1,20,2874,'ITAPETIM'),(1,20,2875,'ITAPISSUMA'),(1,20,2876,'ITAQUITINGA'),(1,20,2877,'JABOATAO DOS GUARARAPES'),(1,20,2878,'JAQUEIRA'),(1,20,2879,'JATAUBA'),(1,20,2880,'JATOBA'),(1,20,2881,'JOAO ALFREDO'),(1,20,2882,'JOAQUIM NABUCO'),(1,20,2883,'JUCATI'),(1,20,2884,'JUPI'),(1,20,2885,'JUREMA'),(1,20,2886,'LAGOA DO CARRO'),(1,20,2887,'LAGOA DO ITAENGA'),(1,20,2888,'LAGOA DO OURO'),(1,20,2889,'LAGOA DOS GATOS'),(1,20,2890,'LAGOA GRANDE'),(1,20,2891,'LAJEDO'),(1,20,2892,'LIMOEIRO'),(1,20,2893,'MACAPARANA'),(1,20,2894,'MACHADOS'),(1,20,2895,'MANARI'),(1,20,2896,'MARAIAL'),(1,20,2897,'MIRANDIBA'),(1,20,2898,'MOREILANDIA'),(1,20,2899,'MORENO'),(1,20,2900,'NAZARE DA MATA'),(1,20,2901,'OLINDA'),(1,20,2902,'OROBO'),(1,20,2903,'OROCO'),(1,20,2904,'OURICURI'),(1,20,2905,'PALMARES'),(1,20,2906,'PALMEIRINA'),(1,20,2907,'PANELAS'),(1,20,2908,'PARANATAMA'),(1,20,2909,'PARNAMIRIM'),(1,20,2910,'PASSIRA'),(1,20,2911,'PAUDALHO'),(1,20,2912,'PAULISTA'),(1,20,2913,'PEDRA'),(1,20,2914,'PESQUEIRA'),(1,20,2915,'PETROLANDIA'),(1,20,2916,'PETROLINA'),(1,20,2917,'POCAO'),(1,20,2918,'POMBOS'),(1,20,2919,'PRIMAVERA'),(1,20,2920,'QUIPAPA'),(1,20,2921,'QUIXABA'),(1,20,2922,'RIACHO DAS ALMAS'),(1,20,2923,'RIBEIRAO'),(1,20,2924,'RIO FORMOSO'),(1,20,2925,'SAIRE'),(1,20,2926,'SALGADINHO'),(1,20,2927,'SALGUEIRO'),(1,20,2928,'SALOA'),(1,20,2929,'SANHARO'),(1,20,2930,'SANTA CRUZ'),(1,20,2931,'SANTA CRUZ DA BAIXA VERDE'),(1,20,2932,'SANTA CRUZ DO CAPIBARIBE'),(1,20,2933,'SANTA FILOMENA'),(1,20,2934,'SANTA MARIA DA BOA VISTA'),(1,20,2935,'SANTA MARIA DO CAMBUCA'),(1,20,2936,'SANTA TEREZINHA'),(1,20,2937,'SAO BENEDITO DO SUL'),(1,20,2938,'SAO BENTO DO UNA'),(1,20,2939,'SAO CAITANO'),(1,20,2940,'SAO JOAO'),(1,20,2941,'SAO JOAQUIM DO MONTE'),(1,20,2942,'SAO JOSE DA COROA GRANDE'),(1,20,2943,'SAO JOSE DO BELMONTE'),(1,20,2944,'SAO JOSE DO EGITO'),(1,20,2945,'SAO LOURENCO DA MATA'),(1,20,2946,'SAO VICENTE FERRER'),(1,20,2947,'SERRA TALHADA'),(1,20,2948,'SERRITA'),(1,20,2949,'SERTANIA'),(1,20,2950,'SIRINHAEM'),(1,20,2951,'SOLIDAO'),(1,20,2952,'SURUBIM'),(1,20,2953,'TABIRA'),(1,20,2954,'TACAIMBO'),(1,20,2955,'TACARATU'),(1,20,2956,'TAMANDARE'),(1,20,2957,'TAQUARITINGA DO NORTE'),(1,20,2958,'TEREZINHA'),(1,20,2959,'TERRA NOVA'),(1,20,2960,'TIMBAUBA'),(1,20,2961,'TORITAMA'),(1,20,2962,'TRACUNHAEM'),(1,20,2963,'TRINDADE'),(1,20,2964,'TRIUNFO'),(1,20,2965,'TUPANATINGA'),(1,20,2966,'TUPARETAMA'),(1,20,2967,'VENTUROSA'),(1,20,2968,'VERDEJANTE'),(1,20,2969,'VERTENTE DO LERIO'),(1,20,2970,'VERTENTES'),(1,20,2971,'VICENCIA'),(1,20,2972,'VITORIA DE SANTO ANTAO'),(1,20,2973,'XEXEU'),(1,21,2974,'ACAUA'),(1,21,2975,'AGRICOLANDIA'),(1,21,2976,'AGUA BRANCA'),(1,21,2977,'ALAGOINHA DO PIAUI'),(1,21,2978,'ALEGRETE DO PIAUI'),(1,21,2979,'ALTO LONGA'),(1,21,2980,'ALTOS'),(1,21,2981,'ALVORADA DO GURGUEIA'),(1,21,2982,'AMARANTE'),(1,21,2983,'ANGICAL DO PIAUI'),(1,21,2984,'ANISIO DE ABREU'),(1,21,2985,'ANTONIO ALMEIDA'),(1,21,2986,'AROAZES'),(1,21,2987,'AROEIRAS DO ITAIM'),(1,21,2988,'ARRAIAL'),(1,21,2989,'ASSUNCAO DO PIAUI'),(1,21,2990,'AVELINO LOPES'),(1,21,2991,'BAIXA GRANDE DO RIBEIRO'),(1,21,2992,'BARRA DALCANTARA'),(1,21,2993,'BARRAS'),(1,21,2994,'BARREIRAS DO PIAUI'),(1,21,2995,'BARRO DURO'),(1,21,2996,'BATALHA'),(1,21,2997,'BELA VISTA DO PIAUI'),(1,21,2998,'BELEM DO PIAUI'),(1,21,2999,'BENEDITINOS'),(1,21,3000,'BERTOLINIA'),(1,21,3001,'BETANIA DO PIAUI'),(1,21,3002,'BOA HORA'),(1,21,3003,'BOCAINA'),(1,21,3004,'BOM JESUS'),(1,21,3005,'BOM PRINCIPIO DO PIAUI'),(1,21,3006,'BONFIM DO PIAUI'),(1,21,3007,'BOQUEIRAO DO PIAUI'),(1,21,3008,'BRASILEIRA'),(1,21,3009,'BREJO DO PIAUI'),(1,21,3010,'BURITI DOS LOPES'),(1,21,3011,'BURITI DOS MONTES'),(1,21,3012,'CABECEIRAS DO PIAUI'),(1,21,3013,'CAJAZEIRAS DO PIAUI'),(1,21,3014,'CAJUEIRO DA PRAIA'),(1,21,3015,'CALDEIRAO GRANDE DO PIAUI'),(1,21,3016,'CAMPINAS DO PIAUI'),(1,21,3017,'CAMPO ALEGRE DO FIDALGO'),(1,21,3018,'CAMPO GRANDE DO PIAUI'),(1,21,3019,'CAMPO LARGO DO PIAUI'),(1,21,3020,'CAMPO MAIOR'),(1,21,3021,'CANAVIEIRA'),(1,21,3022,'CANTO DO BURITI'),(1,21,3023,'CAPITAO DE CAMPOS'),(1,21,3024,'CAPITAO GERVASIO OLIVEIRA'),(1,21,3025,'CARACOL'),(1,21,3026,'CARAUBAS DO PIAUI'),(1,21,3027,'CARIDADE DO PIAUI'),(1,21,3028,'CASTELO DO PIAUI'),(1,21,3029,'CAXINGO'),(1,21,3030,'COCAL'),(1,21,3031,'COCAL DE TELHA'),(1,21,3032,'COCAL DOS ALVES'),(1,21,3033,'COIVARAS'),(1,21,3034,'COLONIA DO GURGUEIA'),(1,21,3035,'COLONIA DO PIAUI'),(1,21,3036,'CONCEICAO DO CANINDE'),(1,21,3037,'CORONEL JOSE DIAS'),(1,21,3038,'CORRENTE'),(1,21,3039,'CRISTALANDIA DO PIAUI'),(1,21,3040,'CRISTINO CASTRO'),(1,21,3041,'CURIMATA'),(1,21,3042,'CURRAIS'),(1,21,3043,'CURRAL NOVO DO PIAUI'),(1,21,3044,'CURRALINHOS'),(1,21,3045,'DEMERVAL LOBAO'),(1,21,3046,'DIRCEU ARCOVERDE'),(1,21,3047,'DOM EXPEDITO LOPES'),(1,21,3048,'DOM INOCENCIO'),(1,21,3049,'DOMINGOS MOURAO'),(1,21,3050,'ELESBAO VELOSO'),(1,21,3051,'ELISEU MARTINS'),(1,21,3052,'ESPERANTINA'),(1,21,3053,'FARTURA DO PIAUI'),(1,21,3054,'FLORES DO PIAUI'),(1,21,3055,'FLORESTA DO PIAUI'),(1,21,3056,'FLORIANO'),(1,21,3057,'FRANCINOPOLIS'),(1,21,3058,'FRANCISCO AYRES'),(1,21,3059,'FRANCISCO MACEDO'),(1,21,3060,'FRANCISCO SANTOS'),(1,21,3061,'FRONTEIRAS'),(1,21,3062,'GEMINIANO'),(1,21,3063,'GILBUES'),(1,21,3064,'GUADALUPE'),(1,21,3065,'GUARIBAS'),(1,21,3066,'HUGO NAPOLEAO'),(1,21,3067,'ILHA GRANDE'),(1,21,3068,'INHUMA'),(1,21,3069,'IPIRANGA DO PIAUI'),(1,21,3070,'ISAIAS COELHO'),(1,21,3071,'ITAINOPOLIS'),(1,21,3072,'ITAUEIRA'),(1,21,3073,'JACOBINA DO PIAUI'),(1,21,3074,'JAICOS'),(1,21,3075,'JARDIM DO MULATO'),(1,21,3076,'JATOBA DO PIAUI'),(1,21,3077,'JERUMENHA'),(1,21,3078,'JOAO COSTA'),(1,21,3079,'JOAQUIM PIRES'),(1,21,3080,'JOCA MARQUES'),(1,21,3081,'JOSE DE FREITAS'),(1,21,3082,'JUAZEIRO DO PIAUI'),(1,21,3083,'JULIO BORGES'),(1,21,3084,'JUREMA'),(1,21,3085,'LAGOA ALEGRE'),(1,21,3086,'LAGOA DE SAO FRANCISCO'),(1,21,3087,'LAGOA DO BARRO DO PIAUI'),(1,21,3088,'LAGOA DO PIAUI'),(1,21,3089,'LAGOA DO SITIO'),(1,21,3090,'LAGOINHA DO PIAUI'),(1,21,3091,'LANDRI SALES'),(1,21,3092,'LUIS CORREIA'),(1,21,3093,'LUZILANDIA'),(1,21,3094,'MADEIRO'),(1,21,3095,'MANOEL EMIDIO'),(1,21,3096,'MARCOLANDIA'),(1,21,3097,'MARCOS PARENTE'),(1,21,3098,'MASSAPE DO PIAUI'),(1,21,3099,'MATIAS OLIMPIO'),(1,21,3100,'MIGUEL ALVES'),(1,21,3101,'MIGUEL LEAO'),(1,21,3102,'MILTON BRANDAO'),(1,21,3103,'MONSENHOR GIL'),(1,21,3104,'MONSENHOR HIPOLITO'),(1,21,3105,'MONTE ALEGRE DO PIAUI'),(1,21,3106,'MORRO CABECA NO TEMPO'),(1,21,3107,'MORRO DO CHAPEU DO PIAUI'),(1,21,3108,'MURICI DOS PORTELAS'),(1,21,3109,'NAZARE DO PIAUI'),(1,21,3110,'NOSSA SENHORA DE NAZARE'),(1,21,3111,'NOSSA SENHORA DOS REMEDIOS'),(1,21,3112,'NOVA SANTA RITA'),(1,21,3113,'NOVO ORIENTE DO PIAUI'),(1,21,3114,'NOVO SANTO ANTONIO'),(1,21,3115,'OEIRAS'),(1,21,3116,'OLHO DAGUA DO PIAUI'),(1,21,3117,'PADRE MARCOS'),(1,21,3118,'PAES LANDIM'),(1,21,3119,'PAJEU DO PIAUI'),(1,21,3120,'PALMEIRA DO PIAUI'),(1,21,3121,'PALMEIRAIS'),(1,21,3122,'PAQUETA'),(1,21,3123,'PARNAGUA'),(1,21,3124,'PARNAIBA'),(1,21,3125,'PASSAGEM FRANCA DO PIAUI'),(1,21,3126,'PATOS DO PIAUI'),(1,21,3127,'PAU DARCO DO PIAUI'),(1,21,3128,'PAULISTANA'),(1,21,3129,'PAVUSSU'),(1,21,3130,'PEDRO II'),(1,21,3131,'PEDRO LAURENTINO'),(1,21,3132,'PICOS'),(1,21,3133,'PIMENTEIRAS'),(1,21,3134,'PIO IX'),(1,21,3135,'PIRACURUCA'),(1,21,3136,'PIRIPIRI'),(1,21,3137,'PORTO'),(1,21,3138,'PORTO ALEGRE DO PIAUI'),(1,21,3139,'PRATA DO PIAUI'),(1,21,3140,'QUEIMADA NOVA'),(1,21,3141,'REDENCAO DO GURGUEIA'),(1,21,3142,'REGENERACAO'),(1,21,3143,'RIACHO FRIO'),(1,21,3144,'RIBEIRA DO PIAUI'),(1,21,3145,'RIBEIRO GONCALVES'),(1,21,3146,'RIO GRANDE DO PIAUI'),(1,21,3147,'SANTA CRUZ DO PIAUI'),(1,21,3148,'SANTA CRUZ DOS MILAGRES'),(1,21,3149,'SANTA FILOMENA'),(1,21,3150,'SANTA LUZ'),(1,21,3151,'SANTA ROSA DO PIAUI'),(1,21,3152,'SANTANA DO PIAUI'),(1,21,3153,'SANTO ANTONIO DE LISBOA'),(1,21,3154,'SANTO ANTONIO DOS MILAGRES'),(1,21,3155,'SANTO INACIO DO PIAUI'),(1,21,3156,'SAO BRAZ DO PIAUI'),(1,21,3157,'SAO FELIX DO PIAUI'),(1,21,3158,'SAO FRANCISCO DE ASSIS DO PIAUI'),(1,21,3159,'SAO FRANCISCO DO PIAUI'),(1,21,3160,'SAO GONCALO DO GURGUEIA'),(1,21,3161,'SAO GONCALO DO PIAUI'),(1,21,3162,'SAO JOAO DA CANABRAVA'),(1,21,3163,'SAO JOAO DA FRONTEIRA'),(1,21,3164,'SAO JOAO DA SERRA'),(1,21,3165,'SAO JOAO DA VARJOTA'),(1,21,3166,'SAO JOAO DO ARRAIAL'),(1,21,3167,'SAO JOAO DO PIAUI'),(1,21,3168,'SAO JOSE DO DIVINO'),(1,21,3169,'SAO JOSE DO PEIXE'),(1,21,3170,'SAO JOSE DO PIAUI'),(1,21,3171,'SAO JULIAO'),(1,21,3172,'SAO LOURENCO DO PIAUI'),(1,21,3173,'SAO LUIS DO PIAUI'),(1,21,3174,'SAO MIGUEL DA BAIXA GRANDE'),(1,21,3175,'SAO MIGUEL DO FIDALGO'),(1,21,3176,'SAO MIGUEL DO TAPUIO'),(1,21,3177,'SAO PEDRO DO PIAUI'),(1,21,3178,'SAO RAIMUNDO NONATO'),(1,21,3179,'SEBASTIAO BARROS'),(1,21,3180,'SEBASTIAO LEAL'),(1,21,3181,'SIGEFREDO PACHECO'),(1,21,3182,'SIMOES'),(1,21,3183,'SIMPLICIO MENDES'),(1,21,3184,'SOCORRO DO PIAUI'),(1,21,3185,'SUSSUAPARA'),(1,21,3186,'TAMBORIL DO PIAUI'),(1,21,3187,'TANQUE DO PIAUI'),(1,21,3188,'TERESINA'),(1,21,3189,'UNIAO'),(1,21,3190,'URUCUI'),(1,21,3191,'VALENCA DO PIAUI'),(1,21,3192,'VARZEA BRANCA'),(1,21,3193,'VARZEA GRANDE'),(1,21,3194,'VERA MENDES'),(1,21,3195,'VILA NOVA DO PIAUI'),(1,21,3196,'WALL FERRAZ'),(1,19,3197,'ABATIA'),(1,19,3198,'ADRIANOPOLIS'),(1,19,3199,'AGUDOS DO SUL'),(1,19,3200,'ALMIRANTE TAMANDARE'),(1,19,3201,'ALTAMIRA DO PARANA'),(1,19,3202,'ALTO PARANA'),(1,19,3203,'ALTO PIQUIRI'),(1,19,3204,'ALTONIA'),(1,19,3205,'ALVORADA DO SUL'),(1,19,3206,'AMAPORA'),(1,19,3207,'AMPERE'),(1,19,3208,'ANAHY'),(1,19,3209,'ANDIRA'),(1,19,3210,'ANGULO'),(1,19,3211,'ANTONINA'),(1,19,3212,'ANTONIO OLINTO'),(1,19,3213,'APUCARANA'),(1,19,3214,'ARAPONGAS'),(1,19,3215,'ARAPOTI'),(1,19,3216,'ARAPUA'),(1,19,3217,'ARARUNA'),(1,19,3218,'ARAUCARIA'),(1,19,3219,'ARIRANHA DO IVAI'),(1,19,3220,'ASSAI'),(1,19,3221,'ASSIS CHATEAUBRIAND'),(1,19,3222,'ASTORGA'),(1,19,3223,'ATALAIA'),(1,19,3224,'BALSA NOVA'),(1,19,3225,'BANDEIRANTES'),(1,19,3226,'BARBOSA FERRAZ'),(1,19,3227,'BARRA DO JACARE'),(1,19,3228,'BARRACAO'),(1,19,3229,'BELA VISTA DO CAROBA'),(1,19,3230,'BELA VISTA DO PARAISO'),(1,19,3231,'BITURUNA'),(1,19,3232,'BOA ESPERANCA'),(1,19,3233,'BOA ESPERANCA DO IGUACU'),(1,19,3234,'BOA VENTURA DE SAO ROQUE'),(1,19,3235,'BOA VISTA DA APARECIDA'),(1,19,3236,'BOCAIUVA DO SUL'),(1,19,3237,'BOM JESUS DO SUL'),(1,19,3238,'BOM SUCESSO'),(1,19,3239,'BOM SUCESSO DO SUL'),(1,19,3240,'BORRAZOPOLIS'),(1,19,3241,'BRAGANEY'),(1,19,3242,'BRASILANDIA DO SUL'),(1,19,3243,'CAFEARA'),(1,19,3244,'CAFELANDIA'),(1,19,3245,'CAFEZAL DO SUL'),(1,19,3246,'CALIFORNIA'),(1,19,3247,'CAMBARA'),(1,19,3248,'CAMBE'),(1,19,3249,'CAMBIRA'),(1,19,3250,'CAMPINA DA LAGOA'),(1,19,3251,'CAMPINA DO SIMAO'),(1,19,3252,'CAMPINA GRANDE DO SUL'),(1,19,3253,'CAMPO BONITO'),(1,19,3254,'CAMPO DO TENENTE'),(1,19,3255,'CAMPO LARGO'),(1,19,3256,'CAMPO MAGRO'),(1,19,3257,'CAMPO MOURAO'),(1,19,3258,'CANDIDO DE ABREU'),(1,19,3259,'CANDOI'),(1,19,3260,'CANTAGALO'),(1,19,3261,'CAPANEMA'),(1,19,3262,'CAPITAO LEONIDAS MARQUES'),(1,19,3263,'CARAMBEI'),(1,19,3264,'CARLOPOLIS'),(1,19,3265,'CASCAVEL'),(1,19,3266,'CASTRO'),(1,19,3267,'CATANDUVAS'),(1,19,3268,'CENTENARIO DO SUL'),(1,19,3269,'CERRO AZUL'),(1,19,3270,'CEU AZUL'),(1,19,3271,'CHOPINZINHO'),(1,19,3272,'CIANORTE'),(1,19,3273,'CIDADE GAUCHA'),(1,19,3274,'CLEVELANDIA'),(1,19,3275,'COLOMBO'),(1,19,3276,'COLORADO'),(1,19,3277,'CONGONHINHAS'),(1,19,3278,'CONSELHEIRO MAIRINCK'),(1,19,3279,'CONTENDA'),(1,19,3280,'CORBELIA'),(1,19,3281,'CORNELIO PROCOPIO'),(1,19,3282,'CORONEL DOMINGOS SOARES'),(1,19,3283,'CORONEL VIVIDA'),(1,19,3284,'CORUMBATAI DO SUL'),(1,19,3285,'CRUZ MACHADO'),(1,19,3286,'CRUZEIRO DO IGUACU'),(1,19,3287,'CRUZEIRO DO OESTE'),(1,19,3288,'CRUZEIRO DO SUL'),(1,19,3289,'CRUZMALTINA'),(1,19,3290,'CURIUVA'),(1,19,3291,'DIAMANTE DO NORTE'),(1,19,3292,'DIAMANTE DO SUL'),(1,19,3293,'DIAMANTE DOESTE'),(1,19,3294,'DOIS VIZINHOS'),(1,19,3295,'DOURADINA'),(1,19,3296,'DOUTOR CAMARGO'),(1,19,3297,'DOUTOR ULYSSES'),(1,19,3298,'ENEAS MARQUES'),(1,19,3299,'ENGENHEIRO BELTRAO'),(1,19,3300,'ENTRE RIOS DO OESTE'),(1,19,3301,'ESPERANCA NOVA'),(1,19,3302,'ESPIGAO ALTO DO IGUACU'),(1,19,3303,'FAROL'),(1,19,3304,'FAXINAL'),(1,19,3305,'FAZENDA RIO GRANDE'),(1,19,3306,'FENIX'),(1,19,3307,'FERNANDES PINHEIRO'),(1,19,3308,'FIGUEIRA'),(1,19,3309,'FLOR DA SERRA DO SUL'),(1,19,3310,'FLORAI'),(1,19,3311,'FLORESTA'),(1,19,3312,'FLORESTOPOLIS'),(1,19,3313,'FLORIDA'),(1,19,3314,'FORMOSA DO OESTE'),(1,19,3315,'FOZ DO IGUACU'),(1,19,3316,'FOZ DO JORDAO'),(1,19,3317,'FRANCISCO ALVES'),(1,19,3318,'FRANCISCO BELTRAO'),(1,19,3319,'GENERAL CARNEIRO'),(1,19,3320,'GODOY MOREIRA'),(1,19,3321,'GOIOERE'),(1,19,3322,'GOIOXIM'),(1,19,3323,'GRANDES RIOS'),(1,19,3324,'GUAIRA'),(1,19,3325,'GUAIRACA'),(1,19,3326,'GUAMIRANGA'),(1,19,3327,'GUAPIRAMA'),(1,19,3328,'GUAPOREMA'),(1,19,3329,'GUARACI'),(1,19,3330,'GUARANIACU'),(1,19,3331,'GUARAPUAVA'),(1,19,3332,'GUARAQUECABA'),(1,19,3333,'GUARATUBA'),(1,19,3334,'HONORIO SERPA'),(1,19,3335,'IBAITI'),(1,19,3336,'IBEMA'),(1,19,3337,'IBIPORA'),(1,19,3338,'ICARAIMA'),(1,19,3339,'IGUARACU'),(1,19,3340,'IGUATU'),(1,19,3341,'IMBAU'),(1,19,3342,'IMBITUVA'),(1,19,3343,'INACIO MARTINS'),(1,19,3344,'INAJA'),(1,19,3345,'INDIANOPOLIS'),(1,19,3346,'IPIRANGA'),(1,19,3347,'IPORA'),(1,19,3348,'IRACEMA DO OESTE'),(1,19,3349,'IRATI'),(1,19,3350,'IRETAMA'),(1,19,3351,'ITAGUAJE'),(1,19,3352,'ITAIPULANDIA'),(1,19,3353,'ITAMBARACA'),(1,19,3354,'ITAMBE'),(1,19,3355,'ITAPEJARA DOESTE'),(1,19,3356,'ITAPERUCU'),(1,19,3357,'ITAUNA DO SUL'),(1,19,3358,'IVAI'),(1,19,3359,'IVAIPORA'),(1,19,3360,'IVATE'),(1,19,3361,'IVATUBA'),(1,19,3362,'JABOTI'),(1,19,3363,'JACAREZINHO'),(1,19,3364,'JAGUAPITA'),(1,19,3365,'JAGUARIAIVA'),(1,19,3366,'JANDAIA DO SUL'),(1,19,3367,'JANIOPOLIS'),(1,19,3368,'JAPIRA'),(1,19,3369,'JAPURA'),(1,19,3370,'JARDIM ALEGRE'),(1,19,3371,'JARDIM OLINDA'),(1,19,3372,'JATAIZINHO'),(1,19,3373,'JESUITAS'),(1,19,3374,'JOAQUIM TAVORA'),(1,19,3375,'JUNDIAI DO SUL'),(1,19,3376,'JURANDA'),(1,19,3377,'JUSSARA'),(1,19,3378,'KALORE'),(1,19,3379,'LAPA'),(1,19,3380,'LARANJAL'),(1,19,3381,'LARANJEIRAS DO SUL'),(1,19,3382,'LEOPOLIS'),(1,19,3383,'LIDIANOPOLIS'),(1,19,3384,'LINDOESTE'),(1,19,3385,'LOANDA'),(1,19,3386,'LOBATO'),(1,19,3387,'LONDRINA'),(1,19,3388,'LUIZIANA'),(1,19,3389,'LUNARDELLI'),(1,19,3390,'LUPIONOPOLIS'),(1,19,3391,'MALLET'),(1,19,3392,'MAMBORE'),(1,19,3393,'MANDAGUACU'),(1,19,3394,'MANDAGUARI'),(1,19,3395,'MANDIRITUBA'),(1,19,3396,'MANFRINOPOLIS'),(1,19,3397,'MANGUEIRINHA'),(1,19,3398,'MANOEL RIBAS'),(1,19,3399,'MARECHAL CANDIDO RONDON'),(1,19,3400,'MARIA HELENA'),(1,19,3401,'MARIALVA'),(1,19,3402,'MARILANDIA DO SUL'),(1,19,3403,'MARILENA'),(1,19,3404,'MARILUZ'),(1,19,3405,'MARINGA'),(1,19,3406,'MARIOPOLIS'),(1,19,3407,'MARIPA'),(1,19,3408,'MARMELEIRO'),(1,19,3409,'MARQUINHO'),(1,19,3410,'MARUMBI'),(1,19,3411,'MATELANDIA'),(1,19,3412,'MATINHOS'),(1,19,3413,'MATO RICO'),(1,19,3414,'MAUA DA SERRA'),(1,19,3415,'MEDIANEIRA'),(1,19,3416,'MERCEDES'),(1,19,3417,'MIRADOR'),(1,19,3418,'MIRASELVA'),(1,19,3419,'MISSAL'),(1,19,3420,'MOREIRA SALES'),(1,19,3421,'MORRETES'),(1,19,3422,'MUNHOZ DE MELO'),(1,19,3423,'NOSSA SENHORA DAS GRACAS'),(1,19,3424,'NOVA ALIANCA DO IVAI'),(1,19,3425,'NOVA AMERICA DA COLINA'),(1,19,3426,'NOVA AURORA'),(1,19,3427,'NOVA CANTU'),(1,19,3428,'NOVA ESPERANCA'),(1,19,3429,'NOVA ESPERANCA DO SUDOESTE'),(1,19,3430,'NOVA FATIMA'),(1,19,3431,'NOVA LARANJEIRAS'),(1,19,3432,'NOVA LONDRINA'),(1,19,3433,'NOVA OLIMPIA'),(1,19,3434,'NOVA PRATA DO IGUACU'),(1,19,3435,'NOVA SANTA BARBARA'),(1,19,3436,'NOVA SANTA ROSA'),(1,19,3437,'NOVA TEBAS'),(1,19,3438,'NOVO ITACOLOMI'),(1,19,3439,'ORTIGUEIRA'),(1,19,3440,'OURIZONA'),(1,19,3441,'OURO VERDE DO OESTE'),(1,19,3442,'PAICANDU'),(1,19,3443,'PALMAS'),(1,19,3444,'PALMEIRA'),(1,19,3445,'PALMITAL'),(1,19,3446,'PALOTINA'),(1,19,3447,'PARAISO DO NORTE'),(1,19,3448,'PARANACITY'),(1,19,3449,'PARANAGUA'),(1,19,3450,'PARANAPOEMA'),(1,19,3451,'PARANAVAI'),(1,19,3452,'PATO BRAGADO'),(1,19,3453,'PATO BRANCO'),(1,19,3454,'PAULA FREITAS'),(1,19,3455,'PAULO FRONTIN'),(1,19,3456,'PEABIRU'),(1,19,3457,'PEROBAL'),(1,19,3458,'PEROLA'),(1,19,3459,'PEROLA DOESTE'),(1,19,3460,'PIEN'),(1,19,3461,'PINHAIS'),(1,19,3462,'PINHAL DE SAO BENTO'),(1,19,3463,'PINHALAO'),(1,19,3464,'PINHAO'),(1,19,3465,'PIRAI DO SUL'),(1,19,3466,'PIRAQUARA'),(1,19,3467,'PITANGA'),(1,19,3468,'PITANGUEIRAS'),(1,19,3469,'PLANALTINA DO PARANA'),(1,19,3470,'PLANALTO'),(1,19,3471,'PONTA GROSSA'),(1,19,3472,'PONTAL DO PARANA'),(1,19,3473,'PORECATU'),(1,19,3474,'PORTO AMAZONAS'),(1,19,3475,'PORTO BARREIRO'),(1,19,3476,'PORTO RICO'),(1,19,3477,'PORTO VITORIA'),(1,19,3478,'PRADO FERREIRA'),(1,19,3479,'PRANCHITA'),(1,19,3480,'PRESIDENTE CASTELO BRANCO'),(1,19,3481,'PRIMEIRO DE MAIO'),(1,19,3482,'PRUDENTOPOLIS'),(1,19,3483,'QUARTO CENTENARIO'),(1,19,3484,'QUATIGUA'),(1,19,3485,'QUATRO BARRAS'),(1,19,3486,'QUATRO PONTES'),(1,19,3487,'QUEDAS DO IGUACU'),(1,19,3488,'QUERENCIA DO NORTE'),(1,19,3489,'QUINTA DO SOL'),(1,19,3490,'QUITANDINHA'),(1,19,3491,'RAMILANDIA'),(1,19,3492,'RANCHO ALEGRE'),(1,19,3493,'RANCHO ALEGRE D OESTE'),(1,19,3494,'REALEZA'),(1,19,3495,'REBOUCAS'),(1,19,3496,'RENASCENCA'),(1,19,3497,'RESERVA'),(1,19,3498,'RESERVA DO IGUACU'),(1,19,3499,'RIBEIRAO CLARO'),(1,19,3500,'RIBEIRAO DO PINHAL'),(1,19,3501,'RIO AZUL'),(1,19,3502,'RIO BOM'),(1,19,3503,'RIO BONITO DO IGUACU'),(1,19,3504,'RIO BRANCO DO IVAI'),(1,19,3505,'RIO BRANCO DO SUL'),(1,19,3506,'RIO NEGRO'),(1,19,3507,'ROLANDIA'),(1,19,3508,'RONCADOR'),(1,19,3509,'RONDON'),(1,19,3510,'ROSARIO DO IVAI'),(1,19,3511,'SABAUDIA'),(1,19,3512,'SALGADO FILHO'),(1,19,3513,'SALTO DO ITARARE'),(1,19,3514,'SALTO DO LONTRA'),(1,19,3515,'SANTA AMELIA'),(1,19,3516,'SANTA CECILIA DO PAVAO'),(1,19,3517,'SANTA CRUZ DO MONTE CASTELO'),(1,19,3518,'SANTA FE'),(1,19,3519,'SANTA HELENA'),(1,19,3520,'SANTA INES'),(1,19,3521,'SANTA ISABEL DO IVAI'),(1,19,3522,'SANTA IZABEL DO OESTE'),(1,19,3523,'SANTA LUCIA'),(1,19,3524,'SANTA MARIA DO OESTE'),(1,19,3525,'SANTA MARIANA'),(1,19,3526,'SANTA MONICA'),(1,19,3527,'SANTA TEREZA DO OESTE'),(1,19,3528,'SANTA TEREZINHA DE ITAIPU'),(1,19,3529,'SANTANA DO ITARARE'),(1,19,3530,'SANTO ANTONIO DA PLATINA'),(1,19,3531,'SANTO ANTONIO DO CAIUA'),(1,19,3532,'SANTO ANTONIO DO PARAISO'),(1,19,3533,'SANTO ANTONIO DO SUDOESTE'),(1,19,3534,'SANTO INACIO'),(1,19,3535,'SAO CARLOS DO IVAI'),(1,19,3536,'SAO JERONIMO DA SERRA'),(1,19,3537,'SAO JOAO'),(1,19,3538,'SAO JOAO DO CAIUA'),(1,19,3539,'SAO JOAO DO IVAI'),(1,19,3540,'SAO JOAO DO TRIUNFO'),(1,19,3541,'SAO JORGE DO IVAI'),(1,19,3542,'SAO JORGE DO PATROCINIO'),(1,19,3543,'SAO JORGE DOESTE'),(1,19,3544,'SAO JOSE DA BOA VISTA'),(1,19,3545,'SAO JOSE DAS PALMEIRAS'),(1,19,3546,'SAO JOSE DOS PINHAIS'),(1,19,3547,'SAO MANOEL DO PARANA'),(1,19,3548,'SAO MATEUS DO SUL'),(1,19,3549,'SAO MIGUEL DO IGUACU'),(1,19,3550,'SAO PEDRO DO IGUACU'),(1,19,3551,'SAO PEDRO DO IVAI'),(1,19,3552,'SAO PEDRO DO PARANA'),(1,19,3553,'SAO SEBASTIAO DA AMOREIRA'),(1,19,3554,'SAO TOME'),(1,19,3555,'SAPOPEMA'),(1,19,3556,'SARANDI'),(1,19,3557,'SAUDADE DO IGUACU'),(1,19,3558,'SENGES'),(1,19,3559,'SERRANOPOLIS DO IGUACU'),(1,19,3560,'SERTANEJA'),(1,19,3561,'SERTANOPOLIS'),(1,19,3562,'SIQUEIRA CAMPOS'),(1,19,3563,'SULINA'),(1,19,3564,'TAMARANA'),(1,19,3565,'TAMBOARA'),(1,19,3566,'TAPEJARA'),(1,19,3567,'TAPIRA'),(1,19,3568,'TEIXEIRA SOARES'),(1,19,3569,'TELEMACO BORBA'),(1,19,3570,'TERRA BOA'),(1,19,3571,'TERRA RICA'),(1,19,3572,'TERRA ROXA'),(1,19,3573,'TIBAGI'),(1,19,3574,'TIJUCAS DO SUL'),(1,19,3575,'TOLEDO'),(1,19,3576,'TOMAZINA'),(1,19,3577,'TRES BARRAS DO PARANA'),(1,19,3578,'TUNAS DO PARANÃ'),(1,19,3579,'TUNEIRAS DO OESTE'),(1,19,3580,'TUPASSI'),(1,19,3581,'TURVO'),(1,19,3582,'UBIRATA'),(1,19,3583,'UMUARAMA'),(1,19,3584,'UNIAO DA VITORIA'),(1,19,3585,'UNIFLOR'),(1,19,3586,'URAI'),(1,19,3587,'VENTANIA'),(1,19,3588,'VERA CRUZ DO OESTE'),(1,19,3589,'VERE'),(1,19,3590,'VILA ALTA'),(1,19,3591,'VIRMOND'),(1,19,3592,'VITORINO'),(1,19,3593,'WENCESLAU BRAZ'),(1,19,3594,'XAMBRE'),(1,2,3595,'ANGRA DOS REIS'),(1,2,3596,'APERIBE'),(1,2,3597,'ARARUAMA'),(1,2,3598,'AREAL'),(1,2,3599,'ARMACAO DE BUZIOS'),(1,2,3600,'ARRAIAL DO CABO'),(1,2,3601,'BARRA DO PIRAI'),(1,2,3602,'BARRA MANSA'),(1,2,3603,'BELFORD ROXO'),(1,2,3604,'BOM JARDIM'),(1,2,3605,'BOM JESUS DO ITABAPOANA'),(1,2,3606,'CABO FRIO'),(1,2,3607,'CACHOEIRAS DE MACACU'),(1,2,3608,'CAMBUCI'),(1,2,3609,'CAMPOS DOS GOYTACAZES'),(1,2,3610,'CANTAGALO'),(1,2,3611,'CARAPEBUS'),(1,2,3612,'CARDOSO MOREIRA'),(1,2,3613,'CARMO'),(1,2,3614,'CASIMIRO DE ABREU'),(1,2,3615,'COMENDADOR LEVY GASPARIAN'),(1,2,3616,'CONCEICAO DE MACABU'),(1,2,3617,'CORDEIRO'),(1,2,3618,'DUAS BARRAS'),(1,2,3619,'DUQUE DE CAXIAS'),(1,2,3620,'ENGENHEIRO PAULO DE FRONTIN'),(1,2,3621,'GUAPIMIRIM'),(1,2,3622,'IGUABA GRANDE'),(1,2,3623,'ITABORAI'),(1,2,3624,'ITAGUAI'),(1,2,3625,'ITALVA'),(1,2,3626,'ITAOCARA'),(1,2,3627,'ITAPERUNA'),(1,2,3628,'ITATIAIA'),(1,2,3629,'JAPERI'),(1,2,3630,'LAJE DO MURIAE'),(1,2,3631,'MACAE'),(1,2,3632,'MACUCO'),(1,2,3633,'MAGE'),(1,2,3634,'MANGARATIBA'),(1,2,3635,'MARICA'),(1,2,3636,'MENDES'),(1,2,3637,'MESQUITA'),(1,2,3638,'MIGUEL PEREIRA'),(1,2,3639,'MIRACEMA'),(1,2,3640,'NATIVIDADE'),(1,2,3641,'NILOPOLIS'),(1,2,3642,'NITEROI'),(1,2,3643,'NOVA FRIBURGO'),(1,2,3644,'NOVA IGUACU'),(1,2,3645,'PARACAMBI'),(1,2,3646,'PARAIBA DO SUL'),(1,2,3647,'PARATI'),(1,2,3648,'PATY DO ALFERES'),(1,2,3649,'PETROPOLIS'),(1,2,3650,'PINHEIRAL'),(1,2,3651,'PIRAI'),(1,2,3652,'PORCIUNCULA'),(1,2,3653,'PORTO REAL'),(1,2,3654,'QUATIS'),(1,2,3655,'QUEIMADOS'),(1,2,3656,'QUISSAMA'),(1,2,3657,'RESENDE'),(1,2,3658,'RIO BONITO'),(1,2,3659,'RIO CLARO'),(1,2,3660,'RIO DAS FLORES'),(1,2,3661,'RIO DAS OSTRAS'),(1,2,3662,'SANTA MARIA MADALENA'),(1,2,3663,'SANTO ANTONIO DE PADUA'),(1,2,3664,'SAO FIDELIS'),(1,2,3665,'SAO FRANCISCO DE ITABAPOANA'),(1,2,3666,'SAO GONCALO'),(1,2,3667,'SAO JOAO DA BARRA'),(1,2,3668,'SAO JOAO DE MERITI'),(1,2,3669,'SAO JOSE DE UBA'),(1,2,3670,'SAO JOSE DO VALE DO RIO PRETO'),(1,2,3671,'SAO PEDRO DA ALDEIA'),(1,2,3672,'SAO SEBASTIAO DO ALTO'),(1,2,3673,'SAPUCAIA'),(1,2,3674,'SAQUAREMA'),(1,2,3675,'SEROPEDICA'),(1,2,3676,'SILVA JARDIM'),(1,2,3677,'SUMIDOURO'),(1,2,3678,'TANGUA'),(1,2,3679,'TERESOPOLIS'),(1,2,3680,'TRAJANO DE MORAIS'),(1,2,3681,'TRES RIOS'),(1,2,3682,'VALENCA'),(1,2,3683,'VARRE E SAI'),(1,2,3684,'VASSOURAS'),(1,2,3685,'VOLTA REDONDA'),(1,22,3686,'ACARI'),(1,22,3687,'ACU'),(1,22,3688,'AFONSO BEZERRA'),(1,22,3689,'AGUA NOVA'),(1,22,3690,'ALEXANDRIA'),(1,22,3691,'ALMINO AFONSO'),(1,22,3692,'ALTO DO RODRIGUES'),(1,22,3693,'ANGICOS'),(1,22,3694,'ANTONIO MARTINS'),(1,22,3695,'APODI'),(1,22,3696,'AREIA BRANCA'),(1,22,3697,'ARES'),(1,22,3698,'AUGUSTO SEVERO'),(1,22,3699,'BAIA FORMOSA'),(1,22,3700,'BARAUNA'),(1,22,3701,'BARCELONA'),(1,22,3702,'BENTO FERNANDES'),(1,22,3703,'BODO'),(1,22,3704,'BOM JESUS'),(1,22,3705,'BREJINHO'),(1,22,3706,'CAICARA DO NORTE'),(1,22,3707,'CAICARA DO RIO DO VENTO'),(1,22,3708,'CAICO'),(1,22,3709,'CAMPO REDONDO'),(1,22,3710,'CANGUARETAMA'),(1,22,3711,'CARAUBAS'),(1,22,3712,'CARNAUBA DOS DANTAS'),(1,22,3713,'CARNAUBAIS'),(1,22,3714,'CEARA-MIRIM'),(1,22,3715,'CERRO CORA'),(1,22,3716,'CORONEL EZEQUIEL'),(1,22,3717,'CORONEL JOAO PESSOA'),(1,22,3718,'CRUZETA'),(1,22,3719,'CURRAIS NOVOS'),(1,22,3720,'DOUTOR SEVERIANO'),(1,22,3721,'ENCANTO'),(1,22,3722,'EQUADOR'),(1,22,3723,'ESPIRITO SANTO'),(1,22,3724,'EXTREMOZ'),(1,22,3725,'FELIPE GUERRA'),(1,22,3726,'FERNANDO PEDROZA'),(1,22,3727,'FLORANIA'),(1,22,3728,'FRANCISCO DANTAS'),(1,22,3729,'FRUTUOSO GOMES'),(1,22,3730,'GALINHOS'),(1,22,3731,'GOIANINHA'),(1,22,3732,'GOVERNADOR DIX-SEPT ROSADO'),(1,22,3733,'GROSSOS'),(1,22,3734,'GUAMARE'),(1,22,3735,'IELMO MARINHO'),(1,22,3736,'IPANGUACU'),(1,22,3737,'IPUEIRA'),(1,22,3738,'ITAJA'),(1,22,3739,'ITAU'),(1,22,3740,'JACANA'),(1,22,3741,'JANDAIRA'),(1,22,3742,'JANDUIS'),(1,22,3743,'JANUARIO CICCO'),(1,22,3744,'JAPI'),(1,22,3745,'JARDIM DE ANGICOS'),(1,22,3746,'JARDIM DE PIRANHAS'),(1,22,3747,'JARDIM DO SERIDO'),(1,22,3748,'JOAO CAMARA'),(1,22,3749,'JOAO DIAS'),(1,22,3750,'JOSE DA PENHA'),(1,22,3751,'JUCURUTU'),(1,22,3752,'JUNDIA'),(1,22,3753,'LAGOA DANTA'),(1,22,3754,'LAGOA DE PEDRAS'),(1,22,3755,'LAGOA DE VELHOS'),(1,22,3756,'LAGOA NOVA'),(1,22,3757,'LAGOA SALGADA'),(1,22,3758,'LAJES'),(1,22,3759,'LAJES PINTADAS'),(1,22,3760,'LUCRECIA'),(1,22,3761,'LUIS GOMES'),(1,22,3762,'MACAIBA'),(1,22,3763,'MACAU'),(1,22,3764,'MAJOR SALES'),(1,22,3765,'MARCELINO VIEIRA'),(1,22,3766,'MARTINS'),(1,22,3767,'MAXARANGUAPE'),(1,22,3768,'MESSIAS TARGINO'),(1,22,3769,'MONTANHAS'),(1,22,3770,'MONTE ALEGRE'),(1,22,3771,'MONTE DAS GAMELEIRAS'),(1,22,3772,'MOSSORO'),(1,22,3773,'NISIA FLORESTA'),(1,22,3774,'NOVA CRUZ'),(1,22,3775,'OLHO DAGUA DO BORGES'),(1,22,3776,'OURO BRANCO'),(1,22,3777,'PARANA'),(1,22,3778,'PARAU'),(1,22,3779,'PARAZINHO'),(1,22,3780,'PARELHAS'),(1,22,3781,'PARNAMIRIM'),(1,22,3782,'PASSA E FICA'),(1,22,3783,'PASSAGEM'),(1,22,3784,'PATU'),(1,22,3785,'PAU DOS FERROS'),(1,22,3786,'PEDRA GRANDE'),(1,22,3787,'PEDRA PRETA'),(1,22,3788,'PEDRO AVELINO'),(1,22,3789,'PEDRO VELHO'),(1,22,3790,'PENDENCIAS'),(1,22,3791,'PILOES'),(1,22,3792,'POCO BRANCO'),(1,22,3793,'PORTALEGRE'),(1,22,3794,'PORTO DO MANGUE'),(1,22,3795,'PRESIDENTE JUSCELINO'),(1,22,3796,'PUREZA'),(1,22,3797,'RAFAEL FERNANDES'),(1,22,3798,'RAFAEL GODEIRO'),(1,22,3799,'RIACHO DA CRUZ'),(1,22,3800,'RIACHO DE SANTANA'),(1,22,3801,'RIACHUELO'),(1,22,3802,'RIO DO FOGO'),(1,22,3803,'RODOLFO FERNANDES'),(1,22,3804,'RUY BARBOSA'),(1,22,3805,'SANTA CRUZ'),(1,22,3806,'SANTA MARIA'),(1,22,3807,'SANTANA DO MATOS'),(1,22,3808,'SANTANA DO SERIDO'),(1,22,3809,'SANTO ANTONIO'),(1,22,3810,'SAO BENTO DO NORTE'),(1,22,3811,'SAO BENTO DO TRAIRI'),(1,22,3812,'SAO FERNANDO'),(1,22,3813,'SAO FRANCISCO DO OESTE'),(1,22,3814,'SAO GONCALO DO AMARANTE'),(1,22,3815,'SAO JOAO DO SABUGI'),(1,22,3816,'SAO JOSE DE MIPIBU'),(1,22,3817,'SAO JOSE DO CAMPESTRE'),(1,22,3818,'SAO JOSE DO SERIDO'),(1,22,3819,'SAO MIGUEL'),(1,22,3820,'SAO MIGUEL DE TOUROS'),(1,22,3821,'SAO PAULO DO POTENGI'),(1,22,3822,'SAO PEDRO'),(1,22,3823,'SAO RAFAEL'),(1,22,3824,'SAO TOME'),(1,22,3825,'SAO VICENTE'),(1,22,3826,'SENADOR ELOI DE SOUZA'),(1,22,3827,'SENADOR GEORGINO AVELINO'),(1,22,3828,'SERRA DE SAO BENTO'),(1,22,3829,'SERRA DO MEL'),(1,22,3830,'SERRA NEGRA DO NORTE'),(1,22,3831,'SERRINHA'),(1,22,3832,'SERRINHA DOS PINTOS'),(1,22,3833,'SEVERIANO MELO'),(1,22,3834,'SITIO NOVO'),(1,22,3835,'TABOLEIRO GRANDE'),(1,22,3836,'TAIPU'),(1,22,3837,'TANGARA'),(1,22,3838,'TENENTE ANANIAS'),(1,22,3839,'TENENTE LAURENTINO CRUZ'),(1,22,3840,'TIBAU'),(1,22,3841,'TIBAU DO SUL'),(1,22,3842,'TIMBAUBA DOS BATISTAS'),(1,22,3843,'TOUROS'),(1,22,3844,'TRIUNFO POTIGUAR'),(1,22,3845,'UMARIZAL'),(1,22,3846,'UPANEMA'),(1,22,3847,'VARZEA'),(1,22,3848,'VENHA-VER'),(1,22,3849,'VERA CRUZ'),(1,22,3850,'VICOSA'),(1,22,3851,'VILA FLOR'),(1,24,3852,'ALTA FLORESTA DOESTE'),(1,24,3853,'ALTO ALEGRE DOS PARECIS'),(1,24,3854,'ALTO PARAISO'),(1,24,3855,'ALVORADA DOESTE'),(1,24,3856,'ARIQUEMES'),(1,24,3857,'BURITIS'),(1,24,3858,'CABIXI'),(1,24,3859,'CACAULANDIA'),(1,24,3860,'CACOAL'),(1,24,3861,'CAMPO NOVO DE RONDONIA'),(1,24,3862,'CANDEIAS DO JAMARI'),(1,24,3863,'CASTANHEIRAS'),(1,24,3864,'CEREJEIRAS'),(1,24,3865,'CHUPINGUAIA'),(1,24,3866,'COLORADO DO OESTE'),(1,24,3867,'CORUMBIARA'),(1,24,3868,'COSTA MARQUES'),(1,24,3869,'CUJUBIM'),(1,24,3870,'ESPIGAO DOESTE'),(1,24,3871,'GOVERNADOR JORGE TEIXEIRA'),(1,24,3872,'GUAJARA-MIRIM'),(1,24,3873,'ITAPUA DO OESTE'),(1,24,3874,'JARU'),(1,24,3875,'JI-PARANA'),(1,24,3876,'MACHADINHO DOESTE'),(1,24,3877,'MINISTRO ANDREAZZA'),(1,24,3878,'MIRANTE DA SERRA'),(1,24,3879,'MONTE NEGRO'),(1,24,3880,'NOVA BRASILANDIA DOESTE'),(1,24,3881,'NOVA MAMORE'),(1,24,3882,'NOVA UNIAO'),(1,24,3883,'NOVO HORIZONTE DO OESTE'),(1,24,3884,'OURO PRETO DO OESTE'),(1,24,3885,'PARECIS'),(1,24,3886,'PIMENTA BUENO'),(1,24,3887,'PIMENTEIRAS DO OESTE'),(1,24,3888,'PORTO VELHO'),(1,24,3889,'PRESIDENTE MEDICI'),(1,24,3890,'PRIMAVERA DE RONDONIA'),(1,24,3891,'RIO CRESPO'),(1,24,3892,'ROLIM DE MOURA'),(1,24,3893,'SANTA LUZIA DOESTE'),(1,24,3894,'SAO FELIPE DOESTE'),(1,24,3895,'SAO FRANCISCO DO GUAPORE'),(1,24,3896,'SAO MIGUEL DO GUAPORE'),(1,24,3897,'SERINGUEIRAS'),(1,24,3898,'TEIXEIROPOLIS'),(1,24,3899,'THEOBROMA'),(1,24,3900,'URUPA'),(1,24,3901,'VALE DO ANARI'),(1,24,3902,'VALE DO PARAISO'),(1,24,3903,'VILHENA'),(1,25,3904,'ALTO ALEGRE'),(1,25,3905,'AMAJARI'),(1,25,3906,'BOA VISTA'),(1,25,3907,'BONFIM'),(1,25,3908,'CANTA'),(1,25,3909,'CARACARAI'),(1,25,3910,'CAROEBE'),(1,25,3911,'IRACEMA'),(1,25,3912,'MUCAJAI'),(1,25,3913,'NORMANDIA'),(1,25,3914,'PACARAIMA'),(1,25,3915,'RORAINOPOLIS'),(1,25,3916,'SAO JOAO DA BALIZA'),(1,25,3917,'SAO LUIZ'),(1,25,3918,'UIRAMUTA'),(1,23,3919,'ACEGUA'),(1,23,3920,'AGUA SANTA'),(1,23,3921,'AGUDO'),(1,23,3922,'AJURICABA'),(1,23,3923,'ALECRIM'),(1,23,3924,'ALEGRETE'),(1,23,3925,'ALEGRIA'),(1,23,3926,'ALMIRANTE TAMANDARE DO SUL'),(1,23,3927,'ALPESTRE'),(1,23,3928,'ALTO ALEGRE'),(1,23,3929,'ALTO FELIZ'),(1,23,3930,'ALVORADA'),(1,23,3931,'AMARAL FERRADOR'),(1,23,3932,'AMETISTA DO SUL'),(1,23,3933,'ANDRE DA ROCHA'),(1,23,3934,'ANTA GORDA'),(1,23,3935,'ANTONIO PRADO'),(1,23,3936,'ARAMBARE'),(1,23,3937,'ARARICA'),(1,23,3938,'ARATIBA'),(1,23,3939,'ARROIO DO MEIO'),(1,23,3940,'ARROIO DO PADRE'),(1,23,3941,'ARROIO DO SAL'),(1,23,3942,'ARROIO DO TIGRE'),(1,23,3943,'ARROIO DOS RATOS'),(1,23,3944,'ARROIO GRANDE'),(1,23,3945,'ARVOREZINHA'),(1,23,3946,'AUGUSTO PESTANA'),(1,23,3947,'AUREA'),(1,23,3948,'BAGE'),(1,23,3949,'BALNEARIO PINHAL'),(1,23,3950,'BARAO'),(1,23,3951,'BARAO DE COTEGIPE'),(1,23,3952,'BARAO DO TRIUNFO'),(1,23,3953,'BARRA DO GUARITA'),(1,23,3954,'BARRA DO QUARAI'),(1,23,3955,'BARRA DO RIBEIRO'),(1,23,3956,'BARRA DO RIO AZUL'),(1,23,3957,'BARRA FUNDA'),(1,23,3958,'BARRACAO'),(1,23,3959,'BARROS CASSAL'),(1,23,3960,'BENJAMIN CONSTANT DO SUL'),(1,23,3961,'BENTO GONCALVES'),(1,23,3962,'BOA VISTA DAS MISSOES'),(1,23,3963,'BOA VISTA DO BURICA'),(1,23,3964,'BOA VISTA DO CADEADO'),(1,23,3965,'BOA VISTA DO INCRA'),(1,23,3966,'BOA VISTA DO SUL'),(1,23,3967,'BOM JESUS'),(1,23,3968,'BOM PRINCIPIO'),(1,23,3969,'BOM PROGRESSO'),(1,23,3970,'BOM RETIRO DO SUL'),(1,23,3971,'BOQUEIRAO DO LEAO'),(1,23,3972,'BOSSOROCA'),(1,23,3973,'BOZANO'),(1,23,3974,'BRAGA'),(1,23,3975,'BROCHIER'),(1,23,3976,'BUTIA'),(1,23,3977,'CACAPAVA DO SUL'),(1,23,3978,'CACEQUI'),(1,23,3979,'CACHOEIRA DO SUL'),(1,23,3980,'CACHOEIRINHA'),(1,23,3981,'CACIQUE DOBLE'),(1,23,3982,'CAIBATE'),(1,23,3983,'CAICARA'),(1,23,3984,'CAMAQUA'),(1,23,3985,'CAMARGO'),(1,23,3986,'CAMBARA DO SUL'),(1,23,3987,'CAMPESTRE DA SERRA'),(1,23,3988,'CAMPINA DAS MISSOES'),(1,23,3989,'CAMPINAS DO SUL'),(1,23,3990,'CAMPO BOM'),(1,23,3991,'CAMPO NOVO'),(1,23,3992,'CAMPOS BORGES'),(1,23,3993,'CANDELARIA'),(1,23,3994,'CANDIDO GODOI'),(1,23,3995,'CANDIOTA'),(1,23,3996,'CANELA'),(1,23,3997,'CANGUCU'),(1,23,3998,'CANOAS'),(1,23,3999,'CANUDOS DO VALE'),(1,23,4000,'CAPAO BONITO DO SUL'),(1,23,4001,'CAPAO DA CANOA'),(1,23,4002,'CAPAO DO CIPO'),(1,23,4003,'CAPAO DO LEAO'),(1,23,4004,'CAPELA DE SANTANA'),(1,23,4005,'CAPITAO'),(1,23,4006,'CAPIVARI DO SUL'),(1,23,4007,'CARAA'),(1,23,4008,'CARAZINHO'),(1,23,4009,'CARLOS BARBOSA'),(1,23,4010,'CARLOS GOMES'),(1,23,4011,'CASCA'),(1,23,4012,'CASEIROS'),(1,23,4013,'CATUIPE'),(1,23,4014,'CAXIAS DO SUL'),(1,23,4015,'CENTENARIO'),(1,23,4016,'CERRITO'),(1,23,4017,'CERRO BRANCO'),(1,23,4018,'CERRO GRANDE'),(1,23,4019,'CERRO GRANDE DO SUL'),(1,23,4020,'CERRO LARGO'),(1,23,4021,'CHAPADA'),(1,23,4022,'CHARQUEADAS'),(1,23,4023,'CHARRUA'),(1,23,4024,'CHIAPETTA'),(1,23,4025,'CHUI'),(1,23,4026,'CHUVISCA'),(1,23,4027,'CIDREIRA'),(1,23,4028,'CIRIACO'),(1,23,4029,'COLINAS'),(1,23,4030,'COLORADO'),(1,23,4031,'CONDOR'),(1,23,4032,'CONSTANTINA'),(1,23,4033,'COQUEIRO BAIXO'),(1,23,4034,'COQUEIROS DO SUL'),(1,23,4035,'CORONEL BARROS'),(1,23,4036,'CORONEL BICACO'),(1,23,4037,'CORONEL PILAR'),(1,23,4038,'COTIPORA'),(1,23,4039,'COXILHA'),(1,23,4040,'CRISSIUMAL'),(1,23,4041,'CRISTAL'),(1,23,4042,'CRISTAL DO SUL'),(1,23,4043,'CRUZ ALTA'),(1,23,4044,'CRUZALTENSE'),(1,23,4045,'CRUZEIRO DO SUL'),(1,23,4046,'DAVID CANABARRO'),(1,23,4047,'DERRUBADAS'),(1,23,4048,'DEZESSEIS DE NOVEMBRO'),(1,23,4049,'DILERMANDO DE AGUIAR'),(1,23,4050,'DOIS IRMAOS'),(1,23,4051,'DOIS IRMAOS DAS MISSOES'),(1,23,4052,'DOIS LAJEADOS'),(1,23,4053,'DOM FELICIANO'),(1,23,4054,'DOM PEDRITO'),(1,23,4055,'DOM PEDRO DE ALCANTARA'),(1,23,4056,'DONA FRANCISCA'),(1,23,4057,'DOUTOR MAURICIO CARDOSO'),(1,23,4058,'DOUTOR RICARDO'),(1,23,4059,'ELDORADO DO SUL'),(1,23,4060,'ENCANTADO'),(1,23,4061,'ENCRUZILHADA DO SUL'),(1,23,4062,'ENGENHO VELHO'),(1,23,4063,'ENTRE RIOS DO SUL'),(1,23,4064,'ENTRE-IJUIS'),(1,23,4065,'EREBANGO'),(1,23,4066,'ERECHIM'),(1,23,4067,'ERNESTINA'),(1,23,4068,'ERVAL GRANDE'),(1,23,4069,'ERVAL SECO'),(1,23,4070,'ESMERALDA'),(1,23,4071,'ESPERANCA DO SUL'),(1,23,4072,'ESPUMOSO'),(1,23,4073,'ESTACAO'),(1,23,4074,'ESTANCIA VELHA'),(1,23,4075,'ESTEIO'),(1,23,4076,'ESTRELA'),(1,23,4077,'ESTRELA VELHA'),(1,23,4078,'EUGENIO DE CASTRO'),(1,23,4079,'FAGUNDES VARELA'),(1,23,4080,'FARROUPILHA'),(1,23,4081,'FAXINAL DO SOTURNO'),(1,23,4082,'FAXINALZINHO'),(1,23,4083,'FAZENDA VILANOVA'),(1,23,4084,'FELIZ'),(1,23,4085,'FLORES DA CUNHA'),(1,23,4086,'FLORIANO PEIXOTO'),(1,23,4087,'FONTOURA XAVIER'),(1,23,4088,'FORMIGUEIRO'),(1,23,4089,'FORQUETINHA'),(1,23,4090,'FORTALEZA DOS VALOS'),(1,23,4091,'FREDERICO WESTPHALEN'),(1,23,4092,'GARIBALDI'),(1,23,4093,'GARRUCHOS'),(1,23,4094,'GAURAMA'),(1,23,4095,'GENERAL CAMARA'),(1,23,4096,'GENTIL'),(1,23,4097,'GETULIO VARGAS'),(1,23,4098,'GIRUA'),(1,23,4099,'GLORINHA'),(1,23,4100,'GRAMADO'),(1,23,4101,'GRAMADO DOS LOUREIROS'),(1,23,4102,'GRAMADO XAVIER'),(1,23,4103,'GRAVATAI'),(1,23,4104,'GUABIJU'),(1,23,4105,'GUAIBA'),(1,23,4106,'GUAPORE'),(1,23,4107,'GUARANI DAS MISSOES'),(1,23,4108,'HARMONIA'),(1,23,4109,'HERVAL'),(1,23,4110,'HERVEIRAS'),(1,23,4111,'HORIZONTINA'),(1,23,4112,'HULHA NEGRA'),(1,23,4113,'HUMAITA'),(1,23,4114,'IBARAMA'),(1,23,4115,'IBIACA'),(1,23,4116,'IBIRAIARAS'),(1,23,4117,'IBIRAPUITA'),(1,23,4118,'IBIRUBA'),(1,23,4119,'IGREJINHA'),(1,23,4120,'IJUI'),(1,23,4121,'ILOPOLIS'),(1,23,4122,'IMBE'),(1,23,4123,'IMIGRANTE'),(1,23,4124,'INDEPENDENCIA'),(1,23,4125,'INHACORA'),(1,23,4126,'IPE'),(1,23,4127,'IPIRANGA DO SUL'),(1,23,4128,'IRAI'),(1,23,4129,'ITAARA'),(1,23,4130,'ITACURUBI'),(1,23,4131,'ITAPUCA'),(1,23,4132,'ITAQUI'),(1,23,4133,'ITATI'),(1,23,4134,'ITATIBA DO SUL'),(1,23,4135,'IVORA'),(1,23,4136,'IVOTI'),(1,23,4137,'JABOTICABA'),(1,23,4138,'JACUIZINHO'),(1,23,4139,'JACUTINGA'),(1,23,4140,'JAGUARAO'),(1,23,4141,'JAGUARI'),(1,23,4142,'JAQUIRANA'),(1,23,4143,'JARI'),(1,23,4144,'JOIA'),(1,23,4145,'JULIO DE CASTILHOS'),(1,23,4146,'LAGOA BONITA DO SUL'),(1,23,4147,'LAGOA DOS TRES CANTOS'),(1,23,4148,'LAGOA VERMELHA'),(1,23,4149,'LAGOAO'),(1,23,4150,'LAJEADO'),(1,23,4151,'LAJEADO DO BUGRE'),(1,23,4152,'LAVRAS DO SUL'),(1,23,4153,'LIBERATO SALZANO'),(1,23,4154,'LINDOLFO COLLOR'),(1,23,4155,'LINHA NOVA'),(1,23,4156,'MACAMBARA'),(1,23,4157,'MACHADINHO'),(1,23,4158,'MAMPITUBA'),(1,23,4159,'MANOEL VIANA'),(1,23,4160,'MAQUINE'),(1,23,4161,'MARATA'),(1,23,4162,'MARAU'),(1,23,4163,'MARCELINO RAMOS'),(1,23,4164,'MARIANA PIMENTEL'),(1,23,4165,'MARIANO MORO'),(1,23,4166,'MARQUES DE SOUZA'),(1,23,4167,'MATA'),(1,23,4168,'MATO CASTELHANO'),(1,23,4169,'MATO LEITAO'),(1,23,4170,'MATO QUEIMADO'),(1,23,4171,'MAXIMILIANO DE ALMEIDA'),(1,23,4172,'MINAS DO LEAO'),(1,23,4173,'MIRAGUAI'),(1,23,4174,'MONTAURI'),(1,23,4175,'MONTE ALEGRE DOS CAMPOS'),(1,23,4176,'MONTE BELO DO SUL'),(1,23,4177,'MONTENEGRO'),(1,23,4178,'MORMACO'),(1,23,4179,'MORRINHOS DO SUL'),(1,23,4180,'MORRO REDONDO'),(1,23,4181,'MORRO REUTER'),(1,23,4182,'MOSTARDAS'),(1,23,4183,'MUCUM'),(1,23,4184,'MUITOS CAPOES'),(1,23,4185,'MULITERNO'),(1,23,4186,'NAO-ME-TOQUE'),(1,23,4187,'NICOLAU VERGUEIRO'),(1,23,4188,'NONOAI'),(1,23,4189,'NOVA ALVORADA'),(1,23,4190,'NOVA ARACA'),(1,23,4191,'NOVA BASSANO'),(1,23,4192,'NOVA BOA VISTA'),(1,23,4193,'NOVA BRESCIA'),(1,23,4194,'NOVA CANDELARIA'),(1,23,4195,'NOVA ESPERANCA DO SUL'),(1,23,4196,'NOVA HARTZ'),(1,23,4197,'NOVA PADUA'),(1,23,4198,'NOVA PALMA'),(1,23,4199,'NOVA PETROPOLIS'),(1,23,4200,'NOVA PRATA'),(1,23,4201,'NOVA RAMADA'),(1,23,4202,'NOVA ROMA DO SUL'),(1,23,4203,'NOVA SANTA RITA'),(1,23,4204,'NOVO BARREIRO'),(1,23,4205,'NOVO CABRAIS'),(1,23,4206,'NOVO HAMBURGO'),(1,23,4207,'NOVO MACHADO'),(1,23,4208,'NOVO TIRADENTES'),(1,23,4209,'NOVO XINGU'),(1,23,4210,'OSORIO'),(1,23,4211,'PAIM FILHO'),(1,23,4212,'PALMARES DO SUL'),(1,23,4213,'PALMEIRA DAS MISSOES'),(1,23,4214,'PALMITINHO'),(1,23,4215,'PANAMBI'),(1,23,4216,'PANTANO GRANDE'),(1,23,4217,'PARAI'),(1,23,4218,'PARAISO DO SUL'),(1,23,4219,'PARECI NOVO'),(1,23,4220,'PAROBE'),(1,23,4221,'PASSA SETE'),(1,23,4222,'PASSO DO SOBRADO'),(1,23,4223,'PASSO FUNDO'),(1,23,4224,'PAULO BENTO'),(1,23,4225,'PAVERAMA'),(1,23,4226,'PEDRAS ALTAS'),(1,23,4227,'PEDRO OSORIO'),(1,23,4228,'PEJUCARA'),(1,23,4229,'PELOTAS'),(1,23,4230,'PICADA CAFE'),(1,23,4231,'PINHAL'),(1,23,4232,'PINHAL DA SERRA'),(1,23,4233,'PINHAL GRANDE'),(1,23,4234,'PINHEIRINHO DO VALE'),(1,23,4235,'PINHEIRO MACHADO'),(1,23,4236,'PIRAPO'),(1,23,4237,'PIRATINI'),(1,23,4238,'PLANALTO'),(1,23,4239,'POCO DAS ANTAS'),(1,23,4240,'PONTAO'),(1,23,4241,'PONTE PRETA'),(1,23,4242,'PORTAO'),(1,23,4243,'PORTO LUCENA'),(1,23,4244,'PORTO MAUA'),(1,23,4245,'PORTO VERA CRUZ'),(1,23,4246,'PORTO XAVIER'),(1,23,4247,'POUSO NOVO'),(1,23,4248,'PRESIDENTE LUCENA'),(1,23,4249,'PROGRESSO'),(1,23,4250,'PROTASIO ALVES'),(1,23,4251,'PUTINGA'),(1,23,4252,'QUARAI'),(1,23,4253,'QUATRO IRMAOS'),(1,23,4254,'QUEVEDOS'),(1,23,4255,'QUINZE DE NOVEMBRO'),(1,23,4256,'REDENTORA'),(1,23,4257,'RELVADO'),(1,23,4258,'RESTINGA SECA'),(1,23,4259,'RIO DOS INDIOS'),(1,23,4260,'RIO GRANDE'),(1,23,4261,'RIO PARDO'),(1,23,4262,'RIOZINHO'),(1,23,4263,'ROCA SALES'),(1,23,4264,'RODEIO BONITO'),(1,23,4265,'ROLADOR'),(1,23,4266,'ROLANTE'),(1,23,4267,'RONDA ALTA'),(1,23,4268,'RONDINHA'),(1,23,4269,'ROQUE GONZALES'),(1,23,4270,'ROSARIO DO SUL'),(1,23,4271,'SAGRADA FAMILIA'),(1,23,4272,'SALDANHA MARINHO'),(1,23,4273,'SALTO DO JACUI'),(1,23,4274,'SALVADOR DAS MISSOES'),(1,23,4275,'SALVADOR DO SUL'),(1,23,4276,'SANANDUVA'),(1,23,4277,'SANTA BARBARA DO SUL'),(1,23,4278,'SANTA CECILIA DO SUL'),(1,23,4279,'SANTA CLARA DO SUL'),(1,23,4280,'SANTA CRUZ DO SUL'),(1,23,4281,'SANTA MARGARIDA DO SUL'),(1,23,4282,'SANTA MARIA'),(1,23,4283,'SANTA MARIA DO HERVAL'),(1,23,4284,'SANTA ROSA'),(1,23,4285,'SANTA TEREZA'),(1,23,4286,'SANTA VITORIA DO PALMAR'),(1,23,4287,'SANTANA DA BOA VISTA'),(1,23,4288,'SANTANA DO LIVRAMENTO'),(1,23,4289,'SANTIAGO'),(1,23,4290,'SANTO ANGELO'),(1,23,4291,'SANTO ANTONIO DA PATRULHA'),(1,23,4292,'SANTO ANTONIO DAS MISSOES'),(1,23,4293,'SANTO ANTONIO DO PALMA'),(1,23,4294,'SANTO ANTONIO DO PLANALTO'),(1,23,4295,'SANTO AUGUSTO'),(1,23,4296,'SANTO CRISTO'),(1,23,4297,'SANTO EXPEDITO DO SUL'),(1,23,4298,'SAO BORJA'),(1,23,4299,'SAO DOMINGOS DO SUL'),(1,23,4300,'SAO FRANCISCO DE ASSIS'),(1,23,4301,'SAO FRANCISCO DE PAULA'),(1,23,4302,'SAO GABRIEL'),(1,23,4303,'SAO JERONIMO'),(1,23,4304,'SAO JOAO DA URTIGA'),(1,23,4305,'SAO JOAO DO POLESINE'),(1,23,4306,'SAO JORGE'),(1,23,4307,'SAO JOSE DAS MISSOES'),(1,23,4308,'SAO JOSE DO HERVAL'),(1,23,4309,'SAO JOSE DO HORTENCIO'),(1,23,4310,'SAO JOSE DO INHACORA'),(1,23,4311,'SAO JOSE DO NORTE'),(1,23,4312,'SAO JOSE DO OURO'),(1,23,4313,'SAO JOSE DO SUL'),(1,23,4314,'SAO JOSE DOS AUSENTES'),(1,23,4315,'SAO LEOPOLDO'),(1,23,4316,'SAO LOURENCO DO SUL'),(1,23,4317,'SAO LUIZ GONZAGA'),(1,23,4318,'SAO MARCOS'),(1,23,4319,'SAO MARTINHO'),(1,23,4320,'SAO MARTINHO DA SERRA'),(1,23,4321,'SAO MIGUEL DAS MISSOES'),(1,23,4322,'SAO NICOLAU'),(1,23,4323,'SAO PAULO DAS MISSOES'),(1,23,4324,'SAO PEDRO DA SERRA'),(1,23,4325,'SAO PEDRO DAS MISSOES'),(1,23,4326,'SAO PEDRO DO BUTIA'),(1,23,4327,'SAO PEDRO DO SUL'),(1,23,4328,'SAO SEBASTIAO DO CAI'),(1,23,4329,'SAO SEPE'),(1,23,4330,'SAO VALENTIM'),(1,23,4331,'SAO VALENTIM DO SUL'),(1,23,4332,'SAO VALERIO DO SUL'),(1,23,4333,'SAO VENDELINO'),(1,23,4334,'SAO VICENTE DO SUL'),(1,23,4335,'SAPIRANGA'),(1,23,4336,'SAPUCAIA DO SUL'),(1,23,4337,'SARANDI'),(1,23,4338,'SEBERI'),(1,23,4339,'SEDE NOVA'),(1,23,4340,'SEGREDO'),(1,23,4341,'SELBACH'),(1,23,4342,'SENADOR SALGADO FILHO'),(1,23,4343,'SENTINELA DO SUL'),(1,23,4344,'SERAFINA CORREA'),(1,23,4345,'SERIO'),(1,23,4346,'SERTAO'),(1,23,4347,'SERTAO SANTANA'),(1,23,4348,'SETE DE SETEMBRO'),(1,23,4349,'SEVERIANO DE ALMEIDA'),(1,23,4350,'SILVEIRA MARTINS'),(1,23,4351,'SINIMBU'),(1,23,4352,'SOBRADINHO'),(1,23,4353,'SOLEDADE'),(1,23,4354,'TABAI'),(1,23,4355,'TAPEJARA'),(1,23,4356,'TAPERA'),(1,23,4357,'TAPES'),(1,23,4358,'TAQUARA'),(1,23,4359,'TAQUARI'),(1,23,4360,'TAQUARUCU DO SUL'),(1,23,4361,'TAVARES'),(1,23,4362,'TENENTE PORTELA'),(1,23,4363,'TERRA DE AREIA'),(1,23,4364,'TEUTONIA'),(1,23,4365,'TIO HUGO'),(1,23,4366,'TIRADENTES DO SUL'),(1,23,4367,'TOROPI'),(1,23,4368,'TORRES'),(1,23,4369,'TRAMANDAI'),(1,23,4370,'TRAVESSEIRO'),(1,23,4371,'TRES ARROIOS'),(1,23,4372,'TRES CACHOEIRAS'),(1,23,4373,'TRES COROAS'),(1,23,4374,'TRES DE MAIO'),(1,23,4375,'TRES FORQUILHAS'),(1,23,4376,'TRES PALMEIRAS'),(1,23,4377,'TRES PASSOS'),(1,23,4378,'TRINDADE DO SUL'),(1,23,4379,'TRIUNFO'),(1,23,4380,'TUCUNDUVA'),(1,23,4381,'TUNAS'),(1,23,4382,'TUPANCI DO SUL'),(1,23,4383,'TUPANCIRETA'),(1,23,4384,'TUPANDI'),(1,23,4385,'TUPARENDI'),(1,23,4386,'TURUCU'),(1,23,4387,'UBIRETAMA'),(1,23,4388,'UNIAO DA SERRA'),(1,23,4389,'UNISTALDA'),(1,23,4390,'URUGUAIANA'),(1,23,4391,'VACARIA'),(1,23,4392,'VALE DO SOL'),(1,23,4393,'VALE REAL'),(1,23,4394,'VALE VERDE'),(1,23,4395,'VANINI'),(1,23,4396,'VENANCIO AIRES'),(1,23,4397,'VERA CRUZ'),(1,23,4398,'VERANOPOLIS'),(1,23,4399,'VESPASIANO CORREA'),(1,23,4400,'VIADUTOS'),(1,23,4401,'VIAMAO'),(1,23,4402,'VICENTE DUTRA'),(1,23,4403,'VICTOR GRAEFF'),(1,23,4404,'VILA FLORES'),(1,23,4405,'VILA LANGARO'),(1,23,4406,'VILA MARIA'),(1,23,4407,'VILA NOVA DO SUL'),(1,23,4408,'VISTA ALEGRE'),(1,23,4409,'VISTA ALEGRE DO PRATA'),(1,23,4410,'VISTA GAUCHA'),(1,23,4411,'VITORIA DAS MISSOES'),(1,23,4412,'WESTFALIA'),(1,23,4413,'XANGRI-LA'),(1,26,4414,'ABDON BATISTA'),(1,26,4415,'ABELARDO LUZ'),(1,26,4416,'AGROLANDIA'),(1,26,4417,'AGRONOMICA'),(1,26,4418,'AGUA DOCE'),(1,26,4419,'AGUAS DE CHAPECO'),(1,26,4420,'AGUAS FRIAS'),(1,26,4421,'AGUAS MORNAS'),(1,26,4422,'ALFREDO WAGNER'),(1,26,4423,'ALTO BELA VISTA'),(1,26,4424,'ANCHIETA'),(1,26,4425,'ANGELINA'),(1,26,4426,'ANITA GARIBALDI'),(1,26,4427,'ANITAPOLIS'),(1,26,4428,'ANTONIO CARLOS'),(1,26,4429,'APIUNA'),(1,26,4430,'ARABUTA'),(1,26,4431,'ARAQUARI'),(1,26,4432,'ARARANGUA'),(1,26,4433,'ARMAZEM'),(1,26,4434,'ARROIO TRINTA'),(1,26,4435,'ARVOREDO'),(1,26,4436,'ASCURRA'),(1,26,4437,'ATALANTA'),(1,26,4438,'AURORA'),(1,26,4439,'BALNEARIO ARROIO DO SILVA'),(1,26,4440,'BALNEARIO BARRA DO SUL (SC)'),(1,26,4441,'BALNEARIO CAMBORIU'),(1,26,4442,'BALNEARIO GAIVOTA'),(1,26,4443,'BANDEIRANTE'),(1,26,4444,'BARRA BONITA'),(1,26,4445,'BARRA VELHA'),(1,26,4446,'BELA VISTA DO TOLDO'),(1,26,4447,'BELMONTE'),(1,26,4448,'BENEDITO NOVO'),(1,26,4449,'BIGUACU'),(1,26,4450,'BLUMENAU'),(1,26,4451,'BOCAINA DO SUL'),(1,26,4452,'BOM JARDIM DA SERRA'),(1,26,4453,'BOM JESUS'),(1,26,4454,'BOM JESUS DO OESTE'),(1,26,4455,'BOM RETIRO'),(1,26,4456,'BOMBINHAS'),(1,26,4457,'BOTUVERA'),(1,26,4458,'BRACO DO NORTE'),(1,26,4459,'BRACO DO TROMBUDO'),(1,26,4460,'BRUNOPOLIS'),(1,26,4461,'BRUSQUE'),(1,26,4462,'CACADOR'),(1,26,4463,'CAIBI'),(1,26,4464,'CALMON'),(1,26,4465,'CAMBORIU'),(1,26,4466,'CAMPO ALEGRE'),(1,26,4467,'CAMPO BELO DO SUL'),(1,26,4468,'CAMPO ERE'),(1,26,4469,'CAMPOS NOVOS'),(1,26,4470,'CANELINHA'),(1,26,4471,'CANOINHAS'),(1,26,4472,'CAPAO ALTO'),(1,26,4473,'CAPINZAL'),(1,26,4474,'CAPIVARI DE BAIXO'),(1,26,4475,'CATANDUVAS'),(1,26,4476,'CAXAMBU DO SUL'),(1,26,4477,'CELSO RAMOS'),(1,26,4478,'CERRO NEGRO'),(1,26,4479,'CHAPADAO DO LAGEADO'),(1,26,4480,'CHAPECO'),(1,26,4481,'COCAL DO SUL'),(1,26,4482,'CONCORDIA'),(1,26,4483,'CORDILHEIRA ALTA'),(1,26,4484,'CORONEL FREITAS'),(1,26,4485,'CORONEL MARTINS'),(1,26,4486,'CORREIA PINTO'),(1,26,4487,'CORUPA'),(1,26,4488,'CRICIUMA'),(1,26,4489,'CUNHA PORA'),(1,26,4490,'CUNHATAI'),(1,26,4491,'CURITIBANOS'),(1,26,4492,'DESCANSO'),(1,26,4493,'DIONISIO CERQUEIRA'),(1,26,4494,'DONA EMMA'),(1,26,4495,'DOUTOR PEDRINHO'),(1,26,4496,'ENTRE RIOS'),(1,26,4497,'ERMO'),(1,26,4498,'ERVAL VELHO'),(1,26,4499,'FAXINAL DOS GUEDES'),(1,26,4500,'FLOR DO SERTAO'),(1,26,4501,'FLORIANOPOLIS'),(1,26,4502,'FORMOSA DO SUL'),(1,26,4503,'FORQUILHINHA'),(1,26,4504,'FRAIBURGO'),(1,26,4505,'FREI ROGERIO'),(1,26,4506,'GALVAO'),(1,26,4507,'GAROPABA'),(1,26,4508,'GARUVA'),(1,26,4509,'GASPAR'),(1,26,4510,'GOVERNADOR CELSO RAMOS'),(1,26,4511,'GRAO PARA'),(1,26,4512,'GRAVATAL'),(1,26,4513,'GUABIRUBA'),(1,26,4514,'GUARACIABA'),(1,26,4515,'GUARAMIRIM'),(1,26,4516,'GUARUJA DO SUL'),(1,26,4517,'GUATAMBU'),(1,26,4518,'HERVAL DOESTE'),(1,26,4519,'IBIAM'),(1,26,4520,'IBICARE'),(1,26,4521,'IBIRAMA'),(1,26,4522,'ICARA'),(1,26,4523,'ILHOTA'),(1,26,4524,'IMARUI'),(1,26,4525,'IMBITUBA'),(1,26,4526,'IMBUIA'),(1,26,4527,'INDAIAL'),(1,26,4528,'IOMERE'),(1,26,4529,'IPIRA'),(1,26,4530,'IPORA DO OESTE'),(1,26,4531,'IPUACU'),(1,26,4532,'IPUMIRIM'),(1,26,4533,'IRACEMINHA'),(1,26,4534,'IRANI'),(1,26,4535,'IRATI'),(1,26,4536,'IRINEOPOLIS'),(1,26,4537,'ITA'),(1,26,4538,'ITAIOPOLIS'),(1,26,4539,'ITAJAI'),(1,26,4540,'ITAPEMA'),(1,26,4541,'ITAPIRANGA'),(1,26,4542,'ITAPOA'),(1,26,4543,'ITUPORANGA'),(1,26,4544,'JABORA'),(1,26,4545,'JACINTO MACHADO'),(1,26,4546,'JAGUARUNA'),(1,26,4547,'JARAGUA DO SUL'),(1,26,4548,'JARDINOPOLIS'),(1,26,4549,'JOACABA'),(1,26,4550,'JOINVILLE'),(1,26,4551,'JOSE BOITEUX'),(1,26,4552,'JUPIA'),(1,26,4553,'LACERDOPOLIS'),(1,26,4554,'LAGES'),(1,26,4555,'LAGUNA'),(1,26,4556,'LAJEADO GRANDE'),(1,26,4557,'LAURENTINO'),(1,26,4558,'LAURO MULLER'),(1,26,4559,'LEBON REGIS'),(1,26,4560,'LEOBERTO LEAL'),(1,26,4561,'LINDOIA DO SUL'),(1,26,4562,'LONTRAS'),(1,26,4563,'LUIZ ALVES'),(1,26,4564,'LUZERNA'),(1,26,4565,'MACIEIRA'),(1,26,4566,'MAFRA'),(1,26,4567,'MAJOR GERCINO'),(1,26,4568,'MAJOR VIEIRA'),(1,26,4569,'MARACAJA'),(1,26,4570,'MARAVILHA'),(1,26,4571,'MAREMA'),(1,26,4572,'MASSARANDUBA'),(1,26,4573,'MATOS COSTA'),(1,26,4574,'MELEIRO'),(1,26,4575,'MIRIM DOCE'),(1,26,4576,'MODELO'),(1,26,4577,'MONDAI'),(1,26,4578,'MONTE CARLO'),(1,26,4579,'MONTE CASTELO'),(1,26,4580,'MORRO DA FUMACA'),(1,26,4581,'MORRO GRANDE'),(1,26,4582,'NAVEGANTES'),(1,26,4583,'NOVA ERECHIM'),(1,26,4584,'NOVA ITABERABA'),(1,26,4585,'NOVA TRENTO'),(1,26,4586,'NOVA VENEZA'),(1,26,4587,'NOVO HORIZONTE'),(1,26,4588,'ORLEANS'),(1,26,4589,'OTACILIO COSTA'),(1,26,4590,'OURO'),(1,26,4591,'OURO VERDE'),(1,26,4592,'PAIAL'),(1,26,4593,'PAINEL'),(1,26,4594,'PALHOCA'),(1,26,4595,'PALMA SOLA'),(1,26,4596,'PALMEIRA'),(1,26,4597,'PALMITOS'),(1,26,4598,'PAPANDUVA'),(1,26,4599,'PARAISO'),(1,26,4600,'PASSO DE TORRES'),(1,26,4601,'PASSOS MAIA'),(1,26,4602,'PAULO LOPES'),(1,26,4603,'PEDRAS GRANDES'),(1,26,4604,'PENHA'),(1,26,4605,'PERITIBA'),(1,26,4606,'PETROLANDIA'),(1,26,4607,'PICARRAS'),(1,26,4608,'PINHALZINHO'),(1,26,4609,'PINHEIRO PRETO'),(1,26,4610,'PIRATUBA'),(1,26,4611,'PLANALTO ALEGRE'),(1,26,4612,'POMERODE'),(1,26,4613,'PONTE ALTA'),(1,26,4614,'PONTE ALTA DO NORTE'),(1,26,4615,'PONTE SERRADA'),(1,26,4616,'PORTO BELO'),(1,26,4617,'PORTO UNIAO'),(1,26,4618,'POUSO REDONDO'),(1,26,4619,'PRAIA GRANDE'),(1,26,4620,'PRESIDENTE CASTELO BRANCO'),(1,26,4621,'PRESIDENTE GETULIO'),(1,26,4622,'PRESIDENTE NEREU'),(1,26,4623,'PRINCESA'),(1,26,4624,'QUILOMBO'),(1,26,4625,'RANCHO QUEIMADO'),(1,26,4626,'RIO DAS ANTAS'),(1,26,4627,'RIO DO CAMPO'),(1,26,4628,'RIO DO OESTE'),(1,26,4629,'RIO DO SUL'),(1,26,4630,'RIO DOS CEDROS'),(1,26,4631,'RIO FORTUNA'),(1,26,4632,'RIO NEGRINHO'),(1,26,4633,'RIO RUFINO'),(1,26,4634,'RIQUEZA'),(1,26,4635,'RODEIO'),(1,26,4636,'ROMELANDIA'),(1,26,4637,'SALETE'),(1,26,4638,'SALTINHO'),(1,26,4639,'SALTO VELOSO'),(1,26,4640,'SANGAO'),(1,26,4641,'SANTA CECILIA'),(1,26,4642,'SANTA HELENA'),(1,26,4643,'SANTA ROSA DE LIMA'),(1,26,4644,'SANTA ROSA DO SUL'),(1,26,4645,'SANTA TEREZINHA'),(1,26,4646,'SANTA TEREZINHA DO PROGRESSO'),(1,26,4647,'SANTIAGO DO SUL'),(1,26,4648,'SANTO AMARO DA IMPERATRIZ'),(1,26,4649,'SAO BENTO DO SUL'),(1,26,4650,'SAO BERNARDINO'),(1,26,4651,'SAO BONIFACIO'),(1,26,4652,'SAO CARLOS'),(1,26,4653,'SAO CRISTOVAO DO SUL'),(1,26,4654,'SAO DOMINGOS'),(1,26,4655,'SAO FRANCISCO DO SUL'),(1,26,4656,'SAO JOAO BATISTA'),(1,26,4657,'SAO JOAO DO ITAPERIU'),(1,26,4658,'SAO JOAO DO OESTE'),(1,26,4659,'SAO JOAO DO SUL'),(1,26,4660,'SAO JOAQUIM'),(1,26,4661,'SAO JOSE'),(1,26,4662,'SAO JOSE DO CEDRO'),(1,26,4663,'SAO JOSE DO CERRITO'),(1,26,4664,'SAO LOURENCO DO OESTE'),(1,26,4665,'SAO LUDGERO'),(1,26,4666,'SAO MARTINHO'),(1,26,4667,'SAO MIGUEL DA BOA VISTA'),(1,26,4668,'SAO MIGUEL DOESTE'),(1,26,4669,'SAO PEDRO DE ALCANTARA'),(1,26,4670,'SAUDADES'),(1,26,4671,'SCHROEDER'),(1,26,4672,'SEARA'),(1,26,4673,'SERRA ALTA'),(1,26,4674,'SIDEROPOLIS'),(1,26,4675,'SOMBRIO'),(1,26,4676,'SUL BRASIL'),(1,26,4677,'TAIO'),(1,26,4678,'TANGARA'),(1,26,4679,'TIGRINHOS'),(1,26,4680,'TIJUCAS'),(1,26,4681,'TIMBE DO SUL'),(1,26,4682,'TIMBO'),(1,26,4683,'TIMBO GRANDE'),(1,26,4684,'TRES BARRAS'),(1,26,4685,'TREVISO'),(1,26,4686,'TREZE DE MAIO'),(1,26,4687,'TREZE TILIAS'),(1,26,4688,'TROMBUDO CENTRAL'),(1,26,4689,'TUBARAO'),(1,26,4690,'TUNAPOLIS'),(1,26,4691,'TURVO'),(1,26,4692,'UNIAO DO OESTE'),(1,26,4693,'URUBICI'),(1,26,4694,'URUPEMA'),(1,26,4695,'URUSSANGA'),(1,26,4696,'VARGEAO'),(1,26,4697,'VARGEM'),(1,26,4698,'VARGEM BONITA'),(1,26,4699,'VIDAL RAMOS'),(1,26,4700,'VIDEIRA'),(1,26,4701,'VITOR MEIRELES'),(1,26,4702,'WITMARSUM'),(1,26,4703,'XANXERE'),(1,26,4704,'XAVANTINA'),(1,26,4705,'XAXIM'),(1,26,4706,'ZORTEA'),(1,27,4707,'AMPARO DE SAO FRANCISCO'),(1,27,4708,'AQUIDABA'),(1,27,4709,'ARACAJU'),(1,27,4710,'ARAUA'),(1,27,4711,'AREIA BRANCA'),(1,27,4712,'BARRA DOS COQUEIROS'),(1,27,4713,'BOQUIM'),(1,27,4714,'BREJO GRANDE'),(1,27,4715,'CAMPO DO BRITO'),(1,27,4716,'CANHOBA'),(1,27,4717,'CANINDE DE SAO FRANCISCO'),(1,27,4718,'CAPELA'),(1,27,4719,'CARIRA'),(1,27,4720,'CARMOPOLIS'),(1,27,4721,'CEDRO DE SAO JOAO'),(1,27,4722,'CRISTINAPOLIS'),(1,27,4723,'CUMBE'),(1,27,4724,'DIVINA PASTORA'),(1,27,4725,'ESTANCIA'),(1,27,4726,'FEIRA NOVA'),(1,27,4727,'FREI PAULO'),(1,27,4728,'GARARU'),(1,27,4729,'GENERAL MAYNARD'),(1,27,4730,'GRACCHO CARDOSO'),(1,27,4731,'ILHA DAS FLORES'),(1,27,4732,'INDIAROBA'),(1,27,4733,'ITABAIANA'),(1,27,4734,'ITABAIANINHA'),(1,27,4735,'ITABI'),(1,27,4736,'ITAPORANGA DAJUDA'),(1,27,4737,'JAPARATUBA'),(1,27,4738,'JAPOATA'),(1,27,4739,'LAGARTO'),(1,27,4740,'LARANJEIRAS'),(1,27,4741,'MACAMBIRA'),(1,27,4742,'MALHADA DOS BOIS'),(1,27,4743,'MALHADOR'),(1,27,4744,'MARUIM'),(1,27,4745,'MOITA BONITA'),(1,27,4746,'MONTE ALEGRE DE SERGIPE'),(1,27,4747,'MURIBECA'),(1,27,4748,'NEOPOLIS'),(1,27,4749,'NOSSA SENHORA APARECIDA'),(1,27,4750,'NOSSA SENHORA DA GLORIA'),(1,27,4751,'NOSSA SENHORA DAS DORES'),(1,27,4752,'NOSSA SENHORA DE LOURDES'),(1,27,4753,'NOSSA SENHORA DO SOCORRO'),(1,27,4754,'PACATUBA'),(1,27,4755,'PEDRA MOLE'),(1,27,4756,'PEDRINHAS'),(1,27,4757,'PINHAO'),(1,27,4758,'PIRAMBU'),(1,27,4759,'POCO REDONDO'),(1,27,4760,'POCO VERDE'),(1,27,4761,'PORTO DA FOLHA'),(1,27,4762,'PROPRIA'),(1,27,4763,'RIACHAO DO DANTAS'),(1,27,4764,'RIACHUELO'),(1,27,4765,'RIBEIROPOLIS'),(1,27,4766,'ROSARIO DO CATETE'),(1,27,4767,'SALGADO'),(1,27,4768,'SANTA LUZIA DO ITANHY'),(1,27,4769,'SANTA ROSA DE LIMA'),(1,27,4770,'SANTANA DE SAO FRANCISCO'),(1,27,4771,'SANTO AMARO DAS BROTAS'),(1,27,4772,'SAO CRISTOVAO'),(1,27,4773,'SAO DOMINGOS'),(1,27,4774,'SAO FRANCISCO'),(1,27,4775,'SAO MIGUEL DO ALEIXO'),(1,27,4776,'SIMAO DIAS'),(1,27,4777,'SIRIRI'),(1,27,4778,'TELHA'),(1,27,4779,'TOBIAS BARRETO'),(1,27,4780,'TOMAR DO GERU'),(1,27,4781,'UMBAUBA'),(1,1,4782,'ADAMANTINA'),(1,1,4783,'ADOLFO'),(1,1,4784,'AGUAI'),(1,1,4785,'AGUAS DA PRATA'),(1,1,4786,'AGUAS DE LINDOIA'),(1,1,4787,'AGUAS DE SANTA BARBARA'),(1,1,4788,'AGUAS DE SAO PEDRO'),(1,1,4789,'AGUDOS'),(1,1,4790,'ALAMBARI'),(1,1,4791,'ALFREDO MARCONDES'),(1,1,4792,'ALTAIR'),(1,1,4793,'ALTINOPOLIS'),(1,1,4794,'ALTO ALEGRE'),(1,1,4795,'ALUMINIO'),(1,1,4796,'ALVARES FLORENCE'),(1,1,4797,'ALVARES MACHADO'),(1,1,4798,'ALVARO DE CARVALHO'),(1,1,4799,'ALVINLANDIA'),(1,1,4800,'AMERICANA'),(1,1,4801,'AMERICO BRASILIENSE'),(1,1,4802,'AMERICO DE CAMPOS'),(1,1,4803,'AMPARO'),(1,1,4804,'ANALANDIA'),(1,1,4805,'ANDRADINA'),(1,1,4806,'ANGATUBA'),(1,1,4807,'ANHEMBI'),(1,1,4808,'ANHUMAS'),(1,1,4809,'APARECIDA'),(1,1,4810,'APARECIDA DOESTE'),(1,1,4811,'APIAI'),(1,1,4812,'ARACARIGUAMA'),(1,1,4813,'ARACATUBA'),(1,1,4814,'ARACOIABA DA SERRA'),(1,1,4815,'ARAMINA'),(1,1,4816,'ARANDU'),(1,1,4817,'ARAPEI'),(1,1,4818,'ARARAQUARA'),(1,1,4819,'ARARAS'),(1,1,4820,'ARCO-IRIS'),(1,1,4821,'AREALVA'),(1,1,4822,'AREIAS'),(1,1,4823,'AREIOPOLIS'),(1,1,4824,'ARIRANHA'),(1,1,4825,'ARTUR NOGUEIRA'),(1,1,4826,'ARUJA'),(1,1,4827,'ASPASIA'),(1,1,4828,'ASSIS'),(1,1,4829,'ATIBAIA'),(1,1,4830,'AURIFLAMA'),(1,1,4831,'AVAI'),(1,1,4832,'AVANHANDAVA'),(1,1,4833,'AVARE'),(1,1,4834,'BADY BASSITT'),(1,1,4835,'BALBINOS'),(1,1,4836,'BALSAMO'),(1,1,4837,'BANANAL'),(1,1,4838,'BARAO DE ANTONINA'),(1,1,4839,'BARBOSA'),(1,1,4840,'BARIRI'),(1,1,4841,'BARRA BONITA'),(1,1,4842,'BARRA DO CHAPEU'),(1,1,4843,'BARRA DO TURVO'),(1,1,4844,'BARRETOS'),(1,1,4845,'BARRINHA'),(1,1,4846,'BARUERI'),(1,1,4847,'BASTOS'),(1,1,4848,'BATATAIS'),(1,1,4849,'BAURU'),(1,1,4850,'BEBEDOURO'),(1,1,4851,'BENTO DE ABREU'),(1,1,4852,'BERNARDINO DE CAMPOS'),(1,1,4853,'BERTIOGA'),(1,1,4854,'BILAC'),(1,1,4855,'BIRIGUI'),(1,1,4856,'BIRITIBA-MIRIM'),(1,1,4857,'BOA ESPERANCA DO SUL'),(1,1,4858,'BOCAINA'),(1,1,4859,'BOFETE'),(1,1,4860,'BOITUVA'),(1,1,4861,'BOM JESUS DOS PERDOES'),(1,1,4862,'BOM SUCESSO DE ITARARE'),(1,1,4863,'BORA'),(1,1,4864,'BORACEIA'),(1,1,4865,'BORBOREMA'),(1,1,4866,'BOREBI'),(1,1,4867,'BOTUCATU'),(1,1,4868,'BRAGANCA PAULISTA'),(1,1,4869,'BRAUNA'),(1,1,4870,'BREJO ALEGRE'),(1,1,4871,'BRODOSQUI'),(1,1,4872,'BROTAS'),(1,1,4873,'BURI'),(1,1,4874,'BURITAMA'),(1,1,4875,'BURITIZAL'),(1,1,4876,'CABRALIA PAULISTA'),(1,1,4877,'CABREUVA'),(1,1,4878,'CACAPAVA'),(1,1,4879,'CACHOEIRA PAULISTA'),(1,1,4880,'CACONDE'),(1,1,4881,'CAFELANDIA'),(1,1,4882,'CAIABU'),(1,1,4883,'CAIEIRAS'),(1,1,4884,'CAIUA'),(1,1,4885,'CAJAMAR'),(1,1,4886,'CAJATI'),(1,1,4887,'CAJOBI'),(1,1,4888,'CAJURU'),(1,1,4889,'CAMPINA DO MONTE ALEGRE'),(1,1,4890,'CAMPINAS'),(1,1,4891,'CAMPO LIMPO PAULISTA'),(1,1,4892,'CAMPOS DO JORDAO'),(1,1,4893,'CAMPOS NOVOS PAULISTA'),(1,1,4894,'CANANEIA'),(1,1,4895,'CANAS'),(1,1,4896,'CANDIDO MOTA'),(1,1,4897,'CANDIDO RODRIGUES'),(1,1,4898,'CANITAR'),(1,1,4899,'CAPAO BONITO'),(1,1,4900,'CAPELA DO ALTO'),(1,1,4901,'CAPIVARI'),(1,1,4902,'CARAGUATATUBA'),(1,1,4903,'CARAPICUIBA'),(1,1,4904,'CARDOSO'),(1,1,4905,'CASA BRANCA'),(1,1,4906,'CASSIA DOS COQUEIROS'),(1,1,4907,'CASTILHO'),(1,1,4908,'CATANDUVA'),(1,1,4909,'CATIGUA'),(1,1,4910,'CEDRAL'),(1,1,4911,'CERQUEIRA CESAR'),(1,1,4912,'CERQUILHO'),(1,1,4913,'CESARIO LANGE'),(1,1,4914,'CHARQUEADA'),(1,1,4915,'CHAVANTES'),(1,1,4916,'CLEMENTINA'),(1,1,4917,'COLINA'),(1,1,4918,'COLOMBIA'),(1,1,4919,'CONCHAL'),(1,1,4920,'CONCHAS'),(1,1,4921,'CORDEIROPOLIS'),(1,1,4922,'COROADOS'),(1,1,4923,'CORONEL MACEDO'),(1,1,4924,'CORUMBATAI'),(1,1,4925,'COSMOPOLIS'),(1,1,4926,'COSMORAMA'),(1,1,4927,'COTIA'),(1,1,4928,'CRAVINHOS'),(1,1,4929,'CRISTAIS PAULISTA'),(1,1,4930,'CRUZALIA'),(1,1,4931,'CRUZEIRO'),(1,1,4932,'CUBATAO'),(1,1,4933,'CUNHA'),(1,1,4934,'DESCALVADO'),(1,1,4935,'DIADEMA'),(1,1,4936,'DIRCE REIS'),(1,1,4937,'DIVINOLANDIA'),(1,1,4938,'DOBRADA'),(1,1,4939,'DOIS CORREGOS'),(1,1,4940,'DOLCINOPOLIS'),(1,1,4941,'DOURADO'),(1,1,4942,'DRACENA'),(1,1,4943,'DUARTINA'),(1,1,4944,'DUMONT'),(1,1,4945,'ECHAPORA'),(1,1,4946,'ELDORADO'),(1,1,4947,'ELIAS FAUSTO'),(1,1,4948,'ELISIARIO'),(1,1,4949,'EMBAUBA'),(1,1,4950,'EMBU'),(1,1,4951,'EMBU-GUACU'),(1,1,4952,'EMILIANOPOLIS'),(1,1,4953,'ENGENHEIRO COELHO'),(1,1,4954,'ESPIRITO SANTO DO PINHAL'),(1,1,4955,'ESPIRITO SANTO DO TURVO'),(1,1,4956,'ESTIVA GERBI'),(1,1,4957,'ESTRELA DO NORTE'),(1,1,4958,'ESTRELA DOESTE'),(1,1,4959,'EUCLIDES DA CUNHA PAULISTA'),(1,1,4960,'FARTURA'),(1,1,4961,'FERNANDO PRESTES'),(1,1,4962,'FERNANDOPOLIS'),(1,1,4963,'FERNAO'),(1,1,4964,'FERRAZ DE VASCONCELOS'),(1,1,4965,'FLORA RICA'),(1,1,4966,'FLOREAL'),(1,1,4967,'FLORIDA PAULISTA'),(1,1,4968,'FLORINEA'),(1,1,4969,'FRANCA'),(1,1,4970,'FRANCISCO MORATO'),(1,1,4971,'FRANCO DA ROCHA'),(1,1,4972,'GABRIEL MONTEIRO'),(1,1,4973,'GALIA'),(1,1,4974,'GARCA'),(1,1,4975,'GASTAO VIDIGAL'),(1,1,4976,'GAVIAO PEIXOTO'),(1,1,4977,'GENERAL SALGADO'),(1,1,4978,'GETULINA'),(1,1,4979,'GLICERIO'),(1,1,4980,'GUAICARA'),(1,1,4981,'GUAIMBE'),(1,1,4982,'GUAIRA'),(1,1,4983,'GUAPIACU'),(1,1,4984,'GUAPIARA'),(1,1,4985,'GUARA'),(1,1,4986,'GUARACAI'),(1,1,4987,'GUARACI'),(1,1,4988,'GUARANI DOESTE'),(1,1,4989,'GUARANTA'),(1,1,4990,'GUARARAPES'),(1,1,4991,'GUARAREMA'),(1,1,4992,'GUARATINGUETA'),(1,1,4993,'GUAREI'),(1,1,4994,'GUARIBA'),(1,1,4995,'GUARUJA'),(1,1,4996,'GUARULHOS'),(1,1,4997,'GUATAPARA'),(1,1,4998,'GUZOLANDIA'),(1,1,4999,'HERCULANDIA'),(1,1,5000,'HOLAMBRA'),(1,1,5001,'HORTOLANDIA'),(1,1,5002,'IACANGA'),(1,1,5003,'IACRI'),(1,1,5004,'IARAS'),(1,1,5005,'IBATE'),(1,1,5006,'IBIRA'),(1,1,5007,'IBIRAREMA'),(1,1,5008,'IBITINGA'),(1,1,5009,'IBIUNA'),(1,1,5010,'ICEM'),(1,1,5011,'IEPE'),(1,1,5012,'IGARACU DO TIETE'),(1,1,5013,'IGARAPAVA'),(1,1,5014,'IGARATA'),(1,1,5015,'IGUAPE'),(1,1,5016,'ILHA COMPRIDA'),(1,1,5017,'ILHA SOLTEIRA'),(1,1,5018,'ILHABELA'),(1,1,5019,'INDAIATUBA'),(1,1,5020,'INDIANA'),(1,1,5021,'INDIAPORA'),(1,1,5022,'INUBIA PAULISTA'),(1,1,5023,'IPAUSSU'),(1,1,5024,'IPERO'),(1,1,5025,'IPEUNA'),(1,1,5026,'IPIGUA'),(1,1,5027,'IPORANGA'),(1,1,5028,'IPUA'),(1,1,5029,'IRACEMAPOLIS'),(1,1,5030,'IRAPUA'),(1,1,5031,'IRAPURU'),(1,1,5032,'ITABERA'),(1,1,5033,'ITAI'),(1,1,5034,'ITAJOBI'),(1,1,5035,'ITAJU'),(1,1,5036,'ITANHAEM'),(1,1,5037,'ITAOCA'),(1,1,5038,'ITAPECERICA DA SERRA'),(1,1,5039,'ITAPETININGA'),(1,1,5040,'ITAPEVA'),(1,1,5041,'ITAPEVI'),(1,1,5042,'ITAPIRA'),(1,1,5043,'ITAPIRAPUA PAULISTA'),(1,1,5044,'ITAPOLIS'),(1,1,5045,'ITAPORANGA'),(1,1,5046,'ITAPUI'),(1,1,5047,'ITAPURA'),(1,1,5048,'ITAQUAQUECETUBA'),(1,1,5049,'ITARARE'),(1,1,5050,'ITARIRI'),(1,1,5051,'ITATIBA'),(1,1,5052,'ITATINGA'),(1,1,5053,'ITIRAPINA'),(1,1,5054,'ITIRAPUA'),(1,1,5055,'ITOBI'),(1,1,5056,'ITU'),(1,1,5057,'ITUPEVA'),(1,1,5058,'ITUVERAVA'),(1,1,5059,'JABORANDI'),(1,1,5060,'JABOTICABAL'),(1,1,5061,'JACAREI'),(1,1,5062,'JACI'),(1,1,5063,'JACUPIRANGA'),(1,1,5064,'JAGUARIUNA'),(1,1,5065,'JALES'),(1,1,5066,'JAMBEIRO'),(1,1,5067,'JANDIRA'),(1,1,5068,'JARDINOPOLIS'),(1,1,5069,'JARINU'),(1,1,5070,'JAU'),(1,1,5071,'JERIQUARA'),(1,1,5072,'JOANOPOLIS'),(1,1,5073,'JOAO RAMALHO'),(1,1,5074,'JOSE BONIFACIO'),(1,1,5075,'JULIO MESQUITA'),(1,1,5076,'JUMIRIM'),(1,1,5077,'JUNDIAI'),(1,1,5078,'JUNQUEIROPOLIS'),(1,1,5079,'JUQUIA'),(1,1,5080,'JUQUITIBA'),(1,1,5081,'LAGOINHA'),(1,1,5082,'LARANJAL PAULISTA'),(1,1,5083,'LAVINIA'),(1,1,5084,'LAVRINHAS'),(1,1,5085,'LEME'),(1,1,5086,'LENCOIS PAULISTA'),(1,1,5087,'LIMEIRA'),(1,1,5088,'LINDOIA'),(1,1,5089,'LINS'),(1,1,5090,'LORENA'),(1,1,5091,'LOURDES'),(1,1,5092,'LOUVEIRA'),(1,1,5093,'LUCELIA'),(1,1,5094,'LUCIANOPOLIS'),(1,1,5095,'LUIS ANTONIO'),(1,1,5096,'LUIZIANIA'),(1,1,5097,'LUPERCIO'),(1,1,5098,'LUTECIA'),(1,1,5099,'MACATUBA'),(1,1,5100,'MACAUBAL'),(1,1,5101,'MACEDONIA'),(1,1,5102,'MAGDA'),(1,1,5103,'MAIRINQUE'),(1,1,5104,'MAIRIPORA'),(1,1,5105,'MANDURI'),(1,1,5106,'MARABA PAULISTA'),(1,1,5107,'MARACAI'),(1,1,5108,'MARAPOAMA'),(1,1,5109,'MARIAPOLIS'),(1,1,5110,'MARILIA'),(1,1,5111,'MARINOPOLIS'),(1,1,5112,'MARTINOPOLIS'),(1,1,5113,'MATAO'),(1,1,5114,'MAUA'),(1,1,5115,'MENDONCA'),(1,1,5116,'MERIDIANO'),(1,1,5117,'MESOPOLIS'),(1,1,5118,'MIGUELOPOLIS'),(1,1,5119,'MINEIROS DO TIETE'),(1,1,5120,'MIRA ESTRELA'),(1,1,5121,'MIRACATU'),(1,1,5122,'MIRANDOPOLIS'),(1,1,5123,'MIRANTE DO PARANAPANEMA'),(1,1,5124,'MIRASSOL'),(1,1,5125,'MIRASSOLANDIA'),(1,1,5126,'MOCOCA'),(1,1,5127,'MOGI GUACU'),(1,1,5128,'MOJI DAS CRUZES'),(1,1,5129,'MOJI-MIRIM'),(1,1,5130,'MOMBUCA'),(1,1,5131,'MONCOES'),(1,1,5132,'MONGAGUA'),(1,1,5133,'MONTE ALEGRE DO SUL'),(1,1,5134,'MONTE ALTO'),(1,1,5135,'MONTE APRAZIVEL'),(1,1,5136,'MONTE AZUL PAULISTA'),(1,1,5137,'MONTE CASTELO'),(1,1,5138,'MONTE MOR'),(1,1,5139,'MONTEIRO LOBATO'),(1,1,5140,'MORRO AGUDO'),(1,1,5141,'MORUNGABA'),(1,1,5142,'MOTUCA'),(1,1,5143,'MURUTINGA DO SUL'),(1,1,5144,'NANTES'),(1,1,5145,'NARANDIBA'),(1,1,5146,'NATIVIDADE DA SERRA'),(1,1,5147,'NAZARE PAULISTA'),(1,1,5148,'NEVES PAULISTA'),(1,1,5149,'NHANDEARA'),(1,1,5150,'NIPOA'),(1,1,5151,'NOVA ALIANCA'),(1,1,5152,'NOVA CAMPINA'),(1,1,5153,'NOVA CANAA PAULISTA'),(1,1,5154,'NOVA CASTILHO'),(1,1,5155,'NOVA EUROPA'),(1,1,5156,'NOVA GRANADA'),(1,1,5157,'NOVA GUATAPORANGA'),(1,1,5158,'NOVA INDEPENDENCIA'),(1,1,5159,'NOVA LUZITANIA'),(1,1,5160,'NOVA ODESSA'),(1,1,5161,'NOVAIS'),(1,1,5162,'NOVO HORIZONTE'),(1,1,5163,'NUPORANGA'),(1,1,5164,'OCAUCU'),(1,1,5165,'OLEO'),(1,1,5166,'OLIMPIA'),(1,1,5167,'ONDA VERDE'),(1,1,5168,'ORIENTE'),(1,1,5169,'ORINDIUVA'),(1,1,5170,'ORLANDIA'),(1,1,5171,'OSASCO'),(1,1,5172,'OSCAR BRESSANE'),(1,1,5173,'OSVALDO CRUZ'),(1,1,5174,'OURINHOS'),(1,1,5175,'OURO VERDE'),(1,1,5176,'OUROESTE'),(1,1,5177,'PACAEMBU'),(1,1,5178,'PALESTINA'),(1,1,5179,'PALMARES PAULISTA'),(1,1,5180,'PALMEIRA DOESTE'),(1,1,5181,'PALMITAL'),(1,1,5182,'PANORAMA'),(1,1,5183,'PARAGUACU PAULISTA'),(1,1,5184,'PARAIBUNA'),(1,1,5185,'PARAISO'),(1,1,5186,'PARANAPANEMA'),(1,1,5187,'PARANAPUA'),(1,1,5188,'PARAPUA'),(1,1,5189,'PARDINHO'),(1,1,5190,'PARIQUERA-ACU'),(1,1,5191,'PARISI'),(1,1,5192,'PATROCINIO PAULISTA'),(1,1,5193,'PAULICEIA'),(1,1,5194,'PAULINIA'),(1,1,5195,'PAULISTANIA'),(1,1,5196,'PAULO DE FARIA'),(1,1,5197,'PEDERNEIRAS'),(1,1,5198,'PEDRA BELA'),(1,1,5199,'PEDRANOPOLIS'),(1,1,5200,'PEDREGULHO'),(1,1,5201,'PEDREIRA'),(1,1,5202,'PEDRINHAS PAULISTAS'),(1,1,5203,'PEDRO DE TOLEDO'),(1,1,5204,'PENAPOLIS'),(1,1,5205,'PEREIRA BARRETO'),(1,1,5206,'PEREIRAS'),(1,1,5207,'PERUIBE'),(1,1,5208,'PIACATU'),(1,1,5209,'PIEDADE'),(1,1,5210,'PILAR DO SUL'),(1,1,5211,'PINDAMONHANGABA'),(1,1,5212,'PINDORAMA'),(1,1,5213,'PINHALZINHO'),(1,1,5214,'PIQUEROBI'),(1,1,5215,'PIQUETE'),(1,1,5216,'PIRACAIA'),(1,1,5217,'PIRACICABA'),(1,1,5218,'PIRAJU'),(1,1,5219,'PIRAJUI'),(1,1,5220,'PIRANGI'),(1,1,5221,'PIRAPORA DO BOM JESUS'),(1,1,5222,'PIRAPOZINHO'),(1,1,5223,'PIRASSUNUNGA'),(1,1,5224,'PIRATININGA'),(1,1,5225,'PITANGUEIRAS'),(1,1,5226,'PLANALTO'),(1,1,5227,'PLATINA'),(1,1,5228,'POA'),(1,1,5229,'POLONI'),(1,1,5230,'POMPEIA'),(1,1,5231,'PONGAI'),(1,1,5232,'PONTAL'),(1,1,5233,'PONTALINDA'),(1,1,5234,'PONTES GESTAL'),(1,1,5235,'POPULINA'),(1,1,5236,'PORANGABA'),(1,1,5237,'PORTO FELIZ'),(1,1,5238,'PORTO FERREIRA'),(1,1,5239,'POTIM'),(1,1,5240,'POTIRENDABA'),(1,1,5241,'PRACINHA'),(1,1,5242,'PRADOPOLIS'),(1,1,5243,'PRAIA GRANDE'),(1,1,5244,'PRATANIA'),(1,1,5245,'PRESIDENTE ALVES'),(1,1,5246,'PRESIDENTE BERNARDES'),(1,1,5247,'PRESIDENTE EPITACIO'),(1,1,5248,'PRESIDENTE PRUDENTE'),(1,1,5249,'PRESIDENTE VENCESLAU'),(1,1,5250,'PROMISSAO'),(1,1,5251,'QUADRA'),(1,1,5252,'QUATA'),(1,1,5253,'QUEIROZ'),(1,1,5254,'QUELUZ'),(1,1,5255,'QUINTANA'),(1,1,5256,'RAFARD'),(1,1,5257,'RANCHARIA'),(1,1,5258,'REDENCAO DA SERRA'),(1,1,5259,'REGENTE FEIJO'),(1,1,5260,'REGINOPOLIS'),(1,1,5261,'REGISTRO'),(1,1,5262,'RESTINGA'),(1,1,5263,'RIBEIRA'),(1,1,5264,'RIBEIRAO BONITO'),(1,1,5265,'RIBEIRAO BRANCO'),(1,1,5266,'RIBEIRAO CORRENTE'),(1,1,5267,'RIBEIRAO DO SUL'),(1,1,5268,'RIBEIRAO DOS INDIOS'),(1,1,5269,'RIBEIRAO GRANDE'),(1,1,5270,'RIBEIRAO PIRES'),(1,1,5271,'RIBEIRAO PRETO'),(1,1,5272,'RIFAINA'),(1,1,5273,'RINCAO'),(1,1,5274,'RINOPOLIS'),(1,1,5275,'RIO CLARO'),(1,1,5276,'RIO DAS PEDRAS'),(1,1,5277,'RIO GRANDE DA SERRA'),(1,1,5278,'RIOLANDIA'),(1,1,5279,'RIVERSUL'),(1,1,5280,'ROSANA'),(1,1,5281,'ROSEIRA'),(1,1,5282,'RUBIACEA'),(1,1,5283,'RUBINEIA'),(1,1,5284,'SABINO'),(1,1,5285,'SAGRES'),(1,1,5286,'SALES'),(1,1,5287,'SALES OLIVEIRA'),(1,1,5288,'SALESOPOLIS'),(1,1,5289,'SALMORAO'),(1,1,5290,'SALTINHO'),(1,1,5291,'SALTO'),(1,1,5292,'SALTO DE PIRAPORA'),(1,1,5293,'SALTO GRANDE'),(1,1,5294,'SANDOVALINA'),(1,1,5295,'SANTA ADELIA'),(1,1,5296,'SANTA ALBERTINA'),(1,1,5297,'SANTA BARBARA DOESTE'),(1,1,5298,'SANTA BRANCA'),(1,1,5299,'SANTA CLARA DOESTE'),(1,1,5300,'SANTA CRUZ DA CONCEICAO'),(1,1,5301,'SANTA CRUZ DA ESPERANCA'),(1,1,5302,'SANTA CRUZ DAS PALMEIRAS'),(1,1,5303,'SANTA CRUZ DO RIO PARDO'),(1,1,5304,'SANTA ERNESTINA'),(1,1,5305,'SANTA FE DO SUL'),(1,1,5306,'SANTA GERTRUDES'),(1,1,5307,'SANTA ISABEL'),(1,1,5308,'SANTA LUCIA'),(1,1,5309,'SANTA MARIA DA SERRA'),(1,1,5310,'SANTA MERCEDES'),(1,1,5311,'SANTA RITA DO PASSA QUATRO'),(1,1,5312,'SANTA RITA DOESTE'),(1,1,5313,'SANTA ROSA DE VITERBO'),(1,1,5314,'SANTA SALETE'),(1,1,5315,'SANTANA DA PONTE PENSA'),(1,1,5316,'SANTANA DE PARNAIBA'),(1,1,5317,'SANTO ANASTACIO'),(1,1,5318,'SANTO ANTONIO DA ALEGRIA'),(1,1,5319,'SANTO ANTONIO DE POSSE'),(1,1,5320,'SANTO ANTONIO DO ARACANGUA'),(1,1,5321,'SANTO ANTONIO DO JARDIM'),(1,1,5322,'SANTO ANTONIO DO PINHAL'),(1,1,5323,'SANTO EXPEDITO'),(1,1,5324,'SANTOPOLIS DO AGUAPEI'),(1,1,5325,'SANTOS'),(1,1,5326,'SAO BENTO DO SAPUCAI'),(1,1,5327,'SAO BERNARDO DO CAMPO'),(1,1,5328,'SAO CAETANO DO SUL'),(1,1,5329,'SAO CARLOS'),(1,1,5330,'SAO FRANCISCO'),(1,1,5331,'SAO JOAO DA BOA VISTA'),(1,1,5332,'SAO JOAO DAS DUAS PONTES'),(1,1,5333,'SAO JOAO DE IRACEMA'),(1,1,5334,'SAO JOAO DO PAU DALHO'),(1,1,5335,'SAO JOAQUIM DA BARRA'),(1,1,5336,'SAO JOSE DA BELA VISTA'),(1,1,5337,'SAO JOSE DO BARREIRO'),(1,1,5338,'SAO JOSE DO RIO PARDO'),(1,1,5339,'SAO JOSE DO RIO PRETO'),(1,1,5340,'SAO JOSE DOS CAMPOS'),(1,1,5341,'SAO LOURENCO DA SERRA'),(1,1,5342,'SAO LUIS DO PARAITINGA'),(1,1,5343,'SAO MANUEL'),(1,1,5344,'SAO MIGUEL ARCANJO'),(1,1,5345,'SAO PEDRO'),(1,1,5346,'SAO PEDRO DO TURVO'),(1,1,5347,'SAO ROQUE'),(1,1,5348,'SAO SEBASTIAO'),(1,1,5349,'SAO SEBASTIAO DA GRAMA'),(1,1,5350,'SAO SIMAO'),(1,1,5351,'SAO VICENTE'),(1,1,5352,'SARAPUI'),(1,1,5353,'SARUTAIA'),(1,1,5354,'SEBASTIANOPOLIS DO SUL'),(1,1,5355,'SERRA AZUL'),(1,1,5356,'SERRA NEGRA'),(1,1,5357,'SERRANA'),(1,1,5358,'SERTAOZINHO'),(1,1,5359,'SETE BARRAS'),(1,1,5360,'SEVERINIA'),(1,1,5361,'SILVEIRAS'),(1,1,5362,'SOCORRO'),(1,1,5363,'SOROCABA'),(1,1,5364,'SUD MENUCCI'),(1,1,5365,'SUMARE'),(1,1,5366,'SUZANAPOLIS'),(1,1,5367,'SUZANO'),(1,1,5368,'TABAPUA'),(1,1,5369,'TABATINGA'),(1,1,5370,'TABOAO DA SERRA'),(1,1,5371,'TACIBA'),(1,1,5372,'TAGUAI'),(1,1,5373,'TAIACU'),(1,1,5374,'TAIUVA'),(1,1,5375,'TAMBAU'),(1,1,5376,'TANABI'),(1,1,5377,'TAPIRAI'),(1,1,5378,'TAPIRATIBA'),(1,1,5379,'TAQUARAL'),(1,1,5380,'TAQUARITINGA'),(1,1,5381,'TAQUARITUBA'),(1,1,5382,'TAQUARIVAI'),(1,1,5383,'TARABAI'),(1,1,5384,'TARUMA'),(1,1,5385,'TATUI'),(1,1,5386,'TAUBATE'),(1,1,5387,'TEJUPA'),(1,1,5388,'TEODORO SAMPAIO'),(1,1,5389,'TERRA ROXA'),(1,1,5390,'TIETE'),(1,1,5391,'TIMBURI'),(1,1,5392,'TORRE DE PEDRA'),(1,1,5393,'TORRINHA'),(1,1,5394,'TRABIJU'),(1,1,5395,'TREMEMBE'),(1,1,5396,'TRES FRONTEIRAS'),(1,1,5397,'TUIUTI'),(1,1,5398,'TUPA'),(1,1,5399,'TUPI PAULISTA'),(1,1,5400,'TURIUBA'),(1,1,5401,'TURMALINA'),(1,1,5402,'UBARANA'),(1,1,5403,'UBATUBA'),(1,1,5404,'UBIRAJARA'),(1,1,5405,'UCHOA'),(1,1,5406,'UNIAO PAULISTA'),(1,1,5407,'URANIA'),(1,1,5408,'URU'),(1,1,5409,'URUPES'),(1,1,5410,'VALENTIM GENTIL'),(1,1,5411,'VALINHOS'),(1,1,5412,'VALPARAISO'),(1,1,5413,'VARGEM'),(1,1,5414,'VARGEM GRANDE DO SUL'),(1,1,5415,'VARGEM GRANDE PAULISTA'),(1,1,5416,'VARZEA PAULISTA'),(1,1,5417,'VERA CRUZ'),(1,1,5418,'VINHEDO'),(1,1,5419,'VIRADOURO'),(1,1,5420,'VISTA ALEGRE DO ALTO'),(1,1,5421,'VITORIA BRASIL'),(1,1,5422,'VOTORANTIM'),(1,1,5423,'VOTUPORANGA'),(1,1,5424,'ZACARIAS'),(1,13,5425,'ABREULANDIA'),(1,13,5426,'AGUIARNOPOLIS'),(1,13,5427,'ALIANCA DO TOCANTINS'),(1,13,5428,'ALMAS'),(1,13,5429,'ALVORADA'),(1,13,5430,'ANANAS'),(1,13,5431,'ANGICO'),(1,13,5432,'APARECIDA DO RIO NEGRO'),(1,13,5433,'ARAGOMINAS'),(1,13,5434,'ARAGUACEMA'),(1,13,5435,'ARAGUACU'),(1,13,5436,'ARAGUAINA'),(1,13,5437,'ARAGUANA'),(1,13,5438,'ARAGUATINS'),(1,13,5439,'ARAPOEMA'),(1,13,5440,'ARRAIAS'),(1,13,5441,'AUGUSTINOPOLIS'),(1,13,5442,'AURORA DO TOCANTINS'),(1,13,5443,'AXIXA DO TOCANTINS'),(1,13,5444,'BABACULANDIA'),(1,13,5445,'BANDEIRANTES DO TOCANTINS'),(1,13,5446,'BARRA DO OURO'),(1,13,5447,'BARROLANDIA'),(1,13,5448,'BERNARDO SAYAO'),(1,13,5449,'BOM JESUS DO TOCANTINS'),(1,13,5450,'BRASILANDIA DO TOCANTINS'),(1,13,5451,'BREJINHO DE NAZARE'),(1,13,5452,'BURITI DO TOCANTINS'),(1,13,5453,'CACHOEIRINHA'),(1,13,5454,'CAMPOS LINDOS'),(1,13,5455,'CARIRI DO TOCANTINS'),(1,13,5456,'CARMOLANDIA'),(1,13,5457,'CARRASCO BONITO'),(1,13,5458,'CASEARA'),(1,13,5459,'CENTENARIO'),(1,13,5460,'CHAPADA DA NATIVIDADE'),(1,13,5461,'CHAPADA DE AREIA'),(1,13,5462,'COLINAS DO TOCANTINS'),(1,13,5463,'COLMEIA'),(1,13,5464,'COMBINADO'),(1,13,5465,'CONCEICAO DO TOCANTINS'),(1,13,5466,'COUTO DE MAGALHAES'),(1,13,5467,'CRISTALANDIA'),(1,13,5468,'CRIXAS DO TOCANTINS'),(1,13,5469,'DARCINOPOLIS'),(1,13,5470,'DIANOPOLIS'),(1,13,5471,'DIVINOPOLIS DO TOCANTINS'),(1,13,5472,'DOIS IRMAOS DO TOCANTINS'),(1,13,5473,'DUERE'),(1,13,5474,'ESPERANTINA'),(1,13,5475,'FATIMA'),(1,13,5476,'FIGUEIROPOLIS'),(1,13,5477,'FILADELFIA'),(1,13,5478,'FORMOSO DO ARAGUAIA'),(1,13,5479,'FORTALEZA DO TABOCAO'),(1,13,5480,'GOIANORTE'),(1,13,5481,'GOIATINS'),(1,13,5482,'GUARAI'),(1,13,5483,'GURUPI'),(1,13,5484,'IPUEIRAS'),(1,13,5485,'ITACAJA'),(1,13,5486,'ITAGUATINS'),(1,13,5487,'ITAPIRATINS'),(1,13,5488,'ITAPORA DO TOCANTINS'),(1,13,5489,'JAU DO TOCANTINS'),(1,13,5490,'JUARINA'),(1,13,5491,'LAGOA DA CONFUSAO'),(1,13,5492,'LAGOA DO TOCANTINS'),(1,13,5493,'LAJEADO'),(1,13,5494,'LAVANDEIRA'),(1,13,5495,'LIZARDA'),(1,13,5496,'LUZINOPOLIS'),(1,13,5497,'MARIANOPOLIS DO TOCANTINS'),(1,13,5498,'MATEIROS'),(1,13,5499,'MAURILANDIA DO TOCANTINS'),(1,13,5500,'MIRACEMA DO TOCANTINS'),(1,13,5501,'MIRANORTE'),(1,13,5502,'MONTE DO CARMO'),(1,13,5503,'MONTE SANTO DO TOCANTINS'),(1,13,5504,'MURICILANDIA'),(1,13,5505,'NATIVIDADE'),(1,13,5506,'NAZARE'),(1,13,5507,'NOVA OLINDA'),(1,13,5508,'NOVA ROSALANDIA'),(1,13,5509,'NOVO ACORDO'),(1,13,5510,'NOVO ALEGRE'),(1,13,5511,'NOVO JARDIM'),(1,13,5512,'OLIVEIRA DE FATIMA'),(1,13,5513,'PALMAS'),(1,13,5514,'PALMEIRANTE'),(1,13,5515,'PALMEIRAS DO TOCANTINS'),(1,13,5516,'PALMEIROPOLIS'),(1,13,5517,'PARAISO DO TOCANTINS'),(1,13,5518,'PARANA'),(1,13,5519,'PAU DARCO'),(1,13,5520,'PEDRO AFONSO'),(1,13,5521,'PEIXE'),(1,13,5522,'PEQUIZEIRO'),(1,13,5523,'PINDORAMA DO TOCANTINS'),(1,13,5524,'PIRAQUE'),(1,13,5525,'PIUM'),(1,13,5526,'PONTE ALTA DO BOM JESUS'),(1,13,5527,'PONTE ALTA DO TOCANTINS'),(1,13,5528,'PORTO ALEGRE DO TOCANTINS'),(1,13,5529,'PORTO NACIONAL'),(1,13,5530,'PRAIA NORTE'),(1,13,5531,'PRESIDENTE KENNEDY'),(1,13,5532,'PUGMIL'),(1,13,5533,'RECURSOLANDIA'),(1,13,5534,'RIACHINHO'),(1,13,5535,'RIO DA CONCEICAO'),(1,13,5536,'RIO DOS BOIS'),(1,13,5537,'RIO SONO'),(1,13,5538,'SAMPAIO'),(1,13,5539,'SANDOLANDIA'),(1,13,5540,'SANTA FE DO ARAGUAIA'),(1,13,5541,'SANTA MARIA DO TOCANTINS'),(1,13,5542,'SANTA RITA DO TOCANTINS'),(1,13,5543,'SANTA ROSA DO TOCANTINS'),(1,13,5544,'SANTA TEREZA DO TOCANTINS'),(1,13,5545,'SANTA TEREZINHA DO TOCANTINS'),(1,13,5546,'SAO BENTO DO TOCANTINS'),(1,13,5547,'SAO FELIX DO TOCANTINS'),(1,13,5548,'SAO MIGUEL DO TOCANTINS'),(1,13,5549,'SAO SALVADOR DO TOCANTINS'),(1,13,5550,'SAO SEBASTIAO DO TOCANTINS'),(1,13,5551,'SAO VALERIO DA NATIVIDADE'),(1,13,5552,'SILVANOPOLIS'),(1,13,5553,'SITIO NOVO DO TOCANTINS'),(1,13,5554,'SUCUPIRA'),(1,13,5555,'TAGUATINGA'),(1,13,5556,'TAIPAS DO TOCANTINS'),(1,13,5557,'TALISMA'),(1,13,5558,'TOCANTINIA'),(1,13,5559,'TOCANTINOPOLIS'),(1,13,5560,'TUPIRAMA'),(1,13,5561,'TUPIRATINS'),(1,13,5562,'WANDERLANDIA'),(1,13,5563,'XAMBIOA');
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
INSERT INTO `ocorrencia` VALUES (1,2,1,'2014-07-29 10:45:00',5,'briga de torcida',NULL,'-22.9124127','-43.23060','ÿØÿà\0JFIF\0\0\0\0\0\0ÿáFExif\0\0II*\0\0\0\0\0\0ß\0\0\02\0\0\01\0\0\0\0\0\0i‡\0\0\0\0\0\0\0\0\0\0Libertadores - GrÃªmio (BRAS) X Nacional (URU)Torceodres do GrÃªmio durante confronto com a propria torcida, momentos antes da partida entre GrÃªmio X Nacional do Uruguai, vÃ¡lido pela Copa Libertadores.FOTO: WESLEY SANTOS\0Picasa\0\0\0\0\0\0\00220†’\0\0\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿâ@ICC_PROFILE\0\0\00ADBE\0\0mntrRGB XYZ Ï\0\0\0\0\0\0\0\0acspAPPL\0\0\0\0none\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-ADBE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ncprt\0\0\0ü\0\0\02desc\0\00\0\0\0kwtpt\0\0œ\0\0\0bkpt\0\0°\0\0\0rTRC\0\0Ä\0\0\0gTRC\0\0Ô\0\0\0bTRC\0\0ä\0\0\0rXYZ\0\0ô\0\0\0gXYZ\0\0\0\0\0bXYZ\0\0\0\0\0text\0\0\0\0Copyright 1999 Adobe Systems Incorporated\0\0\0desc\0\0\0\0\0\0\0Adobe RGB (1998)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0XYZ \0\0\0\0\0\0œ\0\0O¥\0\0üXYZ \0\0\0\0\0\04\0\0 ,\0\0•XYZ \0\0\0\0\0\0&1\0\0/\0\0¾œÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0†²\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0{n‡.–ÇT¬;¢Òtjº»·m‹¾;<~|è¯æ¦çÍU\0¤DÛ¶Ÿ´mašåÆ‹CÏØ„²km¡^‘§ÂÛKLËd‚‚>ÛëAð]SRÌ/¥ND~»îk+W”ÑJ.c³rå_L7òŒ	R1ª«díWQê´Žî½e~dÒã.,Š†B(øva„¹éº$ü`4;¥×[ý˜ï*´F‰~9.ÑaSkBm•K^«,LK\",_hê\'¦Âf¬M)å\0&ÑÖÓ»§d|èì4wf–m\']kÒ»Òæü÷Ïad)wä¶,þ…w4h>I˜—n/Yãïzñ	÷q¨‰FØY4+,÷h×Cn­q[-õóDk~ÖphÎ&ÐšSxÓ_˜³ívy}ŠQcàºÚ.ÍmÄWë%XHî¿”\'uÝuïz;\ZÛH]Á9lõúÖÞ’þ½¿_²èIª:Ÿ½&UL™U.€³e$ó­ˆÑ`øPL=¶O÷ßXR5YtLmƒ²‚Å\r?Í>Sl­€¦ðÛvrSE8$Ø\r,[¡»˜ëŠ	¼AÓ_¶ÓÝÑ×lJÄ”Ã…#¦˜\\9³÷¦ó‡ØZ„#&mšÖø0²ˆd>8þÓ»­¹ZÎš{Qe\r-hí«\nzÉ	q\Z½ÓD2›Q—‘ÝÎ?¥É ×kšçÛž¬˜Ðò\\×†+òj×¨§SYù]©t6°ºh2Çè>ÏÝß%ç£»e½]qß™Ça\nÂð–œðž²#¯¬iæÚ1“¥ùÎê.¾x—µÄÜBÖ´eQýH(®±0öK’`ÜVë‡[o¤±ÍSÌù[qã}K8\'•#9¿Ç/çtø]öù¨%Ý*ÎzG<8–Â,«ñïHó¿H‘x(×ï3jçÃ…‡¶y\'ûK…;ïŠ 5·ßHQÒÂ¢ÇGC¼~®+i,ýK:/tÂU„¯D7C /À”8`udï‰g#/ø=`Ð¤üš11wáßµë˜ðòó“m-ÑÎ^Nê‘ZÃÚ¶O{Nÿ\0Õ1=1Kºßgu<ù?c±û÷çw¢ÊÇ¤yOÙ…òk êº¾ŠÍ§	ö¸³mìõ\ruÜWƒE2DrWetý×­5ÕtbVâ®N%]9É	¢j48ÉÐq$¼îÐýO¾L=#PÏµ¿9û¦\'“ÆY%ª4’ÂÒ”ƒsm¹S@× y`Ï[ ï–`‡UxB)µ\'ÚÞ]û;S\rÌ-©¤‹ôô6Ü[²‘íeÌôV¶•ÌV’h,ÑwÁ)z	s6Z}+Ï8¡v&í•£Â	:â“»+•ÍUTëPZ!|CgÙ\\QÔõæ.Íytåö.¾ëµ–]Û²Ãgv1gÒö3°Waïïyµ>|ûó¸U>ÚE,ý•Ž5bf­dä\"Ü‰BÖP;Ÿ3èŽûGQÑÁW­Ž:+×·à~}c¦(F­ñ&QaêýŸw€™i&dbà0î%9úÆ]–îw5Ö²Ð³4‡I…ns©œ¾aÜë×Ç¦±®ÖÒ«ñrL=£Xx+\"<ÇSuw­¡NZÛ“ˆ¥·+\"`(Û7I=l³ÀÊ³–1¢ºV­Ú,&c*×ÍÒ\0énrê$8šÂÆäôÄnû;\\ðD²–Ý”ÛFÂtw3(Eí+mÑáÇè¹ë®4êJó3e&Øµ¯1>Ôâ7Ç®©ÅÏŸ5Ü{pÙ¤œÈÄªÑŠ@˜û[v@ÚŽ£EœÍÙ¼¾þzÜÎÀØ-\'¶ô…8oÌ–årJ5n$P¹ ö)=:zu¥yf%­GaD2ÄlQvÂ:Ï5‚´ËÊ_Wms>i¢zŠ IîÖK“’8Ÿ;?W—0a‚¢ìoLõ¹³fi‘³mv	KqìÛôÑKa2yW¸ºî÷Üõ²–mUY`M9Ð ´E™¯Y@}Ó¼¯Ôó<ÿ\0˜lÛÑ-‚ÅFê†³³;&Uƒ”¿GFŸ‡»§lªÎ&Ç¢y½§^émµrbÔ\0tK´óÞ°-aY•’jš¡Åd¡š[ˆGà+2#‘-×n:×Qê53Ës­Á\nœfU1V-Myêþ§²×¨•v/­oN¢²Îî2Ì„Ä5ÖIP]0,¢&B…sÑ\\˜q¬µr	u.Ï‚Y[â\0ÈØ‹ýÎ†T¶“¶‰M3_¦ƒW\rÌÝJÏNðÚV}cC‡Œ1ÅDzV\02†æ‚-«-YØ9c„¸Çul4t.•.$¼ðž›H¯æ¹º?‚^}Ý\"§.$žU=Ìã¿?°»¥åÊ¨ùC•ÜÆ_tìšåè’;³·§ßÚ–à%ô²^(Ý²ï„žÕ2»üÇw8Œ.L—dVP¦ÁxÏÙt´³ú]§F’¼Eûº#!å\0v]Ó2\r´™ÍSÍñ.É¶¹åº#Ow¹õ—k„~M,FVè!eÌ\'%Óè–‹›a‰?ºm^¢’ŽGÄªF`NÇ[Ö6†ò´Œ&qúW³4«¢o¬ƒOaªœ€ÍPlcÉ½¨>¸Ô?n¡õ O±1¤ÚZY¬3µX*;£€««¹Ô‚‘sJ—«™ 8„—HE!1”ß¤´;	AZœÈ¸„äám«ºDmñÏæg?ôM/ÉVÎjñqUÒ	çƒ–Ài\'¡5 ÉšÜ^0ƒ›Ï¸­²ÐU’Çåû­uºršFCf7ˆÒ¬×_ @“5sá{å{ŠžQO³Á×‹ž0s]ÆÈ½•ö¯˜0õÈa]dšl€ÞÈ“oiZr‡Ä2\nuBá*ë¶U(]3ÀWr³tm-¡l]YÖe¬y”Ñ¿1ùå}xÍŠ‚ý”ÝJr«A\\Â-¿”]µ—ò­]jEy™§[ÕªjRQ+§`š,_¶<}óÆ^Òô<´dh•Ýgè¬ÎÇ¥ñçÏ‹¦½jËS0;‰Tm’çó–îÍ•¹ÚO@åÜ©lý•YÃ-ªóÐ?âw}i—”&9Ž2ñÛçµ¯ac.Ð˜’Yaé²`0\0\rÄ¯~sèK, )÷Vi\rWô‘)µêÆúÐÚ—\rvw†6`u­È#EW®Š9¾œ¼°Ò×+m“zmí0uªM=Õ…&-£L\rsp÷^+÷üðd8÷8>k®Þ»S\ZÓ´8˜òõìCôW˜(îU¹;CÓchÔÇ1\'TÝ,Óñyn±ËT¹j$ÜÍPC§)Õ¯¤äb8ûa¥µŒ&·Í(ß*×tçÈ$™KMl»}/-!¤‚ÒÈ}´•=Ï‹ÄŽtÂ÷œ²½:sÈñ/K>~ ŽiÕËd\\ÐÈa¹õÔmP|kö<Ë¾g@¼µ+©ÔÚ© ÖÍuèØ)¿Qßœ;ô³4y5MKoZÖUK‰•šmsv¾©ÿ\0\'˜ŠÒÏ–™.~¶Ð_žÚá_ÐH\'W`Æ]ÈUãÍ#;Äg5‰;I[FÑWŸ¡s$š`’%Æ`dMxã¨8\rK†_‡ýuÕ\nÃ0Úu~Ý.#«ßqµvmò:Ú<2Šæ`ËBÔ°\'Õ£_Bð“-ƒ-kµàìô)Ÿ/8ó´No6ÀMøq¾Rš0 —I\0…\rìùöšH‹	\"Õ]¢µ¯OäUxü•ÈŠY²ÛäþÀ™ÕD¦–Q³‘VŒ‹¢¹év}è3^,;~ï\\Ô\"S)ëÅÀÚ¤ªµôy¾g\0cåôO,\0õåºqQJd3%7?”:Øã˜±ŠÔur8÷ˆ;sø¿@ ÜQæN5qŸ¡R¦o$52ôã<èµ¾c2s˜f:jæVöäX®p{½skû©B&í•2‰’ÀØ|*_céP3ŸÌÐú.ùüïó¡5M9¾Cz@îj~^¤¬DÅ‘Ð‚v¦”{°^·M2¦ªÅ#ºnf®¸»èÇr;Õ-Æz±eA9Ãdšy¬¤8\0Öšvš­fzí jEÆtü0Cwe{™íSQÅžô¨Ÿ*Æ$Áq•u¾Áæ-l«ÓJð§4¤¦’V­¬(ç{MKf-ç4\n!—ã¹vÌW…vu¾´mBfŠÞ£=òÙk¶jm|\\8,Î\\ßE2©©¤°[žÙ¬u8æ½±Ïý0›cñÌÃ]R¥gz;å€©\"—h‚@›™‘Së¬“i³(¬}Oîí™¯°ÖÅhæ¸Ù0ÈÉ[÷¡š¡•CRÓíôbîÈò;™¬¾g,¯<1YçÐËÉk—s/rÃ>æ~+O½ÌŠ°Ì\"XZÄ±ÏÔU}ìÛœ^\\i›y\Z°’r‡µ0\n½)iLT·«láÞ¹Á?¢-ô\nkÉêÚÆu­l–¨$×¥šòT½t ï)®\'@‘sëÏ+cg0yÄæKv#	&9‹a¸Þ¾Y~oêe-XÛtã9sóJ\nO^Z¡„2ó¶Î—…áÆ¨¹TêjØQ\nW5`·H§UeKh9+Eìá¢\\i2b|@¶N¤ÑÌ%ö~dA˜íÍ• ë«ÛN²×ÝÛ/(Œkbáš[Õ{­¥òú˜¹€À¦ŸWYÛ”lBK)ÔsKë²c¸Ç%ÊÂ:rÌa³”i‡¬ sC1†:D¼Y“ýAUÍ7–zv’ðœlò“Å‘³‚Ä©ï[õ©<t‹8Ý_?HÔ½núØ¿ùÕªÈ>¿ó{TâLy­® ÊDvS±Å@¨ZÛ¢9¢9(s¨ô[	`ÂÓóû†ì©H¼ë¥ÉŒM¸ÈÜñXõ¸\Zí\\V‹Ndë9ˆ<\r¹eR£MXM‰±Í®E&¶qaÝÒŽßjÃàÌ‹FŒƒ*üuƒ2«•ÕÖD.;ËÙ¶GV½{ªVEâåð$ißyú¬D4Æ‚ÈUÓ¾>3øûæQ9IÕ¶bMèá#?v§˜ÂI»ú›x®ÐšÅÑçó@Ì•ÎŽ•õ¥&Å\\5¶H9—”âgª¹Vöoj%ÒoÑã$	öÑŠØ’Ò¢ï;PS\\1Ó	—©aã\r,0‘›¹DÆ	oî”úVeÊ8!(Zz_³‡kqXg·å Â½¬Š®n‡É\n+AûzN’„û}Ÿ¨c|ªqÕØÉÑF* Y¨pób¡¶hQ>ÿ\0h~i¤²(]váyÐJ!èp‹¼ë;ªÞ£1û‰cÅÈ?0æó*r²ÈÔg]ÑÈö8þ¶®-O`nÍK*\0z)å{<3Y‹»NqÛÞËž‹ÖÉç—²O¢PÑ!.ÑG+‡š%v5¼üíµPm”³j7uUûÎú0ò›HÆVízb¹}y5^GØ{„)vN’\n<­Qâl—K8‰6Ûyp¨ä¢sÝ\"eÏ,¿=²U¯#¬—y,4óÄµY4\0ÓIäÁ-Å½vŒ¶ìàj]=*êºÓ{Í\rÙÓÄ–([ËuW>ù£¥E¡Z8ršÉÊ9°÷+AÀ)ò:šÚ:‘’ªñÙDÉ(u¿Wóƒ‰µ‡GãLƒÇ¿hªÊ:#ãžz!J‰¸«È¼!©0‘%]³>zÿ\0=MeI)|gV©Ò#ýóZR´ì5(›\'òÙQÖœ•ØúUâçTÁz-&ÄZõY4NÄjÍ¤Ö­V*hë%É1vÔ‚eÈÝî$FãÒ’uZB·´Y:Ã:¯z_%\r…«ENoÄŠ\nEÇ5÷0]­v›]–(‹»šØ*±]–œæŠÙƒ©y‘ ð#N¾lË|K-ï3èÚ÷Ì¯Á*Ê}Òó+|Hý]—²I»cµÃpÁWì¥Ö«$W¤PBÄx{4RÒbFÐJ…}[tí¨Þ?è5sÃõ …F;õ=™¼°qš³Ž-Ú½“©<Ü7Ôân0õ—¸cö°”ÂÏ\'«³¨yÅŒJW¬>®ÎNô3G£¢yÓ¤‘=:Tn\0\n—¤9ÞÖö A\0\\ìEŒºØÁ¢ÃL­>Ý¢_JÅªžWA¾½°?(†\nÔÔ®Ít:µ3:k~ÊzØRb5kù¯£ï´éžÚz¾hÌÕ‰h)¦“e\\wJPÚ¹‡¶u‘A”üs‘Ã•U«œoB«>O9¹~ò±?(—‘Šòô%ô_5¾\"Q[«ëZ™´õëÚß¸ÇUH… ^8ðIªà‡ôLÁ†kµ8úohm.O0l*ç´g÷9ÈI—b1ŠÁ²€êÒ½—ßwåPåOo²£#;Ž¦ªšY_œ\\…r†W*Xâ¶ÔZ8jobê\'…]eÄµsQŒòÀ[tº9\\¿§ #¦õ¼™£”(›ê¶Ü«dï—B©…ÞZˆÌ]úmT–‡Žˆ…fÖö3Éx®½É/8ôÄ‚±ïp-IÆÎ*ŽCRŒdq^¦t[L¥+loJÙ³½1Ž‹±*6\"ó?x¢†}<^¤ËH«M‘Ûà–ÛUlÞíÑ3‘Y:§dNškzÖ„ià?j¥Ãv&¡úùW¢ë:QÛæ‚q—nÒG‡MPÉ6j‚ê®bÎz±›­œöf9kôø·[C>øísi xX›W;í//³‰?ð/ËAî bO2Ù0s€NˆãÜ=ÜsˆOÎ“ »#Ž¶íî8È\'ã€øLx.–2è:øq´u…PÊß²Dïézý^Î Ž<„Á—À|{Žñ\rÆ8»àg§Œµ\nhî/ú\r¯¹ƒà)V§Ñ“ydÔ&ªÊýeò¢EgÖôùÄÞáS¸šmV1Å?+l;ª+ˆo¾\röªt°tá¡”º•éÍMrU˜P‰{ºù+§yf½ÚËfì“Ì‡\n¶Ó¿·ëT7“Î_	é\"©›©\0Ú§=t‘aWqB?ìBv±Õ”./ ëÁ» ½ï2_Ì}MÈY[}lÎw<\n†À[|Îúˆªê*@X@C-…Tš¡–öÀh´F«#eK6±,,	Ë*MÛ4ÅdéÂ· “UL;VQ:½®aTúGN˜H@¦ï9œ»DñQƒ/¡¿\'ŒsôqùZa›Rt°+õ«$V ÄGYAÑ\nÒÐQéè71D{‹mSíèíQË«;«@7ÌûÛ½~¿¢-µûßl,ÍB[p®«å”y8œäâX÷=7ÅhJ©)+­å4ØÊµdJ’¥ßâ7©9ç«ùôµ£²e;	Ò­RR©±«™îsé>^Yþœ¡Hük9ú•Úm(+.ãÅuü™–XP)]‰ÞÒ˜uv´\'Ò±+±H9 °íÖ‘šFžädîö>Ù‰z1•Ñ$i€¯­ói,ˆX_§Ny›eê¹¬ùcØ|Ç§Ÿrîù³æ]Û¼þÊ{`ŽŸ=´„©MÉ4TŠôŒÄ][®¬÷G(NÂlkf>í¹Þª=®DO==¬’rî»ÏkÈŸjí	yÕ¶Û†ÚÜiÐ”Dî(²-¥‡_ã¯0ßç<ôÊ@Túç}ØF ƒBÏ!³ÀC¦—eµæùúÕû¨é16ë„p×ž	2®©Zp8ì-£YOJ•³;F˜Ðæ.\nèo—\"²˜€hý-©*-©lL¹U^í‹9S>¼àªDÂ}È˜_eÒŽ>u¼dÛ.tÒï~†”‘3WÒg°Â{f¼>tåÏ‘Ù{-Û2¾{qÝ+º„z’)3›KŒI ÒI¾^¸0ŽˆìNº®bÂìe¥£¿ë<«ö`P§ºCœ\r¯åŸ­È\Z¿yCÙÝ{Ñn¢%÷Ž¶í^÷rÙ5ï1WZ[ÞAë­ò®Î—ïnùüU~õlkï*WáW½™²÷Ž¯Í¾ñr;ï\\qc{Í-8ÃÞîº“ïZ=§Þµg–ûÁ\"øÞU«*ïxLN¤÷ŽŽ6¾òïÒý÷Œ¬—Ç¼ØÖâžõ©kiï.e~õÃ?O½5Ã{§}èŸŸ=îæx×¼›ÂíoyÔ;¶½KŠ{ÉµÊ!¾óÉ•0}äœ9»÷›I?¼&™)_x••Þ_ûÇ>÷­?ÿÄ\01\0\0\0\0!\"1#$2 3%A&50BÿÚ\0\0c·M·Åfm‹í†ÿ\0kåß\\ß7ÅÉ#æ;@ôK]Õxü¶öÇa?£™î?öhôFû\"ñÀ™väçcwGuêæ¦ŽäbÆUÆÌT^J òj…Û¶	«#³ÐŽüš’ì‹§x§éÐ#ý>Óh@6ËÓB.6€ƒRéóµ®­2a!»]¼‘qEÅùö\næqÅüË\Z‹VÉ\Z`×æöíbF?\Z¢ç4b;eÏdP¿åìäü`ÇÈ‘AÆ™Åçøž	~Mv\'¾pßy×Š,F\"cßšÞOÏmó~9ÏîMO²â¦Möp‰óˆìoøß5D^›%þÎ»vûmìLåŸÙSÜùq\\ñTF»\ZÅeuižßH˜F~Ÿ’á‹Oª(h¼\Z8ý-©1Ü@5¹Ö˜Û6ÅLÛ,›¼t_n¤s†Þ± †F’°Éšn9Ö3€¥~0üsŽï¶Â3†¼ÇïÛö0-ýÅ÷Çî˜Qï‘I¶wkÑX¨ånËŠÄ*Cœ	d.K\"3ÞŒ\"ìY\rç‘ÉÄŒv#ñœóž<¾îvØ÷óÍ]ï1É¾â¼r)\Zöfùí›dÿ\0Ç»WÎ6Ú}Kzuý²¬©Âê\rIPÉšÀ_f4Šæ+3|Go…]‘W|{ñÇ3³6äPÙ¤)»ã†J#U1ûªv®rEFpÈN“;X˜²Yž[0dG§ÞzloöUøÙ˜æïšº7Žòµ=Ç€6ÏÙ¥D&xaîØ’–;Ù²qŠ=ðˆ£QIBcÑ6™!yòÊu©\'Yˆ¹OcÒ¢ËaÐÛµÂ\'$x¸,uæ=²ÆúR?êMb>¯VWÜ8…à÷5^¢\Z5CùÍUÇÿ\0où\\%êiÕ™6êpò-W:ëø6Ù9ÌpóYÛ©eo›oˆžÔw¥²][X¹ovK9þÌ64¨öñ÷æ»H:1­z`ÝìÔÛ	ÍS“°nãƒ\'$Ñó”gÉ:ñG’Ó)X®wWbìœ×e_hâíÏŠ%wú¾ò½Âåœsoa\'íþ>Úª/“\\ÝÙŽj98ñ#IŒ27ø•6ÂÅíÈR7z;–#¶W\'³•›89Ò¿gæuc\\W:!#àÛØä¦›$ºNÙ@²‘\rÎ»TEG$5âë9ì­:i¬¦q\\c•ŽÑÚ‰×ÝLùQ¿•x,\nËõ*õÈˆñZêïFÉ3‰,œóIÍŒÄÔÇ&j«nj#¶E„ý8âÈ§vË¢$rW@^[âfÞÂ+“¼‘x.,TpÑŠÉ;c„Å\'åî…ãnËB^¹àwÅœòzr{‡ÅßãííöªßÝ}zì¿y_ég²ªà=Â?õâ¢¦OâPÏJüöcø*<è¸–·4bpa\0æ{™ÝÍë±_b8dþºQ‚+,+[\nIb\nÆ9ôÓ‚í5ZŒ(¿o“AÖF¿e‹#eú—y%BÒ\ZG`«Hvý>GÆÔiûÛˆíÉ¼‚êGÑÒ3¹Øúÿ\0v–/³Ëì›ç{ÉƒÔÄ’Yå¥\Z–h\'¬R€ˆªf§.Vx£V¹Œ‹Ír(¦±ÙZæ¹‰„jp ùc€Ýº(˜er9s1²]Ê¬ÝR\"=?±Æ¥BG;suá²â1qAÄnnÙÈÇÁÿ\0gÞWúþ¶Ý@»ÇT°õÌã¿õ•¨r¯^yÔAþCÕÈ2µÜÐ¸ñï†f\0¯ŒçÆ¦Í#]ý¾Èny#“TgÅDzTF(¬nl;IrŠ;LÔÈ:ÒlVýL#ÖY‚Ú,Ð£ÒÅE\0$×ÑBíA¬G}Wa8‡ˆD–Í4ž%ÀÅ¶\ZÜ²žHô¡ö\Z#Fo¹bE—X®Ê¡$‰­æ8õì—(ÜÇÒ•f·¬*áÉtt4ó•b[”OhÛ\0Y1±hJTËIå›àŒñ:%ƒ¥\ró—šŽÄ›‰;=Eû¾[Ü¾Sñß,aÌÐVjhl_dÎ9Ç„€‹‹	S#—==½˜ ´y·Üé¸ÞÅLv[¥3jý<È?F .>Cåi¥ýHx­pðfG¢·|x»@¬+^Çl¹²\0ŠÎ·ösW5‰„UÊˆÊ€Ô°[ƒUvø›¹yíšGS“OÚ+šðêFkë§büC‚/OŠ	ŠÇ\n8©“,—ñ¨e¾<$w¿-²‹¥Ò;¢®9­sµ<ÁÔUP—‚u\ZS´Ó\ZÚ,Vý@¾ÐeÙZþXÖ\"¹•£¤6\\ÕjZµ£žGs&&DŠùD›e;Ÿn6šœ®qZ™Ú™ÙˆF®+Û³œ‰Œ+W4d¾»q?v£ó³9ç,ßÿ\0ÅS|p\Z¸DÍJöÇ©lÐqîòlOŒˆÉ¶’„Ÿ¥å”M‘È{=íÇ5«ƒ“¶{ª«‚ìß‹šNÆ¹¨ö±Ê5‘ëM\Zc¢é`mcú|)º‰ÏÇ•¬b›Î‰$í&Q¥Ñé¥‚÷E ‡wƒFX1ŠL5:Ê\\¬Ÿã¨-å»;1-´ûZ2ªàwn!°õ-“õó,”/km#°Ìkr3¤\rdf­ý[ZÀ5Ï@¯Ê¬$*uÁèÂ¸Ç.\"î‚b‘ké©aam5JK›ËÂ7]ž2q>ÇM‚Hxš«ÅvèUJ,kh{¨Sí¾o‰‰þ?CVq X2pÿ\0ÃT²éE BÓÉ%»”w‰”Ð¼m?¨ ·æ¸¥À³A£\"ŒsÊ{«­j,éÐîL%w	Úd+yf¥ìÎŽ–»\'’ç¤í=^YQ\r‹U[Ô³zdøah#¾X‚ÀE•h‘,ÉªHÓ¾í`À¬HL6D;\ZI/Tù‡¯c}–ÈÙo\" $&ü’ºnËñv—ÔiPþðÈYO_!«‘Ý²ÇDL¹kÅÃ-`X*ù1ZŠÑ6HB7¶Ã¨ÓøÕÊaþûc@upš›EÖ¬gÎ4‘*ç¾B”×{ªÓeÅfqö\Z+]¦5@¬\0‡jçxóË*ÏŒ˜) *â}ì\'6òÁ-\'S6TðÕë«$†<µR1d¹ÁòrÂ6}B¯ê±å³¥Ý•ÓP>¨›Æ°´}¹œ¸¾ÙÏåLÓB-‘b\r7»|‘øÅz¶KxÞ³¢|™B!{,œ‡ILãj1›-¡:’tØL—êBtjòþØôÕ„ãÇÓýàÄ‹\0}bŽŠ¶vö­¦ èæ’1Sê$Í’’§1DrHwUDÄuk:¢}qâ€ib8ög1Ò|‡Ç/Šy·¶«o=~Õ\rk€é8­¥)fÁ§ë…ý%ÙkÎ0ëÒ4»8xŒÞƒïöGqXóÝ@õ4Ã4öòHGI+žY;(¦(ÝQ;È¯B&#±ÏF2æi,-(ô[çäxìˆðÖd¨GeÁÃÔŠÖÕØ²\\¨Â92;É«âyôE\Z;<O Ð4ËœùÔ’\"š=ÉxV8E«€–%\'G6iHi¸òº’¢IqŽÃ½Õr&_É\Zí9’z™`¯ï§ÈT„ñl«¬ãk{ß:Ù¤UFÉ ò¦ýÑÕñÂ\'©IcT;(‘¾„a:ËSÂžYJìçœ°Lb2}3ÎæAmkn ù«ÞP>E¢Hyx	nhÀîXeDa\'õ<—V\nÊHÆø¥ê_µmƒ¢¬{HÓCH©¬£¹¹yZêû¨ÑžW¤\"5¢™ì7+™hBK—ÚæàåãJ×bµPòLwÉ¯ß8+œßuÒ®í¥MÓW\'™ÍˆQ\'(MAÄß¼q›þQP.‰6õI]ÚNUZéYæ”hjðj\ZQJÓQšK—‘ÄxdÈ©#Oiôü6%ÔR2L8žA«Ì€>KU•3z­\ZD&Z0E¨¨\"HŒ­Æ\ryRÖ¾CÅZÁ!D&æ ¹z*/Ë6÷Ó\'GVÔÉ\0dÊ€ÆpÐŒãÖ2$ðJf£¢{\Ze½ke\"ˆ¨¸ãõG¶KHPC^\\ñ¢på8ÏD#:É]ŽLTÙúi935%RUØ91«€3†º>G{.{¯­‡6ÒºdeQ¹7N%Dg\'ÖäÄqTÆÈxÜ“·Æ™¦DöÍÕ®Ð²ÐeÄDÍA#¨N^Mc¬Gä‡©PrŽf[Éðkm@AÉÝWØŒUZZ÷D–Š¤Á³l²¬´5ŽM=wT®}³†\'9òrÊbCŒçH¥²·NUšµ‰)S“½%J¬a$“¼‘{Òdr	ÔÔÄ’ØE]DÆîÈ‡’Dòd¨ýéã½å§Å!ž	T°<¶\Z\'—]þðÏ\Z°ÅÔµ/ÊÃTŽTà²\\wÔ´à\r\\3{¹ý­9–èªÆ½\nÑÿ\0bÅ[aà¶âÝ’‹Íè©^JÏtÓÎVXÙÁu¬un5˜©ÅÚf ö¶\'¢u„;Ý2¹:ä2–¬×¨¯–DF¡‘s8â\".m‰ï9Òæ§k3B=GfÑ.#\\™te%¨)šê-}`fùâoswù7TL`jìbŽf\ZÛ­\Z€N~Øò´\Z{G[EZ÷#\"éýú€½Ä’ˆèçìu<\"Êqâ”±Ô/Œæ¹[•ÊãF¡®Ÿ%‘ê_gòŒñ\Z4\rE\"#—Ëja%«òPøÝê\01Ô„gGF¹†F£>|c·®bf™µ$HGég]“7TÊëÃÖàœéLñ28r=ó¬»ã‘7Înjù(åíâ/{•\\/Ép~øÖ92¾µÈØòŸãê„¦«˜äÝ>˜0nãŒ:o©´K$æl}AQ¨ô]„	‘q²$‡g~|]›b78ç$ß—%p7JÂ”ãÛ1È¹<ý“Êÿ\0ÚXä;ô­ÒÃiìQ™.ôc µàB=A«ÖØ^‚+§/\Zºö½Öþc§¿‰M™å¡ó$8Áñl4My	\Z®0Ãa`8)Y\\æ>ìi(>fÉ	5h¶â|;Õ’®ÌŒ[U,2«ùwíŒ²xòšli,õ3ŠP9B1ò\nçª%„×\"½éƒ‘‡sÉ_¦]š [X˜å%àÅÃ³dÒ/Úñ¸ð«ˆÈ>¬çH˜tz\"‡LŒ±­5k»e\\}ÃÆ¹Š\ZÈÝ¥A+pŒkG_8ÕÒ(¾¡náÈi†Ò|]0íûFáê‚…×ÊìoÍwã‚z¦u¡£z.Îjv\";˜ËJ˜.Æ?LØy•NsZ2KýÖ)QË:1G*]ÑÅKM°©$§.š(Ç>#€UÝ5†ÏÆXï²¾UsâŸÝkÛ&/{Û\\Ù‘M\\%‘cÂÃØ>sûBÃ§_Wl×ØFÁŠ¾Ò¶ï“²¢ËŒ:ãŸ‹› nc‘r…	ÚWÁ;?3I||eMµ™$D\'Gí± óMM‡ŸSY%”žÍ³žøÕÎäÒ®p-z3&Êññ&OªáLâœ2#´¦$¤ªÓž£\rÉÅZí±W|‹îPGFâ«1YRvŸÈÇkŸðüã_²Ñj9tD•«ìâZË”¬¸›eWµyb\0ÏVé2;Gz=íÅ“¾sbâŽÆÇãƒìfhI|àÍUlZX³xâÊR)ãÉ™0o_]¬Wc.¢5]1J–Âi\ZDá†ù8pÞbÃ²Œààd%JªWE$YHöŠSã¬AKtàŠ!ÖqHHÂ{,«Šªˆ>\rwnØîJ‹“Œ\Z]+Ï0äÝþÏ\Z;\0äxì ã\r¡aà!ä½êk„»*É%tßUù+$G„÷YÍÔQG\n>#±	¹¥Âùw	ÛžøR|Úæƒ‘ØíOKå»&2	\nÚ|‡tq N\Z¨Œ‘EÌx¬ª¤UÁ‰rãËµœö—HÖç”(ÙªXWY\"ç/hÌM´üÐnjÈ3Ûw¥\Z\"²T‰Ñ<bV@$—C<m@%RÔX_Î&‡¶¤vÅ+J<B‰ÙËÛfŒ•ÂÅŽG6ÇEÃœøÚ0ßàÅªŒHë¶¶îˆí;JÒFm\"€ã²ÿ\0s&Á8ÂÕâU´{%çn%BJ=`ˆmNBšXm_ëxÕeššëPÏ¶•¸#½H+‘sã¼»$Üª¨ç„Ÿ1±b8ÈÖ¼û/c\\âü¸ÜXÖâ%ÃBðŸQr”1‹a9ÞXý<ŒÇý´µ[-ík´È+â¡BÔ{˜h‹kb€-V\rÜ™¨hø¾›ÅRßU»•-¦ÖCÓðé\"T3´öÅ•–uÏ«›\Z»õ ÄÑÖQÌ`…:È³¾à“Å±ZP’=·R6â9ã×Çðä¾´;WÅHê¶J$c +zdcmô©¬f.Š‘ÅšÛ7C™3ô1i4²×Kb/Û~)ªõYR\\;°]Ä&I5Ræ&‘¤ËqY\rGÊÝzâ9‹»@B§B„[ðu Y&ÊØh¤öÀižIP»&E+]}‚FT¶*”–Ê©rs(¨Mæ0¯ë#ù5ös\nç;+ãöcÝÀbù ÞéWõ6a>Ÿpr.=¸àsË\'cS½›X¿»=²\n$DÝB¹Ya\"µt¦¦f¤®t¹Dý²AøŠÂo“2,§3+ìRA\ZF\ZwN\'8ÐªÒBÎº‹CEü«ù&‡Ñ€µlÜ°êÂ¨¨=K,¯]äœ{QQ~ôÓÑ™]Ø8Øãñ:7¨\\ML’s*À«x¦8cC\0xŒŒ>ŒèÎœéLh¶ÄnmšÒåñ8¼ñ¯ã’,-je00üÝÑ³Ó®ÅÉHÓÃW²™qÖg_œs$ßÐÆY¾Qo&±¯ŸØî}¸†ëÈ¿bVù‘€Ù¥‡òrÃOÁ£h„H§^Bh Ë}Œø½ÂDv*.DfrA­´4{ëmåW¨Éü¶7°”Tq¡%ÍÐe²Î)W¥Wülá¸e÷Í³EO<-Cç91OÅm,:ã¿óZ‡3Ü3ùàÿ\0 TíõjšYÓ\rkŠB\'9Ÿ·4fåšK¤Ÿ]Å‹IetÌ)ëîQ•o*OÊ\"H¢£†nÚÈ]\00•ì´Š…iN¬ÆÈGdB°¬³›á8VÎ;«­Ø£}×ŒƒÕ!È÷ÐÎ‰ioU‰qqKR]¸\"“]QùñHÇžFŸúg.Ï+4µE5f‡Yò%:U|ˆíy	åu05SÏ‚†Q7‹,˜È¬TÝðgÃmõ*Î‹/€\'‡¯{­VcN¸Ås²üÆÖAmkYŸ§)\r(ÒŽ„Û4ÍàáF6¢ˆOMGDÇ²¼ª’ßÒ˜§A®ã2ž;$³OÇªˆÛ5‰ÞÁ½óåC	êÆ#œøl+_P%ÉqwlÊ•R6ÛšQæ­\'êÉè‰–§W©·ÙŠ‚vØ+$ÇÎE¿yÏF±µöBP¾i\nŒ¬V¤ ¹EÄSkjùD—¤Í%T(e08ôr¤ZÖîƒk1Ïö“±¶:ž-SÈè±Ê×O½†æ:B¼£Ç±ŽWàäî¢×#Ÿ¾17È,UÅ­kñä26M|¶œs#0l^Y6®™c&Š4‹)TšbŸ˜ðŒ­ÔZY£¡2[fÇñD\'qÈÍ$’~—¤Ñ×\Z>_E$‰à \Zðl½ÅÖÜ,#ÒkŠé\Z²ÿ\0×fï›ã]šRs¦Ö+vIäÉ£ñæ¾SÛŒ±å”Å™Í!ÍF=³Ñq¯ç†ˆüV(Ö¼ÛcUtÇ·’urÊêfÇÇ\'vHwd™ÜjŸ~Kˆw¦Jªïs£FîZ&ŒsÑ¾d˜¢lbÈhšUóXE\ZµXcWÝ¢c§0£w¹vbNØÙã$£™xñESÜ¸Øéd\\fŒHH9ôÁ43ôRå\r•J`\\±Ê%A(ðxéŒH°L|íóLØòŽ{	·×d·’hËÕô÷NúAªÍsŽŒl{VÊU74Ô@muµÌuŸN•C0ª,m•óV Ç%ˆéÆÖÚ½à4=+g;¤äÕÔÏ;­täxµÀÒ† ¯©¡è¹¡‡Â»Ý¢w¦X$J{wk ‘ØÊ™*²ôŒv²ŠÅ˜ØSæùxÀY«7¼‚TE—Ëì3½ÆÜ‰!¯Â®ÿ\0i…øó÷ìr·ò«þ	b€\n34ìf*9FŒó9d­”Z•¿¼»cwÜG+WOSM•‰¡aI†j\rVÑœæä‰=B5Ó^ÅÛeÍ—jÞî­\r-¾¦Ÿk%]j–Z~EQ™*@ñÖgÙ¯´™‚©¼‘‹§5!Wjj‘R[IÍ-a6;*«âÚ3ÃsŒr+RHš¬3+ƒs®Õd¼¯‡-Xø£Ü¯È¨7¹ö;äsö­}bÚžæÞ¿HäÍ]k7\"\\:d #µïcÇ5c–=ÔVÜ×°j¯¯E«`ÎI%›\\«‹ìøë´€Àï“$h\0ÕŸ¶²ÂyVcm\\5~¨p°Z¹M‡àTW äso%W±Ñ¨\Zq¼Ÿ¶ÞÆä­$35º\Z{Þx¯ŽõM¿Á­ÝP(Š#µ¬aÙ”³ƒâ€‚’vIc²êPÕu	9`#ù£¥ÓÁ„Nç¢8Æv<|Õ‡td¶?$ÃCæ§æ\nÁÿ\0\\ÿ\0¶±Ã]+[¼xìôéSÒdMñW\rV9µ¡ö¤Ðœœ!Š(û‘™ê\0L°µ‹Ô\ZqÌ±©w‚HÖ¡ž9hÒë\\FŠ¶Wrm	Ë»÷ñ›/’·‘™Áàu`‰>EÝøôÌGªã›éwnÒ™ˆÂNù±Œ2vqGiWÁß±!G¾UËŽëK}]’‚dílvN’¦v˜:[*„—.EX£\r°\"¨oã	C/|¥!$²CŽj¹¬ÖVÅ‘)\\‹x–CHãA›f]7ÙúV½qtŒÏÒròª=~&&ìNy\ZWQ!R@ÛCÖŽÓäç;E,£³Dl°k¥Æ\0á‘¹Òíž*H¯˜ü4iím9N1kZš§®]\'>*ÇûÖDç&E(¬I[Ä®%«&¼!~ÕOTi\nKhìÈ×1UMª@Ô“ª\nõ=¤¹8ë·z›]Žžªž¤ñ¯«ç­¾;¯/å[òqŽrâo\\c²¶SG\"pÒºÔ3Å …&þklÛTtcˆN¾·E®ƒÄ_Óá%ËÈ‘œó\Z6E¬UÊØ\"sWñž(í\0ì­å“·QÊ‹TÉ}œ#Là”$Š\Z)ZÐ\\ÈG$‰/b\\fEcÜ\'EØª0pQm³}²Z*Æ\rº£–Z#<œY\rUïnÞr.$äÏ=3În:ÉK‰þISø«÷]?nÈIÍ\\ó›žboäµ3Ên$¦¦y‰žZg”‰‹)‰’ŠÂ7“HážªâÇ™éò6Ó°žL¯aa½_–¡ýß)Ì\"Hj¶I8b—åC‰9¸¶l\\õcˆÃãÀØø³\Z4-‡n9¥B:Söy\\EFâ{b\ZüìÁ¿Ü‚\r”S‰ÓðÞÊùõ©˜´CjÄV%{Ö<Ö—œ™á–µ\Z^@4&‡:YÆ(™E¬E4æµxV¿Ž·t¦ÉÕvò\Z\r;\n)k«&T¬9ÒÛh;…‡ÒI-©Y1ì’VÆBHÝj$~à¾\'¶1Ëœ·ËYÉB—Í;“bâÚ\"(e¸¸ù/yÙêXé3ìÃÓ2@	ˆ¹ÿ\0ô×äR\"%†zŽ%†z†yùçbNÏ;<Æ®>w°íüt¶ôÕéxïŠZhŒOGP½%›ZýŸ\Z0äÆ²ÓÒ¬µ49•UlšäpôÏ™]&®dd%tî§QXõŽ®ÀØJ	\"emxÙhÏ&Ä¢Ï˜x\\DÀÃ,‚.–žÜ-$ðâ\"³=ð,!––¥D¶H¢¤æ7ÒHFØê–2S(¥jacä¨eZ\n(ã±ê­Ä“³Æd*9Ûaˆ¤…ý‘çÆz.–$Éš…Íu6ªq}ñ¼ŒY¶ÒDPi:´œÔãªêQèìˆªÓÄ6øß–\"íŠ¼²Ê§ÊQW˜$M?)P-V:\\v½ë/ÅÏ-Æ^xï’G,ÓBY–ÖTÌëz~ßjæ1ë,¯c;_ÏÄ;ñ§~!‘Í¾\0!*,Pm5<†•wÓzzUœóYU\\F²1¬Ï‰ÍÕ ‘3Ög–Í–q¬*Ù/µú¯J»OXèM@eÉQ`KÁfCT2Îx¥CòÎ\'Vê»)†KŠö¼cÔot{Œ]9V\0s‘qÈKM4Ùx$E|xQ`ŒÇA–löÈç­n–¸H~m®™CË$¢î&f—s|zï’\\Èsy‘	¾=Û%q6Î[¶<†4÷CÚN¨núf¿SFM¬eÅ%tGW\\ÇE_i‰ÌvÑF¼4\\ˆÿ\0eÍñZ«”Õ“)ßPPNåÇ$~_îDvrÎX„ù!¸4%,@ /ãìÖ+²®\nðþìß7Æ®5pNùD6Ø7óÃÒ–Ó)t€ad1%l™\'”ýÎi$y5–Ú°pFf,ó”úbù.JÒ“Â–¿›	}]0/‡&ªõ×užôÍE4Öuv:ucŠ|Võ‹OòŒÈ‹Œ•ÜW”yÍ[\"ºÐdÀÜêÛ&l–lÆO±TdEˆ\'âEl6/–á«È+1j:WUÈ#X<Ó¯QÍ{1I¾Xn£€ý¦5ûgocâü\'¯ö–N˜e›Qp~–Ñƒl|¿Õ‚«É…–A•c–²á’Äñ4£¼¦òáp‹ÿ\0ös]º~2®+§Ë¶¾ëŽÊKR³tVñäÇû;|ßíÿ\0n¹¦ˆÒ¥–žõ\'KÒ¥ŽQQ²</ä—Ð\'=\\å_ðjàÝ³ã¿Þ²å­y:Ôz!)\n±…l@\0.l}A¥O·DËq*u®ð‹:Ä–U\Z…ÏŠz©©,fµúþ™²WdúÉ¶¶ò5;ÐV!È²¦¤f1aQU_Ô63™&´n$zÑ`GBË“È\Z`¬Q˜Ùª¨–On6É]’„Âˆ’eu%áý^‰4¢Hl3¸¯X×+›’A¸£\'êÌc½›ÿ\0ÐwöÔ%QÜéÉÍ—Ö—¦hÜé5!\nE³ßïò°¯È3šõN)­mQ£9¢TÁ	qôì®*É¦\rYŽÖv<¹*cK¶]Å`Ï¾FF¿Æ5#Çuªr§ü¼Îˆñ×r(È†¨a2Ê¬Ñ\nö{«ìŸdÄþÕÑ2Déž‹¢_¡˜s‚Ê	iôü8WG,(¦J31âÆ7Ï¯ÐGãk[e¦(©Û*ª`e\nŠª{ã˜RüZ&àº«}TÍ#\'ÎËs%dsA,×‹\Zxp¦›\Z:Õm,l\ZøÓ¥–:ú‘^œŽ\\é‘‘àÎ>J«±Œ8&;aðI.j%‘µø°¾s\"1¼BÁôÑÄŒ§²òÉ/À“wuî¾è‚÷²ßvëíÇa¢\r±–Oü‡/üeÌ|h˜ø\Zye¸úy|U‚æ#¹bXìŒ„ÍØ¹I`ÚÉvã_A±´üHUòf«¯êâ\'UÙ½ŒôL\0°1¡ò’èÑâ…æ¯‚8LTG¡áº$ÎôÛÌ¿¥@\'ç=¾É‰öÓu)&¢\"¾×J†œ_‚T`Ù’$0)\0˜žc¥éU‚K»î–ÕŒ­K*³Æ‘O?l›±C\n=¥48F„irÝ2KH÷¼—\"ŒHpÖK\'ÇC®ë¦¸±ç\r¶pî)Ø¬AK{	TXÃlc,t´IÌ›Æ¬¹Š…¡ÕÅŠº$v–>UL+ÝS%¢Šéˆ™êBÞÈ¨ØkTqe8yùl\'ò8ÿ\0Ó­ÃÝšZO‹uHöèÀº$-ZK¢ØWÀ‰C29ÒÆäqñ,VNKQ$¢È³×pHåœÑ¹I©’	íc\nÔ:’ÈÅ:W®Ïb®Š™üIc1\07Èq”j¬ÆHÊþ-žÃóD6s]Žå¼fülÒeœ%¯›ùÂ–qã‰šb­lfÆÏ5`Zý+$i¤j\r	©!F–7£™}!÷²ömU\\6ö§]1Õš‰š‘¾;eµ³¸8rZT$&ª°«¶¡gßlììEUPVÇG›Žã?Ç\nÍ‹]%XžBy–:|®œj´žœMÙ¨†9ÜÈRÆ@K\Z’©\nèõµ²ØRÈÈz`Ã_Ò’¥š™	Î¸®k1ïG$Ù†I1œÇæÊ5!]ãÄøGúl‡åXÅ\"Æ”tXÓ‹îµ‘È²²šàAG\'±õNbLG³>MP9½Ò@ž¦G1YE«’JªÝ_wåÌŒ1¬f“Øžù»I¹ªû«y79eBvÏôb±Å‚´˜‰,UÇUŽ§T#?:º\'!\"â?=\n®Òu>,{Ûô…ùFúzÕ˜Ôz¸P\Zy˜h64>ŽGÌ½ú‡BÏé¬µYŸSÞ¿ÓUL´©®®žõóÌbôÈÖ˜Ó°Ùm\\C­ÍsÚã”Lí²*#|’oâ“ù:D¹’W¼â\Z¹Sãœ•2P,\\‡fÇ5²¢¾šE³sÕ¸û\\tä\\t¤\\íÃKAŒJÙ¥·b‘rA‘\"7âÑûw(·7QÒ=¥l¯6‹SY¬ÌdÄÈSÃaXYª…B.Þñ§*cÊ5ÇMã‘¬œWÚÆØ²FªœÖ¥¢°v5ëëŽŸ-±¸Ÿšï„í÷ÃGGä¨]IŒB;c5Û%ðûjøâ&7Û4Ì%™=Ò‡CPj#^Jc7‰V®•.‡zê[¸^›mJîÿ\0§ºÝZ›W‹ž™úx½z“_üµWÓ& gZ´±îÁ=û†j«…,ÂÈ¶é´ä…jË-5&H“óÒþòål{“e¼M?½”vèis´8ûn„0]ªíœ½ÕØ.*Tžh\n-H×£,w\nNiSÌjg¨\"c¬3Ê\"ç›!¨y Äžà•Á{ß’G’7ò	¿Êp_$š¾\n´ZRb¼£ó´ïäé´TÞQj!×¿8Z[•{ô¬Ö©©,EÓÓÈ¾ˆÊ˜\\U>ù3\0>H™©¤«jßïŠ›.\r2’?}—ýþrH¹«Ö²GäE#¾h¹/÷`ñM½±©ºèªVD¯Öšm&+9å}7‘§¾Éî¡ø¶ú°rõ–„NØUé÷º‰;*>Ÿ–¤ú‚:§GIðnä=áŸªÖê‡3Ž!úKúÊŠ€¼I0.A z‡OÀ4‘	Ò½Û$œ[3x±/¦@ˆº(¶r’)ÈU‘=ø¿eÆŽýf16O á_1®ŽUÃ½Ás‹ÖKgÜo€\0ô4ŽrÙ:@RuÏ@A¼ë³ÒzrZWßGDdÍ3Çœ ôIÈnã.åv®cë¦h›í–d·GBñpœ÷#,f	ík:¬\rFÔ3elŽ›’Õ³#È‰ëöÙ¤ã39a’9ÍR3á“Â~øÿ\0p#×vþ+¢:lËíbe®r9ËPébÐê\r·Ò²/’ìÖÄÕ:Ká¬uÌ/OÔ)®{èþ˜Ö/oÔ¡ñÔ0Œ™±ûãë!9¶’Ö$²&A÷a—aÙüO!ÅbÑ_MmÔø§/Ó§,•s±W*-]S&Æè’²\Z{‘7]ñWÞØßï\n¨Nx£C²ˆŠØõ÷¨™5õŸÎÚTs;\"¢Äw%z+QXŠö»µUžaÙ$Ñä{í¢z]´“Ž[Úÿ\0Wê8«Óì£ž—t••êØUÙü¹:C±ÙˆN§ÜBöa]\"»Æy0¥ã™³ÂýòU*Éœý!-pšj@²²\Z(hÛÜUâ—Ns®+È7ë>mŒo\'D¨yr‚I¶q,Úz*÷åÐeËHÑ‚úf^7j¿/©q÷‡ æ<ÚSiqêHÑ¾š™’Õÿ\0ÈiÈ~e«Öï©Ì@Ú\"*0à•‹¼i	Ä7âùr¥Ú&ˆ;U—Š¸¿eÛr#v°Ÿ…L_µDÊ])ÿ\0Ð“Ì	ç²,Ö²šIÏè”pÅYE\Zc$1Ø’ÕqüHÊ‹âòÄb&\"Ò!!lµë?öjÉ§/FÆ\\jplü¯ªRä0°SrF“³ÿ\0”ö/[®ÅØ‰#tÈ¿\0˜Þƒ—|I}“tÍlY¦F ‘¸GG~OƒX|ñ:×oŽÇ§ÆÅÛ\\A’Ä¹‘èÜgö-~Ã‡ˆ±#®z4,ZxnFÐÂÝÚ~²¶¦5T¥´\"å‘Ô1Øx—jzé2\\×J[¨b½H´áÊ’ŒkÊ`_“ôT,&††L‹ZÈÃ$d(æé@LWèxïk´U£¹Gý\0,_§¢Åúz<ÿ\0Çm\\_¦ùÿ\0Ž •ƒýì_§Ä\\_§…\\wÓ£çþ;“4¬¸5‘ô­„6Ž	ÇÞÓ‚ºRRâé)yUJhpâÔø¸°H¹é¯v62½kƒ*¾k‘E`­ÂM\Z¥®¥h]¨Ü[Ë\Z©Ã‡Q©NÙ¢»\0m!¼QñŒcšêŠÄåˆ¼^Vö°-àÒîˆé\r+\"7ùÈW5	8ÔZ<\\·±\r%|=néö\'	9Í†€¬­^hZ¡}K²\0ð+ÿ\0­ãøÜG²ëEê3[ƒü¤Þ(“óÎÄž‹‰56ó3ËLò“<´Ï13ÌLYIžJbIMü„Ï!7ïMü„Ï%3ÉDÄ”™å7)¹Þ™ßéé‹!1d&6Ny)žBgzgz&y˜³ÆÕm^æ½®ÄvvgjmÉˆ™Ù‰ŠüWç$ÎÌR¦vçfwíˆì“NªiÐåÛ9 ³[ŽÙqñÑÊ-p˜‹;;§£(lÙæ+ÐŽVäˆþçãÞ–çæ—Jø\ZƒWxï5Áå¤Y~,š]\\;g_IO@\Zryö,¦øu:àÁÉÕMT»„ç\\Jo£É¸ÏîI;§vî’ægž˜Ùé‹a‰aíê9æ;<Ïuš¨¾v:Z·~Ø³³Ô3ÏÏ=3ÎLõTòù/“¶y»\'Ÿ²zƒqlSQNKaïæ¢§šœ|ÔÏ1<ÔÇÏj$›gË/|R§×&G¶B³ÎLõÏPLóùgŸŒž˜ùé‹5n$ÔTYx³}¼Õ\\lõÆØ®_%sÐ©\'O$¶ÙG“	b˜ø½SÆçŒªqôÂÒ¹Åä¬¯®hˆ¬s7£Ð­\\œ¬aýdíÀÊt7’J‘{wMÕ¨‡p‰G4VµV\ZB¸ue	Ÿ{hD\r@—‘%¾V±­oS¿|°CÒÄþÎö!ŒïU†œÅ5hUiVA7iI”A+ÎõÊrÇLMk¾¢ ˜)¯mcˆÃPy”=ÎÛC´VtÆ®\n²`ÅÌÜÚèÌ#]\0;j?âÇÓ¹|’l¶iC1ïD#ÜÉ“$ÇÄ¸“‹q1™ërSu%2I‰ãOXØæ=MºÊÆÄÂÇj¦F–BÇ%º	±,M1Ý¢c¨\\Ã~¢&~¡&%ó³×ìõ¼K¦¦\nÜ.ÊÕu‰tõ;[ÝP6õ|¶5A°\r¶=<–€G‘_ŒIÃt;ç¸„{]‘L‰ MëÉ\0s±¬ÅSì–³ØSy8«É6ÏÆvïŒ^N¦! iXúÎu“ŽY(Kf=”UCç‡ÔI!ò¢+Œ#Z8²DvÈfù%¼lkÓ`X&Ã³~çAòV:0L_Aº]ŸP›ÛM„7þ¶Ù–Ü„~c?Ó9lõjÇtþQdI‘”nåÙ©>QÄš¸tÀ;l\'\0sd ~ñÚÓ*×	R\\^µ‡#º+Åî­áŒ~øwª(7Ty•pÎÝÈ>˜ÑéÝse_¦áWGú‘hEÅqyfùË7ÍþÜ³é÷oê&7dzy7Ò$øçpœl\nÉyeV±­¸·y\rj˜Â—Ùä4Æ“°qšÕÉÖ¬jÙM{žþG\'„L°ŽØ¨ç®sÎX7lè²”T«ÿ\0/(¿ÊÔ³:ôÝs<‹+IýzØ‰ÆF£©ð.<^Ü}j‰cNÜ—-Me]ï\ZÄj¡žŠ’#fûb`Ö]N\\~Z”]Ú5Ÿˆr;H°ŒVj8ñç]ðKz™„¯²—\Z\\›ùÁ’\"Hý>Þ^í›zîBgõ7¶~\\mº94¿²T2â™rAý¡„€‚ÓoŽ.íGbu÷hÊM°)Ù\"yxgÓÈqRžþô“ç\ZÎfo‹÷Û¸Ï¥F\ZKcù+*<Y·vW™º´¼ÚŸ&N‡â¨­Vq;,ce’pvž?t5+†0X0‰pd,úÈÏ9R6¾jk“|é~$rbÉ©|]!Oÿ\0×9Z—®ƒJ³•Ì“©¥Æš³ k+D9nÁÌ±ŽÍA‘¬*ëˆ°Î\0#u$Z	Ë‘ãÎaWVÝ¨øÕÚù`!gM4C|a\\I‹e™è¬UVq€UÆŒÄs‡†QDn›/my—ãnýÆ/Ä„ö+øßÆ/!;,JózJµ\rf<.kÜ7.Ÿ5Erâ;ûe[wqÉÐ¶Isæ¬¢è=Ké3¾¢Ýyöÿ\0Ÿ¶ë÷ß9çfv&h	]Z¤á’&»»S/üÔ)Î˜§ß\0îHp!ÃÔ`=’ÃÅ”2é»LÓòz& P„›1#ÎæíN³Ûúj6LŽÂ1*Y¸ê\ZìôTDJFö\\µ¿£iý®%|eë£ïN›¨V€ñ,t3Ý3O¾œS\"KKZÇçÃËV6t\Z-Ý¼ÔY¡–æG\nFHb¹È6°þÁg=±Õâ}“L×\"rÄgEö\"àÇ>YãñN®n²Œ†¥þ0ëñ¶ü1rGâo¶vªà]ìä·*/ªê#F#Jÿ\0ØŽ\'9Šã¶VUÄ³§6$|öWï›ç>Y¿ø{féœÓ>9³sF7ï/Ú”o-¥yVIü˜¥Û#?ÜkÉ·pÕC ×ŠÝ@ÆïêÇ©92ÞFÕYôèè•£Â=GÌàµ—þ*ÐÚÆµ\Z×Ç.L¡6	>›Hƒ:Ð/h%}mtZXš}’çÀŠ¢u´XÙvñÍ¶luÂóNT4²«T94ðæEŽÏ)éCüw¹±Üy>Î“œ±›L™Öç®ñÈÖ\r^\\«‚ø¡¾Qµ&énÝ^êTöžŸ“í‘ò@·ÈðÐŠÑ³e¦ÔºVÂéôå:ÉôíX…ÒŽˆr¸uPNU1±‚†ÿ\0qÆ{Ú¬rcS+èì,×Oè:Ã\r»³^Mp!•W¦;•„ŒòHË†c^;wKa\\(m¢q`—(Ì­·ˆáÀÿ\0­;¨–­[¨c«L^MTÝBÔ\\‡0•§¤±õ(üå…c\nÝU¥ÙiQX3«buPŽÞT„	Uqÿ\0ÜŽ8.Ú†#bKßg²Bµ4xéS]Ê<Ò«Hòªçnø%ÙÁvÉ!»ÿ\0öÁ?Ú®°1W‚16`y’@ò©ÝR\\Ÿ¶\'T|¾$fH;©¢¦K‚À°„MØÂpU”©‘éçìR¾îDˆïm„”Q^Í\\ÞºÊÌã‚MÞ¿ã¾oö©€ÐF¿Œ‚:{gÓÍ<ExÂŒ;Eþ*³f[ipêâ,R±ªì‚M²»å‘]º7ý:¶\"=tí{ìÈý23RiöÒ‚gTy2ÜHÿ\0÷œ“[â¹ÿÄ\0-\0\0\0\0\0!1 \"AQ2#0a$Rq3BÿÚ\0?õj‡¢ÃüFé‚|DFú§3ñ^\r\'ÙƒH¿pRƒâv“ê\ZÆÒƒóJãÄXÝ‘Žª BÞ#iÜÍ2ù>«Îð:î°%´íæ,3æc‰V7`Àøí]ÄóÒ¸ÝTEM L|¨Ç«Uú‰_¹±?ÓM`×Ìì¦1\r\'Ê¶y—¤â|Áâm9ƒÇø@Ìí™©I‰°@13‰ˆ¢\"z„§“ãª®x‚‘\nÍJî´PxižeußºÖ\'ƒ™Ü>\";Jœ#¶ã1ž#P¹äAR}NÊ}@ª&?Å@Ì+õ5•˜o¨s9„ƒƒLös=µ¦Ùæ`ç†œ«MÃšHVÁ‹©V2¶ÃMãêƒ.gaÛ³•V]±6“5 )\n¾OJSæj›&X›­LezÐ=½/tÄÄÄ}8c‘4Ú]¾æèD|Ê¹Æ]±I+œÁ·vcê76Õ~óÉÀ•†U÷Mí˜b\Z0™•íÙÌ€|Ãr¬s½³Ò¦]²ÜXÜÀ¦f z±+1Žz«•ñÇæg+˜e(ÉRJ©%Æ|B˜lL`bfY¼J†½8ÌÉñš‹ÜÞT	kØ§kó4‹2æ àMF±WÌ#ˆÞÓƒ,·ªzRpÒÕÚÝVö®–ÅÜ%Öoõ¨À‡ƒŽ‹ÉÄzäB¤yŽp6Ã)»ˆ\\y2‹ÃœKv„&UÝÆ`Áâ2Å¨}Ëo®’eZ¿É³\rÀ‡¿ÜmŽ~¦¯LÛ·/ƒ=ïk|M?üqµeV+Îçú†¹víÜÅr±ŸwA+¯æ_úõàÁÇ±[_ÌÜÍúÊé³ÉÇ^ *Þã‚Ñ¨WŒ\\<rÑ,;ò#6J¯Üàx+,bfJø—ÑÝ~á‰¦9\n0œˆO´Ù’zTpÝÄÆxij3iÆz)äQ÷ŽÕ–S±sÑiÝóNÃ‘;m·tª­ü™m|{aV_=Dß,}ÜJ³\0 ÈósîvÑÊí™V—\"æð%Uúc3\r©œf\\ ô­0& l™ugvè¼°—ÔIÈèå‚åfëÿ\0íÓ»¹£bÁƒÚ0f )n!?P1ùšvURL¶Ýü^æ0(Q‰ÀâDµóÇ¡›hŠÄùšÚo…¶×Ì¥FªÝŠe´ŠÕ\\0\rÃ+«yã¦Ðeweò=ì[\\á`Œ(9ˆ£tß¦±•G1m-nÐ±pàˆë´ã­¯´LàÄ»î=À/90ô67{lâ\nr Ó¹úø˜ÝÈžï©–¶Ÿ3²¦~8û‡L>ãiwf5¯0D¸nëÇ\'ˆ+z¹IæKj°Æ&O(¬¸ËNÉÏ6•$ˆ‹ŽLÎHÌoiÝå3+‰]J¯¿æl$DR\0è­;J¢v×êjâ7=}£Ì6¡ö‰kX­“4Ä÷rÝ*³Ls-Ôp ±‡ÌgÞ‘\\¬®ÜñNàÇKP‘…•UÛ>è[3M¥·Tp‚k)ü-SVqÃpƒØ6ˆ&;)n\"V¸Ìí«·2úÂ?¶V¸LKx”û›Õ	âT3Ì%þC÷ÐýÃÌÙ#òc\01\nƒævÇ‘6¿È‰_90yŠõ À3¼Ÿs¸¬a\'iè”î]ÑGQ È™sÄ];·˜4ƒäÅUA…—RŸ™V›OJ‹5\rŸõùŠh¯m™ikX»LÒ[…ÛÕt²ÒãÜ É•\\ŽƒiˆÜn2ívŸvÑÉŸŸX¬²ùaq¸ÍÃy{fgâ&s7Á‰¸MÓwP=¹‡Ö<ÍÞØY³À”êÝ¦3öÆg{3º Ô(Ÿ\'|ý‡Ä{_Ä.Z\Zßêv}çÄïþEž8ÇÔ•)ºr¼KuvØ±âŽD?¶evï§?R‹\0P’š£q0T7â\ZÀ\\ˆîŠsÑƒÌü”ûôUŒb^>GKX*Êÿ\0^zˆÀgåm‰½‹˜•Þyš[\Zõ;þ#{LÅ)€í9«óæjÇ ¬Ó-æf\Z+c¸‰©ÒBlñ*þ7·Îée,‘«\rŽc†iØ‹ýÍ­FÉK°D°©ÌRKP£f!ã¦ªÝÿ\0Ö³Jˆ ªî}k^O˜o$À¥Î[Ç¡¸æ !gñ)Zs„ó-%#™F¦ÃnÖš{6jL¼©ÏCÁ› ?1,]¾è^¥÷OÌH59äš¤>gucØ›yŽB‚f!Ðã»“-?òJü°€\Zë©oJ®K×ˆ	©w^kpv(«~ún¾ï‰¸|	c’°å¹è%Mðzêì.Â¥Ž§°SOn˜È2Êw^-(–iöd<LÊ×q›@‡Ž#xŠ£Ì­ƒ	¨¤:ñX}OÅºÅ•P\\?™¬þ=iMèzé-š¿ ?Ûÿ\0²²7s1k¶V%²ÆW\\@Ž•ÐÏÌ²®ßE<Ë´(ãÙæY[TÛ[¢6GqZ–3KF?±üÃúÄÀ€yƒ•Œ=¼M©ÜßnSÉf“™H÷ÃÌ;˜ôñï†•º™½~æá;õ&\'©{õ©¶´´w*”È­ÑÍ»†ÃÄ~b¸Øì7LM§âj—ÇM={ÎaŸÉ.@iÌz5{ØgÄ1y^b`ó?U0ÿ\0óÌÑî=Çˆ.yž×Ã¬µöBsÏªÆÝâ\"³že«†\"g­<¶ÌÓ¶SR1º³MŸst{6Ë/¯Ä6Wò%WV}«Ñ”0Ášš“´p óoÌs[	Œx06ƒs™c1MÃ·´Í5-I`Ýy•Økñ‹ŸQÌÛŸ3ÄÔRía OÇ·þ³±oýgeÇ‘\0Û4Å&*‘q2¼íÁô·ƒ7K,g<M™ó\0÷b2äJ¯tÎðuÊËõ©^€p&:ÿ\0®¸ÿ\0LÃ_¯Ö§È6ø˜õÛëŒÂ@óÈÈ™(ÜG?4ü¬·\0tY­Ê[™Vš¼­˜DÁªæ `ÂiØ=*aó+\\Â\"*™jm3lO÷3	‡£îÇ¶V¬¿¹ô\'&ÝÄeÁÇ«ø›OÔ°ŒNbày–EýD³Æcä‰Ÿ¹¥q¶ZÁº*´þEi\\\n3S§6¾á(…Û/^øÁšéMƒ¥^#%m.ñ3+]äÌô±\n\0~ýuœ7F9oWué÷V9›õ¿q8éÜâ;+cZ8ƒõ›r%µ³a”œtEã0ÂyŽ|z3Ò¨ÿ\0¬CƒÜ±S>fBOëû‚ =ÒÛ\r‡Öžc\"ve‹óÑtÛ´âGÇVýe&j@ít+ý#t³Ç Á*úÁÄÏ˜Ó#¦gEó,ýzy^•œÌIç¯ÿÄ\0/\0\0\0\0\0\0!1A\" 2Q#0aq$3BR‘ÿÚ\0?è>rV†b2Åàô6(â=Õû3÷U‰þ¢£ÔoÔ¡\\æE‡Üï?æ\rMƒÜ]{/‘õoºf/F8˜ç=Z9hšªØà¯oêÑŒÜ#B§ØÛ¡ÔØNf›R-øŸ0ž 333W“VVcç¦£¤³}x3èñz–Ç2Û7±‡™m¦ÞOCÇOÓÇòfZÁqŸ¼o£1Üîâw0Y1lÝ4¤Fañ˜!81Ü\"?Ñ<Mâh,ùbÄÜfè9™Œa9âZ¥m\"lâãž¥±\r¦Ý4N‰2ëluù¼tw;¸‹Üõ3hŒ\0Ž¹Š6‰œs+ÕY·ƒ\Zû‡“?qoþ¡±Ï“2g¿èÝžšgÚàÁegÜ3ã_Fz“,ÖWQÄf79iâqŒôk–•ÌaÎ&ŸLl\\ƒJÉÈŽ21;fž%uáùâ);³öˆÍ¸M/9fð:Zþ¦‘wca8•¾áõ¹ÀˆÍž¶g0J¼Á37MÄx•k]83W¯Þ6×ÐBOˆçlVÌ`x™8Ä]>æ3IÂ3“-Ú[ã6ˆ50[––nÝÄ\"g<AY1NÕÇGFÝ*%>ØÆI”}&f9Ì™¶…&ß– –1-\"=¿ ~&ðÇ ›D°ó)lœLB Ê*U¨”íò³_qL*Å`Ã33QŸÄ<÷%uûaÒÑ••¶áÓÜd\r\n8•.ß¤ôo1Wp‚\"Ø=ÀÀÊ†ãºŸêŠ˜µ±ñ.¥«12X	p§8÷7‹fcZØÀ•Pöž#é{)•óXL2	¥Ô©o\"3ö¾cÜ¿ùÎLd5ÌÍò’»x…@»:Ùd£“ôž™úL©±ˆ)®¡›eúŠsŠÄÚ­0ËÀS*ñTõðbØ–ÎHÚ±é0Þ`La<ÊX}­âV\0˜QvÅÙP9Y¼N>%×6ªø-^‚x9·Þ2 `L<BF\'iÚ/ð®ã+»¸qŽnßQu\0ñ7â;ã±÷@êÞS14ÊÞeÎ6–só+aâWSZF#é¿í/ö›O‡m°/Ì¾ÿ\0ú/AE¤gJú;s7F%NÄ<	KŒsÒ°¬Øyüù™^Rk9ùäEËa€ãÌ´3¶=D¬ èV2¨æÉÌ÷T›yú(¤Þá]§­0«5dvüNß¸ˆ^Àª&GVçYU¥˜¡%Í±ƒlB˜Ç30;%ºlóN2|Í;†³²±Œ[l11î:œfV¥¨NâÐ‚†#njMÆc\"=_ˆ+9€z„sÑhSOpù|b6 ˆuêyæùœC‚ r\'y„ýÁüNÿ\0ö”ë{/¸OõÝ}¼M»Î%º2‡‰¦tÒªäÅÖW¨»„²…ÒG¸•Tß\'šÇD°„‚áŽg™¼:ªûÆÏgˆx8•|ÆÓ\Z’¦m9–ZYvÍÁcˆY¸ŽDï±æ”:€O‰Ø¹¼JV¢¼MFÞÁ¶½¾zû‰X&l.Ö…ALí™Ù2šÍo™¦e¬’Ãÿ\0³QªˆeŽ‰+ÿ\0w¥\\ù–ê	Cê7Ï™Œð\"©™e‡Äî°JlÞ¼Ç9rf“j~#t¥û™Ì·‰îƒñÛÑ\r‰ÀŠxæff+âw	àÀÕ=¼m1‘ØäÎËÍŒ óÑ¬\0ÃÐx3Ì|˜ú„_ê¡ì°åŒ¦Ó_§qŸŠåZµ²þ%[QB‰úžœwwrª6Ó¡Y2´6,ÔPéfb:úYNŽünð ÐØÖoTÛD×TÄáfqÏGñ\nb<A\ný9ç}g‘1òÄ¸äËh9Èˆ»Î\'fvXOÛXÜ‰ØiÙÇ˜;`ù•Ô¾bÒª3Õúh/U½{~çíÿ\0mF3’`6póPÕøa˜šjÑ‹(˜ôbçoø…qn%©ò-.´Tv\rÄ×˜¶–l4+ñŒ1ÑpÃöVþ!ënD¤úéJîiiË‹‰sÀŸ¶(»Þ+å±èñ5­Mñƒ‘3(³aÇ©}{~B7Ès-£ñ4%pUæ½Ÿ`Tñ0D]eè»šMiÓÙ¼ó.ýOº1¶WrØ8‰{§–äÁsÁ–\0´ßÜÓî2äRA2Å1JžeO¹qsÓK_oùX‰—üÃÌÏ©ÁlJ´¶ÝoÀqEZŒ`í œõNx–€¾e­f2Ò¼3a¥´ ¯+.]Ô+	N|æc+ab|¡^aŒ(sÄZïq´Aú}ÇÔm!Cµ£èÜNÑ‰SnŠ2@„âf&«%8•öì²ñö˜[ªjÔ\'$f[KéÞ\'ÌÓ*7\'ÌZw¯rÓÄîéÿ\0ó`Á¸›³)¬oóBŽ\'˜Íƒ5UŒï^ºD½ÆŠã¾Z[nóŽŠì8‰~ÚJÃmŒr]I\'ù\"ó\0Ä±¶ÍäœÅ2¦ùK®>ËAÌÓj{OÏˆÍY³pñ?ò#k4õÿ\0ygêVøxš]cZÛXtá”3Hs•Ž¿Åþ%©Ç\ZÓj€ñ«µdl‰¸íéeé_WwtqÑ›‰§ý^Ä8³‘)½5	Ü¬ñ\0]Xu=+Mìj.ð‰àAæ àÍ^cTÂ+=R»Õ¸3QöAÄPˆ2aée99Yb1õ64Ø`¥Ï©  ×òn¡wq*þ;eà‡eè‹VÓ¼s\nP¤ÊÐ”ë¦n1ÒæÚ°OÑlÁjÌ¼FóÍŠq<ÃÇÑåÀšÁöŽ„	ÚÉ¹Wa•!yŒqô‰RíÇt¬|DBÏR#£3R\0}Â]ÿ\0K>~9ÿ\0¯ælˆ™•Ñg‘oê]EÃ“Ò–e?¢¾ßÜ.OKrO;‹Èžú \\ü¡l‰¨¸Z&GAˆà7ˆ\0Q33ô\r³x_™UŠdÎí™ÞOÌîƒâ™¨ÛàBÀÒ¢[Œä}4œgfSRÖ>PÝŽoøäDvsƒ.ÓÖç#ƒ;&¦ùM”wúY€äL‰™™ÌÏLÌÌõÌÌÌÌÌ/;“9™éž™™›È›É™ÏÔŸ‰¿ûÃÏEÌ@ÇÄa0±pÒ\0‚jÿ\0ä2žON&“\r^%ƒ\r‰¥ªÉšµÅ“CÊ‘5k´ˆ<G0ÄˆŒ\nÍÂ7>!ÄÄ­S?)i­‡Åq10&ac˜­Ÿ¨q3÷é‚|M?Ý,û¥_v&Ÿ këai•dóÐ¸@ã‘5ü†iïí.Ó.~ófRÝ–Èšämæñc®e~q1â&\'ˆ‡q?[ý³0.ª´Wl7‰¿Kø–òß´Ÿr¯†s4ÿ\0taü¶ÖšMH†3¿Y÷5ÁI°Ç<À¹ŠYy¿Ý1×Ìñ,‹æ0žgÄ\n\\Í¶~#X~Ø‹´}n>&(ÉÄañÀ•Ÿ]ö@w è\'¸&e|žf§…šcü‚þ:7Ý¥^~\ZYž†bT!2À	ýJNþàÊ~è|ÃÃt`	æ\0AOÿÄ\0G\0\0\0!1\"2AQaq #BR3‘¡±CbrÁ$04ÑScs‚á’ñ5¢ð@Tƒ“²ÿÚ\0\0?öí8xR7±Û¯²\n‹Uaìiek«ªÉ\\l°@Ð¯Ã*ÌBÔ\\ef¢äUÊ³0ÑeÍPªÖæè¹ä®(VWØ vxE¦íUè«Ño£·pªÝv¥vnßùª#˜*‹æ^}€g„\n!PûWÙecÕxVÛo`òz>û\ZµÚ6\r¼ªöZ«*QpÄïÉt~ªô‰ë‰Õ=“xU£._òMtÌ‡WŒ\"Ch‹~R‚£´UY\nþ_Ù˜r­àCf¶UY\\U\nª!¨5¬Ì4ÍÑJÒÔÁåàƒ¼!íÝejc{7g‚‡Ù³<26êJË„dùßÕ~3G£¾k&o¥\nÍ©#y£v£c$ìWe@Uý‘ìØ,®9øè—áµr£Vª+´#Â6s-vT{`R·Êo¦ÐþŽ×aê­ÿ\0µZÅd~¿º4Ð£Ô,§•\ni²û*€6WYA¶Á&]ä.´Œ=B’-ÎxÏTÇ9á£Ê÷RÓ²ª¡U	§gø‰ØÏYZ$xî\Z‹!œ	>GX¡åV¨JôyW	¸Tp[ÌDíŒ*f’ò¯ðØ†Éãª\\}Ñ‡‚.oêÙª­T–›4ñãª£q±¸öªsÜrÇÑ¶Š£uD¡¨;5²ðUÐ¨¡O€òûÖN¦ˆêÖ\\è]N¨>Ã‘ALS}6º—sx—„h›MUZnB²”B¶«vïþª‡g¯}\nuN‰Î\r%\0ÑR¸ÚZƒE‰î·p39¦‰ÓNl-Ë–ºªöÙB²ôè§ÄÈxcmT˜™ªéké°hî„\'E=ñxzTüÃº«®Sœ¥í]ŒtÎ\r‰ÊüF~m@ÆüÍêÂaèìSÛ˜“ð]+ËÝÝÇ`lÃ+Ï$µ¥y¦¥äwEqù,huŽô¨Y ÷dÝH ¶^Ó³\ZPÑS-ˆÔ\'çnR,+³OcEZ.Uõ^®­§•cÄ«ÝGN§ØªõQ`ÓcÇ°ävMè›é²¨„øÎ­;+úªèV”pê²ËoæÙ˜£+Pù‚ó³×c™Ü)ZG½b‡ÑÂ_ÄÒãTaBŸ?ÒØvýÊ\\Ü6p1Ð»Z*Õ\\,Ädou-ôÕóq²ÏøA(€>«„åZ”ésÑŒÇè¦ÅHjé]›ÐtöÄä[}>òêyNÄÊ3_ŠNå”$­âø_Ý\Z,Öqbw 2\'g}u¥¥UzTiuÇÂ¬ìÞÃlæ¡Wº9:ªÖ®MáL5½jÎW4ìÑ+uU)ÇØvÊ)=k}ôÔåoE–9€¦¯‚ƒÐÒãÍÑ6VèñìyWŽñª¶íTÕgn‹;~»h‰¢2DryY) (G!¥Š\"KÁÕV<§¸+üL Ä~N‰³áž$Ý¶o¦xŽ>å{¨ß-4:&a·ŽÌj€‘µi²`ÕÇº,{2É²g{¼¾	TDž‹j°’ãáMlwr•‹ƒGIÚÑ_TÐþE,¬¥cuÂk\\Î.‰»ÃÁÕ2VÀÂ°û†Ù®vï^êê÷F(Ï÷Ni\Z°2ëºÈ:k¶­u2q´TÑP¶þöZ-©•WELÅ\\®jžéøyWFm^ÞÎŠÛ/¶ÃØ;¢Äîx$shõT5sUœõ@­4PÊx¥Š ýŠª£eîVªÇÄÞ­BêŽåE¿	Ñ[MUÕPÈl³r·í\Z¬L>ö™#¾Ê\r$“…ÒFuœ]´­Sêi…cŽî1û Þ©ÃªkºU0›œµ,­îV×kµ^TÏœ%’I6ŒØ;àd–ýÖm	Ñ>73!Ð¸uYA2Êˆ§AŠÏIá4¨\n&áÍ>õîi·a“áä¤Šâ\ZxÚ	§tø›]Ã†hÉì‰Û•Š9›VöpM.i†p8‹EALÇFCáv¾6v]Ö´õVÕ_c\0#ˆÿ\0è4Z\'½ÖnfÕT:¡p¸9v	Éž_%¾©ì.¡ŠÏ¢«M×[ÅmÌ•ê¢ß¡Vÿ\0Ú²»ªÝ¿èU)uSÂÄ3]9ñF_— YTõDÒ€ª0šé§Eœ3 Ù…|ƒÞœ\'ö²m_Në…™ˆêSèÜ¡Q “á\0IÏ±ÜW6ªÌevP²ÊêæèQ›	Z‹˜Õ´D¡QŒ‘;í)cÞ6N\'HA ×csòø@‹¡ˆ…¼¼þ›,*€Ty±L€æy†¡S\'º‚7=Ïë^ÛFê¸£$øS4üM¶`°Â6çp}iãª“ìÜ=[!î®PYEDÑ3ÅB°!P-VÇæ¥SOùV»»\"úÛ²/§¯³<.øèxG?Œo(Vg\'1·)ìp«éR°¬à¯çuˆa·vj›\\Oq°>:³>—ð³GÄáqÙ¤ÝÓ&ÂDÝýCM¨æ+suCª\r:ôAòŠÑ«±T\"«6îå;w`Ô˜ÃpÓu.hÅ\"†\r7üÊdc@¤ÁîNü;@·?w¢vò,®\"Å2P3>BZlžÛ\nk:¢ñ_»Bi›ærœ5D_„ÔvÙ½e£“§b€¤è¿ÓE,8Ž<­<?+»§:.×B¤õÛ™ÅnY»ÊàlQc›”ƒB\n”ÄæÕa%`¥y‚ :…p\\Öê]#VF?w}6‡¢Ìö÷ÅLð\ZšvOÆÍQÁP²“Ä÷°vMhÔ¯xFf]§Øtê™´n%£ˆwó³UC#Wã3óTdÌ\'×Ùtvn^ª€ãa‘Ú­ü“ðÍ:¾=œÚQág–`æ·²kƒ«NÈvMËÎû™ \0@Qâ,ƒ)õT(sÂxã9…U¦Z^öFIG|-è6‡5Ô+ŒY¨l(äp·UªfïŠ76®õªkâ!‰wP8w÷®ú&¹S€-Ô¡™­¨ø¨«…<*[Ö	Ï<YRäbÞn¦þÉØ(Ùª<uxT^ýzÈcÍ–µ{ÉL‘Žãa¨+ý6ò+8a+ŽËÝÖž¼g•&™º›,Fƒ«{ÜúwO’0©Ñb-š?¿„ÛÑV™Ge­hl´‹WžÁ>Qh[Á{7kµðÎ IÂ[åen…´¯û\"; ¥sé]Ñs*™ ä¥VPú6”OŠAI\ZhG°Éb~Gµ^_É^Wþj¦GRµ%fmBÃÈMK˜Òã R5ÿ\0ƒ[&âf›uÂÑÌSb‰¹XÝ=œA•Ô¥î\ZÕC¢\0èzª´Ð·Z,ô«˜3ìk)rªáîÂ´d³£‚áê‚i¡±Ç/bŸµiË²3N\'lxì®¿äº«ÔjÌs\ZZªæÉ§c‰°s(ŽgS*;—ðµ¹jÒŽg¸Bî(É¹êÃ¸\rVöSšsÔ)c®ê^v»ù‚­@¦ÉÅ­T“î‰Ã´|7·±–Š”\'TÀ:§JÆñEÅôêƒãæ.çu\'_+-~ˆ©EÎvgWÓedöf³Åè·™NïæGVª\Z~Šã02WÕ4ŒYŒ\ZÝ\0X¸:Ôz d‘zÎ‡ªh¦OåìÚˆÊþp2’:ÓeöY\\-h‡UM¸n]²âŠ´ú¨š:4{4O‡yXàá 6e•ZhS#«´âLŒëñz-ß3rèP¼R]‡û##´cj«²6 Å48UÂÈ¶™T²¹üF¯Bt²Wx]f§9ÿ\0Ä«ª™ræê£f¡¢œ(Ð©™Ðßc˜ææåå^e\Zu\\J´¢ÝC#št9{*ëì;»MÖyFfÝ}æsÅôYT‡”]ÎEÑ?7„é¡eã^Y.7~JéÕ>ˆoÜ5¨9g	;+Õ]7 q>y”›¬]ö¿#C‡cÕR?Àfgûl¢!¤ŒÃ)Põ­š z”_»»ìžôT 5þvå&ÅU¢èï\nÛn)é³UýÓ¢:ÆïÐíc®¾ÁNËˆ#M[Ó¾ÜLâïc_^‰Î}\\ç\\¸õ;j˜ýs\rT³8\\Ù]I…™™ƒ†½ŠŸ	(=[˜õ\n9^Õ5Ÿî£ÈÃ¼ÓMŠ’0[îÃxœï9°b4ƒ™±Ü<f2F…:xîM‡R;#V£FŒfCÒª½NÇ¿ðØ3”®­@ê¨K3ÇªßaZë\ZÝÓ‰	‹9âªŠ7¼>/‹Â8jWá·döÍ;#£*VY%ÎÓ­Jq•¹¸¬¨FÔÍÈÞ|O=·ë³)Ñg\"1´¶¥7P®¯ÕP5®oê›»4Ì.\n\'môR†1Ûè†`Ó×Øfê¬ld9Ïïïeúé¿\Zø¬éë±¸lcLurÕp•ª»B¸W¶ÛX««“Ui¢,.¡|tv¼|¼(ÑG;ë,”˜ÎÓïavÓ«N…uAÍ6*©íq»‘¢4+;Ê MsyãŒ&6\'q·™M{£scÃGÌóñz\'bhchÉ¥ŽVêÖ¢žÖ¿7~ˆ5â„lÆÎY]®ìJ|Qä®æyUxDÃÌ/“ºìåZ*hµù\\4§„Cn¾óŠ5¥Ã~«\'1u„mN3p—;&º—=PÉFoª§ê›)Ê:«\ZÖÅ9õÌèî,®.{º•m™ü2d×Á\'…~›E•$¨BÌ«zª›˜.!”÷DþHû\"×+;8«u™ÑÒF¤÷BX”›IÚ½ÕöbâµjM”=lŸ‰û5¢9õv£½;7Ù_hÅØwQµ³Ø<*¶¸¸àx×ÐùE[õZ®+ªûU\nµŠ…ÙéG‚…vLîï;%amXî+›/¸NsMƒóaíôY§CÝp:£ª¦áî#²6z“uEÄ9BßJ*Ñ£;§2žëªÑ;+ü&Þ¹.JùRIˆ¨ÃF+Ãñ%ÄŒ‘”CÖ‹ïy¸Å”hPdQÝ]HM†!š^Ý½QÆNâ%7§e+¢Ö:¼tì£,’edÚ\ZúG7èz£º»ôG;‰;,ãE¼m7æn0ÜFšöN’sYR««]ª¥,ÔÂöp¼YÛesàøÈuÙ{¶fòTÐ¼QíÍTZFÊávZÔ 3f§c²­+À¡_x†!$‚íkîÍˆæ\0¥ì†g›ÜMÚG¢áÍÊ{­}€Þ¨^†«*sMÔ°äÈê§fÒŠ¡o`yúT!Úî¿ÆnŸTÇ4Þ ¦;¢ûã$lX—\n8|á^ŽXÓ‡nXw†Þzþ»)°QÊ£„«;óÙuLÊÏC¨XwIÏL¤÷¢s« ª5î©Ýfi¢lÐ¿&\"&?û(¡ÃÆ{˜ºÿ\0Dw“í	F­Âv?îCqp­ëj«‘TZŠš\'•[Š–õP	W¾ç¾ªÇ{nª¢Ç²£´Mv´!q<éj›=–†š”Ùd <ÕÎ¹+wcSÝu{ûõ_wþzƒÙº­ä†ìcÃ?¦€dÀTmsÃd­¡Å&¨ÕxØXƒ)¢&•\Z ñp¨,VgX\0ƒ\'Ï$m6Twí°ˆûPùOžgGçšºåð¦ÄÂâpÒJh\r½“xÚ-v0«j‹]gtpÕ:)Åî¦s}\nÒ9ä|.+1›!e›äªmi:*•V¬¯4S8Ã9ðŽHÞá­›TAÙÅù¯tw°aq·Ó²Ý7ŒÃ‘Í¨‹,ó=Âº8èœŠ”¯$Ü•uÂ›ÀhN¨¸h<l4ZU\\Se•‰ZÕKø_[ùXƒM#wìvQ “Ø(ð-m&’ä…½ÊË].ÏÝŒ¶~:NÞXyñ[Çûl\'1xò²°š6ÖUiÌÕŸR®¬°ðÅ%”Ð—7‚‘²½€T­E4û¢@!ß¯þVêK8**µÔ¢ÝÙõi<NLvµÊ\\çr•vòµ$”¬Ò·+¼\'á¿×h.Z©^ÁPÕQ¢¡¸V²jÊF¨4Ò:ê€o@¤ŽC‘¼ÈMJ(Ÿ+7±4Ôµ7‚üW:Žf‹\r²îãåÌã ðšÈ=˜C>\"WUªu=î´_xˆVV‹Žãff§±ÌÈó­ì{,U©Æl‹Gu=–áœTê›&Gå$tRÍ$y„BùScy\riµQ†”{uGúUÖmFŠŽsXN€©\'tybð8µYMÇìªèš˜)qWþK‹o‡W(²93ëKôVå,·dXÖ<†üTRÏZÖ¸êã•gk œüŒuÿ\0Tèg‹+ÆªíV4V‘\\‚·y¬à®Œ‘ËË¢Y ìžøpÍ.h4oW,IÅ?,²&>qð·¤-òQ™À3ænàƒ¦?÷MÅNk]ò!X^¨tîŒl¹EäÎ¾)²‹èQx^îS—å7B9†ê½~e‰´†*F|¸Ý\n‚/”ú¡u€-4N/E.Sš6Ú„Ù‹Ñbgq®Q”&w¦Ë•ª¶‡ªoeÝò’²ìÍ¥l6·H52õTmÑÎ*]ø‡}ßè@îSšuè¼Ò»YÕ4fyÓÐ}Ua…¬{¯aª¡ÔlU@xdÝŽÄa›åÌþê&SÁNèˆŒkÄñýÔ0CÂ&â–NÁ3Y™ñŸzñ\r\n~IÄ.-Îz³§Ô\'5ùCr–eËÓ²tnåÕ„vQ>âhýÜ„~…1¹9t¢n ¼Ö™XÄÐóÀÝ\Z4Û”¡+t)¦´=TÆÅ¦¡°ÛèžÇQÑÈ+Tö5äµË6zÝ9§ˆ;„”EÕ\Z¹­þ¤g…Í¡ÕP«ÉO¢ü@¿6lÕ¦Ú¨Î\rÔfÕüE4–Ž²2ÿ\0›Êâ+¿&®ª\rŠbÆ·@SZ]t@Ô\'shŒ\\Çº(€ÂêvC5oÓ¶Ì<R\\9×Öéƒƒx>¶²Äˆc)ÿ\0Ú£‡\r¥œÍ@è·³åÄý¬þâ­‹Ê2—k{§\0âê¶Šñ\'Nf”UÊ%kªÃg)RA\';xÙç¸N~“g06D÷Øù@Óc-[è¾ë‰ˆüã¡FL3Æ&\Z¬¥Qe¥WÞ¤‡ü3b\rÇª„JÒ/¡VA•”c:…Ý{ºk˜Thîë7.\";HÏ(’ÁS°­xAZÔ-Q[Ö z#“ˆ¾™VI¿ÍÈ›Avðd\Zú\"×Û]¨oTºTuNo$í³Úƒ‰á)ï ”¢º¦ÆÃ¼Èþ9ÆúË†&æú·éû*}Ìœ§B·a™~ÊGÈäb{ø˜|,¹•: ÖQµê˜e’¬#5\ZW½BË5$.AŒÿ\0 a#á26¯w…á\Z¤hBú¸\nf+)`ÊØ#{£œVªF(ÛÂÿ\0‹Êto`ïÃMBÒ™ñ®ƒÿ\0„HÄš(ŸR\\)˜¶ícšâ;ÙJ÷šo_¼#ÊÝ_»ÔSœòKÏR®j;+1G[\0àT•»	ìVîñjIÑƒÊ|ÏetqàÐjSâÅ}¡½gá=†¥	¡uK\r[å0{¹[ËØõQÃ­Ù~ü ÑZÂ»j\rD$³k¯ª\r¦ñ¾)k^	ÓO³ª¬dŒÏ«XN‹tÜ¯£JlíÄÆ8rõ\\q4ªÊVñ—Â£¬vaD\ZÌíÙoÌá;aS²†áU‡è®ª³ô¢|pQÛöñôÈîá>Iždsµ%=îôWê·ÑÛ7P£˜|CõQ3+\0¶Nëö†»‡9Ä=­Ò£G(ñ˜GîžFpÀîª¸˜~çŠ6ßAÊãÝÃý—ƒÏÊ˜ªè	ovÝ0nÄmdÖjî¥Y9¯XîÇÿ\0(fæ\nµEvW7ºÐ¾½Ë×P›ÎW5ÌÎÝ—+ñÕs®p©œ*µà¦0»3œ@·DÜD\"³ÅðüÍB0¾Sð7R›6.OºÄ‡N5»ŽËYbWÞþÎtXy£ \"w‘MðóÇº•¶-(8¡FÕú…¼v_«Ue…ìËWÖ¨P\0ÖÔÿ\0Q@ü#R…ôìÔpÍe%*ãÙFæÞ æÝÅ_)ÂA•Ã¦Îêª6<UÖªgEÄâ±ƒ\'ýÏò·û\'ÎüC±¦ÿ\0úÍ/ûxNšy’¾åÎÙºÄ74ø©È{®ë”\'M@•½º¨«ËUJ«,ÃU•Î ^ðƒNåo#OÍq˜®d(jR*Õ^¡R•\n­ol€¢2Å†c‰þ$‚ÿ\0Eø%Ydª,¯³3NË¯º¼nÍjÉ‡Bš?ˆxOªãýT1Žpkª…oTÈ«Vó®MÐ|M_ì„Ï\0Ï-Éì³ÑÞ,¹‰Y‹vP*ê·sá\nwÝùÆ±;¢÷ÜÍøN©ÈÓþè8j>%–pá]UXs+Š­=U‰õÙJâÕ5Ž”–´P-ûÌÄñUº¡”Ò¿)ÑZîîJ’w^Ö\nY^xœjJ\r\0Ï3ú|¾VöP%Ÿâ‘úÕgp\0tE®`-)ØŒ(¦[– Çš\nê:)¬@2åm{ ©KÉ^ú†k¸YÉÙV(‰¨=³\n¿-}#Eá	Î ¤ÄãsA ŒC‡Ê*Ø™×êPÝðá\"´M?¿±•Ç3¡;ºŸÑ^È©@µUZ•{ª¢u¯©D°ýí²ÛÃ,£úB£@aD¦ŸgUN¨‡Y]Dé¸˜ÚŸ­fŽ¢Þe­®”7&”	§ù-9Hêšæðß‰¿ÝšÁªôÙEr©±³´†Íãªåú…Z¬¯ndòj¬FxÃÚÓ™µEØg»ÿ\0åÑ,y‡þ,JöZìÕjÌ¤èœãÑRXÞV„áC¼…/Ú8±I¦cF¬òÚ0jÖ*“@ÝŽñ*j¦…†­æUÍvÅ¯þ“¡ýÔGGQKK—£pîÝh¯ªvæ²b$ÕÝáisN”@³æ·¼–S\n5Â.¹ºu¢££½{\"íÞYe¾–QZéWQFZç:94Î(k±î°.y7ð‰5žõ\Z§<\"(jì‘‘ºfwT°ïoÑ~à>«7Ý]—É[·³+•‚e‡Am¦è•lfÙ3²ÐuQº&–¸Ø±e\0Ô©opÚ*w¯ï²ÖV¹M’s»å@7¢¹VUcj©Ï:\0œI¶km¨O’>Vs\nZš2›\\ãêoø‘X¬±Ê&úR‹¢MQtPÊö÷\r¨\\8IOÑSîþVOaÄl¤¼„AÅ<”Q~vS˜Pþj<\\­LÞ‡¢ÞLkNV§e=Îî![¥PÉFÔ§C?ÿ\0)þÈ½î/qêJ‘(B *Žz÷œ‚ûD\0¯Ìþ€&ÁMÅcˆâ\'áõV“wá‚ÈaÙ‡u@¦aÔõª£(*Žm}S\Zé[l½;øRPr~\Z\0w¢Ž8Û˜4qëxþåìœàI²r¶`ŽÍê¾‹[pX­y£#³MuDÇTMíáë‡Y:V‹ƒUQì8EÎl€°¶U6;w5\r:÷DpU:)[»{MOµr€Z©½Ý¼T@Èö\rkªÄ´S4t$B0]P°Íøƒ*Pºt…«xFñÝÊ£iás¯xô)Þ‹†þŠ¢ÎR¶„6Ð´J\\8%e\Zú8:É¯­ö—?TwVw¢ý¢ët…º}PŽ6†´h¹¢¦qù§Æ^$¨¦T÷Ö®$xT°4gÔw\\\'«U^CG’	äñ UšNŒ\Z{=º²çÑj¨Çå%QÆ¾Txx†g¼Ð!öWÙÞó¤’Ž…Jéw\\MS«\'\n‘ÙÍ®)eSù\"@–ÔòQ½’€ÇËqØ\'´ô)¹5(àg†I$3¸¬lX98€ç‚î ªŠ\'Å™Õ¯QÜw@õYBÂøg÷O4p?ºuè¨HÌ›#ZëMÊÉUB­³y+¸Z*=Q{,]³F\rYˆÀùOT]–XO7T×O‡ÆŠfWá¯Ã¢å+”¢Øy…ÕÕöUÚuBHñ&õG&$ŒÂ‹7ÞªiO¢2;\nØ•¹“%`Ò¡sláuC‚4jÝÍÃ(5õUu–$u`¨TWLqåJØÀkš‚ƒÄ‘{ªe©M->h¨ûÊH2uW•Zê6žJãä¸ÖªÅq­VxßG*â$à¥°\\>Ëƒ4n9^;ƒb¦üLcÈ²²|\'6ZUµè±R}žñ¾iû¼O¦‡âzqkÌŽÕò8ê›¾<=‚£\"=\ZF©Ñï\ZëÕ%êƒEÜ³<ýð­\rÊueÌC¨j:¦:¼f–O‘î¥Ìïÿ\0…‘¿†bv†½»\Z,Qž Ä7Œ{MÇ £ˆh¦\"6‡bßˆ$Ý\Z\\•£Ã\\ØEG•3ÙG½¢¡½Õ§ä‰Íau‡Êj	ª5O®–^6Y:œÝÂ”µ×•ÐøW<]ý›”ânO²ØžzêµZ­V«šëUªÕs+¹XÐ‹‚¡wWV¿’Å3»œÔèƒáÒƒ¢üý©ÑÉj÷Yf4 uVYòÓ¹A®›«¸”P²ì¹•«žµV*‚ë!aké\\¥\ZëuW;-ì²R=ù`1¯ä·hkªi\"nY1c}\0º~\ZsGW;º¨ÁÈÆ›Ðê÷#d		š–ƒÙ\0MBˆxÏV\"esXOÔª4_º¡»Õ	bOe6#\'¹{s~_ü EÜßÕKWîëhG?¥ÑËOs—­j:e’£6ScÕ}•”†?u-èíÛ»ŽªH?‰(ß=–+yVÆør×­¢†LûÓ`?¥Ö ÖI+Æ;™Ìv\\´5µVî”ËÑæ•M·T£ª…öÓ2áºâZ®dÀ]Õ:>«#Û•ÞÎW\Z…ªÕs-W2æ\\ËUrˆ¢Ã÷¢“/3œmõQ>QS—º¤q¶¾ó#mÑ9¸WeºÄå”‹öG8ºÏ]Zœ×–á¨ê°ä†9²êX9vCŽÂJ]õŠÍLÁo7ÇÜ-ãa«;‚ù¦·,m‘ßM\\³˜Û4Ÿ4£7þ€ÇQq‘¤~J)¤‘Æc> &\'Ý²Xù~m‚8˜dqÑ¡Wq”ú®<3¨æW*£w¢ßbyÿ\0‡UJú¨ç•Ôc\\[ù,gÚUÌÜ7 :fèžíû1Ÿi8f9F7Â?yÃîžz•c\n(Kò¹õ:vYXÛ~ë§¡@Svÿ\0=UU“ãøhS]Õ}ã\r»n!¢|ŒÌûAø×“4m\r©éªÝWJð°ò€(Ù\0þ•‡Ä†¼´VÑ{Ý˜£8º-ëæa”èÕWYoâØÔ=ŒÀÑÉ¬æ(Ôÿ\0´«Ý4èP\0ÜvW©õÙp¡\ZàœÞæ¡FÏA¨ûðÐw[§s4êµ\\Ë™s-W¯UÊ€5jÕ4Ëã—sŠ{Ã@‰â“R^€Ø¬òÃG‘Ì|øié&RàGwO8áñq\n‘¨ôN©¦*LÏî³RâãÕn&hxsJ¼xI»xR`1ü&!ÖþW\'ÆoÙ9‡DfŠJÃ©‰ÝqlnÛf4\\Œ¥õ®¤¬¥×Øù£9dkIõP±ð2S£\\z\'.ç!&³8^Cý•Š¡Y™ÂåïÝÃá\0Öhšþ¥nèj Â¶\'OŒšGnØÁ¥õ(±d-\'1×\'ÉNŠHšÖ»â¥A?Ý=ó9Ófîª5XwÑ\'Ýëü×;4Ì«˜Óå=gZ~£e;©#ðoÑÂÂá’J¨\ZàAf ÷D‰}è·B¾ÏiÝûÊx\Zº‡ºŽWÚXüÒ©Ì1².À­B ‹\'9“WŠúû\0¾Œf\\ïyøYÔ¢Èpî[ffÖ(‰ö\Zz´Ô&ÎÛ<\'¹÷qYNÚTâþª•­?ÉfèibS_\'Ÿ3–!àdd‘ï“Ë–+;(_vþI¸Æ8œ(óK…‡Èlò\0ø«Pæ;”÷Sàð°	Íî×,/ƒû™s·OG7GŸŽšz,í9OîŸ„šÒ\\µß+º)#e‘Ž¡TÍLnQßÌ;­n:¬àØ8o)Ð($ÂUÐTU•×Ê{ÓR³V  mÐ§5õ©\Z Kl™m\n2b¤$\r#i Tˆe`Z«¸+®Šà.VÕU¡U‡)þTa©ï¡CSùOd²ÃµÑû°m¿a[/™Xé×¨õU§ÔuM\'ÍUW€©Ü;÷NXØ¡,†®Ž¯…=]‘Íx-oÌ°mùà©øh¸çý‘|ÌãÕBhq\0­VxÇYH¢\n£k!n§öRà01ð9Þ÷Mä ðšöàfs\\*nÌ¨û4W^é™Š1‘qÙe}Z;§|ÝŠw¢\'¿ù´Ñ€j£‹Þ±¹œÎ¡oM…ì£–74áÜÉF¼aõwÏ–¶,Ð•k+½{Škû)0Â¡†MãH\ZWU÷Ö¼ÍWƒ«{<Ñ»/ä°_kDÜÃ.éß¸Pb¥1Køâñù	Ž­@+¾fªU[Íû¯ýFûÆþ ð¢šÄ;„ÜD&±L3\n,²\nÁ%œ\nnA‡…ƒ7	ê–þ©Ñ—Ô&7«^ê;¨O~!áÁ“‹[mDKŠ g«‰p9^»5VÕj£n³—åî˜ÖÈsWˆñÀöŒÊdì<*äÎ~w¼æ(|TüÂp¥\nwu—Ê²Ñß¾Éjh\0äj±ñÍ+í5Š’„1»,¿uá#¸Eò˜ë]¹ã°Y%4T+5³wDeÌ<*8úª7‹ÑG‰ÇÈ åˆ´Ôúö	Ø±¢|»ÏÆ™­£ŸàvjwÚi´³		´NÖWvôG#˜Æôn]6ç‡ðÜÙÅ¢±@ôR–ê„qXžgsœÙ•_Ý¾=äZ\ZvFš{mŸšû¼ŠíÃ™²àò—ÿ\08AŽnZ°T3¡O~12¾®cªã{YaËè‡nV=Ö·e†ào£*íXÜ3´{(±XsÏ‹†cjÐ5î¿ÒºžÚ9Ô>©¸o´[–xø!˜ØxY]VhAèªÁ £ì>¾Ëy»ø¢\'¿d!oãz,+êq½Ýn¨MknÈÉ%coS4`ß\'–HÊUI½w¹\r­‘0²Œb¬Œ-íåX®eÌ½ÛIôYß²÷¢ÖÕN‰üT½{«‚¬®ê))&P\r*›’ yEÄ¸ŠYLü3ÜêÐæØSÝË8½UÍû*|Œ@øM  {JÆEóGUö\Zº°.ù$tGÿ\0ÏªÄFm’B?UAfõwdhFQ×ºc’ ßŠ‹,ñNªÕ§•Mš,Ù[êip‹šðŽ“ñ\'w3¼\"N(Ç†Šï‘ú4\"Ñ\"@-žºùÚÁ¨¢¥2žèfš”WypLq`SGW\0]vT8±ÝE•ÖtF«)¸G\0àøÛÛÎËiìïdnº}zh°N\"ä»÷Uè„nâQ¡UÄÂCÓåe‚W8ú§œÔcE•gnÙØuNh‘ÅŽ³šî&Ÿ¢ß°gˆëMB	ÁQïk1QW%Txæåìpsiª|ïoïEFÜõ=s\ZÒŽ½?41£¼yåoF	ÍÊ-¢ uè·&ƒ3h¥Ã¸(»Oó*HMqâ\0è¢”;;^Ú€€·¢/„%#Q¢‚YFYá÷2ÿ\0bƒ¢ç†j»úHTŒM–¾¡?3³š®#Aò…Pru“¿UGYõè¿\rçÑÁQÙâÿ\0¨Å#Å4è®VZæ¸¬D½Í¯ÿ\0„[û(**×û·kXä¬uXì<¶|8ª}h±/&qM’µÎ<ä 0ÏâêÕÍcÂìkÖY¦Ë« ‘þì›Å§òê‡ÙðÆèp¬å‡«ü•y +¶‹ƒUÄí”&Ê7ü\"êµÙOÐ¦9–¯NÉ„*‹¸\'1â­\"…I@x}v´ŸÃa[ªp…;Zj,WÙ”¸¡ªËÙ}ÚYšÉ5+{Z¶•nãÄîð÷SÙ>L>$Å‰­Ìm^Ä(qð¹ö{>Wu[Ø¸]iÃ:´dÒQÇ²6Z®Ë<|.ëN«)²ÞRÕ¼•×ì‰åiO¥ºÐz•@“½P½U2;´…$Œm#7úªÍ0a­U5OÃÉL¼Á¼«ª€Íõ\nƒÿ\0•Š1·ÝËnN­=.\'áÞPæÛâ[!yëD%|fY:7¢/™íŠ½l†G>F÷\\¡[a‚27]jƒd§÷èU?$}—Tacpú‰\"§ÖŠ):±àþªGEv:ÉÐ©âc²ê·¿æ3_ÑFÇ4´–ñW¿d±\\|mÕdÞo[Ó6¡fÀz«ë³\\®UÔ*D#ˆUîÑ¾b+š8‹tÇ‡‘y3¿ð¢·Â:m¸è¯³]ÇÑÆ‹q\nl«?\\&ô!~›!Ä\rAÊ}Š4T•2ñT¥Äo°ò,‡3ÝªÏ<9ÜB,Ž^‚©ÒÊs=Ú• òÁEnyÉÄüª/´\"|g$žGEŒÂÂà$	¬`,tOÉÄ<&BÙj.oÙ¸ñ4Ð¾S‹qD]=s„ª›5k§eN‚»(œ@ÌÐ¤š&¸ÆÂ­ÝoÆµ½3£ðpžH\\IuUÕ–«s;¸~ˆTÔ*Å(.\Z¶´rÕj¬åg.eª²%uìƒ]ú¬ŽØúÑ;Ê½š}—^ V!ƒ»0ô+ìùkïXÓ¼Ñ}ö„ðd#ë­‡{Ÿê[]\0ÚÆ‰\r	¢y¸Žÿ\0Eª¨YMÕK\ZUFB÷“”ÿ\0´”ÆæÑ +YŸ2âÝåb$d`Ý}œ1ÿ\0˜6\\,íåØ^~©ˆxSö\ZiV5;-|Öhähè™\'BâÕ„o‚æ³TË‚çëý+‡\Z1ë>@ð°ŸÏVþ‹?’ªçk‚Åx§ì±°âE˜}SðJ±ímÈ”Ù^2šÐ.z.8ÜÑÝZE’hY¾:H5Aì÷°•8E+ÿ\0–‹Õ\n¬N*•Š\"§”Ì´1ÌÜ×NÁ`È\rmÃ‡e<’ÑÏ†º¬S#ÃOa¹ùVxš\ZèSiwSªt¿u(–ÞšÑk¶¡®?E]Óè:å@å%¥·„®<ÎwòH#{ÈTm{¬îšYw@&LßˆuÅå³Úbqò¸ *æ{öú|K\ZÎ±Rvý5Eì\'4Š¹¾×l4×8X—Èn\"qé²ß¢c¦s£Ä›‘ÛÂ÷YdúÑ^ÕSuJ÷rši½ö \ZhÕ+Oâ0æ@ƒZ(Ñ²Q¨u½˜@êí!P§·®¡@œž?—mþK[ª0FïðñÌ®åcòº³GL@o¥è·U¼Rª±É¤±æÊûWì×ÜƒOÎËçÛu8Åè±Œÿ\0–Tåi+ä4þ‹tkêÃõOwÂ^n¦uhÙZ×þ›0ÿ\0Ö6\ZÆÜÔ×Ds^J\r$}Q|1·?ÌÔöÈÒ*l{ÑUT§ášêD÷fpî·qÊíÕy*¦™Ö‘Œ¡ªÄÏ„~Q\'T²Ôû.à¦ÅbYÐ±¶ÿ\0¹O3›Þ\'ŽöQ¼ŒÍ-áYÜ*z5>ÇPÀ£ÄÂÀøžÐ\\Æ¦ÄÁ»€\Z¹¿”mÉ”ËŠ¿š÷P¿è,ªöçNy³…z,ýNŠI:”(OVYãÖáb·dáž&§Ž«	#¬ÂìŽ>\r”˜gØ<:\"±ø9>Jÿ\0í4*XÁÌ\Zâ*6@{=¿ºÆ»þSkAsŽ€/¼b¢ÿ\0ðWàÿ\0Ê=õFŸ+NËÝòžT×‹¨Zíh|\"ÏáÉ¢õªÕ:\'|IÍìiì5Ý½‡4ÙÀ­j˜>Bz”xEUEg+žlJ‹ìýÓðx†Œ³jz-jVÿ\0SˆY‡¢‘Îa’\'ÇOP±±T_fâ\nûA£’Hó~«ÐÜ­–’·ê·ƒ÷Ì™‡ÅåMŒp·#SOÍPÿ\0R%¢ä¦\n8ÂÔw¥4·¡ØWª«d-ôMÃ½Õ©XfÇi\"qôº.v€.ÍKéš7Œ¯otXÂ[êQ>ÐM‡á-5FèÂT$ƒð¢qÌE˜›s\"ç\Z¼Ü¨w£†èºYiáº”ÍûVª¥p¶¾]–?þâ³IfôoÄVm\Z-_ìYüù¿Ùb\Z ô›²Ç\Zk¡E’5°ÀöÄýZm¢ÄaÚìâ(×wì¡Ä¶ñJÖ½¥bƒ½Þó6_5OvZ2a¼e;lª<yq·%<õ\\4dv©¥}+Ð¦´t	Í<š„^ÎR\rŠ>³ü×ØÑßd…œ¯½<ªµŽü•ØAòŒƒobJ<´Ph›RJÃ¾¶­òÔÿ\0éÙS¢d[z­Þ.ÍMÕfŠwB|¨ªèçlbÍÕ9Ä]Hßš-˜9º²B{ø³Æ[š‰·Ýâ#ä“û \'›‚¿\0Õ2 ZË\'xÈýTP ÓÕd=\nÂ–õ†Ÿª×dÒÌ>v\rõ7Ná9“ËaõY[ÃïíWÚ’lµŽW,„pµ¹BFwrg×å/¬m-åK¹´Uµ;*\0¥ŽŸç{7ÈÝ5¿uÂï*Œ½I§†[õ+HÁ?÷•ÆüŸÿ\0£þÉ‘†å`øB’G\n9î‘Å:<¦µ*s¡-i?’ÁVô/hü×ÙRºáÍhwÐ¨åš±Þ»\Zùøcùz”2Y¾=U6>¨\Zji4+!ÑbãùeªúFÃÙ¶N~!î‰­éÝRÜÝÊ¯\rJyV!îÕFÝ£Ø›ÃQŽ¹…Ó`;†…ÂÀ®À«º\nð…h¨Yªløväx²è„s4d2nË”-©·…Þ5ŠÀ¨æ‰Îl‘»3Jsùs\Z¨Ÿ9!Ñ³%BærüGþi¬´AµÑqHêªo\\©¿rÜ»!gb¿Ô9©rÿ\0Tåþ­ËýY_ê¿D÷…þ¡©ýúù/õ-ü—ú†þK…dŒ÷Ú¹H#–>2¡-xèšÖRËá_\n4{ÍAj/-ÞÊz»¢».¸•™OEhœ}°n>s…ÿ\0Ó¤ÿ\0ûÿ\0@özQ:¸\\NQ©\0Ý¡ßÆu©¡iì¾ôØ·5`nW\ZPá#d.µÁX\'aê÷Å›5´U‚@é*Ùrþéµâ-©©Z‚=Ubx¯ÈUKNìz¬ãêŠî€:ÑT*I¨Ð¬TGãhpTì„0ŒÏv€&Í‹ã—åèÞrfhpeªÃaÙ‡È%2¤§´IAUŒÏ.tQ—Ç‡Q;/â0:ž«‡QÍ§˜T*tQdäb›)·_òuTÿ\0#]ºìÕjµZ­V«U®Ë¹PH2×f«]º­V«Ue¯±Ý=ðPg9ˆ+.UL—ðšsQŽ±>ð*äiò$¢åsGýu™’-/XgF}Ùu°Ô.‘½´\n–ª¢«V\ZB}ì„æðÕ›&·Pàã\"Y]\\òŸ:,5	Ì©4¥í×/DÉÛÍ³5dš‘â;w_iÄÛÉ¹Ð&Žé££?e‰x7w=©‘c@ž/›ª&.R¥«Z‹è²€³¥µê´;.µ\\ÈÝjº­	ªê=PWÙÛaö-ì}vê¾«UªÕjµE±ž©D’UEŠ5Zª×f½V«Tn¬W2ÕV«™j¬V»\0YH¯ª&\n5þQn.\r359uÛñ~Êµý: qü×7ê¹Ä;	ÃÑf­v	3Œî{*{(„¬9_Ü*•Mí$Õ}¥ˆí{p¡’úÝ2\\45srýuXèçýÕ¸\\ÁßÌ¿§ìÇe¨\nVÆÐÊ_úƒüO÷Ø6}T„Uh¨\nç*¥î\\Ä àM°r¸,Gvâ‡±XIcnMìw§TÇƒvV]Ûx›ªå\ZÂÁ™­$Ë™c¢”Éó¶¾ˆ¹¬ÑY·@\näDÅÂj5—2pÌ…î¬UC–µB¶VrmM“;¹e!z£C˜!Ùp•`ÀLêáT~eF\0Õîè¬÷Ê|\n\'5‘ð+ð×*å\\«EpBæ!á!ÎL3F7•º•Œ·…tY#ÚSòqáÈ§•B*ÕÀì‡ÈY£“2Üâ™‘ý×21“Î².E®UWšÓªÌË¥‰¾žÅ×ÚØ¨ráš{,>Ù¯ln-ÔŠ§Ç½¡gÑcß#ónð»¡éTÏêîçð§‰±æ•¿ŠÂÚ\'5ãŒ\ZÒl€â…Iß:j(û²•ËÆ<t_haIå¤ƒgÙóõ/é³÷sdoí³ÌÕ ìâ(±87ðDuiò?üý×èB–7\ZvžíØÓãc¶¹ß*¶WX5P•Ô*…}=ŠtUWÙ{4\"’\\»äoR™XvåoÄë“åEövìlÏã“+i•½è¹Bå]V„®Û4P¹ ˜îØ/êfÝš+Z½¨öYÙxÿ\0eq³x#À¶eWÈP%Ü…G7GZÑdks·zr©Ùh¡Èy˜+ëìããÝ¸´•ÿ\0®ÏÝIýKíó·õXVŠVþèâü)Ùú\'úÔ\'‘ørq…ušO”Â£ºsœÜ§6‰ž‰ÉÕWVÙ~R2‘á>>’Dæ¢¤=cp?ªºÃ\ZÝ‚†ý•K‚nwQ¦Ë‡0È\\Ò<¬>%¿Âxu–ñ®±\n<‡¿²ÊÛ•=“Ó¶–÷´ª\"Weª¥n£œv÷Qm±ƒ»‚q:ÜhØ™‰Îó¨ð¥ÅÉÇK1Ÿ;º6*sžiM\\ÉÄÄêTÐ„BÆKÿ\0ÕIÑ¶V*•YÄ¿\rÚ.UB§DÑZ»TèËY†Ì{€¦,@4\0 Öê¯œžêV6ì­G¢¶ÝV:güYüÖþ³u\'õ*Å”(¤<±\"žCÎç°S·I!iú¬>\'ˆ¶¹¿ª?‡Õh2¨$*3jSUG’äásîÇ+‡»qW²»®¡ÄW”Ð©2¸R«\0pÏ”ÙZÉØxÝHÝÐª:B¯]š­WNG(\\zîœ´ßaMhÔ®)ÑpšMT-ÿ\0‡SM—Ùtç¼pä(¨IÐ8QÉÑ}Ög†˜ÿ\0í(aêÁ…·W}*Ók\0<í¢\n€,GªÉ«Uvew^¨°¿„MP#Bi</²Êë]=¸q”wQu*y9[Ë™sÍ2¼ìqÊî\\!ÎWŽOÉp;±º·÷X/úÍýÔÃù–?æqXã×(ýÔÍ\Z˜}PÖ8yHÒn£87ú§Äáv«‰ ¬ÑñÇòöEÃš>+­Ãté:z,¬Ì5*¢ß½Îkø›^ê÷(´VâqDXQfqN\0Ð.\'’×vÛUep¨ÀœÑÌ.‡÷NNÚÐ;3\rFÊ,ï	ìè«Óo)\nXZxùvWmMÏ±ªÔû1‘öSËÒª¾UzmÞ6Å¶u;*¹”õZ°UšàíEpèj¡œr½¿ª› æ\'ael±Ò|.*ˆ¢ˆiŸ²¼CòSa\rZÉE\rá§ÆÉ\Zì®Ö•OqiXI»J[ú/µ&þ†…ßI\"h{öA­kcj¼O46kÊ±@åÍè»Ô\"l§êï7ìïÕU®jÌVgœ§Â£N‰ÃauSƒµD\r¾‹…µZPªUJÎ€o-JrvÀ†Êl(Uy@Ypçø’\ZU\0q1³è¸1Q8ú &\r>Z¥’”\rj{ÏÄkþVV\nŸ´ê6·îØIeâ\r²ÌNFüçcXÛ\'§o”­”°>Wek­èªFgêÛvr»Â”µÙ¡¥vž=ÕkTñ\0µTBXÍÚtQËJTm£ÚâÂ5ÛËè¤„êùZxMûKíÞ*8™SÜ.9ž}‚ÏÊƒÙ¤ÕqDÔ«œSÑÙèˆØí¥K¬ÄßfZÙeN…\'¢Ê¹JÌÊ±±ÖŠ,;1›ˆ¢}Ø¹Mˆq=KÕ~ñ-¬«ÎùgbË‘Æ•?å±ß‚¤¦È>=™q†œ·æA‘°1£ DwA?;Ë$o+”¸ÕÑœµ\n¡OUß)[–9­¥êQÞNçzYÌ×wX¨ÈÌÝhžÊœ§¦ÂæêTÎ-åÿÄ\0\'\0\0\0\0\0\0!1AQaq‘¡±ÁÑáðñ ÿÚ\0\0?!©yÿ\0à¶1ÑÅO¬e§øÏàÈ…õˆrþæF¨”B´ÊÖ\n‰Ô\r2Šñ90]Š52Øa„)Óó03Y×‰u(:º7S^´McæjEBðÜGðMô³*^*¦V¤ù—ºÁsÜÔÝÈJ™.UÄ±‡\rÑ$~”â1Ô<ÄR§Or’Ššy%—uk®¥*m©ì®\"¼l$½ÕLŒÃÄÝs(ÜW\\K»:\\AGˆßRÄ¼†æS‹Àµì–eÚ_Ø´˜Ë!\"uëîT´K †/ ·8&‘èqP<Ó)²˜þ*Géîd3))Ïñ‹ã=s!u/V¢Wá¯¾b±œL	ÆP)Üi¯hÿ\0!rfT³W˜$‡–g›.ei­N}j}×5ð¨Zoê;s×P¢ù.‡gõÎb@ø˜ „ßøH²ðŒÉ@:¹UÑ›§\0ýKhN§.è‡yñ\Z¹o†V¶F%‡îWÒ¿ÊÍTäLÓNÂz¹NPæãÄ\nÜñ˜+{¹ÄÕÄÈ_˜øËÕœ”|Ëx_¥½ÔüÁš*¹–~®}LÌ¬ÌpÎ‚Äã€²–eKÿ\0}G‚º¸]jG+!ŒÃ¶¢(ÖéÄ®lA¨eqDSYÇí-õÈ\'¿„°±þ™‰Ÿ’_æÍÌ ³	§d)¼ÌÂòJ˜,xÔá®?búˆÑ8Z%»“ÓU:QP0QàšŠJWY×z`tä\rA«×PîŽè‡í<Ó’¿Š—AÊaì‚ÖÉk‡TƒpŠV SÔÄk8Ž\0V³ržÖ<¡b¼œ“¬4!I,H¿c¿…ÂžÓÎ5î+¥Â½ë‰I%XáŒ¶Òò€ÃQËqV0>Îÿ\0fÿ\0öt”V¬˜5«0ˆ¨6¾¡³ÛŠgZw*—d%ÚáÏ/¨÷’]P«O)êæ“zÜ`—¨W	-/p¸­;Š„^œÄíûŒƒ8\\ýLï‘ê˜æø|BûJso‰t£ééñ±¤aŒY€»/ß§Ô²S.b<³vêe<ÁŒ£P0âbbsÏˆñA.²Ðé9™?²`¤Ð&9á™Í`9€ NS\Z=ŒA%E:†£5°f)½	L«GA3ae–D¥;…±uKþ\r\'©sÀ¹»ó/ñ§Ð¿…Ù†cå4î]GÒ2`¼E¸býÌØ#c)œbî¿3\0ÒÆxËZ^hyPƒù˜7¢¦_‡\Zw¦Vá*œC$ü×ø\n†[»*e¯ÒÈ{DÄÎÄ½œ,–[¬Åüõ9ð%±à“h¤|<Lï§žü1”¬ÑÔ´Ü,¡œõ6us9P-››àUÉ†£ž¼	4ûb´ýÏá~¿—&´À1,›û÷3\"¨]·4ùq2(ø•¸]Ëf[Ð²mˆ=Ò(q#Ä¥]Ë˜L™’g€N^eI—¹£1æP.ÐúJž|¥zHéŠk‚Ü*zF³±qét•-¤¦k\0+Æc‚8Â@©C^bÁªš§ˆU;Ïñ	©_ÇàEðÙlÊ9iÐ™‰j­/0Ÿ95ÃC»ôH®GMŽñ\"û¨ÂKÏ¶|˜HZÃe©µÞ’¬ñ6ÖAdäó\\?sxT÷Pv‹€“7‹,æ2·@Ùí+ƒ¨”zšþ‚:Õ—¡ÿ\0¸Œ4øŽçòÌ¥½…£ó¶ã¹™zæB{i}T²(Y¥ÁnJžFúÆ ­Ðø(‚eØÌü×F¦…³Fê\n\n1ª–¨QN©Ç†Ä¶gEÐêcÀ-ËÖ	D»ÒÇ“ñˆàEÇ‡/ü³2À.Rìî:¯å-çqˆ`»y%OÈ¨¯/Víä0°6²ñÀ†ªc×ˆƒc0ˆØ†as2šnEQ\"\'1»SÈNæc¼´ÄÖ<K¼&þú!•KlArYƒõW»òê.ö_1·M#’Ší\0qæz•š¸ˆ¿cbkk·rüUŠa±?®s®\"2æZ†ûÏ?ÞQÜ >Yh£â2Œ:ƒ\\3ÃørJF0›tPf(	Vs¸Y~Ó-Xðb7Ä [võ(= £(è5y›Êr‰Vq”ÔÊF¦ï;ÙP_Ô¡Ðœ(Š.Ã‘]{ã0IEwj)6+&#_ÊØå€UVðî\rÃ%KhÎéº¸mÔ¥ÍËê:â®Q±ïÝAKÖŽ¡­\'¿ªwÒ%§ì•þ`¬²GÅVî^¡\'”¶gâ$©r;%å‚ò”kU:yŒ­–‚­‰2<Æ!iuÊæÃ¥3‰[-·û¹`‚ÿ\0ƒy–§ñ\reÂjÕÔ2¸#P\Züª~\"÷YˆÌ\\dN¦ø‚…CiÌÄ#F|FâŒ´¼ûWêaÈÅÀTZŠñ*nÙ¨/Ä×»:°#!ðê;ŠÔÊ¾%Ã5°®g0|†É‰îÈIÕ9\"¹nßQ²[{‹dfÍßL,¨½ÃŠù& .7Uw.6 jÞYLmÌ«•¬$57ãÌÈ¨âh±ìˆt\0öÜu·ô–xW¨Ëâ`Î`­)çÜT´gÁ5p{—Ùb,öËØÀ¢bÛÌ³„¾†vÔ§ó~N­qÿ\0–¥ÔýÌ-á€-³î\n8åðõ(ö<µNàÌ¥öNÓ¹uÊQ~eMC|cñW}„¸kyeW-DüÂÌ0\rŒa›¼%aŸi@†·gñIKœ;æV2áœÏøm„©S¿‘bf¨LD¼,­\nw)ý	´n\'\nÅsƒ–ý£WIQJm>#ŽQË\"G@ŸP~”™‰¡líq)4zb;\'àƒ˜Ç=®âñ¿˜t\0+tô»Ã†ˆ‘RöõØŽ.&sÎâ}óÕK@¸aËÌóyÜÿ\01=8\"åÏ†)â£9»YŒP)lîgÇ­Æ•{¼CŽOeŠÁÕ‚xÕÔ´;ðÿ\0S± »áÇŠ‚¸…oÒ\0lÏp“eØ‡O¼®ƒ€>Ä9–µ¡mu©›ª:¹Ôß8OÑÊÕ§û›ÂÜÔ‡LÌqXƒ(M‹‹ÙâVFDÖV×ñaµÙr…­Âá–àj0÷&ô2¬”g<åbÄ}Bnßãá”0?Š™€q¨Åî²€KÃoþ×ôðÝÿ\0QaŠÛ*Ì¿+’Øä³a˜¬*tGâïÏý“6Œç3aQHŒÊœŽ¾]£ò\"ñ÷3³\0>çú”c×Lã^/1AÙs¦dôx¹B0¨»al±Î%g1øltÀ¬>c0.ÉfûîxÔ[Û[uAýÊÀXº¢ZñAšùýK>1|öKÁ)mƒ¨‚~ª¼M9lôw+ð¬¿ñSLÄ2*ÖÕé¸×\rEevúrýîZ¡\ZE„«‰uXˆC`Y(À÷§áâ7—K`F3w}Å˜Ô-ÕËr1ŠŠ°‹“Óª°²2Õ>éÆ&@!!Ub‚±Nmwi.Õäð?1Æ\rJ1·øBN„»pŸ¦V*yM‘ÛY~X#|ÂÇÀL³¦Î!Zì÷¾¾ÄLÞ<3˜…)™rB„EB‘¯Õ½§Sæ*€û›àög‡_ÇrÐe\\0±7Âî_„~[/Ó¢\Z?Š•È}Å	¶¹^‰Š!ÊPŽ\rAg}þ¨ó„¨W‚\"îˆ›¨=õ\rŸ1ò¤ª{™îX\\„¬c,2—A“î\nÕQ´ÅvjZ(Rw,¬_¸hjÃÉX¯ˆsxé1È¼V³óSÉ…üÏÅø¥OÅËè^¢ž`XX7˜žEß”ÜE·C·_öó0ó\r<›™‰µÙËÚ¬]Dª¥ÿ\0Ù€î`]‰\Z!ò‚¡­œ%«a±7MÒ:6JÍT\"c‘´ [Y*½¥¦ÃÉŸê˜Â¯²áê1~ƒoÔZÐåë×Ë·ßñZ•	˜ÎxØ€¿O<Õ1ÌK%óŠ¨/´\'æd•QÔ’¥J-½²™ððÏeu†PÒüÊ²RÝ„t	±•ªBk$;±>dE•×sÌ,ŠdG3=C/u*@yŒ-²ÉlÐM.ÑPì‡ñqh–¹‚WvåšLÐ<J”Ð¬Ê¾_ÒVýÊûÒ¬Ü¦@AŽC?ˆsÎ,`²‡¢¥?”Ûî8·g©)n¾Ø–`B.š˜upq§§Œ5•0¿Æ‘œ:»…ÖCÔÆ±î#PÜwe\0áˆŽÄ*…Æ‘³ü?ÔUsÎ¤¦Þ%¹kkò›.Oí„\nP¥Ý’úN\"º¨-\r¾÷0º¸ •¸ã?SF ^’d”Mø€ÀâVF6µvÄYwÃ|ÜA©0:|L¸ë¸‡ÛÃ—Xˆ0aL-£¨sæ«nï¤°f´šGrôÂéeþh»?(‘XÅ5\nÔ-â¦cÛJð?p\nÛÔcPäguoÆ[m]SH3ïÏû¨sTó-ÉÏ˜nEÌ©£¸1ðËþ%ƒP3/„n¥¹ç>\Z‹\n³ÊŽmìC:_-Í#ézþ¶=ÅlF½„5“Ôo¦À.`nR\ZG°^ey­ìe‰¸+¨«Ñ¨‡âl•„À_å‘FQ8¶öDL­‹fÉëpx7ƒÆ¼KÅ¥«u‡¤ë*H—11²å¬ç6™ë¨(ƒ+-°¿Ê\"£–¦GíLÙææòŒÆõzDVIy×$µÇ4î“gŽ£‹Fñœæ`ƒC³¶-X\"qÌ†k|áßS«ê,}â&µX±³\Zª_ÆÒ“ÜÃHåPï)*£<jñâd8Â¥\'F*Øâ}.Ù˜Ìl9˜[™Mq¦ÈUgÂ;øJ-#™©\nî]\r±¹k½òµRƒ¹.xQ“Ô½§lW„R\\º¿sÐòGAò\nˆížGˆöïÄ!BÌ#Ú`›!)¤+££T8ÉþcèbánÅ½µí„8P\"V0qå}\rìjhG#`õÌEXyl¹E„AæRbøŠ…B­\"ú’aƒâÈˆÇ*òK“‘žc¹þbEÀpÀ…U‘ªÍsOP.&¯PP¼h¯ÌÈ»(«z|8¦ÀˆERÀ«,Œ+M0äX];«›5KÓSÊRöóËêu;\'óéìú…-xT9ZTRQxŽÛÏhU\nàìß$!˜9â1gü\"Qùµúßœœ…JÒ¡)åZcÈËuBãaš]Ah\ZÉ2ú±æ˜Îþ‘TSY³§íTQ¸S{Ô¹yš.P@kKíàù…+ùE¯ˆævJ-‹ãa:à&ÿ\0¸õ®ðõ\"\r×÷.–ïž%kÀuO#Ü*«”,üf<BÛmóò&¦o–˜¸l‚Å„|]’»é@ãÊb\rÄÂ?oïpám¾&¢8n‰LÌÚî­×,]uÔ÷ûþ§ŠÊ÷Ã+Æá}5ä†Qƒ†9±D>©5üÌ‡¡\\ù†S71m\\£JßÔUñ3˜]ÙÜ¢¾î®¥ˆ°á•+	°¾Îó?ldw³Q!z7õl>O¼Šè†—\ZR\Zf#…GCG4CÒL·Ö\"*¨@£_D	¤@§3äd¯â[AGÅ)_h g˜Ãv¸µ!¥ŽS†‚ÃYB›Ï6Ä\\…q,fw1èÌv#QVïîhM¥0ÌfO‘õ*6ƒñDtwÃŽçÚÑóŠ™{ÜþS/ÌD¾¥\nw\r!Ä·“7”bC¼#(+Aü·2§Zt=Æc¸o÷¶÷•Srè€à,F¼ü|\Ze±\Z°lFåÇÄaÁÿ\0Æ nâ­\"“`óiCi4‚ÆµpÃ10;šDÌ¾¸[L”|ÄUù”±Bwÿ\01¯˜OT€¥8æ[k7íÍ<¹Ls»p8†î|?÷êb”e‡tp‹%Þ Ú4ró\n¦xh¶gwfkÚ\"4¥ÍJ©á¶F‘+næP9‘…žz„L´ïî?h:¥YÏÌ¡¡VwŒNŽ¶ÞþS—Ñ­y$8Éôô™ðžavÍû\\C^Â*»@­aØ$7`Y_þîTx—ë–Ù_Ac­Ëí§¸y¨¸¦x…xÛ8c—ëPNŠˆ:ª%¥K¯s9³¨˜Ì¼SnÅ²ÅvJ]?—Që %‚-ïÎ¶vç UÕ¯&ã”Pâ^UËždÂòrLYª‚‘â Ów2™Vc…™{!\"…ÑïõzÃ1qÛˆ´‚éÙÜSSË²nQÃMw-:G¦62ÀB)ÍÃµÛk‰KÅÏðãÜ¬²B{¥H3>>Ž/™wåÜÃ,«öž2™‰\\±Më˜\0Äqã©B¯Di“Ä+.²d^læXÑ)ƒî&\Zìæ_åR\\½Ü¿Bv»µÆ\'xf\'kvCX®5yx€$ G;ºñháÆ½:F‡Øù¸ÈÕ3¦[†ù¨—óšÄ]QuÔ4ƒÀjËÿ\0ÑÉð?/ä aZrDQ¢­àêk? ‡¢­¡~Þ¡´LÈ¯³” \rz9ñe¡ÿ\0Þj¢›=H~P·+LíK:–‰qöÆüÃZÜUYZbG’>æìžgFÎ Šš*¢×¸q9à3C0+ØÜ#s6ƒ²YA#\r¹z…¼â\Z²^îXqY$C1…`‚‰«jWÆ¹Fø™—üôùþàj<5€DL|EÂ*!ÝuP&±Â1Ña\ZN¢œFÍŽÑ°2¤2™–BÇ3O‚Ésªf\'9EŸô‰Ê^¼Á €Ë¨¥ƒ¿pì›Ìü `ë‹Ä=‡AmÄÙJ«*JÝäÔ|Ó1‡Ý›/R¿q\\Ü_j%ÊN=öQ%4ÄXÞýJèn.¦ ³Æÿ\0.x\'aØô•™ÓÕðÚ©~ÚO“„-}hºš0“àÜk™Ž®d:øšÖ€|ÿ\0¨66ÖÝ,<få=yWãâK¯×ø:¹ƒÙ3&g®¢ðËZhÄRg€]Ì# â»æŽÁZŽÞð&?­ê‡öÿ\01Ðet\nUÁr’ËŽ‰Èª+D‚aoY¸#\0ûÑˆ+€®`±Ø+¸Tªvq›hN¡Ò×j¬‰ÿ\0Ø+6DO‡)ã¶¿Ü2\0c­½¬[¹Få0µTÉÀ€AFa6ŒÙÕJµÐeïøõxy{ñù!À¶Bƒ‡Lgaep÷ÿ\0<Er\"çû€hKõf‹3i|LKfR&,~\0­]^ŸRöÎŸJÕ¶S”÷…\\Ð’¤Ìà”ÁÅˆAlw\0_<U…öÚZšüyH<*+•Ó93c	ÊÀóŽT”øÁM‰åŽÐ´ÛŽÊÀ*5¦ky	„Y¶z”„Íó†{þ@z–¬1™_1ÝnÙoªë_RìFNŠînsÕkšóî¤ø4ÞÎ¥÷b1Ü³ð«×Ìë¸%Ù´5.9M¬¬v˜L´éÖwòN^h[àc©ÈÑT<÷)²j½×$U``Ç2žâ¿øÅ\'0Õá¿¨=MhLˆcÌ(WŠ.«-o¨¶°ŠñU15Rá”¶a„@`F5$I+K‚ó]EKŽãfR¨›IÁ\"ÅNœã¸ÔÝ:ê,¥æÙƒæþ4hö¼ZŽàì°´U«ÔÔ0Us”†ãéBsPêÇwœ¼3ž“zêxæßp&w¡ÚQ¯ê$Z¿”Ü£Œ{½¢j!¿+ß3è=MðÊ–•©n²×âÈí(K`u¹ÎÔëÌÁ—ƒ<ÿ\0ýÃ	\\Ö££†Vˆo„™…˜M‘C)Ï<Í²eŸIŸ\0ØÃóÏdBŠñŒ•TùÞ£cÄŒ¥#Wâ.o	P‹Unáq@+¥|Wî[!)E˜GIetùq†\r»Ž¼ÊW7¬\\J\\Œ¸›.ívKå4wX)xGxwgÒZ™]9c‡Q—*ÊVZø˜mb‡	F>À&b[4!Ë{â_Ð«+ó@³Ð{›ÄudweƒúœÔûÜY÷5—àÀÙÙ^ïþ)¿!{J¼L¶äDoÔW„y¡Ó2\nþÈè	¢s¦GIæ52\'µä<ÁÍÐbî­BÒÍS‰‰ŠõS¬@\r*ÂIe$g1Ü>L\"\\fÅy µx-æY @î»oYn Ù†ŒVõdOR¼¢…¸›	ÊZw0¾ÎS“Þ\"ÈßœûHSuÆ/õ-¬¿b_q»¾Évá‡“×ø—Ò×¡ôÇÙGˆmÔësê³+­äGACñüÒDWí4Gµë™$µnˆ»Pnbú{DU.Â¾ñ\ræÃ\0°%¹ts˜¡S	n¯3-\n\Z :\'ˆ¤ªaŒ\rÞU_ˆ·*†ˆ¶\"m&0ä ÁNžâ©³t[›…+þ¬•æ.Û<¼E ‹Îcÿ\0bêídŸàCj”„Ð÷.tm®ûŠ²ú‚+¨n#f^×æY[‡t‰E?£ÄŽ,ÚîË›Ü\nTM¯‰B²˜ò_¹	Fâf²´û™™TÁn?	÷*Ú*c1mn,8Ö˜Ç`<é`÷(9^a\"‡——0¾ß¦R#Kó¼(ÀJ˜ë‚h,5J™+\r0jÁ¥1ŠùƒEÌ³FŸ„j¯¡—¿UqU(«q.-Üï†V*œÂÂk.Øs2êà.”ÿ\0È?qâ=óã$RþÅk¥ÑŸ\Z°n­pO²	5ÄÖš|c\\ÊQø+	#Îny˜!Ó_ÏÜ1B4­Õ\\4Í»\\2ç¶™öv@[Ùü\"À{b\0vœ~šÖ‰\\5_Éê6Ót¾üÅ=ÎQä‰r†~#Ø\'pjm_Ô¢=¦c^[J™L×îSø32«=À€¼7r&õ]³Ž¨ÿ\0ÝGµE·UC9ÿ\0\'æá¤G¶P­8æÙÜi(ÿ\0õ0%ú3&Õñ,]¼‚Ê%ŽÐ\Z£»ª¸¨‰®—(ú—¦ˆgLFï p_ê[ëP¸GŠ˜¶§sÆ›R½N_Ú6ƒ0µ²Õþç\r\ršþáô¤¾Ç¥2ÁøQd^Z²örÊ7]rK¹›ƒsWð ¦¿\raH»Rüê¦5®Y—ÖA\ZbæV1\00=¿ª‹6ŽâUq|ÜŸ–Z~§¤«ÌL«Á™ôQdÞªTHJëÍC¿tØ¯\"âfïs<³\0Ù>†f=Š˜ÔåÜ\0_+#\n™æ&¾I–sPx.VNèÿ\0Ÿ™H®K‘3,cî¸ce*B¢S…†(dx®}’ª¨m`ÈàƒÈ®>ˆJë»šŽ <¯CÂ·ÕÙò¡æ$ZnWˆ&+	d+\nÓÁÿ\03<_¿2¾C×û–jÓˆ—Ôn/@‡îZ®ÏPüÍ)ÎáÖM!ÿ\0¤d¦LÀÞï˜1µ»<G¢9þK@Úñà\ZG ÿ\0žJÂfêÐ$Åø¯×)€X+G3:Gë©á\'Z8ŠîtÜŸ½CÇÊ#Œî#Ðð|c7ÁcÛ8Ð3£zkq	±¢‹_&Þ¨–rÙ=³¶4fÿ\0Æ3<\\…_àÅµ«s·ã™KrJïÎ‰J|£\\ñ\nËžbÃS-F•PÎ‹â5°!®q€¾gHA¶­1L;üÌÔWÄ+Œèë‚&Æ¥êþÿ\0‹iš×]N z`Òr ˆˆ¾pÅ\"Ñ‡(¥5p|£Ð/ýÇ>‘ûOê7\\ Cx4xÇ§Ô«QW0eäÌZm_îP’ëx\'‰b£ˆ ‹µ_)OoòJœ·Ü~1czÌ³IãÄÆýðïó-›vý%9®£É(J×ÌÁ„´dl~a®^d—‰¼Žb\0cp^’²¾j\nÜì¡ú–ê©<ý¿â?œacj2öm«iõÿ\0pËu‚sÊ¸ø8E¦9ÉñaTG/0º#Ñ/m\0L=#sK-ŒÁ;Å‚ƒÑqZüC¼%?rXÄÓÓS88(Ê 2Ài{`™àN†%AJ?qŒÆ-7ñ@æ\rÄdˆêgÃš%eÄ½5ñ-9ôG‚u—\nÙ%ÒâŸŠâ2Ðý84¶\0ýAuM‘‹Ñ‰+/½ÀFÜµ-Æ¨ÄÄ¿©\Zs–^*Î -ŸþJ²n%Ææbê«Ghã•\\ÑtV¡¯HðKƒáÏíýÆ8&\"­Ü¬]4ÀSÞre)”µG¹ÚW¨4ÁâóØä<@gY¶\"Åu=@K^Q…Ër•(ª€I<“ç¹Zfó`ó6Uw+ˆ3\0µ~ÏqÀ¶å©û„;ÜÓò¸â\0Ù€¶0ÝÆú‚/Ì^RŸˆæq¯èæ¾ãŽË‡¢/\0É‰˜Ëk¨çÔPKK.öŒŒ­¼°ÕÝ¤Çø\ng%j(à™Rò*ZKø%¡¿hT94CåØÿ\07£´®&ß–Œ»{e¹ÏÌWq±B,ô)3Ž=! ¼u_õJ´mTÝLbúý»û”d¶¨£EX ù’æ’|ÌÄãy”!›hå_ýK™Äÿ\0»ú–µw/„ò¨°@­Ü§“\Zrs×K¢qÌ,næ‹\\¾©¥7r–Óø.ÅpD¥ÅñÊ!uýÇùB*pÒµ¦n\\ ÷XèBç‘ò¥g»ÏÞeÅà[³RÏö‰•Œ©i“Æ¾Àã%BæhFJ§ÄÊSâ÷)uÐW˜†eŠ¾,~>cA‚Š˜óA3è}wá9*ek`Ó«<¼DÕ)UüšÜ\"ê[FçFkÊ÷€ÛÔÀK…‚¢Q]zƒQRð“ôÞ©ƒzd\Z˜ó8‚hƒ	²>ÛL«¿4yFÜ1\0EÜ¢,Ñ!~_ÔpÁ%ÿ\0¹#gƒ®Ò¡_ÜME(7ùý4¨Øœóˆ§Ü¡ÒfkW»˜ÈQˆã$$[Æ\Zƒ©ÕŠÉp»Þ%ÃV%Œtî÷*³4™Á²g\\FV™Ðç©]k’cáMÅ\Z#a‰VyÊY:K­A5¤¥o&æ˜éÈõ(|AþXCCKÌ2Y.<eB‘ÜU[7å+ƒ<ÓqÅ0Ü©«xbá†Xj¹™dµö’¼¡ŠøüŽñ•\nLº ¸œ˜ñH…‘ s\Zã¢ÏbøÁÙ¾’ˆ\nÒ=>£º…Ì>a\Zú†p—1uO0 [ó*Ý¦ø…“ËÄbóbôË$\'c\rÇW©„AÎQÙ¤YiSkÜÆu,§‡ÓrÐ@5–u¹Œiç¹š4ÅB—OëÃÖ0K:îâ%3‚‹˜Õ«8†òÒÒC\nû%Ü+N3˜ˆï1åP\0[Où‘—õÿ\0s5Æ&#ŒF–ýFc²pý\0`ãÞÂíbm#~è½@Ý<Ê±]ÉyâçáÄï{|Jß~¡Ø¾ŸÛ\r:XÕ,a˜ò+äD¥@ªò}ïÚcÀ¨½¶[=Nh€î\'Ä£Õ‚ŽááÃâõ*¾˜&Ø¶2-¿››ÂÏHÆ ¿Ê)(VÛóÔ\"Öõ0¨®FâÁsØ™ÊŒÄc£Êo×Òˆ:\\`–NÍÜk¢váÛæ¤¼E]ÐxºŠª`ª²Oà²ÏpAý¥6AæÊ8¯XKIµÞ]WìeÑÒw7ÜG<A²›lÚÔ¿òPÖ4 C¦:fÂ_ÊFÿ\0ÜhË³¨\r7{”Úæ1ê;å‚áARªf07Ò\\Eò|Ëìn,Ð¬…ï‰ªJáj>¼Ý3RÌ¹eêU»€s[–žeí	_î‚ýJ†L¾ 	bY|LJ	r_øšba‡º^&¸ŠÉ^Ø\"é	£ 1]Mªj* îÂQ›òc©Éøºi:„C§•Oí†^hL,B_cªîâA5a;c	tÓýË¿J*Üx9!;“Uÿ\0)v\\Xíò2¾Kåmp~ˆ‚×M–X|C	ÓRžP¦i¡ñ/G,E=–@–ÓPR‡¤UÚG1öÃ(æ+KqBVl`Ž~ŠÅƒìF»¹Åƒ›ø…b8î>¤fž¥»‹Yjjæ¥Y`zŒepûŸöb?÷_å+ÿ\0¯àÓÿ\0qæŸ0Ù­6–óŒð¿—w½nâS\0öe9§“’|\\hÈ 5Ø€ÖY±4Î“4q\Zñ(Pï|31Ênât½ø¶R«Ù¨\0Ä1j…X[™à÷2éw\\|Ê[¡þ’)ké5LØ´~OÔâ\\}¯õ\rãXŠ ë!`ÃèRæŒòD³õd˜tòË|!Ë›×:ïÂv9y•TYÕh|°€é>í…œ0‰ÛŒÚv6\r4çß2âÖÎR†pÌ¬ÌAl¼ûJzrðþeò­Á¯(&©¤xœôÇqjç¸È2×9cÍJúd¨Ù‘Æ‡yýF4œS(p‘“\ZR›Ž×|j‡zqy|¡1ŽNbìiß‰ºU=DÓÔÈ\\@ÂBÞj\rCN=6Lqæn`]YRƒ‹·3“\r5ÌP±ŠFºÄ®%cE31.¯5+ü^\'3¸•b±K]XÎŒZrJ:ÊùÎÎZþ\n\nÐùM‘ú®Ÿl6Àw1ë	«ä ”àµ¤!ñÅÁó;1\rËëj–>cÐFK«§žb^\\––Õ¼ÝÊb9Fº­ñßQ*Ç:Fà†O<ÁæÛT×ßUãï÷SRÆ|‰Z(¶ýBö†Ž¡ê†ÅÎÿ\0ÜKjÓ¸€ b˜‡Y€·hVŸ‹€·ðjBýhÌÃ;?Ð–¯×(Üù—UðT\'z]@ùu/nÅ¿?õKÏˆ(³³z.£ûÏ>ŸÖ¥:ü˜¿Ú_Û__Ž§=:¹¨”^òÎüF²›^C™‡\"ßétø™2ÝŸ0çs+}=q†¿¨–´Æ¹¼4ýá÷³•øòœùoÁ±£4_ËRóÉmå\ndðZŒØº$£Ät\'BãÜÈ•™2\"?›‚ïKŠéƒ|Ë]vÃÒüÁ3Öî/5©»›5•3îåp¹ü&\nŸ2ü¡–yåÅ³+0\Z÷±é¥4DºÏQ”ÿ\0àºÑñŠå-ÙÕ3XÝ‡èâÔyw‚+/„P#fÜÙµÓ*ÊU’â¾€Õ@Ž°ÞÍ’§@®0–}’üÏzâ>v_ˆ0kÚþ§Ò\\¬êVûZç~Æ {²×\ZD–£²J¦æPDHüŒó‚À`¤(ËÄ¾Ø{‹²ÙòÌ*(òÄ¿0´Ðº˜\'õyyø†º8œ£˜`W|¢Â&Â\Z‡K¡ÍKªg3.?é­Jâ=¯¦Ù?&ÏîY2\rp?,ÄWn*ÊôŸ[˜ÍN¼2JÀúJÆÌÄ¯™o~ñW´~ 7Z—-Ý·…Ëµ)ÞZ‚Uƒ´¹”:Ã8Ìvµˆ·,„#´˜ú¥ÍT¦Ã5‰ê£ÎÕÖøä¾#hÌw\0só\n‘\ZR:e_dÊãÜ~]ÁATÉ¬72›n.¸¹f‚þ%š·Â—BP.\rpÀèo Œ]í-eÂ™I)9™ðòÍø%s\\÷|Ê¡i|ýF’ml-Wªn\0á}Vh.Ór¿Ènå:=CºÒ‡q|^gAqx8µû%ªþ&åÛœ·öM£]•ÚÅ-}ˆaeH	¤}!KžßB×]sÖß:Ä%O[ª-rT¸û£âdÖ ÚÙÜ«)§4U€@pôºp¨ws«QÍå`O‘ƒ+\ZôÁ<™‚U/÷ç{GvÂõùfN<¦»•¹š\0‹<oé\nôe˜«~zb¦Ýß¤ QÛð²é¹“§Ì[“íƒ¯Z@:ª*¯”crr´Íì_©ÇÌ=ã2ÿ\0c¡ãq©Ùåÿ\0ˆKke€e7ˆGm¶R…˜Ï0VÆ<‹†‘óÐà6xq4nÿ\0ôENgÀ?fâ¨§üøŽÎÖ«S‚]ÜÀ\\ÊG~¨ÖfØŽg\\â< \r(Xu§‡€kfB:þ{RÏc´dÉ,óHmÌY…åª%ø^Ògò\Z”c«ñ,à·<	gÐ>AæV†zç]>ã…¬ì9«á*+vÀ²>Èñ²níww)÷FxŒ[x€Ë#/\"NJëý_â)×r8aRÝk´N‡Yün\\ò#å~™I\00Bù¬ž \\ëå®&¿UxDtéy¢f+Í;Ë¸³^TœËëag§Æ ËJ•ÓÖå)m‰Ø÷²©kÄH.Þpøí\ZZ®+²lœ-ÿ\0°†³U3Ä¬\0M€l:\"qôÁ­ÝvoÄ!lÅdêð˜¤¤Ò†óÌ¥ˆ^–¢Á¡<Ø?™  Œt#‚exµ‡ü&âÑåy®\"Ý8ý©„æ09ç‡Ûp¡-Eòˆp…ð	ke«AVf=Ç(taû&-uÃš×™žiõä×pélF=Ã6cÇ™…:¼(ÊÖükæ6¦‹ÌZ*wäô‡ÄU“­,<Z%Ôåão=²‘ÝzöÂàìŽåRéîPèÍ¶½Ë.Ñ\rÿ\0‰ÁøQÞàˆ’Øœ fZ)–€·¨GE·™~±Ï	ùC©…º`¦ç†X‡É`Þ2Î¨fŸÜ}Ž*Ôg±)‚®6ty¸™%?d`-§ƒh+ŠE-¬Ùó‰_¨,¬d©–÷æöõ1è*’½s%e¿üâmh¨øŽ%Ÿæ‘›bâ”\rs<å1ƒüê\"b1Sˆ¹´¤¿2½LTTB8±,šªr|‘Ðà^¹ºOÜ£+ø÷?Z.Åúczè¨™0\\0Åf˜Ô·f»¸òŽÀ¶«æþ!œÝê~HØm¥XÊ•M}G„ø«ˆpçÄ¸¿äÌß²?þJÅæîöB4Yß™efX!Öî®bËáBØT§(çŠ€(œÅZõÀŒÈÓ=`Ü­üC¯(‚Òj=“‡©|¾7cð‰¿(¼Å‹V¿‰ÀÜ°½G¹{ºa$ì—F¾¦D0’¥ô€¦ØÝ.óî]VO‚:©T÷pAÚ’þ\'„9<@Ä×‘Œîbíê\n[F\"ÜWµü‰šR†|BÜ4??»§ó\nŒ”Ž‘Š(¹…ËÐTº)›q9¥«PÛ6?â\rYÎtiýúak‘yÃ_ê9¿ìó)þáHÌaxC*¨œ‡ÈÖ/FÁ©¸:Àó:—ð‚Ào^ØÊ@ÈCZÚŸaZ…Kaxá)•Gêa¼z«îbM&Q˜Þ“olŸ˜Œåü:¥Ö±Hl|S†9•nÅ¿Äq\ZÛ€þ–)¯P‘Œ\"(v1˜eŠ£êvi˜‡XŸ^§6t~°«J\r„:tc‹ŸÀ˜°E^Jº¢x\\š…ò’)/ rˆk$Û€£íËâZÃ=ÅGÓó+:¨ÍœÎ©ë!ê\\Sù£i1bÊ#lþ%ÛeUíâ^Ý7ß>æ¦Â°¼_¦¹üivÐI“`¢n“s%Yh5ùx‘k®ej\"í‘ápü£\0²„€3”·˜‹^l²/énOûÌ¦™ž^ÒS+\0	AáÞ“=%ÜÕ©›CÁ‹þ£xQC·—Äom´–…l—³mÍ¶.cÆêçÛáýÌM*{0þe^óí–-SÊ¯õ\rÝáàˆ]§ÌöÃ7«5^üÃÂ©rMB†6A3gÑÐ³8Ù¨­šœC$no¸„Íl‰b¢hé69\rýEà]ˆ¿&…e²ÕxA–+îãTÒ)OùJ©–„((ûžN¹œzpVUÊûg>*T6«œ¡v|˜õµÉ3	ñUäç¸²8†?_ÔµËãýÌb}²Ñø‹’Ùù\'w©M=ŸÆ×©IË1ö_K–ÔB¹¿Rç#Ä<ùÍ’«¬jXPJ]JŒ½ÌÚø‰jr¥{´aë=)Sx¨Ü7O¸j û£fW¿˜¦¼“×‡\\¥ç´˜*ƒ]×ñŸãáþšM¾åw•ê—:wh}”þ™Q¬¬ï)l¶ÞÝ»z€¿4=lýÎkj¿3)Öß˜Ãø•ïüqþ lÞ²›µŸÜ‚«¨íSÕî<2õ\Z“¸èø²È€]3òœ<ÌXö&\Z¡Í³%1O“ÿ\0’·§ñ… ™»I.k»a`\'\'¦ÿ\0¨Õ\06ØMÙ\nccÄ•\nÄý’Dç&`½=Õ,CÌ\"×3:½G^Š–aï¨d²ãîtÔqóØ¥Š=ÖQ-¾9ÄµOÞMVÞ3}õNüÒìÉ¡NØƒ¬X<qø‰âšš$Cò‹ºü€OÄºÎ´Ú0>©€\'éUø1°gXþ\"£ƒ`Ÿså„ƒLÞ\'•l9ÜÞ9ê1Àï’S^^±‡)\\€—CÚïË(ÿ\0R€\nü07µ5îkI¼¹bGøÚªÂ¾ W„p„Ö˜Þ[ãg’=â`Ê%ØcÄ¨¦p@ÅÌS~aÎÄÃõÁT|çªÅû~%ýÏÁ\\Ÿ¸w7Ã1r5T«Ž¶Íüù#o˜üˆ;Áùñ*Œ‹}T³V&W!½óS¡òÄÌ\rßõ€¨8±–.¾»šÿ\0¦#²ê%¾É]¸T&¦`bª\n\Zš&†9?pÓFªT¥KÃ¨IÈ.à=Kÿ\0¨(;šÁ_ðŠ€³™¿ð¨+#*aºN¢Âþbè˜öÏÄŒÎª=Ø á….4¯º&C4Buq²^#\'® @x%WDC1}Ñ¹“¡ª{}Ê©´WÀFC!¯ƒŸ™PÊÂc¸äyqÚ¤ìJ(‚äZ¿hÀz™Êû˜ é±ê¶ð./ô\0”7Rñä•ø@8J¢bþµˆ€½7þíÇÎÁKy–¥w.0@~˜½*Ð™u=‡•„q˜siX>fâ\nàßÁ«˜”/P[Ôs­9¢þ#*n$­º1gù‚UøIè›zFy[)“<ÐüÖkÏÍL¬Œ\'ƒÜMv™Æôúæñàü‘Úkq8‰pv`sÜºæ“‹ 4›~n2µƒ1…[â&“Q+g)1þô±lB\n¯æXwÖÈ\0LRê6þ‡ûŽ—„¿Ä¤B6˜5z‰8ÄW¸¹ð†¶}„Ñ¬¥eèD¸Œø Dïâ=õ÷Ù5HÊŸRÒŸâl¹Õ¶ÉÞ¿O«©‰^Ü2¡v¿ÜC¦jÿ\0qí±•«.Jœta1p6|²«i,Dÿ\0P²uV_Pš%›ïÙ•c†¿±ó(ü=®¢¡™T‡ªåU–X¾þ%Úß­ÛÍE\r3qÕž T4(v¯™U†6Š3ù¿á 4=Ê¦ÂëaªõþaFôÄÏüE¼æf\Z«Xù!b˜Ï¸N2~ýÆkš\'Lî·ÍÅ­?Û3	Ü±ˆÌ®h7Úg÷”G•D«5?~ª3(»1,®puUÍKý¬£“bðì†ä™‡/©æØYƒ¬µ”¸6BÔµQ‡ÌG—)`ýÎ‚Ôó)Ü<B3~ÇxÁó¬ÿ\0RÉR‚†*Ä*]†­×d½\0È¦Ÿ0ŒR	‰wž¿Ú:Ýø”ZŒwZ)ŠÏ{,|¿ €é³ö’ŽÜÚö0,(Áz~!’Ña	kx¾)ÌcpêKŽò·|ÿ\0\'ø]CÞÁNÙ«uøüE£H6Žc“UnSsßé	k^û—JBÿ\0pV¤\Z^‹DÚ9È —‡j˜»éßò¥AòE>\rüË¬Â©.Ã ÐœÐNv(bãÄp¾cÁÅ.¾Ÿ°	ù>ÐÖ¨ãí>ÓR~ÉJJÀk+¿áKNú?Ñ*]\r\"¦ê\ržq,-ï==øE=f?ßSÍw™N‡áþá,3ý,õ7Þä«BkOFXNO¹™wà–5ì¡q&<,·ˆ¢Ä&hn©üJvŒjZ\"Íó.šuQbX€Aà¦-‡©•Ê|J¢@µ\Z4Ê6Ç\'S)ƒðÃW™´we(”Í,×ÝQM	– v0÷JÇ2½ZÀjåU\0Z²å_çf!ÍÍ¢a&ÁQÇBÕóP\r•?aóC~ Ôb\\WGÿ\0zŸøÿ\0ñ8ŸAþ#þ Bÿ\0DIÆ“‰ÍG‡îN F›þþåì\'¿÷‰8ÿ\0—¸€\n1f‰YU>†bZíEóÌ	žyg5¬dV‘´1é0¸€×%Ê¿©ä¸•R†,§ìÄÂ®ÀÜÞ\'¯òE\Zí)¿w—’êzÜµ3Ñ ˆÖ¹,û\"-´ŠOLÃ¤\0Ç!&Öî4ä£ñ9p«|K0øH8å3”g‘ÃW¤o8@àf\\€ÐÈñÌU‘\\ÊLã¢t±‡ê¿H¶Ù_±)»/ýf#Ö·Â{>r Šjè·’j?ÜÆ5¸âše±¿¤\\¡tl3/æ)×ôC65¸È9îi%—Ô2K‚§7ˆ4+ÓÌ\nRË/:žf“à‡lµÌ0FXæyáËÜgR®g›óÈ¾ˆ‚îÙÍrŒ4n`þ\0()‹zK,Û¿â]âT„— }Ã1kêÔw³ð‰±Çæ·ùƒ&	ÿ\0)Tù>c8\\Gd<ˆ`ÍÆ½…µfÚåÌRûêÂ¨:/r²%SÎbÐ¿s³úääMé÷ó(ˆ8¶#Ì1¦õ+]»ƒYXþœ—ÜÝM‘liž/\ZÏÌùIaeñlw-½ŠâEÉ®GhØ9<	©‘œ±é\nÖrQrÚÌyZ½GÝÀÅn;¡Ã‡‘ˆƒ#:\'G±N1#·ÈEs)‹â®\Z¨`p‹ióÐpŒWÊîvÞKÒøJ\"ôàÅX»Æ¡é*0àê\rZøYµ•¿yfÙ[.û‰½Q+»)•Îù‰éQâZiÄ%@b¹i(±œÁ‹¨nŽÒÇ+ÀƒUWÌqÎrEUù%‘ïóLŸqÔe´ S_1xw)B“3!¸J\n½ÃŠ-Þ?ä0¿ï9‹(·¢|å/¸M¯‘8òwÉãòrXrz\Z•Åõ!7<±äâÿ\0q/ª¸iþîW›N ó(E§=GPF\rñGGókO¸‘ÂëtÌ«rû…ŽQ#8ˆe¬æ0h4È™ù˜ÙD]Ê­ll9çUÝ}ÒP·ýˆKÇŒÑ$`…y8‹:å\\ÀÌã†:˜3Š/Ì0 Í3ñ1Ãêj>!À{–½l,YsA\Ze®ã^rn¡	|,k÷Ú3á€vNé¼\\ï”ý‚Ú«þ¦×Xb£4éøa°VqDÀ´}ÀÄ\"ì¡le©†d&zßá’òµ%ý¡…#MÇà+©RÆöE­Å®(ÉÈ™ˆPB	ÓñËpèÌ8P‘\'KPË¬\\¼†˜©E™_ó¨ãŽjQe”:N²¾g‘R#—\ZÄTÜ{\"r’&´äN®ù‡ð¹ŠÍTÞK þ`YkšÔ6ÀÔgLýÁ Ó¸¬âF‡5†›$mÜÎ˜šóÙeºF+§ò‡…‘fÀWÂål5alrœYd >&çÀÖ] Q‡+=ñû&y¿–Áö~eç´eÆ1ù•T@y#Ã¤,‰´Ì¯%XÏp%úR¯˜Ôb:a–ÕÎdCvÛãQ,Ëã‡õÇ2Ÿ.Ý÷þ0Öê%þ7>aÎóé}1Òqö&0½ÓÖãäÌ)ø*!BQïÚúq(Î—e6ôn\Z•ÉûœÁ©]{§Ó,AF?3”J€§ƒl»dêgÛWppJw.¥nq\nÅ‡uuÄîá¡cm©IFƒoý´”‚4°ó(ÐŠk°Þwèœ¿¤ò_hüÄóï0|W©\nVc£8È )t@&_R¢õÉŒJ*5`Wfån¿q`Qõ8=u\naµv_lZîÈ2‹·¸dr!“<æF¦Ã4ÚÀþ&b„ŽSr[_Â‚>ª×æTñI”+2Ær/È“ ¯´` ø@Ã­“älÜqùÜ,ëÔæ0T3.Øç§ÃûbT=bS~b@ya-]¥,gíœËÒÅ`³¿„@ ÷@ùM$û˜K•í@eýËG´-Jr}G÷Æ¹Óæ;lòfÞÿ\00Ð¶TDVîžàö±Úþá¹0ä³1bU©ïqWµ=Ef;fôRy‡É4Mâ\Z†n`‰w˜féa–^ù­ù…sIG™¿FƒÑ0{·þ_ è“G€à5ê|¢ì¹Ž¦X?à	rë¾¡›¨\'…Ð¨óh_‰žØekÊ9æ.%¦o GNÈ¯@D³¨=%ù²Uõ)‹ÔêªÚw`![o¾à€9@ÜÙq÷³ýÆuTÅE2> 8bß3Ýe¾ù.9è¸@-sÕýÄO-|Ü­!#Ø)˜ô§dµ´• ·®#ÅXä›d7Ö\Z¹pï(2\'ríNeÂiÜ;Ñbuñ›Ú‘fÓá\\3 ¡deOv-òOÈ%ºÒ¹›ððblO¶^\n©ATŒ©+pÇD•júˆxÇÊUðO\"¸?ˆNÙ˜£­ÊÖc˜e\nYYœðèÍãÚË¸S.Õ[íL¢ê+jþ!!^Ÿ©âQ¤ÓG¬ÆEhÀÂ©Zÿ\0ÍÆ:ÙÈq¯1ìŠñ™žd|2J¸‚É’#7¤—7„pÜÔx„@Ü¥¶ó8ü=1±áÓ|Ì¶Á(¹Æ\r¬T6b#/ÜÒd\Zd¨Ê¢*TµbŽÁ:!Vø¹gÀ¼2íW8ŠW¢!ûg¼FÔfá>ƒüeïSÉß‰(øÚ<O^Rä”o8›šT0ñÁ™ÅUñ vÇ•·ð‚¸°®Èv-3ˆïéâ*ÓP·!XµËæ\rÛÄh›sR¢lG‡]˜ËsDù{‘³ÙH°gÌ\0RØY¡SBÏpUQ•L×?ÇŒ§Ô²\0}§ÕGü>S{µ	o\"0brž²ÔŠaŽæR’:}õ/b¡Lº·¨Ø–¥Ý\ZúËuA˜dŠJ«µn&£a\Zçëü\nû™1pW?ˆ7PÏâà†ñ2%<ÁÕrz›½C/´œI€™C±\0æfÌ•ÃßW¤Ø¡	ÃuÄ%;DÝs718‹–x	j9Ì$‘z˜%]îüØÛ­72Ñª‚Òn5½¤ so»DÚó¶f\\g£µ—5Ì®”V4œÖað,ÒšÓÖhÇl—ƒTòD\0é¶¿æ1¯ì\Z¦B¬ZA5†`7L¹ó)´Äq9\\Z¹¨XLïiÔUÏÑ€Ä˜>¢l‰—V«oûŸ\n™]jff\\U¹\\æ¥³F´_‰Z\ZW©GÄ!‚¼@˜Þ\0xîZ\\^z@”LˆÁ”xÖ¦@ÊÓž`K‹/ø5Ô°à‡®üF7R˜&ÄÍC\Z?a;W¢\n7Á/%\\3¨¹x¸mâs¸JDÎöL²­\nÔòåD¦›•$r?¨À~P\\ou2S`q}ÊÉr¸)‹Kˆä0ÆuñSg’¹dÖî\Zƒ˜8ôà~¦d+ÃX\'æõƒP«î¼\\]í®4¡ÿ\0s|‚ÔByzÂ£.×1érÙ¥1ø	UE^å@ÕÁ#ÖPqÀÌn(º¾×¹u€fkJ…-ï—ÊÇ\\âÇ¤%¾½.Í35Ë7{Ö³»”ö×n§BWåî0µrž>Çù%u#µ.UXc§2±ê¢×ð²ãü˜ú‹©X\'3É3AŸ8õàõ\0ÝP4ŽÒ¦Í2àôh€Õ…¡”Õ|Å¡†âÕZ]ø›,•Oˆ2¢’²@ÈE­þ â•š@ûÞÆÄLBjå00¶”v@º\'üE©3\r¿ÄÿÚ\0\0\0\0\0\0Nÿ\0­t6õªÿ\0„y™ê×œw¢¹é£O­—ó£ú´—ÕL\0ÇþS¾…´ÙI«<{Þê€>¥q@|ð>£¡S@ä}\r|aî`>”h+£Âu±”»k¸ZŽ²rÈåñdDÉkí±?«Ìé%7 <r´¿³šÌk\\åu·\\ÊoU!!áp¨‰>ì&\"£8?”×‰ûªúmµð{Ëã0•ÿ\0!!33‰°^o¾+Œ2¾¶\'ä:Nlž]7›±TÖDS,U*‹Ô®÷PÈ8p¿°ó¢V¸Åd\Z¸{\\7	xcís°)vŒö´y]!ømý}á¯t7kPD\"µn\rùž¾Rá\'ã	)ZNXOÔ…DxÅøÞC{{XêßÑã	^q”“ê¦ µ<˜I8 ¥¡Ö:,ðÇaêµauYc¿¦Cš•;G¡¯»½ç»”<3¼rL\nfé»lˆi¨HsyúžÉ\'‘÷¯Ùåƒ’\rÙy/Í)ÛÀ¤³ª-Ì¥YöÃzi#lÿ\0»9š1×›å\0?¦äÿ\0ÿ\0¢t+Â„C1úQ@=Ýÿ\0$^B;v=á öÈB)»1]æçüO9š(,òÈžØô\n\'ÿ\0Ü/ç¬)Ìþ¤òè/C\"þ‚C`Q0ÍÅÃ«yxX™îÇíéÌG%œùíd}\'¾Õœ Ä:o/_—„>RÏ ëðÐHq·Í»qÑåûÉÀÇÑb®žk¼ÁÖaÒHˆmÓë¦5p­Ã2ÌL¨¼À«ŽŒ^pœ—l—ðÃ\"}Ã3ÿ\0á9µIw¬Ùb;¥­sù1-Ô+Á…ÕÚ7Q†˜ñÙs l0b¢oyïø5	x¾ô¯|LÏþÕ2<À^ÇÏ†èƒŽ•Ô\'Ô\0n/·&=¾Ý˜+Ñ-O¸V\0×Yš»v»Fº~‚È 6„¦hK é„€ðôMöàâ*ñ\ZÁùF`º·¯§S#‹Dàak•¨+ï0vC¾ktÏ€­]ØÌ‚ÿ\0A¶MÞ[î»—óÒ÷9HÑ2ÉpQ@K80d ®axñ!±F&TÊqÞ30-æI‡ƒÓX0C ]ø^ö\0]÷Ï<ùÿ\0ü\rø¢}øœóÐB0þ{øÿÄ\0(\0\0\0\0\0\0!1AQa q‘¡±0ÁÑáðñÿÚ\0?ºü„}Ax™s.,Øðt’z›:–í•â	ÚŒÉõ/A;Æ#÷•Ë‚Y°ÒX­‡ošáÅ¸Y¾ñ–D¿¹ëgå›ø6$Ç=AXñfGs*ˆà²ÃwñÏ-¸ðž,èÍÎ!¦£‘ÜœL îZe:ž[ÎÝ˜à—oÝšä³2ØHÇ¹&uÌÊQ	Œ8]è§K‡IS_QÂtØG‚üÎŽ-Û—g!‰( î¿\'Íru²w¦pæ.rxóƒ˜¬/29#3t-ÕÜî±¬Í2“Ö®Mœ @,;ó–x÷ž^Ô!\rC»>5}0ú^ä\0÷2‡ÝßE‹Èé¸ŽI³À¡2ˆD@L€ñ3Q®åÈ¤^˜YBã<cæc‹†¶G¸ø.!\"\0÷ãêÇðáØzòZýÉ¦DçÜ“®‹d‡²èÄ-åø‚ê3Æéß˜¢Ä°\\Ï““púÉ.XÚû®¡æÔ×$Ï6\"0I(‡r7Š€½CBÒg@ÈÁ÷ç|øa±—~FÈXv5ðYšíˆy[› ;\'¦Ú<¶89NhÜ²H‚ãÓÎ¸,Õ}Pæl._«]ƒ3Â»°YÛ:|z”4ÒÁÕžbú¸Yó&)þÂg %œ¶Hü³#êxBcO¸§n#âÚ.§bâá½:ûñÄ>0÷\0÷>Ë0øûÄï»9±b´xºûºØCXÄ3ãr@’pñ`ZO6x!¬ DÛ0up%æÓ=^›š/EÇ©nlaàWÿ\0az	<Xw(›ëÔæ=FrjØ˜ðËÙâ_b»\rüÕ¥ÃW;øg¤mì^`ålfûYù»fÞæ.LÒƒˆ}.3Ež2sq˜Sº\'h8@eyl}D8¼@;™Æ=Ñq¡õ9\"‡É–Q”îKY‡©tÀÖÀŒð‹¶û–iˆåQ{´ŸÎ3œs\"ð·ØFq0}F\\x½ìÌ³z³Æ“)³F÷$æ²°†eûýn@Þ\0ç÷µ}îÑqüÊ59.PúFú#óòOÌ^Û|SÓ¨F§o8ê3{–’E…—&{µ¡häfö”Ëpî\0Á’6#ë:ðæz(ÈB“‹Ùay‹\"˜$œEp¢>pKÌ»OQ À‹eüŒ3Ãû¿Ì›cdGŽã«Ï¯¹·ÞÍÅg±–\0Ùe°ÿ\0²ÃS›ÕKIÎî%a7ÆÕ\"Öø]·•å—ÊßâçR}¦0vÐxÈº±¡i^%ö6ïrÝñÔ	îæ<‡.ïÅ )—ÔwËèþnÁRN\0[+‰×­žãXŽŒ\n>\"žK ÎìÑ¶=Y²Ï{›m\\q—0A¾äÉöÊt@bæ4\"§.!€0ÔàD®ò-ZwuÃsPˆÖ8¬3”£Óÿ\0s(ú.3?æÜ·+÷.¿VeÜ(p|Zwž«‘Æ~¿Wü°°ÑÆ<6„›—Ü\0y9	ÀîkÝÙo×~\Zù—yñÌþGü’°í}[IeÅ9f@m#µ/ ´ê“ŽŽ\"*îs5_ú»[¹òdØŒéŽƒ÷óp6oP’ÑwÇÖz&=òþí¯aì3ÍóŸÒ7°™1µ3Ã%×âŠkä…p¶sÏ6€ûx^íFÑuŒˆTºÍ!Åèd®ë3õóÜ¹6BØÆh8\'{rÿ\0sÚ6í¢æC<i¹âæ™Ó\"iqÏ’õÁý3ÁuœFÇ|M¨õp‡!#ž ïÊ‹¢\rsÂFßfÄV4NN@	»˜uêàaunÍ‹¯ˆ\'Ý ç­þ!íveÄKèØ\nŸÔ—`äÀp[ÚŒÿ\0H]ØCowbË&ñýçîxßŸópG›n´‚Âôû½žò‡ØJ1$Uõié•(fî\rî»„GNíÍêÍžpÌÑú‡Ðú´ñîR\\3qrä`ö»ƒ˜ªq*;Ê˜é)ÚßÓƒóEùÎ9éÿ\0k§%,oÔá¤ÏÐYâÃ©!æúõ1Ý†¥¾c‚â‹»àƒ\ZZŽVÄõ0Þ¼EiC”·-î[©Ý|$—µÚ0Ü%Ä¹&\0ÜÎ.e€0Ž^\r»ÚäÇ—îÃÜt_ëp‰qËu¹C=›ž({@yl\'dzf÷bÀw&ä]7IG9êÁÊ]PD®dÈ˜Nñö@ì\'ñ6I{²NÀˆ{•ë¿çvŽÆ{¹×‰7=ÎŒÙ†Ïê`æY=Ih…Ž-ç|oƒê)àŸÌÖúÈ°ìÕ#>‹¢C\Z8OgþæûÜH=ÜÅÕÉàß,ÉÀáëÊã@–mž[d\0ajœ;I{Ä÷/é:„ê%élÂ_p“¥~×ÅÐVö‡ââŽaÝ‰÷¤|ê;™Èµì²G6Ðy@¾¥í&ÛÎ?ƒ°>2rnMÇ£\"pÙe–Yaìà€`âÖÁ~L[ñ3¦„EŒw2âÀá°<z½O‡Ž@…Ã¹\0;›ÑÈËœ¿Hsû³¨†Æ˜—IÕ¯Sö‰Ã\0æ9˜ä_u¶m†g« ´—áœx8£ÄauKé={€x„ÈöKzLÓÇ¨©I„€Ýë ´F\\å°iu–L¡ñÔO×à]¸ÈÉ¸l»ø7ó;Ä¬IŽy\rêÈèõ~Û\0A¹?O0²Éƒb¡™\"u2+y·@Ç`Ûëlø0Ýó>Äø\\D«g ás¼V]”t[wçßØ6K\'>žä=ÐÇ,Ç»Ë‚È¹-N,»øcÌñtynÓ»°åv–Ýlkƒ}R1ÃäñÝëc»§ÂpG¶fÔˆkà,/ÿÄ\0%\0\0\0\0\0\0\0!1AQaq¡±Á ‘ÑáÿÚ\0?òÏ8³ã÷¸õGŽl.—ßpåg4Ã”|7@Šè‚à\'¶÷³ç¾&\0c:æzøU‘Œ#zžy·êçK·KcÆñçd!g‡<Ùåz°/[x\r™ÙÌæ	\\IŽQÌby²Ï,÷\nX<‰	sæ×fœÏÄo—‚—’PƒîúIÙ|JzKêÍ²êëÃc1ÜE•LRK\"2ÐÛDú»!ËwËà‰œŸ<½ø+šK\\c øžYf\\•\n:vÖÀô‹I¹,›î}s‰î9}„aÜ®xEÁÏv¤Ðä€H@œùBÆ÷)…¤íÖûî|¶Û|Ú`Nì»‘›á¥~ïX“tC›k_¨jvÊN|œø}‰.;£4ßÅ««ì°3c=LÔNN,†Ìƒôa.»Þ“©ž¶MÛ’¶NÅv;¸WËà ½ÈË:cžíÈámš£sÒÀàÞåÞåù=ÈŽ`$ 5\núY?ö_`ÙØIOObœF\Z^Ã‰GHí@`Û™Î.w,ƒž.Jz²Â|,ñâ@ÉÌîtâË\'	¨Â\r®mÚÄEæ;K|øF{…Æ5Ë]ù»¼¿‹å1Ïe3­¦Øí:Ü”^rÙ³G³ÀâK¼ðZ‡}ËáÆÃÃqè¹4,î\'A¿R¬Æ7¶àŒííe½l\rO#²3@‘Ýìo¨g8Žãf*ž‹.s’|iÇ™¼ZùŒs—îÔºVñ“Á¶œÕðpíƒ ÷klcO—©ùñt>a¯ËÎ‡ßÄå“ó\0Ò@Ð{ßŸÔi\'pâbµÕ|Z3÷·\\ÉÑûÝl÷,n¿q;÷ðõo\'¨:9èÿ\0l…6Ãæ+HšrXE,rg<÷\ZTà¹žûÔq©±ÏqÍ¿Ývž\\7‘è¹ß:üÿ\0çþ@Îo_m•¸@˜HpwkßÔ˜œØj“«—=ýÁ¯Kë8,aé(èó\'hÏÆ¤$.m†tYðGÂÅßpÕ°úlÓÒÁù¶d0zu}ø4bys7ÈµtÜ¸‰e·\'¯P|,8þö);ZX¤êÝ÷æÆW<“ué×±oÔbž“Síf˜—óŽ4šLñÙÈ|ú‘!7>`K\0ß‹l›×Ìm˜\'&M4³RqwØ¾àDJ0s\"ÕeÄãÈÃeÌ1Úâî6WW>NQÎÁ+/¸¯í&(?êuc¯ñs~ÿ\0£ÄMC&ñÐ‘c¨€E¿Y©Í0 –¶ÏS°ÿ\06ÂæÆQ‡†ã%°íôÂÏü÷è3ù!½@@lbX¸³L©ÕÑõzû. PY®Nµã/âo½ZwaûÚ”+-§ç	Í½ím‡,»Ž¤þ†J¤”¤HHyîQÏ«/V|]&®-¸w‡Ÿ\":¤˜CX,_sñðçÔˆœº³S5G¸m¤?,rdÞÁ2bæ*Ê*ø\"€d‘ùß™Baó:n¿6>Ö}hZ¾¡4ží‰\\ï¨èñ^½Z”X.ÀàÂ•êÌ.IÇlû³=XøF\'.I±/¯ð`Hì‚—nQvå°pÙ0ÒÉÄ–6p+ƒØ¸—˜œû—4êLôÏRiòÿ\0E£Äxƒ\'¿ÍÍ\rùþ	Hû,1øˆC]ó2¾„?[¼	#1…\'p¶dwcŽü^%»ß„‚|7´óq ñÄ\"Ë.nKaâQí¹ƒ›	Dîv‘àð›±Ñ;-¼I­å\"ôÀÂÌÑ=&[ïžåÓþˆTýÃÓ\\Ü¿!qyðaìçŸ»äPs…›ñ`De®n`Ù?ºôþßëæYæ.9Œé$bý$¤ËåêJ–£¶~GÎ¤ñZäc¹ùp‰8	Ebˆè2ÒÆ5êX.¥±CÞÒçV\\¼:€Íðã»:²g/BÛzÃ†xWnDƒÕ dUvo^lcÜ¦À»‡íu—ÚÏÞúYïxÇÛn<ëù°]Iáiäw\'>OÃ»3zKœ–¨xb÷¥¹£ù²¾dt½ÎÜº’@lªÈ?hú\Zþá=ù\'ä|[ ó¾¥ØpØÃ×6ÏZE…í$\Z‹ÜÙn{÷úÎàá·Ìâ.,\'=ßQ23-‘žXš¡~ÒÛÇÅ˜ä„]êÊÞíÎÂ0Ï—4¹@šàâõ£!IÍÅ6æ-¬Û…½#cgIc¯ÛÃË\nÔ.[7›¢ ü§ˆüÂžžg$0>’údï¥¯¯ÎûƒW†Üî·¤œ?ÔùÈ\nf-g‹5ÌE„œ^­¹ä°Ûâ$“Â ˆSN [Æ[ã|M¸#Ã_¨Þ#‚z¸,ë¹KîäÏ¸d1Ç08ý{+XÛÅúMá;øMHë%JÎ!¢ü³Ón~Íµ×vùBcÖAé¾© úÙç¹à{˜užß<4´”Ÿ\r²¦’½c)ÖÓýÇj]Ç¹`g£Èõ}Q<¾?/NÝ¾o—‰Å¾A)^<|N¿1pC›5O¶û¼y\ZÎ;¾q¯E‚é²1·m,X±Ý‰¶F; ò±iã¥ÃÝôc¬¶Í[#	S¯9ásJÖMpêG+}ö\"ÜŽ¡a\\¶~f/-Äˆ½–Ô ¸u=œriqÎþ‘áaÅ§–ÁŒy#¡écÔnXâVŽ‚™wˆ•-\n°	ù%ÛÀ¼žÁÝ hÕ·$KŸÒL›Ï¸0 Öås™pÛn¼@ù‡3ndžÍµ™õt»Ç™¹XAóâ˜°Ÿ{ßð<Òxå‚FwLðž\r.{Yñ™l¾!ÜÝd·rÆÈw$JxŒ;oÌ”¶DÝ¦tÉ­\\ÏÃÁÔ€“¥Øñ‚q«\0æù6_£<½Çøi¹dà³ã\\ßŒ[r·+·Ž:Z$ë¡&—o>pâÎ.Ï\'WHózÎjÝä9pL<0¡Ì÷åº˜¹ŽåDyÝÅÄÏÁ ÂW_ÿÄ\0&\0\0\0\0\0\0\0!1AQaq‘¡±ÁÑáðñÿÚ\0\0?&² 8@ØF‹Ülš•ÇarâÅ„®.¥¤Á)’øB¹€`WÇp‚Z9eü!Ü¦Èk[î\"¬¥óLP,˜©V\\@5L„•Ú*ŽË5\0aäVsbšxŠpSY…O™Ew\nÑ5…#|)USL9¡ôÏÜRhÚû™s_<Ã”X.Ì)ü×^a\"”ÈNaì´áÅ½(†¥\'*â-£ ?L!ÿ\0nd¡ôETŸÙD	l¡$ýŽ¢9\\3»):Å•±›+¤³R=ËyË|Â|¥¹#\rƒJ_LÆv\'©UQeÄo™] oÅu;*Õþ¦:28•ŽB¨´ÐÕ^¡Ê·\r‡…ãà6\rmáõœg/ÄÌ1`›¢QEpV£AÝÌ+ž®ŒD\0ijê*µ „ú€<&þÅÂe6vÍÆYk\0÷\0k3„M¢êÜà– £Íoq5VË\\Ä-KÞ\"*q;¸Ù»~æ&›ÙÌ-Ágf¢]Ò÷D™Ã.-¥»vh-)ºÐbå“i_¨ì¼:‚©á¶Úå¬aCì¹Š*=âRÌ¹mq®Œ\0°¿P\rÕŠ}ˆí¸7•ÅK9ÔÚ@yšUrq\0JŽZ™‚Æb…WPÇ\"Äñv°i|3#ó5ŸØ…L*\'¢¤Äy4¨¼éÌIÈªXÀ¹o (À˜„èz¨\0 ñQÐu8a¤Ñ‚‚ñL\nÖ†»¸§­ÍôbZyÜ Hôdi*Ý”¦ž32B+öR’`(óQØ(‹4†ñ™v\0êA›•\'?à‰æn¢Ìçƒ‡³üKQV›Op6ÞÇR®€c{‚¶69ª0ÀäþPb\nªØä\0Ð½FwP±L)U»;ñ¤\ZP¼Êø˜BQ`_˜	ÜåÛ§ù–{*¯ˆ;1 ­Á¥P\"Ì`ÐCŠ”\Ze…“º€˜%dÏ™`¨£yŠš}Â¦˜éK¥æR\\‰³5,JB\0°e=Whb¥¡1‹Ì\rF˜î¤&©¦Rà4Ãk% ºÆÝÜ>x˜\0÷ÜrÇl\ZkÝK_1@·3¬‚Ê9ì~¢å%ï5Ê¬&…¦Îà¥Cˆé1öŒ5Ó¡ÄÙ—!\nÚtËÂBOnjÅ@Cœñ=“Ó,kQº7¬en`*ãg¹¬ì÷E1[î-@V3Y¹.€ßìbÎþàÔÅhŒbÝ\0âa§–âe®œ@È[\rÄ‰ŒÛ­{Œ`ø¸ž¾‘V“]3ÛR.^5+s/0m)â—ö>CÚ£Ø^ÔÎBzƒvºAÉ¨I#‹\rÉi\"‡¿åaµ		C£ƒcÝðÊ(fž¥I08Ïg˜¨”áýã¸ò½¦ ¨\Zê1vBŠÓ~8—\\Îæ(Ü´4¬¸õ–8	™8¸+²®§‡Áðœ¡Ô±c\r:¦«˜¿’!;&<$å«ê$u•Õ(ÍÀÙÛ‚AË{³p¯9ðN)¤ü¿ ²H|º],¨€P>Nø‡V•Zi„é¢<¢œñ.¤ 5÷\0ÀÛ¨Ë‰´{ÕJö‡‘i&»t<¤xcÛÄ-A¥g¢Ö¾¡q¡õ×ù.õ[\ZwZ§ò>@m.&{BÝÜž3.ñÀ´ïÚ‰óp[ÒÛrÂ ‡c\rZGW*ú0TªNòSÈG_iOÅÕø¨ÀB\0âÍ.-|ÁˆÊÀŠ¢¦ÙH`%2(ÉÜÁÏ1	FiŽc V­ÜÄgR>DÓÕËZí¥@²±€ÂÖŠ¦E§ÇqËVšÉøHp‹.êP¨±Ìª¦&]	¾¢©§¸n6o¨©WW/d}n-Å7e”V›/ŒDÈZ3æX¢$˜Š‰Ïó†â–­øH¥¡iã[Œÿ\0DÊ·QLêØóøÄèÄš¸…\\TÇJs+¹›Ðê^{ØÂé‡@_ ›ùˆ…Wþ¡FÛb0X,4#‚GKÇ‘á„(Ä-òY3ŽŒK³ÀKõŽÅçÔ ´D­klfÇ@âØ~ym”“„GA>‹_dYM\"Ýbbd(oâ¨HÎÜÉ®8:€Ã1²ƒÊÑ/…	JjíŠŠ)±/{Ì¶Ô¤vÊòGÞè4+tº\'•§Í:LM=Bwv¿Û”\rZ\"ã&\náÁkÌWsrs~ÞaÌH¯\"à\r³9jPê˜•öì?‹Ñàˆ´\ZÏ¹Vwp-*tÑ9±i\\¥(,®-™œåµbùæÈÆƒâè‹›±8ò<¨æëømƒF#^ÃKnGÅG—JÎ]Ê¶%Ÿpeœ²‰ìvÆtl\r9ø…+‡yÀ€³\\2\\…â+ð¥„$Oh+°·ã¨^ä%Ì2XQÄEiamæQ*·È-ÊPàeZÜH†*‘&àÖÉKâµ)[ŠXãU	ŠÖO\"ê–ÝKHä«æxÁ\ZyÄv/©­ÄÄ-÷Pg1dùÄp\rž\"°YbínZƒŸ”ÒÎ™°}b—U1ðj­dOFæIôže8eâj6f\ZrÕožà7i`[‹ìbD ñ\nžX‡Ä1’œîÿ\0&‡—ÃàGcÔD›J„z]N@h† °i¬1æK.ð\'‹	­C¤n2xÝæ±‰]­Òb3J”†ª>œd<œCZˆRñDŒÅAMP5zâ^;kÜ¥m+]]\rK¶‡hª‚/²YúÜ8V‘‹¥^}\\Rµ‰Mú…5;‡z•_`\\3ºvŒ”žÊ‰“+j»•Ë¤±sð¶áØ±Âpa<LÁ“šâd\Z»‡n[.Âù”\n¸JÀ¬~ \0Àf\0V¼ªPrÒüTWVÎ¶â¥ÚÔÚ¯>`kF9¼æO!ÊëÎ.P‚8\n€}W(»Ü\0í4µäÈÔAkeÕC—žœFÌUö\"îŒl;—!¼c˜Ôœ4¦.$€jû2®šÒ¶¤ÝÜ¸ä‰t—/%)÷5Z†ý¨NKåð& }M7˜èK<Lo;°ð&pqÀª‚;^b.ðfgžÜ‘1”i.ªêø†™Š‡ÚÊÛ\0Ôb›‹Ó\r…©H+8;ZÃo‡ì½^b×–Û—³+a‡«‚(¦Õ“¶¼Fž=Xh^lO¨¦°–³	=8Òê;%¼pá{@BA,+U\Z	Én}£hy¦#&‹±×˜vÓ hñž•Mó¥•!@áDJ¡âYÔ™&n¬öC“¯@rž1 CÑ:øÆæ)Ž+eé‰î™æ=º­¥ŸB0Ï••o0›Hê˜€É–åyp,	Å÷âVuˆû\\Œ¿¾1DÀÓMÄËX­‘Z •º£«¸1RÜzIg”•±æ‘|LàMÀÞõ+èHsoÅÁÄ*G™‹pÒßX‰X5¨	_M“î0—RÑ0tŒe‚+ÛMÌzb\'jõ\0¯EÂ/,M{Xg«ˆóì5ŽX G¨RBóz‡6gþFgNÛøG\'B¸B/áŠÌSå#Å¨;\"ê¢«†±…Š²ÀÑõýÄp\0x±9ëyPÌ&1òxL/MÖb¸	ãR²·q‡à_úBî•~@t¹Q~cdöÈå«_þôÙNˆ2YBs\ZÑö´w·t>ÄF%ßä*=0öA«3&^X•Øæ†QÔ7œÁ†–eX¯RÔÏ&\\÷ÿ\0ã¨…¸M\\$O-¨F`#%°yÊ¼±$ˆ³U¥{‚vÆ6—U&Ÿù–\"zÿ\0Qµ¤NQQ¾ìJÔÍ¸¸ážüŠMö‰Íà¼ETËd¯È»ªìW‰E×?`<w|ù•ŠSZÙçz©ôzŒ®–šy‹ûŽÞ!4TjToÂfWÅ ¼TLËžÿ\0d²uZó¶ðÅòËõ£jÚù†MØƒj\r1–”±{.û—“8Xt©§·«Cš•x²¥ÌNWP\"Fù•mµp¸HŠl0NþÓaÀ6ù¦^\0R¶Bj}Ó`f\\’‹¿qÖœ³ ÐxúaÖµðÌ2ZÇŸ1Y˜Lü øŽ°¸¥‰à‚,í‰ÉüÌ$LÉ,ÞáØÎËlUd^•¨TšxR”wJ=FpŒˆs6‘T  \rÁÖ\0£QxIÌzö»Ë:‡6V[’öFq´……Ás>k‡ÄÙ™quÇãÌlå¡?…P½Ý|@ø	Y±È¸È$&ÿ\0ÍB¥~SÓ¨Nw¬PËe W‰Y,„ª]iX)ÉÇ¡ô’¾Ón÷-£³i—»0ä‚¬0£nH‹‰OþÔÈúºàe ÔÀxªÍþ	²ø¾.9ÈpjwÔ{a ÷æ_ñöƒüÇÊ¤ü)Tf[ÚRÆÓ%L¬vtî5ÛDík-TàAº>È­ìa~×p4¶“/ÜGð®¥˜´— …Õ\nðº{pA\\¥¨·âõ@‹ï¼TªÃéƒ%ÍE$8ªÛ¥d[,dF\\Â›ü„¡Px—™fÍÛ¥ò‡ómÇ=«ŒÜÓ€.ÛôË±íeÎ YA+¡vU}J+6|À`h”ö$~é…¬·FHìH­xª¾Ž\nYÏê\rKv	Ê™=ù‰\'ÛÓœ0E‘@ørŠy- «r4àzO$6†€>#Ž,4°c$/Í)È1g©•<¼®üËƒã}O,cêf<‘ñ«¡‚ÕlxºÙLÝÊ\r«Yé”Ðí§çæS¤ÚA€UèSÉY¸6NVÀêßà•ž LÝ@6Ì²rSšƒ\Zé`úý)Pv…§Ãîf™ÉRƒcõÆŽ=?ñÔ1§É]o±³ÌeËv…Ðøkì‹oê7w};n(@†Û	åJ¶\n¡ý‹Pk¥K?Z”Ä-ÃŸFe‹eJâ$-qEc–æí$ù—p·A¦­Í7¨•^e3LVÇŽ²÷7>ßr›:!o­|B3KÌÌ<ÝçQ­$B+ç0ÏÞow¯ªKƒfµ‚Ý8®¡°Öel#roLÊläèh/oSv\n#‘±º¥(Ø«U\nZ5CcÌÁ€ú\"þsý<#éˆï°ž‡ÌK +øf4¬¨\rèÕjüÆïÝ,„•ñÌ<±+ÌKžR\Z2¬FÀ4çê’§äJM‘`’yØX¡êñáúÌÀx¸§È—ø{Q—Rì2\0U0Â:{&<0\\VÎ )·.e“œ.9-º:©Íñ€ùX¬ß™XÓ·úHÙ\r/BkiÐ“P)Ô´Ï2XÜ}hò°	hdW:–\"A°Ý}ÍY8F^#\n„êpbxß\"Éûýuh}jüCðR0ä[WT’¡Ç-ÓÄBµVÇ‰XK8½g¹{B°&Ê–Ô@ÙŒê­ù`Ðh£&ªþ hu[,!´½DZmîª9ºäy‰}JÎå%?2„ŠÜÄª6Ô*[ BZ—ƒa~\nXè²KV æÚ5ÀÆ¬kø—Ó`ü_û…\nhaæa`Ã‘»ú!\n\"¸-*Ï†=øK¹]Ì¸¦Î‰j¨¹õ-*ÊÉ¸XÖ”ÃÞ;CY‡,.E¬\r}¡\nÎIhN‡÷\ZÜ[Oî0ã?¤D„™36_Ql.‚ñn8–;˜Ã)/*ûË€vÁAAEY·ÿ\0£Neùç½`AÏ¸ÁEÉ`ºçò[ÌýâfÈÎU*˜‡„\n¿61§*ú+S ”š‡´\"•#CÓQEQñ)<©vê…äÍK‡\'I‹OÜ~\0„—7c;¨ˆY”)û©ÉvJ_<ÀÆØ¡æ\nB€£(ê‚¨âR Ò­¦â]«Mäšk°Ô9óÑôÊáæˆAÚÈÜ§k‡9ùÁ´2¤I×c?ÜQÕ£02dµ^uÛ’]~‹ z‰^†ÊXÕ}ß¹l$Ý¶—?s((^\'©UºËZ»PQÝY(ÌcÜB­a‚ú	üG³Pm]u(·ŒŠ9»)¼Sæ•¼‰†œJüÖ’”Fì%BÍM0ïÜíªÛæ(Ø!ËÆiñ\0·6+\ZÍ(‘®ÌÞŸ™y/d(lX¤Ž¬yr\"Ø™ºáâ;Ø\r #’ƒc|\nB[B¶b²Ã¹zÂÝBSÛózM¢+º/2À/•=°+“eDÐ[p‡MýJ%	éMß&˜0uWØê5*m8”®HZì§I)WÍU£=S‰g÷¸<5\rþ\nÆN¹n(Eí«õ]n`dWœìôõ¬˜ ˜´s@Ó\0ž:Ö7f@ÿ\0ÌH¢&k2ðwiP¶8Ýf6¡/D»!·€¸iÝ ÑDÅA˜¸µo,:%.ÃüÅ¯þÀ[\n,Yx:¸ ©qRÉnVo›ÞeˆÕ„ÿ\01¯½+(1U`áZÿ\0F&Ÿ™ææV™lØÃÚ%\0VŠÜC«`Û\\¯©c{IZVám]–Ôõ•ûˆ% Ýª`Ù„O.œuOÄkü½IãRÙv>f\0£žËèÔá»ì¯ÔAp)XÊÆFY`­{3GîCK¬\'?Ì£	°á½~B]F¼B)TUB`ªo-ò€kmÏ>qÕ€T‰tìÕxŒ¶MA\\Oš—Åêpî¼×PTÍù›êŸ˜\0:UØ‡gI%\ZT¶%íXqaÑ1¬Ýgöå‡¨#O‘AØîQÍã,óCí*m—3Ûö4•@!úÑGæVVÔ@0ŸÇÜ$çè_†LBò¨éBh¼¹ÿ\0a}B‚äÏõ²¹Î5-ªGY/?_QÉedÞ®4S|º—üa’0è©bÔs—uO…€¿`màV2n:£®£iÛ/êeâìÃèÒŠz\Z.ÍqDv­âýuBSPDsÅW=GJÑœ±5w(|$™cÁJìa·G\"½ÅÓKóP¨lÒÍQqƒ\níq@\\o\r|Ê—#bJ@|­é—¥W	 î†ãÕn\\þGÅÖ±þQXN‹æåª¼AÂ0¯¨°µ–,mî/Ýƒ¶ ‰ •x`(\0×jDiý‚[•@@— nãUpMPÞ®š™Â/(UtŽ^Úâc\nâñ.ò½À\nâÎ£ò€ycgN Hdahóî¡Ü1ªÏÈ„— ++À0UêƒáA3[Ä^AçQiãÀàõ0*q\r†r×”Å‘eýR®”òù—7á³ZŽd\"µØÑó.ÎíÝ:êbÃs\\Í~*½¥]„í¨Ž¦‰tüj)a*Â2Ê‰à±þ¥’u)ç˜-²,TÆúðN;QiXm”ó|uWÙ_=±æZ¨Ð»;XE-s,¬Û\0Å2áHƒGEø\0û#@BeÎ§<¦>	c´Û*Ç„[SùÍÀxâö0PPÀ¢ª<[½x?š¢ÞÛ2Â\Z®šÏ¹X´òG\"n€pbrÀ~ê HY¡ˆd4] tÆ:/rûe‚÷èÅÇì­/ £\rüÀ—‡ºr¬S)ÒÅ—K\\O:ŸlÙÍ´Ï•W„Šdú€Ñäû‡$dªÖQ:j çk2œÙYI0¯eÝXCŒŠhðo\rsA1´\'›€ÀÎ«bUGÅFÒî²Ã)l8n¿È¨g!÷5\0³„ü\"6f^Oé•š:¿õ\rXäj—â[¬t0z·¼‡æw©BŸ°íó\Zéñ)ÅJ4?ql4òÄ]¤|Õ#5(\nq¢ÕŸ¹eè÷W‚4ÂÊøX~&Ar…GµWæ\rVVsÌµËüÁ\'trl±óZ—GØ»ÿ\0¼KÈ&óÇHfbckHÓùè^UÚ*úl€&\ZðA¤ä?b&šmn9(ê/ƒ¯ÝÚÍ±)^¯r¦¼M9ÌP„’¹!À8¶0—æ¡7.ÄRÖÕ6Ì¤Òâ3“®e¾¬È0“l|@¾€%F#ú!tF+E¹“Ž\rµZ–!‹åô­mëP”Û\\±R< Àù1ˆDªíœR˜‹-P Ù]/êh\ZÚN¡Å‰{TR¥èt•ðÎ+.ÚáQ žC2ÑzyŒ½ië,ÄYE°Xg\Z€:ø@Ñp,2ÔÑâ,©jÈéž‚EŒ•‘Îw®¨Õ\r\"ºº¸‰\0ÂyCR†­Ž¥h©,ÞËÇ$—}ÛáÙ.†\"éâXeiâŽlÀ½pšEY]S¾cx¦­¸yŠC@â8Š\Z/Ô]$G…\rŸó$8Ã/AÎü¼<…¤‚¤z©bœœDiá^#}±)²Âû¢}Ä‘Y“¨Ú¬‹ÎÐìYêP,:£†øïÖu\nÄÀ´…ñà4c¸DŠ¹Ì¸€l£2ÕuVì¶þÍ\réP±\"¬Ô}VŒYýÌÌSÃ0D…`„®JUYn÷%ÒÙQ‚Åm%¿\Zµ®p>qˆ^R„\n# \nO¸L4ío—ó™´GªU£]+ÆÉØ™tÁ+¤ÅŒŸ	s¸à\0Ü,•	€×h¡úP¿$ÚÊ¡\'kêPŒåãqBqÅÆ~ˆX°½²—ª/\ržù€‚Ë.x•ü9šÊ¯”Ä38Ã˜LóŸ«æ`ïcMëžåfåœ¡Üó‘;‚…A|Z¬ƒ \Zâ¢Ôq“û³‰ºo0¥/ŽÏÊ¾¤©§< ø\n.ƒ¶áÚÉ‡2üA×o^éÉ2K¦Êª¿M£ÉâY+C\ZÕ±Áp¥@\0\'\"‡°oeCâ*&ÃË[ÞÍ_:–±h.±Ô¿†SGq>L£.ÁÒX^ë¸3G*yaœÐÞP¯în|s 2=ì#\Zsìƒkš]x½ƒ[—GÅChr<Ã™WŠ¸0Ö å>/X«žm‡ðôÂÒáÝ¯ù!Ê:„Ûín¾\ZðËÒb^‰«/¨–mSÃˆm*BÛó’é²À5c\\ƒée±–RúŽØèE;º ŽX\ZÄµâà¥+}Å2ñJ–^£¤L\0è]×^àÁþx	L\ržÈêZõgì¡gßž¸G]èrgÇ®!Â4W~Ü‡ø@¹GÂ5zø0¥|UDÔ=bÓÕ%œsˆÑÑmE(Ñ(„UäfßˆRQ¬a]i\rÃlÓ¡Ôub,‚fµ*óË£·‰Ÿø (ßÙ…½˜-\roÌqà«á–VµEÜILÍ•]A¥û\\.FòÌÌñÅ-_Ï™aœºÁø³gqÕ JòâUÍÒ©†âZM<U.î´üñþ},ÏØ6…x_<AµÜ–Tæ´e,sÜ³N»EfOÄu©–muå™G±!‘j\r\0k\na¸\rC%Nî%˜h¹[.,Ï0?—+eðeNˆú%‡mªºâWLVd¯á¥…/}F4ÿ\0%PþîPy n_¬ž!ðs´=Ìì¨ð°ÿ\04ž{\\@º;b2æpýEm66ÐÖÞ%?Uµÿ\0dtª9I÷Rš‰{~˜=MFJ]¦}À\\5ÇýÜEm}….…üÊAjÙáK	¸jÝp8o2Ñ6o£*y–I\Zù€ø´××=ÃR€÷A¨ª¬w¢RÙÂv_Ó\nÂ€]A8™^û‰‚\\+ˆx(á±­ž%ˆm¯¤s6:ÆÅ‘ónÝÚ…ÑË\\Àì\'æŠæ0´fœuªjµÓ‹ÏÚ^-=Ÿæa{Ãqß`€­¦ñ¶ˆ±@\00ÑUý°$YPÞÀm\n°É-BÇöaJ…Ž™{«çrŽäVm±ìkL_:Ûíú¬9”ëçÈ¤óŠŒPùÜ±ã!ö{-î\"´–£Ýçâ\\L¸¥€ŒÚàÍu¼ÇñB•Ú’46Æî®Tè8¿1³Þ%Á’ÖÂ,\n[„hôµ„Ìèâ\'9B£(4»I+ÊÁÒêûêVŽÖKaû&°=9•«`9¬A.[VFÓ”XÜµ4Ñp€YÛ¾7=ÍmNéø™)TÆðéñ+å!I]„Ü2AÝB(Ë]c“ôb×’‡Áp¡µ¥ÁÞ4€Ò×Ë;aøŽP½gŠ•0æÍÊmÐ\n]:£0h|kVÖG>\"\nŸ»S)Øì%‘ENÒ]îôž¡p„B•íâÎ,VÚ„s¢-—þÒœ‚üñYóí ð„ƒEnT¢ÑPoÝ†| Ûâj³Â¨Öú¦e\r=Fd€£I-Ui§Ä)\\ôQøÜ&¬ˆ©NY-7ðÇ:ìSØj‡Ìe-ˆÝ\n8+\rF¿‚ô@ªrÎ`µÏ¡2”Þ¹„õ&|‹Œ†…­QÄ°gkD^djÚu^_sAÌ*JZU+Üÿ\0–/ÃÔ‰9¡“0A©Š¼ÖªXo’âLŒòƒÂP÷°µ–\0hR>1ÌqðdÒåpUkÌ¦\Ziš–— ¨@îùFÇÖ£³æQèîcA‘Ñ{”\0\0Ì#ÿ\01ï¥2¡£B²¡WÍWäMdå(Bî˜.÷ÛF«`þ=FÓ×o•Xž 7shgÎaä”,W*KÀùºz–“ØÐÅ>¢‚xÄ]£•rÓj­«åmöÂaßIˆ#z`2ÎÂ¡˜(@„÷]Ùl³¯ãf1wv•j&*õ¶—›©B†³•‘a²ñP’¤,š\ZñjÂñK²«8‚0jôP²>”Ÿ©c1z<’ô{.Š¹aP‰2Ç(”\\eUp$Ã,c()¨‹éW`ó›ûŒ–ÐJ»ˆh°Só1¡ú11—½;÷\Z–U­õf%’õÅ06a’PðZù›~žT>Ü:|þ¦W¡æà¥\r–“¿Q£¶Êr¨9æ4.,iÅÓ¸xÛAõ·ƒ`6€µûjfÎ/ò?7Xº4_“ñT£Ü¬Û$¶½ÃÎ*U1f¿˜µK^†¯òÅ&¬Rz˜\Z¬ -ß0jm´f°Ê1\"ï’WBQ®a™Ëú&ŸØ!Â´À¾zÙýLyHMÿ\0À€š…ÞóÔuB“œ‹c¨ÉÛœJúƒ§¤YªŽy\nòÇYfõÔgÂ\rî8¯0ñ3Š˜¾œû¨°Tƒ¨•¡—È$µ”eKËXhÕ†}Â‹¤	ZÔí‘®–”SŽHÿ\0ìÍþ£þŠä@ç)|{DÏy¡ââ†@ÓYá{”Ý|&À£çÄíœ	R¹=Â9¸ª6½ñž¡Âá8]Ÿ‰Ç#µ?#exbmÄ\nÒyWODo²%ovÞx×\rÇ@‘DæûÍn0¼ 1ª¬Fg×oÄ`?CÉß’i*ÇûT*H™Ài2ÓÔ@±\0^z¹lh;õõÃÌµG0\\\nOaÐpDy#@cw\0ï-ÀÑ5Ä¥âfíÿ\0&Y\nÜ!êÌ>à\0Âå!ŽŠÒ2…%ÆyfŸ‘àåýîQ¢¨eJª|G;”€O¶£âK­)ÓTÀQÚM/jˆø¸nÞ;Šï4UÁòkDbH¤ÅnO*Õ÷•ÓäUå5©”¿Û”…ÿ\0QTÈ¶K¬j:_’€™	f&Ëg‹U_ë#“Û—ÜËpvôÇ0]VG³PÓ…™ [}²“g®ÖÊ_uš‰…R‡‡ËG7Ô”$1‹,¯¸¹\rme=•;Jœ]~ÁÃÏü¸ÓÎfPK±/4Â58%*\Z`º»¿ÔªA‰Êbß¨ë1DÎ¥cÔ°€N|KÉ²±Ó‹ë‰óÃŸ2äØ\0rÇÃ3ÜÔ^0hŽÃ“±û…d,†ž ‚hŒ©š!TðÆm\"Ô\nSÓuÎ¡~	ª±Å<D¦«´î•o1¨Õ=JGrª­„v\'WDPtÞÈ uJ\ZPs\0\0šÂa›@µ@d˜BZâó\0‰qošæhÍ0Ã»”>ÞŒ)Èÿ\0\'Ôà\rÓ$×þ#àÖ–Òó_3äÀ…ƒ^üfc7”a ñóFØuB<¸=_ˆ¶\'E(¾Ì¢…çÚ\\Ÿˆ{E¨qV÷!jò£Ö“²\ZÇ ŒYE\\fÂ†âØƒ‡?ûšÆ•JƒÐ,\Zàâùñª|—¸:ŽÓ<O¦S÷@!ò“X±ù d1<ê\nP)²ªÐñŒx‹ƒnDMøwBlMWâ.²¸×÷)„yµoñÓg\r¿Às¼\'ÜÏ”Bµà”‘Ô\\5Ùa8T:wNÕ#¬h¸çŠJa†8«Lù†€&Ö\0W …¨(ˆ¼›ÊQÁè¯9&åë‚Â›}Õ6××+€¢œÀÏó!Þ±š¿˜s2%‚’Ðþ‘*wü}JòÐÀ.†\neTê[JŠQÂé®\"Q¾€ñÅÚO–¥3©ËR|bl÷¹Eþv³8\0«ÎÓMé?!k\Z£—0Aê«j³Á-X¶P£ˆ§âÚÞ@÷MKPËM üŒîØS\n‚“%ðD¶øÙ:{™br”ïØ=2šYªQñ\röø,YUî\Z.lÀC!Á¨è5¾„£=C~a¡Å…±=%’HƒF{–³TŒáËPÂ$3}LÐÐ j×hÈœÜ3Ã>Þ\rµñÅäÉÁâÁõOŒrã0‹šï.æÜp:FštUæ8á`	ÁqHØŽQá.câÃÅ#¨„¬gšÛ»zÑ|Í/c>Á•†PaJmÔ´‰ŒÞ%e\Z-OÜBÇxmM\'R€ônò\\½\Z·atÏ÷@êygV8£¨$B`ï…	4Ú7Üzâ+ZUÆ™v€Ú?òî>žÉ	Å™¹l(÷ño¡ÅÞY^ŒE#EÙ`\ZµRÔQ±þ\rðÁó`ºöôÞ¼FJ3-˜†Â» ò†wY[§À(9ºŒ/\0ä‡8ÛaÝ\Zªð7,`®’Š¾nïÜ$v¦l:öAôÀht2Ï:Ù¾âØÆ&0CÁÒŸª’õÀ¨B¡Å‹Åõáø‹Õ-¾ Ì«z8XØIZ/4ñCg–¼ûæ1f4äã]8ÜºfBîñŒÍî\0×pÚD!dtÅœœh¥ªhòëÅÍ£úJ}²öFð7t5^Kó(Íâ3%Q¢1³ñ‘Jf«¸&%­ZÃg•xéhyªcÓÛS»VX´ÆÇ¸¸Q–W©‚HyB\nƒ‡p’ãá´+Ø¡èrºÀ® 2ðé”‹T‚á†=È¤òa÷/@™-e=¥%,b´‹v·^`B5Ô&Žá)™„—Ÿ[ñO%­Jé%Y‰¦ª^0Ípc\rA<Z_Ùü&ªË‹uL—VbZË Öæ7® ÁÍ.a£F\0@á¯2Ü…jVÍÕ¹bÒK¶qXŒoYRkðD«©É†\nìù@T•È4ûÄ\\Ø¥´_Œ/dK¥9êÈƒ#kqàx„i²ÌÅÓ\"Áw)L­LÏˆÅqØ<Xh\0µÀy•7T]ê¯Ý­¢B•Émù-EÏ8šù;ä[§Ã+p±b\røM‚E@<¤D-`¾@êŸç\"ƒš/›¼,í€D¥±xªq\Zrós*è,	Ô[²ddg)ˆ~c #U+Ñ¨†qHéŒ±ä¬—ÑVK†pìXXñ@Þ†\Zè÷î‹NZ“Ä(Å ²5+î•&F¹òîSjP³cá\0«˜à|ÁvF©|¶0ºaÆœ×d3H:]R\'¹J°íé‚JÀ5¾Øqòñ¢pÔ”z‚à_¶iZØ©³Ü[W±©Ðe£8¸é\nã.\ZP€âÔñ\0Òðm¥o\ZÁÐE!T|\n²˜\ZŒ4©c»)E\"^\"![TòUt@µõ-\0ÇŒq¸Œ¼/wVpeÅ\\€7G|A]Þµxè|ù€¯ijÿ\0bè!CZó²8&…[ÀwTù`.<à{Pa¤Dþ`Õ¹|•§XyÀ™€é’æ`a†éC‚)¿lÛnâpUc;¤.<ë`]Ð¡Ÿ6¨¥öÇÛnk£AÊv­N2~5¶ÕáÀ\\¼à7i?î¥1!=[þ#îÒ…ØpôÅÌ€åÖÆÈPØLc˜ëÂ®]9Œ\\ÄqxŠ”>Ùsˆ^Bõšã©}§U“å{J¼<ê³óÒ(î†±s¦„È1—5Lô»e1%*ÅŽl–‹Îu#jB±ˆ<ÉL¾? dLÑ`Ë—.eËkî˜µšÜ8‘ƒ«‚µ¸\0Ê.\rUçîàŒ¾RäczÎ2Ù\rU™e•r7ím²Ìq@×IÁÓ<ÌÉ-N¹ƒEÿ\0FÆË4~Êð£è¹·T–0_X™‘`\\\Z.Û˜\nIªÂ§»òrz”¯UøóÌ3s4¯OXß¸a³“Å÷á€?eQÝ6]=Är}ËB™a#Fâ¦ÉØã	Z90òåS‚EÝö}‘í¡Ž¯î$àÿ\0HxøtÇý,!nPƒ|hÿ\0Pä€¥7d`œ0ÄEzÂq€Tl¯0}‰¿‰fƒaUÆ™•-À#†Ú‚š¤9]¦EÝŒtúôô‡G¹_s(nÔ5¬µ\nŸ€>%ÏÛ7Ü ù€¸‚À­Ñn|î\nhÐ<> V•‡æ-Åta€YaÉÇ®¢5>Zv©îÄoÄSk#tâå8õìà—DvƒkÛàåšØÔPk…X¿Üxñ\"#\"¬&i»ÌT¥aØ8ˆJÉxŠ4šMÃÕ.Ç„!Pr¬kŠšGÁK¾«Ï cÔ«§˜VÑ¡`dÊá^j‹ñ’”¾Kâ\0½ªU½…Jûã?¤­zŠæ\nÎèó$Ó(Äœ.\"U@`ãˆ¹-¿’ny¢î¼ASœæ-³e/u	£K©jßÈFÚ([Š2¯9MÕÀ\ru‡*óð¨\rà`1óVË2å13]€\\¶¬±á‡và/ð‹_ü†‰È÷7©‘Šgc	‚UÆÊN,%æßu˜-ò„c¼~Ì®›Õäy?`G\Z-ØŠÄ]á\rör?õýÀ[-µ°ùI®ORž(\n¸ä‰Ùk‚Ô8(@(×Sˆ“—ˆÅmƒH$\Zs“Ü@¼#u\n\0waäx‚º °Úã7{Ñ¿0å“%Êb¥ªÙðþáßÙ-·Kù›A#CÂ°žª½w;8²yÙæ(F,Œj°‹¦1Ï¶Q¹§kÜ‡zeI½ |¥ÔáÞklÉâ±˜f­¿„Lº,Žõhø½ñ#`\n³Ý · ‚¹cÃ-ã?pÄZ*Õo^efp}æ+W,,&Ž9\0pÅËšF4\'¶ñÔnÙ×IÕFJè?ñÖ›BÏL4;MX|×ì#%XXã6.W¸\Zµ 8\0®lˆ­@³j°2ýGÌý+;¨gmY€{YYÕŒ {åEÖ¥´Pj]¼ÁA]YWª÷-eJ€E4ŸAwˆ—L–ú·õ/òÛ‘lFÙœyù•{W±Ü$‹[\\ÑQ]0U»†ªŒ.Ã7¬¥Dâ÷*‘NØæ‡þ¹,+üËq±§…•âxÕ…‚„‹Í¬Ž²AÈo,5qÈÄ.„Ç³ˆìS\"\rMÑö›Hj\n„œ¡+ÏêUÊ!=Å§¶z†h`Æ*­EkŠ§ÿ\0†¿øÎÊ¢Ú\Zc–¢\"Fêú—2<ï‹Ó)Ff…%ÚUQXM{•gã¢ÎšÌÑCÀ8}]]’ª¼¨œá†|Ù~´áÆæ¯ëÄ­\07¡mÆÚ\'v¤QÔd\0éSí«Ê]brº4(É›5)Q°T}L³||@´ÃÐ¶	ã™H€Ö×î¿™f÷Ô,àŽ,® ïE)â(—d~”(Ì¯Á\nŽŒQv£ÄÌg]:P¯ÙÅŽæX ý`m<£…LŒÍšÏEd|Ãñèl—‹B>Ë3#îãŠJ]–åÌ\n\n(+½ùÅ}DŠf­«WÆ ûj_¨<ƒ±uP\0nÜ¸µ¼±ñ^Ê4ååÇ¸î¤©ÞV(4ó\nVO„¥‹hKô Ìr	Ec5‹+Uî*ÊŒžÍNA—Z-Í7r=«Õôm—¥é›ÉŸ1]TÕ¥ãÌ£m»,íVÒ˜[kX]Ó,wôÉ‘û‰C@é+W{·´5Sq{VD´¼ä>†YîCÜ$\n³\Zò,æÏ¦`íR×’»„&E™ºs­ÐÌìo#ÁrlGDnÝ6›wqëüÃGcÙgêˆ1¤jºh+6pjž„]\nî­Ì¿ÒâÐôµ8Åb”y¿Ä·Rž»Rû<D#‡Ä·t¡ãwÖ¬,õ Ï°r¯,¼@\n¹ä>âepÝ[Y}áÌÀÕœÈép×ìN!ýD ÔÌnùÿ\0á©ieó7##mEÓDm-Ž2•p‰¦*ƒJ‰³K¹C<ŠÏÚi„Ê¥||À%<aOñ\rúÒ÷-Ý®Ä‡L110Õö•ƒQRôRçD¢P­Â¦PßÉ* tE¶$\ZYEBS}©4Ó*ÀÜ½ò•V-ãgÀ–.v9ê2 §?Kã«cM+7_³¨‘ÌqÄ½$^ã’+Mÿ\0ÄDså[þêóxÿ\0€îáÍÚ8)µ-HŠ…\n’Å_›æ\rÍ‘ˆ 8¨z¿Šö{—éÃµÌî¤K&z>å¨Þ²Ê®ü\\aÉ—Eü¿2¢öàë`‚˜cÉÁÕ¯™H(^âl&Ð] ·«2¡c ½§€-^†!åÎ¼Ósuò~¦r¤®þ@nu´d?\"QKèñðhqÍ2UâTBÅ^ãät·EC)7%ïê¡\Z¼Ž‹ä„èe³\0Ç±äÊÕg$.–ÃAªµËÎœ‘tÆíÐ£?RæÍŠ¦þ\nn\ZéqÐvù»oËÜ\nÖ\0`FNhúæ\0ò„‡fA§ÏbŽÔuw¡êËÌ Å®3€od)œÞÈ	»ñ¸V+­}ª\0C\\œÁþ1<,ª>žZc¼ÁÏ\\Â[IÍ›ù˜ŸWÎ[q*Šü´fƒ+kàHM¡Ú³+ÊeÞM©mØâ3µ\rÔp»™<FÀíø†(8ÏRå(Û[Ù‡1ÉOQ kN%<\"€h+¤ÓºˆýíTÅá³Ü³.^ŒxTb—?ÌR%vâ[-\Z)ýÇ¡|ÇýÔ\nÉÖ@/IÍš³›_ø–:-] ÿ\0)b…t¨·¡ß`‚¶;øaÖ@v¬V!{p8y!•þu%F>àSÖ	kX˜â±HXËõ¥lÂ!¢® _Êq£TJŒ}Ê…@–y}Ãï†3¢¨øƒ(<WjÞ71ü‹ðœúcU@ŽNÛñ*UZˆ¨äw´Ž*=,bUq-¸£·Yáˆ!œúLS‡Ä{¡hŠ®TœÇ iê’­ÇC.ÔŽvÕ^&`$µ(°×#x›¯qU;R4¥McLn6T\rã¯0ýÚÊg¡°äÛiçÄòX¼}ÂâDb«Æ¡8…Y`pÅË¦%€gôÂÀ<‰¦œ8þŒóšÛXûÐ\nêëÓ\0È¿\"ÄHBN›´!¼ËÖ!½û#-U(ƒÝŸ3ªš ù¸1Æ°©0tÌ®\0\\^+šÉj0\'iBGr|•‡& ìà‰(\n)½üE%|Ã¦z¡@*°˜ûŒ²f9çæ\rˆÑº “\Z‡sO¨`U¾ˆéj¥÷K+ÆŸ³pê\n@¾Ù]ëÜBØ\n4øƒ!†d¯îj®àUÛîeñÊØà¡Í‹39Ã)+&í…:ÎƒÌ.©o’e=2Ç!6f^TµO]Ì³#µíŠÛ‹:âÞl*Ããâ!ê7n²Ïµ7Mjw[(?Ñ\ZÉ£‰paÌRÚ§Úáú•³6s¨âdQïÄ³îíX¯Eœ÷A\n]f7lh8nàUe™[\"°RÕ)ä§*ëÄ:\0›«Ö¿‰mû!|²–@áfÏš\"w/	q›Jí…X…˜,38ªÔXtñ5œ#”¾ØâPAPÿ\0!\'–#PB\rÊÕKëL¯dM{ö€¹ÜýîŽz÷\ZmÀ¬t‡Nu5[ª7‹\rE`³`7%ë¥æõ•¾M\'Q@g\"y4Rì¢áCââ¥•(¾ÅeÅ\'T\\ }Xe¬YˆäÌ˜QÑö~3;zYWïd.æV»4w}5)û\\¾\nÌ¤”(]Êý51I÷Â³qŒzts5y*+¶	ÀJ“á2\\\"œ¦\n;;ŽÐC½èý€a\nÕ«ë-°5+f€UAoòZÊ·ŒJÄn-$u‡ýÀH)¦$µCˆ¥ì é{ž<ÆP1\"€?&HàqÅDUy¬T‘²÷Ù;™)U óß±qu“µ0ü… µ¯û@`÷º<*+À‹5¢Äy\n–|A›çº€xw-²Ÿ¥\\-•# k†eàßp!ˆ9ªb‚©UÈz}Å[oî\0(œc\n`.ŽcÞem\0[‰RÊõw(ç\n™c26¼ÅP-¢=ÆMËEXk)ªÎ­ L7ë²˜Dì`ÁO»Œö0Tâé†O0	.ÿ\0\0>?Ä¤QÁ”^?êe»Š_†¸›~L*w†É¢\ZØcÔ+„iÔ¹ä²B„uæ\Z)ªKg2¸®›¨¨\Z°ÀòƒÜJ¦R\0ü }½°¨üz,d?IWé½`äcaAzÐ\0¬ç‡Q!É]›•ôXÝú9‹á´¿Š„»…Dì¤£`…?0¿ä‚nœ^‡º„»i|—À9ÜVæˆà³j2zÚÁèš¤Ô¬ì^EæÜCYV%\nÖ\Z*]Ô6Ç,UŠ°	K<²ÆX„§º¹˜y¡Ó6`êÞeo_aÉÚå–Œ%^¸]@íäó[žÂ .£º¶°f¸ §(Õ·^\"!´Ppó/AÐ„Õ¨8pšK\ZíWhP	‹™FûhzäGÑYÁŠR™Š…½°!è¡ÃU€¶ï5Î¤-¤Ô|Ä	\\Qo©B30:¨æïŽØ²k‡ÅmêB•„Neß#Q™‰Gînª†WUýÇáD·VoÜ¶e†&\r?¶BÔæØ^Ð±JÔ¤Áo˜œP¨J•¯¼w›þ Chqê[)4¾jRŠ¢!46æ2‚×ˆí#f*,ÊrMr\r‘é‹°ý–ÁqWÙ-\'’8*Þš†B œÃðÓ&²Ð	¤o~%BM%3“_\Z8\\UtD¨Øµˆo~®ïSá8¹q€ß:X/Ž;›¥Áª=“?Pu¥1Ï$S§(í™\\°fÜª½Æ ÛEU–Kh±Ò‹\'Tqã€	Ö‘Óç˜S«,ÌÊ=ÄæX$è¨>˜9ŠÏ“†V@Ù)³0Î7·Š®›Y+˜°¬ðí…ÁŠžèã¨˜ˆØ> %Šò™–kx,LCµó5;8wƒ>%$½ÖàÌIª9AÂü°­Ì#wÓ 3*E\0»•¬†ºRôÁ6›^¾uóö¹Èô©D‹RÛ¿b~ÆòÏ+ÞÆƒ!iš¸ä\n™œ&Y A^Ú#pÏT†Ýoæ16âè7ñ!ÅMÝoFTñ=\0b=ƒçÕ\rtB8TÌ”õz‹\0|Ìå—‘ã¤Â{YpŠ_HŒV^£ÚP½×ŠâÃÞê2.\n/YÇó1ÝÂ£$¼Ð$8-Ä·µT¸0¯m<Þ11¡‘Ð©K§ŸŒî!Ö+\"ºƒí)K‚4YTQî#‹Ò%¯ª§âjÄ>#\"s`xÌ,ZÌÆ€fgZ~\"µP³Êæ½ eœZs½J3Ã›ƒ«bgÌeï¢[´](Qìî>–ã[R5À_™`Ödî½ ô‘;íÈä/S+x—½ÅÞ’{?áÈ\ráâeõ­g×¨Z¥P^a˜äÂ¿ˆÅA qjËcø†ñ@äéŸŠŠŸþ¾ Ù™Xf1“+sgÅÜ§ÞÕà†œ]¥Æë¯0jÔ¨úÑ	„Ö°Ÿ»Œu«l–·€¢zbŠjÍEê*7€Õ]ÔbL,hXê*Êw*àkNøcîiZ;ÌvQÈÁ”· ŽÎŒePi7\\éºÖïÖ!gàBïˆc´›¯Ly™:†«8F]zXÐpe»çÌY±„ÒB¨4\\\r4êÑ{–ú(\rÐæýFÚ-R²ÞÄ@Šd¢kæ=º	z9¯RîŽl£û‰yªœ`cÂ[ÅÀ˜ÁbZdt1£l¿Ù¯FeÆ *.JB»6ä,÷Û˜¹XÂ\nJ pV¯¯,ûÞÃöÊÂÂwmN¶©ïËfqAQÛuÊ)BÚälxižÚê†‚Ô_ÈG7Áp¼k§¨Ë—4¾8Š”ÅÑ·õ¶-g±<ö±iÂcù•…«¹äDžÐm¾ÑûŒ…6¶CÈñ\nGBÇ{~!Ž5PðýÊE½ZÓ×Ñ˜§õdSã@‰œw{î	D•ÊÊˆ«9†¦4Åÿ\0Ã4ÀDs\0`G‚==´ZöŒ†þá˜96ëhµ©›D5Sµ§+åˆûdHaé•²’ÖgÆÖŒO1Ž÷Užc¢9s2õ+°F\r±‘~cPA@Q~V4ªåV¨.®ÌBø>eÎFÏ§(õ]Qb›×óSkb‹ˆœKD¬®¨•\nSz‰Èù„g˜/LÞ°Ö60²˜2@ÊØs˜Ù¬ÐÍžp³É1A±@ºZæ88nœÕ£¬ð”ÁfÁ$¦T|‚ÀÓßq¼\'…—*‹ê zm­ã+ÚÝ7Ð`ñ3h“ÐS³³+õH”D¶ÄcÊ4C6W>¢#ž%Çï7Ž!þ¢70Jn«½ø—¼¾ZÆO$>‡;BßmÜ±	´±ýÊXêlœ›Ê\"è‹åzZÄdþËy…•‡‹GîP«Q —ò®#·¥\ró+¼´·+®¢éh[ˆ1Ç¨¹9üÐÞFËÿ\0\'}E7\0¿¢\n<ªÞXK0ÁH½hê[WtCNŸ	¸ºC*Åú0WÈEÁ)aE¡xë¨út°«³ÚøòDuW‡}=bzicû)áŠ`$B—Ã…„n‚¼0É*¡]@TÅQÖ%µmž4‰,¡ÑX‚\Z‚Ä€¡À± sý½ÏßÔdFÎá5}§sÀ¥y”‚Æ-\r«æîv§¸JE¦õäá¢b\\‘¤aüî¯»KÁ¹jHÚÄ<ÊÀÔ‰j ¼­Ðfm‚¤0o* ÌWY{I›¹W…ÑrØh-˜6ÈpÖEŒ	Ú‘~š(¿Y;ó+Þq†\0vN6—õ²³ˆ¡â¿dº\Z>#À¹Fq†*>ÆQœ(;â]PÇ`§/¤à9ªo1ü®BÓÜÅD®!r%S@åé7Ž¡\\¬ÕŒ¹“¨˜ã—+Œ²5;©2y‡õ<;ˆò“2„ÛÉ˜Ö\"È_:éñæjÞŒ\n—l¤=hµ(ž´£UG‚gÈ+áX„RR9”’aE)ã£Ô:ªÄ!9Ÿu.@ø±34²sG(•[LGwöµFL†6˜/3V,«Ð0¦·pñ®1A±aÙIm.Ï7P®K ¥O˜Ž$rú1¥1WBdór×K\"Õi¿ÈmCÄ¯ˆîú\'+ðü¥%¼b‹¦ÖÞ€V\';ë7€Ab ¥u)2a†ðÏÔ\Z‰Eö¯š…àºZc ó’[Û\n( Â¬õNb¯7#k7\"§ É«JH|îþ \n¦€O¢lS¨ñ`ô0ÚÔ‚ÝÛÔ[ÁŒX2Y«%¬2û®Ýñ2j¢Øùÿ\0È±¢ÀäXÛi­Ÿ@ \"¼cqìÍdÎªf5¥ô)d‚¾áÀ‹e÷þbx¡?™`óøÊ=T§eš·Lè‰/Ÿî7ˆO\nVLµm^\0?-\nÊàüHq!/èvÁ–zw—üÊrt“\r¬»Eˆár‘²¬{ÜH_À€É–ykÞB¸¡g’½Ð]Ó—|‰Ô|qÚ­ô{˜þH«”Ð£ˆHÑF°ºó)™œ_D¿Ò»nÙÄ]CÒn™*¾ØUv.[‹î“ä«¿¸5Á~IQšå£QÛS¢p8¹€õ°ôžá`‚ùwé—-ºl	Hõò«£§OR‹pê^#³ÄLC$ª±4^!jmT\r·U\rKÒ¨¡Š\'Ù¯¸ð€c¦ó|ôFLãÜ14lxHQMÿ\0ÄØ»Âƒñ\rÃ®\'¦“3¤ñ²3´6¡ìºClmOX=Üm_(Fî£‹(x!AGD±Í\Zr÷Üz¥HåÙ&]Î.^!“KäPý¢,É±Cž“¥€%I:`´p|Œ.=^|Çf²\0Ž×%÷\n™0´+o,$\rRèí²`¡h*ñaÃµ/¦‡+N>2^ámMÈ›?!™ìzêê€ðœV¾&¢ªÍüsèá&bŸ!eÝW°˜ñå¬SÓ@%1]Ñ£âç™†é¸:\"5ÆÇ¿ó.©LÛ:se;ŠTº¯‰k1£¼-¸€Ÿ!û\"ÍÑîƒòRÐ…ÙuLãPxz5í	ªa_5ü¼Ð_â&_Öî;R­S…Šøºƒå¦ê+á¤òFüÅ±ö,‰˜¤á)Õ*CÓA6ì¹y1Ì»0>Š¹žkA£ÃZOLEæ…ñþe¢©G_ˆ©ìe¼ˆ0ŽÊ¯Åû•ä2%\'ðê=²î CbtÀÊ«ONw.œâð°UÈ£\Zð§˜+av¼2àˆ1\0y©tw7[ƒÛK“ˆ:v…¤C¾!\0ÓOù†am“CÃXØqÚð<AØË™S±HXØ¹QdbŠ‰.V§E8R@¹´ß1ý5ñ\n¢î\r%Ö\0™eõs½rÍ WNõðJv,SKˆè†v6¨nà`ü¨8D¯yôŽ¹çÄ´#%¦wE¢´Ý\rë¦(.6*äØ6<åi‚àW’Ð<„¹Dú´Ÿvåî\rÊÕ›PqÃÔÔz\"‘æR\0`·w}ÜzÁ£øø}M[J³¾‚WóLl.Ùl§£¨Ÿ´rÕµå¿å›air{kpEN(\n õ4QyWqmnXuNW²¯:4ÿ\0$¸éÀ:U~âmmb¼¾\0\n1æ¼/£ùkmN	àwîáD[åÒnFj”§Ì®‰yÈ¬ì7÷ˆ3åñC¸Š)÷pF¥VáƒÌ$Ð¼W\rÍSñk¿R¤–\nƒ‚±0›¡|S„ÑõËú%?\"Ðæ6ÇÖ™fi¾ß„ ÄÄÉá`ƒ;%s‹ÔÙŠ¹}ÇZù³4pÔÊ%}“bÐ«óqw{€ßÓµ•pW‰J¥Å¼ØòkÌÀlE¦Òy°­:Q;ÒUtdëæ.EUã|ÅK×QàHf{Q‘~/Í„åó3óŒÛ©Ó†µa´h® £ÊNÖPb†c\'OÈweÈß=G-ªpëŒ¢[ŸrÝ)!uÏÄ¸½\0ñ(ª@h¨fÚæŽ#”Õ»e¥Ù©­¸è–¿õKFë+~¡­lMé	 õÝQÃîZe‰¤§_êrm‘gìH\n‡Ãà§åÜzF),î#hW¨³8j©Q\Zw¾ÔªÃˆ#æfœ¹–y–ªÞÏLÚW}o¬Ÿ–?À³¥Å:„(×¬¼à½*\\]*Zùá7\':V»µ~fæú_8¯˜”ã÷gÑ‹®Z?#bF—µžVâzu /š¡Š2%.HùƒN®žLGÇ€åÓÕLÛ†½Ã¦AEtÈÿ\0Ù™O¤\'<JÓ”G£‚Äù8þb„tJÜ‚˜´¡VùŽ“X¦0}äÇgqµ‚ÄÆ²Çž£u	L\nqFôF¦‘Úå\"ãÀ\"°\0ÉYM±c°#¾\ZŠx/î¬2‚ë½ÄH‘€§±ñˆtPÍÑ~åˆ‡Ãdq¡°ç,M5Aâ7G«¦[©œÕ•à–Ö®‰fzú…P…P èfÇ\0•u3ÍˆÖf€>Åeþa–Ÿ:‹Ð´[ÆÔ\\èHË†ñ‡Ä2»HöâA5Vx0°¢úŠÑ…\r–´¸œ„»T’÷U\nÔ¼.¢åÈußÒ0¨Š¦2V0¦\"-)´ÿ\0qL€ý@ŸË°F‹ë\Zš€pšüqÀ=€þ¦&c•×Ÿp‹QÆ³âPg€ÚÖ1‹¬Ýw,P]ñÅåÒÃnHÇ6{ÁÖ\rˆÂ…J8ß0Ò£AË:ÑÝÃR@Ì[Tðá‰qc±§·™w_ó\r6)hîüŠŒqQoo¨1RQp‘ÏÁR‰/\ZîZk-Œ/kÌ¸Šùâ.‚©.­˜‰Žj¬ÜÚiÞy+Ì}ª+„T^ª+®hqý€æ6Â­‚\Zk6‡QïšS<?È‹ò©kÑ£í½4:X?îfKk&¿˜n05+!> €CçCVº½@»v_Øb\Z¥Nß¨#<=ƒs@×C¯IÏ¸¥]‹›ÒB\n`n> ®ª4u9±Uø—Ntµ—°Çßˆ\\tÖð[¢Æ{­Yq¡ÎåØÜ0Œ®k¦\0B™¯µÄ\0VŒG¸¤ØZÎ\"V…tx˜aÄkðÎ ½V.kÏ1éõm¦)¸Ì†Qc£³ÜÈÐxHõ>a”•3Ã{#ð˜m[ÎÍ[T|Ç½…ÞqâzhtW0¢j¿\n>Iµ\nô”7\\ŒwÜjº·×jÃÀ#±UtþÏ’ãe~2Š:YÍü¶<µÇ¢\n<Ò\ZÎúƒ¸•\rÿ\0$4\'ÄzJô\rç’úƒw­ñš†\Z™^íIRŽ–\"‘	üGyX3ñgeÎ8ÜN	¨f8B¯ÊœBv>+wr¬Kª(Î`1íâcIKÃRÁ²Î\\¸ @ÉëÖ „¨R¢S\\@¢ùeZi¨(¬‰üE-.ã%·8‰º\"-À_Çj¼G¸¬ª¹Ôž`\Zzc’ Vï1…aÛ+æ)›-	qyú™›o\"AT”>bÙ\"™¡åuê{OØOˆK&%¿%\Z[ª²ýO¢ØB{×È…Az»ÄÞ›F¹+“d!De­ÀÞ ð¥ùÂ ‚ËVn—Ÿ¶P5$â(G„&x9Óù‡Ÿƒ‹!øûGYüˆ *[À+_•+x¿CÜ¬]e7bs.©.‰ƒhSNÉhœXix–ö‚©q—5€\'Ôç>jUæ©÷ŽFi`-Z¸P|u=‚Ø€Öµ\0Žy<²`Ž¶˜=¾9y‰dzãÊ­æ¡)9ï%J´„ñ¹Hç‘p‘Çn»°ÿ\0&jšbÔ~+õ‰À6ºÚëÊ}!ŠvŠX-úþa£ò«Yçú!–ÔëŒJ¨Ò,(ÐWŠñ6ªû‡ù˜eXÕ\0h-/JP§ë\ZzÇ¹TÚ,!vØ£UU<ª®^T1•Ùé~C¨§q|ÁÀ#Ö®TfqäùÉg½[,øüC\Zª±Aoj£ñpKápwµó/8)æg†÷¨¾¸KPÔ¼TÑœ§‰#°ä2áÌfpW€Ì°ã¥5õW“º.9Òd6\'+÷ÆÂUú«™Ê^ÊÞ¿˜ýÛzÀÒ{¼|JË.Å>7~£Ì)Ìâñ\0ã\08Ë›‹ƒ`>æ|„ƒÃìcÈ·ÃÑ¢%q¾á*ïÔ«\\^ƒ!,-«›bTÍg—¸ƒT•ÌÔ\"l‰t›¥,×	_ÌÁ”û-þ¿/MZUÀ\n^¥\nxbŠ¡^ \ZáÖ\\\Z,=Ã@Àsoa5×xLçkQÏ:^ÜóGÌR2ýØ\\Q\0Š./)\Z$¶°óÔHb¨\0B^Wî(\\D{…vgE©8p³Äl6K Ë.¾¥V«Ø%…‡“b7)B:9)‹€K¹ù%b÷5é*‰§Ï#þo°È¸9ì”0¼jµÅhsg3XƒÓ+Ì‡-ùQç\nKñ2Á\n5~b4ÌÕRf91âk(âÖbyx­-ÁâÔQâ4¹#Lr°ïNàÚ›ñ3æF”+*=Á1¡ÀA<[U­«Ëi‹Ú\"_£[Ÿ~äL×K÷Cá² ï.hðK¸ðg&«¬TRTâtj½³yñÛ™t|$!<þ³\'~‘Eíhû|K†­cÃ¿ˆBŸDo)âÞZ¤g÷ÿ\0m¡@96/lmÙdžÐàX£›­ÊÝÚÒ‚ùÙdß•„c§P°¿#.p°¡æA\\$$Ð#¬Ëò²ïù°\"µŽ±ñ˜ä‚s€ÙûQ±\\ 9¸nF=ÓÁ\n²kY‰=ÈüÂCNEMüK\\ \0ƒèˆ„V,×Üµ3AÞgòæ.}ÓœBaE•¾_Ü§e5ŒÀµu´nj¥¿„x8{Œe½\r¨¢µø¹nb˜Ív°Ùró_\nîK‹†—1¤+(I\\¶¤D<Géa)2)ÞPÄR¬Îó»œpˆZ)ÁDW|t„šgœo‡¹ƒó%ƒñp\rƒ+™Î³yÿ\0Öc\ZUÈh—±q•[ÕÒú­‹µ‹*]9‘¹góeQ}“Kýõ5ûÌ[¿½ Å®nëý¾¥#©öÊš}[÷(»oƒÌtrRÏ]rwí¿¹e!_\'ô#ÑLôË)HJ&} –ÞO«‚Uâ\'%âQçÝSËÁˆ)0.¯ŽåÆdßÌ½N—\nÅƒ¹€®\\Ï¨‰1,(hˆÛ EPysôÆVD¶)ïÚa+Ñ,[ÍÆÊ·˜ˆ€\nómµóêì¾~¥–AUå)ou5Ž3ðL JJòA&>$b:ÉþµÐ|Dá°Õcâà×g](ýIl›`ùM@ §{‚tƒ+£0ÕWBÏÀö²‚¡º†£‹‰H‚/H_-ß˜VC<Í&ÆŒÆªš5WËÎR7Êg‘húü%Êg· âÅ\Z¬—´\rtAÀÆ¿Í¸XTÞ{÷3˜i()|&bX?ÁœÐÓù¨4+Ü^•X­óÝŽc¤:ûPK|Ò\Z©bÈÌmV¼Ç+DÜØñ]š	jTùYŽC’;nNÃî\'¢!è¾ÄÚÒðm†Ø¸nãêVWÍ];]˜)X,ŸªÜÖšÍîA³göR¡-Èw\r§y?âT¶º-\n\n¥ð˜ãÔ@ÄgTAu.+n0—\nñÌÑÁ¦R\"d N9†pQ~ !áeRÞ6msVÏˆ-Ñ´.enJÇêwJh<‹‘,NEžÄB¿\0‡•ÒµûZ¸Õ]üÃœJ”Tué³m\0þ&f<Vÿ\0Ö9gMÆ³ÕM?ø„é²/ø€ó\0õu©Ì—6?ÌprçPRÐêñÃ´\0óþ\",Âûâ8Ú‹ŒÓ˜Õ¥ôÿ\0™‘<*¿Üaµæ°ô±à ðƒ²V	5 MäSæ_<by6†GS\nîxê,o3à´§t¹ó9·k\rb>bÒŠoå†~ý¨{òô@^¶J¢,¤›yÔ>\"6?LÀ“Ð\nÏ²›£p_lÌuŽm\'à–T®Í÷kÊíœ8\"WÁ/\ZM‹õ3Vn\0¢ØU#ˆJø¦R<	TŒE‹Q»v5ïœ )(i´­x™‚Ì€©µèU¸=P\Zê®QÝ\ZX?Ìl	æ]Ú½A€¶€ê-Ì,Ö>àN»t]_RÍÜ|&kBå=> ,Þ±;¿Ã-K^±7Aý©uèy–¶ay[ÕååŽ1ˆ±¥s’9\\F!k°¸¢t>&1¨(dã¸ª¥-«+õäí`ðf¥à¨?Á,ÿ\0`XKÖdCT‹reFb/C(´\\=ã\0î,ùéýÄðKkvÄP«ÔZÌe¨‘žRäêæ™ »]Êšú \Z³}ÄZ>@Kî$g(:amšVÁ33úŸKoS¾jÜ]Î7C8ŠÖ[œTôÔ©MÏ2ôù“6kqÕ¦kpOwÜªô¾®`51«Š8ýÆ¥áîP_ês€íe¤Õ KÆã«¹—2×:\r1šfo|q3\nspÒ9XÜÒ	T˜-U±aû\\:Uqøf¿1!…{1+Âè¨¢ª†äošƒE)ÅYy@Ë‚!ðd´êêx ,¡îr0&Û÷E~ÒléS1 G*<aã>ÈYOÂnàg$æƒ_s^9hü`ÆÄ§¢ÑfÂ&uy !±£8#%÷¨ÄÈ_2Ù&¡YVŠØLô%v—dÁºÓW¨‘hÊ£zR¾ˆŒv¦ó/±é\ZÐSMƒ|16ƒT@íuz‹¦».>#,]á¢Ñ‚÷¶n*¦—eý[ñ¥ò #`z\0Ræ‚Çº=Ò{„|ösÖ#^b0Kô°{55,`eõý‡¸L`ü†ÑÚžª:ö„KE¯©›¬0D¯hC;»±BâHjºÃÕT:ÍjphÖ`<T—,\rœ8Ï²(/,þ;‚RiFV™Õ‚Å«%g’\0. šù–H	V7\0…)4ÀÜ°Wy‹4µ©sM{f•aÄÁÆP@i\0Æs3Â4\nÎc·z|‡Ý‹ÉÐO7(ÜãÌU¹ãqÏ2á–†p‡3,…µ–A-ê(s²0xƒno”JÐ6•,Tµ·Ü±Õê=‘á+æF¡ö\"•Õ¢Ô*ZqÊ,Ñy™Êš\'Sx?3™Vóó-ôˆÑ¡œÌÒúaƒÛcwI§±æÐN“ŒDa­\n/ÍGÀFùUT)>á ‹€¼7)0¾_-˜Ìþ\rÊ8/ÒÈÍñJ”{<£0”Ï†—êò&•,_D%ú¬°r+·\"ËøR¬lê\"*”š}Ë¦NÄ©f—·õ]+ÔêùÃ%0ÓÉ¹ž-¥§È²êeXÛm¬¢‡b²VX0•^Fö1 ´.À/#¨–œ6{=+Å~¨‚€\Zó†(€˜Wõû*÷7VvÌpl¯’Tø3‹îf’M@X·mD¤ØîÉSà\'›èÃÅÉe†a»)A‡Ì¾€(cpG«§lQtJ`®³jéF§úû&îÌÂ¡oU(´K*SµbÍŠxÔp·°K~#¸Ç,rÐ.(@y‹JzGìÊÛ“]BF7+êðE£*(³Bf«íˆFü&;daù\"l/F ªuLÎ4í8\\že­4íÏ‚%=‹ã3KE‚åz\\#>*,44e–fK3ve¦Ô;ËÀÞ£B *}Å+ÜÛæ\Z*­S4jãúC@*é•ŽkiÂ…·Ÿõ-=­~±…÷P¯~%ùøÓÀ®5\n±A^³Ä\"nÄ9Å/»…äÓÌowtµå-§þÌScGþÆ.Í¿ÐÒ*¢r]âhzqÈ¡ÀÇä,ÅR†F»‡”Ða[UÃ--SbŽäd‰EØiêb¢Àù€.D^”ÒíF m(Å3ÈÀ5ù9M×^£ ’PöJˆÓ2˜å¿ñp&\r¿HK‘PÚ‰~%Ù²ªV\'.[0õ–%áÐ§à(ËyñÈVµ&ÞBQhi)ÀÛå˜wzJs*öûÂ‚†.÷-úÀÚ%PÓî¥/RÔ%ÕÌˆAKÜk@ùoûŠ¶uæ2™ÍãÔ‘6CÙcûŠ£v·œKN¡¼©ú‡äÑ¥Sæß3<ÐÃæZbÙ«ö4[jž/‰¯Æ\'hŸÔ`½Úh_ÂàkîYhn‚¯âY5ÁýWäú\ZSIórÞaÇ,ù½Ê¶ú‹w`¯¶SGü¦[#ƒá\0´J¹Šƒ‡±¾VŸª +äù•’6\\Ú<\nJÊ’p8:¸ÛÝ*¿cðš,b¥Ê˜XUé\'Œ9 +SqQå¢]\n…øFhËšœ@Ø,ïþF-xÉ	°sBÈ9•K…ÅÛ¶åüÄ\nÃÊuEšVÎf²áÊ©ð~âü¢ÇŒ´¬ü™¸O™û‚íùÚ…˜+1íx	Q­®%HVš9Œ¤QpÊ;mÌ£I¤¶#¡,]ÜýKbÌ\"ØZÅ`ý?{89®%û$,}w)Nš`Ÿˆ¨ˆîyâ¢¡Š7\rð¨m0U/D(7áÿ\0Ø)¯ïøŽ\\È¢Ò\"Ó”©uª—½ÅÌjíˆCÂ51ý 8ÝØÈÌ@LòGjþ.¶ê‹ða°\0š?\0YBGÚÆGðÊa9Uø>™¼C€µé’ØFl¤8ÓW)ÿ\0TñCú\\¼-=@mþU-È¶ß™&]Á†ƒm†¦GÌêÜJGñö­ÎÂÞ&È?’^ðA“éc~aà˜\nV	r³è+C.©RƒR³«¿P×q\nÕ<Xø„Ê\n Z/i€îŠ‡„ ulãcAAÐS,(Æ(…Û/ˆ.4‚«Ò.a‚”Yƒ„ÕöÄOÚódÅ…Jå+á¬ìËðÕýËg¸ëC`b4ÉÊ”ÿ\0Æ³§™X\"é9Ì¡£–,vÜ+j•ÌZa¥bJý‡a`6¡õl—ŸD¹[x€Fêa\"Å¢£HÇ`ýS.8@Ñ÷À¼yˆ»(ùƒš=âÛSå†L~Æñ(Ü£ÍÃ4&\0ªù˜#ÀŒFz¢•°‚ê‰]s­ð¨oà\ržHÖ±\\nœ_˜QDÐ]á·9x UÃ&–ˆR£?ˆÀµo+¥á^#x%°Ýˆ²l{ŠÆ¹¬!onæß5EŽ‚\Zº\0¹B±q]Ì.† zŒF“%Ë\0ß¨± \r˜3[¶Y±¶T,R¨*ÞW¢Q­§(Êaîu„â~D]™±‘*¯ÉoŒ¤YòBºQÔ\\¾/\'Áè.LY5\\Xù†©ñEö¿€Uø%hß±BÀ˜F-2Â1]ËZÇPçWÙÉ-Ù¬8¡‡ˆj¬ŒÉÞÐÇÓx–¬ìþr§<DÙüÄ¸jÓGòP‘\røÌ3741\"nÇ\r6oŽ©:³2ÉsHF¦¬q¤ÔXg‘%ì†O6êãMvœÅÙóˆ¤¶ß›%€uZŠ¶é¹bÛ\0ñ)z®—r–PzakGæ;deTËR©w6§ÂË0\'Ï¹bVfãîõm¢B\0d0BÜ0ÄÅ\r˜|ÀÀ\nÆ<¥’ðZ>` fË\0üˆbð7|ÿ\0rîÆ@ô|‘Á±ÕN&·ŠEb$ZÌæ4ëqz|Š™ÿ\0‚!¿Ü´anÈ¦!ì†‘ÌÃ#oXˆ4\rù–E*­äºáîÒ®*õ^\',-ÔÓši-sCÉÚ61Ñ<$«e]ù¨ˆ9ƒ_ùpvbPÇøÒ3¨YgQ“ŽÜñ­Æ´žq[eÌlAm`õÆÕçò69sžmö’•Ç!×êÝ‹*ã)þ	K0GY!²\Zª².‘AQü¨ç*ª&¨‡êÊ‡HL8ú„ÛÐ¥e@Û­‡¿h€ÁäYŸ&¾U_ñ)Rª·ÿ\0˜?Ä¶•ÖE†\r‰üJˆåeÁ9Ö12½N~RÆ~d :u\nqüJÑ ÍÇFf’íò÷É£5Y™“šv³°(YÃLr‚ø`¥ÀÉR¨¹&\0Û«*!=ºÄ\"°e¦®°3mŒ[Qm{Ü\rñ¦VB§Éd© vººef9	l»¨ˆÛ^M—Ê5Žä^çfe­^rJ]­7	Tp’Ê`ëB£Ô\\Œ“ .¼æ¥ÑÂ.‰Á¢à’Àmg¤ŽlW¦r™àîÚ³m¹ÚÝÜr%–¬“»ˆí}¥Òñ{ŽZýç)–î9V·Ê´!\\”ºž*X¢è”ÀF˜½ÊåchlÂªRO\\BCDÌˆ5â-Ž#c¨]CñýÃ´FÃ2ƒÁXú \n‹&Œ¬÷ÌýŒnm£€=YX5b\"ü„Zj¨0DQãTÍ<ÿ\0óËÔCgÂàÁ¢ãý`î¡°øLÔ9Ê…rh \'É[-0Î#”ÑÅøe†\'ˆˆ}S÷qÁðVúIj\n·&¼ÑW­C{€Ì]MaáV€uqcÈÒ;[Ÿ¯t½RãŸ¹oV\nÑÙ’!\'MÀõ¾ŸsN¨eyàÿ\0·z²ëGÜ£ rªÇÜªErßáŽ$Î–ÑÔÈƒ€¥yLÔ¾‡r\râˆ\"dÌ¬µ	Ù¥ódANï‰Ið†þá 4Ð`÷Ü¾õ{Ìâð¯Os\Z`Ùîñ)rŽ¶WB¥llÑî3…9óÁže£râ˜íd{#UZL.%ç¢\'¸uVê9CX§¸8˜jÞ\"1tÂå½W¼9Gš©QèûHááÃWU°•?©gÀ(«xýŠ5‡~[`½G\\Ì¸³,Gr•Äsê>R–²öÇCêˆ÷D5åèó\n¥`NH+–¾!Ò°á©fRD>ÝæVçeô»W_2Éäè}LK•Ád¤–ðŸÊç\"\Zø…‹}±iiEçpTYWQÃV”9l~!¦;–>*üÜ°<+ŠL«˜áâ1–“rÁA”;¸ÞãoÕ¯_±mÉ[âA¤÷Ù›­Ók9=ËUfìqõ‚â¥_7[Š*/ŸˆúÉy6ÄÑ*¨QUDcT¥JÌ5StE\r–)ˆ®™5XUh5œÔæØCžˆÞ+Œ_ä³WjØX ¥z!æÂ\0RÔäÔTØ¤wN%8:lê\r¼Ï9•iÌ}&Qig¨rZ\ZbÁ‚nùˆUÀâ\'(J‡yˆw\n¨9¸XBÓæ_JI˜ù[»†!°t–§Ð0Ç x1è@ùB\nB2À¾\0­Ò›ƒÐqñ0öÍlrÐ„Ç€¨Ig..%Dx¿ý˜,e0y(üÊsætˆ„5¯l\r(rŠæ\Z§Yé•W*žŸÈ‰iÀTÅ¯8Ú¿Ë™J‡R@n¦2%Âh+*ï³¬©ˆ­Ç™S¨·pp5æaÃBdY€¯˜µ\0£>O˜[šJêVp‰:	ŽYa„ðÐqìªÇRÐP¬çÄU³¹ˆjÎIk)_\r–\\e8å]z\"E´ê:ÅÆwU*É îé•Õ?èÅcH«˜ú²+‹@:¿5ÃÌ\"ün\'‹È·÷Y\'sˆ)~4@ø;¿fç˜pš™iòñN;A¨P#ÿÙ',5,20,4,4,3,2,NULL,0),(1,1,2,'2014-08-05 16:45:09',6,'briga de torcidas',NULL,'-22.912611','-43.2301523',NULL,5,11,4,4,3,3,NULL,0);
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
INSERT INTO `perfil` VALUES (1,'Administrador','Administra o sistema',1),(2,'Gerente','Gerencia o processo',1),(3,'Operador PadrÃ£o','Opera o sistema',1),(4,'Supervisor','Verifica o processo',1),(5,'Diretor','Acesso executivo somente para consultas',1),(6,'Operador Master','Pode operar em lugar do Operador PadrÃ£o',1),(7,'Administrador do Cliente','Perfil para o cliente administrar o sistema',1);
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
INSERT INTO `pessoa` VALUES (1,1,'Administrador','111.111.111-11','11.111.111-1','1900-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(2,1,'Sidney Samitsu','596.278.919-91','18.740.470-7','1968-08-25 00:00:00',NULL,1,1,1,NULL,NULL),(3,1,'Marcus Sandin','111.222.333-44','11.222.333-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(4,1,'Ederson Juliano','163.527.038-36','11.222.333-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(5,1,'Alexandre Takashi','281.038.128-38','11.222.333-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(6,1,'Eduardo de Abreu','305.898.098-14','44.444.444-4','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(7,1,'Operador PadrÃ£o','111.111.111-22','11.111.111-2','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(8,1,'Operador Master','222.222.222-22','22.222.222-2','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL),(9,1,'Leonardo Cohen','442.614.378-05','66.666.666-6','2000-01-01 00:00:00',NULL,1,1,1,NULL,NULL);
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
INSERT INTO `posto_servico` VALUES (1,'AmbulÃ¢ncia','(11) 2014-2014',NULL,'JosÃ© JoÃ£o da Silva','(21) 92014-2014','kobel@kobel.com.br','-22.913885','-43.2304856',1,2,4,4,3,1),(2,'Bombeiro','(11) 2014-2014',NULL,'JosÃ© JoÃ£o da Silva','(21) 92014-2014','kobel@kobel.com.br','-22.911724','-43.231047',4,2,4,4,3,1),(3,'Policia Militar','(11) 2014-2014',NULL,'JosÃ© JoÃ£o da Silva','(21) 92014-2014','kobel@kobel.com.br','-22.913303','-43.228855',2,2,4,4,3,1);
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
INSERT INTO `procedimento` VALUES (1,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes gerais)','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada (detalhamento e recomendaÃ§Ãµes gerais)',0,NULL,10,5,5,0,NULL),(2,'Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF','Revista do turno de 12:00hs dos agentes de seguranÃ§a privada (Stewards).  Biometria da DPF',0,NULL,60,5,5,0,NULL),(3,'InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)','InÃ­cio do turno dos Agentes de SeguranÃ§a Privada no posto previsto no MD (12 horas)',0,NULL,720,5,5,0,NULL),(4,'InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)','InÃ­cio das atividades de seguranÃ§a pÃºblica e Defesa (Conforme planejamento prÃ³prio das instituiÃ§Ãµes)',0,NULL,10,5,5,0,NULL),(5,'Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)','Varredura antibombas (VVIP, Ã¡rbitros, vestiÃ¡rio das delegaÃ§Ãµes e campo)',0,NULL,120,5,5,0,NULL),(6,'TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)','TÃ©rmino de entregas de mercadorias (6 horas antes do inicio do jogo)',0,NULL,30,5,5,0,NULL),(7,'InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)','InÃ­cio das atividades dos Postos de VerificaÃ§Ã£o Veicular - PVVs (AF Transportes)',0,NULL,15,5,5,0,NULL),(8,'AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)','AtivaÃ§Ã£o das Zonas de Credenciamento (Zonas 1 a 9)',0,NULL,15,5,5,0,NULL),(9,'ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas','ReuniÃ£o da GSS com os Coordenadores e Supervisores da empresa de seguranÃ§a privada do turno de 08 horas',0,NULL,10,5,5,0,NULL),(10,'Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF','Revista do turno de 08:00h de seguranÃ§a privada (Stewards). Biometria da DPF',0,NULL,60,5,5,0,NULL),(130,'Acionar polÃ­cia local por rÃ¡dio','Acionar polÃ­cia local por rÃ¡dio',1,131,0,0,0,0,NULL),(131,'Acionar polÃ­cia local pessoalmente','Acionar polÃ­cia local pessoalmente',0,151,0,0,0,0,NULL),(132,'Isolar a area','Isolar a area',1,133,0,0,0,0,NULL),(133,'Chamar reforÃ§os para isolar a area','Chamar reforÃ§os para isolar a area',0,151,0,0,0,0,NULL),(134,'Retirar as pessoas do local','Retirar as pessoas do local',1,135,0,0,0,0,NULL),(135,'Chamar reforÃ§os para retirar as pessoas do local','Chamar reforÃ§os para retirar as pessoas do local',0,151,0,0,0,0,NULL),(136,'Deter os envolvidos na briga','Deter os envolvidos na briga',1,137,0,0,0,0,NULL),(137,'Chamar a polÃ­cia para ajudar a deter os envolvidos na briga','Chamar a polÃ­cia para ajudar a deter os envolvidos na briga',0,151,0,0,0,0,NULL),(138,'Entregar detentos a polÃ­cia','Entregar detentos a polÃ­cia',0,151,0,0,0,0,NULL),(139,'Liberar a area apÃ³s a detenÃ§Ã£o','Liberar a area apÃ³s a detenÃ§Ã£o',1,151,0,0,0,0,NULL),(140,'Cadastrar envolvidos na Blacklist do Sistema','Cadastrar envolvidos na Blacklist do Sistema',0,141,0,0,0,0,NULL),(141,'Anotar dados dos envolvidos manualmente','Anotar dados dos envolvidos manualmente',0,151,0,0,0,0,NULL),(142,'Acionar Bombeiros e AmbulÃ¢ncia por rÃ¡dio','Acionar Bombeiros e AmbulÃ¢ncia por rÃ¡dio',1,143,0,0,0,0,NULL),(143,'Acionar Bombeiros e AmbulÃ¢ncia pessoalmente','Acionar Bombeiros e AmbulÃ¢ncia pessoalmente',0,151,0,0,0,0,NULL),(144,'Liberar area apÃ³s serviÃ§o prestado','Liberar area apÃ³s serviÃ§o prestado',1,151,0,0,0,0,NULL),(145,'Procedimento 1','Procedimento 1',1,146,0,0,0,0,NULL),(146,'Procedimento 1.1','Procedimento 1.1',0,151,0,0,0,0,NULL),(147,'Procedimento 2','Procedimento 2',1,148,0,0,0,0,NULL),(148,'Procedimento 2.2','Procedimento 2.2',0,151,0,0,0,0,NULL),(149,'Procedimento 3','Procedimento 3',1,150,0,0,0,0,NULL),(150,'Procedimento 3.3','Procedimento 3.3',0,151,0,0,0,0,NULL),(151,'Ligar para o seu superior imediato','Ligar para o seu superior imediato',0,NULL,0,0,0,0,NULL);
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
INSERT INTO `segmento` VALUES (1,'AdministraÃ§Ã£o','AdministraÃ§Ã£o Kobel','../images/background/logotipo.png','../images/cabecalho/logotipo.png'),(2,'Evento','RealizaÃ§Ã£o de Eventos','../images/background/Logo-event.png','../images/cabecalho/logo-event.png'),(3,'Condominio','Condominios Residenciais','../images/background/Logo-condo.png','../images/cabecalho/logo-condo.png'),(4,'Escola','InstituiÃ§Ã£o de Ensino','../images/background/Logo-school.png','../images/cabecalho/logo-school.png'),(5,'SeguranÃ§a','Empresas de SeguranÃ§a',NULL,NULL),(6,'Shopping','Conjunto de lojas de compras',NULL,NULL),(7,'TI','Tecnologia da InformaÃ§Ã£o',NULL,NULL),(8,'Banco','Bancos',NULL,NULL);
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
INSERT INTO `setor` VALUES (1,'EscritÃ³rio Kobel','(11) 4427-7554','Sidney Samitsu da Silva','(11) 4427-7554','(11) 99171-7827','sidney@kobel.com.br',NULL,NULL,10,NULL,3,3,3,NULL),(2,'Setor MaracanÃ£ â€“ L0','(11) 2014-2014','JosÃ© JoÃ£o da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,4,4,3,NULL),(3,'Setor Arena SÃ£o Paulo','(11) 2014-2014','JosÃ© JoÃ£o da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,5,4,3,NULL),(4,'Setor MineirÃ£o','(11) 2014-2014','JosÃ© JoÃ£o da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,6,4,3,NULL),(5,'Setor Rio Centro','(11) 2014-2014','JosÃ© JoÃ£o da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,17,4,3,NULL),(6,'Setor MaracanÃ£ â€“ L1','(11) 2014-2014','JosÃ© JoÃ£o da Silva','(21) 2014-2014','(21) 92014-2014','kobel@kobel.com.br',NULL,NULL,10,NULL,4,4,3,NULL);
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
INSERT INTO `status` VALUES (1,'Agendada','Com programaÃ§Ã£o realizada'),(2,'Em Andamento','JÃ¡ iniciada'),(3,'Aguardando Atendimento','Em aguardo Terceiros'),(4,'Pausada','Em aguardo'),(5,'Cancelada','NÃ£o serÃ¡ realizada'),(6,'Finalizada','Finalizou a execuÃ§Ã£o'),(7,'Finalizada com ressalva','Finalizou a execuÃ§Ã£o mas com alerta');
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
INSERT INTO `telefone_util` VALUES (1,'BOMBEIROS','193'),(2,'DEFESA CIVIL','199'),(3,'POLICIA CIVIL','147'),(4,'POLICIA MILITAR','190'),(5,'PRONTO SOCORRO','192'),(6,'DISQUE DENÃšNCIA','181'),(7,'POLICIA FEDERAL','194');
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
INSERT INTO `tipo_equipamento` VALUES (1,'CÃ¢mera','CÃ¢mera de SeguranÃ§a','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0}Jb\0\0.iCCPAdobe RGB (1998)\0\0xœc``2ptqre``ÈÍ+)\nrwRˆˆŒR`¿ÀÀÁÀÍ Ì`Ì`˜\\\\ààÃ\0yùy©àÛ5F}Yd¦<^À•\\PT¤ÿ\0±QJjq2£]^R\0gœd‹$eƒÙ@ì¢ g ûÍ—a_±“ ì\' vÐ@öút0›‰l„-b—¤V€ìepÎ/¨,ÊLÏ(Q0200PpLÉOJU®,.IÍ-VðÌKÎ/*È/J,IMª…¸!\nA!¦ahii¡I¢¿	P<@XŸÁáË(v!†\0É¥EeP&#“1a>ÂŒ9þKXþ ÄLzè00ðOEˆ©20è30ì›\0Ã¯Pobô;©\0\0\0	pHYs\0\0\0\0ÒÝ~ü\0\0RIDATxœ…W	tTåþÞ›ö5“É:É$!²M„D+B‹(ÔªUŠ§Ðãi©r<¶O[‹V°­ÒÓ¢ui+âV­V­q!¨\rKÂNI&“É2[f__ïÿ,­öôóÎË¼¼wÿû÷û¾{“$	üøî­ßË½°ûÏ\"ã?¦UUH–j3šgÎ”ØÒ%×vT›×?ˆ?>üØž½ïµ´Ío“~òÈ/Q`+ã1n¾eíq{0Ý±ï“YlÕªÕÒXÊƒ ‹`Íê›$vöÌI$Âi,)‚`óæ/ÂáîHz#\\3æHrŒ’’Ò¹®ÆÆƒgÎœ€R©¢S	çôztvî«f®F×}Ö<Óöžüâ·[ÐùâK8x:„³gN£ÉÕÔÏúNô=6wîÜíÙ€÷~ÿq|½&Ër6|¤ó#BÞYww·pí5‹{]y.÷ø(´­NLÅ»^yùù6v	‹ŠŠÊ¥‹/{Û79&ìîZ466ÖÅïËØ²UÒiÕØûþ[Ðh4p”—ïà§[ñÈÖŸ\nì–[Ö:´E…vÜps^ÿðüÃèøøX|í\',›IU1ÃÝ¿‰½Û\r¥W@4A:?\rs‘¹e³Yˆ‚€çÿø{N4ZS°8”NA£Õ‚9ë®€Û=ˆóìÙqÌ²„Ó§Ãj+{dëáúžR^ž€áá4&£pÖT ›Máw;¶ò.ÞmWà•)..(*0ÍYþ¢¼ÍK8ðÃh4–møÁ}Ã	BðôÉ£ðû}¤œ\\“Ñ„Ò²\nú[Ýõü³¶D2¼ŒcL¹éÞ-)WC^}ùðÐ¥vRÉ4’©¤l˜‚MÂ;6Êƒ)ZçÏlØð#ìÜù¸ÀDQÖ­[Ÿz¿ýu„BAÛQÝìÀúµ·£Ï×ƒ¿>º:&âè \Z±\\	4¡ó0L8ÒÓß\\ÅI»ôÄÄ¸ét\Zz½)í$¥Z‚ÝO>„òâxâ‰¿âÁ{~m¢yé¬fFý((,¡Ì`gÎýÙ’%Ë^qSÊI„ÜY<÷š%´÷)Ï›h£“ê$áºJ”ã:ÕqZò‘N%aãeèuùò·57_µüÔ©ã°ˆV(ÆF )t¨Vëáˆ\'Á\\Th±Kpä•\"ô¡ÑÕŒ¾¾c;dßyçÍT*•våŠÕ±x,‚L&£Á“É‚˜(Ê•@<†ˆwNg¦×7aû£?s¹œÄ.•0•JÅA0ÊEQ0cmmÝfBüFƒÑdN§2÷ˆûõÞãGï9r$AÏ¤¥ÿÔÿ<à‡B¡P-X¸èwÓªj¾ËeMñhSá`Ðãñü¥·ïø½|ÕÏ?Ï>ÿcù\r«^Û|ÿÏ¿5tñNŸ:Šd2ÁB­ÖXNç¦«æ-ØtõÂE;;ö}´ñK¾¿qÓXeeUaû;¯ ž¢²¦dÚr‡ ®pFÜ˜¿pñ†[¿»îšÝ/ü©þr€+Ö¼OÖRøñ‡ïÑË!<ƒ¾ÁPY”P”y\' ÷ïû\0ÍÍ-uó[<Ýu ón¦QkÌw¯¿gIÇ\'íòË¥¥Ä’1”_™‡ÙÅV¼Ù~EE9L‹ƒ0N§Ã‘#‡¨\Zõw‘6°¶¶…»†‡Î#J`qŠNECøÑ½ëQVS‚ý§ÿ†j))hCÖ\0kÖH$,gž\n€<ï7ÌbÉ[:2r‘$@¥TÃÙZßT#gè†(åãÜ¹Q”XŠ!E´P˜2*Åääek¿•%â1U&“…R¥B\"‘„Z91uc}ÃXºâÇpÍòcÇcÛ¡°ð<…VYÞS´iÇÂ4ZÝ¥ú#NÒíwÃÓãGÐ¯ ÆGŽî™4ZTšµÈúðR *«üŽJ¥‘˜J­‰hu:C&“–‘ö³zDã$ðìÓ;aÑêaRy%Â†\"ÚR@.¯–/›Ë²¡¡Á?54\\qOé[­V#Ô{¡lò”&Tç£@Ì@ŸÑ\"íNãD¥ˆRu¹œ~\rÙÚáCÝ±öýpnëÕ÷ð—©¤”E’¦¬\Z¹)˜	!‹ƒ\rZá0òòl¢ª]‘×‚ã½GŸ`œÛ3f4ßß2gÞ£½}=„lRÄBßä8lV2&F‘/ê‘o¯Dÿi|}ÙJ¼ñÚ‹7ýzûCŸ1ñØ±#Û´-l®(¯úŽ{d\0e¨®®“$ŽO€ÚW$Â²åkˆþúÜù³¯~Aû÷Ý\\f/{iÎì–¿«©E\"S˜ VÆ½ ?¿\0Í³æ\0ÇŸŸûCÛè¨§ëKb\"/PÑ¥cä­7Œ……Kjë\Zî³Ù\nk\n¥äøN¼°ëém“““üE=«&H~¥ü÷á¬™¾fvKëæR{ùQÉx ò÷ŽD\".o<Ž \'\"ÊÐõ•N:ñ+2£þW|öU7©ƒµ\\ÿ•»‹KËjn\\y<î8¸ÿYoÜ.³Y~fåE¹Uð“/ª ‚)™’,QÉE+”––_ëºbÖµ÷?ð^<è½ö·n	ƒÿ3³ÙRµzÍ­Ÿ¬]·ÑŒãã½oÉÞÄwÇ/+†º£¼_˜Ü%xR\\iER&:×,ïsýçHrzÔ7Ì¼jÝûW­üö§íío/‰\'âÁ/$ÐØØ´~ÝžÊdR8|àCû8\"„ï˜›¢Ú²Ao\"6ùËDa0‹(°0ˆŠ¼!òºHŽÔ—E**A­Uq”“ÍR‰¸pþõiò,VgöêÕßñ•••_çvï•p:ko[´héSS!Nž8J™‡d¸y€Bj ÞMUMv|­njk1?Ž\rC×‹}ÒäeÔ*$\r¡cÍCš!í9K¨„É/’$¾|NRÙÕy\\*Ø2çª=ÅEÅW3[¾Íµ`á×~‹NÑxsè‘ÉÅwÍ}3\ZÁæ´âúÖë°tñ7e·\"…áîEú„¦Lc1d©A\ZMùtÕ\"28@óˆ*½’Êç’‚‚by#Ijè^BÓ(ÔÕÕï`õõ\r[s™lI˜`âÙe©žÔ£å\ZóáF“/aî¬JÔÌ´áôèÇ<~\'»{±pîtTÛš`žÓŒÃDÔaxi‡éä8\nÌEHø& \n,¤¢T†ì2Ü8?¨ð³\r†&Þ\r8£yÝxceDfˆéz]º>B÷û ÈHÄ*(Ð©|Ü~çíhi›‡Žö=xú·;h8È Aön·˜ Ô*\Z„VÍ4—Ç<“Ë˜U£Q3æóû?˜6­æNSˆlÜ+CÏA•ÉÐD‘`*·Àa0kˆI8Þï…×Cãú¿>%åä!—LËS¹”K¡TÃ`iîM‹ˆê\nq‘‘?%b$K³ÜGhô@êÑŒ4_¥“¬·÷Øeå•­ŽRGcˆ £’›‹ž¾&$)ß0š(@BiÃˆwEZ*‰†?’´›©D\Z\ZÞ\niŽ¯¶åÓÂä~‰¨€ÉòLÄü„‚†à¯ 9%‰©P\0%¥vè(þ€÷\\\'‹Åã>2ž;*ªjÔ»®T$“)øU GÄ)‚FI1â*ç†Ä\nÒõÃÈr°çëQ bÐdE(ãÔ~‚9¤É&K4p—¨ŒÅ¡SkápL“£¡Ñjµ¡jZ\"4‚tíï¸K–¡×;z˜ü{ö+ÖtÕÖ5éFÜáuËnWD2äÌ&IA(MVôdF)r¾€Š®$Á8µêŒB”í8—‰e¨¥år­ƒ!?5/\\®™()«¢V7æyõ•]sHqžËF4>1~”toj×öÜ´jçíNª‘oÒK\nðO\0Ê¼€Ú¸N&(ï—irGî|AÞh‚ç™þ¯¡ùš…½)rCþíwå¬VÞèjÏCÝÝ]>÷ìÎ/[q–oX«dì.—«éaG¹ãÇ……Å\"ñdd$~¤‰Ü ø×Oì3+–dï‡ƒ2xÄ+8k¡Ñé‹Fâ{÷¼½¥çÈ§¿üÿÍ(ýY‹ÛÌOú84T8*n«pTÞi·—Ï$&+T» 7!…Üx\"Lù™wðûD¶ä¨ÇÝýî?Þxòüù³¯e¸Ÿãá¯ZêË	ìÚµKxæ™g,£™~êZZZÔtí‰\'cÇ\"#á09…BÔ“¦­*¥Ê,ˆ‚:—Í¦}>_xphhŠzEŠ*ÀµÌçÒ1®!æ½?J‰ŽmÛ¶Í³iÓ¦Ü¥õþ\rÙžÍ¨Ö¥at\0\0\0\0IEND®B`‚'),(2,'Alarme','Central de Alarme',NULL),(3,'Catraca de Acesso','Cadatra de Acesso',NULL),(4,'Leitor de Digital','Leitor de Digital (biometria)',NULL);
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
INSERT INTO `tipo_pessoa` VALUES (1,'Pessoa FÃ­sica'),(2,'Pessoa JurÃ­dica');
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
INSERT INTO `tipo_servico` VALUES (1,'AmbulÃ¢ncia','AmbulÃ¢ncia','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0}Jb\0\0\n7iCCPsRGB IEC61966-2.1\0\0xœ–wTSÙ‡Ï½7½P’Š”ÐkhRH\r½H‘.*1	JÀ\0\"6DTpDQ‘¦2(à€£C‘±\"Š…Q±ëDÔqp–Id­ß¼yïÍ›ß÷~kŸ½ÏÝgï}Öº\0üƒÂLX	€¡XáçÅˆ‹g`ð\0l\0àp³³BøF™|ØŒl™ø½º ùû*Ó?ŒÁ\0ÿŸ”¹Y\"1\0P˜ŒçòøÙ\\É8=Wœ%·OÉ˜¶4MÎ0JÎ\"Y‚2V“sò,[|ö™e9ó2„<ËsÎâeðäÜ\'ã9¾Œ‘`çø¹2¾&cƒtI†@Æoä±|N6\0(’Ü.æsSdl-c’(2‚-ãy\0àHÉ_ðÒ/XÌÏËÅÎÌZ.$§ˆ&\\S†“‹áÏÏMç‹ÅÌ07#â1Ø™Yár\0fÏüYym²\";Ø8980m-m¾(Ô]ü›’÷v–^„îDøÃöW~™\r\0°¦eµÙú‡mi\0]ëP»ý‡Í`/\0Š²¾u}qº|^RÄâ,g+«ÜÜ\\KŸk)/èïúŸC_|ÏR¾Ýïåaxó“8’t1C^7nfz¦DÄÈÎâpùæŸ‡øþuü$¾ˆ/”EDË¦L L–µ[Èˆ™B†@øŸšøÃþ¤Ù¹–‰ÚøÐ–X¥!\Z@~\0(* 	{d+Ðï}ÆGùÍ‹Ñ™˜ûÏ‚þ}W¸LþÈ$ŽcGD2¸QÎìšüZ4 \0E@ê@èÀ¶À¸\0àA(ˆq`1à‚D €µ ”‚­`\'¨u 4ƒ6ptcà48.Ë`ÜR0ž€)ð\nÌ@„…ÈR‡t CÈ²…XäCP”%CBH@ë R¨ª†ê¡fè[è(t\Zº\0\rC· Qhúz#0	¦ÁZ°l³`O8Ž„ÁÉð28.‚·À•p|î„OÃ—àX\n?§€:¢‹0ÂFB‘x$	!«¤i@Ú¤¹ŠH‘§È[EE1PL”Ê…â¢–¡V¡6£ªQP¨>ÔUÔ(j\nõMFk¢ÍÑÎè\0t,:‹.FW ›Ðè³èô8úƒ¡cŒ1ŽL&³³³ÓŽ9…ÆŒa¦±X¬:ÖëŠ\rÅr°bl1¶\n{{{;Ž}ƒ#âtp¶8_\\<Nˆ+ÄUàZp\'pWp¸¼ÞïŒÅóðËñeøF|~?ŽŸ!(Œ	®„HB*a-¡’ÐF8K¸KxA$õˆNÄp¢€¸†XI<D<O%¾%QHf$6)$!m!í\'\"Ý\"½ “ÉFdr<YLÞBn&Ÿ!ß\'¿Q *X*(ðV+Ô(t*\\Qx¦ˆW4TôT\\¬˜¯X¡xDqHñ©^ÉH‰­ÄQZ¥T£tTé†Ò´2UÙF9T9Cy³r‹òåG,ÅˆâCáQŠ(û(g(cT„ªOeS¹ÔuÔFêYê8\rC3¦ÐRi¥´ohƒ´)ŠŠJ´JžJÊq)¡Ñèéô2úaúuú;U-UOU¾ê&Õ6Õ+ª¯Õæ¨y¨ñÕJÔÚÕFÔÞ©3Ô}ÔÓÔ·©w©ßÓ@i˜i„käjìÑ8«ñtmŽËîœ’9‡çÜÖ„5Í4#4WhîÓÐœÖÒÖòÓÊÒªÒ:£õT›®í¡ª½Cû„ö¤UÇMG ³Cç¤Îc†\nÃ“‘Î¨dô1¦t5uýu%ºõºƒº3zÆzQz…zíz÷ô	ú,ý$ýú½úS:!­·\rñ†,ÃÃ]†ý†¯ŒbŒ6u=2V30Î7n5¾kB6q7YfÒ`rÍcÊ2M3ÝmzÙ6³7K1«12‡ÍÌæ»Í‡-ÐNB‹‹LÓ“™ÃleŽZÒ-ƒ--»,ŸYXÅ[m³ê·úhmonÝh}Ç†bhShÓcó«­™-×¶ÆöÚ\\ò\\ß¹«çvÏ}ngnÇ·ÛcwÓžjb¿Á¾×þƒƒ£ƒÈ¡ÍaÒÑÀ1Ñ±Öñ‹Æ\ncmfwB;y9­v:æôÖÙÁYì|Øù¦KšK‹Ë£yÆóøó\Zç¹ê¹r\\ë]¥n·D·½nRw]wŽ{ƒû}žG“Ç„§©gªçAÏg^Ö^\"¯¯×lgöJö)oÄÛÏ»Ä{Ð‡âåSísßWÏ7Ù·ÕwÊÏÞo…ß)´ÿ6ÿZÜ€æ€©@ÇÀ•}A¤ AÕA‚Í‚EÁ=!pH`Èö»ó\rççw…‚Ð€Ðí¡÷ÂŒÃ–…}Ž	¯	aQÑ¿€º`É‚–¯\"½\"Ë\"ïD™DI¢z££¢›£_ÇxÇ”ÇHc­bWÆ^ŠÓˆÄuÇcã£ã›â§ú,Ü¹p<Á>¡8áú\"ãEy‹.,ÖXœ¾øøÅ%œ%GÑ‰1‰-‰ï9¡œÎôÒ€¥µK§¸lî.îžoo’ïÊ/çO$¹&•\'=JvMÞž<™âžR‘òTÀTž§ú§Ö¥¾NMÛŸö)=&½=—‘˜qTH¦	û2µ3ó2‡³Ì³Š³¤Ëœ—í\\6%\n5eCÙ‹²»Å4ÙÏÔ€ÄD²^2šã–S“ó&7:÷Hžrž0o`¹ÙòMË\'ò}ó¿^ZÁ]Ñ[ [°¶`t¥çÊúUÐª¥«zWë¯.Z=¾ÆoÍµ„µik(´.,/|¹.f]O‘VÑš¢±õ~ë[‹ŠEÅ76¸l¨ÛˆÚ(Ø8¸iî¦ªMKx%K­K+Jßoæn¾ø•ÍW•_}Ú’´e°Ì¡lÏVÌVáÖëÛÜ·(W.Ï/Û²½scGÉŽ—;—ì¼PaWQ·‹°K²KZ\\Ù]ePµµê}uJõHWM{­fí¦Ú×»y»¯ìñØÓV§UWZ÷n¯`ïÍz¿úÎ£†Š}˜}9û6F7öÍúº¹I£©´éÃ~á~éˆ}ÍŽÍÍ-š-e­p«¤uò`ÂÁËßxÓÝÆl«o§·—‡$‡›øíõÃA‡{°Ž´}gø]mµ£¤ê\\Þ9Õ•Ò%íŽë>\Zx´·Ç¥§ã{Ëï÷Ó=Vs\\åxÙ	Â‰¢ŸNæŸœ>•uêééäÓc½Kzïœ‰=s­/¼oðlÐÙóç|Ïé÷ì?yÞõü±ÎŽ^d]ìºäp©sÀ~ ãû:;‡‡º/;]îž7|âŠû•ÓW½¯ž»píÒÈü‘áëQ×oÞH¸!½É»ùèVú­ç·snÏÜYs}·äžÒ½Šûš÷~4ý±]ê =>ê=:ð`Áƒ;cÜ±\'?eÿô~¼è!ùaÅ„ÎDó#ÛGÇ&}\'/?^øxüIÖ“™§Å?+ÿ\\ûÌäÙw¿xü20;5þ\\ôüÓ¯›_¨¿ØÿÒîeïtØôýW¯f^—¼Qsà-ëmÿ»˜w3¹ï±ï+?˜~èùôñî§ŒOŸ~÷„óûpf*\0\0\0	pHYs\0\0CÒ\0\0CÒ¢P`\0\0­IDATxœµW	LÔÙ3ó€)‚Ž2‚Â–Cä²eD[$AÍ²Åµ€/<ÖU4PƒV7iTTDI”õ>0Š±)†zÁF[4Ú1ê\n®\\ƒBf¸œ™þÞß™éœ.MÚ_òÏÿ]ß÷¾÷½ïzT«Õ†U«V]¾qãÆFJt¸Q\\üa<ïÖ¸QOKABõ¢ÕòØ\0ñöö®çóùê––)7û£B1™èÈ>.W(>Ó3§iii9§E¢6¶\">>¾ãñðáÃy‹-’‘²²p¢R	‰ŠÄÇÿ³¶¶Ö¦¦¦<þü¹]ÍÊ¤8yòä>®\'—»’€€zÒßïI&O–“ÆÆ`nO¡P¨a€˜˜ûJ¥—žÚËËëy[[Ûª×Å•+WÎœ9“®V«ù»víÊMJJ*7c÷îÝß:t(oÃ¤I?q«“’oÞ¼9÷Â…»è´iÓš{zzü¸‰ääJîáØä¬Y³d´££ÃßâºþÓžgêààÀ„dßü˜S§N¤Çÿ:C.s#}†#ßRS„s«LHÝÝìwäÈ‘ýt2&«««ƒ#\"\"^2áØ„J¥âãêfµôÀðúõëÑÑÑß¿zõ*ÔÙÙÙ”+ÐÛÛëìççW÷âÅ‹08œžFGGë×¯?}óæÍ-]]]ÜjW×V˜AóÄÅ¥sJ_ßL0ñaÝ…–=~üxçååå¥1b24äh ÐšÝ=ëÍ3â­[·¦ööö*Ãžur\Z°¦NJåÌ1ä={6›®Y³æ$“ÂÎÎNk“Ø\nÅ/hQQQ¦‹‹K›‚W§eÞ\Z»tÐAúú<Ì™3GFuœ¼ ƒÏ¡@ÉÎ;¯r³÷î}N>|°3¬¦t\\ßÜ»woÆâÅ‹ÿÑÞÞlðä+V”ëÛ°Ü´S§Nm“J¥5¸¶Ö¦¦&Ÿúúú_eeeåîØ±ãÊŽøjÍ´=88è°råÊË°æÌóasçÎ}výúõTØ®Úx=5î°»E¹yçÎ5Ö”ÉþPUUYVV¶Î‚Lö}¿„ë¨TDˆß˜Pùeó»±±±Snnno»»»i`ö½˜¡·WhpN=ärœ¤v£…zÇÅÅ]»{÷îZÚ××çÍXÙ“¨¨¨§p*J—.]Z‚sýŽ ˜À)„ÜŠáaG*664ôk…£{öìù.11±*•J7XU%%ÑÑ2›ÛúùuÚ••‘ÐxuMMÍ\\\Z^Í\rZ‰œ6¡[;{öì—,h&Lhä-}öìÙ|®gì?ÝZ[…~´ñˆˆZ}°#ïß;©´Ó„¨¦Æ‹H$\\[,æþV—tûöíEÈ5õÁ\'æH”Ìô]øÊÚ’’’¯èôéÓ{333€Aø„\0\\½zuuzzú5Î›››Ã\ZëDAÌ\n1¡‹õMc³7ø#|š““ó-¤‚DE½4ß,¢§›½‰7644,#‹ÌŸ?¿f*„ÿK£ÑðØM¹ºº*JKKWmØ°á¯Æ4ñÀ)ùùùYXÇKHHø¾¿…„„4M™2eÈ|-²¤s]]]”Ëù=Žª„ç¬[·®ÌjmEC‚R	âËß!@æ¶mÛŠ>)¥HÕK–,yÊ>t³Ù’GLLLé›7o|`-ËCCC›m\n\0ÃôD\n­Â†ù8Å]]“ˆ¯oñ´˜ÓC(”“––@$rÎäUå=J`íM›6}ðàAœL&û-¬Oa\"@nnnê±cÇ2!i€X,¶P¯¬œ±­Vñ¬;åÅ‹³À?Ï××÷å¹sç¶¤¤¤Üá8qâÄúK—.maY±Nm•šÏŸXÜøÄ:Ÿ÷þðâZpc´²²ò×‡Þ]QQgØ\\&AD/%æ‰Z­æ¡œñÉÍûû§“ððD °¢¤$‘Ì›W‡<>„|¾WržU—á.µÁÁÁ?\ZŽŽÚ“·o½-˜4\ZJÚÛ?³:7:ê o\"¯WK$’n\nuH“““ïý×ý€2¿U¹?À0¬KüFkk«EPýzãÆ…(>fúûûwp3¬rq‘ó+@T#nÈ\'›\\y<5qvî†!ZF8JÇôÍ\'OžH¡ý466¶zûöí\'PZý!3Z hIdäsóBŽCw·y´Ñ¤è3‡HÔEššˆ››MWFÜwX½zõµƒîÑ¿DN#ÀObÔp‘NNN–ùŒA­¶}ò	®{÷îoƒšýû÷ïEUÛˆØShùòåwñ6‘ãu‘a¨RÍ¡Ñ°ÒÆº€ÿ™·ŠìììoP”oG$\\€`Ä®Ø4£Âùïi(•c¡….d®KˆÂƒåãÝ¹»¡Ò÷³¹¹°…+>Z^^þÅ­[·’Á/ÏxÞj2‚=<ÀçŽšÍšÙ‰ºÕÓÓ³Ý\nÁ\nD±6ktžäãƒ´ûEqqq\nªN”ãù………éúg«9¬\n ‡H$R¡@8Ê>ýØýû÷ ¾ßt‹‡Eùè)ãH.Ï—-[vñýÖ¾}û\nØ÷sÚaø7‡¼r]ZK\r}\0\0\0\0IEND®B`‚'),(2,'PolÃ­cia Militar','PolÃ­cia Militar','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0\0\0wÅ´\0\0\n7iCCPsRGB IEC61966-2.1\0\0xœ–wTSÙ‡Ï½7½P’Š”ÐkhRH\r½H‘.*1	JÀ\0\"6DTpDQ‘¦2(à€£C‘±\"Š…Q±ëDÔqp–Id­ß¼yïÍ›ß÷~kŸ½ÏÝgï}Öº\0üƒÂLX	€¡XáçÅˆ‹g`ð\0l\0àp³³BøF™|ØŒl™ø½º ùû*Ó?ŒÁ\0ÿŸ”¹Y\"1\0P˜ŒçòøÙ\\É8=Wœ%·OÉ˜¶4MÎ0JÎ\"Y‚2V“sò,[|ö™e9ó2„<ËsÎâeðäÜ\'ã9¾Œ‘`çø¹2¾&cƒtI†@Æoä±|N6\0(’Ü.æsSdl-c’(2‚-ãy\0àHÉ_ðÒ/XÌÏËÅÎÌZ.$§ˆ&\\S†“‹áÏÏMç‹ÅÌ07#â1Ø™Yár\0fÏüYym²\";Ø8980m-m¾(Ô]ü›’÷v–^„îDøÃöW~™\r\0°¦eµÙú‡mi\0]ëP»ý‡Í`/\0Š²¾u}qº|^RÄâ,g+«ÜÜ\\KŸk)/èïúŸC_|ÏR¾Ýïåaxó“8’t1C^7nfz¦DÄÈÎâpùæŸ‡øþuü$¾ˆ/”EDË¦L L–µ[Èˆ™B†@øŸšøÃþ¤Ù¹–‰ÚøÐ–X¥!\Z@~\0(* 	{d+Ðï}ÆGùÍ‹Ñ™˜ûÏ‚þ}W¸LþÈ$ŽcGD2¸QÎìšüZ4 \0E@ê@èÀ¶À¸\0àA(ˆq`1à‚D €µ ”‚­`\'¨u 4ƒ6ptcà48.Ë`ÜR0ž€)ð\nÌ@„…ÈR‡t CÈ²…XäCP”%CBH@ë R¨ª†ê¡fè[è(t\Zº\0\rC· Qhúz#0	¦ÁZ°l³`O8Ž„ÁÉð28.‚·À•p|î„OÃ—àX\n?§€:¢‹0ÂFB‘x$	!«¤i@Ú¤¹ŠH‘§È[EE1PL”Ê…â¢–¡V¡6£ªQP¨>ÔUÔ(j\nõMFk¢ÍÑÎè\0t,:‹.FW ›Ðè³èô8úƒ¡cŒ1ŽL&³³³ÓŽ9…ÆŒa¦±X¬:ÖëŠ\rÅr°bl1¶\n{{{;Ž}ƒ#âtp¶8_\\<Nˆ+ÄUàZp\'pWp¸¼ÞïŒÅóðËñeøF|~?ŽŸ!(Œ	®„HB*a-¡’ÐF8K¸KxA$õˆNÄp¢€¸†XI<D<O%¾%QHf$6)$!m!í\'\"Ý\"½ “ÉFdr<YLÞBn&Ÿ!ß\'¿Q *X*(ðV+Ô(t*\\Qx¦ˆW4TôT\\¬˜¯X¡xDqHñ©^ÉH‰­ÄQZ¥T£tTé†Ò´2UÙF9T9Cy³r‹òåG,ÅˆâCáQŠ(û(g(cT„ªOeS¹ÔuÔFêYê8\rC3¦ÐRi¥´ohƒ´)ŠŠJ´JžJÊq)¡Ñèéô2úaúuú;U-UOU¾ê&Õ6Õ+ª¯Õæ¨y¨ñÕJÔÚÕFÔÞ©3Ô}ÔÓÔ·©w©ßÓ@i˜i„käjìÑ8«ñtmŽËîœ’9‡çÜÖ„5Í4#4WhîÓÐœÖÒÖòÓÊÒªÒ:£õT›®í¡ª½Cû„ö¤UÇMG ³Cç¤Îc†\nÃ“‘Î¨dô1¦t5uýu%ºõºƒº3zÆzQz…zíz÷ô	ú,ý$ýú½úS:!­·\rñ†,ÃÃ]†ý†¯ŒbŒ6u=2V30Î7n5¾kB6q7YfÒ`rÍcÊ2M3ÝmzÙ6³7K1«12‡ÍÌæ»Í‡-ÐNB‹‹LÓ“™ÃleŽZÒ-ƒ--»,ŸYXÅ[m³ê·úhmonÝh}Ç†bhShÓcó«­™-×¶ÆöÚ\\ò\\ß¹«çvÏ}ngnÇ·ÛcwÓžjb¿Á¾×þƒƒ£ƒÈ¡ÍaÒÑÀ1Ñ±Öñ‹Æ\ncmfwB;y9­v:æôÖÙÁYì|Øù¦KšK‹Ë£yÆóøó\Zç¹ê¹r\\ë]¥n·D·½nRw]wŽ{ƒû}žG“Ç„§©gªçAÏg^Ö^\"¯¯×lgöJö)oÄÛÏ»Ä{Ð‡âåSísßWÏ7Ù·ÕwÊÏÞo…ß)´ÿ6ÿZÜ€æ€©@ÇÀ•}A¤ AÕA‚Í‚EÁ=!pH`Èö»ó\rççw…‚Ð€Ðí¡÷ÂŒÃ–…}Ž	¯	aQÑ¿€º`É‚–¯\"½\"Ë\"ïD™DI¢z££¢›£_ÇxÇ”ÇHc­bWÆ^ŠÓˆÄuÇcã£ã›â§ú,Ü¹p<Á>¡8áú\"ãEy‹.,ÖXœ¾øøÅ%œ%GÑ‰1‰-‰ï9¡œÎôÒ€¥µK§¸lî.îžoo’ïÊ/çO$¹&•\'=JvMÞž<™âžR‘òTÀTž§ú§Ö¥¾NMÛŸö)=&½=—‘˜qTH¦	û2µ3ó2‡³Ì³Š³¤Ëœ—í\\6%\n5eCÙ‹²»Å4ÙÏÔ€ÄD²^2šã–S“ó&7:÷Hžrž0o`¹ÙòMË\'ò}ó¿^ZÁ]Ñ[ [°¶`t¥çÊúUÐª¥«zWë¯.Z=¾ÆoÍµ„µik(´.,/|¹.f]O‘VÑš¢±õ~ë[‹ŠEÅ76¸l¨ÛˆÚ(Ø8¸iî¦ªMKx%K­K+Jßoæn¾ø•ÍW•_}Ú’´e°Ì¡lÏVÌVáÖëÛÜ·(W.Ï/Û²½scGÉŽ—;—ì¼PaWQ·‹°K²KZ\\Ù]ePµµê}uJõHWM{­fí¦Ú×»y»¯ìñØÓV§UWZ÷n¯`ïÍz¿úÎ£†Š}˜}9û6F7öÍúº¹I£©´éÃ~á~éˆ}ÍŽÍÍ-š-e­p«¤uò`ÂÁËßxÓÝÆl«o§·—‡$‡›øíõÃA‡{°Ž´}gø]mµ£¤ê\\Þ9Õ•Ò%íŽë>\Zx´·Ç¥§ã{Ëï÷Ó=Vs\\åxÙ	Â‰¢ŸNæŸœ>•uêééäÓc½Kzïœ‰=s­/¼oðlÐÙóç|Ïé÷ì?yÞõü±ÎŽ^d]ìºäp©sÀ~ ãû:;‡‡º/;]îž7|âŠû•ÓW½¯ž»píÒÈü‘áëQ×oÞH¸!½É»ùèVú­ç·snÏÜYs}·äžÒ½Šûš÷~4ý±]ê =>ê=:ð`Áƒ;cÜ±\'?eÿô~¼è!ùaÅ„ÎDó#ÛGÇ&}\'/?^øxüIÖ“™§Å?+ÿ\\ûÌäÙw¿xü20;5þ\\ôüÓ¯›_¨¿ØÿÒîeïtØôýW¯f^—¼Qsà-ëmÿ»˜w3¹ï±ï+?˜~èùôñî§ŒOŸ~÷„óûpf*\0\0\0	pHYs\0\0\0\0ÒÝ~ü\0\0	IDATxœ…V	tTÕþÞÌ›%³„HV–€Ä˜ 6UÀ}AähiR{êÁ‚Çc¥D{j¬jªjEmÕZh­k] Ç–Eˆ\n\"A@ÙbÖÉ$™d¶ÌúfæÍ[û¿—™qpúŸsçÞy÷¿ÿòýË½,\0†T\"mfµ…¿£E}û^ú†U°Ú×¯?}ö*|_`\"bbÖ]Ì¨©›=š\'ãów)Ç÷lÃ½/ÃÀ®º³fƒç›‹~{õvãÏ¯.ŸÊtYYéœ]Ý;×çeÞv­:©îFûr+¢Þƒ¹SòÊWU–Í	WÍS°ïå5˜²ðçHw~†¾ï`Ì+]w‡usÃ¥3nÅ\'/¾\r×Œ%äÞ¿Ð²¢ø›sµÐÝSÌÖ~Þo®T&\\0+yô³ûíî#ÿEÄÛ•Žô¡hõûä†Æ°äqÓ}x½ÚÙö>\"þn„}(zè#˜ò>yc¾\'ÖyÅUT¸ª ÆcX¿XæÖ½—)ÒE–š„C€4lïúZWoÑlÒáÿà¹ÉhZø\'´ïûÄ´ón²âèî¿7ò¦µÆddØÕs9˜^é€=•QS\Zy$_Zarÿæ-æÂXBˆæ\\¼ÐÅ,Þøäüþðúî{?Þ+¿œûndÓc‹Ø‡·ŠUºMMÓŠLè9ð‹ˆ­¬	_/6<»\0ÞÎnÜv½ó¥¿®e^J%€4™•¸¶y›4¡Y³ Tk[i¾û‘¡v$GÂpyõYN\Z)º\0‹2üÐÈÌÂúåÎ5Ãí_½.ì…ÑÈÂdðÂ^yS¼­&pñ2p…­Ñjgmß@ÂÍæBü–™ÇÝÇ[‘Œx‘Œúas^€H¯„à¾C(.1@ä-H†“p–^ek¿gSÜ’ËquÙƒµ.3n=w’²èÊÛ·bû««0±q9\Z\'Í\"¡q$ÂAp!7]Û¶á«{6ùæ1…dü‰þ§åÇÙä{M­q0WôsêçÙý<5ÿsô>[5+rLgÊÚ³‘nAE13eõç¬¦s¿,ˆµùá[¦|Y?[.¿û‰Y‰”\ZËí5•3÷‹6æÄ±~u7›Õæ®Ç\\¹ë256%+ª¦Û=\'ž…§}â!6?*Fßù…qDMð	8KlhùÔ£¼Ç ä–ÍÎ|þò¥KÊÌöIðvìE\"2Œ47.¢ø«”p‚‡ü©G}(>[N»\'¼}aIíÞ®„º™`¾™”„L’:\rQÅ‰BàOÉÄÝtéõ¡Á“¤¹œ¿«)¡Ø—‚ËŒ€\'NÎÏñëäþÛ˜Òo÷¯/ë;þÜ»¶£¢°¹.kv\0Ûa´©„C½¼±~º¥‰ŽÎU£²w7]Ó:Ü{„Ì\rÁY7¾ä÷0¥´²lGWo’\\à!	ÀÊ+Ëö¬êöëaÌQwnuƒ°éx|b/¢(=A”4£c ¦¡w”‘ŸÓd63’(ŽæÕÌØwlžT<@¨‡ ð:ö³(­U(ÿ”¹Ê g‚$‰j\\AÁÔjÇy=ÂÉœÉ]¯Ö“É!ð\\W>‚©³Â„É\\ŠT4\rW]7|=m0[»èäzO‰ÂÊæöÆ\'îb2\"¬_}Ø‚ïûãÊáþæ\0j\Z.Aiu-¸@J*¡üýnà32Š€Ÿzœ¦\"mí*aêºaSµ×h¾‡EnõcEOP=¤íßÏŒR¾ÆV\ZQÇæoÕkµ…ÙÈØy´žù¦š‹F±ÍPO)Á³Î\'P¶àó¦âÖ®0vø£ê@¡œ3Ó¨Än¬Œ&eÞ€BEÔžUáî·Ö:Ÿ²N™Øµü§Õ[¾>i\r„RÃP¦|\\³gØ/{£yöâóg×7Þ¹\\¯3!ÁÎ?Ï„g Ð½|ûÑœzf·/„^Q‚`7¡´ÊŽ93ÇcÙäq˜{I^sš™æ„ úò1Èõ\"Ê¹äÞAõiúôôuSÙçŸ|jÎkï›ÖZFÜ«ÓEG,Ð«×jÒ×‡L:!§‘€Í,O¿¼AY;wÖJèI/ÒøÎî++ª\\ˆ,‹1”ƒp§[ZóÈm•\rw¯›·€uÔ€1Ñ¥LŠCý”ïAdø?ü	Ô4•S™!’®PÌ*×ŒiVTô¿yK\n•ÿ¿$Ò©ÜådœåõˆEÂˆ;ÁE‡©\"#äuœP“éÎ`žè‡â÷Cå©WPÆÊbV9\r9kˆµ˜ì7Âp¦\\:\rÝ±Ðö@Ë³ë®¹Ñ÷í~ò6UŒÁ,÷ÓI‚Á\0{E,5ç‘ÒJyUô‡öÒµ1Ã2®˜Ð\ZÂ«ÕwÍg^!±·^=yÆÞG·\\_ºê™õ÷ý~$¢X‚µHpT´O”ÄtíÚKà(ñé÷ 2ü\r„è\0¤yN’xQ@Ü‚,2„„3,ýõ­•â†wü?Ëé;­Ÿk58æ¿¶aÉ†oXïm…I&RC¦â°+\nÌ*…%CW–·M2¬¶rôÇzÎ *Ù0h9@kžx&ðüwÝÜxô÷Ž=wZjÊ\rcØôÈyñÉ“ˆdÓà5å­Óôà¨ÄÀÑ(Æ93(›1¾!3¤Ð JÎº‚„Ö÷y ÍZ÷Öú§‘Þ“qz_Ì»X} ª²x©œV¬‘x™h)õQcŽè^™QÏÅŒLøCÒj†ö€áƒHâh¶÷S²;`7ŠLO}ó¨bV´¦œ\ZrZM’vô&„ ©üÔJfñ“+¸]ŽbËÄt’#a¼^VKîÆ‘$ìè?¾“r	m[ÿ‚«—=@‰çAçVÔþ`\Z¯*AYÍ4¼óøí \'žnDuùñ.&ó·½ñ¥}ƒR÷)e˜kÙP´ÓÒ¥ýŸVÁœ_7	s\'—ábß=Óè`QGïJ[†êjÛ‹\\³ùø¹5úl$‘±£°Ø!Ifts6\Zˆ¢­Ë]C8,ˆŠ¸bLÙŸ’…†d÷Oºƒ8IŸ_[¦mÌÜ‹*±æÜ,L`?Eãé>;$Er<cûË/£BÎFcjüÃiøØ­Þ<–çlMílô?»~ÖÐ9M3,\0\0\0\0IEND®B`‚'),(3,'SeguranÃ§a Privada','AmbulÃ¢ncia',NULL),(4,'Bombeiro','Bombeiro','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\"\0\0\0 \0\0\0ˆš_\0\0\n7iCCPsRGB IEC61966-2.1\0\0xœ–wTSÙ‡Ï½7½P’Š”ÐkhRH\r½H‘.*1	JÀ\0\"6DTpDQ‘¦2(à€£C‘±\"Š…Q±ëDÔqp–Id­ß¼yïÍ›ß÷~kŸ½ÏÝgï}Öº\0üƒÂLX	€¡XáçÅˆ‹g`ð\0l\0àp³³BøF™|ØŒl™ø½º ùû*Ó?ŒÁ\0ÿŸ”¹Y\"1\0P˜ŒçòøÙ\\É8=Wœ%·OÉ˜¶4MÎ0JÎ\"Y‚2V“sò,[|ö™e9ó2„<ËsÎâeðäÜ\'ã9¾Œ‘`çø¹2¾&cƒtI†@Æoä±|N6\0(’Ü.æsSdl-c’(2‚-ãy\0àHÉ_ðÒ/XÌÏËÅÎÌZ.$§ˆ&\\S†“‹áÏÏMç‹ÅÌ07#â1Ø™Yár\0fÏüYym²\";Ø8980m-m¾(Ô]ü›’÷v–^„îDøÃöW~™\r\0°¦eµÙú‡mi\0]ëP»ý‡Í`/\0Š²¾u}qº|^RÄâ,g+«ÜÜ\\KŸk)/èïúŸC_|ÏR¾Ýïåaxó“8’t1C^7nfz¦DÄÈÎâpùæŸ‡øþuü$¾ˆ/”EDË¦L L–µ[Èˆ™B†@øŸšøÃþ¤Ù¹–‰ÚøÐ–X¥!\Z@~\0(* 	{d+Ðï}ÆGùÍ‹Ñ™˜ûÏ‚þ}W¸LþÈ$ŽcGD2¸QÎìšüZ4 \0E@ê@èÀ¶À¸\0àA(ˆq`1à‚D €µ ”‚­`\'¨u 4ƒ6ptcà48.Ë`ÜR0ž€)ð\nÌ@„…ÈR‡t CÈ²…XäCP”%CBH@ë R¨ª†ê¡fè[è(t\Zº\0\rC· Qhúz#0	¦ÁZ°l³`O8Ž„ÁÉð28.‚·À•p|î„OÃ—àX\n?§€:¢‹0ÂFB‘x$	!«¤i@Ú¤¹ŠH‘§È[EE1PL”Ê…â¢–¡V¡6£ªQP¨>ÔUÔ(j\nõMFk¢ÍÑÎè\0t,:‹.FW ›Ðè³èô8úƒ¡cŒ1ŽL&³³³ÓŽ9…ÆŒa¦±X¬:ÖëŠ\rÅr°bl1¶\n{{{;Ž}ƒ#âtp¶8_\\<Nˆ+ÄUàZp\'pWp¸¼ÞïŒÅóðËñeøF|~?ŽŸ!(Œ	®„HB*a-¡’ÐF8K¸KxA$õˆNÄp¢€¸†XI<D<O%¾%QHf$6)$!m!í\'\"Ý\"½ “ÉFdr<YLÞBn&Ÿ!ß\'¿Q *X*(ðV+Ô(t*\\Qx¦ˆW4TôT\\¬˜¯X¡xDqHñ©^ÉH‰­ÄQZ¥T£tTé†Ò´2UÙF9T9Cy³r‹òåG,ÅˆâCáQŠ(û(g(cT„ªOeS¹ÔuÔFêYê8\rC3¦ÐRi¥´ohƒ´)ŠŠJ´JžJÊq)¡Ñèéô2úaúuú;U-UOU¾ê&Õ6Õ+ª¯Õæ¨y¨ñÕJÔÚÕFÔÞ©3Ô}ÔÓÔ·©w©ßÓ@i˜i„käjìÑ8«ñtmŽËîœ’9‡çÜÖ„5Í4#4WhîÓÐœÖÒÖòÓÊÒªÒ:£õT›®í¡ª½Cû„ö¤UÇMG ³Cç¤Îc†\nÃ“‘Î¨dô1¦t5uýu%ºõºƒº3zÆzQz…zíz÷ô	ú,ý$ýú½úS:!­·\rñ†,ÃÃ]†ý†¯ŒbŒ6u=2V30Î7n5¾kB6q7YfÒ`rÍcÊ2M3ÝmzÙ6³7K1«12‡ÍÌæ»Í‡-ÐNB‹‹LÓ“™ÃleŽZÒ-ƒ--»,ŸYXÅ[m³ê·úhmonÝh}Ç†bhShÓcó«­™-×¶ÆöÚ\\ò\\ß¹«çvÏ}ngnÇ·ÛcwÓžjb¿Á¾×þƒƒ£ƒÈ¡ÍaÒÑÀ1Ñ±Öñ‹Æ\ncmfwB;y9­v:æôÖÙÁYì|Øù¦KšK‹Ë£yÆóøó\Zç¹ê¹r\\ë]¥n·D·½nRw]wŽ{ƒû}žG“Ç„§©gªçAÏg^Ö^\"¯¯×lgöJö)oÄÛÏ»Ä{Ð‡âåSísßWÏ7Ù·ÕwÊÏÞo…ß)´ÿ6ÿZÜ€æ€©@ÇÀ•}A¤ AÕA‚Í‚EÁ=!pH`Èö»ó\rççw…‚Ð€Ðí¡÷ÂŒÃ–…}Ž	¯	aQÑ¿€º`É‚–¯\"½\"Ë\"ïD™DI¢z££¢›£_ÇxÇ”ÇHc­bWÆ^ŠÓˆÄuÇcã£ã›â§ú,Ü¹p<Á>¡8áú\"ãEy‹.,ÖXœ¾øøÅ%œ%GÑ‰1‰-‰ï9¡œÎôÒ€¥µK§¸lî.îžoo’ïÊ/çO$¹&•\'=JvMÞž<™âžR‘òTÀTž§ú§Ö¥¾NMÛŸö)=&½=—‘˜qTH¦	û2µ3ó2‡³Ì³Š³¤Ëœ—í\\6%\n5eCÙ‹²»Å4ÙÏÔ€ÄD²^2šã–S“ó&7:÷Hžrž0o`¹ÙòMË\'ò}ó¿^ZÁ]Ñ[ [°¶`t¥çÊúUÐª¥«zWë¯.Z=¾ÆoÍµ„µik(´.,/|¹.f]O‘VÑš¢±õ~ë[‹ŠEÅ76¸l¨ÛˆÚ(Ø8¸iî¦ªMKx%K­K+Jßoæn¾ø•ÍW•_}Ú’´e°Ì¡lÏVÌVáÖëÛÜ·(W.Ï/Û²½scGÉŽ—;—ì¼PaWQ·‹°K²KZ\\Ù]ePµµê}uJõHWM{­fí¦Ú×»y»¯ìñØÓV§UWZ÷n¯`ïÍz¿úÎ£†Š}˜}9û6F7öÍúº¹I£©´éÃ~á~éˆ}ÍŽÍÍ-š-e­p«¤uò`ÂÁËßxÓÝÆl«o§·—‡$‡›øíõÃA‡{°Ž´}gø]mµ£¤ê\\Þ9Õ•Ò%íŽë>\Zx´·Ç¥§ã{Ëï÷Ó=Vs\\åxÙ	Â‰¢ŸNæŸœ>•uêééäÓc½Kzïœ‰=s­/¼oðlÐÙóç|Ïé÷ì?yÞõü±ÎŽ^d]ìºäp©sÀ~ ãû:;‡‡º/;]îž7|âŠû•ÓW½¯ž»píÒÈü‘áëQ×oÞH¸!½É»ùèVú­ç·snÏÜYs}·äžÒ½Šûš÷~4ý±]ê =>ê=:ð`Áƒ;cÜ±\'?eÿô~¼è!ùaÅ„ÎDó#ÛGÇ&}\'/?^øxüIÖ“™§Å?+ÿ\\ûÌäÙw¿xü20;5þ\\ôüÓ¯›_¨¿ØÿÒîeïtØôýW¯f^—¼Qsà-ëmÿ»˜w3¹ï±ï+?˜~èùôñî§ŒOŸ~÷„óûpf*\0\0\0	pHYs\0\0\0\0Ê&ó?\0\0óIDATxœ…WTçþfvvéMŠ¨t$ÄÆ³€kô	‚â#ˆb…£ÉÓXòŽ%“[D%Ï‚ØbD£QP4ŠŠ\"R¢(eiKÙÝùß%xLÂ;ïž3;³ÿ?ÿí÷»wÆ$Òöq]8}‡*iA4S°“éÑxæóÏòÌË/[6E&¬–+0øù†Çðm±“„5ë7Š»·²½^žè»¯¨~É	Ïãáañ3\nM3Ê¸e$ˆ¼ÙÜ¼ÛÚ!ÍdèOv‹\Z^ÍjhÓÓ ð®½1H¡‡†ÁžÀ‰£Ðñà\r\r\Zÿ©m¨©Aë›ÐW€›3Üùài\'86Zc$»¾^nˆ%w~†½Rƒýs±û0sºô˜ð<ëö¯¢µ1\"3RñESl1lW>^¥ØBä8ð‚\0Åü›&®yv@Ã¥Ò„ó¬[C‹z˜u^?Ó\n¾2··³~ñžS‰qE¹Ñ¥±ÏO=ë\'­ë¸ÀÛ‹Õšé9÷ Ñháû¼xºèåÁ¬_+Í„-K\"®&ùS?BêSb`¸¢V‹7^Ãê…5\'‡A¡\0W«Â¶	«&,@¾‰Q~³°?5‚¤±DVÊ1õ\'g8¸iQðü\\J£-ïÑbu5*Ž™ çÁ/¨þüSœ)*F£K?FJ”r°6fãe\"Zãeï>Xéåž6yƒ+ôÔ2y{{£Úxø(x‹\"Xw[ðæfJ¤]·xë‡NÊ[¶äé€³	nâ„Ià<‡e/\0÷>@U¹!ÜÕËxãðÊúð‰g„Î­ŸãÑ¯®–ò£\r¸xìçó¸ï$‡“£	ºm¯ä˜LKµÚ–ÍbùyE\\“!ý÷¼L.ÇSrÁËV5ÂÕ\"ŠLôÐbÕ\Z6büº7´b½ŒÃ”«épâXs3øžæLø÷Æ\r\'Ö?+&)rJ{Nd^Ö¬y¸y!é‹GàˆÒ&U¯ÁùMDáÙTìš\0Å/HuµîŒØÞ!)3óØF&‹¿›¥ &ÞÃQ7ì²óíðyÄgëëã—¨(°£íø\\=¦igtféˆREÈ½|%5îóeçš)ÐÄdö¶­ØP¢ÁœúhpN¶°<Ü¡‹•HÐÓ¯Qëx”Î]x]ç“ ¨=ÓÍ“º)\rø\ZQY‡äšJÀÂœƒ5*{ÚA%ÐoÄ@Š³‰b3™M™Nçõîo•½¯æmt”•µtã¤Ía£Gõ=äâxàýÛ7‡ö¬,—£²œjÁB]î5,kyCËâ”??•Îät†øÏy\"Qà‡ÓC\"M7¸>yä,«¯—‰†FÚJ7÷Šmrýï¢OÅïûóûÂ»þî39 ­²$1NÒ§¦\ZçæYk«ÌþN–ãžÆº½p¶Ý»lô¤ˆ=Ç~<ð&;>ý$6íáÝP²œª,í\"¸ãGPhª…{=157&ú€ÙÙc÷‡÷_µµñŸ°uÇ”·Lføû-JÊHek×ƒíÜJaÓ@ŠT¾1—•ÝQ•Ò›Ü&°¤„‰C‡cÜé“¾;T-_­ŒþÏW:&gçÄˆƒ†\0‰ñ”DZÂ„Î¨\r;dlF“x¦´®«wªLÎw:Vž:²QqüD¤ø¯}TãP*ÁQÆ¶?,ëTWðøþn	.Õ(1)ù¶ÈeˆÒ’«XS#Ø%ª-B´ÃA³£…5\nÙ§²¢ÔF5Mø—B†!jS§kêà‹¦r“&ÃF^®ºÕŽ¶° Fd3žä‡ve¥ÖÎÕÃÃ€¸OZ\r¾w_.›‚ 0†¤ƒ2„8fà’…#â{»Ã2-…Ìâ;Ê¤ô¹±@&pLÙk-\r½\"Tè}…¡ß¦z¸yÃOÉ_á<í¿SB{±è-ƒŽC\"„×vöu=Yu®™(ä¸jµùe\'ñôÐ8hCB°”J }d<n¦Ž„¯ñ ¶ö-m/»fa¯ÂðÐ&Q\\\rž×9¶ .Ý§NÄåý.pß9íªè[Y‹ì†¾7ö¢4ñÜýÀ„ŽK÷|RøöTÜÚolLW‹­­ämeÇ¡U­E¯©ÓPõÙ§°Jþ	Â²èmù•i—P’·ßa€W·#(åüµµ³/‡F~“p|ƒÔ|’â 5Â](¼vEÔJMŽžBßÀpš0BÜ‘Ž\\!­/,Zº]¹}§V§Óæ˜CÓÍÍÇŒ‰Ç¨}\0„·nã‡£bÓVô_·\nèeÜÏî`@	ùÛìŒ©Ûw®úCí|°íûñë”õ_~}áÌ·b³\nÜGÁàïec¢•%°r-IÖ‚EGé²ùäüðUÁ;wmï²Š¿Ž‰ÝÄnÞ³8t}XÆµå†O-ÙŽ°”µ»º½9ûQÈÎÙûb¾þ3t…\'ï’Y¯žÖá“&-ýXÎ…ºæÞ·G9\r$äP¸¸A”\nÕÑ	h¨§LÕššÀQ&s”¬¨§ËÆµƒ‡VÇ™w;±ã×›;Ÿ=Ì{ñ¿ä]-r†ÂšàÙ›\"kªV×‹*^L§Ñû=°iþº °³§Áõ@B›t>¦ÁC—ìèï©Å×Uà¤é‡µx]eõqÎ½Ï>yUúFyâä0ïÃŸÄ\',SVþÖü?á·aQhÔo9»HÒÌ€Í_®±¬à˜Éƒ’Ðß*É#y†Ô‚Œ 9ß‡›YIé–JÊ›˜öŽ€³Ä7¯É7JÍÓƒåÚ…W­H\n8|4HU]£þƒ\"6®Î½K?^œéx$ÆZœ» Ã\"}šÄÎ%¯^ê,•ŠK\"é·­•áE˜\0—‘æÐ³ÓGƒa;*RÕ°/æ@öPý(\0©ŽŠ\niä{Sk$\0\nXò>±{g6Œß8aò¤±WS/ßÖ)Òã½ÞîÆÎ¶>rÀXtu×Þ&¦±d:%Ê´\"¢Tj(Ñ‘Sû°N#Æ0CÆ!võ0»<¼ø+UTôš9nžž€1\nC¹#Ò\\\nË™£3déWô®žéã;yŒÀ™\Z$Ï\rÞoxÊX40Ô¹œÑ%!H\n|Ùß·³ÐHÿ\"1·¤ë#ÂæÊÓÒu`‰{=yLöÖÂ¼HÐ©”;­Âç­\ZŒhÓ@9ÒÛó ÿä1D\n³ä]¦Gä,~ß‡³b„ÀÀþ9®¬t(“†+B’N’ìæÔjLµ´À\ZšÜ2¯\\Á}ö(¨´hPè-âV_Ûwò°4\n©ðE^Â&´ccÚ±^ä±GÕŠâˆtu…öþ-šÃ„ŽûDJ*‡÷Ü…ÑnnÞ†¹\n©ý…H1ïk—qNÑ†¦É<ì¯jhªácdˆ£l8ò¿¹^¦ÁË‡¿B¥2‡UîHÊ§4)±Ë€aW›\Z+Fs0,}\0›3I‰¿€…”wõõ¼ð ¼ü^›‰éx#‘ÉºB‘´lSÐ—‰»ÍPjPƒôëžè­çŠ~n®eÞ@à©,”GïÂÁœ\\XÚÛãQs	bÇÜƒ_3È6Á¦‰z·^†ê\\Oã–‘‘(=°mÎLÿÉãïfyu	mm­hÜ´h¤uøx\Z{hñcÑ=÷%Œ5íxõÝ6<¥ÉÕcA(ÎX&£8;¯æG@](ê‹kP\Zý‰a>Ÿ>ø?„EçÂšª‹uÕ›†>žƒ?¹?É7SÿçŸäLBÈßIêƒšn–(:Ïg!•\nÈ‡&Dó/¾EœGx¸ ýâý`š™¯K‘ý¤&Yp÷û;TeâéüÀÇÐ<\rk¦T‰ýRG2¿ß—­e|„nµ û~vÿ¡^£nù\\7NNÔiÂÕy,ÑÐ®7f<Öo„ï Áh¡zrPÖ¢ña\ró=Q[\\€VzWmMcÉËW0{Võ‚Eh\"$ÝÐ ;¯™6fTÂâ»JÐÏÿm f‘Ë‡OÆ]»“çî]¹™©y\\ø²Óç§‹oÞÜul¿onn÷6ºð‘{õèÙ{ù\n”,IÂÅk× 7o1<‹ƒ÷÷Ñ¡¤µ„À&A-•iç÷‚Ô\"¤ÎY¼0üÒ„Ô+3Ë®ÇµHË€xu}Õ0ü,â,†.9ðkúLHuO_Îº^\"U–ƒµæ9Ñ|l‘}ž´ïIøÃŽÈX‚û€zÎ\0ú‰Õ5ÁN4–@’³´Â£g%gÞÏŠ®+{Gv—M¯®¼²ŽnÒ³ç¨‘Öy^;­¤h†›c€Š2°¨m`äzø\rABÚÁŒŒ	5©Ÿ¨TÀÝÛà[¨§I˜áÞ·)ÛcPâæòÊ­g’Ïô#ž¹]ÈìR‘w)ûffÝætþï9ðoŠ™cÇöè?e¨\\6FVúü=46\ZqzúÔõž™ü’PøôbÜ7ò®^ÓêŒ¡ëÌÿ‘ó_òêŽ…\rÔt—\0\0\0\0IEND®B`‚');
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
  UNIQUE KEY `XAK1USUÃRIO_FUNCIONARIO` (`EmailUsuario`),
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
