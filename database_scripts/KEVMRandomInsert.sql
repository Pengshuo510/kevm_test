INSERT INTO Program VALUES ('001', 'Honda', '2016-09-15', '2021-09-15');

INSERT INTO ProductionLine VALUES('001', '001', 'Assembly');
INSERT INTO ProductionLine VALUES('002', '002', 'Laser Cut');

INSERT INTO Shift VALUES ('001', '2021-07-15', 1);
INSERT INTO Shift VALUES ('002', '2021-07-15', 2);
INSERT INTO Shift VALUES ('003', '2021-07-15', 3);

INSERT INTO WorkStation VALUES('001','001','WS1',1);
INSERT INTO WorkStation VALUES('002','001','WS2',1);
INSERT INTO WorkStation VALUES('003','001','WS3',1);

INSERT INTO Employee VALUES('001', 'Steve', 'Rogers', 1, '111-111-1111', 'steve@magna.com');
INSERT INTO Employee VALUES('002', 'Tony', 'Stark', 0, '111-111-1112', 'tony@magna.com');
INSERT INTO Employee VALUES('003', 'Bruce', 'Banner', 0, '111-111-1113', 'bruce@magna.com');
INSERT INTO Employee VALUES('004', 'Natasha', 'Romanoff', 0, '111-111-1114', 'natasha@magna.com');
INSERT INTO Employee VALUES('005', 'Clint', 'Barton', 0, '111-111-1115', 'clint@magna.com');
INSERT INTO Employee VALUES('006', 'Vision', 'Vision', 1, '111-111-1116', 'vision@magna.com');
INSERT INTO Employee VALUES('007', 'Wanda', 'Maximoff', 1, '111-111-1117', 'wanda@magna.com');
INSERT INTO Employee VALUES('008', 'Pietro', 'Maximoff', 1, '111-111-1118', 'pietro@magna.com');

INSERT INTO Part VALUES('001', '001', 1, 20000);
INSERT INTO Part VALUES('002', '001', 2, 20000);

INSERT INTO ProductionSchedule VALUES('001','001','001','001','001',160, 20, 4, '6:25:00', '14:25:00');
INSERT INTO ProductionSchedule VALUES('001','002','006','001','002',160, 20, 2, '14:25:00', '22:25:00');

INSERT INTO EmployeeSchedule VALUES('002', '001', '001', '001');
INSERT INTO EmployeeSchedule VALUES('003', '002', '001', '001');
INSERT INTO EmployeeSchedule VALUES('004', '003', '001', '001');
INSERT INTO EmployeeSchedule VALUES('005', '003', '001', '001');
INSERT INTO EmployeeSchedule VALUES('007', '001', '006', '002');
INSERT INTO EmployeeSchedule VALUES('008', '002', '006', '002');

INSERT INTO ScanInfo VALUES('001', '002', '001', '6:23:15', 1);
INSERT INTO ScanInfo VALUES('002', '003', '002', '6:20:32', 1);
INSERT INTO ScanInfo VALUES('003', '004', '003', '6:21:15', 1);
INSERT INTO ScanInfo VALUES('004', '005', '003', '6:22:37', 1);
INSERT INTO ScanInfo VALUES('005', '002', '001', '14:23:15', 0);
INSERT INTO ScanInfo VALUES('006', '003', '002', '14:20:32', 0);
INSERT INTO ScanInfo VALUES('007', '004', '003', '14:21:15', 0);
INSERT INTO ScanInfo VALUES('008', '005', '003', '14:22:37', 0);

INSERT INTO ProductionActual VALUES('001','001', 10, 0.9, 0.95);
INSERT INTO ProductionActual VALUES('002','001', 10, 1, 1);
INSERT INTO ProductionActual VALUES('003','001', 10, 1, 0.95);
INSERT INTO ProductionActual VALUES('004','001', 10, 0.9, 0.95);

INSERT INTO TimeAttendence VALUES ('002', '001', '8', '160');
INSERT INTO TimeAttendence VALUES ('003', '001', '8', '160');
INSERT INTO TimeAttendence VALUES ('004', '001', '8', '160');
INSERT INTO TimeAttendence VALUES ('005', '001', '8', '160');

INSERT INTO Availability VALUES('001', '001', 0.9);