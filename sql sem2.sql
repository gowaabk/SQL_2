/*
1. Используя операторы языка SQL, 
создайте таблицу “sales”.
Заполните ее данными.Справа располагается рисунок к первому заданию.
*/

-- Удаляем БД lesson2 если она есть
DROP DATABASE IF EXISTS lesson2;
-- Создание БД
CREATE DATABASE IF NOT EXISTS lesson2; -- Создание БД lesson2
-- Подключение к БД 
USE lesson2; -- Работаем в БД lesson2
-- Создание таблицы 
CREATE TABLE IF NOT EXISTS sales
(
	 -- создаем столбцы
     id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- столбец id  - первичный ключ
     order_date DATE NOT NULL, -- дата заказа
     count_product INT -- в конуе не ставится запятая
);

-- Заполнение таблицы данными 
INSERT INTO sales(order_date, count_product)
VALUES
	("2022-01-01", 156),
    ("2022-01-02", 180),
    ("2022-01-03", 21),
    ("2022-01-04", 124),
    ("2022-01-05", 341);

SELECT * FROM sales;

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ

*/

SELECT 
	id AS "ID заказа",
	CASE 
		WHEN count_product < 100 THEN "Маленький заказ"
		WHEN count_product BETWEEN 100 AND 300 
				      THEN "Средний заказ"
		WHEN count_product > 300 THEN "Большой заказ"
       	END AS "Тип заказа"	
FROM sales; 

-- USE lesson2;
SELECT 
	id AS "ID заказа",
	IF (count_product < 100, "Маленький заказ", 
		IF (count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ") 
			-- IF (count_product > 300, "Большой заказ",)  
		)
AS "Тип заказа"	
FROM sales;



/*
 3. Создайте таблицу “orders”, заполните ее значениями
 Выберите все заказы.
 В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/
CREATE TABLE IF NOT EXISTS orders
(
	 -- создаем столбцы
     id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- столбец id  - первичный ключ
     employee_id VARCHAR(3) NOT NULL, 
     amount DECIMAL(9,2),
     order_status VARCHAR(10)
);

INSERT INTO orders(employee_id, amount, order_status)
VALUES
	("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e04", 22.18, "OPEN"),
    ("e02", 9.50, "CANCELLED");

SELECT * FROM orders;

SELECT 
	id AS "ID заказа",
	CASE 
		WHEN order_status = "OPEN" THEN "Order is in open state"
		WHEN order_status = "CLOSED" THEN "Order is closed"
		WHEN order_status = "CANCELLED" THEN "Order is cancelled"
       	END AS "full_order_status"	
FROM orders;

SELECT 
	id AS "ID заказа",
	IF (order_status = "OPEN", "Order is in open state", 
		IF (order_status = "CLOSED", "Order is closed", "Order is cancelled")
			-- IF (count_product > 300, "Большой заказ",)  
		)
AS "full_order_status"	
FROM orders; 