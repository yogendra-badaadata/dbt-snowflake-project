select
    order_id,
    amount
from {{ ref('stg_orders') }}
qualify row_number() over (order by order_date asc) = 1
