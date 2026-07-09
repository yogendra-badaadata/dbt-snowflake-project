select id, amount, amount * 0.181 as tax_amount from {{ ref('raw_orders') }}
