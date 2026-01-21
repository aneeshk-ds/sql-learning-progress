-- What is each employee's salary along with their department location (if available)?

SELECT e.emp_name,
       e.salary,
       d.department_name,
       l.city
FROM Employees e
LEFT JOIN Departments d
  ON e.department = d.department_name
LEFT JOIN Locations l
  ON d.department_id = l.department_id;
