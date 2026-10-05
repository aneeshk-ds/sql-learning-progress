-- LeetCode 1757 Recyclable and Low Fat Products (Easy)
-- 2026-10-05 sprint Day 1 diagnostic. Solo, first try, about 2 minutes. Restate skipped.
select product_id
from Products
where low_fats = 'Y' and recyclable = 'Y' ;
