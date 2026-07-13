select
    order_id,
    parse_json('{"address": {"city": "New York"}}'):address:city::string as city
from {{ ref('stg_orders') }}
