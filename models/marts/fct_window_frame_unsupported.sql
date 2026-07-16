SELECT 
    customer_id,
    order_date,
    amount,
    LEAD(amount, 1) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
        RANGE BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS next_amount
FROM {{ ref('stg_orders') }}
