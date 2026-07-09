select id, user_id, amount,
       row_number() over (partition by user_id order by created_at desc) as seq
from {{ ref('raw_orders') }}
