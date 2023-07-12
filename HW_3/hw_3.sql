DROP DATABASE IF EXISTS hw_3;
CREATE DATABASE IF NOT EXISTS hw_3;
USE hw_3;

CREATE TABLE IF NOT EXISTS staff
(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
age INT NOT NULL,
position VARCHAR(45) NOT NULL,
salary INT NOT NULL);

INSERT INTO staff (first_name, last_name, age, position, salary)
VALUES
('Иванов', 'Иван', 26, 'Разработчик', 50000),
('Петров', 'Петр' , 20, 'Разработчик', 55000),
('Сидоров','Алексей',  31, 'Разработчик', 45000),
('Иванов','Ольга',  34, 'Руководитель проекта', 70000),
('Петрова','Иван',  27, 'Разработчик', 45000),
('Сидорова','Екатерина',  45, 'Дизайнер', 60000),
('Смирнова','Елена',  33, 'Менеджер', 70000),
('Иванов','Иван',  39, 'Разработчик', 60000),
('Иванович','Сергей',  24, 'Менеджер', 50000),
('Сидорович','Дмитрий',  28, 'Разработчик', 45000),
('Смирнович','Владимир',  26, 'Разработчик', 55000),
('Козлова','Анна',  31, 'Разработчик', 70000);

SELECT * FROM staff;

CREATE TABLE IF NOT EXISTS activity_staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
staff_id INT,
FOREIGN KEY (staff_id) REFERENCES staff(id),
date_activity DATE,
count_pages INT
);

INSERT activity_staff (staff_id, date_activity, count_pages)
VALUES
(1, '2022-01-01', 250),
(2, '2022-01-01', 220),
(3, '2022-01-01', 170),
(1, '2022-01-02', 100),
(2, '2022-01-01', 220),
(3, '2022-01-01', 300),
(7, '2022-01-01', 350),
(1, '2022-01-03', 168),
(2, '2022-01-03', 62),
(3, '2022-01-03', 84);

SELECT * FROM activity_staff;

# Task 1
-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

-- ASC - по возрастанию
SELECT * FROM staff
ORDER BY salary ASC; 

-- DESC - по убыванию
SELECT * FROM staff
ORDER BY salary DESC; 

# Task 2
-- Выведите 5 максимальных заработных плат (salary)

-- 5 максимальных 
SELECT salary FROM staff
ORDER BY salary DESC 
LIMIT 5;

-- 5 минимальных
SELECT salary FROM staff
ORDER BY salary ASC 
LIMIT 5;


# Task 3
-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary) FROM staff
GROUP BY post;

# Task 4
-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT COUNT(position) 'white_bone' FROM staff
WHERE position = 'Разработчик' AND age BETWEEN 24 AND 49;

# Task 5
-- Найдите количество специальностей

SELECT position, COUNT(position) FROM staff
GROUP BY position;

# Task 6
-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно

SELECT position FROM staff
GROUP BY position
HAVING AVG(age) <= 30;

# Task 7
-- Выведите id сотрудников, которые напечатали более 500 страниц за всех дни

SELECT staff_id, SUM(count_pages) AS pages_qty FROM activity_staff
GROUP BY staff_id
HAVING pages_qty > 500;

# Task 8
-- Выведите дни, когда работало более 3 сотрудников Также укажите кол-во сотрудников, которые работали в выбранные дни.

SELECT date_activity, COUNT(DISTINCT staff_id) 'staff_qty' FROM activity_staff
GROUP BY date_activity
HAVING staff_qty > 3;

# Task 9
-- Выведите среднюю заработную плату по должностям, которая составляет более 30000

SELECT position, AVG(salary) 'salary_average' FROM staff
GROUP BY position
HAVING salary_average > 30000;