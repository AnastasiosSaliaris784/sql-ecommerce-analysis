-- Step 5: Country Analysis

SELECT
TRIM(Country) AS country,
ROUND(SUM(Quantity * UnitPrice),2) AS revenue
FROM retail_clean
GROUP BY country
ORDER BY revenue DESC;
