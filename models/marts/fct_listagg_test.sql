select
    customer_id,
    ARRAY_AGG(order_id) as order_ids
from {{ ref('stg_orders') }}
group by customer_id
