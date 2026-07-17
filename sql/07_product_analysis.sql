/*
===============================================================================
Description:
Analyze product performance, identify best-selling products,
loss-making products, and category performance.
===============================================================================
*/

USE retail_sales_analytics;

-- ============================================================================
-- Question 29
-- Which are the Top 10 products by sales?
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY product_id, product_name
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================================
-- Question 30
-- Which are the Top 10 products by profit?
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_id, product_name
ORDER BY total_profit DESC
LIMIT 10;


-- ============================================================================
-- Question 31
-- Which products generated an overall loss?
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_id, product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;


-- ============================================================================
-- Question 32
-- Which product category generated the highest sales?
-- ============================================================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 33
-- Which product category generated the highest profit?
-- ============================================================================

SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY category
ORDER BY total_profit DESC;


-- ============================================================================
-- Question 34
-- Which sub-category generated the highest sales?
-- ============================================================================

SELECT
    sub_category,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY sub_category
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 35
-- Which products have never generated a profit?
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_id, product_name
HAVING SUM(profit) <= 0
ORDER BY total_profit;


-- ============================================================================
-- Question 36
-- Rank products based on total sales.
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(sales),2) AS total_sales,

    DENSE_RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank

FROM retail_sales
GROUP BY product_id, product_name
ORDER BY sales_rank;