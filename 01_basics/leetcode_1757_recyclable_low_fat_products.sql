-- LeetCode 1757: Recyclable and Low Fat Products (Easy)
-- Concept: single-table filter with AND, quoted text values
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
