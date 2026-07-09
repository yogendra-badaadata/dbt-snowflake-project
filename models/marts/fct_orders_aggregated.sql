select
    user_id,
    sum(amount) as total_amount
from {{ source('raw_data', 'raw_orders') }}
group by user_id
