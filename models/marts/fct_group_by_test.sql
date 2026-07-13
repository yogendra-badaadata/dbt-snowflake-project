WITH base_orders AS (
    SELECT 
        user_id, 
        amount 
    FROM {{ ref('stg_orders') }}
)
SELECT
    b.user_id,
    SUM(b.amount) AS total_amount
FROM base_orders b                 -- Using table alias 'b'
GROUP BY b.user_id                 -- Using qualifier 'b.' to trigger a0.user_id in SRE
