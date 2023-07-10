CREATE DATABASE IF NOT EXISTS hw_2;
DROP DATABASE IF EXISTS hw_2;

USE hw_2;

CREATE TABLE sales
(id INT AUTO_INCREMENT PRIMARY KEY,
name_prod VARCHAR(45),
price_prod INT NOT NULL,
order_date DECIMAL(5,2) NOT NULL,
volume INT NOT NULL);

INSERT INTO sales (id, name_prod, price_prod, order_date, volume)
VALUES
(1, "Антифриз Гостовский зеленый (10кг)", 450.50, "2021-01-01", 156),
(2, "Газ. напиток Добрый Дюшес  (0,5л)", 156.18, "2021-01-02", 180),
(3, "Масло 2Т Country ST-507 TB мин.(дозаторная Stihl) 1л", 845.52, "2021-01-03", 21),
(4, "Масло OilRight М8В (1л)", 1200.47, "2021-01-04", 124),
(5, "Масло Shell Helix HX7 10w40 (4л)", 2556.36,  "2021-01-05", 341);

SELECT 
name_prod AS "Наименование товара",
IF (volume < 100, "Малое количество",
	IF (volume >= 100 AND volume < 300, "Среднее количество",
		IF (volume >= 300, "Большое количество", "неопределено"))) AS "Остаток на складе"
FROM sales;

CREATE TABLE orders
(id INT AUTO_INCREMENT PRIMARY KEY,
employee VARCHAR(10) NOT NULL,
amount DOUBLE NOT NULL,
order_status VARCHAR(10) NOT NULL);

INSERT INTO orders (employee, amount, order_status)
VALUES 
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");

SELECT * FROM orders;

SELECT * ,
	CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        ELSE "Order is cancelled"
	END full_order_status
FROM orders;

-- O - это значение. в отличии от NULL, которое говорит об отсутствии какого-либо значения.
        
