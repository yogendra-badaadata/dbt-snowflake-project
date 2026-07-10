select id, amount, amount * 0.19 as tax_amount from {{ ref('raw_orders') }}
