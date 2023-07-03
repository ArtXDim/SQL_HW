CREATE DATABASE phone;
USE phone;

CREATE TABLE smartphone
(id INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT,
Price INT);

INSERT INTO smartphone(id, ProductName, Manufacturer, ProductCount, Price)
VALUES
(1, "iPhone X", "Apple", 3, 76000),
(2, "iPhone 24", "Apple", 2, 51000),
(3, "Galaxy S9", "Samsung", 2, 56000),
(4, "Galaxy S8", "Samsung", 1, 41000),
(5, "P20 Pro", "Huawei", 5, 36000),
(6, "iPhone 8", "Apple", 8, 10000),
(7, "Tesla 8", "Tesla", 2, 150000);

-- 2. Вывести название, проиводителя и цену для товара, колиичество которых 
-- превышает 2

SELECT ProductName, Manufacturer, Price FROM smartphones
WHERE ProductCount > 2;

-- 3 Вывести весь ассортимент товаров марки "Samsung"

SELECT ProductName, Manufacturer, Price FROM smartphones
WHERE Manufacturer = 'Samsung';

-- 4*** С помощью LIKE найти:
-- 4.1 Товар, в котором есть упоминание "iPhone"
SELECT * FROM hw_1.smartphones
WHERE ProductName LIKE 'iPhone%';     

--    4.2 "Samsung"

SELECT * FROM hw_1.smartphones
WHERE Manufacturer LIKE '%Samsung%';   

--    4.3 Товар, в котором есть ЦИФРА "8" */

SELECT * FROM hw_1.smartphones
WHERE ProductName LIKE '%8%';