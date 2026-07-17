/*
===============================================================================
Description:
Analyze profitability across products and categories, identify
loss-making products, and evaluate the impact of discounts.
===============================================================================
*/

USE retail_sales_analytics;

-- ============================================================================
-- Question 45
-- What is the profit margin (%) for each category?
-- ============================================================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin_percentage
FROM retail_sales
GROUP BY category
ORDER BY profit_margin_percentage DESC;


-- ============================================================================
-- Question 46
-- Which category has the highest average profit per transaction?
-- ============================================================================

SELECT
    category,
    ROUND(AVG(profit),2) AS average_profit
FROM retail_sales
GROUP BY category
ORDER BY average_profit DESC;


-- ============================================================================
-- Question 47
-- Which products generated an overall negative profit?
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
-- Question 48
-- What is the relationship between discount and profit?
-- (Grouped by discount level)
-- ============================================================================

SELECT
    discount,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit),2) AS average_profit,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY discount
ORDER BY discount;


-- ============================================================================
-- Question 49
-- Show the Top 20 most profitable products.
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_id, product_name
ORDER BY total_profit DESC
LIMIT 20;


-- ============================================================================
-- Question 50
-- Show the Bottom 20 least profitable products.
-- ============================================================================

SELECT
    product_id,
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_id, product_name
ORDER BY total_profit ASC
LIMIT 20;