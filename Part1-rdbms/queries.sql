SELECT 
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.unit_price) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;

SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

SELECT 
    sr.sales_rep_id,
    sr.sales_rep_name,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM sales_reps sr
LEFT JOIN orders o 
ON sr.sales_rep_id = o.sales_rep_id
GROUP BY sr.sales_rep_id, sr.sales_rep_name;

SELECT 
    o.order_id,
    SUM(oi.quantity * p.unit_price) AS total_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_order_value > 10000
ORDER BY total_order_value DESC;

SELECT 
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
