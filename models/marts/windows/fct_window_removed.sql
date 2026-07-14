select
    order_id,
    amount,
    row_number() over (order by order_date asc) as seq_num
from {{ ref('stg_orders') }}
