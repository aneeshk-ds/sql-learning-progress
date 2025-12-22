-- Get customer names with their order amounts
SELECT
    c.customer_name,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
