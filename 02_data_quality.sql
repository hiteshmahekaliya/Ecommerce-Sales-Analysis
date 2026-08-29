SELECT COUNT(*) AS total_rows,
COUNTIF(fullVisitorId IS NULL) AS missing_visitor_id,
COUNTIF(country IS NULL) AS missing_country,
COUNTIF(city IS NULL) AS missing_city,
COUNTIF(totalTransactionRevenue IS NULL) AS missing_revenue,
COUNTIF(transactions IS NULL) AS missing_transactions,
COUNTIF(timeOnSite IS NULL) AS missing_time,
COUNTIF(pageviews IS NULL) AS missing_pageviews,
COUNTIF(productQuantity IS NULL) AS missing_product_quantity,
COUNTIF(v2ProductName IS NULL) AS missing_product_name,
COUNTIF(transactionId IS NULL) AS missing_transaction_id
FROM `data-to-insights.ecommerce.all_sessions`;

SELECT MAX(productQuantity) AS maximum_quantity,
MIN(productQuantity) AS minimum_quantity,
COUNT(*) AS total_product_rows,
COUNTIF(productQuantity > 100) AS rows_above_100
FROM `data-to-insights.ecommerce.all_sessions`;

SELECT COUNT(*) AS transaction_rows,
COUNT(DISTINCT transactionId) AS unique_transactions
FROM `data-to-insights.ecommerce.all_sessions`
WHERE transactionId IS NOT NULL;
