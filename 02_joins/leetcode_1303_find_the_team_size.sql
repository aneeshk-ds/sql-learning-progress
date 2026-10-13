-- LeetCode 1303 Find the Team Size (Easy, 90%)
-- 2026-10-13 block 2, stretch. Self-join card first (Students a join Students b on class_id).
-- Answer was read on 2026-10-07; solved cold today, route chosen himself. Streak 5 of 5 -> Tier 1 cleared.
-- Why it works: each employee pairs with every row of their own team (including itself),
-- so counting the partners per employee gives the team size.

select e.employee_id, count(e2.employee_id) as team_size
from Employee e
join Employee e2 on e.team_id = e2.team_id
group by e.employee_id;
