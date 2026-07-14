select
    customer_id,
    order_date,
    lag(order_date) over (partition by customer_id order by order_date asc) as prev_order_date,
    case 
        when order_date - lag(order_date) over (partition by customer_id order by order_date asc) > 30 then 1 
        else 0 
    end as new_session
from {{ ref('stg_orders') }}
