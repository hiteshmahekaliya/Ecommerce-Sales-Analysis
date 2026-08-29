SELECT
  eCommerceAction_type,
  COUNT(*) AS rows_count
FROM `data-to-insights.ecommerce.all_sessions`
WHERE eCommerceAction_type IS NOT NULL
GROUP BY eCommerceAction_type
ORDER BY rows_count DESC;

SELECT
  COUNT(DISTINCT CASE WHEN eCommerceAction_type = '2' THEN visitId END) AS product_view_sessions,
  COUNT(DISTINCT CASE WHEN eCommerceAction_type = '3' THEN visitId END) AS add_to_cart_sessions,
  COUNT(DISTINCT CASE WHEN eCommerceAction_type = '5' THEN visitId END) AS checkout_sessions,
  COUNT(DISTINCT CASE WHEN eCommerceAction_type = '6' THEN visitId END) AS purchase_sessions
FROM `data-to-insights.ecommerce.all_sessions`;
