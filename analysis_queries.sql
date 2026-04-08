-- Table Creation and Data Insertion for Quick-Commerce Sales, Delivery & Customer Retention Analysis


DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS returns;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE,
    acquisition_channel VARCHAR(30)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(120),
    category VARCHAR(50),
    brand VARCHAR(50),
    mrp NUMERIC(10,2),
    selling_price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    order_time TIME,
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    delivery_city VARCHAR(50),
    promo_code VARCHAR(20),
    order_amount NUMERIC(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    item_total NUMERIC(10,2)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    promised_minutes INT,
    actual_minutes INT,
    delivery_status VARCHAR(30)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    return_reason VARCHAR(100),
    refund_amount NUMERIC(10,2)
);

INSERT INTO customers VALUES
(1,'Aarav Sharma','Delhi','2024-01-10','Organic'),
(2,'Priya Verma','Noida','2024-01-14','Instagram'),
(3,'Rohan Mehta','Gurugram','2024-02-02','Referral'),
(4,'Sneha Kapoor','Delhi','2024-02-20','Google Ads'),
(5,'Aditya Singh','Faridabad','2024-03-05','Organic'),
(6,'Neha Yadav','Delhi','2024-03-18','Referral'),
(7,'Karan Malhotra','Noida','2024-04-01','Instagram'),
(8,'Isha Gupta','Gurugram','2024-04-18','Organic'),
(9,'Vikas Jain','Delhi','2024-05-02','Google Ads'),
(10,'Pooja Arora','Ghaziabad','2024-05-22','Referral');

INSERT INTO products VALUES
(101,'Aashirvaad Atta 5kg','Groceries','Aashirvaad',285.00,259.00),
(102,'Amul Milk 1L','Dairy','Amul',68.00,64.00),
(103,'Lay''s Chips','Snacks','Lay''s',20.00,18.00),
(104,'Coca Cola 750ml','Beverages','Coca Cola',40.00,36.00),
(105,'Surf Excel 1kg','Household','Surf Excel',235.00,210.00),
(106,'Good Day Biscuits','Snacks','Britannia',35.00,30.00),
(107,'Tomato 1kg','Fruits & Vegetables','Fresh Farm',40.00,32.00),
(108,'Onion 1kg','Fruits & Vegetables','Fresh Farm',45.00,34.00),
(109,'Brown Bread','Bakery','Harvest',50.00,42.00),
(110,'Eggs 12 Pack','Dairy','Farm Fresh',90.00,82.00);

INSERT INTO orders VALUES
(1001,1,'2025-01-03','09:10:00','UPI','Delivered','Delhi',NULL,341.00),
(1002,2,'2025-01-03','13:40:00','Card','Delivered','Noida','SAVE20',292.00),
(1003,3,'2025-01-05','20:05:00','UPI','Delivered','Gurugram',NULL,228.00),
(1004,4,'2025-01-08','18:20:00','Cash','Delayed','Delhi','NEW10',406.00),
(1005,1,'2025-01-15','08:55:00','UPI','Delivered','Delhi',NULL,146.00),
(1006,5,'2025-01-19','21:15:00','Card','Cancelled','Faridabad',NULL,0.00),
(1007,6,'2025-02-02','11:30:00','UPI','Delivered','Delhi','SAVE20',324.00),
(1008,7,'2025-02-05','19:40:00','Card','Delivered','Noida',NULL,214.00),
(1009,8,'2025-02-11','17:00:00','UPI','Delayed','Gurugram','NEW10',388.00),
(1010,2,'2025-02-19','09:45:00','Wallet','Delivered','Noida',NULL,124.00),
(1011,9,'2025-03-01','14:10:00','Card','Delivered','Delhi',NULL,278.00),
(1012,10,'2025-03-04','20:25:00','UPI','Delivered','Ghaziabad','SAVE20',360.00),
(1013,3,'2025-03-15','10:50:00','UPI','Delayed','Gurugram',NULL,315.00),
(1014,4,'2025-03-22','16:05:00','Card','Delivered','Delhi',NULL,189.00),
(1015,6,'2025-04-02','18:45:00','Wallet','Delivered','Delhi','NEW10',430.00),
(1016,8,'2025-04-09','07:55:00','UPI','Delivered','Gurugram',NULL,152.00),
(1017,1,'2025-04-18','12:20:00','Card','Delivered','Delhi','SAVE20',298.00),
(1018,7,'2025-04-25','21:05:00','UPI','Delayed','Noida',NULL,342.00);

INSERT INTO order_items VALUES
(1,1001,101,1,259.00),(2,1001,102,1,64.00),(3,1001,103,1,18.00),
(4,1002,105,1,210.00),(5,1002,106,1,30.00),(6,1002,109,1,42.00),
(7,1003,104,2,72.00),(8,1003,110,1,82.00),(9,1003,107,1,32.00),(10,1003,108,1,34.00),
(11,1004,101,1,259.00),(12,1004,105,1,210.00),(13,1004,103,1,18.00),
(14,1005,102,1,64.00),(15,1005,109,1,42.00),(16,1005,107,1,32.00),
(17,1007,101,1,259.00),(18,1007,106,1,30.00),(19,1007,108,1,34.00),
(20,1008,104,1,36.00),(21,1008,110,2,164.00),(22,1008,103,1,18.00),
(23,1009,105,1,210.00),(24,1009,101,1,259.00),(25,1009,107,1,32.00),
(26,1010,102,1,64.00),(27,1010,106,2,60.00),
(28,1011,101,1,259.00),(29,1011,103,1,18.00),(30,1011,109,1,42.00),
(31,1012,105,1,210.00),(32,1012,110,1,82.00),(33,1012,102,1,64.00),
(34,1013,101,1,259.00),(35,1013,104,1,36.00),(36,1013,109,1,42.00),
(37,1014,110,1,82.00),(38,1014,106,1,30.00),(39,1014,108,1,34.00),(40,1014,107,1,32.00),
(41,1015,101,1,259.00),(42,1015,105,1,210.00),(43,1015,103,1,18.00),
(44,1016,102,1,64.00),(45,1016,109,1,42.00),(46,1016,108,1,34.00),
(47,1017,105,1,210.00),(48,1017,106,1,30.00),(49,1017,110,1,82.00),
(50,1018,101,1,259.00),(51,1018,102,1,64.00),(52,1018,103,1,18.00);

INSERT INTO deliveries VALUES
(1,1001,20,18,'On Time'),(2,1002,25,24,'On Time'),(3,1003,22,21,'On Time'),
(4,1004,20,37,'Delayed'),(5,1005,20,16,'On Time'),(6,1007,25,25,'On Time'),
(7,1008,20,19,'On Time'),(8,1009,22,35,'Delayed'),(9,1010,20,17,'On Time'),
(10,1011,25,24,'On Time'),(11,1012,25,22,'On Time'),(12,1013,22,34,'Delayed'),
(13,1014,20,18,'On Time'),(14,1015,25,23,'On Time'),(15,1016,18,17,'On Time'),
(16,1017,22,21,'On Time'),(17,1018,20,33,'Delayed');

INSERT INTO returns VALUES
(1,1004,'Damaged item',210.00),
(2,1009,'Late delivery',259.00),
(3,1013,'Wrong item delivered',36.00),
(4,1018,'Product quality issue',64.00);

-- Analysis Queries for Quick-Commerce Sales, Delivery & Customer Retention Analysis

-- 1. Monthly revenue and order count
SELECT 
    DATETRUNC(month, order_date) AS month, 
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM orders
WHERE order_status IN ('Delivered', 'Delayed')
GROUP BY DATETRUNC(month, order_date)
ORDER BY month;


-- 2. Category-wise revenue contribution
SELECT 
    p.category,
    SUM(oi.item_total) AS category_revenue,
    ROUND(100.0 * SUM(oi.item_total) / SUM(SUM(oi.item_total)) OVER(), 2) AS percentage_contribution
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status IN ('Delivered','Delayed')
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 3. Top 5 customers by lifetime value
SELECT TOP 5 WITH TIES
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(o.order_amount) AS lifetime_value,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status IN ('Delivered', 'Delayed')
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY lifetime_value DESC;

-- 4. Repeat customer rate
WITH customer_orders AS (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    WHERE order_status IN ('Delivered','Delayed')
    GROUP BY customer_id
)
SELECT 
    COUNT(CASE WHEN order_count > 1 THEN 1 END) AS repeat_customers,
    COUNT(*) AS total_customers,
    ROUND(100.0 * COUNT(CASE WHEN order_count > 1 THEN 1 END) / COUNT(*), 2) AS repeat_customer_rate
FROM customer_orders;

-- 5. Delivery delay rate by city
SELECT 
    o.delivery_city,
    COUNT(*) AS total_deliveries,
    COUNT(CASE WHEN d.delivery_status = 'Delayed' THEN 1 END) AS delayed_deliveries,
    ROUND(100.0 * COUNT(CASE WHEN d.delivery_status = 'Delayed' THEN 1 END) / COUNT(*), 2) AS delay_rate_pct
FROM deliveries d
JOIN orders o ON d.order_id = o.order_id
GROUP BY o.delivery_city
ORDER BY delay_rate_pct DESC;

-- 6. Average order value by acquisition channel
SELECT 
    c.acquisition_channel,
    ROUND(AVG(o.order_amount), 2) AS avg_order_value,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status IN ('Delivered','Delayed')
GROUP BY c.acquisition_channel
ORDER BY avg_order_value DESC;

-- 7. Most returned products and categories
SELECT 
    p.product_name,
    p.category,
    COUNT(r.return_id) AS total_returns,
    SUM(r.refund_amount) AS total_refund
FROM returns r
JOIN orders o ON r.order_id = o.order_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_returns DESC, total_refund DESC;

-- 8. Discount percentage by product
SELECT 
    product_name,
    category,
    mrp,
    selling_price,
    ROUND(100.0 * (mrp - selling_price) / mrp, 2) AS discount_pct
FROM products
ORDER BY discount_pct DESC;

-- 9. Customer recency and churn risk label
WITH customer_last_order AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    WHERE order_status IN ('Delivered', 'Delayed')
    GROUP BY customer_id
)
SELECT 
    c.customer_name,
    c.city,
    clo.last_order_date,
    -- DATEDIFF(unit, start, end)
    DATEDIFF(DAY, clo.last_order_date, GETDATE()) AS days_since_last_order,
    CASE 
        WHEN DATEDIFF(DAY, clo.last_order_date, GETDATE()) <= 30 THEN 'Active'
        WHEN DATEDIFF(DAY, clo.last_order_date, GETDATE()) <= 60 THEN 'Warm'
        ELSE 'At Risk'
    END AS retention_segment
FROM customer_last_order clo
JOIN customers c ON clo.customer_id = c.customer_id
ORDER BY days_since_last_order DESC;


-- 10. Running monthly revenue using window functions
WITH monthly_sales AS (
    SELECT 
        DATETRUNC(month, order_date) AS month,
        SUM(order_amount) AS monthly_revenue
    FROM orders
    WHERE order_status IN ('Delivered','Delayed')
    GROUP BY DATETRUNC(month, order_date)
)
SELECT 
    month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (ORDER BY month) AS running_revenue
FROM monthly_sales
ORDER BY month;

-- 11. Revenue lost due to delayed orders
SELECT 
    COUNT(*) AS delayed_orders,
    SUM(o.order_amount) AS delayed_order_revenue,
    ROUND(AVG(d.actual_minutes - d.promised_minutes), 2) AS avg_delay_minutes
FROM orders o
JOIN deliveries d ON o.order_id = d.order_id
WHERE d.delivery_status = 'Delayed';

-- 12. Create a reusable analyst view
CREATE OR ALTER VIEW order_performance_view AS
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.city AS customer_city,
    o.delivery_city,
    o.order_amount,
    o.order_status,
    d.promised_minutes,
    d.actual_minutes,
    (d.actual_minutes - d.promised_minutes) AS delay_minutes
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN deliveries d ON o.order_id = d.order_id;