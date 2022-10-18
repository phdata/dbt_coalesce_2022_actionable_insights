{% macro swap_database() %}
    {% set sql = 'ALTER DATABASE prod_coalesce_demo SWAP WITH test_coalesce_demo' %}
    {% do run_query(sql) %}
    {{ log("database swapped", info=True) }}
{% endmacro %}