#(ShiftType 1-Morning, 2-Afternoon, 3-Evening)
# Scanned Hour
SELECT si1.EmployeeID, S.ShiftType as 'Date', S.ShiftCode as 'ShiftType' , si2.ScanTime as 'EndTime', si1.ScanTime as 'StartTime', W.ProductionLineID, TIMEDIFF(si2.ScanTime, si1.scanTime) AS 'Scanned Hours'
FROM ScanInfo si1
INNER JOIN ScanInfo si2 ON si2.employeeID = si1.employeeID
INNER JOIN EmployeeSchedule E ON si1.WorkStationID = E.WorkStationID
INNER JOIN Shift S ON E.ShiftID = S.ID
INNER JOIN Workstation W ON E.WorkstationID = W.ID
WHERE si1.ScanType = 1 AND si2.scanType = 0;

# Paid Hour
SELECT T.EmployeeID, S.ShiftType as 'Date',  S.ShiftCode as 'ShiftType', W.ProductionLineID, T.PaidHours
FROM TimeAttendence T
INNER JOIN EmployeeSchedule E ON T.EmployeeID = E.EmployeeID
INNER JOIN Shift S ON E.ShiftID = S.ID
INNER JOIN Workstation W ON E.WorkstationID = W.ID;

# Earned Hour
SELECT E.EmployeeID, S.ShiftType as 'Date',  S.ShiftCode as 'ShiftType', W.ProductionLineID, (TotalQuantity/P.AcceptedRate) AS 'Earned Hours'
FROM Quantity Q
INNER JOIN ProductionSchedule P ON Q.ProductionLineID = P.ProductionLineID
INNER JOIN EmployeeSchedule E ON Q.WorkstationID = E.WorkstationID
INNER JOIN Shift S ON E.ShiftID = S.ID
INNER JOIN Workstation W ON E.WorkstationID = W.ID;

# Availability
SELECT ProductionLineID, S.ShiftType as 'Date',  S.ShiftCode as 'ShiftType', (1-(dt/28800)) AS 'Availability'
FROM
(
SELECT ProductionLineID, ShiftID, TIME_TO_SEC(TIMEDIFF(EndTime, StartTime)) as 'dt'
FROM Downtime
) as t
INNER JOIN Shift S ON t.ShiftID = S.ID;

# Quality
SELECT E.EmployeeID, S.ShiftType as 'Date',  S.ShiftCode as 'ShiftType', W.ProductionLineID, 1- ((Q.TotalQuantity - Q.AcceptedQuantity)/Q.TotalQuantity) as 'Quality'
FROM Quantity Q
INNER JOIN EmployeeSchedule E ON Q.WorkstationID = E.WorkstationID
INNER JOIN Shift S ON E.ShiftID = S.ID
INNER JOIN Workstation W ON E.WorkstationID = W.ID;

# Performance
SELECT E.EmployeeID, S.ShiftType as 'Date',  S.ShiftCode as 'ShiftType', W.ProductionLineID, (Q.TotalQuantity/P.AcceptedRate * dt)/100 AS 'Performance'
FROM
(
SELECT *, HOUR(TIMEDIFF(EndTime, StartTime)) as 'dt'
FROM Quantity Q
) as Q
INNER JOIN ProductionSchedule P ON Q.ProductionLineID = P.ProductionLineID
INNER JOIN EmployeeSchedule E ON Q.WorkstationID = E.WorkstationID
INNER JOIN Shift S ON E.ShiftID = S.ID
INNER JOIN Workstation W ON E.WorkstationID = W.ID;