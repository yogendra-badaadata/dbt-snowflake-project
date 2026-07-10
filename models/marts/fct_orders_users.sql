select o.id as order_id, o.user_id, u.first_name, o.amount from {{ ref('raw_orders') }} o left join {{ ref('raw_users') }} u on o.user_id = u.id
-- trigger comment #57
