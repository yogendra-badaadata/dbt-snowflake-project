select
    o.order_id,
    o.amount
from {{ ref('stg_orders') }} o
