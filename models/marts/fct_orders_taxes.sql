select id, amount, amount * 0.184 as tax_amount from {{ ref('raw_orders') }}
