with base as (
    select customer_id, order_id, order_date, amount, status
    from {{ ref('stg_orders') }}
),
qualified as (
    select customer_id, order_id, order_date, amount, status
    from base
    qualify row_number() over (partition by customer_id order by order_date desc) <= 1
        and (amount > 50 or status = 'completed')
)
select * from qualified
