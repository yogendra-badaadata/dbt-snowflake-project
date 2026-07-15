select
    order_id,
    case 
        when amount > 100 then 'high'
        else 'low'
    end as tier
from {{ ref('stg_orders') }}
