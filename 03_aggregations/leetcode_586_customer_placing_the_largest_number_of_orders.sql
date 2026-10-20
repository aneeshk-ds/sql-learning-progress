-- LeetCode 586: Customer Placing the Largest Number of Orders (Amazon, Easy)
-- Table: Orders(order_number, customer_number)

-- 2026-10-18, Mock 1, miss (first submission final). Sorted by the id, not the count:
--   ORDER BY customer_number DESC LIMIT 1 with a bare HAVING count(*).
--   Passed the 4 sample rows by luck (the top id also had the most orders).

-- 2026-10-19: did not know ORDER BY can take an aggregate. Taught on the same rows.
-- 2026-10-20: fresh-rows sample (highest count on a middle id) clean, then this, clean.
select customer_number
from Orders
group by customer_number
order by count(*) desc
limit 1;
