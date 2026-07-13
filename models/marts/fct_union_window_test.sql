select
    order_id,
    row_number() over (order by order_date asc) as rn
from {{ ref('stg_orders') }}
union all
select
    order_id,
    1 as rn
from {{ ref('stg_orders') }}
