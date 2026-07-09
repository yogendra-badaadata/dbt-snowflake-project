{# Static compile-time helpers - no warehouse / adapter calls. #}

{% macro get_staging_model_nodes() %}
    {%- set nodes = [] -%}
    {%- if execute -%}
        {%- for node in graph.nodes.values() -%}
            {%- set model_path = node.original_file_path | replace('\\', '/') -%}
            {%- if node.resource_type == 'model'
                and model_path.startswith('models/staging/') -%}
                {%- do nodes.append(node) -%}
            {%- endif -%}
        {%- endfor -%}
    {%- endif -%}
    {{ return(nodes) }}
{% endmacro %}


{% macro empty_union_guard(column_defs) %}
    select
        {%- for column in column_defs %}
        cast(null as {{ column.type }}) as {{ column.name }}
        {%- if not loop.last %},{% endif %}
        {%- endfor %}
    where 1 = 0
{% endmacro %}


{% macro static_pattern_label(prefix, pattern_name) %}
    {{ return(prefix ~ '_' ~ pattern_name) }}
{% endmacro %}


{% macro generate_surrogate_key(field_list) %}
    {%- set fields = [] -%}
    {%- for field in field_list -%}
        {%- do fields.append("coalesce(cast(" ~ field ~ " as varchar), '')") -%}
    {%- endfor -%}
    md5({{ fields | join(" || '-' || ") }})
{% endmacro %}
