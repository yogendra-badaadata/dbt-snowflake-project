SELECT 
    c.cust_id, 
    SUM(o.amount) AS total_spend
FROM (
    -- Renamed customer_id to cust_id inside subquery
    SELECT customer_id AS cust_id FROM customers
) c 
JOIN orders o ON c.cust_id = o.customer_id
GROUP BY c.cust_id
