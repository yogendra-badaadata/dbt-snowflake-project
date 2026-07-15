select
    ord.order_id,
    ord.amount
from {{ ref('stg_orders') }} ord
