select id, amount, amount * 0.187 as tax_amount from {{ ref('raw_orders') }}
