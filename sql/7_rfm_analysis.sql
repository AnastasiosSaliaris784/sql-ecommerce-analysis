CREATE TABLE rfm_base AS
SELECT
    CustomerID,
    
    DATEDIFF(
        '2011-12-10',
        MAX(STR_TO_DATE(InvoiceDate,'%m/%d/%Y %H:%i'))
    ) AS recency,

    COUNT(DISTINCT InvoiceNo) AS frequency,

    ROUND(SUM(Quantity * UnitPrice),2) AS monetary

FROM retail_clean
GROUP BY CustomerID;


SELECT *
FROM rfm_base
ORDER BY monetary DESC
LIMIT 10;


CREATE TABLE rfm_scores AS
SELECT *,
    
    NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
    
    NTILE(5) OVER (ORDER BY frequency) AS f_score,
    
    NTILE(5) OVER (ORDER BY monetary) AS m_score

FROM rfm_base;

SELECT
CustomerID,
recency,
frequency,
monetary,
r_score,
f_score,
m_score,
(r_score + f_score + m_score) AS rfm_total
FROM rfm_scores
ORDER BY rfm_total DESC;

SELECT
CustomerID,
recency,
frequency,
monetary,
r_score,
f_score,
m_score,

CASE
    WHEN r_score >=4 AND f_score >=4 AND m_score >=4 THEN 'Champions'
    WHEN r_score >=3 AND f_score >=3 AND m_score >=3 THEN 'Loyal Customers'
    WHEN r_score >=4 AND f_score <=2 THEN 'New Customers'
    WHEN r_score <=2 AND f_score >=3 THEN 'At Risk'
    ELSE 'Regular Customers'
END AS segment

FROM rfm_scores;

SELECT 
segment,
COUNT(*) AS number_of_customers
FROM
(
SELECT
CustomerID,
CASE
    WHEN r_score >=4 AND f_score >=4 AND m_score >=4 THEN 'Champions'
    WHEN r_score >=3 AND f_score >=3 AND m_score >=3 THEN 'Loyal Customers'
    WHEN r_score >=4 AND f_score <=2 THEN 'New Customers'
    WHEN r_score <=2 AND f_score >=3 THEN 'At Risk'
    ELSE 'Regular Customers'
END AS segment
FROM rfm_scores
) AS segmented_customers
GROUP BY segment
ORDER BY number_of_customers DESC;
