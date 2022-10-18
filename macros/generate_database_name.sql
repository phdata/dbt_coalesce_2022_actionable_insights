{% macro generate_database_name(custom_database_name=none, node=none) %}
    {%- set default_database = target.database -%}
    {%- set default_env = var("env") -%}
    {%- set env = ['TEST', 'PROD'] -%}
    {%- if default_env in env -%}
        {%- if custom_database_name is none -%}
            {{ default_env | trim }}_{{ default_database | trim }}
        {%- else -%}
            {{ default_env | trim }}_{{ custom_database_name | trim }}
        {%- endif -%}
    {%- else -%}
        {%- if custom_database_name is none -%}
            DEV_{{ default_database | trim }}
        {%- else -%}
            DEV_{{ custom_database_name | trim }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro -%}