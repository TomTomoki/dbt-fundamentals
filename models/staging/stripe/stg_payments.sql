select
    ORDERID as order_id
    , AMOUNT/100 as amount
from raw.stripe.payment