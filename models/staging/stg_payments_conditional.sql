select
    id as payment_id,
    IFF(payment_method = 'credit_card', amount, 0) as credit_amount,
    IFNULL(amount, 0) as amount_safe,
    NVL(payment_method, 'unknown') as method_safe
from {{ source('jaffle_shop', 'raw_payments') }}
