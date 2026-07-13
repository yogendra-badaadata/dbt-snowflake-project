WITH base_orders AS (
    -- Renamed user_id to usr_id inside the CTE
    SELECT 
        user_id AS usr_id, 
        amount 
    FROM {{ ref('stg_orders') }}
)
SELECT
    usr_id,
    SUM(amount) AS total_amount
FROM base_orders
GROUP BY usr_id
