select
    customer_id,
    order_date,
    lag(order_date) over (partition by customer_id order by order_date asc) as prev_order_date
from {{ ref('stg_orders') }}
