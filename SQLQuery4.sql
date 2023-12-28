SELECT * FROM Visit 
WHERE PatientCategoryID = 3

SELECT VisitId,PatientCategoryID,PatientID FROM  Visit
WHERE PatientCategoryID = 3

SELECT UnitId, * FROM Visit 
WHERE PatientCategoryID = 3


---INNER JOIN EXAMPLE BETWEEN TWO OR MORE TABLES DATASETS 
SELECT * FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID = PC.PatientCategoryID


SELECT V.*, PC.Name as PatientCategory FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID = PC.PatientCategoryID




SELECT V.*, PC.Name as PatientCategory,P.FirstName+''+P.LastName AS PatientName FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID = PC.PatientCategoryID
INNER JOIN Patient P
ON V.PatientId = P.PatientID

SELECT V.*, PC.Name as PatientCategory,P.FirstName+''+P.LastName AS PatientName,
D.FirstName+''+D.LastName AS DoctorName
FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID = PC.PatientCategoryID
INNER JOIN Patient P
ON V.PatientId = P.PatientID
INNER JOIN Doctor D
ON v.DoctorID = D.DoctorID


----QUARIES 1

----Patient Visited to Hospital 

SELECT V.*, PC.Name as PatientCategory,P.FirstName+''+P.LastName AS PatientName,
D.FirstName+''+D.LastName AS DoctorName,
U.Name AS UnitName
FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID = PC.PatientCategoryID
INNER JOIN Patient P
ON V.PatientId = P.PatientID
INNER JOIN Doctor D
ON v.DoctorID = D.DoctorID
INNER JOIN Unit U
ON V.UnitId = U.UnitID



SELECT V.*, PC.Name as PatientCategory,P.FirstName+''+P.LastName AS PatientName,
D.FirstName+''+D.LastName AS DoctorName,
U.Name AS UnitName,
dp.Name AS DepartmentName
FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID = PC.PatientCategoryID
INNER JOIN Patient P
ON V.PatientId = P.PatientID
INNER JOIN Doctor D
ON v.DoctorID = D.DoctorID
INNER JOIN Unit U
ON V.UnitId = U.UnitID
INNER JOIN  Department dp
on D.DepartmentID = dp.DepartmentID


----QUARIES 2

----Patient Admitted in HospitaL

SELECT A.AdmissionDate,A.IPDNumber,
PC.Name AS PatientCategory,
P.FirstName+''+P.LastName AS PatientName,
D.FirstName+''+D.LastName AS DoctorName,
U.Name As UnitName,DS.DischargeDate

FROM Admission A 
INNER JOIN PatientCategory PC ON
A.PatientCategoryID = PC.PatientCategoryID
INNER JOIN Patient P
ON A.PatientId = P.PatientID
INNER JOIN Doctor D
ON A.DoctorId = D.DoctorID
INNER JOIN Unit U
ON A.UnitId = U.UnitID
INNER JOIN Discharge DS
ON A.AdmissionId = DS.AdmissionId

----Question 3

---Number of Patient visited to Medicine Dept in June 2022

SELECT COUNT(1) AS NumberofPatients from visit V
INNER JOIN Doctor D
ON V.DoctorID = D.DoctorID
LEFT JOIN Department dp
ON D.DepartmentID = dp.DepartmentID
WHERE YEAR(VisitDate) = 2021 AND MONTH(VisitDate) = 06
AND dp.Name = 'Medicine'

