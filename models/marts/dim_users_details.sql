select
    id as user_id,
    first_name,
    email
from {{ ref('raw_users') }}
