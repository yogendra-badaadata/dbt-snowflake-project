with target_a as (
    select customer_id, first_name from {{ ref('stg_customers') }}
),
target_b as (
    select customer_id, first_name from {{ ref('stg_customers') }}
)
select
    o.order_id,
    o.amount,
    t.first_name
from {{ ref('stg_orders') }} o
join target_b t on o.customer_id = t.customer_id
