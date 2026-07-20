select customer_id from {{ ref('stg_orders') }}
INTERSECT
select customer_id from {{ ref('stg_customers') }}
