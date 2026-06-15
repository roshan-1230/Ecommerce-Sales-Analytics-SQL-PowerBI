-- View

CREATE VIEW top_customers AS

SELECT
    c.user_name,
    ROUND(SUM(t.purchase_amount),2) AS total_spent

FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id

GROUP BY c.customer_id,c.user_name;

-- Query View

SELECT *
FROM top_customers
ORDER BY total_spent DESC;

-- CTE Example

WITH customer_spending AS (

    SELECT
        customer_id,
        SUM(purchase_amount) AS total_spent

    FROM transactions
    GROUP BY customer_id
)

SELECT *
FROM customer_spending
WHERE total_spent >
(
    SELECT AVG(total_spent)
    FROM customer_spending
);

-- Stored Procedure

DELIMITER //

CREATE PROCEDURE GetCustomerTransactions(
    IN cust_id INT
)

BEGIN

    SELECT *
    FROM transactions
    WHERE customer_id = cust_id;

END //

DELIMITER ;

-- Execute Procedure

CALL GetCustomerTransactions(1);