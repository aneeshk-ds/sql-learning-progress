-- LeetCode 1978 (Easy). 2026-10-06 sprint Day 2. Needed a hint (restate, 3 tries).
-- Restate errors: "manager left" read as manager_id IS NULL, then as "manager exists".
-- Fix: manager left = manager_id NOT IN the list of employee_ids.
-- NOT IN also drops NULL manager_ids. Habit: give the inner table its own alias (m), not e again.
select e.employee_id
from Employees e
where e.salary<30000 and e.manager_id not in(select e.employee_id from Employees e)
order by e.employee_id ;
