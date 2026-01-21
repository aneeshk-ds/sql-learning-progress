-- How do we filter to Engineering WITHOUT excluding employees from other departments?

SELECT e.emp_name,
       d.department_name,
       l.city
FROM Employees e
LEFT JOIN Departments d
  ON e.department = d.department_name
 AND d.department_name = 'Engineering'
LEFT JOIN Locations l
  ON d.department_id = l.department_id;
