SELECT 
    c.customer_id, 
    SUM(o.amount) AS total_spend
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
