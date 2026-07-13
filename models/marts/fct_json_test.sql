select
    order_id,
    parse_json('{"location": {"city": "New York"}}'):location:city::string as city
from {{ ref('stg_orders') }}
