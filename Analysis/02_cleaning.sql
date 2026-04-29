-- 1. Fix the dates format in 2 tables (came as text)
SELECT DISTINCT month FROM marketing_spend_raw LIMIT 10;

-- Add a temporary DATE column
ALTER TABLE marketing_spend_raw
ADD COLUMN month_date DATE;

-- Convert the text '2024-01' to '2024-01-01'
UPDATE marketing_spend_raw
SET month_date = STR_TO_DATE(CONCAT(month, '-01'), '%Y-%m-%d');

-- Replace the old column
ALTER TABLE marketing_spend_raw DROP COLUMN month;
ALTER TABLE marketing_spend_raw CHANGE month_date month DATE;


SELECT * 
FROM marketing_spend_raw;

UPDATE marketing_spend_raw
SET month_date = STR_TO_DATE(CONCAT(month, '-01'), '%Y-%m-%d');

ALTER TABLE marketing_spend_raw DROP COLUMN month;
ALTER TABLE marketing_spend_raw CHANGE month_date month DATE;

SELECT DISTINCT order_date FROM orders_raw LIMIT 10;

-- Since the format is already correct, we just need to add a column
ALTER TABLE orders_raw
ADD COLUMN order_date_new DATE;

-- Then we make it date column
UPDATE orders_raw
SET order_date_new = STR_TO_DATE(order_date, '%Y-%m-%d');

-- Replace the old column
ALTER TABLE orders_raw DROP COLUMN order_date;
ALTER TABLE orders_raw CHANGE order_date_new order_date DATE;
