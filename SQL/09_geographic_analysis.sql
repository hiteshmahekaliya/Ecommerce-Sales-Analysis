WITH clean_transactions AS (
  SELECT transactionId,
         MAX(totalTransactionRevenue) AS transaction_revenue,
         MAX(country) AS country
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE transactionId IS NOT NULL
  GROUP BY transactionId
)
SELECT country, COUNT(*) AS transactions,
       SUM(transaction_revenue) / 1000000 AS revenue_usd
FROM clean_transactions
GROUP BY country
ORDER BY revenue_usd DESC
LIMIT 10;

WITH clean_transactions AS (
  SELECT transactionId,
         MAX(totalTransactionRevenue) AS transaction_revenue,
         MAX(city) AS city
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE transactionId IS NOT NULL
  GROUP BY transactionId
)
SELECT city, COUNT(*) AS transactions,
       SUM(transaction_revenue) / 1000000 AS revenue_usd
FROM clean_transactions
WHERE city != 'not available in demo dataset'
GROUP BY city
ORDER BY revenue_usd DESC
LIMIT 10;
