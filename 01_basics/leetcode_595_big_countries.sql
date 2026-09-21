-- LeetCode 595: Big Countries (Easy)
-- Concept: single-table filter with OR
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
