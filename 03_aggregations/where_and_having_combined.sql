-- Among completed orders only, find each customer whose total is over 500
-- WHERE filters individual rows before grouping; HAVING filters the grouped totals after.
SELECT customer,
       SUM(amount) AS total_amount
FROM Orders
WHERE status = 'completed'
GROUP BY customer
HAVING SUM(amount) > 500;
