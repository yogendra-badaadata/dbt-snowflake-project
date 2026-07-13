with base as (
    select
        customer_id,
        order_id,
        order_date,
        amount,
        status,
        row_number() over (partition by customer_id order by order_date desc) as rn
    from {{ ref('stg_orders') }}
)
select *
from base
where amount > 200 and rn <= 1 and (amount > 50 or status = 'completed')
