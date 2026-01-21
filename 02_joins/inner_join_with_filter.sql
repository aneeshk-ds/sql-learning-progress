-- Which employees work ONLY in the Engineering department?

SELECT e.emp_name,
       d.department_name,
       l.city
FROM Employees e
INNER JOIN Departments d
  ON e.department = d.department_name
INNER JOIN Locations l
  ON d.department_id = l.department_id
WHERE d.department_name = 'Engineering';
