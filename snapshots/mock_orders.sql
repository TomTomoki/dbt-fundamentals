{% snapshot mock_orders %}

{% set new_schema = 'test_1_snapshot' %}

{{
    config(
      target_database='analytics',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from analytics.test_1.mock_orders

{% endsnapshot %}