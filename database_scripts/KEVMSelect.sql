# Scanned Hour
SELECT si1.EmployeeID, TIMEDIFF(si2.ScanTime, si1.scanTime) AS 'Scanned Hours'
FROM ScanInfo si1
INNER JOIN ScanInfo si2 ON si2.employeeID = si1.employeeID
WHERE si1.ScanType = 1 AND si2.scanType = 0;

# Paid Hour
SELECT EmployeeID, PaidHours
FROM TimeAttendence;

# Earned Hour
SELECT E.EmployeeID, (TotalQuantity*10/(T.PaidHours * P.AcceptedRate)) AS 'Eartned Hours'
FROM Quantity Q
INNER JOIN ProductionSchedule P ON Q.ProductionLineID = P.ProductionLineID
INNER JOIN EmployeeSchedule E ON Q.WorkstationID = E.WorkstationID
INNER JOIN TimeAttendence T ON E.EmployeeID = T.EmployeeID;

# Availability
SELECT ProductionLineID, ShiftID, (1-(dt/28800)) AS 'Availability'
FROM
(
SELECT ProductionLineID, ShiftID, TIME_TO_SEC(TIMEDIFF(EndTime, StartTime)) as 'dt'
FROM Downtime
) as t;

# Quality
SELECT E.EmployeeID, 1- ((Q.TotalQuantity - Q.AcceptedQuantity)/Q.TotalQuantity) as 'Quality'
FROM Quantity Q
INNER JOIN EmployeeSchedule E ON Q.WorkstationID = E.WorkstationID;

# Performance
SELECT E.EmployeeID, (Q.TotalQuantity/P.AcceptedRate * dt)/100 AS 'Performance'
FROM
(
SELECT *, HOUR(TIMEDIFF(EndTime, StartTime)) as 'dt'
FROM Quantity Q
) as Q
INNER JOIN ProductionSchedule P ON Q.ProductionLineID = P.ProductionLineID
INNER JOIN EmployeeSchedule E ON Q.WorkstationID = E.WorkstationID