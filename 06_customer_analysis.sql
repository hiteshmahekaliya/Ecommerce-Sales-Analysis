SELECT
  COUNT(DISTINCT visitId) AS total_sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  ROUND(COUNT(DISTINCT visitId) / COUNT(DISTINCT fullVisitorId), 2) AS avg_sessions_per_visitor
FROM `data-to-insights.ecommerce.all_sessions`;

SELECT AVG(timeOnSite) AS average_time_on_site_seconds
FROM `data-to-insights.ecommerce.all_sessions`
WHERE timeOnSite IS NOT NULL;

SELECT AVG(pageviews) AS average_pageviews_per_session
FROM `data-to-insights.ecommerce.all_sessions`
WHERE pageviews IS NOT NULL;
