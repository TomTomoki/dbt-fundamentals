select
    ORDERID as order_id
    , AMOUNT/100 as amount
    , PAYMENTMETHOD
from {{ source('stripe', 'payment') }}