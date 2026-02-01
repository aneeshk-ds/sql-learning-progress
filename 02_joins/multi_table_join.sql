-- Total amount paid by each customer (3-table join)
SELECT
    customer_name,
    SUM(p.amount) AS total_paid
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
JOIN payments AS p
  ON o.order_id = p.order_id
GROUP BY customer_name;


-- Customers who paid more than 500
SELECT
    customer_name,
    SUM(p.amount) AS total_paid
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
JOIN payments AS p
  ON o.order_id = p.order_id
GROUP BY customer_name
HAVING SUM(p.amount) > 500;


-- Include customers with unpaid orders (LEFT JOIN + COALESCE)
SELECT
    customer_name,
    COALESCE(SUM(p.amount), 0) AS total_paid
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
LEFT JOIN payments AS p
  ON o.order_id = p.order_id
GROUP BY customer_name;


-- Customers with at least 2 paid orders
SELECT
    customer_name,
    COUNT(DISTINCT p.order_id) AS paid_orders
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
JOIN payments AS p
  ON o.order_id = p.order_id
GROUP BY customer_name
HAVING COUNT(DISTINCT p.order_id) >= 2;


-- Revenue by city using payment data
SELECT
    city,
    SUM(p.amount) AS city_revenue
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
JOIN payments AS p
  ON o.order_id = p.order_id
GROUP BY city;

-- Customers with unpaid orders
SELECT DISTINCT
    customer_name
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
LEFT JOIN payments AS p
  ON o.order_id = p.order_id
WHERE p.order_id IS NULL;


-- Recent payments (WHERE) with aggregate filter (HAVING)
SELECT
    customer_name,
    SUM(p.amount) AS recent_payments
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
JOIN payments AS p
  ON o.order_id = p.order_id
WHERE p.payment_date >= '2024-02-01'
GROUP BY customer_name
HAVING SUM(p.amount) > 300;
