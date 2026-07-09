select id, amount, amount * 0.20 as tax_amount 
from {{ ref('raw_orders') }}
