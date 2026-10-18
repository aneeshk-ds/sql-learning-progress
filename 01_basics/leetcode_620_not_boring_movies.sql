-- LeetCode 620 Not Boring Movies (Easy, 75%)
-- 2026-10-18, Mock 1 Q2 (Lloyds format, first submission final). Clean in 3 minutes.
-- Odd id via % 2 != 0 (MOD card warmed up the same session).
select id, movie, description, rating
from Cinema
where id % 2 != 0 and description != 'boring'
order by rating desc;
