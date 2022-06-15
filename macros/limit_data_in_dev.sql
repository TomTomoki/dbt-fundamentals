{% macro limit_data_in_dev(days_offset) %}
    {% if target.name == 'dev' %}
        where 1 = 2
    {% elif target.name == 'default'  %}
        where collector_tstamp >= dateadd('day', -{{ days_offset }}, current_timestamp)
    {% else %}
        -- Hello
    {% endif %}
{% endmacro %}