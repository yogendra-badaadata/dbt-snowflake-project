select
    id as user_id,
    {{ quote_column('plan') }} as user_plan
from {{ ref('raw_users') }}
