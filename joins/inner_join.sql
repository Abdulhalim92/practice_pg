SELECT products.product_name,
       suppliers.company_name,
       products.units_in_stock
FROM products
INNER JOIN suppliers
ON products.supplier_id = suppliers.supplier_id
ORDER BY products.units_in_stock DESC;

-- подчситать сколько единиц товара в продаже
-- по категориям
SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY  SUM(units_in_stock) DESC
LIMIT 5;

-- подсчитать сумму на каторую продается товар
-- по категориям, которые больше не будут в продаже
SELECT category_name, SUM(unit_price*units_in_stock)
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE discontinued <> 1
GROUP BY category_name
HAVING SUM(unit_price*units_in_stock) > 5000
ORDER BY SUM(unit_price*units_in_stock) DESC;

-- просмотр на каких работниках завязаны заказы
SELECT order_id, customer_id, first_name, last_name, title
FROM orders
INNER JOIN employees
ON orders.employee_id = employees.employee_id;

-- найти дату когда был сделан заказ,
-- куда его доставить, цену, количество и скиду
SELECT order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.product_id;

SELECT contact_name, company_name, phone, first_name, last_name,
       title, order_date, product_name, ship_country,
       products.unit_price, quantity, discount
FROM orders
JOIN order_details
ON orders.order_id = order_details.order_id
JOIN products
ON order_details.product_id = products.product_id
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN employees
ON orders.employee_id = employees.employee_id
WHERE ship_country = 'USA';