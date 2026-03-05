-- E-commerce Sales Analysis using SQL
-- Step 2: Data Cleaning

CREATE TABLE retail_clean AS
SELECT *
FROM raw_online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND InvoiceNo NOT LIKE 'C%';
