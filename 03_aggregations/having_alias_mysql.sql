-- HAVING referencing a SELECT alias (MySQL extension)
-- HAVING runs after grouping and after SELECT aliases are assigned, so MySQL
-- lets it reference an alias, an aggregate directly, or a bare expression.
-- Note: PostgreSQL does NOT allow a SELECT alias in HAVING; repeat the aggregate.
SELECT customer_id,
       COUNT(*) AS txns
FROM orders
GROUP BY customer_id
HAVING txns > 10;          -- MySQL: alias allowed here
-- Portable form (works everywhere): HAVING COUNT(*) > 10
-- WHERE can never use the alias: it runs before the alias exists.
-- Fixed written order: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY.
