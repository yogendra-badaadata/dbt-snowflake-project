select
    order_id,
    100 - amount as net_amount
from {{ ref('stg_orders') }}
