select id, first_name, status, role
from {{ source('raw_data', 'raw_users') }}
where status = 'active' and (role = 'admin' or role = 'editor')
