-- Overview of the data - 4 headline KPIs for my dashboard
SELECT
    SUM(net_revenue) AS total_net_revenue,
    SUM(total_costs) AS total_costs,
    SUM(profit) AS total_profit,
    ROUND(AVG(profit_margin), 2) AS avg_profit_margin
FROM orders_clean;

-- Profit by category: This shows which categories drive profitability, and which ones drag it down.
SELECT
    primary_category,
    SUM(net_revenue) AS revenue,
    SUM(total_costs) AS costs,
    SUM(profit) AS profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin
FROM orders_clean
GROUP BY primary_category
ORDER BY profit DESC;

-- Profit by channel
SELECT
    channel,
    SUM(net_revenue) AS revenue,
    SUM(total_costs) AS costs,
    SUM(profit) AS profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin
FROM orders_clean
GROUP BY channel
ORDER BY profit DESC;

-- Return Rate (Overall and by Category). Returns are one of the biggest drivers of lost profit. This helps to identify categories with high return problems.
-- Overall return rate
SELECT
    AVG(is_returned) AS return_rate
FROM orders_clean;

-- Return rate by category
SELECT
    primary_category,
    AVG(is_returned) AS return_rate
FROM orders_clean
GROUP BY primary_category
ORDER BY return_rate DESC;

-- Monthly Trends (for Tableau)
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(net_revenue) AS revenue,
    SUM(total_costs) AS costs,
    SUM(profit) AS profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin,
    AVG(is_returned) AS return_rate
FROM orders_clean
GROUP BY month
ORDER BY month;

-- I am going to add a second export for monthly trends to improve Tableau performance
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(net_revenue) AS revenue,
    SUM(total_costs) AS costs,
    SUM(profit) AS profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin,
    AVG(is_returned) AS return_rate
FROM orders_clean
GROUP BY month
ORDER BY month;

