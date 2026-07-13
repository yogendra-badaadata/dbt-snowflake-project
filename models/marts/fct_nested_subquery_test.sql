select
    order_id,
    (select min(amount) from {{ ref('stg_payments') }} p where p.order_id = o.order_id) as min_payment
from {{ ref('stg_orders') }} o
