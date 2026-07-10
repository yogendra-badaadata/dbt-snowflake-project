select id, amount, amount * 0.264 as tax_amount from {{ ref('raw_orders') }}
