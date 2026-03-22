CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT
);
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(100) NOT NULL
);
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date VALUES
(1,'2023-01-15',15,1,2023),
(2,'2023-02-05',5,2,2023),
(3,'2023-02-20',20,2,2023),
(4,'2023-08-29',29,8,2023),
(5,'2023-12-12',12,12,2023);

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Mumbai Central','Mumbai');

INSERT INTO dim_product VALUES
(1,'Smart TV','Electronics'),
(2,'Laptop','Electronics'),
(3,'T-Shirt','Clothing'),
(4,'Jeans','Clothing'),
(5,'Almonds','Groceries');

INSERT INTO fact_sales VALUES
(1,4,1,1,3,49262.78,147788.34),
(2,5,1,2,11,23226.12,255487.32),
(3,2,1,1,20,48703.39,974067.80),
(4,3,2,2,14,23226.12,325165.68),
(5,1,1,3,10,58851.01,588510.10),
(6,2,3,4,8,1500.00,12000.00),
(7,3,2,3,5,1200.00,6000.00),
(8,4,3,5,12,450.00,5400.00),
(9,1,2,4,6,1800.00,10800.00),
(10,5,3,1,2,52000.00,104000.00);




