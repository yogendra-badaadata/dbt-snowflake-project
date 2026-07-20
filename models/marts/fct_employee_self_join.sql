SELECT 
    e.employee_id,
    e.employee_name,
    m.employee_name AS manager_name
FROM employees e
JOIN employees m
    ON m.employee_id = e.manager_id;