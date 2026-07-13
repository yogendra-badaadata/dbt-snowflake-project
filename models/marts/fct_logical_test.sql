select order_id, customer_id
from {{ ref('stg_orders') }}
where status = 'completed' and (amount > 100 or customer_id = 1)
