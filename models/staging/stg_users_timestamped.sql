select
    id as user_id,
    email,
    cast('{{ var("run_date", "2026-07-09") }}' as {{ dbt.type_timestamp() }}) as run_timestamp
from {{ ref('raw_users') }}
