select id, amount, amount * 0.265 as tax_amount from {{ ref('raw_orders') }}
