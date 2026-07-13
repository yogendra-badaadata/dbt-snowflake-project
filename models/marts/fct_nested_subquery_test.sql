select
    order_id,
    (select max(amount) from {{ ref('stg_payments') }} p where p.order_id = o.order_id) as max_payment
from {{ ref('stg_orders') }} o
