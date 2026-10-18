-- LeetCode 2329 Product Sales Analysis V (Easy, 71%)
-- 2026-10-18, Mock 1 Q1 (Lloyds format, first submission final). Clean.
-- Full join key, every column aliased with 2 tables in scope, GROUP BY on the id,
-- quantity * price inside SUM, both ORDER BY keys.
select s.user_id, sum(s.quantity * p.price) as spending
from Sales s
join Product p on p.product_id = s.product_id
group by s.user_id
order by spending desc, s.user_id asc;
