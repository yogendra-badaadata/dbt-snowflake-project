select id, user_id, amount,
       row_number() over (order by created_at desc) as seq
from {{ ref('raw_orders') }}
