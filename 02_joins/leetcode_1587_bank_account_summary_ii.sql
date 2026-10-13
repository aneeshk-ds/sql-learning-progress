-- LeetCode 1587 Bank Account Summary II (Easy, 83%)
-- 2026-10-13, Ladder day 2, fluency (timed). Clean, first try.
-- Habit note (rule 6): grouped by u.name only. Two accounts with the same name would merge.
-- Submitted:
-- select u.name, sum(t.amount) as balance
-- from Users u join Transactions t on u.account = t.account
-- group by u.name
-- having sum(t.amount) > 10000;
-- Safer form:
select u.name, sum(t.amount) as balance
from Users u
join Transactions t on u.account = t.account
group by u.account, u.name
having sum(t.amount) > 10000;
