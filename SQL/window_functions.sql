-- Customer Ranking

SELECT
    c.user_name,
    SUM(t.purchase_amount) AS total_spent,

    RANK() OVER(
        ORDER BY SUM(t.purchase_amount) DESC
    ) AS customer_rank

FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id

GROUP BY c.customer_id,c.user_name;

-- Dense Rank

SELECT
    c.user_name,
    SUM(t.purchase_amount) AS total_spent,

    DENSE_RANK() OVER(
        ORDER BY SUM(t.purchase_amount) DESC
    ) AS dense_rank_number

FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id

GROUP BY c.customer_id,c.user_name;

-- Row Number

SELECT
    c.user_name,
    t.purchase_amount,

    ROW_NUMBER() OVER(
        ORDER BY t.purchase_amount DESC
    ) AS row_num

FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id;