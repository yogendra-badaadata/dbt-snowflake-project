select order_id, customer_id
from {{ ref('stg_orders') }}
where (customer_id = 1 or amount > 200 ) and status = 'completed'
