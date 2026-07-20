select
    order_id,
    cast(amount as double) as order_amount
from {{ ref('stg_orders') }}
