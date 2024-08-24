SELECT company_name, product_name
FROM suppliers
LEFT JOIN products
ON suppliers.supplier_id = products.supplier_id;

-- найти компании, которые делали заказы
SELECT company_name, order_id
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;


-- найти компании, которые не делали заказы
SELECT company_name, order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;

SELECT company_name, order_id
FROM orders
RIGHT JOIN customers
ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;

-- найти работников, которые не обрабатывают заказы
SELECT last_name, order_id, COUNT(*)
FROM employees
LEFT JOIN orders
ON orders.employee_id = employees.employee_id
WHERE order_id IS NULL
GROUP BY last_name, order_id;

SELECT last_name, order_id, COUNT(*)
FROM employees
FULL JOIN orders
ON orders.employee_id = employees.employee_id
GROUP BY last_name, order_id;