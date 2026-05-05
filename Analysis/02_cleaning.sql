-- First, we are going to create a clean table out of orders because this one need some cleaning. The other 2 tables are ok.
CREATE TABLE orders_clean AS
SELECT
    order_id,
    customer_id,
    order_date,
    channel,
    payment_method,
    region,
    items_ordered,
    primary_category,
    gross_revenue,
    discount_pct,
    discount_amount,
    shipping_cost,
    product_cost,
    platform_fee,
    transaction_fee,
    returned,
    refund_amount,
    net_revenue,
    total_costs,
    profit
FROM orders_raw;

-- Clean and standardize the order_date column which is in Text format
-- Convert the text into a real date
UPDATE orders_clean
SET order_date = STR_TO_DATE(order_date, '%Y-%m-%d');

-- Now, let's make it a DATE column
ALTER TABLE orders_clean
MODIFY order_date DATE;

-- Standardize the returned column in case there are spaces, make them all Uppercase...
UPDATE orders_clean
SET returned = UPPER(TRIM(returned));

-- Check it
SELECT DISTINCT returned
FROM orders_clean;

-- We're going to add calculated fields to the orders_clean table. 3 new columns
-- 1) is_returned: 1 if returned, 0 if not. We use TINYINT because it’s the smallest numeric type in MySQL
ALTER TABLE orders_clean
ADD COLUMN is_returned TINYINT;

UPDATE orders_clean
SET is_returned = CASE 
    WHEN returned = 'YES' THEN 1
    ELSE 0
END;

-- profit_margin → profit as a % of net revenue
ALTER TABLE orders_clean
ADD COLUMN profit_margin DECIMAL(10,2);

UPDATE orders_clean
SET profit_margin = 
    CASE 
        WHEN net_revenue = 0 THEN 0
        ELSE ROUND(profit / net_revenue, 2)
    END;

-- discount_flag → 1 if discount applied, 0 if not
ALTER TABLE orders_clean
ADD COLUMN has_discount TINYINT;

UPDATE orders_clean
SET has_discount = CASE
    WHEN discount_amount > 0 THEN 1
    ELSE 0
END;

-- Now, I am going to make sure that I haven't lost any data in the new table - looks good
 SELECT 
    (SELECT COUNT(*) FROM orders_raw) AS raw_count,
    (SELECT COUNT(*) FROM orders_clean) AS clean_count;

-- Same as before check for NULL values - None
SELECT 
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(primary_category IS NULL) AS missing_category,
    SUM(gross_revenue IS NULL) AS missing_revenue,
    SUM(total_costs IS NULL) AS missing_total_costs,
    SUM(profit IS NULL) AS missing_profit,
    SUM(is_returned IS NULL) AS missing_is_returned,
    SUM(has_discount IS NULL) AS missing_has_discount,
    SUM(profit_margin IS NULL) AS missing_profit_margin
FROM orders_clean;

-- Check that there are only two type of results in the new columns
SELECT DISTINCT is_returned FROM orders_clean;
SELECT DISTINCT has_discount FROM orders_clean;


