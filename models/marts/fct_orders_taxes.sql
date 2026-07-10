select id, amount, amount * 0.185 as tax_amount from {{ ref('raw_orders') }}
