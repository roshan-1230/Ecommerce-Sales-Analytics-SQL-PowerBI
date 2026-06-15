-- Create Database

CREATE DATABASE ecommerce_project;

USE ecommerce_project;

-- Customers Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    age INT,
    country VARCHAR(50)
);

-- Categories Table

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

-- Transactions Table

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    category_id INT,
    purchase_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    transaction_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

-- Raw Transactions Table

CREATE TABLE raw_transactions (
    Transaction_ID INT,
    User_Name VARCHAR(100),
    Age INT,
    Country VARCHAR(50),
    Product_Category VARCHAR(50),
    Purchase_Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Transaction_Date DATE
);