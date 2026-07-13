SELECT 
    e.employee_id,
    e.employee_name,
    m.employee_name AS manager_name
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
