select *
from (
    select 1 as id
    union all
    select 2 as id
) as simple_results
