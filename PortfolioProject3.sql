--Portfolio Project 3: Creating and Querying a Hospital's Patient Records management DB
--Description: This SQL Project carried out involves the Creation and manpiulation of a ReatilInventory Database containing 4 tables,
-- populating the tables, and querying the data in the tables to provide insights for the compay and help them make 
--informed decisions.

-- Creating database
CREATE DATABASE HealthcarePatientDb
 GO
 USE HealthcarePatientDb

--Creating 1st table: Patient
CREATE TABLE Patient (
    PatientID NVARCHAR(10) PRIMARY KEY,  -- Alphanumeric primary key for the Patient table
    PatientName NVARCHAR(100) NOT NULL,  -- Name of the patient, up to 100 characters
    Age INT NOT NULL,                    -- Age of the patient
    Gender CHAR(1) NOT NULL,             -- Gender of the patient ('M' for Male, 'F' for Female)
    DoctorID INT NOT NULL,               -- Foreign key to the Doctor table (assuming it exists)
    StateID INT NOT NULL                 -- Foreign key to the State table (assuming it exists)
);

INSERT INTO Patient (PatientID, PatientName, Age, Gender, DoctorID, StateID)
VALUES
    ('PT01', 'John Doe', 45, 'M', 1, 101),
    ('PT02', 'Jane Smith', 30, 'F', 2, 102),
    ('PT03', 'Mary Johnson', 60, 'F', 3, 103),
    ('PT04', 'Michael Brown', 50, 'M', 4, 104),
    ('PT05', 'Patricia Davis', 40, 'F', 1, 105),
    ('PT06', 'Robert Miller', 55, 'M', 2, 106),
    ('PT07', 'Linda Wilson', 35, 'F', 3, 107),
    ('PT08', 'William Moore', 65, 'M', 4, 108),
    ('PT09', 'Barbara Taylor', 28, 'F', 1, 109),
    ('PT10', 'James Anderson', 70, 'M', 2, 110);

--Creating 2nd table -Doctor
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,             -- Primary key for the Doctor table
    DoctorName NVARCHAR(100) NOT NULL,    -- Name of the doctor, up to 100 characters
    Specialization NVARCHAR(100) NOT NULL -- Doctor's specialization, up to 100 characters
);
INSERT INTO Doctor (DoctorID, DoctorName, Specialization)
VALUES
    (1, 'Dr. Smith', 'Cardiology'),
    (2, 'Dr. Adams', 'Neurology'),
    (3, 'Dr. White', 'Orthopedics'),
    (4, 'Dr. Johnson', 'Dermatology');

-- Creating 3rd table - Statemaster
CREATE TABLE Statemaster (
    StateID INT PRIMARY KEY,            -- Primary key for the Statemaster table
    StateName NVARCHAR(100) NOT NULL    -- Name of the state, up to 100 characters
);
INSERT INTO Statemaster (StateID, StateName)
VALUES
    (101, 'Lagos'),
    (102, 'Abuja'),
    (103, 'Kano'),
    (104, 'Delta'),
    (105, 'Ido'),
    (106, 'Ibadan'),
    (107, 'Enugu'),
    (108, 'Kaduna'),
    (109, 'Ogun'),
    (110, 'Anambra');

	--Creating the 4th table: Department
	
	CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
    (1, 'Cardiology'),
    (2, 'Neurology'),
    (3, 'Orthopedics'),
    (4, 'Dermatology');

/* SQL Tasks
1.	Fetch patients with the same age.
2.	Find the second oldest patient and their doctor and department.
3.	Get the maximum age per department and the patient name.
4.	Doctor-wise count of patients sorted by count in descending order.
5.	Fetch only the first name from the PatientName and append the age.
6.	Fetch patients with odd ages.
7.	Create a view to fetch patient details with an age greater than 50.
8.	Create a procedure to update the patient's age by 10% where the department is 'Cardiology' and the doctor is not 'Dr. Smith'.
9.	Create a stored procedure to fetch patient details along with their doctor, department, and state, including error handling.
*/

--Queries
--1.	Fetch patients with the same age.
select PatientName,count(Age) 
from Patient
group by PatientName
having count(Age) > 1
--Answer: No duplicate patient

--2.	Find the second oldest patient and their doctor and department.
select PatientName, Age
from Patient
order by Age desc
Offset 1 row
fetch next 1 row only
--Answer: William Moore is the second oldest patient, with an age of 65.

--3.	Get the maximum age per doctor and the patient name.
select P.patientname, D.DoctorName, P.Age Ageee
from Patient P
join Doctor D on P.DoctorID =D.DoctorID
join (select DoctorID, max(Age) Max_age
from Patient P
group by DoctorID) A
on P.DoctorID = A.DoctorID
and P.Age = A.Max_age
--Answer: These are the oldest patiets assigned to each of the doctors

--4.	Doctor-wise count of patients sorted by count in descending order.
--this is asically how many patients were assigned to each doctor

select D.DoctorName,  count(P.PatientName)
from Patient P
join Doctor D
on D.DoctorID = P.DoctorID
group by D.DoctorName
order by count(P.PatientName) desc

--5.	Fetch only the first name from the PatientName and append the age.
select * from Patient
select CONCAT(left(PatientName, Charindex(' ',PatientName) -1 ), '_' , Age) Patientname_Age
From Patient

--6.	Fetch patients with odd ages.
select * from Patient
where age % 2 =1

--7.	Create a view to fetch patient details with an age greater than 50.
--8.	Create a procedure to update the patient's age by 10% where the department is 'Cardiology' and the doctor is not 'Dr. Smith'.
--9.	Create a stored procedure to fetch patient details along with their doctor, department, and state, including error handling.

