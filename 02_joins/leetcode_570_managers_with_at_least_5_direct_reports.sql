-- LeetCode 570 Managers with at Least 5 Direct Reports (Medium)
-- 2026-10-05 sprint Day 1 diagnostic. Solo, about 2 minutes. Correct on the sample.
-- Risk: grouping by m.name merges two different managers who share a name.
-- The safe grain is GROUP BY m.id, m.name.
select m.name as name
from Employee e
join Employee m on e.managerId = m.id
group by m.name
having count(e.id) >= 5 ;
