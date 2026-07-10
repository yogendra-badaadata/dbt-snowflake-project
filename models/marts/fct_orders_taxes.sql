select id, amount, amount * 0.186 as tax_amount from {{ ref('raw_orders') }}
