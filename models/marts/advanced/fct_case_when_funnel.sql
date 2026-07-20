select
    order_id,
    case 
        when amount > 250 then 'gold'
        when amount > 100 then 'silver'
        else 'bronze'
    end as tier
from {{ ref('stg_orders') }}
