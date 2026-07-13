select
    order_id,
    (
        select sum(amount) over (partition by customer_id order by order_date desc)
        from {{ ref('stg_orders') }}
        where order_id = o.order_id
    ) as sub_running_total
from {{ ref('stg_orders') }} o
