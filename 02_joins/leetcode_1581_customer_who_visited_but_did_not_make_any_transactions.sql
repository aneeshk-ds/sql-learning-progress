-- LeetCode 1581 Customer Who Visited but Did Not Make Any Transactions (Easy, 69%)
-- 2026-10-12, Ladder day 1, cold retest. Anti-join correct; COUNT column given by Claude.

-- Attempt 1 (wrong): counted the column the WHERE forces to NULL. COUNT skips NULLs -> 0 for every customer.
-- Ledger #23.
-- select v.customer_id, count(t.transaction_id) as count_no_trans
-- from Visits v
-- left join Transactions t on t.visit_id = v.visit_id
-- where t.transaction_id is null
-- group by v.customer_id;

-- Rule: test NULL on the right table, count from the left table.
select v.customer_id, count(v.visit_id) as count_no_trans
from Visits v
left join Transactions t on t.visit_id = v.visit_id
where t.transaction_id is null
group by v.customer_id;

-- Explain aloud (interview-grade):
-- 1. LEFT JOIN keeps every visit, even with no matching transaction; a plain JOIN drops exactly those.
-- 2. Unmatched visits get NULL in every Transactions column; t.transaction_id is null keeps only them.
-- 3. v.visit_id has a value on every surviving row, so each no-transaction visit is counted once.
