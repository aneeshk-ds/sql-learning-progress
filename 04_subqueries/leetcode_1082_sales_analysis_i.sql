-- LeetCode 1082. Sales Analysis I  (Easy)
-- Solved 2026-10-02 after the two-layer aggregate was taught. NOT first-try, NOT cold.
--
-- Sales(seller_id, product_id, buyer_id, sale_date, quantity, price)
-- Report the seller or sellers whose total price across all sales is the highest.
-- Ties are all reported.
--
-- Why two layers and not one: while the engine is building seller 1's total it has not
-- seen the other sellers yet, so there is nothing to compare against. Layer 1 produces
-- every seller's total. Layer 2 reads that finished set and pulls one number out of it.
-- Layer 3 compares each total to that number.
--
-- Why equality and not ORDER BY ... LIMIT 1: a row limit keeps one seller, an equality
-- comparison keeps every seller tied at the top.

WITH a AS (
    SELECT seller_id, SUM(price) AS total_sales
    FROM Sales
    GROUP BY seller_id
)
SELECT seller_id
FROM a
WHERE total_sales = (SELECT MAX(total_sales) FROM a);
