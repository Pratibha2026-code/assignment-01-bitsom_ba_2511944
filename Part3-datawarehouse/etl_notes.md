## ETL Decisions

### Decision 1  — Standardizing Date Formats

Problem:
The raw dataset contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY, and text-based formats. This inconsistency made it difficult to correctly group and analyze data by time (e.g., monthly sales trends).

Resolution:
All date values were converted into a standard YYYY-MM-DD format before loading into the data warehouse. Additionally, separate fields like day, month, and year were extracted and stored in the dim_date table to support efficient querying and aggregation.

### Decision 2  — Handling NULL and Missing Values

Problem:
Some records in the dataset had missing values (NULLs), especially in fields like store, product, or price. These NULL values could lead to incorrect aggregations or failed joins in the star schema.

Resolution:
Missing values were handled by either removing incomplete records or replacing them with appropriate default values where possible. For example, rows with missing critical identifiers (like product or store) were excluded, while numeric fields were validated to ensure no NULL values were inserted into the fact table.

### Decision 3 — Standardizing Category Casing

Problem:
Product categories in the raw data were inconsistent (e.g., electronics, Electronics, ELECTRONICS). This would cause incorrect grouping in analytical queries, treating the same category as multiple different values.

Resolution:
All category values were standardized to a consistent format (e.g., Electronics, Clothing, Groceries) before inserting into the dim_product table. This ensured accurate aggregation and reporting across categories.
