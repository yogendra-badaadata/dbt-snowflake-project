select
    order_id,
    customer_id,
    row_number() over (partition by status order by order_date desc) as rn
from {{ ref('stg_orders') }}
