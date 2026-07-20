select
    order_id,
    200 as bonus_points
from {{ ref('stg_orders') }}
