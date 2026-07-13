WITH base_orders AS (
    SELECT 
        user_id, 
        amount 
    FROM {{ ref('stg_orders') }}
)
SELECT
    user_id,
    SUM(amount) AS total_amount
FROM base_orders
GROUP BY user_id
