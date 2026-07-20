select
    order_id,
    row_number() over w as seq_num
from {{ ref('stg_orders') }}
window w as (order by order_date asc)
