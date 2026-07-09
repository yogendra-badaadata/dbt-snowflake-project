select
    id as user_id,
    {{ quote_column('plan') }} as user_plan
from {{ source('raw_data', 'raw_users') }}
