-- Total Revenue

SELECT
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM transactions;

-- Average Order Value

SELECT
    ROUND(AVG(purchase_amount),2) AS average_order_value
FROM transactions;

-- Revenue By Category

SELECT
    cat.category_name,
    ROUND(SUM(t.purchase_amount),2) AS revenue
FROM transactions t
JOIN categories cat
ON t.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY revenue DESC;

-- Revenue By Country

SELECT
    c.country,
    ROUND(SUM(t.purchase_amount),2) AS revenue
FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id
GROUP BY c.country
ORDER BY revenue DESC;

-- Top 10 Customers

SELECT
    c.user_name,
    c.country,
    ROUND(SUM(t.purchase_amount),2) AS total_spent
FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id
GROUP BY c.customer_id,c.user_name,c.country
ORDER BY total_spent DESC
LIMIT 10;

-- Payment Method Analysis

SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- Monthly Revenue Trend

SELECT
    MONTH(transaction_date) AS month_number,
    ROUND(SUM(purchase_amount),2) AS monthly_revenue
FROM transactions
GROUP BY MONTH(transaction_date)
ORDER BY month_number;