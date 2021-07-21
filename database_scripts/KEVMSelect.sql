# OEE
SELECT si.EmployeeID, ps.SupervisorID, pa.Performance, pa.Quality, av.AvailabilityRatio AS 'Availability' 
FROM ProductionActual pa 
INNER JOIN ScanInfo si ON pa.ScanID = si.ID 
INNER JOIN WorkStation ws ON si.WorkStationID = ws.ID
INNER JOIN Availability av ON av.ProductionLineID = ws.ProductionLineID
INNER JOIN ProductionSchedule ps ON ws.ProductionLineID = ps.ProductionLineID 
WHERE si.WorkStationID = ws.ID AND si.ScanTime <= ps.EndTime AND si.ScanType = 1;

# Scanned Hour
SELECT si1.EmployeeID, TIMEDIFF(si2.ScanTime, si1.scanTime) AS 'Scanned Hours'
FROM ScanInfo si1
INNER JOIN ScanInfo si2 ON si2.employeeID = si1.employeeID
WHERE si1.ScanType = 1 AND si2.scanType = 0;

# Paid Hour
SELECT EmployeeID, PaidHours FROM TimeAttendence;

# Earned Hour
SELECT ta.EmployeeID, (ps.Quantity/ps.BPPPH) as 'Earned Hour'
FROM ProductionSchedule ps
INNER JOIN Shift sh ON sh.ID = ps.ShiftID
INNER JOIN TimeAttendence ta ON ta.ShiftID = sh.ID;