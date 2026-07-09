{% set query_list = [] %}
select *
from (
    {{ query_list | join('\nunion all\n') }}
) as catalog_results
