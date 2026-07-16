SELECT 
    customer_id,
    order_date,
    amount,
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS rolling_sum
FROM {{ ref('stg_orders') }}
