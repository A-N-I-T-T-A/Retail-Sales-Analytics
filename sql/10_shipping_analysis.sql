/*
===============================================================================
Description:
Analyze shipping performance, shipping modes, and delivery time.
===============================================================================
*/

USE retail_sales_analytics;

-- ============================================================================
-- Question 51
-- Which shipping mode is used the most?
-- ============================================================================

SELECT
    ship_mode,
    COUNT(*) AS total_shipments
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_shipments DESC;


-- ============================================================================
-- Question 52
-- Which shipping mode generated the highest sales?
-- ============================================================================

SELECT
    ship_mode,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 53
-- Which shipping mode generated the highest profit?
-- ============================================================================

SELECT
    ship_mode,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_profit DESC;


-- ============================================================================
-- Question 54
-- What is the average shipping time (in days)?
-- ============================================================================

SELECT
    ROUND(AVG(DATEDIFF(ship_date, order_date)),2) AS average_shipping_days
FROM retail_sales;


-- ============================================================================
-- Question 55
-- Does faster shipping lead to higher sales?
-- ============================================================================

SELECT
    ship_mode,
    ROUND(AVG(DATEDIFF(ship_date, order_date)),2) AS avg_shipping_days,
    ROUND(AVG(sales),2) AS average_sales,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY ship_mode
ORDER BY avg_shipping_days;