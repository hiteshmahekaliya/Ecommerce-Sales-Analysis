WITH clean_transactions AS (
  SELECT
    transactionId,
    MAX(totalTransactionRevenue) AS transaction_revenue
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE transactionId IS NOT NULL
  GROUP BY transactionId
)
SELECT
  COUNT(*) AS unique_transactions,
  SUM(transaction_revenue) / 1000000 AS total_revenue_usd,
  AVG(transaction_revenue) / 1000000 AS average_transaction_value_usd
FROM clean_transactions;
