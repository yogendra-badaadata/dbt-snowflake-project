with base as (
    select order_id, customer_id from {{ ref('stg_orders') }}
)
select order_id from base
