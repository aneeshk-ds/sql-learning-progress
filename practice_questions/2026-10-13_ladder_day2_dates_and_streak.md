# 2026-10-13 Ladder day 2: dates landed, 5 of 5 clean

Session 06:20 to about 08:16 IST (clock tab). Level: Tier 1 Easies. Clean streak at end: 3 of 5 (1890, 1587, 1571).

| Block | Problem | Result |
|---|---|---|
| Refresh | Twin E Books/Loans (COUNT after LEFT JOIN) | Clean, cold |
| Card | YEAR and BETWEEN bench check | Found the 2020-12-31 18:00 trap himself |
| Stretch | 1890 The Latest Login in 2020 | Clean solo |
| Fluency | 1587 Bank Account Summary II | Clean (note: group by account with name) |
| Retest | 1571 Warehouse Manager | Clean cold (answer read on 10-07) |
| Extra | Twin F Products/Reviews | Clean cold (note: unaliased review_id) |

## Findings
- COUNT after a LEFT JOIN: 2 clean cold after the 10-12 regression. 1581 on Fri is the 3rd.
- Total of a row calculation (#24): closed, 3 consecutive clean.
- DATE moved New to Solid in one session.
- New gap: explaining aloud in the table's own words. Knows the mechanism, does not name the entities.
- Habits: `)as alias` spacing (3rd time in 2 days); bare column with 2 tables in scope.

## Block 2 (11:22 to about 12:10 IST)

| Block | Problem | Result |
|---|---|---|
| Fluency | 1693 Daily Leads and Partners | Clean (streak 4) |
| Card | Self-join: Students a join Students b | Understood (student 1 pairs with 2 rows) |
| Stretch | 1303 Find the Team Size | Clean cold, self-join route (streak 5, Tier 1 cleared) |
| Retest | 1421 NPV Queries | One hint: ON id only, needed id and year |

- Tier 1 cleared. Now Tier 2 Easies, streak 0 of 5.
- New ledger candidate: joining on part of a key when the match needs 2 columns. An: "I got the logic right but not the reasoning."
- Bench now opens on the current preset (CURRENT constant), after a preset mix-up and a 1303 box holding the 10-07 attempt.

## Block 3 (16:08 to 17:12 IST)

- 2-column-key twin (Sales/Prices): clean cold. #25 at 1 clean.
- CASE WHEN: An said he had never written it ("i aint done this ever"). Concept moved from Fading to New. Built case_when.html (WHERE drops rows vs CASE labels every row, AND inside WHEN). Stopped before the bench card and 610.
- Next: finish the CASE bench card (>= vs >), then 610 Triangle Judgement, 1327, 1350; one more 2-column-key rep.
