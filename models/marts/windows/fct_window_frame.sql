select
    order_id,
    amount,
    sum(amount) over (
        order by order_date asc
        rows between 6 preceding and current row
    ) as rolling_sum
from {{ ref('stg_orders') }}
