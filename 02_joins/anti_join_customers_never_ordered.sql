-- Find all customers who never placed an order (anti-join)
-- Keep every customer with LEFT JOIN, then keep only the rows with no match:
-- a non-matching customer has NULL on the orders side, so IS NULL isolates them.
SELECT c.name
FROM Customers c
LEFT JOIN Orders o
  ON c.id = o.customerId
WHERE o.customerId IS NULL;
