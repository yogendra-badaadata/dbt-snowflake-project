with source as (
    select * from {{ ref('raw_orders') }}
),

renamed as (
    select
        id             as order_id,
        user_id        as customer_id,
        amount,
        status,
        created_at     as order_date,
        updated_at
    from source
)

select * from renamed
