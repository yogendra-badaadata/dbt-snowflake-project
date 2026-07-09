select
    id as user_id,
    first_name,
    email
from {{ source('raw_data', 'raw_users') }}
where email like '%@%'
