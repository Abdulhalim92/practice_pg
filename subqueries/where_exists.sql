SELECT company_name, contact_name
FROM customers
WHERE EXISTS (
    SELECT customer_id
    FROM orders
    WHERE customer_id = customers.customer_id
    AND freight BETWEEN 50 AND 100
);

-- найти заказчиков, котоые не делали заказы с 1 по 15 февраля
SELECT company_name, contact_name
FROM customers
WHERE NOT EXISTS (
    SELECT customer_id
    FROM orders
    WHERE customer_id = customers.customer_id
    AND order_date BETWEEN '1995-02-01' AND '1995-02-15'
);

-- выбрать товары, которые не покупались с 1 по 15 февраля 1995 года
SELECT product_name
FROM products
WHERE NOT EXISTS (
    SELECT orders.order_id
    FROM orders
    JOIN order_details USING (order_id)
    WHERE order_details.product_id = product_id
    AND order_date BETWEEN '1995-02-01' AND '1995-02-15'
);