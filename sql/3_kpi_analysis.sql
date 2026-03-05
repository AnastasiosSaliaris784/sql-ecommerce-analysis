-- Step 3: KPI Analysis

SELECT ROUND(SUM(Quantity * UnitPrice),2) AS total_revenue
FROM retail_clean;

SELECT COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail_clean;

SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM retail_clean;
