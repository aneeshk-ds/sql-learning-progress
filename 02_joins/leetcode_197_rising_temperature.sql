-- LeetCode 197: Rising Temperature (Amazon, Deloitte, Easy)
-- Table: Weather(id, recordDate, temperature)
-- Rule: "yesterday" is DATEDIFF(today, other) = 1. Ids can skip dates; dates cannot lie.
-- 2026-10-20: sample (Steps, with a missing date) clean, then this, clean.
select a.id
from Weather a
join Weather b on datediff(a.recordDate, b.recordDate) = 1
where a.temperature > b.temperature;
