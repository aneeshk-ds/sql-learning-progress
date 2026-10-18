-- LeetCode 1327 List the Products Ordered in a Period (Easy, 72%)
-- 2026-10-14, fluency (timed). Correct output.
-- Habit notes (3rd session running): unit and order_date unaliased with 2 tables in scope; GROUP BY name only.
-- Submitted:
-- select p.product_name, sum(unit) as unit
-- from Products p Join Orders o on o.product_id = p.product_id
-- where month(o.order_date) = 2 and year(order_date) = 2020
-- group by p.product_name
-- having sum(unit) >= 100;
-- Clean form:
select p.product_name, sum(o.unit) as unit
from Products p
join Orders o on o.product_id = p.product_id
where year(o.order_date) = 2020 and month(o.order_date) = 2
group by p.product_id, p.product_name
having sum(o.unit) >= 100;
