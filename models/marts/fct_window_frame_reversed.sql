SELECT 
    customer_id,
    order_date,
    amount,
    NTH_VALUE(amount, 2) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date 
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS last_amt_so_far
FROM {{ ref('stg_orders') }}
