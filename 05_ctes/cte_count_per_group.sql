-- CTE counting rows per group, then filtering on the count.
-- COUNT(*) counts rows regardless of NULLs; use it for "how many".
WITH product_reviews AS (
    SELECT product_id, COUNT(*) AS review_count
    FROM reviews
    GROUP BY product_id
)
SELECT product_id, review_count
FROM product_reviews
WHERE review_count > 1
ORDER BY review_count DESC, product_id ASC;
