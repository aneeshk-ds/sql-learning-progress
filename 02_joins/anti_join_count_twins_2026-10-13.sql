-- COUNT after a LEFT JOIN, cold reps on 2026-10-13. Both clean, no hint. Ledger #23: 2 consecutive clean.

-- Twin E: Books(book_id, branch), Loans(loan_id, book_id) -> branch, never_loaned
select b.branch, count(b.book_id) as never_loaned
from Books b
left join Loans l on b.book_id = l.book_id
where l.loan_id is null
group by b.branch;

-- Twin F: Products(product_id, category), Reviews(review_id, product_id) -> category, unreviewed
-- Submitted with `where review_id is null` (no alias) and `)as unreviewed` (no space). Runs; breaks rule 7.
select p.category, count(p.product_id) as unreviewed
from Products p
left join Reviews r on p.product_id = r.product_id
where r.review_id is null
group by p.category;

-- Explain aloud (gap logged): his answers were "I wanted nulls", "values that have no nulls", "pairs that have no matches".
-- Interview-grade: "A plain JOIN would drop the products that have no reviews, and those are exactly the products
-- I'm counting. LEFT JOIN keeps them with NULL in the review columns, and the IS NULL filter keeps only them."
