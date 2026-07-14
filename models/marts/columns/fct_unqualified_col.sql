select
    order_id,
    customer_id
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c on o.customer_id = c.customer_id
