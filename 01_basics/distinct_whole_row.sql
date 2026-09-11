-- DISTINCT applies to the whole row, not a single column
-- DISTINCT sits once, right after SELECT, and removes duplicate ROWS
-- (the whole combination of selected columns).
SELECT DISTINCT city, country
FROM customers;
-- Removes only rows where BOTH city and country repeat.
-- A city can still appear twice if paired with a different country.
-- There is no per-column DISTINCT: SELECT city, DISTINCT country is invalid.
