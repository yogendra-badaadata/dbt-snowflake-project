WITH base_orders AS (
    -- Removed amount, added status
    SELECT
        user_id,
        status
    FROM {{ ref('stg_orders') }}
)
SELECT
    user_id,
    status
FROM base_orders
