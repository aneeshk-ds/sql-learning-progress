-- 2-column join key twin, 2026-10-13 block 3. Clean, cold, no hint. Ledger #25: 1 clean.
-- Prices(item, month, price), Sales(sale_id, item, month, units) -> sale_id, item, month, price (0 if none)
-- Each sale is identified by (item, month), so the join needs both columns.

select s.sale_id, s.item, s.month, ifnull(p.price, 0) as price
from Sales s
left join Prices p on p.item = s.item and p.month = s.month;
