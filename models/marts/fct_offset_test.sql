select
    order_id,
    amount,
    lag(amount, 1) over (order by order_date asc) as prev_amount
from {{ ref('stg_orders') }}
