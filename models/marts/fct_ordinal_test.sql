WITH base_customers AS (
    SELECT customer_id FROM customers
),
base_orders AS (
    SELECT customer_id, amount FROM orders
)
SELECT
    c.customer_id,
    SUM(o.amount) AS total_spend
FROM base_customers c
JOIN base_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
