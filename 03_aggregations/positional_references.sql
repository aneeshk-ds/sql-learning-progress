-- Positional references in GROUP BY and ORDER BY
-- A bare number is a column POSITION in the SELECT list, counted from 1.
-- It is shorthand for the column at that position, not a literal value.
-- Legal in both PostgreSQL and MySQL.
SELECT category,
       COUNT(*) AS product_count
FROM products
GROUP BY 1          -- 1 = category (first selected column)
ORDER BY 2 DESC;    -- 2 = product_count (second selected column)
