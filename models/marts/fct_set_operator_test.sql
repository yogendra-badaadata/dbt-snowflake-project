select customer_id from {{ ref('stg_orders') }}
union
select customer_id from {{ ref('stg_customers') }}
