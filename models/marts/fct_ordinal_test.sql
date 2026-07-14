WITH base_customers AS (
    -- Renamed customer_id to cust_id inside the CTE
    SELECT customer_id AS cust_id FROM customers
),
base_orders AS (
    SELECT customer_id, amount FROM orders
)
SELECT
    c.cust_id,
    SUM(o.amount) AS total_spend
FROM base_customers c
JOIN base_orders o ON c.cust_id = o.customer_id
GROUP BY c.cust_id
