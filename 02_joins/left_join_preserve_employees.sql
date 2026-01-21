-- How do we return ALL employees even if their department has no location?

SELECT e.emp_name,
       d.department_name,
       l.city
FROM Employees e
LEFT JOIN Departments d
  ON e.department = d.department_name
LEFT JOIN Locations l
  ON d.department_id = l.department_id;
