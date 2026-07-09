select
    user_id,
    sum(amount) as total_amount
from {{ ref('raw_orders') }}
group by user_id
having count(*)>1