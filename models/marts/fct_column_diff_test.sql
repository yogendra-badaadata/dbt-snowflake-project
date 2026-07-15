WITH base_orders AS (
    SELECT 
        user_id, 
        amount 
    FROM {{ ref('stg_orders') }}
)
SELECT
    user_id,
    amount
FROM base_orders
