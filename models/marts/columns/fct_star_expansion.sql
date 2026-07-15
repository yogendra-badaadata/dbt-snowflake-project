with base as (
    select * from {{ ref('stg_orders') }}
)
select order_id from base
