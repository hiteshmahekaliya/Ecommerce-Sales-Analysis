SELECT
  channelGrouping,
  COUNT(DISTINCT visitId) AS sessions
FROM `data-to-insights.ecommerce.all_sessions`
WHERE channelGrouping IS NOT NULL
GROUP BY channelGrouping
ORDER BY sessions DESC;

WITH clean_transactions AS (
  SELECT transactionId, MAX(totalTransactionRevenue) AS transaction_revenue,
         MAX(channelGrouping) AS channel
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE transactionId IS NOT NULL
  GROUP BY transactionId
),
channel_sessions AS (
  SELECT channelGrouping AS channel, COUNT(DISTINCT visitId) AS sessions
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE channelGrouping IS NOT NULL
  GROUP BY channelGrouping
)
SELECT s.channel, s.sessions,
       COUNT(t.transactionId) AS transactions,
       SUM(t.transaction_revenue) / 1000000 AS revenue_usd
FROM channel_sessions s
LEFT JOIN clean_transactions t ON s.channel = t.channel
GROUP BY s.channel, s.sessions
ORDER BY revenue_usd DESC;

WITH clean_transactions AS (
  SELECT transactionId, MAX(channelGrouping) AS channel
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE transactionId IS NOT NULL
  GROUP BY transactionId
),
channel_sessions AS (
  SELECT channelGrouping AS channel, COUNT(DISTINCT visitId) AS sessions
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE channelGrouping IS NOT NULL
  GROUP BY channelGrouping
),
channel_transactions AS (
  SELECT channel, COUNT(*) AS transactions
  FROM clean_transactions
  GROUP BY channel
)
SELECT s.channel, s.sessions,
       COALESCE(t.transactions, 0) AS transactions,
       ROUND(COALESCE(t.transactions, 0) / s.sessions * 100, 2) AS conversion_rate_percent
FROM channel_sessions s
LEFT JOIN channel_transactions t ON s.channel = t.channel
ORDER BY conversion_rate_percent DESC;
