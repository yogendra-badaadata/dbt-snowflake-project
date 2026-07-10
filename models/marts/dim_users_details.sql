select id as user_id, first_name, email, '32' as run_id from {{ ref('raw_users') }}
