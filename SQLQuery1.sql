--CREATE TABLE Faculties(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    Financing MONEY NOT NULL DEFAULT 0 CHECK(Financing >= 0),
--    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK(LEN(TRIM([Name])) > 0)
--);

--CREATE TABLE Departments(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    Financing MONEY NOT NULL DEFAULT 0 CHECK(Financing >= 0),
--    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK(LEN(TRIM([Name])) > 0),
--    FacultyId INT NOT NULL FOREIGN KEY REFERENCES Faculties(Id)
--);

--CREATE TABLE Groups(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    [Name] NVARCHAR(10) NOT NULL UNIQUE CHECK(LEN(TRIM([Name])) > 0),
--    [Year] INT NOT NULL CHECK([Year] BETWEEN 1 AND 5),
--    DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments(Id)
--);

--CREATE TABLE Curators(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    [Name] NVARCHAR(MAX) NOT NULL CHECK(LEN(TRIM([Name])) > 0),
--    Surname NVARCHAR(MAX) NOT NULL CHECK(LEN(TRIM(Surname)) > 0)
--);

--CREATE TABLE GroupsCurators(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    CuratorId INT NOT NULL FOREIGN KEY REFERENCES Curators(Id),
--    GroupId INT NOT NULL FOREIGN KEY REFERENCES Groups(Id)
--);

--CREATE TABLE Subjects(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK(LEN(TRIM([Name])) > 0)
--);

--CREATE TABLE Teachers(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    [Name] NVARCHAR(MAX) NOT NULL CHECK(LEN(TRIM([Name])) > 0),
--    Salary MONEY NOT NULL CHECK(Salary > 0),
--    Surname NVARCHAR(MAX) NOT NULL CHECK(LEN(TRIM(Surname)) > 0)
--);

--CREATE TABLE Lectures(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    LectureRoom NVARCHAR(MAX) NOT NULL CHECK(LEN(TRIM(LectureRoom)) > 0),
--    SubjectId INT NOT NULL FOREIGN KEY REFERENCES Subjects(Id),
--    TeacherId INT NOT NULL FOREIGN KEY REFERENCES Teachers(Id)
--);

--CREATE TABLE GroupsLectures(
--    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--    GroupId INT NOT NULL FOREIGN KEY REFERENCES Groups(Id),
--    LectureId INT NOT NULL FOREIGN KEY REFERENCES Lectures(Id)
--);
--INSERT INTO Faculties ([Name], Financing) VALUES 
--('Факультет комп''ютерних наук', 500000.00),
--('Факультет кібербезпеки', 420000.00),
--('Факультет прикладної математики', 300000.00);

--INSERT INTO Departments ([Name], Financing, FacultyId) VALUES 
--('Кафедра програмної інженерії', 150000.00, 1),
--('Кафедра штучного інтелекту', 180000.00, 1),
--('Кафедра криптографії', 120000.00, 2),
--('Кафедра вищої математики', 90000.00, 3);

--INSERT INTO Groups ([Name], [Year], DepartmentId) VALUES 
--('ПІ-21', 2, 1),
--('ПІ-41', 4, 1),
--('ШІ-11', 1, 2),
--('КБ-32', 3, 3);

--INSERT INTO Curators ([Name], Surname) VALUES 
--('Олена', 'Коваленко'),
--('Максим', 'Мороз'),
--('Ірина', 'Ткаченко');

--INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES 
--(1, 1),
--(2, 2),
--(3, 3),
--(1, 4);

--INSERT INTO Subjects ([Name]) VALUES 
--('Бази даних'),
--('Об''єктно-орієнтоване програмування'),
--('Алгоритми та структури даних'),
--('Методи захисту інформації');

--INSERT INTO Teachers ([Name], Surname, Salary) VALUES 
--('Андрій', 'Петренко', 25000.00),
--('Світлана', 'Мельник', 28000.00),
--('Дмитро', 'Шевченко', 31000.00);

--INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES 
--('Аудиторія 204', 1, 1),
--('Аудиторія 405 (комп. клас)', 2, 2),
--('Лекційна зала 1', 3, 3),
--('Аудиторія 312', 4, 1);

--INSERT INTO GroupsLectures (GroupId, LectureId) VALUES 
--(1, 1),
--(1, 2),
--(2, 2),
--(3, 3),
--(4, 4);
--SELECT 
--    T.Surname AS TeacherSurname, 
--    T.[Name] AS TeacherName, 
--    G.[Name] AS GroupName
--FROM Teachers T
--CROSS JOIN Groups G;

--SELECT F.[Name] AS FacultyName
--FROM Faculties F
--JOIN Departments D ON F.Id = D.FacultyId
--GROUP BY F.Id, F.[Name], F.Financing
--HAVING SUM(D.Financing) > F.Financing;

--SELECT 
--    C.Surname AS CuratorSurname, 
--    G.[Name] AS GroupName
--FROM Curators C
--JOIN GroupsCurators GC ON C.Id = GC.CuratorId
--JOIN Groups G ON GC.GroupId = G.Id;

--SELECT DISTINCT T.Surname AS TeacherSurname
--FROM Teachers T
--JOIN Lectures L ON T.Id = L.TeacherId
--JOIN GroupsLectures GL ON L.Id = GL.LectureId
--JOIN Groups G ON GL.GroupId = G.Id
--WHERE G.[Name] = 'P107';

--SELECT DISTINCT 
--    T.Surname AS TeacherSurname, 
--    F.[Name] AS FacultyName
--FROM Teachers T
--JOIN Lectures L ON T.Id = L.TeacherId
--JOIN GroupsLectures GL ON L.Id = GL.LectureId
--JOIN Groups G ON GL.GroupId = G.Id
--JOIN Departments D ON G.DepartmentId = D.Id
--JOIN Faculties F ON D.FacultyId = F.Id;
--ALTER TABLE Lectures 
--ADD DayOfWeek INT NOT NULL DEFAULT 1 CHECK(DayOfWeek BETWEEN 1 AND 7);


--SELECT COUNT(DISTINCT L.TeacherId) AS TeachersCount
--FROM Teachers T
--JOIN Lectures L ON T.Id = L.TeacherId
--JOIN GroupsLectures GL ON L.Id = GL.LectureId
--JOIN Groups G ON GL.GroupId = G.Id
--JOIN Departments D ON G.DepartmentId = D.Id
--WHERE D.[Name] = N'Software Development';

--SELECT COUNT(L.Id) AS LecturesCount
--FROM Lectures L
--JOIN Teachers T ON L.TeacherId = T.Id
--WHERE T.[Name] = N'Dave' AND T.Surname = N'McQueen';

--SELECT COUNT(Id) AS LecturesCount
--FROM Lectures
--WHERE LectureRoom = N'D201';

--SELECT LectureRoom, COUNT(Id) AS LecturesCount
--FROM Lectures
--GROUP BY LectureRoom;

--SELECT COUNT(DISTINCT GL.GroupId) AS TotalGroups
--FROM GroupsLectures GL
--JOIN Lectures L ON GL.LectureId = L.Id
--JOIN Teachers T ON L.TeacherId = T.Id
--WHERE T.[Name] = N'Jack' AND T.Surname = N'Underhill';

--SELECT LectureRoom, COUNT(Id) AS LecturesCount
--FROM Lectures
--GROUP BY LectureRoom;

--SELECT AVG(T.Salary) AS AverageSalary
--FROM Teachers T
--JOIN Lectures L ON T.Id = L.TeacherId
--JOIN GroupsLectures GL ON L.Id = GL.LectureId
--JOIN Groups G ON GL.GroupId = G.Id
--JOIN Departments D ON G.DepartmentId = D.Id
--JOIN Faculties F ON D.FacultyId = F.Id
--WHERE F.[Name] = N'Computer Science';

SELECT 
    MIN(LecturesPerGroup) AS MinLectures, 
    MAX(LecturesPerGroup) AS MaxLectures
FROM (
    SELECT COUNT(LectureId) AS LecturesPerGroup
    FROM GroupsLectures
    GROUP BY GroupId
) AS GroupStats;