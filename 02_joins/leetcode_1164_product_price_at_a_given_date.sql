-- LeetCode 1164 Product Price at a Given Date (Medium)
-- 2026-10-05 sprint Day 1 diagnostic. WRONG, kept as written. Not yet solved.
-- Returns 1 row (product 1, price 35). The prompt wants every product's price AS OF 2019-08-16:
-- the latest change on or before that date, or 10 if the product had no change by then.
-- Restate read it as "products whose price changed on that date". Ledger #9 / #22.
-- Also: write the literal as '2019-08-16'.
select product_id, new_price as price
from Products
where change_date = '2019-8-16' ;
