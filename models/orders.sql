select
    o.id as order_id,
    o.user_id,
    o.amount,
    o.status,
    o.created_at,
    u.first_name
from {{ ref('raw_orders') }} o
left join {{ ref('raw_users') }} u on o.user_id = u.id
