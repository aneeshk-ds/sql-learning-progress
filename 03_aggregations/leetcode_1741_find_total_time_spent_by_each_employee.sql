-- LeetCode 1741 Find Total Time Spent by Each Employee (Easy, 86%)
-- 2026-10-12, Ladder day 1, fluency block. Needed a hint.

-- Attempt 1 (wrong): bare row expression after GROUP BY, plus an unneeded DISTINCT.
-- emp 1 on 2020-11-28 has 2 visits (28 and 145 minutes). GROUP BY squeezes them into 1 row
-- and nothing says how to combine them, so one visit was kept and the other lost.
-- MySQL ONLY_FULL_GROUP_BY rejects this. Ledger #21 (bare column).
-- select distinct event_day as day, emp_id, (out_time-in_time)as total_time
-- from Employees
-- group by event_day, emp_id;

-- Fix: every column not in GROUP BY needs an aggregate. DISTINCT is redundant with GROUP BY.
select event_day as day, emp_id, sum(out_time - in_time) as total_time
from Employees
group by event_day, emp_id;
