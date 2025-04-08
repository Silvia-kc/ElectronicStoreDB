CREATE DATABASE [ElectronicStore]

CREATE TABLE [Category](
[CategoryId] INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(100)
)
CREATE TABLE [Brand](
[BrandId] INT PRIMARY KEY,
[Name] NVARCHAR(100)
)
CREATE TABLE [Product](
[ProductId] INT  PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(100),
[CategoryId] INT FOREIGN KEY REFERENCES Category(CategoryId) ON DELETE SET NULL,
[BrandId] INT FOREIGN KEY REFERENCES Brand(BrandId) ON DELETE SET NULL ON UPDATE CASCADE,
[Price] DECIMAL,
[Available] NVARCHAR(10)
)
CREATE TABLE [Client](
[ClientId] INT PRIMARY KEY IDENTITY(1,1),
[FirstName] NVARCHAR(100),
[SureName] NVARCHAR(100),
[PhoneNumber] NVARCHAR(10)
)
CREATE TABLE [Order](
[OrderId] INT PRIMARY KEY IDENTITY(1,1),
[ProductId] INT FOREIGN KEY REFERENCES Product(ProductId) ON DELETE SET DEFAULT,
[ClientId] INT FOREIGN KEY REFERENCES Client(ClientId) ON DELETE CASCADE,
[OrderDate] DATE,
[Amount] INT
)

INSERT INTO [Category] (Name) 
VALUES
('Laptop'),
('Telephone'),
('Monitor'),
('Tablet'),
('Accessories')

INSERT INTO [Brand] (BrandId,Name) 
VALUES
(1,'Apple'),
(2,'Samsung'),
(3,'Lenovo'),
(4,'Dell'),
(5,'Asus')

INSERT INTO [Product] (Name, CategoryId, BrandId, Price, Available) 
VALUES
('Samsung Galaxy A52', 2, 2, 1000, 20),
('Ipad', 4, 1, 2500, 15),
('Lenovo N27q', 3, 3,330, 25),
('Dell Vostro', 1, 4, 850, 30),
('Asus Rog Gladius', 5, 5, 167, 40)

INSERT INTO [Client](FirstName, SureName, PhoneNumber) 
VALUES
('Atanas', 'Hatov', '0888783456'),
('Desislava', 'Gudova', '0877690321'),
('Teododra', 'Tedkova', '0891265432'),
('Monika', 'Nikolova', '0887241534'),
('Stilqn', 'Chanev', '0876981168')

INSERT INTO [Order](ProductId, ClientId, OrderDate, Amount) 
VALUES
(1, 1, '2025-03-01', 1),
(2, 2, '2025-04-07', 2),
(3, 3, '2024-12-04', 1),
(4, 4, '2024-12-23', 4),
(5, 5, '2024-01-05', 3)

SELECT * FROM Product

SELECT * FROM Product WHERE (Price>200)

SELECT p.name 
FROM Product p 
JOIN 
Brand b ON p.BrandId=b.BrandId
WHERE (b.Name='Samsung')

SELECT TOP 1 * FROM Product ORDER BY price DESC

SELECT * FROM Client ORDER BY SureName ASC

SELECT c.FirstName, c.SureName,o.OrderDate
FROM [Order] o
LEFT JOIN 
Client c ON o.ClientId=c.ClientId

SELECT SUM (price*available) FROM Product

SELECT c.FirstName,c.SureName
FROM [Order] o
LEFT JOIN 
Client c ON c.ClientId=o.ClientId
WHERE o.OrderId IS NULL

UPDATE Product
SET Price=Price+Price*0.1
WHERE(BrandId=1)

DELETE Client
WHERE ClientId=2

DELETE Product
WHERE BrandId=1

DELETE Product
WHERE ProductId=3