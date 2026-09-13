# Practice: Subqueries and CTEs

Original practice problems with synthetic data. Each problem lists the schema,
sample rows, the task, and a reference solution. Written for self-drilling.

Rule for every problem: before running, reread the query against the prompt.
Confirm the FROM source, the exact output columns, the filter, and the sort
direction, one clause at a time.

---

## Subqueries

### 1. Scalar subquery (returns one value)

players

| name | goals |
|------|-------|
| Sam  | 12    |
| Ava  | 7     |
| Ravi | 20    |

Task: names of players who scored more than the average goals.

```sql
SELECT name
FROM players
WHERE goals > (SELECT AVG(goals) FROM players);
```

### 2. Subquery with IN (returns a list)

departments(id, region), employees(name, dept_id).
West departments: 3, 7. Employees: Sam 3, Ava 5, Ravi 7.

Task: names of employees who work in a West-region department.

```sql
SELECT name
FROM employees
WHERE dept_id IN (SELECT id FROM departments WHERE region = 'West');
```

Note: the inner query filters by one column (region) but must return the
column the outer matches on (id), not the filter column.

### 3. Correlated subquery (inner reads the outer row, runs per row)

sales_reps(name, region, sales): Tom North 300, Kim North 500, Raj South 200, Lee South 100.

Task: reps whose sales are above the average of their own region.

```sql
SELECT name
FROM sales_reps r
WHERE sales > (SELECT AVG(sales) FROM sales_reps r2 WHERE r2.region = r.region);
```

Variant, highest salary in own department:

```sql
SELECT name
FROM emp e
WHERE salary = (SELECT MAX(salary) FROM emp e2 WHERE e2.dept = e.dept);
```

### 4. EXISTS and NOT EXISTS

customers(id, name), orders(order_id, customer_id).

At least one order (EXISTS):

```sql
SELECT name
FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);
```

No orders (NOT EXISTS, an anti-join):

```sql
SELECT name
FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);
```

The join key ties the child row to its parent (customer_id), not the child's
own id (order_id).

---

## CTEs

### 5. CTE using IN

products(id, category), orders(order_id, product_id).

Task: order_ids for orders of products in the Toys category.

```sql
WITH toy_products AS (
    SELECT id FROM products WHERE category = 'Toys'
)
SELECT order_id
FROM orders
WHERE product_id IN (SELECT id FROM toy_products);
```

### 6. CTE aggregate, then filter the named result

sales(rep, amount).

Task: reps whose total amount is above 200.

```sql
WITH rep_totals AS (
    SELECT rep, SUM(amount) AS total_sales
    FROM sales
    GROUP BY rep
)
SELECT rep
FROM rep_totals
WHERE total_sales > 200;
```

Once aggregated inside the CTE, filter the result with a plain WHERE. The
main query reads FROM the CTE, not from the base table.

### 7. CTE count per group

tickets(agent, priority).

Task: agents with more than 1 ticket.

```sql
WITH agent_counts AS (
    SELECT agent, COUNT(*) AS ticket_count
    FROM tickets
    GROUP BY agent
)
SELECT agent
FROM agent_counts
WHERE ticket_count > 1;
```

COUNT(*) counts rows regardless of NULLs. Use it for "how many".

### 8. CTE with a multi-key sort and an exact boundary

Enrollments(enrollment_id, course_id, student_id).

Task: courses with at least 3 enrollments. Output course_id and
enrollment_count, ordered by enrollment_count descending, then course_id
ascending.

```sql
WITH course_enroll AS (
    SELECT course_id, COUNT(*) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
)
SELECT course_id, enrollment_count
FROM course_enroll
WHERE enrollment_count >= 3
ORDER BY enrollment_count DESC, course_id ASC;
```

At least 3 means >= 3, not > 3. Multiple sort keys go in one ORDER BY clause,
comma-separated, each with its own direction.

### 9. CTE plus a scalar subquery

Employees(id, name, department, salary).

Task: departments whose average salary is above the overall company average.
Output department and avg_salary, ordered by avg_salary descending.

```sql
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department
)
SELECT department, avg_salary
FROM dept_avg
WHERE avg_salary > (SELECT AVG(salary) FROM Employees)
ORDER BY avg_salary DESC;
```

Name the CTE differently from the output column to avoid a name clash.
