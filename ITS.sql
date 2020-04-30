CREATE TABLE `its_tbl_candidtate` (
  `CandidateId` varchar(6) NOT NULL,
  `PrimarySkills` varchar(30) NOT NULL,
  `SecondarySkills` varchar(30) NOT NULL,
  `Experience` decimal(2,2) NOT NULL,
  `Qualification` varchar(20) NOT NULL,
  `Designation` varchar(20) DEFAULT NULL,
  `NoticePeriod` int DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `ShareDetails` int DEFAULT NULL,
  PRIMARY KEY (`CandidateId`)
) ;
CREATE TABLE `its_tbl_hrpanel` (
  `empHRId` varchar(6) NOT NULL,
  `empHRName` varchar(25) NOT NULL,
  PRIMARY KEY (`empHRId`)
) ;
CREATE TABLE `its_tbl_techpanel` (
  `techId` varchar(6) NOT NULL,
  `techName` varchar(25) NOT NULL,
  `Subjects` varchar(40) NOT NULL,
  PRIMARY KEY (`techId`)
) ;
CREATE TABLE `its_tbl_interview_schedule` (
  `InterviewID` varchar(6) NOT NULL,
  `CandidateID` varchar(6) DEFAULT NULL,
  `Subject` varchar(20) NOT NULL,
  `TechID` varchar(6) DEFAULT NULL,
  `InterviewDate` date NOT NULL,
  `InterviewTime` varchar(8) NOT NULL,
  `TechRating` decimal(1,1) DEFAULT NULL,
  `empHRID` varchar(6) DEFAULT NULL,
  `empHRInterviewDate` date DEFAULT NULL,
  `empHRInterviewTime` varchar(8) DEFAULT NULL,
  `empHRRating` decimal(1,1) DEFAULT NULL,
  `Result` varchar(20) DEFAULT NULL,
  `ShareResult` int DEFAULT NULL,
  PRIMARY KEY (`InterviewID`),
  KEY `CandidateID_idx` (`CandidateID`),
  KEY `TechID_idx` (`TechID`),
  KEY `empHRID_idx` (`empHRID`),
  CONSTRAINT `CandidateID_is` FOREIGN KEY (`CandidateID`) REFERENCES `its_tbl_candidtate` (`CandidateId`) ,
  CONSTRAINT `empHRID` FOREIGN KEY (`empHRID`) REFERENCES `its_tbl_hrpanel` (`empHRId`) ,
  CONSTRAINT `TechID` FOREIGN KEY (`TechID`) REFERENCES `its_tbl_techpanel` (`techId`) 
);

CREATE TABLE `its_tbl_user_credentials` (
  `UserId` varchar(6) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Usertype` varchar(1) DEFAULT NULL,
  `Loginstatus` int DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  CONSTRAINT `its_tbl_user_credentials_chk_1` CHECK ((`Usertype` in ('A','T','H'))),
  CONSTRAINT `its_tbl_user_credentials_chk_2` CHECK ((`Loginstatus` in (0,1)))
) ;

INSERT INTO `its_tbl_user_credentials` (`UserId`, `Password`, `Usertype`, `Loginstatus`)
VALUES ('1001', 'akshay123', 'A', '1'),
	   ('1002', 'yash123', 'T', '1'),
	   ('1003', 'arko123', 'T', '1'),
	   ('1004', 'hemant123', 'T', '1'),
	   ('1005', 'anish123', 'H', '1'),
	   ('1006', 'sibu123', 'H', '1'),
	   ('1007', 'sandeep123', 'H', '1') ;

CREATE TABLE `its_tbl_user_profile` (
  `CandidateId` varchar(6) NOT NULL,
  `Firstname` varchar(15) NOT NULL,
  `Lastname` varchar(15) NOT NULL,
  `Dateofbirth` date NOT NULL,
  `Gender` varchar(7) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `Location` varchar(15) NOT NULL,
  `City` varchar(15) NOT NULL,
  `State` varchar(15) NOT NULL,
  `Pincode` varchar(6) NOT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `EmailId` varchar(30) DEFAULT NULL,
  KEY `CandidateId_idx` (`CandidateId`),
  CONSTRAINT `CandidateId` FOREIGN KEY (`CandidateId`) REFERENCES `its_tbl_candidtate` (`CandidateId`)
) ;
