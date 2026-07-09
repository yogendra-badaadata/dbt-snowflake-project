select
    o.id as order_id,
    o.user_id,
    u.first_name,
    o.amount
from {{ source('raw_data', 'raw_orders') }} o
left join {{ source('raw_data', 'raw_users') }} u on u.id = o.user_id 
