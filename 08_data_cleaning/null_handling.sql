SELECT
    customer_id,
    COALESCE(city, 'Unknown') AS city
FROM customers;
