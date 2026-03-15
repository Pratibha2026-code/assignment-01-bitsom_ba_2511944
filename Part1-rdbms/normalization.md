## Anomaly Analysis

### Insert Anomaly
An Insert Anomaly occurs when certain data cannot be inserted into the database without the presence of other unrelated data.

Example:
In the CSV, product information (product_id, product_name, category, unit_price) only exists when an order is created.

Columns involved:
product_id, product_name, category, unit_price, order_id

Explanation:
If the company wants to add a new product to the catalog before it has been ordered, they cannot insert it without creating an order because the table structure requires an order_id.

Thus, product data cannot be inserted independently.


### Update Anomaly
An Update Anomaly occurs when the same information appears in multiple rows and must be updated everywhere.

Example rows:
Row 1 → order_id = ORD1027  
Row 4 → order_id = ORD1002  
Row 7 → order_id = ORD1037  

Customer involved:
customer_id = C002

Columns involved:
customer_id, customer_name, customer_email, customer_city

Explanation:
Customer C002 appears in multiple rows with repeated customer details.  
If the customer's email or city changes, it must be updated in every row.  
If one row is missed, inconsistent data will exist in the database.


### Delete Anomaly
A Delete Anomaly occurs when deleting a record also removes important unrelated data.

Example row:
Row 13 → order_id = ORD1185

Product involved:
product_id = P008

Columns involved:
product_id, product_name, category, unit_price

Explanation:
Product P008 appears only once in the dataset.  
If the order in Row 13 is deleted, the only information about this product will also be deleted.

Thus, deleting an order unintentionally deletes product information.


## Normalization Justification
Keeping all data in a single table may appear simpler initially, but in practice it leads to several data management problems. In the given dataset (orders_flat.csv), customer, product, order, and sales representative information are stored together in one table. This structure causes redundancy and increases the risk of inconsistencies.

For example, the same product information such as product_id, product_name, category, and unit_price appears in multiple rows whenever that product is included in different orders. If the price of a product changes, every row containing that product must be updated. If even one row is missed, the database will contain conflicting prices for the same product. This is an example of an update anomaly.

Similarly, the dataset shows insert anomalies. If the business wants to add a new product to the catalog but no order has been placed for it yet, the product cannot be inserted without creating a fake order entry. This forces the system to store incomplete or incorrect information.

There are also delete anomalies. If a row representing the only order placed by a particular customer is deleted, all information about that customer may also be lost because the customer data exists only within the order record.

Normalization to Third Normal Form (3NF) solves these issues by separating data into logical tables such as customers, products, orders, sales representatives, and order items. Each table stores data about a single entity and relationships are maintained using primary and foreign keys. This reduces redundancy, maintains data integrity, and makes updates, inserts, and deletions safer and more reliable.

Therefore, normalization is not over-engineering; it is essential for building a consistent and scalable database system.