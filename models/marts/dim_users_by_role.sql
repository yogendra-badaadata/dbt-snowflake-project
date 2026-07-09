{% set role_values = dbt_utils.get_column_values(
     source('raw_data', 'raw_users'),
     'role',
     order_by='role',
     default=[]
) %}

select id, first_name
from {{ source('raw_data', 'raw_users') }}
where role in (
    {% for role in role_values %}
      '{{ role }}' {%- if not loop.last %},{% endif %}
    {% endfor %}
)
