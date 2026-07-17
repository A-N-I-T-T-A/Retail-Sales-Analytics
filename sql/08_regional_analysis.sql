/*
===============================================================================
Description:
Analyze sales and profit performance across different regions, states,
and cities to identify top-performing and loss-making locations.
===============================================================================
*/

USE retail_sales_analytics;

-- ============================================================================
-- Question 37
-- Which region generated the highest sales?
-- ============================================================================

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 38
-- Which state generated the highest sales?
-- ============================================================================

SELECT
    state_province,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY state_province
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 39
-- Which city generated the highest sales?
-- ============================================================================

SELECT
    city,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================================
-- Question 40
-- Which region generated the highest profit?
-- ============================================================================

SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY region
ORDER BY total_profit DESC;


-- ============================================================================
-- Question 41
-- Which states are operating at an overall loss?
-- ============================================================================

SELECT
    state_province,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY state_province
HAVING SUM(profit) < 0
ORDER BY total_profit;


-- ============================================================================
-- Question 42
-- Which cities generated the highest profit?
-- ============================================================================

SELECT
    city,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY city
ORDER BY total_profit DESC
LIMIT 10;


-- ============================================================================
-- Question 43
-- Compare sales and profit across regions.
-- ============================================================================

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 44
-- Rank states based on total sales.
-- ============================================================================

SELECT
    state_province,
    ROUND(SUM(sales),2) AS total_sales,

    DENSE_RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank

FROM retail_sales
GROUP BY state_province
ORDER BY sales_rank;