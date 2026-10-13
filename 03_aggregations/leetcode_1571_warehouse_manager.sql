-- LeetCode 1571 Warehouse Manager (Easy, 87%)
-- 2026-10-13, Ladder day 2, cold retest. Answer was read on 2026-10-07; clean solo today.
-- Closes ledger #24 (total of a row calculation): 3rd consecutive clean.
-- Note: columns are Width, Length, Height (capitals). MySQL is case-insensitive on column names, but copy them exactly.

select w.name as warehouse_name, sum(p.Width * p.Length * p.Height * w.units) as volume
from Warehouse w
join Products p on w.product_id = p.product_id
group by w.name;
