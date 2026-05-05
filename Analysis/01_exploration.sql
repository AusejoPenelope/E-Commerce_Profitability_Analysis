DESCRIBE marketing_spend_raw;
DESCRIBE orders_raw;
DESCRIBE products_raw;

SELECT * FROM orders_raw LIMIT 10;
SELECT * FROM marketing_spend_raw LIMIT 10;
SELECT * FROM products_raw LIMIT 10;

-- Checking if there are any duplicates in the orders table
SELECT order_id, COUNT(*) AS cnt
FROM orders_raw
GROUP BY order_id
HAVING cnt > 1
ORDER BY cnt DESC;

-- Same for the products table
SELECT product_id, COUNT(*) AS cnt
FROM products_raw
GROUP BY product_id
HAVING cnt > 1
ORDER BY cnt DESC;

-- Same for the marketing_spend one. Here we can only check for duplicates using both the platform and the monht column, because neither one is unique, so I am going to use CONCAT.
SELECT CONCAT(platform,' ', month), COUNT(CONCAT(platform,' ', month)) AS cnt
FROM marketing_spend_raw
GROUP BY CONCAT(platform,' ', month)
HAVING cnt > 1;

-- Checking if there are any NEGATIVE NUMBERS or NULLS in the amount columns
SELECT
    SUM(CASE WHEN gross_revenue < 0 OR gross_revenue IS NULL THEN 1 ELSE 0 END) AS bad_gross_revenue,
    SUM(CASE WHEN discount_amount < 0 OR discount_amount IS NULL THEN 1 ELSE 0 END) AS bad_discount_amount,
    SUM(CASE WHEN shipping_cost < 0 OR shipping_cost IS NULL THEN 1 ELSE 0 END) AS bad_shipping_cost,
    SUM(CASE WHEN product_cost < 0 OR product_cost IS NULL THEN 1 ELSE 0 END) AS bad_product_cost,
    SUM(CASE WHEN platform_fee < 0 THEN 1 ELSE 0 END) AS bad_platform_fee,
    SUM(CASE WHEN transaction_fee < 0 THEN 1 ELSE 0 END) AS bad_transaction_fee,
    SUM(CASE WHEN refund_amount < 0 THEN 1 ELSE 0 END) AS bad_refund_amount,
    SUM(CASE WHEN total_costs < 0 OR total_costs IS NULL THEN 1 ELSE 0 END) AS bad_total_costs,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS bad_profit,
    SUM(CASE WHEN net_revenue IS NULL THEN 1 ELSE 0 END) AS bad_net_revenue
FROM orders_raw;

-- Checking for outliers, although I could also check it by clicking 
SELECT
    MIN(gross_revenue) AS min_gross,
    MAX(gross_revenue) AS max_gross,
    MIN(product_cost) AS min_cost,
    MAX(product_cost) AS max_cost,
    MIN(shipping_cost) AS min_shipping,
    MAX(shipping_cost) AS max_shipping,
    MIN(platform_fee) AS min_platform_fee,
    MAX(platform_fee) AS max_platform_fee,
    MIN(transaction_fee) AS min_transaction_fee,
    MAX(transaction_fee) AS max_transaction_fee,
    MIN(total_costs) AS min_total_costs,
    MAX(total_costs) AS max_total_costs,
    MIN(profit) AS min_profit,
    MAX(profit) AS max_profit
FROM orders_raw;

SELECT * FROM orders_raw;

SELECT platform_fee
FROM orders_raw
ORDER BY platform_fee DESC
;

-- Check if total_costs and profit are mathematically correct
SELECT * FROM orders_raw;

-- Total Costs
SELECT   order_id, total_costs - ROUND((shipping_cost + product_cost + platform_fee + transaction_fee), 2) AS Diff
FROM orders_raw
HAVING Diff <> 0
;

-- Profit
SELECT 
    order_id,
    profit,
    ROUND(net_revenue - total_costs, 2) AS calculated_profit,
    profit - ROUND(net_revenue - total_costs, 2) AS Diff
FROM orders_raw
HAVING Diff <> 0;

-- Checking for NULL values
SELECT 
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(primary_category IS NULL) AS missing_category,
    SUM(gross_revenue IS NULL) AS missing_revenue,
    SUM(total_costs IS NULL) AS missing_total_costs,
    SUM(profit IS NULL) AS missing_profit
FROM orders_raw;

-- Checking the return column to make sure there are only two values (Yes and No)
SELECT DISTINCT returned
FROM orders_raw;

