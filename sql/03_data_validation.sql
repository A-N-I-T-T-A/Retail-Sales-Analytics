-- Total records
SELECT COUNT(*) AS total_records
FROM retail_sales;

-- First 10 rows

SELECT *
FROM retail_sales
LIMIT 10;


-- Date range

SELECT
MIN(order_date),
MAX(order_date)
FROM retail_sales;

-- Total Sales

SELECT SUM(sales)
FROM retail_sales;


-- Total Profit

SELECT SUM(profit)
FROM retail_sales;


-- Total Customers

SELECT COUNT(DISTINCT customer_id)
FROM retail_sales;


-- Total Orders

SELECT COUNT(DISTINCT order_id)
FROM retail_sales;