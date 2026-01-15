-- Retail Sales Analysis SQL Queries

------------------------------------------------------------
-- 1. Gender Distribution
------------------------------------------------------------
SELECT gender, 
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY gender;

------------------------------------------------------------
-- 2. Total Revenue by Product Category
------------------------------------------------------------
SELECT product_category,
       SUM(quantity * price_per_unit) AS total_revenue
FROM transactions
GROUP BY product_category
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- 3. Average Age of Customers by Gender
------------------------------------------------------------
SELECT gender,
       ROUND(AVG(age)) AS avg_age
FROM transactions
GROUP BY gender;

------------------------------------------------------------
-- 4. Top Spending Customers
------------------------------------------------------------
SELECT customer_id,
       SUM(quantity * price_per_unit) AS total_spent
FROM transactions
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

------------------------------------------------------------
-- 5. Monthly Sales Trend
------------------------------------------------------------
SELECT strftime('%Y-%m', date) AS month,
       SUM(quantity * price_per_unit) AS monthly_sales
FROM transactions
GROUP BY month
ORDER BY month;

------------------------------------------------------------
-- 6. Most Popular Product Category by Gender
------------------------------------------------------------
SELECT gender,
       product_category,
       COUNT(*) AS purchases
FROM transactions
GROUP BY gender, product_category
ORDER BY gender, purchases DESC;

------------------------------------------------------------
-- 7. Average Order Value
------------------------------------------------------------
SELECT ROUND(AVG(quantity * price_per_unit), 2) AS avg_order_value
FROM transactions;

------------------------------------------------------------
-- 8. Customer Age Distribution (binned)
------------------------------------------------------------
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 40 THEN '25-40'
        WHEN age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS count
FROM transactions
GROUP BY age_group
ORDER BY count DESC;
