WITH base_orders AS (
    -- Renamed user_id to usr_id inside the CTE
    SELECT
        user_id AS usr_id,
        amount
    FROM {{ ref('stg_orders') }}
)
SELECT
    b.usr_id,
    SUM(b.amount) AS total_amount
FROM base_orders b                 -- Using table alias 'b'
GROUP BY b.usr_id                  -- Using qualifier 'b.' to trigger a0.usr_id in SRE
