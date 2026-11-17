-- Pizza Sales Analysis: SQL queries (SQL Server / T-SQL)
-- Table: pizza_sales
-- Columns used: order_id, order_date, order_time, pizza_name, pizza_category,
--               pizza_size, quantity, total_price

-- ============================================================
-- A. KPIs
-- ============================================================

-- 1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

-- 2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- 5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
            CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
       AS Avg_Pizzas_per_order
FROM pizza_sales;

-- ============================================================
-- B. Daily Trend for Total Orders
-- ============================================================
SELECT DATENAME(DW, order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- ============================================================
-- C. Hourly Trend for Orders
-- ============================================================
SELECT DATEPART(HOUR, order_time) AS order_hours,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

-- ============================================================
-- D. % of Sales by Pizza Category
-- ============================================================
SELECT pizza_category,
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- ============================================================
-- E. % of Sales by Pizza Size
-- ============================================================
SELECT pizza_size,
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- ============================================================
-- F. Total Pizzas Sold by Pizza Category
-- NOTE: the original query had WHERE MONTH(order_date) = 2 (February only).
-- It is removed here so the result covers the full period, matching the dashboard.
-- ============================================================
SELECT pizza_category,
       SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- ============================================================
-- G. Top 5 Best Sellers by Total Pizzas Sold
-- ============================================================
SELECT TOP 5 pizza_name,
       SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

-- ============================================================
-- H. Bottom 5 Worst Sellers by Total Pizzas Sold
-- ============================================================
SELECT TOP 5 pizza_name,
       SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

-- ============================================================
-- Filtering examples (any query above can use these in a WHERE clause)
-- ============================================================

-- Orders by day for January only
SELECT DATENAME(DW, order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(DW, order_date);

-- Orders by day for Quarter 1 only
-- (change the 1 to 2, 3 or 4 for other quarters)
SELECT DATENAME(DW, order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY DATENAME(DW, order_date);
