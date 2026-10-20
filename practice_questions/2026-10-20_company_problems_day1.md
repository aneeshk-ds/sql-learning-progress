# 2026-10-20: Company problems, day 1 (5 of 5 clean)

Method from today: company-tagged problems only, from my LeetCode list "sql" (124 problems, 90 company-tagged). 5 a day, any difficulty. Each problem gets a sample test in the Bench first; LeetCode only after the sample is passed. Sample tests on a new concept are untimed.

| # | Problem | Company tags | Concept taught first | Sample | LeetCode |
|---|---|---|---|---|---|
| 1 | 586 Customer Placing the Largest Number of Orders | Amazon | ORDER BY an aggregate (count(*) DESC, LIMIT 1) | clean | clean, under 2 min |
| 2 | 577 Employee Bonus | Amazon | NULL fails every comparison; add OR col IS NULL | clean | clean, under 11 min |
| 3 | 197 Rising Temperature | Amazon, Deloitte | Self-join on DATEDIFF(today, yesterday) = 1 | clean | clean |
| 4 | 1280 Students and Examinations | Amazon | CROSS JOIN for every combination | clean (untimed) | clean, about 13 min |
| 5 | 176 Second Highest Salary (Medium) | Amazon, Deloitte, Oracle | DENSE_RANK card; solved by MAX below MAX | clean | clean, about 7 min |

Times are approximate: the clock tab drifted during the session.

## Ledger
- Closed: #17 NULL in WHERE, #23 COUNT after a LEFT JOIN, #25 2-column join key.
- #26 (sort "most" by the id): taught 10-19, 1 of 3 clean.
- To return and practice: the 1280 shape (CROSS JOIN, LEFT JOIN on 2 columns, COUNT per pair).

## Rules used
- "Most" means ORDER BY the aggregate DESC, then LIMIT 1. Not the id.
- A comparison with NULL is unknown, so WHERE drops it. Keep NULL rows with OR col IS NULL.
- "Yesterday" is DATEDIFF(a.date, b.date) = 1, never id - 1.
- CROSS JOIN lists every combination; then LEFT JOIN the facts on every key column and COUNT a right-side column so missing pairs show 0.
