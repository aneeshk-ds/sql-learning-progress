-- LeetCode 1421 NPV Queries (Easy, 83%)
-- 2026-10-13 block 2, cold retest. One hint.

-- Attempt 1 (wrong): joined on id only. Query (1, 2019) matched NPV rows (1, 2018, 100) and (1, 2019, 113),
-- so id 1 came back twice under 2019, once with the 2018 value.
-- select q.id, q.year, ifnull(n.npv,0) as npv
-- from Queries q
-- left join NPV as n on n.id = q.id

-- Fix: each query is an (id, year) pair; join on every column that identifies it.
select q.id, q.year, ifnull(n.npv, 0) as npv
from Queries q
left join NPV n on n.id = q.id and n.year = q.year;

-- Check before every ON: what makes one row of the left table unique? Join on all of it.
