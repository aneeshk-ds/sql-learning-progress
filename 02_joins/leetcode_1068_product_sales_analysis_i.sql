-- LeetCode 1068 (Easy). 2026-10-06 sprint Day 2. Solo, 2 min.
-- "For each sale_id" with no aggregate: each row is already one sale, so no GROUP BY.
select p.product_name, s.year, s.price
from Sales s
join Product p on s.product_id = p.product_id
