--CREATE DATABASE SportShop;
--USE SportShop;
-- Таблиця категорій товарів

--CREATE TABLE ProductTypes (
--    Id INT PRIMARY KEY IDENTITY(1,1),
--    TypeName NVARCHAR(100) NOT NULL
--);

--CREATE TABLE Products (
--    Id INT PRIMARY KEY IDENTITY(1,1),
--    ProductName NVARCHAR(250) NOT NULL,
--    TypeId INT NOT NULL,
--    Price DECIMAL(10, 2) NOT NULL,
--    Quantity INT NOT NULL,
--    FOREIGN KEY (TypeId) REFERENCES ProductTypes(Id)
--);

--CREATE TABLE Customers (
--    CustomerId INT PRIMARY KEY IDENTITY(1,1),
--    FirstName NVARCHAR(100) NOT NULL,
--    LastName NVARCHAR(100) NOT NULL,
--    Email NVARCHAR(150),
--    RegistrationDate DATE NOT NULL
--);

--INSERT INTO ProductTypes (TypeName) VALUES 
--(N'Взуття'),
--(N'Одяг'),
--(N'Інвентар'),
--(N'Аксесуари');

--INSERT INTO Products (ProductName, TypeId, Price, Quantity) VALUES 
--(N'Кросівки бігові Nike Air', 1, 3200.00, 15),
--(N'Футбольні бутси Adidas Predator', 1, 4500.00, 8),
--(N'Кеди Puma Classic', 1, 2100.00, 0),
--(N'Спортивний костюм Reebok', 2, 2800.00, 20),
--(N'Футболка Under Armour', 2, 950.00, 35),
--(N'Футбольний м''яч Select', 3, 1200.00, 12),
--(N'Гантелі набірні 2х10кг', 3, 1800.00, 5),
--(N'Спортивна пляшка для води', 4, 350.00, 50);

--INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES 
--(N'Іван', N'Коваленко', 'kovalenko@email.com', '2022-03-15'),
--(N'Марія', N'Петренко', 'petrenko@email.com', '2021-11-10'),
--(N'Олександр', N'Мельник', 'melnyk@email.com', '2024-05-01'),
--(N'Анна', N'Ткаченко', 'tkachenko@email.com', '2023-08-22'),
--(N'Дмитро', N'Шевченко', 'shevchenko@email.com', '2025-01-10');


--CREATE PROCEDURE GetAllProducts
--AS
--BEGIN
--    SELECT * FROM Products;
--END;
EXEC GetAllProducts;
--CREATE PROCEDURE GetProductsByType @TypeName NVARCHAR(100)
--AS
--BEGIN
--    SELECT p.*
--    FROM Products p
--    INNER JOIN ProductTypes pt ON p.TypeId = pt.Id 
--    WHERE pt.TypeName = @TypeName AND p.Quantity > 0;
--END;
EXEC GetProductsByType @TypeName = N'Взуття';
--CREATE PROCEDURE GetTop3OldestCustomers
--AS
--BEGIN
--    SELECT TOP 3 CustomerId, FirstName, LastName, RegistrationDate, Email
--    FROM Customers
--    ORDER BY RegistrationDate ASC;
--END;
EXEC GetTop3OldestCustomers;