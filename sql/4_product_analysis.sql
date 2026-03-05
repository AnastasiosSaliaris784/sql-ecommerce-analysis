-- Step 4: Product Analysis

SELECT
Description,
SUM(Quantity) AS total_quantity
FROM retail_clean
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

SELECT
Description,
ROUND(SUM(Quantity * UnitPrice),2) AS revenue
FROM retail_clean
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;
