-- Insert Unique Customers

INSERT INTO customers (
    user_name,
    age,
    country
)
SELECT DISTINCT
    User_Name,
    Age,
    Country
FROM raw_transactions;

-- Insert Unique Categories

INSERT INTO categories (
    category_name
)
SELECT DISTINCT
    Product_Category
FROM raw_transactions;

-- Build Relational Transactions Table

INSERT INTO transactions (
    transaction_id,
    customer_id,
    category_id,
    purchase_amount,
    payment_method,
    transaction_date
)

SELECT
    rt.Transaction_ID,
    c.customer_id,
    cat.category_id,
    rt.Purchase_Amount,
    rt.Payment_Method,
    rt.Transaction_Date

FROM raw_transactions rt

JOIN customers c
ON rt.User_Name = c.user_name
AND rt.Age = c.age
AND rt.Country = c.country

JOIN categories cat
ON rt.Product_Category = cat.category_name;