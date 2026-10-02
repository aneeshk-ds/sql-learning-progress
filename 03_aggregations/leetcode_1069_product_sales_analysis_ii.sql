-- LeetCode 1069. Product Sales Analysis II  (Easy)
-- 2026-10-02. FAILED twice, clean on the third attempt.
--
-- Sales(sale_id, product_id, year, quantity, price), Product(product_id, product_name)
-- Report the total quantity sold for every product_id. Output: product_id, total_quantity.
--
-- Attempt 1, did not run:
--   SELECT product_id, SUM(quantity) AS total_quantity
--   FROM Sales s JOIN Product p ON s.product_id = p.product_id
--   GROUP BY product_id;
-- Two faults. The join to Product earns nothing: both output columns live in Sales and no
-- product name was asked for. And that unneeded join put product_id in scope twice, so both
-- the SELECT and the GROUP BY are ambiguous and the query dies.
--
-- Attempt 2, dropped the join correctly and dropped GROUP BY with it:
--   SELECT product_id, SUM(quantity) AS total_quantity FROM Sales;
--
-- JOIN-JUSTIFICATION RULE, from this problem: before writing a join, list the output columns
-- and name which table each lives in. A join is earned only when a needed column sits in
-- another table. The unneeded join is also what creates the ambiguous-column failure, so the
-- rule prevents both faults at once.

SELECT product_id, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY product_id;
