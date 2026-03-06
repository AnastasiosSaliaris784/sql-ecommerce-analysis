-- Step 3: KPI Analysis

SELECT ROUND(SUM(Quantity * UnitPrice),2) AS total_revenue
       ,COUNT(DISTINCT InvoiceNo) AS total_orders
       ,COUNT(DISTINCT CustomerID) AS total_customers
FROM retail_clean;
