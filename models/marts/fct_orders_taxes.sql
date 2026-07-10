select id, amount, amount * 0.182 as tax_amount from {{ ref('raw_orders') }}
