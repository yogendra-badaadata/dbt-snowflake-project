select
    order_id,
    amount - 100 as net_amount
from {{ ref('stg_orders') }}
