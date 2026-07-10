select id, amount, amount * 0.261 as tax_amount from {{ ref('raw_orders') }}
