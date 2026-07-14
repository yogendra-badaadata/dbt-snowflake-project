{% set role_values = dbt_utils.get_column_values(
     ref('raw_users'),
     'user_role',
     order_by='user_role',
     default=[]
) %}

select id, first_name
from {{ ref('raw_users') }}
where user_role in (
    {% for role in role_values %}
      '{{ role }}' {%- if not loop.last %},{% endif %}
    {% endfor %}
)
