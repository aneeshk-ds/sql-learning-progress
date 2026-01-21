-- How do we find employees whose department does NOT have a location?

SELECT e.emp_name,
       d.department_name
FROM Employees e
LEFT JOIN Departments d
  ON e.department = d.department_name
LEFT JOIN Locations l
  ON d.department_id = l.department_id
WHERE l.location_id IS NULL;
