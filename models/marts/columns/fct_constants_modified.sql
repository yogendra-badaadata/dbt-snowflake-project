select
    order_id,
    100 as bonus_points
from {{ ref('stg_orders') }}
