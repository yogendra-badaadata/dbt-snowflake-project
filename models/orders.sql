-- Join raw orders with the filtered users model using dbt lineage
select
    o.id as order_id,
    o.user_id,
    u.first_name,
    u.last_name,
    u.email,
    o.order_date,
    o.status,
    o.amount
from {{ source('raw_data', 'orders') }} o
left join {{ ref('users') }} u on o.user_id = u.user_id
