select id, amount, amount * 0.189 as tax_amount from {{ ref('raw_orders') }}
