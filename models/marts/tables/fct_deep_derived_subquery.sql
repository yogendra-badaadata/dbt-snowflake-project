select
    sub.order_id,
    sub.amount
from (
    select order_id, amount
    from {{ ref('stg_orders') }}
) sub
