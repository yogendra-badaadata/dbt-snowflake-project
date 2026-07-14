select
    o.order_id,
    o.customer_id as user_id
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c on o.customer_id = c.customer_id
