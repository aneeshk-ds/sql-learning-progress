# 2026-09-23 Gate A re-run (Amazon/Oracle-tagged LeetCode easy)

Session: four pre-Gate-A re-drills cleared 2/2 each, then Gate A re-run.
Gate A first-try-clean: 2 of 5 (bar 4 of 5, not passed). Up from 1 of 5 on 2026-09-21.
All queries below are the final correct versions. First-try status noted per problem.

## 1050. Actors and Directors Who Cooperated At Least Three Times  [first-try: MISS]
-- miss: grouped by actor_id only, director_id in SELECT but not in GROUP BY (ONLY_FULL_GROUP_BY)
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(timestamp) >= 3;

## 1075. Project Employees I  [first-try: CLEAN]
select project_id, round(avg(experience_years), 2) as average_years
from Project p
join Employee e on p.employee_id = e.employee_id
group by project_id;

## 607. Sales Person  [first-try: CLEAN]
select name
from SalesPerson
where sales_id not in (
    select sales_id
    from Orders
    join Company on Orders.com_id = Company.com_id
    where Company.name = 'RED'
);

## 1731. The Number of Employees Which Report to Each Employee  [first-try: MISS]
-- miss: self-join key set to self-match (e.employee_id = m.employee_id), then invented column m.id
-- correct: report carries reports_to, manager matched by employee_id
select m.employee_id, m.name,
       count(e.employee_id) as reports_count,
       round(avg(e.age)) as average_age
from Employees e
join Employees m on e.reports_to = m.employee_id
group by m.employee_id, m.name
order by m.employee_id;

## 1978. Employees Whose Manager Left the Company  [first-try: MISS]
-- miss: subquery returned manager_id not employee_id, salary filter misplaced, then double WHERE
select employee_id
from Employees
where manager_id not in (select employee_id from Employees)
  and salary < 30000
order by employee_id;
