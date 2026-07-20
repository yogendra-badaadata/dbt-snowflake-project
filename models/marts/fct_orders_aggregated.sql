with orders as (
    select order_id, customer_id, order_date, amount
    from {{ ref('stg_orders') }}
    where status = 'completed'
)
select
    o.customer_id,
    sum(o.amount) as total_revenue,
    count(o.order_id) as order_count
from orders o
right join {{ ref('stg_customers') }} c on o.customer_id = c.customer_id
group by rollup(o.customer_id)
