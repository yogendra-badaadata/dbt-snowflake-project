select
    id as user_id,
    first_name,
    last_name,
    email
from {{ ref('raw_users') }}
