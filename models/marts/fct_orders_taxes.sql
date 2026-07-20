select id, amount, amount * 0.12 as tax_amount 
from {{ ref('raw_orders') }}
