WITH clean_transactions AS (
  SELECT
    transactionId,
    MAX(totalTransactionRevenue) AS transaction_revenue,
    MAX(date) AS transaction_date
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE transactionId IS NOT NULL
  GROUP BY transactionId
)
SELECT
  SUBSTR(transaction_date, 1, 6) AS month,
  COUNT(*) AS transactions,
  SUM(transaction_revenue) / 1000000 AS revenue_usd,
  ROUND(SUM(transaction_revenue) / 1000000 / COUNT(*), 2) AS avg_transaction_value_usd
FROM clean_transactions
GROUP BY month
ORDER BY month;
