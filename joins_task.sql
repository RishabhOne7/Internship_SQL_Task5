-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;

-- Step 2: Create Tables
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Step 3: Insert Sample Data
INSERT INTO Customers (name, city) VALUES
('Ravi Kumar', 'Delhi'),
('Priya Sharma', 'Mumbai'),
('Amit Singh', 'Kolkata'),
('Neha Verma', 'Bangalore');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-09-01'),
(2, '2025-09-05'),
(1, '2025-09-10'),
(3, '2025-09-15');

INSERT INTO Products (product_name, price) VALUES
('Laptop', 55000.00),
('Mobile', 20000.00),
('Tablet', 30000.00),
('Headphones', 2000.00);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 4, 2),
(2, 2, 1),
(3, 3, 1),
(4, 2, 2);

-- Step 4: JOIN Queries

-- 1. INNER JOIN
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 2. LEFT JOIN
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 3. RIGHT JOIN
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 4. FULL OUTER JOIN (MySQL doesn’t support directly, use UNION)
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
