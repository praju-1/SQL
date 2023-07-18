-- 1. Last name starts with MY or contains SE

SELECT * FROM sql_store.customers
WHERE last_name LIKE "MY%" or "SE";

-- 2.	Last name contains b followed by R or U

SELECT * FROM customers
WHERE last_name LIKE "r" or "u";

-- 3.	Get the orders that are not shipped

SELECT * FROM orders
WHERE shipper_id IS NULL;

-- 4. Return all the products name, unit price and new price as(unit_price *1.1)

SELECT name, unit_price, unit_price*1.1 AS new_price FROM products


-- 5.	Start order itmes by order_id = 2 descending orders as per their total price
SELECT name, quantity_in_stock, unit_price, quantity_in_stock * unit_price AS "Total_price" FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;

-- 6. Get the top 3 loyal customers
SELECT * FROM customers
ORDER BY Points DESC
limit 3;

-- 7.	Join order_items table with products
SELECT * FROM order_items o
JOIN products p
ON o.product_id = p.product_id;

-- 8.	In sql_invoicing join 3 tables payment, client, payment_methods and show name of the client and payment method
SELECT payment_method, c.name FROM sql_invoicing.payments p
JOIN sql_invoicing.clients c
ON p.client_id = c.client_id

JOIN sql_invoicing.payment_methods pm
ON p.payment_id = pm.payment_method_id;

-- 9.	Join product with order_items table and show product_id, product name, and quantity
SELECT p.product_id, p.name, quantity FROM sql_store.products p
JOIN sql_store.order_items oi
ON p.product_id = oi.product_id;


-- 10.	Get all rows with these columns – order_date, order_id, first_name, shipper, status
SELECT c.first_name, o.order_date, s.name, o.status FROM sql_store.customers c
LEFT JOIN sql_store.orders o
ON c.customer_id = o.customer_id

LEFT JOIN sql_store.shippers s
ON s.shipper_id = o.shipper_id;


-- 11.	Write a query from sql_invoicing to get date, client name, amount, payment method
SELECT p.date, c.name, p.amount, p.payment_method FROM sql_invoicing.clients c
JOIN sql_invoicing.payments p
ON c.client_id = p.client_id

JOIN sql_invoicing.payment_methods pm
ON p.payment_method = pm.payment_method_id;

-- 12.	Get customer_id, first_name, points, type 0-1000 bronze, 2000-3000 silver and 3000> gold
SELECT customer_id, first_name, points FROM sql_store.customers
WHERE points BETWEEN 0 AND 1000 ;

-- 13. 	Last name ends with EY or ON
SELECT * FROM customers
WHERE last_name LIKE "%EY" or "%ON";

-- 14.	Get the customers whose phone numbers ends with 9
SELECT * FROM customers
WHERE phone LIKE "%9";

-- 15.	From order_items tables, get the items for the order number 6 where the total price >30
SELECT order_id, product_id, quantity, unit_price, quantity * unit_price AS Total_price 
FROM order_items;

 -- 16.	Get the order placed in 2019

 SELECT * FROM orders
 WHERE order_date >= "2019-01-01";

 -- 17. Return the product with quantity in stock equal to 49, 38, 72.

SELECT * FROM products
WHERE quantity_in_stock IN (49,38, 72)

-- 18 Return the customers born between '1990-01-01' and '2000-1-1'

SELECT * FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- 19. Find the products that have never been ordered.

SELECT * FROM products p
WHERE NOT EXISTS (
	SELECT product_id
	FROM order_items
	WHERE product_id = p.product_id
);

-- 20. Write a stored procedure call get_payments with two parameters
--1. client_id = INT(4)
--2. payment_method_id = TINYINT(1)(0-255)

