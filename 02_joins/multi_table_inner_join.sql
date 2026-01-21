-- Which employees belong to a department that has a location?

SELECT e.emp_name,
       d.department_name,
       l.city
FROM Employees e
INNER JOIN Departments d
  ON e.department = d.department_name
INNER JOIN Locations l
  ON d.department_id = l.department_id;
