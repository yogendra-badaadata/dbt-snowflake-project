select
    customer_id,
    avg(amount) as total_amount
from {{ ref('stg_orders') }}
group by customer_id
