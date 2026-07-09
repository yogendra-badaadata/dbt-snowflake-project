{% set query_list = ["select 1 as id", "select 2 as id"] %}
select *
from (
    {{ query_list | join('\nunion all\n') }}
) as aggregated_results
