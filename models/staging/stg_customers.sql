with source as (
    select * from {{ ref('raw_users') }}
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
