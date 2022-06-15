{% macro cents_to_dollars(c_name, decimal_place=2) %}
    round(1.0*{{ c_name }}/100, {{ decimal_place }})
{% endmacro %}