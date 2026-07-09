select id, amount, amount * 0.20 as tax_amount 
from {{ source('raw_data', 'raw_orders') }}
