# 2026-10-12 Ladder day 1: row-calculation totals and COUNT after a LEFT JOIN

Session start about 14:11 IST, about 80 minutes. Level: Tier 1 Easies. Clean streak at end: 0 of 5.
No sessions 10-08 to 10-11, so the week plan was shifted 4 days; Mock 1 moved to Thu 10-15.

## Results (9 problems, 4 clean)

| Block | Problem | Result |
|---|---|---|
| Refresh | Shelves total weight (SUM of a calculation, join) | Hint: qty dropped |
| Refresh | COUNT(DISTINCT) bench check | Understood |
| Stretch | 2356 Unique Subjects per Teacher | Clean solo |
| Fluency | 1741 Total Time per Employee | Hint: bare expression, no SUM |
| Retest | 1581 Visited, No Transactions | Count column given |
| Extra | Twin A Bookings revenue | Clean |
| Extra | Twin B Undelivered orders | Count column given |
| Extra | Twin C Unpaid bills | Clean |
| Extra | Twin A2 Cart total | Clean |
| Extra | Twin D Unanswered tickets | Fixed after visual |

## Findings

- Total of a row calculation (new ledger #24): 2 fires, then 2 clean twins. Rule: after GROUP BY, every non-grouped column needs an aggregate.
- COUNT after a LEFT JOIN (ledger #23): regressed. Clean twice on 10-06, wrong 3 of 4 today. He counts the missing thing (replies, deliveries), which is the column the WHERE just forced to NULL. Rule: test NULL on the right table, count from the left table. Visual: count_after_left_join.html.
- An overrode the restate template from 1581 on ("lets skip the template"). Logged.
- Spacing habit: `)as alias` without a space, twice.

## Next

Twin E cold first thing on 10-13 (no hint), then date card and 1821, fluency 1587, retest 1571.
