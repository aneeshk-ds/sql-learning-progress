-- LeetCode 1083. Sales Analysis II  (Easy)
-- 2026-10-02. FAILED. Solution was shown after the visual did not land; the NOT IN version
-- below was then written out correctly. Recorded as NOT a solve. Needs a cold re-attempt.
--
-- Product(product_id, product_name, unit_price)
-- Sales(seller_id, product_id, buyer_id, sale_date, quantity, price), may contain repeated rows
-- Report the buyers who bought S8 but not iPhone. Output: buyer_id.
--
-- The failed attempt:
--   WHERE product_name = 'S8' AND product_name != 'iPhone'
-- A WHERE clause is answered by one row on its own. One row holds one product, so on any row
-- where product_name = 'S8' is true, product_name != 'iPhone' is true automatically. The second
-- clause excludes nothing. Buyer 3 passes on his S8 row while his iPhone row sits elsewhere.
--
-- ROW VS ENTITY TEST: can ONE row, alone, answer this condition?
--   "bought S8"          yes, one row settles it        -> a WHERE clause
--   "did not buy iPhone" no, needs the buyer's other rows -> NOT a WHERE clause

-- Preferred form. One pass, one group per buyer, two count conditions on that group.
-- No subquery, no NULL behaviour to remember. Reuses the GROUP BY + HAVING habit.
SELECT s.buyer_id
FROM Sales s
JOIN Product p ON p.product_id = s.product_id
GROUP BY s.buyer_id
HAVING SUM(p.product_name = 'S8') > 0
   AND SUM(p.product_name = 'iPhone') = 0;
-- Portable spelling of the condition count:
--   SUM(CASE WHEN p.product_name = 'S8' THEN 1 ELSE 0 END)

-- Two-list form. List A minus list B, which is what "but not" actually is.
SELECT DISTINCT s.buyer_id
FROM Sales s
JOIN Product p ON p.product_id = s.product_id
WHERE p.product_name = 'S8'
  AND s.buyer_id NOT IN (
      SELECT s2.buyer_id
      FROM Sales s2
      JOIN Product p2 ON p2.product_id = s2.product_id
      WHERE p2.product_name = 'iPhone'
  );
-- DISTINCT because Sales may repeat rows, so one buyer can hold several S8 rows.
-- NOT IN trap: if the inner list can contain NULL, NOT IN returns NO rows at all, not fewer.
-- Safe here only because the problem states buyer_id is never NULL. Otherwise use NOT EXISTS.
