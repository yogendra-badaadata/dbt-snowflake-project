select
    order_id,
    IFF(status = 'active', amount, 0) as active_amount,
    IFNULL(discount, 0) as discount_safe,
    ZEROIFNULL(refund_total) as refund_safe
from {{ ref('stg_orders') }}
