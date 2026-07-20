select
    order_id,
    amount,
    status
from {{ ref('stg_orders') }}
where status != 'completed'
