CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    segment VARCHAR(20),
    signup_date DATE
);


CREATE TABLE sales (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    product VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    unit_price NUMERIC(10,2),
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

SELECT * FROM customers;
SELECT * FROM sales;


--Q1️⃣ What is the total revenue generated?--
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM sales;

--Q2️⃣ How many orders were placed?
SELECT 
    COUNT(order_id) AS total_orders
FROM sales;

--Q3️⃣ What is the average order value?
SELECT 
    ROUND (AVG(quantity * unit_price)) AS avg_order_value
FROM sales;

--Q4️⃣ What is the total revenue by product category?
SELECT 
    category,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;

--Q5️⃣ Which customers generate the highest revenue? (JOIN)
SELECT 
    c.customer_name,
    SUM(s.quantity * s.unit_price) AS revenue
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

--Q6️⃣ Revenue contribution by customer segment
SELECT 
    c.segment,
    SUM(s.quantity * s.unit_price) AS revenue
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.segment;

--Q7️⃣ Which city generates the highest revenue?
SELECT 
    c.city,
    SUM(s.quantity * s.unit_price) AS revenue
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

--Q8️⃣ Monthly revenue trend
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

--9️⃣ Who are the top 3 customers by revenue?
SELECT 
    c.customer_name,
    SUM(s.quantity * s.unit_price) AS revenue
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 3;

--Q🔟 Rank products by revenue (Window Function)
SELECT 
    product,
    SUM(quantity * unit_price) AS revenue,
    RANK() OVER (ORDER BY SUM(quantity * unit_price) DESC) AS revenue_rank
FROM sales
GROUP BY product;

--Q1️⃣1️⃣ Customer lifetime value (CLV)
SELECT 
    c.customer_name,
    SUM(s.quantity * s.unit_price) AS lifetime_value
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY lifetime_value DESC;

--Q1️⃣2️⃣ Which customers placed more than one order?
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

--Q1️⃣3️⃣ Segment-wise revenue percentage contribution
SELECT 
    segment,
    ROUND(
        SUM(revenue) * 100.0 /
        SUM(SUM(revenue)) OVER (), 2
    ) AS percentage_contribution
FROM (
    SELECT 
        c.segment,
        (s.quantity * s.unit_price) AS revenue
    FROM sales s
    JOIN customers c
    ON s.customer_id = c.customer_id
) t
GROUP BY segment;

--Q1️⃣4️⃣ Best-selling category per customer segment
SELECT segment, category, revenue
FROM (
    SELECT 
        c.segment,
        s.category,
        SUM(s.quantity * s.unit_price) AS revenue,
        RANK() OVER (
            PARTITION BY c.segment
            ORDER BY SUM(s.quantity * s.unit_price) DESC
        ) AS rnk
    FROM sales s
    JOIN customers c
    ON s.customer_id = c.customer_id
    GROUP BY c.segment, s.category
) ranked
WHERE rnk = 1;

--Q1️⃣5️⃣ Identify high-value orders (> ₹50,000)
SELECT 
    order_id,
    customer_id,
    quantity * unit_price AS order_value
FROM sales
WHERE quantity * unit_price > 50000;


