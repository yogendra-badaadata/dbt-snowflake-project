select id, first_name, status, user_role from {{ ref('raw_users') }} where status = 'active' and user_role = 'admin_24'
