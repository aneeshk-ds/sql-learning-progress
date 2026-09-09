-- Problem: List accounts with a positive balance, showing account number and balance
-- to two decimal places, sorted by balance descending.
-- Concept: join two tables, filter to positive balances, ROUND(value, 2) for the format
-- aliased back to the required column name, ORDER BY ... DESC. No grouping.

SELECT account_no, ROUND(balance, 2) AS balance
FROM account a
JOIN ledger l ON a.id = l.account_id
WHERE balance > 0
ORDER BY balance DESC;
