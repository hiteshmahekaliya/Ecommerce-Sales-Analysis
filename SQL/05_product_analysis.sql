SELECT
  v2ProductName AS product,
  SUM(productQuantity) AS units_sold
FROM `data-to-insights.ecommerce.all_sessions`
WHERE transactionId IS NOT NULL
  AND productQuantity > 0
  AND v2ProductName IS NOT NULL
GROUP BY v2ProductName
ORDER BY units_sold DESC
LIMIT 10;

SELECT
  v2ProductName AS product,
  SUM(productQuantity) AS units_sold,
  SUM(productRevenue) / 1000000 AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE transactionId IS NOT NULL
  AND productQuantity > 0
  AND productRevenue > 0
  AND v2ProductName IS NOT NULL
GROUP BY v2ProductName
ORDER BY revenue_usd DESC
LIMIT 10;
