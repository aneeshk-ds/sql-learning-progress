# 2026-10-05: Sprint Day 1, cold diagnostic and anti-join repair

Session 15:55 to 17:38 IST. Day 1 of a 15-day SQL interview sprint (5 to 19 Oct).

## Cold diagnostic: 3 of 8 solo (37.5%)

8 questions, 75-minute budget, 18 minutes used. In chat, no notes, no hints, first submission final.

| Q | Problem | Level | Result | What failed |
|---|---|---|---|---|
| 1 | 1757 Recyclable and Low Fat Products | Easy | Solo | none |
| 2 | 596 Classes With at Least 5 Students | Easy | Solo | none |
| 3 | 197 Rising Temperature | Easy | Gave up | comparing a row to the previous day's row |
| 4 | 1581 Customer Who Visited but Did Not Make Any Transactions | Easy | Gave up | anti-join recall (third fail) |
| 5 | 570 Managers with at Least 5 Direct Reports | Medium | Solo | grouped by name, not id (duplicate-name risk) |
| 6 | 1934 Confirmation Rate | Medium | Gave up | could not parse the rate prompt |
| 7 | 1164 Product Price at a Given Date | Medium | Wrong | read "price as of a date" as "changed on that date" |
| 8 | 1174 Immediate Food Delivery II | Medium | Gave up | restate dropped "first orders of all customers" |

Two weakest patterns: absence (anti-join), and dates with first or latest row per entity.

Finding: on Easies the requirement is understood and the construct does not come back (recall).
On Mediums the restate drops the qualifier. Narrow syntax is not the bottleneck.

## Repair: anti-join reactivated, 2 clean solo reps

Visual: anti_join.html (inner join drops the answer rows; LEFT JOIN + IS NULL; NOT IN list).
Reps and failed attempts are in `02_joins/anti_join_reactivation_2026-10-05.sql`.

## Unfinished: anti-join plus a per-entity count

Three twins of 1581, all assisted. Failures: dropped GROUP BY, COUNT on the NULL side
(COUNT(col) skips NULLs, so every group returns 0), DISTINCT on an already-grouped column,
a per-ticket condition restated as a per-agent condition. Picked up on Day 2.

## New rules

- Phrase-to-skeleton recall, 5 minutes at the start of every session.
- After an anti-join, count a column from the kept table, never the NULL side.
- When GROUP BY drops, write FROM, JOIN, WHERE, GROUP BY first and SELECT last.
