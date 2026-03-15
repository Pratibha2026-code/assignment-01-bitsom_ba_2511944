CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
('C101','Rahul Sharma','rahul@email.com','Delhi'),
('C102','Neha Verma','neha@email.com','Mumbai'),
('C103','Amit Singh','amit@email.com','Pune'),
('C104','Priya Patel','priya@email.com','Ahmedabad'),
('C105','Rohan Das','rohan@email.com','Kolkata');

INSERT INTO products VALUES
('P101','Laptop','Electronics',60000),
('P102','Mobile Phone','Electronics',30000),
('P103','Keyboard','Accessories',1000),
('P104','Mouse','Accessories',700),
('P105','Headphones','Electronics',2500);

INSERT INTO sales_reps VALUES
('S101','Ankit Mehta','ankit@company.com','Delhi Office'),
('S102','Sneha Kapoor','sneha@company.com','Mumbai Office'),
('S103','Raj Malhotra','raj@company.com','Bangalore Office'),
('S104','Pooja Sharma','pooja@company.com','Hyderabad Office'),
('S105','Karan Verma','karan@company.com','Chennai Office');

INSERT INTO orders VALUES
(1,'C101','S101','2024-01-10'),
(2,'C102','S102','2024-01-11'),
(3,'C103','S103','2024-01-12'),
(4,'C104','S104','2024-01-13'),
(5,'C105','S105','2024-01-14');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,'P101',1),
(2,'P102',2),
(3,'P103',3),
(4,'P104',1),
(5,'P105',2);