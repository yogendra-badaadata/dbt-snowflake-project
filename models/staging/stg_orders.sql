with source as (
    select * from {{ source('raw_data', 'raw_orders') }}
),

renamed as (
    select
        id             as order_id,
        customer_id,
        amount,
        status,
        created_at     as order_date,
        updated_at
    from source
)

select * from renamed
