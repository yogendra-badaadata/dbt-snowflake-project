with source as (
    select * from {{ source('jaffle_shop', 'raw_payments') }}
),

renamed as (
    select
        {{ generate_surrogate_key(['id', 'payment_method']) }} as payment_sk,
        id              as payment_id,
        order_id,
        payment_method,
        amount          as payment_amount,
        created_at      as paid_at
    from source
    where payment_method in ('credit_card', 'bank_transfer', 'coupon')
)

select * from renamed
