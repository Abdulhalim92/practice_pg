SELECT DISTINCT company_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_details USING (order_id)
WHERE quantity > 40;

SELECT customer_id
FROM orders
JOIN order_details USING (order_id)
WHERE quantity > 40;

SELECT DISTINCT company_name
FROM customers
WHERE customer_id = ANY (
    SELECT customer_id
    FROM orders
    JOIN order_details USING (order_id)
    WHERE quantity > 40
    );

-- выбрать продукты коточество которых больше среднего по заказам
SELECT AVG(quantity)
FROM order_details;

SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING (product_id)
WHERE quantity > (
    SELECT AVG(quantity)
    FROM order_details
    )
ORDER BY quantity;

-- найти все продукты количество которых больше среднего значения
-- количества заказанных товаров из групп полученных группированием
-- по product_id
SELECT AVG(quantity)
FROM order_details
GROUP BY product_id;

SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING (product_id)
WHERE quantity > ALL (
    SELECT AVG(quantity)
    FROM order_details
    GROUP BY product_id
    )
ORDER BY quantity;