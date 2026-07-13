select
    order_id,
    DATEADD(WEEK, 4, order_date) as due_date,
    DATE_TRUNC('week', order_date) as order_month
from {{ ref('stg_orders') }}
