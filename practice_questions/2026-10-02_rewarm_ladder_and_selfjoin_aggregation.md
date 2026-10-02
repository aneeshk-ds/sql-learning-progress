# 2026-10-02 — Re-warm ladder, self-join under aggregation, two LeetCode easies

Session 12:29 to 15:00 IST. 11 writes, 6 first-try clean (55%). Gate A bar is 80%, not attempted.
All ladder problems use synthetic data; the two LeetCode problems are 619 and 1082.

## The finding of the session: the write-order rule

Clauses get written in this order, never top to bottom:

1. `FROM` and the join — both aliases, a complete `ON`.
2. `GROUP BY` — decide what one output row is.
3. `SELECT` — the grouped columns plus the aggregate.
4. `HAVING` — any condition on a count.
5. `ORDER BY`.

Writing `SELECT` first is what produced the dropped clauses. Reps 1 to 3 of the self-join-under-aggregation
shape failed. The rule was introduced, reps 4 and 5 were both first-try clean. 1 of 4 became 2 of 2.

---

## Rung 1 — SELECT / WHERE / ORDER BY  (first-try clean)

Shipments(shipment_id, city, weight_kg). Shipments above 20 kg, heaviest first.

```sql
SELECT shipment_id, weight_kg
FROM Shipments
WHERE weight_kg > 20
ORDER BY weight_kg DESC;
```

No spurious GROUP BY on a plain filter. Mistake #1 did not fire.

## Rung 2 — GROUP BY / HAVING  (first-try clean)

Deliveries(delivery_id, courier, parcels). Total parcels per courier, only couriers above 10.

```sql
SELECT courier, SUM(parcels) AS total_parcels
FROM Deliveries
GROUP BY courier
HAVING SUM(parcels) > 10;
```

Aggregate filtered in HAVING, not WHERE. Mistake #6 stayed closed.

## Rung 3 — two-table JOIN  (first-try clean)

Clients(client_id, client_name) and Invoices(invoice_id, client_id, amount). Invoices above 500.

```sql
SELECT client_name, amount
FROM Clients c
JOIN Invoices i ON c.client_id = i.client_id
WHERE amount > 500;
```

No GROUP BY bolted onto a plain join. Habit note: aliases were declared then columns selected
unqualified. Legal here because the names are unique, fatal in a self-join.

## Rung 4 — self-join  (FAILED first try, clean on rewrite)

Staff(staff_id, name, manager_id). Each staff member beside their manager's name.

First attempt, two errors:

```sql
-- WRONG
SELECT s.name AS employee, m.name AS manager
FROM Staff s
JOIN Staff m ON s.manager_id = m.id        -- m.id does not exist, column is staff_id
WHERE manager_id IS NOT NULL;              -- ambiguous, manager_id exists under both aliases
```

Reason given for `m.id`: reflex from earlier manager-employee practice. Fix is to read the schema
and the actual key name before writing the `ON`.

```sql
-- CORRECT
SELECT s.name AS employee, m.name AS manager
FROM Staff s
JOIN Staff m ON s.manager_id = m.staff_id;
```

The inner join already drops the row whose `manager_id` is null, so the WHERE was redundant.

## Rung 5 — self-join under aggregation  (5 reps: 3 failed, then 2 consecutive clean)

### Rep 4, Editors  (first-try clean, immediately after the write-order rule)

Editors(editor_id, editor_name, supervisor_id). Editors supervising at least two people.

```sql
SELECT s.editor_id, s.editor_name, COUNT(e.editor_id) AS team_size
FROM Editors e
JOIN Editors s ON s.editor_id = e.supervisor_id
GROUP BY s.editor_id, s.editor_name
HAVING COUNT(e.editor_id) >= 2
ORDER BY COUNT(e.editor_id) DESC;
```

### Rep 5, Pilots  (first-try clean, multi-key ORDER BY)

Pilots(pilot_id, pilot_name, chief_id). Pilots with more than two crew, ties broken by name.

```sql
SELECT c.pilot_id, c.pilot_name, COUNT(p.pilot_id) AS crew_size
FROM Pilots p
JOIN Pilots c ON p.chief_id = c.pilot_id
GROUP BY c.pilot_id, c.pilot_name
HAVING COUNT(p.pilot_id) > 2
ORDER BY COUNT(p.pilot_id), c.pilot_name;
```

### What the three failed reps got wrong

- Grouped by the reporting side (`a.agent_id`) instead of the lead side. Every count comes out as 1,
  because each person reports to exactly one lead.
- Selected the report's id beside the lead's name: two different people on one output row.
- `JOIN m.mentor_id = m2.person_id` — no table name, no `ON`, `m2` never defined.
- Dropped `HAVING` twice, after restating the threshold correctly in words one line above the query.
- Bare `reports_to` in a WHERE, ambiguous under two aliases of the same table.

Rules that came out of it:

- `GROUP BY` names what one output row is. Group by the side the prompt is asking about.
- Group by EVERY non-aggregated column in the SELECT. Grouping by a key alone survives on
  functional dependency in MySQL and Postgres. Legal, and a bad habit.
- In a self-join every column carries its alias. No exceptions.
- "at least two", "more than one", "appears only once" are count conditions. They go in HAVING.

---

## Misconceptions closed

### DISTINCT does not mean "appears once"

`MAX(DISTINCT num)` on 8,8,3,3,1,4,5,6 returns 8. DISTINCT collapses 8,8 into one 8: it keeps the
duplicated value and throws away the evidence that it was duplicated. `COUNT` does the opposite,
it reports the evidence. "Appears only once" is a count condition, never a DISTINCT.

### A SELECT does not satisfy a DELETE prompt

For 196 the grader does not read a result set. After the statement runs it reads the table itself.
A SELECT leaves every row in place and fails, however correct the rows on screen look.

---

## LeetCode problems

- 619 Biggest Single Number — first-try clean, CTE used unprompted. See `03_aggregations/`.
- 1082 Sales Analysis I — stalled, taught with a visual, then written clean. NOT first-try, NOT cold.
  See `04_subqueries/`.

## Still open

- 196 Delete Duplicate Emails: parked twice, never written. Only unseen easy in the list testing DELETE.
- 627 Swap Sex of Employees: the UPDATE twin. Also never written.
- Two-layer aggregate: taught once, needs 2 cold reps on fresh data.
- Ledger #19 self-join under aggregation: 2 of 3 clean, 1 more to close.
