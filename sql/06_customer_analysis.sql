/*
===============================================================================
Description:
This module analyzes customer purchasing behavior, identifies high-value
customers, customer segments, repeat customers, and customer rankings.
===============================================================================
*/

USE retail_sales_analytics;

-- ============================================================================
-- Question 21
-- Who are the Top 10 customers by total sales?
-- ============================================================================

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================================
-- Question 22
-- Who are the Top 10 customers by total profit?
-- ============================================================================

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;


-- ============================================================================
-- Question 23
-- Which customer segment generates the highest sales?
-- ============================================================================

SELECT
    segment,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY segment
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 24
-- Which customer segment generates the highest profit?
-- ============================================================================

SELECT
    segment,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY segment
ORDER BY total_profit DESC;


-- ============================================================================
-- Question 25
-- How many customers belong to each segment?
-- ============================================================================

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
GROUP BY segment
ORDER BY total_customers DESC;


-- ============================================================================
-- Question 26
-- Which customers placed the highest number of orders?
-- ============================================================================

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC
LIMIT 10;


-- ============================================================================
-- Question 27
-- Find customers whose total sales are above the average customer sales.
-- ============================================================================

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY customer_id, customer_name
HAVING SUM(sales) >
(
    SELECT AVG(customer_sales)
    FROM
    (
        SELECT
            SUM(sales) AS customer_sales
        FROM retail_sales
        GROUP BY customer_id
    ) AS avg_sales
)
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 28
-- Rank customers based on total sales.
-- ============================================================================

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    RANK() OVER
    (
        ORDER BY SUM(sales) DESC
    ) AS customer_rank
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY customer_rank;