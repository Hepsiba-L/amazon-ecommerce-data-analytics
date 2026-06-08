CREATE database ecommerce_db;     # Create Database Schema
USE  ecommerce_db;
# Create Table Structure
CREATE table Amazon_ecommerce (
User_id varchar(50),product_id varchar(50),seller_id varchar(50), brand varchar(50),category varchar(50),subcategory varchar(50),
price decimal (10,2), final_price decimal (10,2) ,discount decimal (10,2), rating decimal (3,2),seller_rating decimal (3,2) ,
review_count INT , stock INT ,shipping_time_days INT ,device varchar (50),payment_method varchar (50) ,is_returned varchar (50),
delivery_status varchar (50) ,Discounted_amount decimal (10,2),location varchar (50), purchase_date DATE 
);
# verify record counts
SELECT * FROM amaz_ecom ;
SELECT COUNT(*) AS Total_Records
FROM amaz_ecom;

# verify data accuracy 
SELECT price
FROM amaz_ecom
LIMIT 10;

# ENSURE DATA CONSISTENCY 
# Check Missing Customers
SELECT *
FROM amaz_ecom
WHERE user_id NOT IN
(
    SELECT user_id
    FROM amaz_ecom
);
# Check Missing Products
SELECT *
FROM amaz_ecom
WHERE product_id NOT IN
(
    SELECT product_id
    FROM amaz_ecom
);
# SQL-Based Business Analysis & Querying

# 1. Total Sales 
SELECT
    SUM(final_price) AS Total_Sales
FROM amaz_ecom; 

#2. Sales by category 
SELECT category,
       COUNT(*) AS total_products,
       SUM(final_price) AS total_sales,
       AVG(final_price) AS avg_price
FROM amaz_ecom
GROUP BY category
ORDER BY total_sales DESC;
# 3. Best-Selling Products
SELECT subcategory,
       COUNT(*) AS total_orders
FROM amaz_ecom
GROUP BY subcategory
ORDER BY total_orders DESC
LIMIT 10;
#4. Top customer
SELECT user_id,
       SUM(final_price) AS total_spent
FROM amaz_ecom
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 10;

#5. top seller performace
SELECT seller_id,
       SUM(final_price) AS total_sales
FROM amaz_ecom
GROUP BY seller_id
ORDER BY total_sales DESC
LIMIT 10;

# 6. Products Above a Certain Price (WHERE)
SELECT *
FROM amaz_ecom
WHERE final_price > 1000
ORDER BY final_price DESC;

# 7. Highest-Priced Products
SELECT subcategory, final_price
FROM amaz_ecom
ORDER BY final_price DESC
LIMIT 10;
#8. Lowest-Priced Products
SELECT subcategory, final_price
FROM amaz_ecom
ORDER BY final_price ASC
LIMIT 10;

#9.Monthly Sales Trend
SELECT YEAR(purchase_date) AS year,
       MONTH(purchase_date) AS month,
       SUM(final_price) AS monthly_sales
FROM amaz_ecom
GROUP BY YEAR(purchase_date), MONTH(purchase_date)
ORDER BY year, month;




