WITH base_orders AS (
    -- Keep the name user_id here (don't alias it inside the CTE)
    SELECT
        user_id,
        amount
    FROM {{ ref('stg_orders') }}
)
SELECT
    -- Only alias it at the very end
    user_id AS usr_id,
    SUM(amount) AS total_amount
FROM base_orders
GROUP BY user_id
