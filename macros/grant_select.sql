{% macro grant_select(database=target.database, schema=target.schema, role='ANALYST_FULL') %}

    {% set sql %}
        grant usage on schema {{ database }}.{{ schema }} to role {{ role }};
        grant select on all tables in schema {{ database }}.{{ schema }} to role {{ role }};
        grant select on all views in schema {{ database }}.{{ schema }} to role  {{ role }};
    {% endset %}

    {{ sql }}

    {{ log(sql, info=True) }}
    {% do run_query(sql) %}
    {{ log('Granted - ', info=True) }}
{% endmacro %}