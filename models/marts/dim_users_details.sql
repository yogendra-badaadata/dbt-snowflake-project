select id as user_id, first_name, email, '40' as run_id from {{ ref('raw_users') }}
