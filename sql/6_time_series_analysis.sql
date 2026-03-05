-- Step 6: Time Series Analysis

SELECT 
DATE_FORMAT(STR_TO_DATE(InvoiceDate,'%m/%d/%Y %H:%i'),'%Y-%m') AS month,
ROUND(SUM(Quantity * UnitPrice),2) AS revenue
FROM retail_clean
GROUP BY month
ORDER BY month;
