-- Rank products by price within each category, most expensive as rank 1
-- PARTITION BY restarts the ranking for each category; ORDER BY sets the direction.
SELECT product,
       category,
       price,
       DENSE_RANK() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank
FROM Products;
