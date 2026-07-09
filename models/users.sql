select
    id as user_id,
    first_name,
    last_name,
    email,
    created_at
from {{ ref('raw_users') }}
where email like '%@%'
