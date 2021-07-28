-- DROP DATABASE KEVM;

CREATE DATABASE KEVM;

USE KEVM;

CREATE TABLE Program (
	ID varchar(50) NOT NULL PRIMARY KEY,
	Client varchar(50) NOT NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL
);

CREATE TABLE ProductionLine (
	ID varchar(50) NOT NULL PRIMARY KEY,
	ModelNumber varchar(50) NOT NULL,
	ProductionLineType varchar(50) NOT NULL
);

CREATE TABLE Shift (
	ID varchar(50) NOT NULL PRIMARY KEY,
	ShiftType varchar(50) NOT NULL,
	ShiftCode INT NOT NULL
);

CREATE TABLE WorkStation (
	ID varchar(50) NOT NULL PRIMARY KEY,
	ProductionLineID varchar(50) NOT NULL,
	StationName varchar(50) NOT NULL,
	StationType INT NOT NULL
);

CREATE TABLE Employee (
	ID varchar(50) NOT NULL PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	IsSupervisor BOOLEAN,
	PhoneNumber varchar(50),
	Email varchar(50)
);

CREATE TABLE Part (
	Number varchar(50) NOT NULL PRIMARY KEY,
	ProgramID varchar(50) NOT NULL,
	PartType INT NOT NULL,
	Quantity INT NOT NULL
);

CREATE TABLE Availability (
	ProductionLineID varchar(50) NOT NULL,
	ShiftID varchar(50) NOT NULL PRIMARY KEY,
	AvailabilityRatio float NOT NULL
);

CREATE TABLE ProductionSchedule (
	ProductionLineID varchar(50) NOT NULL,
	PartNumber varchar(50) NOT NULL,
	SupervisorID varchar(50) NOT NULL,
	ShiftID varchar(50) NOT NULL,
	ToolNumber varchar(50) NOT NULL,
	Quantity INT NOT NULL,
	BPPPH INT NOT NULL,
	BPManpower INT NOT NULL,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL
);

CREATE TABLE EmployeeSchedule (
	EmployeeID varchar(50) NOT NULL,
	WorkStationID varchar(50) NOT NULL,
	SupervisorID varchar(50) NOT NULL,
	ShiftID varchar(50) NOT NULL
);

CREATE TABLE ScanInfo (
	ID varchar(50) NOT NULL PRIMARY KEY,
	EmployeeID varchar(50) NOT NULL,
	WorkStationID varchar(50) NOT NULL,
	ScanTime Time NOT NULL,
	ScanType BOOLEAN
);

CREATE TABLE TimeAttendence (
	EmployeeID varchar(50) NOT NULL,
	ShiftID varchar(50) NOT NULL,
    ShiftDate datetime NOT NULL,
	PaidHours float NOT NULL,
	Payment float NOT NULL
);

CREATE TABLE ProductionActual (
	ScanID varchar(50) NOT NULL,
	PartNumber varchar(50) NOT NULL,
	CONSTRAINT PK_ProductionActual PRIMARY KEY (ScanID,PartNumber),
	Quantity float NOT NULL,
	Performance float NOT NULL,
	Quality float NOT NULL
);

ALTER TABLE Part ADD CONSTRAINT FK_PartOfProgram_Key FOREIGN KEY(ProgramID)
REFERENCES Program (ID);

ALTER TABLE WorkStation ADD CONSTRAINT FK_WorkStationOfProductionLine_Key FOREIGN KEY(ProductionLineID)
REFERENCES ProductionLine (ID);

ALTER TABLE Availability ADD CONSTRAINT FK_AvailabilityOfShift_Key FOREIGN KEY(ShiftID)
REFERENCES Shift (ID);

ALTER TABLE Availability ADD CONSTRAINT FK_AvailabilityOfProductionLine_Key FOREIGN KEY(ProductionLineID)
REFERENCES ProductionLine (ID);

ALTER TABLE ProductionSchedule ADD CONSTRAINT FK_PSOfProductionLine_Key FOREIGN KEY(ProductionLineID)
REFERENCES ProductionLine (ID);

ALTER TABLE ProductionSchedule ADD CONSTRAINT FK_PSOfPart_Key FOREIGN KEY(PartNumber)
REFERENCES Part (Number);

ALTER TABLE ProductionSchedule ADD CONSTRAINT FK_PSOfSupervisor_Key FOREIGN KEY(SupervisorID)
REFERENCES Employee (ID);

ALTER TABLE ProductionSchedule ADD CONSTRAINT FK_PSOfShift_Key FOREIGN KEY(ShiftID)
REFERENCES Shift (ID);

ALTER TABLE EmployeeSchedule ADD CONSTRAINT FK_ESOfEmployee_Key FOREIGN KEY(EmployeeID)
REFERENCES Employee (ID);

ALTER TABLE EmployeeSchedule ADD CONSTRAINT FK_ESOfWorkStation_Key FOREIGN KEY(WorkStationID)
REFERENCES WorkStation (ID);

ALTER TABLE EmployeeSchedule ADD CONSTRAINT FK_ESOfSupervisor_Key FOREIGN KEY(SupervisorID)
REFERENCES Employee (ID);

ALTER TABLE EmployeeSchedule ADD CONSTRAINT FK_ESOfShift_Key FOREIGN KEY(ShiftID)
REFERENCES Shift (ID);

ALTER TABLE ScanInfo ADD CONSTRAINT FK_ScanOfEmployee_Key FOREIGN KEY(EmployeeID)
REFERENCES Employee (ID);

ALTER TABLE ScanInfo ADD CONSTRAINT FK_ScanOfWorkStation_Key FOREIGN KEY(WorkStationID)
REFERENCES WorkStation (ID);

ALTER TABLE TimeAttendence ADD CONSTRAINT FK_TAOfShift_Key FOREIGN KEY(ShiftID)
REFERENCES Shift (ID);

ALTER TABLE TimeAttendence ADD CONSTRAINT FK_TAOfEmployee_Key FOREIGN KEY(EmployeeID)
REFERENCES Employee (ID);

ALTER TABLE ProductionActual ADD CONSTRAINT FK_PAOfScan_Key FOREIGN KEY(ScanID)
REFERENCES ScanInfo (ID);

ALTER TABLE ProductionActual ADD CONSTRAINT FK_PAOfPartNumber_Key FOREIGN KEY(PartNumber)
REFERENCES Part (Number);