select
    order_id,
    cast(amount as integer) as order_amount
from {{ ref('stg_orders') }}
