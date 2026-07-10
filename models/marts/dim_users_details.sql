select id as user_id, first_name, email, '35' as run_id from {{ ref('raw_users') }}
