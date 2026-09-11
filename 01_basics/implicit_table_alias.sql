-- Implicit table alias
-- A table name followed by a bare word aliases the table; AS is optional.
-- FROM orders s is the same as FROM orders AS s.
SELECT s.order_id,
       s.amount
FROM orders s;      -- s is an alias for orders, not a second table
