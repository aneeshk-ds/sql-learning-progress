-- Find all customers who never placed an order, using NOT IN
-- Exclusion pattern: keep customers whose id is not in the set of ids that appear in Orders.
SELECT name
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);
