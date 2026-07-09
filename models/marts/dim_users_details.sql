select
    id as user_id,
    first_name,
    last_name,
    email
from {{ source('raw_data', 'raw_users') }}
