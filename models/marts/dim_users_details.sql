select id as user_id, first_name, email, '34' as run_id from {{ ref('raw_users') }}
