/*
===============================================================================
Description:
This module analyzes sales performance over time and identifies
important business trends.
===============================================================================
*/

USE retail_sales_analytics;

-- ============================================================================
-- Question 11
-- Which year generated the highest sales?
-- ============================================================================

SELECT
    YEAR(order_date) AS sales_year,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY sales_year
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 12
-- Which month generated the highest sales?
-- ============================================================================

SELECT
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY month_number, month_name
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 13
-- Show the monthly sales trend.
-- ============================================================================

SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY sales_year, month_number, month_name
ORDER BY sales_year, month_number;


-- ============================================================================
-- Question 14
-- Which quarter generated the highest sales?
-- ============================================================================

SELECT
    QUARTER(order_date) AS quarter,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY quarter
ORDER BY total_sales DESC;


-- ============================================================================
-- Question 15
-- Which day of the week receives the highest number of orders?
-- ============================================================================

SELECT
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY day_name
ORDER BY total_orders DESC;


-- ============================================================================
-- Question 16
-- Show the Top 10 highest-value orders.
-- ============================================================================

SELECT
    order_id,
    customer_name,
    ROUND(SUM(sales),2) AS order_value
FROM retail_sales
GROUP BY order_id, customer_name
ORDER BY order_value DESC
LIMIT 10;


-- ============================================================================
-- Question 17
-- Which orders generated more than $5,000 in sales?
-- ============================================================================

SELECT
    order_id,
    customer_name,
    ROUND(SUM(sales),2) AS order_value
FROM retail_sales
GROUP BY order_id, customer_name
HAVING SUM(sales) > 5000
ORDER BY order_value DESC;


-- ============================================================================
-- Question 18
-- Which month has the highest average sales?
-- ============================================================================

SELECT
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(AVG(sales),2) AS average_sales
FROM retail_sales
GROUP BY month_number, month_name
ORDER BY average_sales DESC;


-- ============================================================================
-- Question 19
-- Show Year-over-Year Sales.
-- ============================================================================

SELECT
    YEAR(order_date) AS sales_year,
    ROUND(SUM(sales),2) AS yearly_sales
FROM retail_sales
GROUP BY sales_year
ORDER BY sales_year;


-- ============================================================================
-- Question 20
-- Calculate cumulative (running) sales over time.
-- ============================================================================

SELECT
    order_date,
    ROUND(SUM(sales),2) AS daily_sales,
    ROUND(
        SUM(SUM(sales)) OVER (
            ORDER BY order_date
        ),
        2
    ) AS running_sales
FROM retail_sales
GROUP BY order_date
ORDER BY order_date;