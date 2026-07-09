-- Filter raw users to only include valid emails
select
    id as user_id,
    first_name,
    last_name,
    email,
    created_at
from {{ source('raw_data', 'users') }}