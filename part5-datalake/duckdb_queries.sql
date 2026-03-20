-- Part 5 — Data Lakes & DuckDB
-- Name: Pratibha Rathore
-- Description: Cross-format queries on CSV, JSON, and Parquet files using DuckDB

</>SQL
-- Q1: List all customers along with the total number of orders they have placed.


SELECT 
    c.customer_id,
   COUNT(o.order_id) AS total_orders
FROM read_csv_auto('C:/Users/PRATIBHA/Desktop/datasets/customers.csv') c
LEFT JOIN read_json_auto('C:/Users/PRATIBHA/Desktop/datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;



-- Q2: Find the top 3 customers by total order value

SELECT 
    c.customer_id,
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('C:/Users/PRATIBHA/Desktop/datasets/customers.csv') c
JOIN read_json_auto('C:/Users/PRATIBHA/Desktop/datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 3;


-- Q3: List all products purchased by customers from Bangalore

SELECT 
    o.order_id,
    o.total_amount
FROM read_csv_auto('C:/Users/PRATIBHA/Desktop/datasets/customers.csv') c
JOIN read_json_auto('C:/Users/PRATIBHA/Desktop/datasets/orders.json') o
ON c.customer_id = o.customer_id
WHERE LOWER(c.city) = 'bangalore';


-- Q4: Join all three files to show: customer name, order date, product name, and quantity


SELECT 
    c.customer_id,
    o.order_date,
    p.product_name
FROM read_csv_auto('C:/Users/PRATIBHA/Desktop/datasets/customers.csv') c
JOIN read_json_auto('C:/Users/PRATIBHA/Desktop/datasets/orders.json') o
ON c.customer_id = o.customer_id
CROSS JOIN read_parquet('C:/Users/PRATIBHA/Desktop/datasets/products.parquet') p
LIMIT 20;


-- NOTE:
-- orders.json does not contain product_id, so direct join with products.parquet is not possible.
-- Therefore, Q3 and Q4 are adapted based on available schema.