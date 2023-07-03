-- 2. Вывести название, проиводителя и цену для товара, колиичество которых превышает 2

SELECT ProductName, Manufacturer, Price FROM smartphones
WHERE ProductCount >= 3;


-- 3 Вывести весь ассортимент товаров марки "Samsung"

SELECT ProductName, Manufacturer, Price FROM smartphones
WHERE Manufacturer = 'Samsung';

-- 4*** С помощью LIKE найти:
-- 4.1 Товар, в котором есть упоминание "iPhone"*/
SELECT * FROM hw_1.smartphones
WHERE ProductName LIKE 'iPhone%';     

--    4.2 "Samsung"

SELECT * FROM hw_1.smartphones
WHERE Manufacturer LIKE '%Samsung%';   

--    4.3 Товар, в котором есть ЦИФРА "8" */

SELECT * FROM hw_1.smartphones
WHERE ProductName LIKE '%8%';