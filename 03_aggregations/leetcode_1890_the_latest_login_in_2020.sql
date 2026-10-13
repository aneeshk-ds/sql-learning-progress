-- LeetCode 1890 The Latest Login in 2020 (Easy, 77%)
-- 2026-10-13, Ladder day 2, stretch. New tool: YEAR(). Clean solo, first try.
-- Date card first: BETWEEN '2020-01-01' AND '2020-12-31' on a datetime stops at 2020-12-31 00:00,
-- so an event at 2020-12-31 18:00 is dropped. YEAR(col) = 2020 cannot miss the last day.
-- (Swapped in for 1821, which filters a plain year number and has no date column.)

select user_id, max(time_stamp) as last_stamp
from Logins
where year(time_stamp) = 2020
group by user_id;
