/*
===============================================================================
Description:
Analyze discount patterns and their impact on sales and profitability.
===============================================================================
*/

-- ============================================================================
-- Question 56
-- What is the average discount offered by the company?
-- ============================================================================

SELECT
    ROUND(AVG(discount),2) AS average_discount
FROM retail_sales;


-- ============================================================================
-- Question 57
-- Which products received the highest average discount?
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(AVG(discount),2) AS average_discount
FROM retail_sales
GROUP BY product_id, product_name
ORDER BY average_discount DESC
LIMIT 20;


-- ============================================================================
-- Question 58
-- Which category offers the highest average discount?
-- ============================================================================

SELECT
    category,
    ROUND(AVG(discount),2) AS average_discount
FROM retail_sales
GROUP BY category
ORDER BY average_discount DESC;


-- ============================================================================
-- Question 59
-- Does a higher discount lead to higher sales?
-- ============================================================================

SELECT
    discount,
    COUNT(*) AS total_orders,
    ROUND(AVG(sales),2) AS average_sales,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY discount
ORDER BY discount;


-- ============================================================================
-- Question 60
-- Find products that received high discounts but generated negative profit.
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(AVG(discount),2) AS average_discount,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_id, product_name
HAVING AVG(discount) >= 0.30
   AND SUM(profit) < 0
ORDER BY average_discount DESC, total_profit;