SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount >= 3000 THEN 'High Value'
        WHEN total_amount >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_category
FROM orders;
