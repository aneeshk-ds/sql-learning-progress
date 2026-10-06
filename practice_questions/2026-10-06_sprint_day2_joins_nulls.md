# 2026-10-06: Sprint Day 2, Joins + NULLs

Session 13:46 to 15:32 IST.

## Warm-up: anti-join plus a per-entity count, closed

Skeleton recall cards, then two solo reps. Count a column from the kept table after an anti-join.
Queries in `02_joins/anti_join_count_2026-10-06.sql`.

## Day 2 rows

| Problem | Result | Note |
|---|---|---|
| 1378 Replace Employee ID With The Unique Identifier | Needed a hint | Restate was the block; LEFT JOIN query correct. |
| 1068 Product Sales Analysis I | Solo | No aggregate, so no GROUP BY. |
| 1280 Students and Examinations | Skipped | CROSS JOIN taught first; problem skipped. Day 13 repair. |
| 1978 Employees Whose Manager Left the Company | Needed a hint | "Manager left" = manager_id NOT IN the list of employee_ids. |
| 1661 Average Time of Process per Machine | Gave up | Needs a self-join pairing start and end rows. |

## Findings

- Top gap: a self-join that pairs two rows of one entity (start and end, today and yesterday). Blocks 197 and 1661.
- Second gap: the restate. Template that unblocked it: "Every ___, with their ___. If none, ___."
