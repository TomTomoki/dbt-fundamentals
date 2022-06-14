{%- set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] -%}
select
    *
from {{ ref('stg_payments') }}
pivot (
    sum(amount) for PAYMENTMETHOD in ( 
        {%- for payment_method in payment_methods -%}
            '{{ payment_method }}'
            {%- if not loop.last -%}
                ,
            {%- endif -%}
        {%- endfor -%}
    )
) as p