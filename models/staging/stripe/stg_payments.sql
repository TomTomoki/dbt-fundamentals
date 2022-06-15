select
    ORDERID as order_id
    , {{ cents_to_dollars('AMOUNT', 3) }} as amount
    , PAYMENTMETHOD
    , created as collector_tstamp
from {{ source('stripe', 'payment') }}
{{ limit_data_in_dev(3) }}