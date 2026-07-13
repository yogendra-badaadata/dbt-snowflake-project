select
    order_id,
    DATEADD(day, 30, order_date) as due_date,
    DATE_TRUNC('month', order_date) as order_month
from {{ ref('stg_orders') }}
