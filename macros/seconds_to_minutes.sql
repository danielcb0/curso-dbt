{% macro seconds_to_minute( column_name, precision=2) %}

    ( {{ column_name }} / 100 )::numeric(16, {{precision}})
{% endmacro %}