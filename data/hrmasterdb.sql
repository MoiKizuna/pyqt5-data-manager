-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: hrmasterdb
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentNo` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) NOT NULL,
  `deptLocation` varchar(255) DEFAULT NULL,
  `managerEmployeeNo` int DEFAULT NULL,
  PRIMARY KEY (`departmentNo`),
  KEY `FK_DepartmentManager` (`managerEmployeeNo`),
  CONSTRAINT `FK_DepartmentManager` FOREIGN KEY (`managerEmployeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeNo` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `workTelExt` varchar(50) DEFAULT NULL,
  `homeTelNo` varchar(50) DEFAULT NULL,
  `empEmailAddress` varchar(255) DEFAULT NULL,
  `socialSecurityNumber` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `dateLeft` date DEFAULT NULL,
  `departmentNo` int DEFAULT NULL,
  `supervisorEmployeeNo` int DEFAULT NULL,
  PRIMARY KEY (`employeeNo`),
  KEY `FK_EmployeeDepartment` (`departmentNo`),
  KEY `FK_EmployeeSupervisor` (`supervisorEmployeeNo`),
  CONSTRAINT `FK_EmployeeDepartment` FOREIGN KEY (`departmentNo`) REFERENCES `department` (`departmentNo`),
  CONSTRAINT `FK_EmployeeSupervisor` FOREIGN KEY (`supervisorEmployeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `gradeCode` varchar(50) NOT NULL,
  `gradeDescription` varchar(255) DEFAULT NULL,
  `gradeSalary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`gradeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradepost`
--

DROP TABLE IF EXISTS `gradepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradepost` (
  `positionTypeNo` int NOT NULL AUTO_INCREMENT,
  `gradeNo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`positionTypeNo`),
  KEY `gradeNo` (`gradeNo`),
  CONSTRAINT `gradepost_ibfk_1` FOREIGN KEY (`gradeNo`) REFERENCES `grade` (`gradeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradepost`
--

LOCK TABLES `gradepost` WRITE;
/*!40000 ALTER TABLE `gradepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `institutionNo` int NOT NULL AUTO_INCREMENT,
  `institutionName` varchar(255) NOT NULL,
  `instTelNo` varchar(50) DEFAULT NULL,
  `instFaxNo` varchar(50) DEFAULT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `contactTelNo` varchar(50) DEFAULT NULL,
  `contactFaxNo` varchar(50) DEFAULT NULL,
  `contactEmailAddress` varchar(255) DEFAULT NULL,
  `instWebAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `employeeNo` int DEFAULT NULL,
  `postNo` int NOT NULL AUTO_INCREMENT,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`postNo`),
  KEY `FK_PositionEmployee` (`employeeNo`),
  CONSTRAINT `FK_PositionEmployee` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positiontype`
--

DROP TABLE IF EXISTS `positiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positiontype` (
  `positionTypeNo` int NOT NULL AUTO_INCREMENT,
  `positionTypeDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`positionTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positiontype`
--

LOCK TABLES `positiontype` WRITE;
/*!40000 ALTER TABLE `positiontype` DISABLE KEYS */;
/*!40000 ALTER TABLE `positiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postNo` int DEFAULT NULL,
  `availableFromDate` date DEFAULT NULL,
  `availableToDate` date DEFAULT NULL,
  `postDescription` varchar(255) DEFAULT NULL,
  `salariedHourly` tinyint(1) DEFAULT NULL,
  `fullPartTime` tinyint(1) DEFAULT NULL,
  `temporaryPermanent` tinyint(1) DEFAULT NULL,
  `freeLaborStandardsAct` tinyint(1) DEFAULT NULL,
  `departmentNo` int DEFAULT NULL,
  KEY `FK_PostDepartment` (`departmentNo`),
  CONSTRAINT `FK_PostDepartment` FOREIGN KEY (`departmentNo`) REFERENCES `department` (`departmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prevcompany`
--

DROP TABLE IF EXISTS `prevcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prevcompany` (
  `prevCompanyNo` int NOT NULL AUTO_INCREMENT,
  `pCompanyName` varchar(255) DEFAULT NULL,
  `pCompanyStreet` varchar(255) DEFAULT NULL,
  `pCompanyCity` varchar(255) DEFAULT NULL,
  `pCompanyState` varchar(255) DEFAULT NULL,
  `pCompanyZipCode` varchar(10) DEFAULT NULL,
  `pCompanyFaxNo` varchar(50) DEFAULT NULL,
  `pCompanyTelNo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prevCompanyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prevcompany`
--

LOCK TABLES `prevcompany` WRITE;
/*!40000 ALTER TABLE `prevcompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `prevcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification` (
  `qualificationName` varchar(255) NOT NULL,
  `employeeNo` int NOT NULL,
  `gradeObtained` varchar(50) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `institutionNo` int DEFAULT NULL,
  PRIMARY KEY (`qualificationName`,`employeeNo`,`startDate`),
  KEY `FK_QualificationEmployee` (`employeeNo`),
  KEY `FK_QualificationInstitution` (`institutionNo`),
  CONSTRAINT `FK_QualificationEmployee` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`),
  CONSTRAINT `FK_QualificationInstitution` FOREIGN KEY (`institutionNo`) REFERENCES `institution` (`institutionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `revieweeEmployeeNo` int NOT NULL,
  `reviewerEmployeeNo` int NOT NULL,
  `reviewDate` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`revieweeEmployeeNo`,`reviewerEmployeeNo`,`reviewDate`),
  KEY `FK_ReviewReviewer` (`reviewerEmployeeNo`),
  CONSTRAINT `FK_ReviewReviewee` FOREIGN KEY (`revieweeEmployeeNo`) REFERENCES `employee` (`employeeNo`),
  CONSTRAINT `FK_ReviewReviewer` FOREIGN KEY (`reviewerEmployeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workhistory`
--

DROP TABLE IF EXISTS `workhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workhistory` (
  `prevCompanyNo` int NOT NULL,
  `employeeNo` int NOT NULL,
  `prevPosition` varchar(255) DEFAULT NULL,
  `prevGrade` varchar(50) DEFAULT NULL,
  `prevSalary` decimal(10,2) DEFAULT NULL,
  `prevLocation` varchar(255) DEFAULT NULL,
  `prevResponsibilities` text,
  PRIMARY KEY (`prevCompanyNo`,`employeeNo`),
  KEY `FK_WorkHistoryEmployee` (`employeeNo`),
  CONSTRAINT `FK_WorkHistoryEmployee` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`),
  CONSTRAINT `FK_WorkHistoryPrevCompany` FOREIGN KEY (`prevCompanyNo`) REFERENCES `prevcompany` (`prevCompanyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workhistory`
--

LOCK TABLES `workhistory` WRITE;
/*!40000 ALTER TABLE `workhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `workhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-25 18:52:43
