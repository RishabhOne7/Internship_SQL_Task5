# SQL Developer Internship - Task 5: SQL Joins

## 📌 Objective
The purpose of this task is to practice combining data from multiple tables using different types of SQL joins, including:

- INNER JOIN  
- LEFT JOIN  
- RIGHT JOIN  
- FULL OUTER JOIN (emulated using UNION in MySQL)  

This helps in mastering data relationships and writing efficient queries.

---

## 🗄️ Database: `HotelDB`

### Tables Created:
1. **Customers**  
   - `customer_id` (Primary Key)  
   - `name`  
   - `city`  

2. **Orders**  
   - `order_id` (Primary Key)  
   - `customer_id` (Foreign Key)  
   - `order_date`  

3. **Products**  
   - `product_id` (Primary Key)  
   - `product_name`  
   - `price`  

4. **OrderDetails**  
   - `order_detail_id` (Primary Key)  
   - `order_id` (Foreign Key)  
   - `product_id` (Foreign Key)  
   - `quantity`  

---

## 🛠️ Steps Performed

1. Created database `HotelDB`.  
2. Created all tables with proper primary and foreign key constraints.  
3. Inserted sample data into all tables.  
4. Wrote SQL queries to demonstrate different types of joins.  

---

## 📂 SQL File
All SQL commands including database creation, tables, sample data, and join queries are included in a single file:  

**`joins_task.sql`**

---

## 📊 Sample Queries

### INNER JOIN
```sql
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;


LEFT JOIN
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

RIGHT JOIN
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;


FULL OUTER JOIN (via UNION in MySQL)

SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
