SELECT company_name
FROM suppliers
WHERE country IN ('Argentina', 'Spain', 'Mexico');

SELECT DISTINCT country
FROM customers;

SELECT company_name
FROM suppliers
WHERE country IN
      (
        SELECT DISTINCT country
        FROM customers
        );

SELECT DISTINCT s.company_name
FROM suppliers s
JOIN customers USING (country);

-- найти сумму единиц товара разбитых на группу
-- и лимитирующий набор вичислить

SELECT MIN(product_id)
FROM products;

SELECT c.category_name, SUM(units_in_stock)
FROM products p
INNER JOIN categories c USING (category_id)
GROUP BY c.category_name
ORDER BY SUM(units_in_stock)
LIMIT (
    SELECT MIN(product_id) + 4
    FROM products
    );

-- вывести список товаров, количество которого в наличии
-- больше чем в среднем

SELECT AVG(units_in_stock)
FROM products;

SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock > (
    SELECT AVG(units_in_stock)
    FROM products
    )
ORDER BY units_in_stock;