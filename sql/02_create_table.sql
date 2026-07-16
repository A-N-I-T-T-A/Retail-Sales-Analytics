CREATE TABLE retail_sales (

    row_id INT PRIMARY KEY,

    order_id VARCHAR(30),

    order_date DATE,

    ship_date DATE,

    ship_mode VARCHAR(50),

    customer_id VARCHAR(30),

    customer_name VARCHAR(100),

    segment VARCHAR(50),

    country_region VARCHAR(100),

    city VARCHAR(100),

    state_province VARCHAR(100),

    postal_code VARCHAR(20),

    region VARCHAR(50),

    product_id VARCHAR(50),

    category VARCHAR(50),

    sub_category VARCHAR(100),

    product_name VARCHAR(255),

    sales DECIMAL(10,2),

    quantity INT,

    discount DECIMAL(5,2),

    profit DECIMAL(10,2)

);