select id, amount, amount * 0.263 as tax_amount from {{ ref('raw_orders') }}
