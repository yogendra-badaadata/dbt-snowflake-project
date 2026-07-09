with source as (
    select * from {{ source('raw_data', 'raw_users') }}
),

renamed as (
    select
        id          as customer_id,
        first_name,
        last_name,
        email,
        created_at  as customer_since
    from source
)

select * from renamed
