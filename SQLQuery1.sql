--CREATE DATABASE ACADEMY;
--CREATE TABLE Faculties
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK (LEN(TRIM(Name)) > 0)
--);

--CREATE TABLE Departments
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
--    Financing MONEY NOT NULL CONSTRAINT DF_Departments_Financing DEFAULT 0 CHECK (Financing >= 0),
--    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK (LEN(TRIM(Name)) > 0),
--    FacultyId INT NOT NULL,
--    CONSTRAINT FK_Departments_Faculties FOREIGN KEY (FacultyId) REFERENCES Faculties(Id) ON DELETE CASCADE
--);

--CREATE TABLE Curators
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    [Name] NVARCHAR(MAX) NOT NULL CHECK (LEN(TRIM(Name)) > 0),
--    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(TRIM(Surname)) > 0)
--);

--CREATE TABLE Groups
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    [Name] NVARCHAR(10) NOT NULL UNIQUE CHECK (LEN(TRIM(Name)) > 0),
--    [Year] INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
--    DepartmentId INT NOT NULL,
--    CONSTRAINT FK_Groups_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id) ON DELETE CASCADE
--);

--CREATE TABLE Students
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    [Name] NVARCHAR(MAX) NOT NULL CHECK (LEN(TRIM(Name)) > 0),
--    Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),
--    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(TRIM(Surname)) > 0)
--);

--CREATE TABLE Subjects
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK (LEN(TRIM(Name)) > 0)
--);

--CREATE TABLE Teachers
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    IsProfessor BIT NOT NULL CONSTRAINT DF_Teachers_IsProfessor DEFAULT 0,
--    [Name] NVARCHAR(MAX) NOT NULL CHECK (LEN(TRIM(Name)) > 0),
--    Salary MONEY NOT NULL CHECK (Salary > 0),
--    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(TRIM(Surname)) > 0)
--);

--CREATE TABLE Lectures
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    [Date] DATE NOT NULL CHECK ([Date] <= CAST(GETDATE() AS DATE)),
--    SubjectId INT NOT NULL,
--    TeacherId INT NOT NULL,
--    CONSTRAINT FK_Lectures_Subjects FOREIGN KEY (SubjectId) REFERENCES Subjects(Id) ON DELETE CASCADE,
--    CONSTRAINT FK_Lectures_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(Id) ON DELETE CASCADE
--);

--CREATE TABLE GroupsCurators
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    CuratorId INT NOT NULL,
--    GroupId INT NOT NULL,
--    CONSTRAINT FK_GroupsCurators_Curators FOREIGN KEY (CuratorId) REFERENCES Curators(Id) ON DELETE CASCADE,
--    CONSTRAINT FK_GroupsCurators_Groups FOREIGN KEY (GroupId) REFERENCES Groups(Id) ON DELETE CASCADE
--);

--CREATE TABLE GroupsStudents
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    GroupId INT NOT NULL,
--    StudentId INT NOT NULL,
--    CONSTRAINT FK_GroupsStudents_Groups FOREIGN KEY (GroupId) REFERENCES Groups(Id) ON DELETE CASCADE,
--    CONSTRAINT FK_GroupsStudents_Students FOREIGN KEY (StudentId) REFERENCES Students(Id) ON DELETE CASCADE
--);

--CREATE TABLE GroupsLectures
--(
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    GroupId INT NOT NULL,
--    LectureId INT NOT NULL,
--    CONSTRAINT FK_GroupsLectures_Groups FOREIGN KEY (GroupId) REFERENCES Groups(Id) ON DELETE CASCADE,
--    CONSTRAINT FK_GroupsLectures_Lectures FOREIGN KEY (LectureId) REFERENCES Lectures(Id) ON DELETE CASCADE
--);

--INSERT INTO Faculties (Name)
--VALUES
--('Computer Science'),
--('Engineering'),
--('Economics');

--INSERT INTO Departments (Building, Financing, Name, FacultyId)
--VALUES
--(1, 600000, 'Software Engineering', 1),
--(2, 450000, 'Computer Systems', 1),
--(3, 700000, 'Mechanical Engineering', 2),
--(4, 350000, 'Finance', 3),
--(5, 300000, 'Management', 3);

--INSERT INTO Curators (Name, Surname)
--VALUES
--('Ivan', 'Petrenko'),
--('Olena', 'Shevchenko'),
--('Andrii', 'Koval'),
--('Maria', 'Tkachenko'),
--('Taras', 'Bondarenko');

--INSERT INTO Groups (Name, Year, DepartmentId)
--VALUES
--('SE101',1,1),
--('SE201',2,1),
--('CS101',1,2),
--('CS301',3,2),
--('ME201',2,3),
--('FN101',1,4),
--('MG201',2,5);

--INSERT INTO Students (Name,Surname,Rating)
--VALUES
--('Oleh','Bondarenko',5),
--('Anna','Melnyk',4),
--('Dmytro','Kravchenko',3),
--('Sofia','Kozak',5),
--('Maksym','Boyko',2),
--('Kateryna','Marchenko',4),
--('Roman','Savchenko',1),
--('Yulia','Tkachenko',5),
--('Denys','Polishchuk',3),
--('Iryna','Shevchuk',4),
--('Artem','Lisovyi',5),
--('Natalia','Koval',2);

--INSERT INTO Subjects (Name)
--VALUES
--('Databases'),
--('Programming'),
--('Mathematics'),
--('Physics'),
--('Economics'),
--('Management'),
--('Algorithms'),
--('Networks');

--INSERT INTO Teachers (IsProfessor,Name,Salary,Surname)
--VALUES
--(1,'Petro',45000,'Ivanov'),
--(0,'Olha',28000,'Kravets'),
--(1,'Serhii',52000,'Bondar'),
--(0,'Iryna',31000,'Melnyk'),
--(1,'Vasyl',47000,'Tkachenko'),
--(0,'Andrii',29000,'Shevchenko');

--INSERT INTO Lectures ([Date],SubjectId,TeacherId)
--VALUES
--('2025-02-10',1,1),
--('2025-02-11',2,2),
--('2025-02-12',3,3),
--('2025-02-13',4,4),
--('2025-02-14',5,5),
--('2025-02-15',6,6),
--('2025-03-01',7,1),
--('2025-03-02',8,3);

--INSERT INTO GroupsCurators (CuratorId,GroupId)
--VALUES
--(1,1),
--(2,2),
--(3,3),
--(4,4),
--(5,5),
--(1,6),
--(2,7);

--INSERT INTO GroupsStudents (GroupId,StudentId)
--VALUES
--(1,1),
--(1,2),
--(2,3),
--(2,4),
--(3,5),
--(3,6),
--(4,7),
--(4,8),
--(5,9),
--(5,10),
--(6,11),
--(7,12);

--INSERT INTO GroupsLectures (GroupId,LectureId)
--VALUES
--(1,1),
--(1,2),
--(2,2),
--(2,3),
--(3,1),
--(3,4),
--(4,5),
--(4,7),
--(5,3),
--(5,8),
--(6,5),
--(7,6);


--SELECT Building
--FROM dbo.Departments
--WHERE Financing > 100000;

--SELECT g.[Name]
--FROM dbo.Groups g
--JOIN dbo.Departments d ON g.DepartmentId = d.Id
--JOIN dbo.GroupsLectures gl ON g.Id = gl.GroupId
--JOIN dbo.Lectures l ON gl.LectureId = l.Id
--WHERE d.[Name] = 'Software Development'
--AND g.[Year] = 5 
--AND DATEPART(wk, l.[Date]) = 1 
--GROUP BY g.Id, g.[Name]
--HAVING COUNT(gl.LectureId) > 10; 

--SELECT g.[Name]
--FROM dbo.Groups g
--JOIN dbo.GroupsStudents gs ON g.Id = gs.GroupId
--JOIN dbo.Students s ON gs.StudentId = s.Id
--GROUP BY g.Id, g.[Name]
--HAVING AVG(CAST(s.Rating AS FLOAT)) > (
--SELECT AVG(CAST(st.Rating AS FLOAT))
--FROM dbo.Groups gr
--JOIN dbo.GroupsStudents gst ON gr.Id = gst.GroupId
--JOIN dbo.Students st ON gst.StudentId = st.Id
--WHERE gr.[Name] = 'D221'
--);

--SELECT [Name], Surname
--FROM dbo.Teachers
--WHERE Salary > (
--    SELECT AVG(Salary)
--    FROM dbo.Teachers
--    WHERE IsProfessor = 1
--);

--SELECT g.[Name]
--FROM dbo.Groups g
--JOIN dbo.GroupsCurators gc ON g.Id = gc.GroupId
--GROUP BY g.Id, g.[Name]
--HAVING COUNT(gc.CuratorId) > 1;

--SELECT g.[Name]
--FROM dbo.Groups g
--JOIN dbo.GroupsStudents gs ON g.Id = gs.GroupId
--JOIN dbo.Students s ON gs.StudentId = s.Id
--GROUP BY g.Id, g.[Name]
--HAVING AVG(CAST(s.Rating AS FLOAT)) < (
--SELECT MIN(GroupAvgRating)
--FROM (
--SELECT AVG(CAST(st.Rating AS FLOAT)) AS GroupAvgRating
--FROM dbo.Groups gr
--JOIN dbo.GroupsStudents gst ON gr.Id = gst.GroupId
--JOIN dbo.Students st ON gst.StudentId = st.Id
--WHERE gr.[Year] = 5
--GROUP BY gr.Id) 
--AS FifthYearGroupRatings
--);

SELECT f.[Name]
FROM dbo.Faculties f
JOIN dbo.Departments d ON f.Id = d.FacultyId
GROUP BY f.Id, f.[Name]
HAVING SUM(d.Financing) > (
SELECT SUM(dep.Financing)
FROM dbo.Faculties fac
JOIN dbo.Departments dep ON fac.Id = dep.FacultyId
WHERE fac.[Name] = 'Computer Science'
);