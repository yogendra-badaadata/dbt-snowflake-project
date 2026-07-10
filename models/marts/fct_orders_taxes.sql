select id, amount, amount * 0.262 as tax_amount from {{ ref('raw_orders') }}
